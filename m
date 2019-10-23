Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D0E14F0
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D82E03C23FC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 39D5C3C22AE
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:39 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CC9CA600D58
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,220,1569254400"; d="scan'208";a="77359696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 17:00:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 9BE164CE1507;
 Wed, 23 Oct 2019 16:52:35 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 23 Oct 2019 17:00:27 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 23 Oct 2019 17:00:26 +0800
Message-ID: <1571821231-3846-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 9BE164CE1507.AD753
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/6] syscalls/quotactl: Don't use ltp-quota.m4
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
Cc: jack@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Current quotactl01.c has logic problem. There is no relation between
Q_GETINFO and quota format. The format should depend on quotacheck -F and
kernel config such as CONFIG_QFMT_V1 or CONFIG_QFMT_V2(most linux distributions
use the v2).

Q_GETINFO cmd was introduced since Linux 2.4.22, we don't need to
check it now.  Also, specfiy quota format to QFMT_VFS_V0 by quotacheck
-F and check CONFIG_QFMT_V2 in kernel config to avoid issue such as#189[1].
So in quotactl01.c, we don't need to use the macro of ltp-quota.m4.
In quotactl0[2-3].c, we don't need to check very basic header <sys/quota.h>
(it was introdued in glibc since 1997). Remove quota version macro.

Don't remove ltp-quota.m4 because I will rewrite it to detect
if_nextdqblk struct for Q_GETNEXTQUOTA cmd on the coming patch.

[1]https://github.com/linux-test-project/ltp/issues/189

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/quotactl/quotactl01.c     | 47 +++++++------------
 .../kernel/syscalls/quotactl/quotactl02.c     |  8 +---
 .../kernel/syscalls/quotactl/quotactl03.c     |  9 ++--
 3 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index bcb1b842c..b0be525d6 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -39,26 +39,12 @@
 
 #include "tst_test.h"
 
-#if defined(HAVE_QUOTAV2) || defined(HAVE_QUOTAV1)
 # include <sys/quota.h>
 
-# if defined(HAVE_QUOTAV2)
-#  define _LINUX_QUOTA_VERSION  2
-#  ifndef QFMT_VFS_V0
-#   define QFMT_VFS_V0     2
-#  endif
+#  define QFMT_VFS_V0     2
 #  define USRPATH MNTPOINT "/aquota.user"
 #  define GRPPATH MNTPOINT "/aquota.group"
 #  define FMTID	QFMT_VFS_V0
-# else
-#  define _LINUX_QUOTA_VERSION  1
-#  ifndef QFMT_VFS_OLD
-#   define QFMT_VFS_OLD    1
-#  endif
-#  define USRPATH MNTPOINT "/quota.user"
-#  define GRPPATH MNTPOINT "/quota.group"
-#  define FMTID	QFMT_VFS_OLD
-# endif
 
 # define MNTPOINT	"mntpoint"
 
@@ -69,14 +55,13 @@ static struct dqblk set_dq = {
 	.dqb_valid = QIF_BLIMITS
 };
 static struct dqblk res_dq;
-# if defined(HAVE_QUOTAV2)
+
 static struct dqinfo set_qf = {
 	.dqi_bgrace = 80,
 	.dqi_valid = IIF_BGRACE
 };
 static struct dqinfo res_qf;
 static int32_t fmt_buf;
