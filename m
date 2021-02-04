Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15330F2F2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:12:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC1793C7352
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 13:12:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9B8F33C015D
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E56A6601412
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 13:12:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="104197344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Feb 2021 20:12:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 543064CE6D8A;
 Thu,  4 Feb 2021 20:12:29 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Feb 2021 20:12:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <liwang@redhat.com>
Date: Thu, 4 Feb 2021 20:12:39 +0800
Message-ID: <1612440762-22389-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 543064CE6D8A.AB1BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/5] syscalls/mallopt01: Use tst_print_mallinfo api
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/mallopt/mallopt01.c | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/syscalls/mallopt/mallopt01.c b/testcases/kernel/syscalls/mallopt/mallopt01.c
index f799aaf9d..271079c12 100644
--- a/testcases/kernel/syscalls/mallopt/mallopt01.c
+++ b/testcases/kernel/syscalls/mallopt/mallopt01.c
@@ -12,10 +12,9 @@
  * Basic mallinfo() and mallopt() testing.
 \*/
 
-#include <malloc.h>
-
 #include "tst_test.h"
 #include "tst_safe_macros.h"
+#include "tst_mallinfo.h"
 
 #ifdef HAVE_MALLOPT
 
@@ -23,21 +22,6 @@
 
 struct mallinfo info;
 
-void print_mallinfo(void)
-{
-	tst_res(TINFO, "mallinfo structure:");
-	tst_res(TINFO, "mallinfo.arena = %d", info.arena);
-	tst_res(TINFO, "mallinfo.ordblks = %d", info.ordblks);
-	tst_res(TINFO, "mallinfo.smblks = %d", info.smblks);
-	tst_res(TINFO, "mallinfo.hblkhd = %d", info.hblkhd);
-	tst_res(TINFO, "mallinfo.hblks = %d", info.hblks);
-	tst_res(TINFO, "mallinfo.usmblks = %d", info.usmblks);
-	tst_res(TINFO, "mallinfo.fsmblks = %d", info.fsmblks);
-	tst_res(TINFO, "mallinfo.uordblks = %d", info.uordblks);
-	tst_res(TINFO, "mallinfo.fordblks = %d", info.fordblks);
-	tst_res(TINFO, "mallinfo.keepcost = %d", info.keepcost);
-}
-
 void test_mallopt(void)
 {
 	char *buf;
@@ -46,11 +30,11 @@ void test_mallopt(void)
 
 	info = mallinfo();
 	if (info.uordblks < 20480) {
-		print_mallinfo();
+		tst_print_mallinfo("Test uordblks", &info);
 		tst_res(TFAIL, "mallinfo() failed: uordblks < 20K");
 	}
 	if (info.smblks != 0) {
-		print_mallinfo();
+		tst_print_mallinfo("Test smblks", &info);
 		tst_res(TFAIL, "mallinfo() failed: smblks != 0");
 	}
 	if (info.uordblks >= 20480 && info.smblks == 0)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
