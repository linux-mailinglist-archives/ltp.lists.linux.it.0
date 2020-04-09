Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9351A3340
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 13:33:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEA1C3C2CCB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 13:33:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3ED383C1115
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 13:33:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B0EE21A014F7
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 13:33:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 627D7AE2D
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 11:33:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Apr 2020 13:32:59 +0200
Message-Id: <20200409113259.27515-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Add write()/ioctl() race variant to snd_seq01
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CVE 2018-7566 has two different reproducers, this is the other one for the sake
of completeness.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Both races should finish in less than 2 seconds on a patched system but
triggering the bug in the ioctl()/write() race will result in unkillable
process stuck in syscall. Waiting 5 minutes to find out is a waste of time
so I've reduced the timeout to 30 seconds.

I've also added another ioctl() to clear kernel buffer before every race,
otherwise the write() call will block forever when the buffer gets full.

 testcases/kernel/sound/snd_seq01.c | 43 +++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/sound/snd_seq01.c b/testcases/kernel/sound/snd_seq01.c
index e0f197e74..c3b4b6ac2 100644
--- a/testcases/kernel/sound/snd_seq01.c
+++ b/testcases/kernel/sound/snd_seq01.c
@@ -24,10 +24,27 @@
 #include "tst_fuzzy_sync.h"
 #include "tst_taint.h"
 
+typedef void (*racefunc_t)(void);
+
 static int fd = -1;
 static int client_id;
+static struct snd_seq_remove_events rminfo = {
+	.remove_mode = SNDRV_SEQ_REMOVE_OUTPUT
+};
+static struct snd_seq_event ssev = {
+	.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_TIME_MODE_REL,
+	.queue = 0,
+	.type = SNDRV_SEQ_EVENT_USR0,
+	.time = { .tick = 10 }
+};
+
 static struct tst_fzsync_pair fzsync_pair;
 
+static void race_ioctl(void);
+static void race_write(void);
+
+racefunc_t testfunc_list[] = {race_ioctl, race_write};
+
 static void setup(void)
 {
 	struct snd_seq_queue_info qconf = { .queue = 0 };
@@ -44,6 +61,7 @@ static void setup(void)
 
 	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CLIENT_ID, &client_id);
 	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qconf);
+	ssev.dest.client = client_id;
 
 	fzsync_pair.exec_loops = 100000;
 	tst_fzsync_pair_init(&fzsync_pair);
@@ -63,28 +81,39 @@ static void reinit_pool(int pool_size)
 		.client = client_id
 	};
 
-	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_SET_CLIENT_POOL, &pconf);
+	ioctl(fd, SNDRV_SEQ_IOCTL_SET_CLIENT_POOL, &pconf);
+}
+
+static void race_ioctl(void)
+{
+	reinit_pool(512);
+}
+
+static void race_write(void)
+{
+	write(fd, &ssev, sizeof(ssev));
 }
 
 static void *thread_run(void *arg)
 {
 	while (tst_fzsync_run_b(&fzsync_pair)) {
 		tst_fzsync_start_race_b(&fzsync_pair);
-		reinit_pool(512);
+		reinit_pool(10);
 		tst_fzsync_end_race_b(&fzsync_pair);
 	}
 
 	return arg;
 }
 
-static void run(void)
+static void run(unsigned int n)
 {
 	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
 
 	while (tst_fzsync_run_a(&fzsync_pair)) {
-		reinit_pool(1);
+		reinit_pool(5);
+		SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_REMOVE_EVENTS, &rminfo);
 		tst_fzsync_start_race_a(&fzsync_pair);
-		reinit_pool(2);
+		testfunc_list[n]();
 		tst_fzsync_end_race_a(&fzsync_pair);
 
 		if (tst_taint_check()) {
@@ -97,9 +126,11 @@ static void run(void)
 }
 
 static struct tst_test test = {
-	.test_all = run,
+	.test = run,
+	.tcnt = ARRAY_SIZE(testfunc_list),
 	.setup = setup,
 	.cleanup = cleanup,
+	.timeout = 30,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "d15d662e89fc"},
 		{"CVE", "2018-7566"},
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
