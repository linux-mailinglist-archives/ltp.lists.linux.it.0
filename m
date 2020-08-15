Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F012450AF
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Aug 2020 07:21:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B1783C3064
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Aug 2020 07:21:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EBA773C1C89
 for <ltp@lists.linux.it>; Sat, 15 Aug 2020 07:21:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4F9F01000C10
 for <ltp@lists.linux.it>; Sat, 15 Aug 2020 07:21:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,315,1592841600"; d="scan'208";a="98112502"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Aug 2020 13:21:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 3F60D4CE34E2
 for <ltp@lists.linux.it>; Sat, 15 Aug 2020 13:20:56 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 15 Aug 2020 13:20:57 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Sat, 15 Aug 2020 13:20:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sat, 15 Aug 2020 13:13:11 +0800
Message-ID: <20200815051312.25002-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3F60D4CE34E2.AC745
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] safe_macros: Add SAFE_SIGFILLSET()
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

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 include/tst_safe_macros.h |  5 +++++
 lib/tst_safe_macros.c     | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 45fd0500a..000381c4f 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -446,6 +446,11 @@ void safe_sigemptyset(const char *file, const int lineno,
 #define SAFE_SIGEMPTYSET(sigs) \
 	safe_sigemptyset(__FILE__, __LINE__, (sigs))
 
+void safe_sigfillset(const char *file, const int lineno,
+		     sigset_t *sigs);
+#define SAFE_SIGFILLSET(sigs) \
+	safe_sigfillset(__FILE__, __LINE__, (sigs))
+
 void safe_sigprocmask(const char *file, const int lineno,
                       int how, sigset_t *set, sigset_t *oldset);
 #define SAFE_SIGPROCMASK(how, set, oldset) \
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index f18cb4625..25c37dfd8 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -166,6 +166,16 @@ void safe_sigemptyset(const char *file, const int lineno,
 		tst_brk_(file, lineno, TBROK | TERRNO, "sigemptyset() failed");
 }
 
+void safe_sigfillset(const char *file, const int lineno,
+		     sigset_t *sigs)
+{
+	int rval;
+
+	rval = sigfillset(sigs);
+	if (rval == -1)
+		tst_brk_(file, lineno, TBROK | TERRNO, "sigfillset() failed");
+}
+
 static const char *strhow(int how)
 {
 	switch (how) {
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
