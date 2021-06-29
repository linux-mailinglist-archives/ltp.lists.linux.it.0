Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54A3B712A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 13:13:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3B7E3C6E5B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 13:13:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18C2A3C1888
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 13:13:44 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A4C8A1A00E2E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 13:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624965222; i=@fujitsu.com;
 bh=izWux7yGotYeLpT7J0eWfWHs8ccH9f8O/f8a3j6dPrg=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=uVlMB6i09aAB/AlhklVB5WXE4hu5eV1cLUVWPrezPnHbmiaPQMB8ANygP4a9gxxIS
 oWWUOqVespQx0dz9FeE2Ba4GL9J99JzWgRU/MhGSsXzB/0wQgrsYpEpiMmQU6+WZ5N
 fNJfOBP4tv93673EEb1DcwfUiFI4Cyx2aUx1u6nBwRu2nZsf3LVGxKS4o+OIIqPAjk
 WPuG6dr26XGvmiJJjsGdUvtsgiuDD5mExLn6b9lI52B8Lo7H5tlI/umeAcjIoa+IOq
 Zoe4LFSpHlpj9CCvZNhZMQoB4SFb2X4BOpVYAt0eGXsyUGWkevpZwmGMazJdE7A8he
 xMze2Qtd9UkwA==
Received: from [100.112.198.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 3A/2F-64908-6600BD06;
 Tue, 29 Jun 2021 11:13:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MRqpvGcDv
 B4E2fpMXmPetYLFZ838HowOSx7/c6Vo/3+66yBTBFsWbmJeVXJLBmHL40l6VgkWnFzKVrWBsY
 v+t1MXJxCAm8ZpT41nqPBcLZwyjx88FjIIeTg01AU+JZ5wLmLkYODhEBcYmJ8xNAwswCthLPH
 15iA7GFBXwlpvZ/ZgaxWQRUJRa2vgGL8wp4SJz6MglsjISAgsSUh+/BajgFAiX+/7zJCGILCQ
 RIzOhYzApRLyhxcuYTFoj5EhIHX7xghuhVlLjU8Y0Rwq6QmDFjG9sERv5ZSFpmIWlZwMi0itE
 iqSgzPaMkNzEzR9fQwEDX0NBI19DSTNfI0EQvsUo3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8v
 tWQTIzBEUwqOXNvBeOD1B71DjJIcTEqivPOP30oQ4kvKT6nMSCzOiC8qzUktPsQow8GhJMG7/
 B9QTrAoNT21Ii0zBxgvMGkJDh4lEd55v4HSvMUFibnFmekQqVOMilLivPL/gRICIImM0jy4Nl
 iMXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsVZDtPZl4J3PRXQIuZgBYvenITZHFJIkJ
 KqoGpxGfH9pYjff9Vna/I6DMeXPPztHoib0L8ll87HfjDqhOsPAQXfTm8uouLSVldiFe46ErJ
 xzKXMpO37qsVthd6VmfaVVzsZds29Vr+qav+Ted73Fpvzb2SZ621NdLtWJjg+juWjVcEN16/H
 Xy4odBH7yx/j8UHM8djUbO6bn2rX37U4semaMEnFcdFdWV/udmISXTuOjVFdckjwaUbF4VcSu
 XV7RAsDKi8pRuiL38quTFjgeol/VTOjWJKP2fffNnHHnBRmL1+HccevchHyTkH50/5/GHjlSn
 dDxnb7m2J/rww9bcZl8mSHyKuC9zDeVnj4x6ZVUaoZBnPPKmf5vPqVL4Fc1BOwZTE1TJX9yux
 FGckGmoxFxUnAgAouPnRTAMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-287.messagelabs.com!1624965222!7690!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22814 invoked from network); 29 Jun 2021 11:13:42 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-13.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 11:13:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TBDdJV029167
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 29 Jun 2021 12:13:42 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 12:13:36 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <liwang@redhat.com>
Date: Tue, 29 Jun 2021 19:14:09 +0800
Message-ID: <1624965249-7087-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
References: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib/newlib_tests/test_macros*.c: Include more test
 macros
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

