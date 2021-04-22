Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC574367A6A
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 08:58:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D4333C6AD5
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 08:58:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CCC23C0EFF
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 08:57:36 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5E788100096E
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 08:57:35 +0200 (CEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FQp8F0Xz1z16Lfc
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 14:55:09 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 22 Apr 2021 14:57:23 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 22 Apr 2021 14:57:31 +0800
Message-ID: <20210422065732.61222-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422065732.61222-1-xieziyao@huawei.com>
References: <20210422065732.61222-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
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

1. Convert tkill01 to the new API;
2. Capture signals to verify success, while the previous code
didn't make it work.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/tkill/tkill01.c | 122 +++++++---------------
 1 file changed, 38 insertions(+), 84 deletions(-)

diff --git a/testcases/kernel/syscalls/tkill/tkill01.c b/testcases/kernel/syscalls/tkill/tkill01.c
index 20c28f1bc..094b0d942 100644
--- a/testcases/kernel/syscalls/tkill/tkill01.c
+++ b/testcases/kernel/syscalls/tkill/tkill01.c
@@ -1,42 +1,18 @@
-/******************************************************************************/
-/* Copyright (c) Crackerjack Project., 2007				   */
-/*									    */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or	  */
-/* (at your option) any later version.					*/
-/*									    */
-/* This program is distributed in the hope that it will be useful,	    */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of	    */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See		  */
-/* the GNU General Public License for more details.			   */
-/*									    */
-/* You should have received a copy of the GNU General Public License	  */
-/* along with this program;  if not, write to the Free Software	       */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
-/*									    */
-/******************************************************************************/
-/******************************************************************************/
-/*									    */
-/* File:	tkill01.c					   */
-/*									    */
-/* Description: This tests the tkill() syscall		      */
-/*									    */
-/* Usage:  <for command-line>						 */
-/* tkill01 [-c n] [-e][-i n] [-I x] [-p x] [-t]		     */
-/*      where,  -c n : Run n copies concurrently.			     */
-/*	      -e   : Turn on errno logging.				 */
-/*	      -i n : Execute test n times.				  */
-/*	      -I x : Execute test for x seconds.			    */
-/*	      -P x : Pause for x seconds between iterations.		*/
-/*	      -t   : Turn on syscall timing.				*/
-/*									    */
-/* Total Tests: 1							     */
-/*									    */
-/* Test Name:   tkill01					     */
-/* History:     Porting from Crackerjack to LTP is done by		    */
-/*	      Manas Kumar Nayak maknayak@in.ibm.com>			*/
-/******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Basic tests for the tkill syscall.
+ *
+ * [Algorithm]
+ *
+ * Calls tkill and capture signals to verify success.
+ */

 #include <stdio.h>
 #include <stdlib.h>
@@ -48,59 +24,37 @@
 #include <linux/unistd.h>
 #include <sys/types.h>

-#include "test.h"
 #include "lapi/syscalls.h"
+#include "tst_test.h"

-char *TCID = "tkill01";
-int testno;
-int TST_TOTAL = 2;
+int sig_flag = 0;

-void cleanup(void)
+static void sighandler(int sig)
 {
-
-	tst_rmdir();
-}
-
-void setup(void)
-{
-	TEST_PAUSE;
-	tst_tmpdir();
+	if (sig == SIGUSR1)
+		sig_flag = 1;
 }

-int sig_count = 0;
-
-void sig_action(int sig)
-{
-	sig_count = 1;
-}
-
-int main(int ac, char **av)
+static void run(void)
 {
 	int tid;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);

-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-		for (testno = 0; testno < TST_TOTAL; ++testno) {
-			if (signal(SIGUSR1, &sig_action) == SIG_ERR)
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "signal(SIGUSR1, ..) failed");
-			TEST(tid = ltp_syscall(__NR_gettid));
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO, "tkill failed");
-			}
-			TEST(ltp_syscall(__NR_tkill, tid, SIGUSR1));
-			if (TEST_RETURN == 0) {
-				tst_resm(TPASS, "tkill call succeeded");
-			} else {
-				tst_resm(TFAIL | TTERRNO, "tkill failed");
-			}
-		}
+	SAFE_SIGNAL(SIGUSR1, sighandler);
+	TEST(tid = tst_syscall(__NR_gettid));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "tst_syscall(__NR_gettid) failed");
+
+	TEST(tst_syscall(__NR_tkill, tid, SIGUSR1));
+	if (TST_RET == 0) {
+		while (!sig_flag);
+		tst_res(TPASS, "tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			"tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
 	}
-	cleanup();
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
