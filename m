Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA22F075F
	for <lists+linux-ltp@lfdr.de>; Sun, 10 Jan 2021 14:15:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B09C3C6473
	for <lists+linux-ltp@lfdr.de>; Sun, 10 Jan 2021 14:15:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6F7C83C288A
 for <ltp@lists.linux.it>; Sun, 10 Jan 2021 14:14:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4F62620035F
 for <ltp@lists.linux.it>; Sun, 10 Jan 2021 14:14:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,336,1602518400"; d="scan'208";a="103338664"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jan 2021 21:14:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 177114CE5CE7;
 Sun, 10 Jan 2021 21:14:46 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 10 Jan 2021 21:14:47 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Sun, 10 Jan 2021 21:14:46 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Sun, 10 Jan 2021 21:04:36 +0800
Message-ID: <20210110130436.9514-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210110130436.9514-1-yangx.jy@cn.fujitsu.com>
References: <X/R/2VVe1dJxGhHN@yuki.lan>
 <20210110130436.9514-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 177114CE5CE7.AC9F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 2/2] syscalls/access02.c: Take use of
 TST_EXP_SILENT_PASS
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

Current TST_EXP_PASS macro reports the double passed for one subtest:
--------------------------------------------
tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
access02.c:62: TPASS: access(file_f, F_OK) as root passed
access02.c:141: TPASS: access(file_f, F_OK) as root behaviour is correct.
--------------------------------------------

It is just a minor cleanup rather than a fix.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/access/access02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/access/access02.c b/testcases/kernel/syscalls/access/access02.c
index ff3e7b6f4..19bf87c54 100644
--- a/testcases/kernel/syscalls/access/access02.c
+++ b/testcases/kernel/syscalls/access/access02.c
@@ -59,7 +59,7 @@ static void access_test(struct tcase *tc, const char *user)
 	struct stat stat_buf;
 	char command[64];
 
-	TST_EXP_PASS(access(tc->pathname, tc->mode),
+	TST_EXP_SILENT_PASS(access(tc->pathname, tc->mode),
 	             "access(%s, %s) as %s", tc->pathname, tc->name, user);
 
 	if (!TST_PASS)
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
