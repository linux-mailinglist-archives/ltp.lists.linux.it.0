Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9332F261B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E8CB3C6491
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EADE33C313B
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:44 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1E12D1A00E0D
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="103381969"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 10:12:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 53D464CE6035;
 Tue, 12 Jan 2021 10:12:38 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 10:12:37 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 12 Jan 2021 10:12:38 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 12 Jan 2021 10:02:25 +0800
Message-ID: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 53D464CE6035.A89DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=1.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UPPERCASE_50_75 autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] include/tst_test_macros.h: Add TST_EXP_{PASS,
 FD}_SILENT macros
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

1) TST_EXP_{PASS,FD}_SILENT don't report TPASS when SCALL succeeds.
2) TST_EXP_{PASS,FD} calls TST_EXP_{PASS,FD}_SILENT and reports
   TPASS when SCALL succeeds.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 include/tst_test_macros.h | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 3016d95c2..92cb5c66b 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -46,7 +46,7 @@ extern void *TST_RET_PTR;
 	tst_res_(__FILE__, __LINE__, RES, \
 		TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
 
-#define TST_EXP_FD(SCALL, ...)                                                 \
+#define TST_EXP_FD_SILENT(SCALL, ...)                                          \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
@@ -64,14 +64,20 @@ extern void *TST_RET_PTR;
 			break;                                                 \
 		}                                                              \
                                                                                \
-		TST_MSGP_(TPASS, " returned fd %ld", TST_RET,                  \
-		         #SCALL, ##__VA_ARGS__);                               \
-                                                                               \
 		TST_PASS = 1;                                                  \
                                                                                \
 	} while (0)
 
-#define TST_EXP_PASS(SCALL, ...)                                               \
+#define TST_EXP_FD(SCALL, ...)                                                 \
+	do {                                                                   \
+		TST_EXP_FD_SILENT(SCALL, __VA_ARGS__);                         \
+		                                                               \
+		if (TST_PASS)                                                  \
+			TST_MSGP_(TPASS, " returned fd %ld", TST_RET,          \
+				#SCALL, ##__VA_ARGS__);                        \
+	} while (0)
+
+#define TST_EXP_PASS_SILENT(SCALL, ...)                                        \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
@@ -89,12 +95,17 @@ extern void *TST_RET_PTR;
 			break;                                                 \
 		}                                                              \
                                                                                \
-		TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);             \
-                                                                               \
 		TST_PASS = 1;                                                  \
                                                                                \
 	} while (0)
 
+#define TST_EXP_PASS(SCALL, ...)                                               \
+	do {                                                                   \
+		TST_EXP_PASS_SILENT(SCALL, __VA_ARGS__);                       \
+		                                                               \
+		if (TST_PASS)                                                  \
+			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
+	} while (0)                                                            \
 
 #define TST_EXP_FAIL(SCALL, ERRNO, ...)                                        \
 	do {                                                                   \
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
