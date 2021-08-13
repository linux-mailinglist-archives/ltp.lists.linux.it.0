Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 233283EB163
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1AB13C67DE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BDC73C66F0
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:01 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B15572002DE
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:26:57 +0200 (CEST)
X-QQ-mid: bizesmtp42t1628839612twpd4b39
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:26:48 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: l6IKqkG+Nbm9G+CbtXygHInOvpMSOScm6MdnuEorjF9RivVbJRGwOtLJ+acjC
 wVcfok/VsCX9iGYkW/cW/E2qtRaytO7hLjF8ZNinFvVLxU6VU1DpBH27ayCjuHrLSNXozEq
 D+EtJIVUyg+kV/0aFHXoomiFC9rlmrj6QzEno/DnjVm3XLwXtbelLsbmHdUqoRUL7alkbaE
 BZjr3/GtfNvtq4SlfOJDAJ2RHwJ8Qx4aaEUHQB3nOHIOXxpQaHqkn7jWvWSDdqUlabB+fV2
 dnOtnIkhXOhFI+HBWgucQn1sg9qn0Cs3AtXizS7cTYxMSKg2l8e/nQUCmVVymBXDWAcv0pm
 giNCFa2qGv+0kdwRWURRlMEBP0bKQ==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:26:47 +0800
Message-Id: <20210813072647.21802-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] syscalls/clone04: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/clone/clone04.c b/testcases/kernel/syscalls/clone/clone04.c
index 647bde560..fba4f186c 100644
--- a/testcases/kernel/syscalls/clone/clone04.c
+++ b/testcases/kernel/syscalls/clone/clone04.c
@@ -1,110 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  * Copyright (c) 2012 Wanlong Gao <gaowanlong@cn.fujitsu.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- *
  */
- /*
-  *     Verify that,
-  *      clone(2) returns -1 and sets errno to EINVAL if
-  *     child stack is set to a zero value(NULL)
-  */

-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
+/*\
+ * [Description]
+ * Verify that,
+ * clone(2) returns -1 and sets errno to EINVAL if
+ * child stack is set to a zero value(NULL)
+ */

-#include <sched.h>
-#include <errno.h>
-#include <sys/wait.h>
-#include "test.h"
+#include <stdlib.h>
+#include "tst_test.h"
 #include "clone_platform.h"

-static void cleanup(void);
-static void setup(void);
-static int child_fn();
-
-static void *child_stack;
+static int child_fn(void *arg LTP_ATTRIBUTE_UNUSED);

-static struct test_case_t {
-	int (*child_fn) ();
-	void **child_stack;
+static struct tcase {
+	int (*child_fn)(void *arg);
+	void *child_stack;
 	int exp_errno;
 	char err_desc[10];
-} test_cases[] = {
-	{
-child_fn, NULL, EINVAL, "EINVAL"},};
+} tcases[] = {
+	{child_fn, NULL, EINVAL, "EINVAL"},
+};

-char *TCID = "clone04";
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+static int child_fn(void *arg LTP_ATTRIBUTE_UNUSED)
 {
-	int lc, ind;
-	void *test_stack;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (ind = 0; ind < TST_TOTAL; ind++) {
-			if (test_cases[ind].child_stack == NULL) {
-				test_stack = NULL;
-			} else if (*test_cases[ind].child_stack == NULL) {
-				tst_resm(TWARN, "Can not allocate stack for child, skipping test case");
-				continue;
-			} else {
-				test_stack = child_stack;
-			}
-
-			TEST(ltp_clone(0, test_cases[ind].child_fn, NULL,
-				       CHILD_STACK_SIZE, test_stack));
-
-			if ((TEST_RETURN == -1) &&
-			    (TEST_ERRNO == test_cases[ind].exp_errno)) {
-				tst_resm(TPASS, "expected failure; Got %s",
-					 test_cases[ind].err_desc);
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "Failed to produce expected error, expected errno: %d and result: -1, got result %ld",
-					 test_cases[ind].exp_errno, TEST_RETURN);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	exit(0);
 }

-static void setup(void)
+static void verify_clone(unsigned int nr)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+	struct tcase *tc = &tcases[nr];

-	child_stack = malloc(CHILD_STACK_SIZE);
+	TST_EXP_FAIL(ltp_clone(0, tc->child_fn, NULL,
+				CHILD_STACK_SIZE, tc->child_stack),
+				tc->exp_errno, "%s", tc->err_desc);
 }

-static void cleanup(void)
-{
-	free(child_stack);
-}
-
-static int child_fn(void)
-{
-	exit(1);
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_clone,
+};
\ No newline at end of file
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
