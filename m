Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 001381AC355
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 15:41:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 986D63C6475
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 15:41:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4568D3C22D1
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:41:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D92E21A01160
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:41:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C280CAFB2
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 13:41:28 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 16 Apr 2020 15:41:28 +0200
Message-Id: <20200416134128.4539-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add write()/ioctl() race variant to snd_seq01
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

Also fix licence, it should have been GPL-2.0-or-later from the beginning.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- slight refactoring of the test case list
- wrapped the write() call with the TEST() macro to silence compiler warning
- increased race iteration limit to make the write()/ioctl() race more reliable
- increased test timeout
- fixed licence

SAFE_WRITE() is not usable here because the write() call is sometimes expected
to fail but we don't care about the return value. The TEST() macro is good
enough to silence the warning.

 testcases/kernel/sound/snd_seq01.c | 60 +++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/sound/snd_seq01.c b/testcases/kernel/sound/snd_seq01.c
index e0f197e74..0c1a44f48 100644
--- a/testcases/kernel/sound/snd_seq01.c
+++ b/testcases/kernel/sound/snd_seq01.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2018 SUSE LLC <nstange@suse.de>
  * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
@@ -26,8 +26,40 @@
 
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
 
+static void reinit_pool(int pool_size)
+{
+	struct snd_seq_client_pool pconf = {
+		.output_pool = pool_size,
+		.client = client_id
+	};
+
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
+	TEST(write(fd, &ssev, sizeof(ssev)));
+}
+
+void (*testfunc_list[])(void) = {race_ioctl, race_write};
+
 static void setup(void)
 {
 	struct snd_seq_queue_info qconf = { .queue = 0 };
@@ -44,8 +76,9 @@ static void setup(void)
 
 	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CLIENT_ID, &client_id);
 	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qconf);
+	ssev.dest.client = client_id;
 
-	fzsync_pair.exec_loops = 100000;
+	fzsync_pair.exec_loops = 1000000;
 	tst_fzsync_pair_init(&fzsync_pair);
 }
 
@@ -56,35 +89,26 @@ static void cleanup(void)
 	tst_fzsync_pair_cleanup(&fzsync_pair);
 }
 
-static void reinit_pool(int pool_size)
-{
-	struct snd_seq_client_pool pconf = {
-		.output_pool = pool_size,
-		.client = client_id
-	};
-
-	SAFE_IOCTL(fd, SNDRV_SEQ_IOCTL_SET_CLIENT_POOL, &pconf);
-}
-
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
@@ -97,9 +121,11 @@ static void run(void)
 }
 
 static struct tst_test test = {
-	.test_all = run,
+	.test = run,
+	.tcnt = ARRAY_SIZE(testfunc_list),
 	.setup = setup,
 	.cleanup = cleanup,
+	.timeout = 120,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "d15d662e89fc"},
 		{"CVE", "2018-7566"},
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
