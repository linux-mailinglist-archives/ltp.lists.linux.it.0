Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDCFA973
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 06:23:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB5CF3C2614
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 06:23:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DF18F3C0374
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 06:22:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D9431600AED
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 06:22:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,299,1569254400"; d="scan'208";a="78394782"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Nov 2019 13:22:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 1FACA4CE14FE;
 Wed, 13 Nov 2019 13:14:42 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 13 Nov 2019 13:22:50 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 13 Nov 2019 13:23:01 +0800
Message-ID: <1573622581-10247-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20191112101512.GB9373@rei.lan>
References: <20191112101512.GB9373@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 1FACA4CE14FE.AFF98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5] syscalls/prctl02: add more error tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I check these new options(PR_GET_SECCOMP,PR_GET_NO_NEW_PRIVS,PR_GET_THP_DISABLE,
PR_GET_SPECULATION_CTRL) whether support on current kernel. If it is non-supported,
skip it. For some old options(PR_SET_PDEATHSIG,PR_SET_DUMPABLE,PR_SET_NAME,PR_SET_TIMING),
I don't check them because they are supported since prctl was introduced on v2.6.12-rc2.
For remaining options(PR_SET_SECUREBITS,PR_CAPBSET_DROP), they are supported since
Linux 2.6.26. I think we also don't need to check them because they are too old(It was 11
years old).

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/prctl.h                      |  10 ++
 testcases/kernel/syscalls/prctl/prctl02.c | 161 ++++++++++++++++++++--
 2 files changed, 163 insertions(+), 8 deletions(-)

diff --git a/include/lapi/prctl.h b/include/lapi/prctl.h
index 0b4e196c3..4499df030 100644
--- a/include/lapi/prctl.h
+++ b/include/lapi/prctl.h
@@ -34,6 +34,11 @@
 # define PR_GET_NO_NEW_PRIVS 39
 #endif
 
+#ifndef PR_SET_THP_DISABLE
+# define PR_SET_THP_DISABLE 41
+# define PR_GET_THP_DISABLE 42
+#endif
+
 #ifndef PR_CAP_AMBIENT
 # define PR_CAP_AMBIENT             47
 # define PR_CAP_AMBIENT_IS_SET      1
@@ -42,4 +47,9 @@
 # define PR_CAP_AMBIENT_CLEAR_ALL   4
 #endif
 
+#ifndef PR_GET_SPECULATION_CTRL
+# define PR_GET_SPECULATION_CTRL 52
+# define PR_SET_SPECULATION_CTRL 53
+#endif
+
 #endif /* LAPI_PRCTL_H__ */
diff --git a/testcases/kernel/syscalls/prctl/prctl02.c b/testcases/kernel/syscalls/prctl/prctl02.c
index ec45911fd..93f30b54a 100644
--- a/testcases/kernel/syscalls/prctl/prctl02.c
+++ b/testcases/kernel/syscalls/prctl/prctl02.c
@@ -4,32 +4,143 @@
  *
  * 1) prctl() fails with EINVAL when an invalid value is given for option
  * 2) prctl() fails with EINVAL when option is PR_SET_PDEATHSIG & arg2 is
- * not zero or a valid signal number
+ * not zero or a valid signal number.
+ * 3) prctl() fails with EINVAL when option is PR_SET_DUMPABLE & arg2 is
+ * neither SUID_DUMP_DISABLE nor SUID_DUMP_USER.
+ * 4) prctl() fails with EFAULT when arg2 is an invalid address.
+ * 5) prctl() fails with EFAULT when option is PR_SET_SECCOMP & arg2 is
+ * SECCOMP_MODE_FILTER & arg3 is an invalid address.
+ * 6) prctl() fails with EACCES when option is PR_SET_SECCOMP & arg2 is
+ * SECCOMP_MODE_FILTER & the process does not have the CAP_SYS_ADMIN
+ * capability.
+ * 7) prctl() fails with EINVAL when option is PR_SET_TIMING & arg2 is not
+ * not PR_TIMING_STATISTICAL.
+ * 8,9) prctl() fails with EINVAL when option is PR_SET_NO_NEW_PRIVS & arg2
+ * is not equal to 1 or arg3 is nonzero.
+ * 10) prctl() fails with EINVAL when options is PR_GET_NO_NEW_PRIVS & arg2,
+ * arg3, arg4, or arg5 is nonzero.
+ * 11) prctl() fails with EINVAL when options is PR_SET_THP_DISABLE & arg3,
+ * arg4, arg5 is non-zero.
+ * 12) prctl() fails with EINVAL when options is PR_GET_THP_DISABLE & arg2,
+ * arg3, arg4, or arg5 is nonzero.
+ * 13) prctl() fails with EINVAL when options is PR_CAP_AMBIENT & an unused
+ * argument such as arg4 is nonzero.
+ * 14) prctl() fails with EINVAL when option is PR_GET_SPECULATION_CTRL and
+ * unused arguments is nonzero.
+ * 15) prctl() fails with EPERM when option is PR_SET_SECUREBITS and the
+ * caller does not have the CAP_SETPCAP capability.
+ * 16) prctl() fails with EPERM when option is PR_CAPBSET_DROP and the caller
+ * does not have the CAP_SETPCAP capability.
  */
 
 #include <errno.h>
 #include <signal.h>
 #include <sys/prctl.h>
-
+#include <linux/filter.h>
+#include <linux/capability.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include "config.h"
+#include "lapi/prctl.h"
+#include "lapi/seccomp.h"
+#include "lapi/syscalls.h"
 #include "tst_test.h"
+#include "tst_capability.h"
 
 #define OPTION_INVALID 999
