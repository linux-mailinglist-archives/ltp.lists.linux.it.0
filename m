Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 705641E9D5C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 07:37:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B4363C30A9
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 07:37:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C0C433C3078
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 07:37:20 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 007BD200B1D
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 07:37:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7FF1FB;
 Sun, 31 May 2020 22:37:17 -0700 (PDT)
Received: from a077208.arm.com (unknown [10.163.55.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 818C53F305;
 Sun, 31 May 2020 22:36:52 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
Date: Mon,  1 Jun 2020 11:05:50 +0530
Message-Id: <20200601053550.3848-1-vikas.kumar2@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V6] syscall: Add io_uring related tests
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
Cc: vikas.kumar2@arm.com, viresh.kumar@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Added asynchronous I/O API tests for io_uring_setup(), io_uring_register()
and io_uring_enter(). These tests intend to validate io_uring operations.

1. io_uring_setup() creates submission queue and completion queue to
   perform subsequent operations on the io_uring instance.
2. io_uring_register() registers user buffers in kernel for long term
   usese.
3. io_uring_enter() initiates I/O operations using the shared SQ and CQ
   queue.

Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
---
 include/lapi/io_uring.h                       |  12 ++
 testcases/kernel/syscalls/io_uring/Makefile   |   7 +
 .../kernel/syscalls/io_uring/io_uring01.c     | 196 ++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_uring/Makefile
 create mode 100644 testcases/kernel/syscalls/io_uring/io_uring01.c

diff --git a/include/lapi/io_uring.h b/include/lapi/io_uring.h
index 5fde58e22..8e47501a5 100644
--- a/include/lapi/io_uring.h
+++ b/include/lapi/io_uring.h
@@ -280,4 +280,16 @@ int io_uring_enter(int fd, unsigned int to_submit, unsigned int min_complete,
 }
 #endif /* HAVE_IO_URING_ENTER */
 
+void io_uring_setup_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 1, 0)) < 0) {
+		TEST(syscall(__NR_io_uring_setup, NULL, 0));
+		if (TST_RET != -1)
+			SAFE_CLOSE(TST_RET);
+		else if (TST_ERR == ENOSYS)
+			tst_brk(TCONF,
+				"Test not supported on kernel version < v5.1");
+	}
+}
+
 #endif /* IO_URING_H__ */
