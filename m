Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E52D5D42
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:14:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 672433C7139
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:14:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1CB4D3C4B5F
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D67341000C37
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77FC4AE95
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 14:14:53 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Dec 2020 15:15:40 +0100
Message-Id: <20201210141548.10982-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210141548.10982-1-chrubis@suse.cz>
References: <20201210141548.10982-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 02/10] syscalls/uname: Make use of TST_EXP_MACROS
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/uname/uname01.c | 13 +++----------
 testcases/kernel/syscalls/uname/uname02.c | 17 +----------------
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/uname/uname01.c b/testcases/kernel/syscalls/uname/uname01.c
index bd3b05303..5e2f5ffac 100644
--- a/testcases/kernel/syscalls/uname/uname01.c
+++ b/testcases/kernel/syscalls/uname/uname01.c
@@ -18,24 +18,17 @@ static void verify_uname(void)
 
 	memset(&un, 0, sizeof(un));
 
-	TEST(uname(&un));
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "uname() failed");
-		return;
-	}
+	TST_EXP_PASS(uname(&un));
 
-	if (TST_RET != 0) {
-		tst_res(TFAIL | TTERRNO,
-			"uname() returned invalid value %ld", TST_RET);
+	if (!TST_PASS)
 		return;
-	}
 
 	if (strcmp(un.sysname, "Linux")) {
 		tst_res(TFAIL, "sysname is not Linux");
 		return;
 	}
 
-	tst_res(TPASS, "uname() succeeded");
+	tst_res(TPASS, "sysname set to Linux");
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/uname/uname02.c b/testcases/kernel/syscalls/uname/uname02.c
index 1903dae24..cd4b15487 100644
--- a/testcases/kernel/syscalls/uname/uname02.c
+++ b/testcases/kernel/syscalls/uname/uname02.c
@@ -16,22 +16,7 @@ static void *bad_addr;
 
 static void verify_uname(void)
 {
-	TEST(uname(bad_addr));
-	if (TST_RET == 0) {
-		tst_res(TFAIL, "uname() succeed when failure expected");
-		return;
-	}
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "Invalid uname() return value %ld", TST_RET);
-		return;
-	}
-
-	if (TST_ERR == EFAULT)
-		tst_res(TPASS, "uname() got EFAULT as expected");
-	else
-		tst_res(TFAIL | TTERRNO, "uname() failed unexpectedly");
-
+	TST_EXP_FAIL(uname(bad_addr), EFAULT);
 }
 
 static void setup(void)
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
