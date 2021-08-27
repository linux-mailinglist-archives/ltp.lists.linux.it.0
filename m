Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2D3F925A
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 04:31:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 354CF3C9CE3
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 04:31:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCDE83C30BE
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 04:30:59 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 505842009F0
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 04:30:56 +0200 (CEST)
X-QQ-mid: bizesmtp37t1630031450tapguyel
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 27 Aug 2021 10:30:46 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: cwsqT8edSrsV658AaMm/NgHKRFgxfA6jugmKu1P8aMUJcmKx5s93d5syu0Jfg
 RNEHFiHNA4oCodNVVGYfC6Jx+HKl3Eaay31S9aBAjhwA19eaFpaIWhftXI3dp6bvfW+TVEg
 MDGDYr9PRgpKKDN4yrb/J6OaASqoIeIq362X0fZo250simFoqT8KnTrnatAyrpeKUK6GxUE
 Bqul0Jz2mPZs2nWdPLn/zg6OS+pwhUpoKnAjIIbMXu9zUXXMAAjl0F5k0tJmkC7pF5R+wWu
 gdFRZY+0H5oKy3Nu7qo33QNz/M9Xk2ZZUNEMD4dcB6WW3ZYq+q25wn2oPCIzkhs2rnT1M9Y
 SnRJ8j2
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 10:30:42 +0800
Message-Id: <20210827023042.26143-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_test_macros.h: Add TST_EXP_VAL macro
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
index 50598aa15..d23455362 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -132,6 +132,34 @@ extern void *TST_RET_PTR;
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
 	} while (0)                                                            \

+
+#define TST_EXP_VAL_SILENT_(SCALL, SSCALL, VAL, ...)                    \
+	do {                                                                \
+		TEST(SCALL);                                                    \
+                                                                        \
+		TST_PASS = 0;                                                   \
+                                                                        \
+		if (TST_RET != VAL) {                                           \
+			TST_MSGP_(TFAIL | TTERRNO, " retval not %ld",               \
+			          (long )VAL, SSCALL, ##__VA_ARGS__);               \
+			break;                                                      \
+		}                                                               \
+                                                                        \
+		TST_PASS = 1;                                                   \
+                                                                        \
+	} while (0)
+
+#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL, #SCALL, VAL, ##__VA_ARGS__)
+
+#define TST_EXP_VAL(SCALL, VAL, ...)                                    \
+	do {                                                                \
+		TST_EXP_VAL_SILENT(SCALL, VAL, ##__VA_ARGS__);                  \
+                                                                        \
+		if (TST_PASS)                                                   \
+			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);          \
+                                                                        \
+	} while(0)
+
 #define TST_EXP_FAIL_(PASS_COND, SCALL, SSCALL, ERRNO, ...)                    \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
