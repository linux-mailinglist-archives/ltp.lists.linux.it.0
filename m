Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA0264249
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 11:35:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F79D3C2C7C
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 11:35:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0AF0D3C262C
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 11:35:42 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2423C600BB4
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 11:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599730539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+dqnuodMwfJS4BdUyXOVm6Xu7Tzmd16mPz1Lqa1ktqo=;
 b=bXTZtgzUXcUya3Ft3AiST5Aosmp/8x5oUwP6eutmTF6YLSZiDEaT7gBSy0NIfdFzYJLI7S
 4U0QV46MdJGxi2etRObMim2zoIfFD/r3+eXOesNV836HiVN9wi9lpLKZnp5xk/oefLMgJF
 6NiaHgRcV7PDExUl4v0sx/jic5a5nuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-dxWa4ps6NR2nxQekEiPb9g-1; Thu, 10 Sep 2020 05:35:37 -0400
X-MC-Unique: dxWa4ps6NR2nxQekEiPb9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08686802B6C;
 Thu, 10 Sep 2020 09:35:36 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58A671002D59;
 Thu, 10 Sep 2020 09:35:33 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 10 Sep 2020 09:35:32 +0000
Message-Id: <20200910093532.20223-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: pravin <pravinraghul@zilogic.com>

We assign the memory region allocated using MAP_GROWSDOWN to a thread,
as a stack, to test the effect of MAP_GROWSDOWN. This is because the
kernel only grows the memory region when the stack pointer, is within
guard page, when the guard page is touched.

  1. Map an anyonymous memory region of size X, and unmap it.
  2. Split the unmapped memory region into two.
  3. The lower memory region is left unmapped.
  4. The higher memory region is mapped for use as stack, using MAP_FIXED | MAP_GROWSDOWN.
  5. The higher memory region is provided as stack to a thread, where
     a recursive function is invoked.
  6. The stack grows beyond the allocated region, into the lower memory area.
  7. If this results in the memory region being extended, into the
     unmapped region, the test is considered to have passed.

Resolves #300
Signed-off-by: Pravin Raghul S. <pravinraghul@zilogic.com>
Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---

Notes:
    V4:
      - add stack_guard_gap variable
      - use __attribute__((noinline)) to prevent function optimization
      - add 256 pages as the stack_guard_gap to let grows safely
      - prepare the stack into a single function named allocate_stack()
    
    Btw, patch v4 get passed on RHEL8(x86_64, s390x, aarch64) and RHEL7(x86_64).

 runtest/syscalls                          |   1 +
 testcases/kernel/syscalls/mmap/.gitignore |   1 +
 testcases/kernel/syscalls/mmap/mmap18.c   | 156 ++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mmap/mmap18.c

diff --git a/runtest/syscalls b/runtest/syscalls
index dc0ca5626..ed86bb593 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -747,6 +747,7 @@ mmap14 mmap14
 mmap15 mmap15
 mmap16 mmap16
 mmap17 mmap17
+mmap18 mmap18
 
 modify_ldt01 modify_ldt01
 modify_ldt02 modify_ldt02
diff --git a/testcases/kernel/syscalls/mmap/.gitignore b/testcases/kernel/syscalls/mmap/.gitignore
index c5c083d4b..4fd90ab5f 100644
--- a/testcases/kernel/syscalls/mmap/.gitignore
+++ b/testcases/kernel/syscalls/mmap/.gitignore
@@ -16,3 +16,4 @@
 /mmap15
 /mmap16
 /mmap17
