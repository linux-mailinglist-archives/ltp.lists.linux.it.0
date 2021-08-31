Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E336B3FC08F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:45:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44C6E3C9B60
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:45:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 622B53C2B34
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:45:11 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 669E5200111
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:45:10 +0200 (CEST)
X-QQ-mid: bizesmtp53t1630374302tinpga0q
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 09:44:45 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: 7H5s62Q/zlMGgnaSwj65pmwBt8hwPpSk8rWe4JbbJ1LbvhkQ3yypiYWwg9ulD
 6OlDjj7MTptTcnTfEoiEG9g9nmRQrF4D51bT6ERYeImsZeDILIXKMbveaOW+eylt3TOIsyb
 tj7KliIxH+9vzVVvztno8p9nYArTtk5Axl7FXzliKaQeFF28+pPZUM6y1J1RWOutSXejtjn
 Y+etmfm5nlidoT7cZuNKEP285GJ3XP3Mv0vvam49LG6t/ZQTKTUQyw5WfYP9ANf7ceaTYK1
 3OHQ0LuauZ7wRqdYBu3HuPSFbWd2oAKAeIRu5cAk2JVnh7DQc9vaypHVJnlWSP+07b6zVTT
 tGmgtkJfmWZWCwE4AqYBiM62T1YPg==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 09:44:43 +0800
Message-Id: <20210831014443.29166-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_test_macros: Add test_macros06 tests
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

Reviewed-by: Li Wang <liwang@redhat.com>
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
index 000000000..ac21e4126
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
+	TST_EXP_VAL(pass_val(), 42, "pass_val()");
+	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+
+	tst_res(TINFO, "Testing TST_EXP_VAL_SILENT macro");
+	TST_EXP_VAL_SILENT(fail_val(), 40, "fail_val()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_VAL_SILENT(fail_val, ...)", TST_PASS);
+	TST_EXP_VAL_SILENT(pass_val(), 42, "pass_val()");
+	tst_res(TINFO, "TST_PASS = %i from TST_EXP_VAL_SILENT(pass_val, ...)", TST_PASS);
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
