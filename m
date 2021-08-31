Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC03FC08C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:44:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D0153C9B61
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 03:44:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 496F23C2B34
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:44:15 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 60D861A002D7
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 03:44:11 +0200 (CEST)
X-QQ-mid: bizesmtp50t1630374245tgmlrefa
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 09:44:01 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: O9RHVi+JMbI5Rwg1m04MLlOwZBIxDYMDo0napKCw9vITeuoPCQaHFE8xitcVc
 qocNPQl+EljUn5tHogra7DENlHDCgyZ/ubrQCGGszX1VLCRes1sB3tf6WVnccboBmr4B0Tz
 0kQVlPFEnvbNgyQoSb05pOH0TkiiSzabZ39tHY1nUNPErZ6wpekH7tpl+ywR5a5Q4OtbH0w
 qJOoDAxrkuygiP69dzOIV8hDrQlt8K0P3nunhFeHsIWtT1FkmVKBQZLUutRs8l8hDujSYv8
 A5u/34XAEN4EuQKEW635S8y/EdwQ+i9VbkerfZDHu5Gwv7ZtlYB9q75FixMZ6dSVfHhsu2q
 qmuya6G5qj2epNObvY=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 09:43:58 +0800
Message-Id: <20210831014358.28459-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] tst_test_macros.h: Add TST_EXP_VAL macro
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

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 50598aa15..f8e08e134 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -132,6 +132,34 @@ extern void *TST_RET_PTR;
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
 	} while (0)                                                            \

+
+#define TST_EXP_VAL_SILENT_(SCALL, VAL, SSCALL, ...)                           \
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
+#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL, VAL, #SCALL, ##__VA_ARGS__)
+
+#define TST_EXP_VAL(SCALL, VAL, ...)                                           \
+	do {                                                                   \
+		TST_EXP_VAL_SILENT_(SCALL, VAL, #SCALL, ##__VA_ARGS__);        \
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
