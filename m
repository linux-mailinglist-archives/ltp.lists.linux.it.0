Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970130ACCE
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 445D53C75F6
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 17:40:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EA7593C040C
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F40D71400C52
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 17:39:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4926EAF96
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 16:39:49 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Feb 2021 17:39:46 +0100
Message-Id: <20210201163948.24783-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201163948.24783-1-mdoucha@suse.cz>
References: <20210201163948.24783-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] Add safe functions for io_uring to LTP library
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_safe_io_uring.h |  63 +++++++++++++++++++++
 lib/tst_safe_io_uring.c     | 108 ++++++++++++++++++++++++++++++++++++
 2 files changed, 171 insertions(+)
 create mode 100644 include/tst_safe_io_uring.h
 create mode 100644 lib/tst_safe_io_uring.c

diff --git a/include/tst_safe_io_uring.h b/include/tst_safe_io_uring.h
new file mode 100644
index 000000000..fa416e35c
--- /dev/null
+++ b/include/tst_safe_io_uring.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) Linux Test Project, 2021
+ */
+
+#ifndef TST_IO_URING_H__
+#define TST_IO_URING_H__
+
+#include "config.h"
+#include "lapi/io_uring.h"
+
+struct tst_io_uring {
+	int fd;
+	void *sqr_base, *cqr_base;
+	/* buffer sizes in bytes for unmapping */
+	size_t sqr_mapsize, cqr_mapsize;
+
+	/* Number of entries in the ring buffers */
+	uint32_t sqr_size, cqr_size;
+
+	/* Submission queue pointers */
+	struct io_uring_sqe *sqr_entries;
+	const uint32_t *sqr_head, *sqr_mask, *sqr_flags, *sqr_dropped;
+	uint32_t *sqr_tail, *sqr_array;
+
+	/* Completion queue pointers */
+	const struct io_uring_cqe *cqr_entries;
+	const uint32_t *cqr_tail, *cqr_mask, *cqr_overflow;
+	uint32_t *cqr_head;
+
+};
+
+/*
+ * Call io_uring_setup() with given arguments and prepare memory mappings
+ * into the tst_io_uring structure passed in the third argument.
+ */
+#define SAFE_IO_URING_INIT(entries, params, uring) \
+	safe_io_uring_init(__FILE__, __LINE__, (entries), (params), (uring))
+int safe_io_uring_init(const char *file, const int lineno,
+	unsigned int entries, struct io_uring_params *params,
+	struct tst_io_uring *uring);
+
+/*
+ * Release io_uring mappings and close the file descriptor. uring->fd will
+ * be set to -1 after close.
+ */
+#define SAFE_IO_URING_CLOSE(uring) \
+	safe_io_uring_close(__FILE__, __LINE__, (uring))
+int safe_io_uring_close(const char *file, const int lineno,
+	struct tst_io_uring *uring);
+
+/*
+ * Call io_uring_enter() and check for errors. The "strict" argument controls
+ * pedantic check whether return value is equal to "to_submit" argument.
+ */
+#define SAFE_IO_URING_ENTER(strict, fd, to_submit, min_complete, flags, sig) \
+	safe_io_uring_enter(__FILE__, __LINE__, (strict), (fd), (to_submit), \
+		(min_complete), (flags), (sig))
+int safe_io_uring_enter(const char *file, const int lineno, int strict,
+	int fd, unsigned int to_submit, unsigned int min_complete,
+	unsigned int flags, sigset_t *sig);
+
+#endif /* TST_IO_URING_H__ */
diff --git a/lib/tst_safe_io_uring.c b/lib/tst_safe_io_uring.c
new file mode 100644
index 000000000..f300fd38c
--- /dev/null
+++ b/lib/tst_safe_io_uring.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_safe_io_uring.h"
+
+int safe_io_uring_init(const char *file, const int lineno,
+	unsigned int entries, struct io_uring_params *params,
+	struct tst_io_uring *uring)
+{
+	errno = 0;
+	uring->fd = io_uring_setup(entries, params);
+
+	if (uring->fd == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"io_uring_setup() failed");
+		return uring->fd;
+	} else if (uring->fd < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"io_uring_setup() returned invalid value %d",
+			uring->fd);
+		return uring->fd;
+	}
+
+	uring->sqr_size = params->sq_entries;
+	uring->cqr_size = params->cq_entries;
+	uring->sqr_mapsize = params->sq_off.array +
+		params->sq_entries * sizeof(__u32);
+	uring->cqr_mapsize = params->cq_off.cqes +
+		params->cq_entries * sizeof(struct io_uring_cqe);
+
+	uring->sqr_base = safe_mmap(file, lineno, NULL, uring->sqr_mapsize,
+		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
+		IORING_OFF_SQ_RING);
+
+	if (uring->sqr_base == MAP_FAILED)
+		return -1;
+
+	uring->sqr_entries = safe_mmap(file, lineno, NULL,
+		params->sq_entries * sizeof(struct io_uring_sqe),
+		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
+		IORING_OFF_SQES);
+
+	if (uring->sqr_entries == MAP_FAILED)
+		return -1;
+
+	uring->cqr_base = safe_mmap(file, lineno, NULL, uring->cqr_mapsize,
+		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
+		IORING_OFF_CQ_RING);
+
+	if (uring->cqr_base == MAP_FAILED)
+		return -1;
+
+	uring->sqr_head = uring->sqr_base + params->sq_off.head;
+	uring->sqr_tail = uring->sqr_base + params->sq_off.tail;
+	uring->sqr_mask = uring->sqr_base + params->sq_off.ring_mask;
+	uring->sqr_flags = uring->sqr_base + params->sq_off.flags;
+	uring->sqr_dropped = uring->sqr_base + params->sq_off.dropped;
+	uring->sqr_array = uring->sqr_base + params->sq_off.array;
+
+	uring->cqr_head = uring->cqr_base + params->cq_off.head;
+	uring->cqr_tail = uring->cqr_base + params->cq_off.tail;
+	uring->cqr_mask = uring->cqr_base + params->cq_off.ring_mask;
+	uring->cqr_overflow = uring->cqr_base + params->cq_off.overflow;
+	uring->cqr_entries = uring->cqr_base + params->cq_off.cqes;
+	return uring->fd;
+}
+
+int safe_io_uring_close(const char *file, const int lineno,
+	struct tst_io_uring *uring)
+{
+	int ret;
+
+	safe_munmap(file, lineno, NULL, uring->cqr_base, uring->cqr_mapsize);
+	safe_munmap(file, lineno, NULL, uring->sqr_entries,
+		uring->sqr_size * sizeof(struct io_uring_sqe));
+	safe_munmap(file, lineno, NULL, uring->sqr_base, uring->sqr_mapsize);
+	ret = safe_close(file, lineno, NULL, uring->fd);
+	uring->fd = -1;
+	return ret;
+}
+
+int safe_io_uring_enter(const char *file, const int lineno, int strict,
+	int fd, unsigned int to_submit, unsigned int min_complete,
+	unsigned int flags, sigset_t *sig)
+{
+	int ret;
+
+	errno = 0;
+	ret = io_uring_enter(fd, to_submit, min_complete, flags, sig);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"io_uring_enter() failed");
+	} else if (ret < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid io_uring_enter() return value %d", ret);
+	} else if (strict && to_submit != (unsigned int)ret) {
+		tst_brk_(file, lineno, TBROK,
+			"io_uring_enter() submitted %d items (expected %d)",
+			ret, to_submit);
+	}
+
+	return ret;
+}
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
