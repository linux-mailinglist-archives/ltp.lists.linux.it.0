Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6651DCB56
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA4CD3C4D5A
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D051F3C4D8D
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:48:04 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B7BDB140174B
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:48:00 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id n15so2859901pjt.4
 for <ltp@lists.linux.it>; Thu, 21 May 2020 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ghhi0GIgK5xUcFhmiiBnPHe9YL30adJssDeslHA/22k=;
 b=XR/Igm8Dd0khvbJcVsAnfU1h5aSd1lwvDHr/STeVxmA+gSdKfD9dwE0vM9JQw9DBs8
 zsrWxG1cFLILZEkTcveklYNysC/VMCVypM92dXixNHO7oeYfS1LzVBZBnfPKMe2khzcm
 QmSRxAaSt7YbQvbU7jYKm/1bFlGq3lbgaBCA9/sDWxzCdigNOgDKQ64MUtfD05cMu/d/
 7dZ7rYPmUjj6lQvgUTm/1ZqHmHBC6hwL7TCc763GZcusgdWYU9W2ZHKTykHIgI552EdA
 rGr2wba+W+jS2FJuuapx9h4mvn2Ws607DPg0635MDwOIiJhcAO82UPdfMMmLxAJi7ziG
 2/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ghhi0GIgK5xUcFhmiiBnPHe9YL30adJssDeslHA/22k=;
 b=pIt/VANZWMoTxFsSb1GW9rk2CIlqb56KkK9EhZ5FpnspzM55r2QnzELhRSNc0zOxTJ
 izx3siFaNq8Ah4FTG0lut/e2Of+ew/nI4qjfdY35R0QzjHCxEPkVZmr5FL5iMDxuIF5f
 Uks1L2GbbuGJkMMfQYeA2XKL5hnt3aH7Vp+clRW6k2/AS+26+0Lod14764hFUw9offbt
 NQXpNIr9qsrhFZr9t19LJ64d8tRo6yyZ8W2aCoeJQshYQtptDXj9o0ixzp+7bUas8GCr
 J4lyE13FKNDqEdmNw/lENEKN2q2dbYmRcUfYd/kE+Y0u8+mxavbCZfvYswPBnF47uGqi
 CLLw==
X-Gm-Message-State: AOAM532WqikMGDmEftidCOIUcSgs1NV+SwMzev92v5qXa10W0yQL3lua
 yL9gP+VMuyqrLJQw2VPf0uvq/ewXo1U=
X-Google-Smtp-Source: ABdhPJxwz/gcXyLEuSOMBaB4OX7DtlyKrvQAXJ0H0FVGNnK02D6JGpnK3SpISnvRLKjjbRYnR2IsgA==
X-Received: by 2002:a17:90a:2009:: with SMTP id
 n9mr9482175pjc.81.1590058078450; 
 Thu, 21 May 2020 03:47:58 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id f6sm4231079pfd.175.2020.05.21.03.47.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 03:47:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 21 May 2020 16:17:35 +0530
Message-Id: <55a85e8ef90f9f45ffa5ef77e922eb9b510cf24e.1590057824.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590057824.git.viresh.kumar@linaro.org>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] syscalls: shmctl: Add new test to verify the
 _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The _time_high fields must be reset by the kernel, add a test to verify
that.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac                                  |   1 +
 include/shmbuf.h                              | 273 ++++++++++++++++++
 runtest/syscalls                              |   1 +
 runtest/syscalls-ipc                          |   1 +
 .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
 testcases/kernel/syscalls/ipc/shmctl/Makefile |   7 +-
 .../kernel/syscalls/ipc/shmctl/shmctl06.c     |  51 ++++
 7 files changed, 333 insertions(+), 2 deletions(-)
 create mode 100644 include/shmbuf.h
 create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl06.c

diff --git a/configure.ac b/configure.ac
index c513fdf440c2..f1ee98b23cbe 100644
--- a/configure.ac
+++ b/configure.ac
@@ -152,6 +152,7 @@ AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
 AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
 AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
 AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
