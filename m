Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885133C02E
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 16:42:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E5423C8F26
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 16:42:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E889F3C2DBA
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 16:41:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 434C9600772
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 16:41:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79E0CAD73;
 Mon, 15 Mar 2021 15:41:54 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: xuyang2018.jy@cn.fujitsu.com,
	ltp@lists.linux.it
Date: Mon, 15 Mar 2021 16:41:51 +0100
Message-Id: <20210315154153.912-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] syscalls/quotactl: Store addr string literals
 in buffer
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

The addr parameter of quotactl() is read-write so it's technically wrong
to pass string literals directly. Store them in a buffer and pass the buffer
instead.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

 .../kernel/syscalls/quotactl/quotactl01.c     | 10 +++++---
 .../kernel/syscalls/quotactl/quotactl06.c     | 25 +++++++++++--------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index 7b3649fa5..23233cf0d 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -53,6 +53,8 @@
 
 static int32_t fmt_id = FMTID;
 static int test_id;
+static char usrpath[] = USRPATH;
+static char grppath[] = GRPPATH;
 static struct dqblk set_dq = {
 	.dqb_bsoftlimit = 100,
 	.dqb_valid = QIF_BLIMITS
@@ -79,7 +81,7 @@ static struct tcase {
 	char *des;
 	char *tname;
 } tcases[] = {
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH,
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, usrpath,
 	NULL, NULL, 0, "turn on quota for user",
 	"QCMD(Q_QUOTAON, USRQUOTA)"},
 
@@ -115,11 +117,11 @@ static struct tcase {
 	"get next disk quota limit for user",
 	"QCMD(Q_GETNEXTQUOTA, USRQUOTA)"},
 
-	{QCMD(Q_QUOTAOFF, USRQUOTA), &test_id, USRPATH,
+	{QCMD(Q_QUOTAOFF, USRQUOTA), &test_id, usrpath,
 	NULL, NULL, 0, "turn off quota for user",
 	"QCMD(Q_QUOTAOFF, USRQUOTA)"},
 
-	{QCMD(Q_QUOTAON, GRPQUOTA), &fmt_id, GRPPATH,
+	{QCMD(Q_QUOTAON, GRPQUOTA), &fmt_id, grppath,
 	NULL, NULL, 0, "turn on quota for group",
 	"QCMD(Q_QUOTAON, GRPQUOTA)"},
 
@@ -154,7 +156,7 @@ static struct tcase {
 	"get next disk quota limit for group",
 	"QCMD(Q_GETNEXTQUOTA, GRPQUOTA)"},
 
-	{QCMD(Q_QUOTAOFF, GRPQUOTA), &test_id, GRPPATH,
+	{QCMD(Q_QUOTAOFF, GRPQUOTA), &test_id, grppath,
 	NULL, NULL, 0, "turn off quota for group",
 	"QCMD(Q_QUOTAOFF, GRPQUOTA)"},
 };
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 2818a4dc4..8621af05b 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -40,6 +40,9 @@
 #define TESTDIR1 MNTPOINT "/testdir1"
 #define TESTDIR2 MNTPOINT "/testdir2"
 
+static char usrpath[] = USRPATH;
+static char testdir1[] = TESTDIR1;
+static char testdir2[] = TESTDIR2;
 static int32_t fmt_id = FMTID;
 static int32_t fmt_invalid = 999;
 static int test_invalid;
@@ -76,17 +79,17 @@ static struct tcase {
 	int exp_err;
 	int on_flag;
 } tcases[] = {
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, TESTDIR1, EACCES, 0},
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, TESTDIR2, ENOENT, 0},
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, EBUSY, 1},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, testdir1, EACCES, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, testdir2, ENOENT, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, usrpath, EBUSY, 1},
 	{QCMD(Q_SETQUOTA, USRQUOTA), &fmt_id, NULL, EFAULT, 1},
-	{QCMD(OPTION_INVALID, USRQUOTA), &fmt_id, USRPATH, EINVAL, 0},
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, ENOTBLK, 0},
+	{QCMD(OPTION_INVALID, USRQUOTA), &fmt_id, usrpath, EINVAL, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, usrpath, ENOTBLK, 0},
 	{QCMD(Q_SETQUOTA, USRQUOTA), &test_id, &set_dq, ESRCH, 0},
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_invalid, USRPATH, ESRCH, 0},
-	{QCMD(Q_GETNEXTQUOTA, USRQUOTA), &test_invalid, USRPATH, ESRCH, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_invalid, usrpath, ESRCH, 0},
+	{QCMD(Q_GETNEXTQUOTA, USRQUOTA), &test_invalid, usrpath, ESRCH, 0},
 	{QCMD(Q_SETQUOTA, USRQUOTA), &test_id, &set_dqmax, ERANGE, 1},
-	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, USRPATH, EPERM, 0},
+	{QCMD(Q_QUOTAON, USRQUOTA), &fmt_id, usrpath, EPERM, 0},
 };
 
 static void verify_quotactl(unsigned int n)
@@ -101,7 +104,8 @@ static void verify_quotactl(unsigned int n)
 	}
 
 	if (tc->on_flag) {
-		TEST(quotactl(QCMD(Q_QUOTAON, USRQUOTA), tst_device->dev, FMTID, USRPATH));
+		TEST(quotactl(QCMD(Q_QUOTAON, USRQUOTA), tst_device->dev,
+			FMTID, usrpath));
 		if (TST_RET == -1)
 			tst_brk(TBROK,
 				"quotactl with Q_QUOTAON returned %ld", TST_RET);
@@ -130,7 +134,8 @@ static void verify_quotactl(unsigned int n)
 	}
 
 	if (quota_on) {
-		TEST(quotactl(QCMD(Q_QUOTAOFF, USRQUOTA), tst_device->dev, FMTID, USRPATH));
+		TEST(quotactl(QCMD(Q_QUOTAOFF, USRQUOTA), tst_device->dev,
+			FMTID, usrpath));
 		if (TST_RET == -1)
 			tst_brk(TBROK,
 				"quotactl with Q_QUOTAOFF returned %ld", TST_RET);
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