1) test TST_EXP_FD_SILENT macro in test_macros01.c
2) test TST_EXP_FAIL2 macro in test_macros02.c
3) test TST_EXP_PASS_SILENT macro in test_macros03.c
4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
v1->v2:
1.add more info for silent macro
2.replace scall string with function name
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
index 9a920f8e4..c04c94363 100644
--- a/lib/newlib_tests/test_macros01.c
+++ b/lib/newlib_tests/test_macros01.c
@@ -4,7 +4,7 @@
  */
 
 /*
- * Test macros.
+ * Test TST_EXP_FD and TST_EXP_FD_SILENT macro.
  */
 
 #include "tst_test.h"
@@ -25,14 +25,32 @@ static int inval_val(void)
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
+	TST_EXP_FD(fail_fd(), "fail_fd()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD(pass_fd(), "pass_fd()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FD(pass_fd(), "%s", "TEST DESCRIPTION PARAM");
+	TST_EXP_FD(inval_val(), "inval_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD(zero_val(), "zero_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_FD_SILENT macro");
+	TST_EXP_FD_SILENT(fail_fd(), "fail_fd()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FD(inval_val());
+	TST_EXP_FD_SILENT(pass_fd(), "%s", "pass_fd()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_FD_SILENT(pass_fd, ...)", TST_PASS);
+	TST_EXP_FD_SILENT(inval_val(), "inval_val()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FD_SILENT(zero_val(), "zero_val()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_FD_SILENT(zero_val, ...)", TST_PASS);
 }
 
 static struct tst_test test = {
diff --git a/lib/newlib_tests/test_macros02.c b/lib/newlib_tests/test_macros02.c
index f0a692ab6..647f73682 100644
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
+	TST_EXP_FAIL(fail_fn(), EINVAL, "fail_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(fail_fn(), ENOTTY);
+	TST_EXP_FAIL(fail_fn(), ENOTTY, "fail_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(pass_fn(), ENOTTY);
+	TST_EXP_FAIL(pass_fn(), ENOTTY, "pass_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_FAIL(inval_ret_fn(), ENOTTY, "TEST DESCRIPTION");
+	TST_EXP_FAIL(inval_ret_fn(), ENOTTY, "inval_ret_fn()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_FAIL2 macro");
+	TST_EXP_FAIL2(fail_fn(), EINVAL, "fail_fn()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(fail_fn(), ENOTTY, "fail_fn()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(pass_fn(), ENOTTY, "pass_fn");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_FAIL2(inval_ret_fn(), ENOTTY, "inval_ret_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
 
diff --git a/lib/newlib_tests/test_macros03.c b/lib/newlib_tests/test_macros03.c
index 414370980..19a0ad6fd 100644
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
+	TST_EXP_PASS(fail_fn(), "fail_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_PASS(pass_fn(), "TEST DESCRIPTION");
+	TST_EXP_PASS(pass_fn(), "pass_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
-	TST_EXP_PASS(inval_ret_fn());
+	TST_EXP_PASS(inval_ret_fn(), "inval_ret_fn()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_PASS_SILENT macro");
+	TST_EXP_PASS_SILENT(fail_fn(), "fail_fn()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PASS_SILENT(pass_fn(), "pass_fn()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_PASS_SILENT(pass_fn, ...)", TST_PASS);
+	TST_EXP_PASS_SILENT(inval_ret_fn(), "inval_ret_fn()");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
 
diff --git a/lib/newlib_tests/test_macros04.c b/lib/newlib_tests/test_macros04.c
new file mode 100644
index 000000000..e0111807f
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
+	TST_EXP_PID(fail_pid(), "fail_pid()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(pass_pid(), "pass_pid()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(inval_val(), "inval_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID(zero_val(), "zero_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_PID_SILENT macro");
+	TST_EXP_PID_SILENT(fail_pid(), "fail_pid()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID_SILENT(pass_pid(), "%s", "pass_pid()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_PID_SILENT(pass_pid, ...)", TST_PASS);
+	TST_EXP_PID_SILENT(inval_val(), "inval_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_PID_SILENT(zero_val(), "zero_val()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_PID_SILENT(zero_val, ...)", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
