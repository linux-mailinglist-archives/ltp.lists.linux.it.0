Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59D2E9580
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 14:04:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8B983C6073
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 14:04:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7D5183C240A
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 14:04:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 253C660091A
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 14:04:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,474,1599494400"; d="scan'208";a="103168590"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 21:04:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 3AD8B4CE6020;
 Mon,  4 Jan 2021 21:04:25 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 21:04:26 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 4 Jan 2021 21:04:25 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Mon, 4 Jan 2021 20:54:23 +0800
Message-ID: <20210104125423.19183-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3AD8B4CE6020.AA540
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] include/tst_test_macros.h: Report TINFO when
 TST_EXP_FD() succeeded
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

In Summary output, avoid counting the double passed for one test:
-------------------------------------
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
-------------------------------------

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 include/tst_test_macros.h               | 2 +-
 lib/newlib_tests/test_macros01.c        | 3 ++-
 testcases/kernel/syscalls/open/open11.c | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index 3016d95c2..d1fc3cf70 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -64,7 +64,7 @@ extern void *TST_RET_PTR;
 			break;                                                 \
 		}                                                              \
                                                                                \
-		TST_MSGP_(TPASS, " returned fd %ld", TST_RET,                  \
+		TST_MSGP_(TINFO, " returned fd %ld", TST_RET,                  \
 		         #SCALL, ##__VA_ARGS__);                               \
                                                                                \
 		TST_PASS = 1;                                                  \
diff --git a/lib/newlib_tests/test_macros01.c b/lib/newlib_tests/test_macros01.c
index 9a920f8e4..9aa3885c7 100644
--- a/lib/newlib_tests/test_macros01.c
+++ b/lib/newlib_tests/test_macros01.c
@@ -30,7 +30,8 @@ static void do_test(void)
 	TST_EXP_FD(fail_fd(), "TEST DESCRIPTION");
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 	TST_EXP_FD(pass_fd(), "%s", "TEST DESCRIPTION PARAM");
-	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
+	if (TST_PASS)
+		tst_res(TPASS, "TST_PASS = %i", TST_PASS);
 	TST_EXP_FD(inval_val());
 	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
 }
diff --git a/testcases/kernel/syscalls/open/open11.c b/testcases/kernel/syscalls/open/open11.c
index ded384fa8..f7ac96d90 100644
--- a/testcases/kernel/syscalls/open/open11.c
+++ b/testcases/kernel/syscalls/open/open11.c
@@ -283,6 +283,8 @@ static void verify_open(unsigned int n)
 	} else if (tc[n].err == 0) {
 		TST_EXP_FD(open(tc[n].path, tc[n].flags, tc[n].mode),
 		           "%s", tc[n].desc);
+		if (TST_PASS)
+			tst_res(TPASS, "%s", tc[n].desc);
 	} else {
 		TEST(open(tc[n].path, tc[n].flags, tc[n].mode));
 		tst_res(TPASS, "%s", tc[n].desc);
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
