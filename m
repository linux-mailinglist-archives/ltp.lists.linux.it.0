Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACE3FB19F
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 09:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C78B03C9B01
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 09:10:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2ACBA3C2183
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 09:10:03 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4C94D140097A
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 09:10:01 +0200 (CEST)
X-QQ-mid: bizesmtp31t1630307397tqaa9h0y
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 30 Aug 2021 15:09:52 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00B0000000
X-QQ-FEAT: jE/Jgvobnf+jDiZt1gAUhBIgJ88IPPbsBDIod73HUEqWcBmer4uik2y5FcfjC
 A9BpaHc6zLZNUMDljSAMgMr+GdmKg30NilwMRgMyJ/vnfSwAa7+zH6V54pi5l2tcnkdkFuM
 a3r/4GcDq4WrP3HoQqxltArRhZ7Wylhd2Gq2ESrAWPwIJLrqd9pJGvv1053vFJVA+Cdabeo
 FF50dSdFXr/LS52HWD8H+MGWSAVtr5zlYzyKpBUM3CGqb0nvkSYwQodU4SyQtr41fv2/mz0
 FpFNzKBKlMuUMK16hshiPOtsfq4WwrIRyW8Fgl62QT+XqKtK+efKkJYWTdmO2/fE8deltFD
 TU5CYPPfp6vy4ASPY8=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 15:09:51 +0800
Message-Id: <20210830070951.27803-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] tst_test_macros.h: Add TST_EXP_VAL macro
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

Add TST_EXP_VAL to determine whether the return value
is equal to the given value.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 50598aa15..0ccc01f49 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -132,6 +132,34 @@ extern void *TST_RET_PTR;
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
 	} while (0)                                                            \

+
+#define TST_EXP_VAL_SILENT_(SCALL, SSCALL, VAL, ...)                           \
+	do {                                                                   \
+		TEST(SCALL);                                                   \
+		                                                               \
+		TST_PASS = 0;                                                  \
+		                                                               \
+		if (TST_RET != VAL) {                                          \
+			TST_MSGP_(TFAIL | TTERRNO, " retval not %ld",          \
+			          (long )VAL, SSCALL, ##__VA_ARGS__);          \
+			break;                                                 \
+		}                                                              \
+		                                                               \
+		TST_PASS = 1;                                                  \
+		                                                               \
+	} while (0)
+
+#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL, #SCALL, VAL, ##__VA_ARGS__)
+
+#define TST_EXP_VAL(SCALL, VAL, ...)                                           \
+	do {                                                                   \
+		TST_EXP_VAL_SILENT(SCALL, VAL, ##__VA_ARGS__);                 \
+		                                                               \
+		if (TST_PASS)                                                  \
+			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
+			                                                       \
+	} while(0)
+
 #define TST_EXP_FAIL_(PASS_COND, SCALL, SSCALL, ERRNO, ...)                    \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
