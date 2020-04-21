Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 475081B1EBC
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:22:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D195B3C29B4
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:22:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CA1123C2995
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:22:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CCA80600967
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:22:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; d="scan'208";a="89334505"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 14:21:48 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 231BD46B5FA8
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 14:11:09 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 14:21:42 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 14:21:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 21 Apr 2020 14:21:47 +0800
Message-ID: <1587450108-31100-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587450108-31100-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1587450108-31100-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 231BD46B5FA8.AED76
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] lib: Add TST_ASSERT_FILE_INT and
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
 include/tst_assert.h | 28 ++++++++++++++++++++++++++--
 lib/tst_assert.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/tst_assert.h b/include/tst_assert.h
index 04e80777c..913fff1b5 100644
--- a/include/tst_assert.h
+++ b/include/tst_assert.h
@@ -16,7 +16,20 @@
  * values in sysfs, procfs, etc.
  */
 void tst_assert_int(const char *file, const int lineno,
-                    const char *path, int val);
+		    const char *path, int val);
+
+#define TST_ASSERT_FILE_INT(path, buf, val) \
+	tst_assert_file_int(__FILE__, __LINE__, path, buf, val)
+
+/*
+ * Asserts that integer value stored in the buf field of file pointed by path
+ * equals to the value passed to this function. This is mostly useful for
+ * asserting correct field values in sysfs, procfs, etc.
+ */
+
+void tst_assert_file_int(const char *file, const int lineno,
+			 const char *path, const char *buf, int val);
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
+#define TST_ASSERT_FILE_STR(path, buf, val) \
+	tst_assert_file_str(__FILE__, __LINE__, path, buf, val)
+
+/*
+ * Asserts that a string value stored in the buf field of file pointed by path
+ * equals to the value passed to this function. This is mostly useful for
+ * asserting correct field values in sysfs, procfs, etc.
+ */
+void tst_assert_file_str(const char *file, const int lineno,
+			 const char *path, const char *buf, const char *val);
 
 #endif /* TST_ASSERT_H__ */
diff --git a/lib/tst_assert.c b/lib/tst_assert.c
index 8ef3cd72e..65ee76473 100644
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
 
+void tst_assert_file_int(const char *file, const int lineno, const char *path, const char *buf, int val)
+{
+	int sys_val;
+	char fmt[1024];
+
+	sprintf(fmt, "%s: %%d", buf);
+	SAFE_FILE_LINES_SCANF(path, fmt, &sys_val);
+
+	if (val == sys_val) {
+		tst_res_(file, lineno, TPASS, "%s %s = %d", path, buf, sys_val);
+		return;
+	}
+
+	tst_res_(file, lineno, TFAIL, "%s %s != %d got %d", path, buf, val, sys_val);
+}
+
 void tst_assert_str(const char *file, const int lineno, const char *path, const char *val)
 {
 	char sys_val[1024];
@@ -34,3 +51,19 @@ void tst_assert_str(const char *file, const int lineno, const char *path, const
 
 	tst_res_(file, lineno, TFAIL, "%s != '%s' got '%s'", path, val, sys_val);
 }
+
+void tst_assert_file_str(const char *file, const int lineno, const char *path, const char *buf, const char *val)
+{
+	char sys_val[1024];
+	char fmt[2048];
+
+	sprintf(fmt, "%s: %%1024s", buf);
+	SAFE_FILE_LINES_SCANF(path, fmt, sys_val);
+
+	if (!strcmp(val, sys_val)) {
+		tst_res_(file, lineno, TPASS, "%s %s = '%s'", path, buf, sys_val);
+		return;
+	}
+
+	tst_res_(file, lineno, TFAIL, "%s %s != '%s' got '%s'", path, buf, val, sys_val);
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