+AC_CHECK_TYPES([struct shmid64_ds],,,[#include <sys/shmbuf.h>])
 
 AC_CHECK_TYPES([struct mmsghdr],,,[
 #define _GNU_SOURCE
diff --git a/include/shmbuf.h b/include/shmbuf.h
new file mode 100644
index 000000000000..f8c1294c60d6
--- /dev/null
+++ b/include/shmbuf.h
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IPC_SHMBUF_H
+#define IPC_SHMBUF_H
+
+#include <linux/posix_types.h>
+#include <sys/sem.h>
+#include "tst_timer.h"
+#include "ipcbuf.h"
+
+#ifndef HAVE_SHMID64_DS
+
+#if defined(__mips__)
+#define HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for the MIPS architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * As MIPS was lacking proper padding after shm_?time, we use 48 bits
+ * of the padding at the end to store a few additional bits of the time.
+ * libc implementations need to take care to convert this into a proper
+ * data structure when moving to 64-bit time_t.
+ */
+
+#if defined(__arch64__)
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	long			shm_atime;	/* last attach time */
+	long			shm_dtime;	/* last detach time */
+	long			shm_ctime;	/* last change time */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused1;
+	unsigned long		__unused2;
+};
+#else
+#define HAVE_SHMID64_DS_TIME_HIGH
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_ctime;	/* last change time */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned short		shm_atime_high;
+	unsigned short		shm_dtime_high;
+	unsigned short		shm_ctime_high;
+	unsigned short		__unused1;
+};
+#endif
+
+#endif /* __mips__ */
+
+#if defined(__hppa__)
+#define HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for parisc architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+#if __BITS_PER_LONG == 64
+	long			shm_atime;	/* last attach time */
+	long			shm_dtime;	/* last detach time */
+	long			shm_ctime;	/* last change time */
+#else
+#define HAVE_SHMID64_DS_TIME_HIGH
+	unsigned long		shm_atime_high;
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_dtime_high;
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_ctime_high;
+	unsigned long		shm_ctime;	/* last change time */
+	unsigned int		__pad4;
+#endif
+	__kernel_size_t		shm_segsz;	/* size of segment (bytes) */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused1;
+	unsigned long		__unused2;
+};
+#endif /* __hppa__ */
+
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for PPC architecture.
+ *
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+#ifdef __powerpc64__
+	long		shm_atime;	/* last attach time */
+	long		shm_dtime;	/* last detach time */
+	long		shm_ctime;	/* last change time */
+#else
+#define HAVE_SHMID64_DS_TIME_HIGH
+	unsigned long		shm_atime_high;
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_dtime_high;
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_ctime_high;
+	unsigned long		shm_ctime;	/* last change time */
+	unsigned long		__unused4;
+#endif
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused5;
+	unsigned long		__unused6;
+};
+
+#endif /* defined(__powerpc__) || defined(__powerpc64__) */
+
+#if defined(__sparc__)
+#define HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for sparc architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+#if defined(__arch64__)
+	long			shm_atime;	/* last attach time */
+	long			shm_dtime;	/* last detach time */
+	long			shm_ctime;	/* last change time */
+#else
+#define HAVE_SHMID64_DS_TIME_HIGH
+	unsigned long		shm_atime_high;
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_dtime_high;
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_ctime_high;
+	unsigned long		shm_ctime;	/* last change time */
+#endif
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused1;
+	unsigned long		__unused2;
+};
+
+#endif /* __sparc__ */
+
+#if defined(__x86_64__) && defined(__ILP32__)
+#define HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for x86 architecture with x32 ABI.
+ *
+ * On x86-32 and x86-64 we can just use the generic definition, but
+ * x32 uses the same binary layout as x86_64, which is differnet
+ * from other 32-bit architectures.
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_long_t		shm_atime;	/* last attach time */
+	__kernel_long_t		shm_dtime;	/* last detach time */
+	__kernel_long_t		shm_ctime;	/* last change time */
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	__kernel_ulong_t	shm_nattch;	/* no. of current attaches */
+	__kernel_ulong_t	__unused4;
+	__kernel_ulong_t	__unused5;
+};
+#endif /* defined(__x86_64__) && defined(__ILP32__) */
+
+#if defined(__xtensa__)
+#define HAVE_SHMID64_DS
+#define HAVE_SHMID64_DS_TIME_HIGH
+/*
+ * The shmid64_ds structure for Xtensa architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space, but the padding is on the wrong
+ * side for big-endian xtensa, for historic reasons.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+	size_t			shm_segsz;	/* size of segment (bytes) */
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_atime_high;
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_dtime_high;
+	unsigned long		shm_ctime;	/* last change time */
+	unsigned long		shm_ctime_high;
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused4;
+	unsigned long		__unused5;
+};
+
+#endif /* __xtensa__ */
+
+#ifndef HAVE_SHMID64_DS
+/*
+ * The shmid64_ds structure for most architectures (though it came
+ * from x86_32 originally). Note extra padding because this structure
+ * is passed back and forth between kernel and user space.
+ *
+ * shmid64_ds was originally meant to be architecture specific, but
+ * everyone just ended up making identical copies without specific
+ * optimizations, so we may just as well all use the same one.
+ *
+ * 64 bit architectures use a 64-bit long time field here, while
+ * 32 bit architectures have a pair of unsigned long values.
+ * On big-endian systems, the lower half is in the wrong place.
+ *
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct shmid64_ds {
+	struct ipc64_perm	shm_perm;	/* operation perms */
+	size_t			shm_segsz;	/* size of segment (bytes) */
+#if __BITS_PER_LONG == 64
+	long			shm_atime;	/* last attach time */
+	long			shm_dtime;	/* last detach time */
+	long			shm_ctime;	/* last change time */
+#else
+#define HAVE_SHMID64_DS_TIME_HIGH
+	unsigned long		shm_atime;	/* last attach time */
+	unsigned long		shm_atime_high;
+	unsigned long		shm_dtime;	/* last detach time */
+	unsigned long		shm_dtime_high;
+	unsigned long		shm_ctime;	/* last change time */
+	unsigned long		shm_ctime_high;
+#endif
+	__kernel_pid_t		shm_cpid;	/* pid of creator */
+	__kernel_pid_t		shm_lpid;	/* pid of last operator */
+	unsigned long		shm_nattch;	/* no. of current attaches */
+	unsigned long		__unused4;
+	unsigned long		__unused5;
+};
+#endif /* shmid64_ds */
+
+#endif /* HAVE_SHMID64_DS */
+
+#endif /* IPC_SHMBUF_H */
diff --git a/runtest/syscalls b/runtest/syscalls
index db14ba4baf9e..297b225448b8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1352,6 +1352,7 @@ shmctl02 shmctl02
 shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
