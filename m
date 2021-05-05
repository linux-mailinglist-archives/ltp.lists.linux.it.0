Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74D373EB3
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 17:39:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B866C3C5854
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 17:39:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3129B3C578B
 for <ltp@lists.linux.it>; Wed,  5 May 2021 17:38:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A61A8600C96
 for <ltp@lists.linux.it>; Wed,  5 May 2021 17:38:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 078B8B139
 for <ltp@lists.linux.it>; Wed,  5 May 2021 15:38:48 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Jan Kara <jack@suse.cz>,
	ltp@lists.linux.it
Date: Wed,  5 May 2021 17:38:47 +0200
Message-Id: <20210505153847.6106-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505153847.6106-1-mdoucha@suse.cz>
References: <20210505153847.6106-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/inotify06: Raise inotify instance limit
 in /proc
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

inotify_init() sometimes fails with EMFILE because there are too many
partially closed instances waiting for garbage collection. Bump the limit
in /proc/sys/fs/inotify/max_user_instances for the duration of the test.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

I thought about only reading the procfile and calling yield() after every
proc_limit/2 iterations to wait for garbage collection but I'm afraid that
it might reduce the likelihood of triggering the bug. Since I currently have
no system where I could reproduce the race, I've decided to play it safe and
bump the /proc limit.

 testcases/kernel/syscalls/inotify/inotify06.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/testcases/kernel/syscalls/inotify/inotify06.c b/testcases/kernel/syscalls/inotify/inotify06.c
index f39ab46a1..68813769b 100644
--- a/testcases/kernel/syscalls/inotify/inotify06.c
+++ b/testcases/kernel/syscalls/inotify/inotify06.c
@@ -38,8 +38,11 @@
 /* Number of files to test (must be > 1) */
 #define FILES 5
 
+#define PROCFILE "/proc/sys/fs/inotify/max_user_instances"
+
 static char names[FILES][PATH_MAX];
 static pid_t pid;
+static int old_proc_limit;
 
 static void setup(void)
 {
@@ -47,6 +50,11 @@ static void setup(void)
 
 	for (i = 0; i < FILES; i++)
 		sprintf(names[i], "fname_%d", i);
+
+	SAFE_FILE_SCANF(PROCFILE, "%d", &old_proc_limit);
+
+	if (old_proc_limit >= 0 && old_proc_limit < TEARDOWNS)
+		SAFE_FILE_PRINTF(PROCFILE, "%d", TEARDOWNS + 128);
 }
 
 static void verify_inotify(void)
@@ -95,10 +103,13 @@ static void cleanup(void)
 		SAFE_KILL(pid, SIGKILL);
 		SAFE_WAIT(NULL);
 	}
+
+	SAFE_FILE_PRINTF(PROCFILE, "%d", old_proc_limit);
 }
 
 static struct tst_test test = {
 	.timeout = 600,
+	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.forks_child = 1,
 	.setup = setup,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