+/mmap18
diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
new file mode 100644
index 000000000..ea02432da
--- /dev/null
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
+ * Email: code@zilogic.com
+ */
+
+/*
+ * Test mmap() MAP_GROWSDOWN flag
+ *
+ * We assign the memory region allocated using MAP_GROWSDOWN to a thread,
+ * as a stack, to test the effect of MAP_GROWSDOWN. This is because the
+ * kernel only grows the memory region when the stack pointer, is within
+ * guard page, when the guard page is touched.
+ *
+ * 1. Map an anyonymous memory region of size X, and unmap it.
+ * 2. Split the unmapped memory region into two.
+ * 3. The lower memory region is left unmapped.
+ * 4. The higher memory region is mapped for use as stack, using
+ *    MAP_FIXED | MAP_GROWSDOWN.
+ * 5. The higher memory region is provided as stack to a thread, where
+ *    a recursive function is invoked.
+ * 6. The stack grows beyond the allocated region, into the lower memory area.
+ * 7. If this results in the memory region being extended, into the
+ *    unmapped region, the test is considered to have passed.
+ */
+
+#include <unistd.h>
+#include <pthread.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include <sys/types.h>
+#include <stdlib.h>
+#include <stdbool.h>
+
+#include "tst_test.h"
+#include "tst_safe_pthread.h"
+
+#define UNITS(x) ((x) * PTHREAD_STACK_MIN)
+
+static void *stack;
+static long stack_size = UNITS(8);
+
+static bool __attribute__((noinline)) check_stackgrow_up(void)
+{
+	char local_var;
+	static char *addr;
+
+       if (!addr) {
+               addr = &local_var;
+               return check_stackgrow_up();
+       }
+
+       return (addr < &local_var);
+}
+
+static void setup(void)
+{
+	if (check_stackgrow_up())
+		tst_brk(TCONF, "Test can't be performed with stack grows up architecture");
+}
+
+static void cleanup(void)
+{
+	if (stack)
+		SAFE_MUNMAP(stack, stack_size);
+}
+
+static void allocate_stack(size_t size)
+{
+	void *start;
+
+	/*
+	 * Since the newer kernel does not allow a MAP_GROWSDOWN mapping to grow
+	 * closer than 'stack_guard_gap' pages away from a preceding mapping.
+	 * The guard then ensures that the next-highest mapped page remains more
+	 * than 'stack_guard_gap' below the lowest stack address, and if not then
+	 * it will trigger a segfault. So, here adding 256 pages memory spacing
+	 * for stack growing safely.
+	 *
+	 * Btw, kernel default 'stack_guard_gap' size is '256 * getpagesize()'.
+	 */
+	long total_size = 256 * getpagesize() + size * 2;
+
+	start = SAFE_MMAP(NULL, total_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	SAFE_MUNMAP(start, total_size);
+
+	/* start                             stack
+	 * +-----------+---------------------+----------------------+
+	 * | 256 pages | unmapped (size)     | mapped (size)        |
+	 * +-----------+---------------------+----------------------+
+	 *
+	 */
+	stack = SAFE_MMAP((start + total_size - size), size, PROT_READ | PROT_WRITE,
+			  MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,
+			  -1, 0);
+
+	tst_res(TINFO, "start = %p, stack = %p", start, stack);
+}
+
+static __attribute__((noinline)) void *check_depth_recursive(void *limit)
+{
+	if ((off_t) &limit < (off_t) limit) {
+		tst_res(TINFO, "&limit = %p, limit = %p", &limit, limit);
+		return NULL;
+	}
+
+	return check_depth_recursive(limit);
+}
+
+static void grow_stack(void *stack, size_t size, void *limit)
+{
+	pthread_t test_thread;
+	pthread_attr_t attr;
+	int ret;
+
+	ret = pthread_attr_init(&attr);
+	if (ret)
+		tst_brk(TBROK, "pthread_attr_init failed during setup");
+
+	ret = pthread_attr_setstack(&attr, stack, size);
+	if (ret)
+		tst_brk(TBROK, "pthread_attr_setstack failed during setup");
+
+	SAFE_PTHREAD_CREATE(&test_thread, &attr, check_depth_recursive, limit);
+	SAFE_PTHREAD_JOIN(test_thread, NULL);
+
+	exit(0);
+}
+
+static void run_test(void)
+{
+	pid_t child_pid;
+	int wstatus;
+
+	allocate_stack(stack_size);
+
+	child_pid = SAFE_FORK();
+	if (!child_pid)
+		grow_stack(stack, stack_size, stack - stack_size + UNITS(1));
+
+	SAFE_WAIT(&wstatus);
+	if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)
+		tst_res(TPASS, "Stack grows in unmapped region");
+	else if (WIFSIGNALED(wstatus))
+		tst_res(TFAIL, "Child killed by %s", tst_strsig(WTERMSIG(wstatus)));
+	else
+		tst_res(TFAIL, "Child %s", tst_strstatus(wstatus));
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run_test,
+	.forks_child = 1,
+};
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
