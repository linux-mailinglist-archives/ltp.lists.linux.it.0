Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8943FB1FA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 09:36:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0CCB3C9B05
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 09:36:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A1DD3C2A0B
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 09:36:01 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 84AE860078D
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 09:35:57 +0200 (CEST)
X-QQ-mid: bizesmtp46t1630308950tekjhb4j
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 30 Aug 2021 15:35:45 +0800 (CST)
X-QQ-SSF: 0140000000200040C000000B0000000
X-QQ-FEAT: l6IKqkG+Nbk6OmXZyKJa2dpVnJ98RhtbIkAYTjep9DsoVS79w8rHIfH460Qzv
 WqoCXEesnjOMo8YpT87GnR7yVh3D7vUY+XdoKG9VtOu/bys7+RE4Rmb3mKb2Bb1UEU1Hp0z
 nAQVeLJrbpeMMrHVQ482TlE9o6egOaSioGh2gOo2bMneB6+RizEneB0pWugGhJTAgffczPJ
 pbUD6j4AZZjVEqlziLIiwPLoi7Lcz4wYe6CmS4vRc7EOTG1pLdbWTmQHzQVKqnUC6BE3vol
 GGZ0MmLxoLfStLCawoLc2I46j0zhjDizPC8b6WosC4SIjdoB6RXEf4zQHSaZo2MVrR8+PyG
 O7JJj8/Ca/V94a8QLtLs1DP3BRAfA==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 15:35:44 +0800
Message-Id: <20210830073544.19620-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_test_macros: Add test_macros06 tests
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

Test the TST_EXP_VAL and TST_EXP_VAL_SILENT macros.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index a0bad78c1..cf467b5a0 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -42,6 +42,7 @@ test_macros02
 test_macros03
 test_macros04
 test_macros05
+test_macros06
 tst_fuzzy_sync01
 tst_fuzzy_sync02
 tst_fuzzy_sync03
diff --git a/lib/newlib_tests/test_macros06.c b/lib/newlib_tests/test_macros06.c
new file mode 100644
index 000000000..626f233d2
--- /dev/null
+++ b/lib/newlib_tests/test_macros06.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 zhanglianjie <zhanglianjie@uniontech.com>
+ */
+
+/*
+ * Test TST_EXP_VAL and TST_EXP_VAL_SILENT macro.
+ */
+
+#include "tst_test.h"
+
+static int fail_val(void)
+{
+	errno = EINVAL;
+	return 42;
+}
+
+static int pass_val(void)
+{
+	return 42;
+}
+
+static void do_test(void)
+{
+	tst_res(TINFO, "Testing TST_EXP_VAL macro");
+	TST_EXP_VAL(fail_val(), 40, "fail_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_VAL(pass_val(), 42, "fail_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_PID_SILENT macro");
+	TST_EXP_VAL_SILENT(fail_val(), 40, "fail_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	TST_EXP_VAL_SILENT(pass_val(), 42, "%s", "pass_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