-# endif
 
 static struct tcase {
 	int cmd;
@@ -96,7 +81,7 @@ static struct tcase {
 	{QCMD(Q_GETQUOTA, USRQUOTA), &test_id, &res_dq,
 	&set_dq.dqb_bsoftlimit, &res_dq.dqb_bsoftlimit,
 	sizeof(res_dq.dqb_bsoftlimit), "get disk quota limit for user"},
-# if defined(HAVE_QUOTAV2)
+
 	{QCMD(Q_SETINFO, USRQUOTA), &test_id, &set_qf,
 	NULL, NULL, 0, "set information about quotafile for user"},
 
@@ -107,7 +92,7 @@ static struct tcase {
 	{QCMD(Q_GETFMT, USRQUOTA), &test_id, &fmt_buf,
 	&fmt_id, &fmt_buf, sizeof(fmt_buf),
 	"get quota format for user"},
-# endif
+
 	{QCMD(Q_SYNC, USRQUOTA), &test_id, &res_dq,
 	NULL, NULL, 0, "update quota usages for user"},
 
@@ -123,7 +108,7 @@ static struct tcase {
 	{QCMD(Q_GETQUOTA, GRPQUOTA), &test_id, &res_dq, &set_dq.dqb_bsoftlimit,
 	&res_dq.dqb_bsoftlimit, sizeof(res_dq.dqb_bsoftlimit),
 	"set disk quota limit for group"},
-# if defined(HAVE_QUOTAV2)
+
 	{QCMD(Q_SETINFO, GRPQUOTA), &test_id, &set_qf,
 	NULL, NULL, 0, "set information about quotafile for group"},
 
@@ -133,7 +118,7 @@ static struct tcase {
 
 	{QCMD(Q_GETFMT, GRPQUOTA), &test_id, &fmt_buf,
 	&fmt_id, &fmt_buf, sizeof(fmt_buf), "get quota format for group"},
-# endif
+
 	{QCMD(Q_SYNC, GRPQUOTA), &test_id, &res_dq,
 	NULL, NULL, 0, "update quota usages for group"},
 
@@ -143,22 +128,21 @@ static struct tcase {
 
 static void setup(void)
 {
-	const char *const cmd[] = {"quotacheck", "-ug", MNTPOINT, NULL};
+	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
 	int ret;
 
-
 	ret = tst_run_cmd(cmd, NULL, NULL, 1);
 	switch (ret) {
+	case 0:
+		break;
 	case 255:
-		tst_brk(TCONF, "quotacheck binary not installed");
+		tst_brk(TBROK, "quotacheck binary not installed");
+		break;
 	default:
 		tst_brk(TBROK, "quotacheck exited with %i", ret);
-	case 0:
-	break;
 	}
 
 	test_id = geteuid();
-
 	if (access(USRPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
 
@@ -190,9 +174,15 @@ static void verify_quota(unsigned int n)
 	tst_res(TPASS, "quotactl succeeded to %s", tc->des);
 }
 
+static const char *kconfigs[] = {
+	"CONFIG_QFMT_V2",
+	NULL
+};
+
 static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.needs_root = 1,
+	.needs_kconfigs = kconfigs,
 	.test = verify_quota,
 	.tcnt = ARRAY_SIZE(tcases),
 	.mount_device = 1,
@@ -202,6 +192,3 @@ static struct tst_test test = {
 	.setup = setup,
 };
 
-#else
-	TST_TEST_TCONF("This system didn't support quota");
-#endif
diff --git a/testcases/kernel/syscalls/quotactl/quotactl02.c b/testcases/kernel/syscalls/quotactl/quotactl02.c
index 7e74840e4..0593b965f 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl02.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl02.c
@@ -23,10 +23,6 @@
 #include <sys/quota.h>
 #include "config.h"
 
-#if defined(HAVE_QUOTAV2) || defined(HAVE_QUOTAV1)
-# include <sys/quota.h>
-#endif
-
 #if defined(HAVE_XFS_QUOTA)
 # include <xfs/xqm.h>
 #endif
@@ -34,7 +30,7 @@
 #include "tst_test.h"
 #include "lapi/quotactl.h"
 
-#if defined(HAVE_XFS_QUOTA) && (defined(HAVE_QUOTAV2) || defined(HAVE_QUOTAV1))
+#if defined(HAVE_XFS_QUOTA)
 static void check_qoff(int, char *);
 static void check_qon(int, char *);
 static void check_qlim(int, char *);
@@ -172,5 +168,5 @@ static struct tst_test test = {
 	.setup = setup,
 };
 #else
-	TST_TEST_TCONF("This system didn't support quota or xfs quota");
+	TST_TEST_TCONF("This system didn't support xfs quota");
 #endif
diff --git a/testcases/kernel/syscalls/quotactl/quotactl03.c b/testcases/kernel/syscalls/quotactl/quotactl03.c
index 32a281482..cf73231a9 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl03.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl03.c
@@ -29,10 +29,7 @@
 #include <stdio.h>
 #include <sys/quota.h>
 #include "config.h"
-
-#if defined(HAVE_QUOTAV2) || defined(HAVE_QUOTAV1)
-# include <sys/quota.h>
-#endif
+#include <sys/quota.h>
 
 #if defined(HAVE_XFS_QUOTA)
 # include <xfs/xqm.h>
@@ -41,7 +38,7 @@
 #include "tst_test.h"
 #include "lapi/quotactl.h"
 
-#if defined(HAVE_XFS_QUOTA) && (defined(HAVE_QUOTAV2) || defined(HAVE_QUOTAV1))
+#if defined(HAVE_XFS_QUOTA)
 
 static const char mntpoint[] = "mnt_point";
 static uint32_t test_id = 0xfffffffc;
@@ -84,5 +81,5 @@ static struct tst_test test = {
 };
 
 #else
-	TST_TEST_TCONF("This system didn't support quota or xfs quota");
+	TST_TEST_TCONF("This system didn't support xfs quota");
 #endif
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