-#define INVALID_ARG 999
+#define unsup_string "prctl() doesn't support this option, skip it"
+static const struct sock_filter  strict_filter[] = {
+	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW)
+};
+
+static const struct sock_fprog strict = {
+	.len = (unsigned short)ARRAY_SIZE(strict_filter),
+	.filter = (struct sock_filter *)strict_filter
+};
+
+static unsigned long strict_addr = (unsigned long)&strict;
+
+static unsigned long bad_addr;
+static unsigned long num_0;
+static unsigned long num_1 = 1;
+static unsigned long num_2 = 2;
+static unsigned long num_invalid = 999;
+static int seccomp_nsup;
+static int nonewprivs_nsup;
+static int thpdisable_nsup;
+static int capambient_nsup;
+static int speculationctrl_nsup;
 
 static struct tcase {
 	int option;
-	unsigned long arg2;
+	unsigned long *arg2;
+	unsigned long *arg3;
 	int exp_errno;
+	char *tname;
 } tcases[] = {
-	{OPTION_INVALID, 0, EINVAL},
-	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
+	{OPTION_INVALID, &num_1, &num_0, EINVAL, "invalid option"},
+	{PR_SET_PDEATHSIG, &num_invalid, &num_0, EINVAL, "PR_SET_PDEATHSIG"},
+	{PR_SET_DUMPABLE, &num_2, &num_0, EINVAL, "PR_SET_DUMPABLE"},
+	{PR_SET_NAME, &bad_addr, &num_0, EFAULT, "PR_SET_NAME"},
+	{PR_SET_SECCOMP, &num_2, &bad_addr, EFAULT, "PR_SET_SECCOMP"},
+	{PR_SET_SECCOMP, &num_2, &strict_addr, EACCES, "PR_SET_SECCOMP"},
+	{PR_SET_TIMING, &num_1, &num_0, EINVAL, "PR_SET_TIMING"},
+	{PR_SET_NO_NEW_PRIVS, &num_0, &num_0, EINVAL, "PR_SET_NO_NEW_PRIVS"},
+	{PR_SET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL, "PR_SET_NO_NEW_PRIVS"},
+	{PR_GET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL, "PR_GET_NO_NEW_PRIVS"},
+	{PR_SET_THP_DISABLE, &num_0, &num_1, EINVAL, "PR_SET_THP_DISABLE"},
+	{PR_GET_THP_DISABLE, &num_1, &num_1, EINVAL, "PR_GET_THP_DISABLE"},
+	{PR_CAP_AMBIENT, &num_2, &num_1, EINVAL, "PR_CAP_AMBIENT"},
+	{PR_GET_SPECULATION_CTRL, &num_1, &num_0, EINVAL, "PR_GET_SPECULATION_CTRL"},
+	{PR_SET_SECUREBITS, &num_0, &num_0, EPERM, "PR_SET_SECUREBITS"},
+	{PR_CAPBSET_DROP, &num_1, &num_0, EPERM, "PR_CAPBSET_DROP"},
 };
 
 static void verify_prctl(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	TEST(prctl(tc->option, tc->arg2));
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	switch (tc->option) {
+	case PR_SET_SECCOMP:
+		if (seccomp_nsup) {
+			tst_res(TCONF, "%s", unsup_string);
+			return;
+		}
+	break;
+	case PR_GET_NO_NEW_PRIVS:
+	case PR_SET_NO_NEW_PRIVS:
+		if (nonewprivs_nsup) {
+			tst_res(TCONF, "%s", unsup_string);
+			return;
+		}
+	break;
+	case PR_SET_THP_DISABLE:
+	case PR_GET_THP_DISABLE:
+		if (thpdisable_nsup) {
+			tst_res(TCONF, "%s", unsup_string);
+			return;
+		}
+	break;
+	case PR_CAP_AMBIENT:
+		if (capambient_nsup) {
+			tst_res(TCONF, "%s", unsup_string);
+			return;
+		}
+	break;
+	case PR_GET_SPECULATION_CTRL:
+		if (speculationctrl_nsup) {
+			tst_res(TCONF, "%s", unsup_string);
+			return;
+		}
+	break;
+	default:
+	break;
+	}
+
+	TEST(prctl(tc->option, *tc->arg2, *tc->arg3));
 	if (TST_RET == 0) {
 		tst_res(TFAIL, "prctl() succeeded unexpectedly");
 		return;
@@ -38,12 +149,46 @@ static void verify_prctl(unsigned int n)
 	if (tc->exp_errno == TST_ERR) {
 		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
 	} else {
-		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
+		if (tc->option == PR_SET_SECCOMP && TST_ERR == EINVAL)
+			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP_FILTER.");
+		else
+			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
 				tst_strerrno(tc->exp_errno));
 	}
 }
 
+static void setup(void)
+{
+	bad_addr = (unsigned long)tst_get_bad_addr(NULL);
+
+	TEST(prctl(PR_GET_SECCOMP));
+	if (TST_ERR == EINVAL)
+		seccomp_nsup = 1;
+
+	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
+	if (TST_ERR == EINVAL)
+		nonewprivs_nsup = 1;
+
+	TEST(prctl(PR_GET_THP_DISABLE, 0, 0, 0, 0));
+	if (TST_ERR == EINVAL)
+		thpdisable_nsup = 1;
+
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
+	if (TST_ERR == EINVAL)
+		capambient_nsup = 1;
+
+	TEST(prctl(PR_GET_SPECULATION_CTRL, 0, 0, 0, 0));
+	if (TST_ERR == EINVAL)
+		speculationctrl_nsup = 1;
+}
+
 static struct tst_test test = {
+	.setup = setup,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_prctl,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
+		{}
+	},
 };
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
