Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C070141CE4
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 08:50:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5F583C238B
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 08:50:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0E86E3C23CD
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 08:49:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6B5E160076D
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 08:49:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,337,1574092800"; d="scan'208";a="82258424"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 15:49:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id C4474406AB15
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 15:40:34 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 15:49:46 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sun, 19 Jan 2020 15:49:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sun, 19 Jan 2020 15:49:58 +0800
Message-ID: <1579420198-29651-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579420198-29651-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1579420198-29651-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C4474406AB15.AB7D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/add_key01: remove duplicated case
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

Since add_key05.c has covered this test point, remove it.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 -
 testcases/kernel/syscalls/add_key/.gitignore  |  1 -
 testcases/kernel/syscalls/add_key/add_key01.c | 26 -------------------
 3 files changed, 28 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/add_key/add_key01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 830dfc8b7..04db95cf5 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -14,7 +14,6 @@ access04 access04
 acct01 acct01
 acct02 acct02
 
-add_key01 add_key01
 add_key02 add_key02
 add_key03 add_key03
 add_key04 add_key04
diff --git a/testcases/kernel/syscalls/add_key/.gitignore b/testcases/kernel/syscalls/add_key/.gitignore
index f57dc2228..49acda06b 100644
--- a/testcases/kernel/syscalls/add_key/.gitignore
+++ b/testcases/kernel/syscalls/add_key/.gitignore
@@ -1,4 +1,3 @@
-/add_key01
 /add_key02
 /add_key03
 /add_key04
diff --git a/testcases/kernel/syscalls/add_key/add_key01.c b/testcases/kernel/syscalls/add_key/add_key01.c
deleted file mode 100644
index 4fe97dac6..000000000
--- a/testcases/kernel/syscalls/add_key/add_key01.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) Crackerjack Project., 2007
- * Porting from Crackerjack to LTP is done by
- * Manas Kumar Nayak maknayak@in.ibm.com>
- *
- * Basic test for the add_key() syscall.
- */
-
-#include <errno.h>
-
-#include "tst_test.h"
-#include "lapi/keyctl.h"
-
-static void verify_add_key(void)
-{
-	TEST(add_key("keyring", "wjkey", NULL, 0, KEY_SPEC_THREAD_KEYRING));
-	if (TST_RET == -1)
-		tst_res(TFAIL | TTERRNO, "add_key call failed");
-	else
-		tst_res(TPASS, "add_key call succeeded");
-}
-
-static struct tst_test test = {
-	.test_all = verify_add_key,
-};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
