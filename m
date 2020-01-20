Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBA142C31
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:37:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0C9B3C234F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:37:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1F2CB3C0EAF
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:36:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 303D06011AE
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:36:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97307ADEE;
 Mon, 20 Jan 2020 13:36:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 Jan 2020 14:36:45 +0100
Message-Id: <20200120133646.8629-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] socketcall01: Use tst_syscall() instead of custom
 syscall support detection
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

Besides it's always better to use API functions instead of
reimplementing a wheel it's also needed to fix regression in detecting
socketcall() syscall support for archs which does not support it (e.g.
x86_64, ARM):

socketcall01.c:42: FAIL: socketcall() for TCP stream failed with -1: ENOSYS (38)
socketcall01.c:42: FAIL: socketcall() for unix domain dgram failed with -1: ENOSYS (38)
socketcall01.c:42: FAIL: socketcall() for Raw socket failed with -1: ENOSYS (38)
socketcall01.c:42: FAIL: socketcall() for UDP dgram failed with -1: ENOSYS (38)

Fixes: 9e83513eb "tst_device.h: Use lapi/syscalls.h instead of <sys/syscall.h>"
Fixes: #634

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../kernel/syscalls/socketcall/socketcall01.c   | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/socketcall/socketcall01.c b/testcases/kernel/syscalls/socketcall/socketcall01.c
index a8f6649a6..48e818846 100644
--- a/testcases/kernel/syscalls/socketcall/socketcall01.c
+++ b/testcases/kernel/syscalls/socketcall/socketcall01.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *    AUTHOR : sowmya adiga<sowmya.adiga@wipro.com>
+ * Author: sowmya adiga <sowmya.adiga@wipro.com>
  * Copyright (c) 2016 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) Linux Test Project, 2017-2020
  */
 /*
  * This is a basic test for the socketcall(2) system call.
@@ -11,16 +12,12 @@
 #include <errno.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/syscall.h>
 #include <linux/net.h>
 #include <sys/un.h>
 #include <netinet/in.h>
 
 #include "tst_test.h"
-
-#ifdef __NR_socketcall
-
-#define socketcall(call, args) syscall(__NR_socketcall, call, args)
+#include "lapi/syscalls.h"
 
 struct test_case_t {
 	int call;
@@ -35,7 +32,7 @@ struct test_case_t {
 
 void verify_socketcall(unsigned int i)
 {
-	TEST(socketcall(TC[i].call, TC[i].args));
+	TEST(tst_syscall(__NR_socketcall, TC[i].call, TC[i].args));
 
 	if (TST_RET < 0) {
 		tst_res(TFAIL | TTERRNO, "socketcall() for %s failed with %li",
@@ -53,9 +50,3 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(TC),
 	.needs_root = 1,
 };
-
-#else
-
-TST_TEST_TCONF("The socketcall() syscall is not supported");
-
-#endif
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
