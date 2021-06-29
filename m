Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF093B7016
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:26:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E83A73C6CB2
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:26:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE8C83C1CC3
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:26:45 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 026E9600189
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624958804; i=@fujitsu.com;
 bh=Ya+gEZuPbNzImJqwNp0WuTgCKRxMfxbsStgBE/rjy5Y=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=lS9bR6IF6fPFWVVGR9P0zQU6wtRzO2IeTrFDCg/s4xVK1Zp6NceHJDftfFsrH8ERB
 kTiy0iuGAQ2bf+YhCzlJLMWU+yNhhm0e4ruaOvbppViBkRXcg70p2lMfAssomE5A6B
 e4RdUTA8qmX8GT2ohVvpPSkwPW2fberQ4F/oYIpXiPa+cFg+cvgm3CYqZCj/xcOSPm
 mkJ1xMvCFATUGdGjyCh7st8eT8YGWKjswckm1z/v4zw0IREig5cndb2DbKPCTag78E
 xgdRbc80hOiXtruYNEVWPEFieDCYYmJvThVZDwpGXR1QRYRvBNXVDrS7XHfb9PPHzg
 fmilBFRCIM+fg==
Received: from [100.112.199.200] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 30/F9-08493-457EAD06;
 Tue, 29 Jun 2021 09:26:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqhv8/Fa
 CwdPVhhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8anbwUFVwwrJl6bytLAeEa7i5GLQ0ighUli
 4uyXLBDOHkaJhlvf2boYOTnYBDQlnnUuYAaxRQQkJDoa3rKD2MwC6hLLJ/1iArGFBfwkLh/dB
 1bDIqAqcer+KlYQm1fAQ2L1n+tgtoSAgsSUh+/BajgFPCUWvt0EZgsB1Uy5Nx+qXlDi5MwnLB
 DzJSQOvnjBDNGrKHGp4xsjhF0hMWPGNrYJjPyzkLTMQtKygJFpFaN5UlFmekZJbmJmjq6hgYG
 uoaGRrqGlua6ZgV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYDCmFBy12cH44fUH
 vUOMkhxMSqK884/fShDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwSv5FCgnWJSanlqRlpkDjAyYt
 AQHj5II7yWQNG9xQWJucWY6ROoUo6KUOG89SEIAJJFRmgfXBovGS4yyUsK8jAwMDEI8BalFuZ
 klqPKvGMU5GJWEeWWeAU3hycwrgZv+CmgxE9DiRU9ugiwuSURISTUwBak5FZ+3eZPzbpdN1wG
 R9Z+mH7rx/XOo4uRc/39Ln916/PjX3eLFKx8YvW+RKpfOe6syS2fi1CTjxBec9dN2mTvJLo1j
 5i4/+XSmnG3aGqGC8rgTDFmL5rQuyt+0uKH0xbLDJhErO6fVPTEr/liWOqe2bXnsWdfff4yKD
 ggaKzS+yv/7YsbRhW92VfedNlztVeV8cK9etLFDzJf9vxNSf0atWOIj7eQ/OXTjFdaz0zY/2q
 HOv/M653FvjsLN2nP3zN+/3zXXeunOzae1mSUnbpnUXGf+2LBD7R1b3o9vFlm71h6IsdpQPGX
 JhCqdV0p9VvF/vvxaFGQQMLFSYXWk7EG+VsaWopcSOd/TplkLqSuxFGckGmoxFxUnAgBU1YB9
 QQMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-12.tower-291.messagelabs.com!1624958803!507742!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32228 invoked from network); 29 Jun 2021 09:26:43 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-12.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 09:26:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15T9QhK9019883
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:26:43 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 10:26:41 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 29 Jun 2021 17:25:59 +0800
Message-ID: <1624958759-5562-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib/newlib_tests/test_macros*.c: Include more
 test macros
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

1) test TST_EXP_FD_SILENT macro in test_macros01.c
2) test TST_EXP_FAIL2 macro in test_macros02.c
3) test TST_EXP_PASS_SILENT macro in test_macros03.c
4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 lib/newlib_tests/.gitignore      |  1 +
 lib/newlib_tests/test_macros01.c | 26 +++++++++++---
 lib/newlib_tests/test_macros02.c | 21 +++++++++---
 lib/newlib_tests/test_macros03.c | 17 +++++++---
 lib/newlib_tests/test_macros04.c | 58 ++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+), 13 deletions(-)
 create mode 100644 lib/newlib_tests/test_macros04.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index b95ead2c2..83a240223 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -41,5 +41,6 @@ tst_bool_expr
 test_macros01
 test_macros02
 test_macros03
+test_macros04
 tst_fuzzy_sync01
 tst_fuzzy_sync02
