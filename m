Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F35196099
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:40:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AB043C335D
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:40:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E16F83C32D4
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E79D91400530
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF04DAD88;
 Fri, 27 Mar 2020 21:39:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 22:39:24 +0100
Message-Id: <20200327213924.18816-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327213924.18816-1-pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 6/6] Use SAFE_RUN_CMD()
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

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Renamed: s/SAFE_RUNCMD()/SAFE_RUN_CMD()/

 testcases/kernel/syscalls/add_key/add_key05.c   | 15 ++++-----------
 testcases/kernel/syscalls/quotactl/quotactl01.c | 11 ++---------
 testcases/kernel/syscalls/quotactl/quotactl06.c |  9 +--------
 3 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
index 3da3be9ee..fd0fb0a50 100644
--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -36,17 +36,10 @@ static void add_user(void)
 		return;
 
 	const char *const cmd_useradd[] = {"useradd", username, NULL};
-	int rc;
-
-	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL,
-				  TST_RUN_CMD_PASS_EXIT_VAL))) {
-	case 0:
-		user_added = 1;
-		ltpuser = SAFE_GETPWNAM(username);
-		break;
-	default:
-		tst_brk(TBROK, "useradd failed (%d)", rc);
-	}
+
+	SAFE_RUN_CMD(cmd_useradd, NULL, NULL);
+	user_added = 1;
+	ltpuser = SAFE_GETPWNAM(username);
 	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
 }
 
diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index e4c2a8939..a40852f34 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -162,15 +162,8 @@ static struct tcase {
 static void setup(void)
 {
 	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
-	int ret;
-
-	ret = tst_run_cmd(cmd, NULL, NULL, TST_RUN_CMD_PASS_EXIT_VAL);
-	switch (ret) {
-	case 0:
-		break;
-	default:
-		tst_brk(TBROK, "quotacheck exited with %i", ret);
-	}
+
+	SAFE_RUN_CMD(cmd, NULL, NULL);
 
 	test_id = geteuid();
 	if (access(USRPATH, F_OK) == -1)
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 5d70f340f..e990d6976 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -146,16 +146,9 @@ static void verify_quotactl(unsigned int n)
 static void setup(void)
 {
 	const char *const cmd[] = {"quotacheck", "-uF", "vfsv0", MNTPOINT, NULL};
-	int ret;
 	unsigned int i;
 
-	ret = tst_run_cmd(cmd, NULL, NULL, TST_RUN_CMD_PASS_EXIT_VAL);
-	switch (ret) {
-	case 0:
-		break;
-	default:
-		tst_brk(TBROK, "quotacheck exited with %i", ret);
-	}
+	SAFE_RUN_CMD(cmd, NULL, NULL);
 
 	if (access(USRPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
