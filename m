Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A28002F261D
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D0963C7FFA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AC26D3C5FD5
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DA2DB1A003F4
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:48 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="103381973"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 10:12:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DF98B4CE602E;
 Tue, 12 Jan 2021 10:12:42 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 10:12:38 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 12 Jan 2021 10:12:39 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 12 Jan 2021 10:02:26 +0800
Message-ID: <20210112020227.11775-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
References: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: DF98B4CE602E.A9A57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] syscalls/open01.c: Take use of
 TST_EXP_FD_SILENT
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

Current TST_EXP_FD macro reports the double passed for
one subtest, for example:
--------------------------------------------
./open01
tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
open01.c:48: TPASS: open() with sticky bit returned fd 3
open01.c:59: TPASS: sticky bit is set as expected
open01.c:48: TPASS: open() with sirectory bit returned fd 3
open01.c:59: TPASS: sirectory bit is set as expected

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
--------------------------------------------

It is just a minor cleanup rather than a fix.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/open/open01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
index 2f0ad550a..baf73ab11 100644
--- a/testcases/kernel/syscalls/open/open01.c
+++ b/testcases/kernel/syscalls/open/open01.c
@@ -45,7 +45,7 @@ static void verify_open(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	struct stat buf;
 
-	TST_EXP_FD(open(tc->filename, tc->flag, tc->mode),
+	TST_EXP_FD_SILENT(open(tc->filename, tc->flag, tc->mode),
 	           "open() with %s", tc->desc);
 	if (!TST_PASS)
 		return;
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