+shmctl06 shmctl06
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index f912cb067f74..5ba3b1449a6c 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -55,6 +55,7 @@ shmctl02 shmctl02
 shmctl03 shmctl03
 shmctl04 shmctl04
 shmctl05 shmctl05
+shmctl06 shmctl06
 
 shmdt01 shmdt01
 shmdt02 shmdt02
diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
index d6777e3b8f1b..46b107344cf4 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
@@ -3,3 +3,4 @@
 /shmctl03
 /shmctl04
 /shmctl05
+/shmctl06
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index dda6d636f755..44e38d8fa760 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -3,12 +3,15 @@
 
 top_srcdir              ?= ../../../../..
 
+include $(top_srcdir)/include/mk/testcases.mk
+
 shmctl05: CFLAGS += -pthread
 shmctl05: LDLIBS += -lrt
 
-include $(top_srcdir)/include/mk/testcases.mk
+shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
+shmctl06: LDLIBS += -lltpnewipc
 
-LDLIBS  += -lltpipc
 LDFLAGS += -L$(top_builddir)/libs/libltpipc
+LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c
new file mode 100644
index 000000000000..342c5ee3504c
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl06.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Cross verify the _high fields being set to 0 by the kernel.
+ */
+#include <sys/shm.h>
+#include "libnewipc.h"
+#include "shmbuf.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+
+#ifdef HAVE_SHMID64_DS_TIME_HIGH
+
+static void run(void)
+{
+	struct shmid64_ds buf_ds = {
+		.shm_atime_high = 0x0A0A,
+		.shm_dtime_high = 0x0A0A,
+		.shm_ctime_high = 0x0A0A,
+	};
+	int shmid;
+	key_t key;
+
+	/* get an IPC resource key */
+	key = GETIPCKEY();
+
+	shmid = shmget(key, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
+	if (shmid == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create shared memory segment");
+
+	TEST(shmctl(shmid, IPC_STAT, (struct shmid_ds *)&buf_ds));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "shmctl() failed");
+
+	if (buf_ds.shm_atime_high || buf_ds.shm_dtime_high || buf_ds.shm_ctime_high)
+		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
+	else
+		tst_res(TPASS, "time_high fields cleared by the kernel");
+
+	SAFE_SHMCTL(shmid, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+#else
+TST_TEST_TCONF("test requires struct shmid64_ds to have the time_high fields");
+#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