diff --git a/testcases/kernel/syscalls/io_uring/Makefile b/testcases/kernel/syscalls/io_uring/Makefile
new file mode 100644
index 000000000..94a19de2f
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2020 ARM Ltd.  All rights reserved.
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/io_uring/io_uring01.c b/testcases/kernel/syscalls/io_uring/io_uring01.c
new file mode 100644
index 000000000..92bf5cb44
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/io_uring01.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 ARM Ltd. All rights reserved.
+ * Author: Vikas Kumar <vikas.kumar2@arm.com>
+ *
+ * Tests for asynchronous I/O raw API i.e io_uring_setup(), io_uring_register()
+ * and io_uring_enter(). This tests validate basic API operation by creating a
+ * submission queue and a completion queue using io_uring_setup(). User buffer
+ * registered in the kernel for long term operation using io_uring_register().
+ * This tests initiates I/O operations with the help of io_uring_enter().
+ */
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <fcntl.h>
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/io_uring.h"
+
+#define QUEUE_DEPTH 1
+#define BLOCK_SZ    1024
+
+static struct tcase {
+	unsigned int setup_flags;
+	unsigned int register_opcode;
+	unsigned int enter_flags;
+} tcases[] = {
+	{IORING_SETUP_IOPOLL, IORING_REGISTER_BUFFERS, IORING_OP_READ_FIXED},
+};
+
+struct io_sq_ring {
+	unsigned int *head;
+	unsigned int *tail;
+	unsigned int *ring_mask;
+	unsigned int *ring_entries;
+	unsigned int *flags;
+	unsigned int *array;
+};
+
+struct io_cq_ring {
+	unsigned int *head;
+	unsigned int *tail;
+	unsigned int *ring_mask;
+	unsigned int *ring_entries;
+	struct io_uring_cqe *cqes;
+};
+
+struct submitter {
+	int ring_fd;
+	struct io_sq_ring sq_ring;
+	struct io_uring_sqe *sqes;
+	struct io_cq_ring cq_ring;
+};
+
+struct buff_info {
+	unsigned int buff_sz;
+	struct iovec iovecs[];
+};
+
+static struct submitter *s;
+static struct buff_info *bi;
+static sigset_t sig;
+
+static int setup_io_uring_test(struct submitter *s, struct tcase *tc)
+{
+	struct io_sq_ring *sring = &s->sq_ring;
+	struct io_cq_ring *cring = &s->cq_ring;
+	struct io_uring_params p;
+	void *ptr;
+
+	memset(&p, 0, sizeof(p));
+	p.flags |= tc->setup_flags;
+	s->ring_fd = io_uring_setup(QUEUE_DEPTH, &p);
+	if (s->ring_fd == -1) {
+		tst_res(TFAIL | TTERRNO, "io_uring_setup() failed");
+		return 1;
+	}
+
+	/* Submission queue ring buffer mapping */
+	ptr = SAFE_MMAP(0, p.sq_off.array +
+			p.sq_entries * sizeof(unsigned int),
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_POPULATE,
+			s->ring_fd, IORING_OFF_SQ_RING);
+	if (ptr == MAP_FAILED)
+		return 1;
+
+	/* Save global submission queue struct info */
+	sring->head = ptr + p.sq_off.head;
+	sring->tail = ptr + p.sq_off.tail;
+	sring->ring_mask = ptr + p.sq_off.ring_mask;
+	sring->ring_entries = ptr + p.sq_off.ring_entries;
+	sring->flags = ptr + p.sq_off.flags;
+	sring->array = ptr + p.sq_off.array;
+
+	/* Submission queue entries ring buffer mapping */
+	s->sqes = SAFE_MMAP(0, p.sq_entries *
+			sizeof(struct io_uring_sqe),
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_POPULATE,
+			s->ring_fd, IORING_OFF_SQES);
+	if (s->sqes == MAP_FAILED)
+		return 1;
+
+	/* Completion queue ring buffer mapping */
+	ptr = SAFE_MMAP(0,
+			p.cq_off.cqes + p.cq_entries *
+			sizeof(struct io_uring_cqe),
+			PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_POPULATE,
+			s->ring_fd, IORING_OFF_CQ_RING);
+	if (ptr == MAP_FAILED)
+		return 1;
+
+	/* Save global completion queue struct info */
+	cring->head = ptr + p.cq_off.head;
+	cring->tail = ptr + p.cq_off.tail;
+	cring->ring_mask = ptr + p.cq_off.ring_mask;
+	cring->ring_entries = ptr + p.cq_off.ring_entries;
+	cring->cqes = ptr + p.cq_off.cqes;
+
+	return 0;
+}
+
+static int submit_to_uring_sq(struct submitter *s, struct tcase *tc)
+{
+	unsigned int index = 0, tail = 0, next_tail = 0;
+	struct io_sq_ring *sring = &s->sq_ring;
+	struct io_uring_sqe *sqe;
+	void  *iov_base;
+	size_t iov_len;
+	int ret;
+
+	bi = SAFE_MALLOC(sizeof(*bi));
+	iov_len = BLOCK_SZ;
+	iov_base = SAFE_MALLOC(iov_len);
+	memset(iov_base, 0, iov_len);
+	bi->iovecs[index].iov_base = (void *)iov_base;
+	bi->iovecs[index].iov_len = (size_t)iov_len;
+
+	ret = io_uring_register(s->ring_fd, tc->register_opcode,
+				bi->iovecs, QUEUE_DEPTH);
+	if (ret != 0) {
+		tst_res(TFAIL | TTERRNO, "io_uring_register() failed");
+		return 1;
+	}
+
+	/* Submission queue entry addition to SQE ring buffer tail */
+	tail = *sring->tail;
+	next_tail = tail;
+	next_tail++;
+	index = tail & *s->sq_ring.ring_mask;
+	sqe = &s->sqes[index];
+	sqe->flags = 0;
+	sqe->opcode = tc->enter_flags;
+	sqe->addr = (unsigned long)bi->iovecs;
+	sqe->user_data = (unsigned long long)bi;
+	sring->array[index] = index;
+	tail = next_tail;
+
+	/* Kernel to notice the tail update */
+	if (*sring->tail != tail)
+		*sring->tail = tail;
+
+	ret =  io_uring_enter(s->ring_fd, 1, 1, IORING_ENTER_GETEVENTS, &sig);
+	if (ret < 0) {
+		tst_res(TFAIL | TTERRNO, "io_uring_enter() failed");
+		return 1;
+	}
+
+	return 0;
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	s = SAFE_MALLOC(sizeof(*s));
+	memset(s, 0, sizeof(*s));
+	if (setup_io_uring_test(s, tc)) {
+		tst_res(TFAIL | TTERRNO, "io_uring_setup error");
+		return;
+	}
+	if (submit_to_uring_sq(s, tc)) {
+		tst_res(TFAIL | TTERRNO, "io_uring_submit error");
+		return;
+	}
+	tst_res(TPASS, "functionality of io_uring API is correct");
+}
+
+static struct tst_test test = {
+	.setup = io_uring_setup_supported_by_kernel,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
+
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
