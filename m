Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F542B1BAB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:13:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 366D13C5FBC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:13:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 901D53C4FBA
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E6A2220114B
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8849BAC91
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:40 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:19 +0100
Message-Id: <20201113131428.13199-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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

In order to simplify common return value checks.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test.h               |  28 +------
 include/tst_test_macros.h        | 131 +++++++++++++++++++++++++++++++
 lib/newlib_tests/.gitignore      |   3 +
 lib/newlib_tests/test_macros01.c |  40 ++++++++++
 lib/newlib_tests/test_macros02.c |  42 ++++++++++
 lib/newlib_tests/test_macros03.c |  40 ++++++++++
 lib/tst_test.c                   |   1 +
 7 files changed, 258 insertions(+), 27 deletions(-)
 create mode 100644 include/tst_test_macros.h
 create mode 100644 lib/newlib_tests/test_macros01.c
 create mode 100644 lib/newlib_tests/test_macros02.c
 create mode 100644 lib/newlib_tests/test_macros03.c

diff --git a/include/tst_test.h b/include/tst_test.h
index c91d3f18a..6d188a650 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -18,6 +18,7 @@
 
 #include "tst_common.h"
 #include "tst_res_flags.h"
+#include "tst_test_macros.h"
 #include "tst_checkpoint.h"
 #include "tst_device.h"
 #include "tst_mkfs.h"
@@ -269,33 +270,6 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
  */
 void tst_reinit(void);
 
-//TODO Clean?
-#define TEST(SCALL) \
-	do { \
-		errno = 0; \
-		TST_RET = SCALL; \
-		TST_ERR = errno; \
-	} while (0)
-
-#define TEST_VOID(SCALL) \
-	do { \
-		errno = 0; \
-		SCALL; \
-		TST_ERR = errno; \
-	} while (0)
-
-extern long TST_RET;
-extern int TST_ERR;
-
-extern void *TST_RET_PTR;
-
-#define TESTPTR(SCALL) \
-	do { \
-		errno = 0; \
-		TST_RET_PTR = (void*)SCALL; \
-		TST_ERR = errno; \
-	} while (0)
-
 /*
  * Functions to convert ERRNO to its name and SIGNAL to its name.
  */
diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
new file mode 100644
index 000000000..69de2ce3d
--- /dev/null
+++ b/include/tst_test_macros.h
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2015-2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#ifndef TST_TEST_MACROS_H__
+#define TST_TEST_MACROS_H__
+
+#define TEST(SCALL) \
+	do { \
+		errno = 0; \
+		TST_RET = SCALL; \
+		TST_ERR = errno; \
+	} while (0)
+
+#define TEST_VOID(SCALL) \
+	do { \
+		errno = 0; \
+		SCALL; \
+		TST_ERR = errno; \
+	} while (0)
+
+extern long TST_RET;
+extern int TST_ERR;
+extern int TST_PASS;
+
+extern void *TST_RET_PTR;
+
+#define TESTPTR(SCALL) \
+	do { \
+		errno = 0; \
+		TST_RET_PTR = (void*)SCALL; \
+		TST_ERR = errno; \
+	} while (0)
+
+
+#define TEST_2(_1, _2, ...) _2
+
+#define TEST_FMT_(FMT, _1, ...) FMT, ##__VA_ARGS__
+
+#define TEST_MSG(RES, FMT, SCALL, ...) \
+	tst_res_(__FILE__, __LINE__, RES, \
+		TEST_FMT_(TEST_2(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__))
+
+#define TEST_MSGP(RES, FMT, PAR, SCALL, ...) \
+	tst_res_(__FILE__, __LINE__, RES, \
+		TEST_FMT_(TEST_2(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
+
+#define TEST_FD(SCALL, ...)                                                    \
+	do {                                                                   \
+		TEST(SCALL);                                                   \
+		                                                               \
+		TST_PASS = 0;                                                  \
+		                                                               \
+		if (TST_RET == -1) {                                           \
+			TEST_MSG(TFAIL | TTERRNO, " failed",                   \
+			         #SCALL, ##__VA_ARGS__);                       \
+		        break;                                                 \
+		}                                                              \
+		                                                               \
+		if (TST_RET < 0) {                                             \
+			TEST_MSGP(TFAIL | TTERRNO, " invalid retval %ld",      \
+				  TST_RET, #SCALL, ##__VA_ARGS__);             \
+			break;                                                 \
+		}                                                              \
+                                                                               \
+		TEST_MSGP(TPASS, " returned fd %ld", TST_RET,                  \
+		          #SCALL, ##__VA_ARGS__);                              \
+                                                                               \
+                TST_PASS = 1;                                                  \
+                                                                               \
+	} while (0)
+
+#define TEST_PASS(SCALL, ...)                                                  \
+	do {                                                                   \
+		TEST(SCALL);                                                   \
+		                                                               \
+		TST_PASS = 0;                                                  \
+		                                                               \
+		if (TST_RET == -1) {                                           \
+			TEST_MSG(TFAIL | TTERRNO, " failed",                   \
+			         #SCALL, ##__VA_ARGS__);                       \
+		        break;                                                 \
+		}                                                              \
+		                                                               \
+		if (TST_RET != 0) {                                            \
+			TEST_MSGP(TFAIL | TTERRNO, " invalid retval %ld",      \
+                                  TST_RET, #SCALL, ##__VA_ARGS__);             \
+			break;                                                 \
+		}                                                              \
+                                                                               \
+		TEST_MSG(TPASS, " passed", #SCALL, ##__VA_ARGS__);             \
+                                                                               \
+                TST_PASS = 1;                                                  \
+                                                                               \
+	} while (0)
+
+
+#define TEST_FAIL(SCALL, ERRNO, ...)                                           \
+	do {                                                                   \
+		TEST(SCALL);                                                   \
+		                                                               \
+		TST_PASS = 0;                                                  \
+		                                                               \
+		if (TST_RET == 0) {                                            \
+			TEST_MSG(TFAIL | TTERRNO, " succeeded",                \
+			         #SCALL, ##__VA_ARGS__);                       \
+		        break;                                                 \
+		}                                                              \
+		                                                               \
+		if (TST_RET != -1) {                                           \
+			TEST_MSGP(TFAIL | TTERRNO, " invalid retval %ld",      \
+                                  TST_RET, #SCALL, ##__VA_ARGS__);             \
+			break;                                                 \
+		}                                                              \
+		                                                               \
+		if (ERRNO) {                                                   \
+			if (TST_ERR == ERRNO) {                                \
+				TEST_MSG(TPASS | TERRNO, "",                   \
+				         #SCALL, ##__VA_ARGS__);               \
+				TST_PASS = 1;                                  \
+			} else {                                               \
+				TEST_MSGP(TFAIL | TERRNO, " expected %s",      \
+				          tst_strerrno(ERRNO),                 \
+				          #SCALL, ##__VA_ARGS__);              \
+			}                                                      \
+		}                                                              \
+	} while (0)
+
+
+#endif	/* TST_TEST_MACROS_H__ */
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index ac1d19be0..a5c652c99 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -36,3 +36,6 @@ test_kconfig02
 variant
 test_guarded_buf
 tst_bool_expr
+test_macros01
+test_macros02
+test_macros03
diff --git a/lib/newlib_tests/test_macros01.c b/lib/newlib_tests/test_macros01.c
new file mode 100644
index 000000000..8b315b30f
--- /dev/null
+++ b/lib/newlib_tests/test_macros01.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Test macros.
+ */
+
+#include "tst_test.h"
+
+static int fail_fd(void)
+{
+	errno = EINVAL;
+	return -1;
+}
+
+static int pass_fd(void)
+{
+	return 42;
+}
+
+static int inval_val(void)
+{
+	return -42;
+}
+
+static void do_test(void)
+{
+	TEST_FD(fail_fd(), "TEST DESCRIPTION");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_FD(pass_fd(), "%s", "TEST DESCRIPTION PARAM");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_FD(inval_val());
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
diff --git a/lib/newlib_tests/test_macros02.c b/lib/newlib_tests/test_macros02.c
new file mode 100644
index 000000000..41b685a36
--- /dev/null
+++ b/lib/newlib_tests/test_macros02.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Test macros.
+ */
+
+#include "tst_test.h"
+
+static int fail_fn(void)
+{
+	errno = EINVAL;
+	return -1;
+}
+
+static int pass_fn(void)
+{
+	return 0;
+}
+
+static int inval_ret_fn(void)
+{
+	return 42;
+}
+
+static void do_test(void)
+{
+	TEST_FAIL(fail_fn(), EINVAL);
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_FAIL(fail_fn(), ENOTTY);
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_FAIL(pass_fn(), ENOTTY);
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_FAIL(inval_ret_fn(), ENOTTY, "TEST DESCRIPTION");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
diff --git a/lib/newlib_tests/test_macros03.c b/lib/newlib_tests/test_macros03.c
new file mode 100644
index 000000000..731715308
--- /dev/null
+++ b/lib/newlib_tests/test_macros03.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*
+ * Test macros.
+ */
+
+#include "tst_test.h"
+
+static int fail_fn(void)
+{
+	errno = EINVAL;
+	return -1;
+}
+
+static int pass_fn(void)
+{
+	return 0;
+}
+
+static int inval_ret_fn(void)
+{
+	return 42;
+}
+
+static void do_test(void)
+{
+	TEST_PASS(fail_fn());
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_PASS(pass_fn(), "TEST DESCRIPTION");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TEST_PASS(inval_ret_fn());
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 535c0ff4c..6700a4eef 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -74,6 +74,7 @@ const char *tst_ipc_path = ipc_path;
 static char shm_path[1024];
 
 int TST_ERR;
+int TST_PASS;
 long TST_RET;
 
 static void do_cleanup(void);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
