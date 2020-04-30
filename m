Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD81BF4A9
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:59:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CD983C27D4
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:59:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4861C3C283A
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:45 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A9066601943
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,334,1583164800"; d="scan'208";a="90855853"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 17:58:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C4DA64BCC8AE
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 17:58:31 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 17:58:30 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Apr 2020 17:58:31 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 30 Apr 2020 17:58:23 +0800
Message-ID: <1588240704-14747-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588240704-14747-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200429120609.GA668@yuki.lan>
 <1588240704-14747-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C4DA64BCC8AE.A078E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] lib: Add TST_ASSERT_FILE_INT and
 TST_ASSERT_FILE_STR
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

These functions are similar to TST_ASSERT_INT/STR, but they
are designed to get field value of proc or sys file. ie
NoNewPrivs field in the /proc/[pid]/status.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt |  8 ++++++++
 include/tst_assert.h            | 28 ++++++++++++++++++++++++++--
 lib/newlib_tests/.gitignore     |  1 +
 lib/newlib_tests/test_assert.c  | 19 +++++++++++++++++++
 lib/tst_assert.c                | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 lib/newlib_tests/test_assert.c

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 3e33fd4c1..bda9bcfd5 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2045,6 +2045,14 @@ terminated array of strings such as:
 },
 -------------------------------------------------------------------------------
 
+2.2.36 Assert sys or proc file value
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Using TST_ASSERT_INT/STR(path, val) to assert that integer value or string stored in
+the prefix field of file pointed by path equals to the value passed to this function.
+
+Also having a similar api pair TST_ASSERT_FILE_INT/STR(path, prefix, val) to assert
+the field value of file.
+
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/tst_assert.h b/include/tst_assert.h
index 04e80777c..9969a8169 100644
--- a/include/tst_assert.h
+++ b/include/tst_assert.h
@@ -16,7 +16,20 @@
  * values in sysfs, procfs, etc.
  */
 void tst_assert_int(const char *file, const int lineno,
-                    const char *path, int val);
+		    const char *path, int val);
+
+#define TST_ASSERT_FILE_INT(path, prefix, val) \
+	tst_assert_file_int(__FILE__, __LINE__, path, prefix, val)
+
+/*
+ * Asserts that integer value stored in the prefix field of file pointed by path
+ * equals to the value passed to this function. This is mostly useful for
+ * asserting correct field values in sysfs, procfs, etc.
+ */
+
+void tst_assert_file_int(const char *file, const int lineno,
+			 const char *path, const char *prefix, int val);
+
 
 #define TST_ASSERT_STR(path, val) \
 	tst_assert_str(__FILE__, __LINE__, path, val)
@@ -27,6 +40,17 @@ void tst_assert_int(const char *file, const int lineno,
  * values in sysfs, procfs, etc.
  */
 void tst_assert_str(const char *file, const int lineno,
-                    const char *path, const char *val);
+		    const char *path, const char *val);
+
+#define TST_ASSERT_FILE_STR(path, prefix, val) \
+	tst_assert_file_str(__FILE__, __LINE__, path, prefix, val)
+
+/*
+ * Asserts that a string value stored in the prefix field of file pointed by path
+ * equals to the value passed to this function. This is mostly useful for
+ * asserting correct field values in sysfs, procfs, etc.
+ */
+void tst_assert_file_str(const char *file, const int lineno,
+			 const char *path, const char *prefix, const char *val);
 
 #endif /* TST_ASSERT_H__ */
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index dd9899927..fee8795b6 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -25,6 +25,7 @@ test18
 test19
 test20
 tst_expiration_timer
+test_assert
 test_timer
 test_exec
 test_exec_child
diff --git a/lib/newlib_tests/test_assert.c b/lib/newlib_tests/test_assert.c
new file mode 100644
index 000000000..092303893
--- /dev/null
+++ b/lib/newlib_tests/test_assert.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ */
+
+#include <stdio.h>
+#include "tst_test.h"
+
+static void do_test(void)
+{
+	TST_ASSERT_INT("/proc/self/oom_score", 0);
+	TST_ASSERT_STR("/proc/self/comm", "test_assert");
+	TST_ASSERT_FILE_INT("/proc/self/io", "read_bytes:", 0);
+	TST_ASSERT_FILE_STR("/proc/self/status1", "State", "unexpected");
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
diff --git a/lib/tst_assert.c b/lib/tst_assert.c
index f05aea222..8418fb72d 100644
--- a/lib/tst_assert.c
+++ b/lib/tst_assert.c
@@ -4,6 +4,7 @@
  * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
  */
+#include <stdio.h>
 #define TST_NO_DEFAULT_MAIN
 #include "tst_assert.h"
 #include "tst_test.h"
@@ -22,6 +23,22 @@ void tst_assert_int(const char *file, const int lineno, const char *path, int va
 	tst_res_(file, lineno, TFAIL, "%s != %d got %d", path, val, sys_val);
 }
 
+void tst_assert_file_int(const char *file, const int lineno, const char *path, const char *prefix, int val)
+{
+	int sys_val;
+	char fmt[1024];
+
+	sprintf(fmt, "%s%%d", prefix);
+	file_lines_scanf(file, lineno, NULL, 1, path, fmt, &sys_val);
+
+	if (val == sys_val) {
+		tst_res_(file, lineno, TPASS, "%s %s = %d", path, prefix, sys_val);
+		return;
+	}
+
+	tst_res_(file, lineno, TFAIL, "%s %s != %d got %d", path, prefix, val, sys_val);
+}
+
 void tst_assert_str(const char *file, const int lineno, const char *path, const char *val)
 {
 	char sys_val[1024];
@@ -34,3 +51,19 @@ void tst_assert_str(const char *file, const int lineno, const char *path, const
 
 	tst_res_(file, lineno, TFAIL, "%s != '%s' got '%s'", path, val, sys_val);
 }
+
+void tst_assert_file_str(const char *file, const int lineno, const char *path, const char *prefix, const char *val)
+{
+	char sys_val[1024];
+	char fmt[2048];
+
+	sprintf(fmt, "%s: %%1024s", prefix);
+	file_lines_scanf(file, lineno, NULL, 1, path, fmt, sys_val);
+
+	if (!strcmp(val, sys_val)) {
+		tst_res_(file, lineno, TPASS, "%s %s = '%s'", path, prefix, sys_val);
+		return;
+	}
+
+	tst_res_(file, lineno, TFAIL, "%s %s != '%s' got '%s'", path, prefix, val, sys_val);
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
