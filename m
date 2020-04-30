Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE71BF4A4
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:58:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FD5C3C5E5D
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 11:58:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EF6003C26DA
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:39 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id ED3C160195A
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 11:58:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,334,1583164800"; d="scan'208";a="90855852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 17:58:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id B08CB4BCC898
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 17:58:25 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 17:58:25 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 30 Apr 2020 17:58:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 30 Apr 2020 17:58:22 +0800
Message-ID: <1588240704-14747-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200429120609.GA668@yuki.lan>
References: <20200429120609.GA668@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B08CB4BCC898.AEAF2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] lib/tst_assert: print correct file and lineno
 when parsing failed
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

Use safe_file_scanf instead of SAFE_FILE_SCANF, so we can pass correct
file and lineno. ie prctl05.c

Before this patch, fail as below:
safe_file_ops.c:142: BROK: Failed to open FILE '/proc/self/comm1' for reading at tst_assert.c:29: ENOENT (2)

After this patch, fail as below:
safe_file_ops.c:142: BROK: Failed to open FILE '/proc/self/comm1' for reading at prctl05.c:63: ENOENT (2)

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 lib/tst_assert.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_assert.c b/lib/tst_assert.c
index 8ef3cd72e..f05aea222 100644
--- a/lib/tst_assert.c
+++ b/lib/tst_assert.c
@@ -12,7 +12,7 @@ void tst_assert_int(const char *file, const int lineno, const char *path, int va
 {
 	int sys_val;
 
-	SAFE_FILE_SCANF(path, "%d", &sys_val);
+	safe_file_scanf(file, lineno, NULL, path, "%d", &sys_val);
 
 	if (val == sys_val) {
 		tst_res_(file, lineno, TPASS, "%s = %d", path, val);
@@ -26,7 +26,7 @@ void tst_assert_str(const char *file, const int lineno, const char *path, const
 {
 	char sys_val[1024];
 
-	SAFE_FILE_SCANF(path, "%1024s", sys_val);
+	safe_file_scanf(file, lineno, NULL, path, "%1024s", sys_val);
 	if (!strcmp(val, sys_val)) {
 		tst_res_(file, lineno, TPASS, "%s = '%s'", path, val);
 		return;
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
