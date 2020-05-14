Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C41D382D
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 19:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D0933C5432
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 19:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 89E1B3C5446
 for <ltp@lists.linux.it>; Thu, 14 May 2020 19:28:59 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 358F320136A
 for <ltp@lists.linux.it>; Thu, 14 May 2020 19:28:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9D8D1042;
 Thu, 14 May 2020 10:28:56 -0700 (PDT)
Received: from a077208.arm.com (unknown [10.163.73.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346F33F71E;
 Thu, 14 May 2020 10:28:53 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 22:58:31 +0530
Message-Id: <20200514172831.27854-2-vikas.kumar2@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514172831.27854-1-vikas.kumar2@arm.com>
References: <20200514172831.27854-1-vikas.kumar2@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V4 1/1] syscall: Add io_uring test
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

Added Linux asynchronous I/O API Test for io_uring_setup(),
io_uring_register() and io_uring_enter().
This test will check io_uring api basic operation.

Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Cc: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/io_uring/Makefile   |   8 +
 .../kernel/syscalls/io_uring/io_uring01.c     | 191 ++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 testcases/kernel/syscalls/io_uring/Makefile
 create mode 100644 testcases/kernel/syscalls/io_uring/io_uring01.c

diff --git a/testcases/kernel/syscalls/io_uring/Makefile b/testcases/kernel/syscalls/io_uring/Makefile
new file mode 100644
index 000000000..24cd01ba8
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2020 ARM Embedded Technologies Private Ltd. All rights reserved.
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/io_uring/io_uring01.c b/testcases/kernel/syscalls/io_uring/io_uring01.c
new file mode 100644
index 000000000..d250b2966
--- /dev/null
+++ b/testcases/kernel/syscalls/io_uring/io_uring01.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 ARM Embedded Technologies Private Ltd.
+ * All rights reserved.
+ * Author: Vikas Kumar <vikas.kumar2@arm.com>
+ *
+ * Added Test for Linux asynchronous I/O raw API:
+ * io_uring_setup(), io_uring_register() and io_uring_enter().
+ */
+
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <fcntl.h>
+#include "config.h"
+#include "tst_test.h"
+#include "lapi/io_uring.h"
+
+static struct tcase{
+	int test_count;
+	int flag;
+} tcases[] = {{1, 0}, };
+
+#define QUEUE_DEPTH 1
+#define BLOCK_SZ    1024
+
+struct io_sq_ring {
+	unsigned *head;
+	unsigned *tail;
+	unsigned *ring_mask;
+	unsigned *ring_entries;
+	unsigned *flags;
+	unsigned *array;
+};
+
+struct io_cq_ring {
+	unsigned *head;
+	unsigned *tail;
+	unsigned *ring_mask;
+	unsigned *ring_entries;
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
+struct file_info {
+	off_t buff_sz;
+	struct iovec iovecs[];
+};
+
+struct submitter *s;
+struct file_info *fi;
+sigset_t sig;
+
+int setup_io_uring_test(struct submitter *s)
+{
+	struct io_sq_ring *sring = &s->sq_ring;
+	struct io_cq_ring *cring = &s->cq_ring;
+	struct io_uring_params p;
+	void *ptr;
+
+	memset(&p, 0, sizeof(p));
+	s->ring_fd = io_uring_setup(QUEUE_DEPTH, &p);
+	if (s->ring_fd == -1) {
+		tst_res(TFAIL | TTERRNO, "io_uring setup return error");
+		return 1;
+	}
+
+	//submission queue ring buffer mapping
+	ptr = SAFE_MMAP(0, p.sq_off.array + p.sq_entries * sizeof(__u32),
+		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
+		s->ring_fd, IORING_OFF_SQ_RING);
+	if (ptr == MAP_FAILED)
+		return 1;
+
+	// save global submission queue struct info
+	sring->head = ptr + p.sq_off.head;
+	sring->tail = ptr + p.sq_off.tail;
+	sring->ring_mask = ptr + p.sq_off.ring_mask;
+	sring->ring_entries = ptr + p.sq_off.ring_entries;
+	sring->flags = ptr + p.sq_off.flags;
+	sring->array = ptr + p.sq_off.array;
+
+	//submission queue entries ring buffer mapping
+	s->sqes = SAFE_MMAP(0, p.sq_entries * sizeof(struct io_uring_sqe),
+			PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
+			s->ring_fd, IORING_OFF_SQES);
+	if (s->sqes == MAP_FAILED)
+		return 1;
+
+	//completion queue ring buffer mapping
+	ptr = SAFE_MMAP(0,
+		p.cq_off.cqes + p.cq_entries * sizeof(struct io_uring_cqe),
+		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE,
+		s->ring_fd, IORING_OFF_CQ_RING);
+	if (ptr == MAP_FAILED)
+		return 1;
+
+	//save global completion queue struct info
+	cring->head = ptr + p.cq_off.head;
+	cring->tail = ptr + p.cq_off.tail;
+	cring->ring_mask = ptr + p.cq_off.ring_mask;
+	cring->ring_entries = ptr + p.cq_off.ring_entries;
+	cring->cqes = ptr + p.cq_off.cqes;
+
+	return 0;
+}
+
+int submit_to_uring_sq(struct submitter *s)
+{
+	unsigned index = 0, tail = 0, next_tail = 0;
+	struct io_sq_ring *sring = &s->sq_ring;
+	struct io_uring_sqe *sqe;
+	int ret;
+
+	fi = SAFE_MALLOC(sizeof(*fi));
+	if (!fi)
+		return 1;
+
+	fi->buff_sz = BLOCK_SZ;
+	fi->iovecs[index].iov_base = (void *)fi;
+	fi->iovecs[index].iov_len = (size_t)fi->buff_sz;
+
+	ret = io_uring_register(s->ring_fd, IORING_REGISTER_BUFFERS,
+			fi->iovecs, QUEUE_DEPTH);
+	if (ret != 0) {
+		tst_res(TFAIL | TTERRNO, "io_uring register return error");
+		return 1;
+	}
+
+	//Submission queue entry addition to the tail of the SQE ring buffer
+	next_tail = tail = *sring->tail;
+	next_tail++;
+	index = tail & *s->sq_ring.ring_mask;
+	sqe = &s->sqes[index];
+	sqe->flags = 0;
+	sqe->opcode = IORING_OP_NOP;
+	sqe->addr = (unsigned long) fi->iovecs;
+	sqe->user_data = (unsigned long long) fi;
+	sring->array[index] = index;
+	tail = next_tail;
+
+	//Kernel to notice the tail update
+	if (*sring->tail != tail)
+		*sring->tail = tail;
+
+	ret =  io_uring_enter(s->ring_fd, 1, 1, IORING_ENTER_GETEVENTS, &sig);
+	if (ret < 0) {
+		tst_res(TFAIL | TTERRNO, "io_uring enter return error");
+		return 1;
+	}
+
+	return 0;
+}
+
+static void setup(void)
+{
+	int ret;
+
+	s = SAFE_MALLOC(sizeof(*s));
+	if (!s)
+		return;
+
+	memset(s, 0, sizeof(*s));
+	ret = setup_io_uring_test(s);
+	if (ret)
+		tst_res(TFAIL | TTERRNO, "io_uring setup status: %d", ret);
+}
+
+static void run(void)
+{
+	int ret;
+
+	ret = submit_to_uring_sq(s);
+	if (ret)
+		tst_res(TFAIL | TTERRNO, "io_uring submit status: %d", ret);
+	else
+		tst_res(TPASS, "functionality of io_uring() is correct");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