diff --git a/lib/newlib_tests/test_macros01.c b/lib/newlib_tests/test_macros01.c
index 9a920f8e4..95144385e 100644
--- a/lib/newlib_tests/test_macros01.c
+++ b/lib/newlib_tests/test_macros01.c
@@ -4,7 +4,7 @@
  */
 
 /*
- * Test macros.
+ * Test TST_EXP_FD and TST_EXP_FD_SILENT macro.
  */
 
 #include "tst_test.h"
@@ -25,13 +25,31 @@ static int inval_val(void)
 	return -42;
 }
 
+static int zero_val(void)
+{
+	return 0;
+}
+
 static void do_test(void)
 {
-	TST_EXP_FD(fail_fd(), "TEST DESCRIPTION");
+	tst_res(TINFO, "Testing TST_EXP_FD macro");
+	TST_EXP_FD(fail_fd(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD(pass_fd(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD(inval_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD(zero_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_FD_SILENT macro");
+	TST_EXP_FD_SILENT(fail_fd(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD_SILENT(pass_fd(), "%s", "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FD(pass_fd(), "%s", "TEST DESCRIPTION PARAM");
+	TST_EXP_FD_SILENT(inval_val(), "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FD(inval_val());
+	TST_EXP_FD_SILENT(zero_val(), "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
 
diff --git a/lib/newlib_tests/test_macros02.c b/lib/newlib_tests/test_macros02.c
index f0a692ab6..5b14f871b 100644
--- a/lib/newlib_tests/test_macros02.c
+++ b/lib/newlib_tests/test_macros02.c
@@ -4,7 +4,7 @@
  */
 
 /*
- * Test macros.
+ * Test TST_EXP_FAIL and TST_EXP_FAIL2 macro.
  */
 
 #include "tst_test.h"
@@ -27,13 +27,24 @@ static int inval_ret_fn(void)
 
 static void do_test(void)
 {
-	TST_EXP_FAIL(fail_fn(), EINVAL);
+	tst_res(TINFO, "Testing TST_EXP_FAIL macro");
+	TST_EXP_FAIL(fail_fn(), EINVAL, "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(fail_fn(), ENOTTY);
+	TST_EXP_FAIL(fail_fn(), ENOTTY, "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(pass_fn(), ENOTTY);
+	TST_EXP_FAIL(pass_fn(), ENOTTY, "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(inval_ret_fn(), ENOTTY, "TEST DESCRIPTION");
+	TST_EXP_FAIL(inval_ret_fn(), ENOTTY, "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_FAIL2 macro");
+	TST_EXP_FAIL2(fail_fn(), EINVAL, "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(fail_fn(), ENOTTY, "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(pass_fn(), ENOTTY, "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(inval_ret_fn(), ENOTTY, "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
 
diff --git a/lib/newlib_tests/test_macros03.c b/lib/newlib_tests/test_macros03.c
index 414370980..9544aacbc 100644
--- a/lib/newlib_tests/test_macros03.c
+++ b/lib/newlib_tests/test_macros03.c
@@ -4,7 +4,7 @@
  */
 
 /*
- * Test macros.
+ * Test TST_EXP_PASS and TST_EXP_PASS_SILENT macro.
  */
 
 #include "tst_test.h"
@@ -27,11 +27,20 @@ static int inval_ret_fn(void)
 
 static void do_test(void)
 {
-	TST_EXP_PASS(fail_fn());
+	tst_res(TINFO, "Testing TST_EXP_PASS macro");
+	TST_EXP_PASS(fail_fn(), "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_PASS(pass_fn(), "TEST DESCRIPTION");
+	TST_EXP_PASS(pass_fn(), "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_PASS(inval_ret_fn());
+	TST_EXP_PASS(inval_ret_fn(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_PASS_SILENT macro");
+	TST_EXP_PASS_SILENT(fail_fn(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PASS_SILENT(pass_fn(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PASS_SILENT(inval_ret_fn(), "SCALL");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
 
diff --git a/lib/newlib_tests/test_macros04.c b/lib/newlib_tests/test_macros04.c
new file mode 100644
index 000000000..968261b9b
--- /dev/null
+++ b/lib/newlib_tests/test_macros04.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*
+ * Test TST_EXP_PID and TST_EXP_PID_SILENT macro.
+ */
+
+#include "tst_test.h"
+
+static int fail_pid(void)
+{
+	errno = EINVAL;
+	return -1;
+}
+
+static int pass_pid(void)
+{
+	return 42;
+}
+
+static int inval_val(void)
+{
+	return -42;
+}
+
+static int zero_val(void)
+{
+	return 0;
+}
+
+static void do_test(void)
+{
+	tst_res(TINFO, "Testing TST_EXP_PID macro");
+	TST_EXP_PID(fail_pid(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(pass_pid(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(inval_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(zero_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_PID_SILENT macro");
+	TST_EXP_PID_SILENT(fail_pid(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID_SILENT(pass_pid(), "%s", "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID_SILENT(inval_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID_SILENT(zero_val(), "SCALL");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
