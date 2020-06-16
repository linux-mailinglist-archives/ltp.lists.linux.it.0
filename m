Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 254511FADCC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C851C3C2D06
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:21:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 793DD3C2D0B
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:45 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 37216279906
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:44 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id z63so8351058pfb.1
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YJTGb3QxaU9a99jVkwxiAFKCAZb8mdHwOVjnbcBxBc=;
 b=J09vk6dMX89R3Z2mzs+fnrRpyJ7jMwLx0gx+WJSu5BpOG5c2MBQXGBS5CxcdDRdUZw
 +VJqg/ndaBlC119p6WIjFznDI1KWLNRAwV9yGzetTyWlmXz673ptyVw50p3DTHxRKauK
 0/cS/bJ8dMoOicTaByxGQ0VTBngWJ9YGUMvJfhIPsi9eV/FIMkET5pfZP5kjGystnRpA
 nMHlYC9JwMox6EBUeJ9gGHKhuwgIEvkoaQ9KUDuPY+QO4qiqFlMOdAFKYZ/7OLGoswH1
 ylr8EXsqcS4G3nqFFSCq9hzBKIPUF74VPoDDyiyTiLwt5kqUC+0cvaU9SjUnHkAgpwN8
 vOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YJTGb3QxaU9a99jVkwxiAFKCAZb8mdHwOVjnbcBxBc=;
 b=pkmcN4qZRXN2zUAbbSh4rLYU+5QD2OVM68+1sZHUazoHOcYf+jRyKv/vn3Xk2veamU
 Q7gZGeKwEX8lPXr6kxLWt/Pz63+nQdqmekBDT89ZZMbDg8OndR/Q1X6iUeyC448E6Zm/
 dSaq9lh75DW0BsqhZOs6qgchtb6uuTbAl1nZHUh4LPXOyo/PMeW7X8M9rcwZ7Ph4ha43
 VFnYYyCLXsuYuFOvJGoKKDMJbwQRUe17RWNA+eSSnzHkCXvmbrIA5dfHo1hd01Vbye7l
 cWIZGc7BWJ3RX7VRR0OveoRXt1u/s2AqbDOZ/x+yYBC37fULDYo9etvX7nIh5PVhN/rO
 s/GQ==
X-Gm-Message-State: AOAM533gQ1T737BeexXABy6poj5lp5Zj4fs1LNa1VzCR1E5OiPYglOoO
 JgX4252riYutPAQ3k77tK9Q14num2GI=
X-Google-Smtp-Source: ABdhPJz8qPudejrg42TNvg4IrryxayF67B9FrnMQwf/yejwHm0y2u+Y0h+qR+njLd2SDq8+rIXFBvw==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr1512878pfm.90.1592302842255;
 Tue, 16 Jun 2020 03:20:42 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id w18sm6498206pgj.31.2020.06.16.03.20.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:41 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:23 +0530
Message-Id: <7616a6fa4f1502dde4417d33aa88836c8020419e.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1592302358.git.viresh.kumar@linaro.org>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 5/6] include: Add declaration of struct msqid64_ds
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

This adds declaration of struct msqid64_ds, which will be used by
following patches.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac          |   1 +
 include/lapi/msgbuf.h | 306 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 include/lapi/msgbuf.h

diff --git a/configure.ac b/configure.ac
index f1ee98b23cbe..05032d1cfd8f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -153,6 +153,7 @@ AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
 AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
 AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
 AC_CHECK_TYPES([struct shmid64_ds],,,[#include <sys/shmbuf.h>])
+AC_CHECK_TYPES([struct msqid64_ds],,,[#include <sys/msgbuf.h>])
 
 AC_CHECK_TYPES([struct mmsghdr],,,[
 #define _GNU_SOURCE
diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
new file mode 100644
index 000000000000..779362c4f07a
--- /dev/null
+++ b/include/lapi/msgbuf.h
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IPC_MSGBUF_H
+#define IPC_MSGBUF_H
+
+#include <linux/posix_types.h>
+#include <sys/sem.h>
+#include "tst_timer.h"
+#include "ipcbuf.h"
+
+#ifndef HAVE_MSQID64_DS
+
+#if defined(__mips__)
+#define HAVE_MSQID64_DS
+
+#if defined(__arch64__)
+/*
+ * The msqid64_ds structure for the MIPS architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous unsigned long values
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+	long msg_stime;			/* last msgsnd time */
+	long msg_rtime;			/* last msgrcv time */
+	long msg_ctime;			/* last change time */
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused4;
+	unsigned long  __unused5;
+};
+#elif defined (__MIPSEB__)
+#define HAVE_MSQID64_DS_TIME_HIGH
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+	unsigned long  msg_stime_high;
+	unsigned long  msg_stime;	/* last msgsnd time */
+	unsigned long  msg_rtime_high;
+	unsigned long  msg_rtime;	/* last msgrcv time */
+	unsigned long  msg_ctime_high;
+	unsigned long  msg_ctime;	/* last change time */
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused4;
+	unsigned long  __unused5;
+};
+#elif defined (__MIPSEL__)
+#define HAVE_MSQID64_DS_TIME_HIGH
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+	unsigned long  msg_stime;	/* last msgsnd time */
+	unsigned long  msg_stime_high;
+	unsigned long  msg_rtime;	/* last msgrcv time */
+	unsigned long  msg_rtime_high;
+	unsigned long  msg_ctime;	/* last change time */
+	unsigned long  msg_ctime_high;
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused4;
+	unsigned long  __unused5;
+};
+#endif
+
+#endif /* __mips__ */
+
+#if defined(__hppa__)
+#define HAVE_MSQID64_DS
+/* 
+ * The msqid64_ds structure for parisc architecture, copied from sparc.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+#if __BITS_PER_LONG == 64
+	long		 msg_stime;	/* last msgsnd time */
+	long		 msg_rtime;	/* last msgrcv time */
+	long		 msg_ctime;	/* last change time */
+#else
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long	msg_stime_high;
+	unsigned long	msg_stime;	/* last msgsnd time */
+	unsigned long	msg_rtime_high;
+	unsigned long	msg_rtime;	/* last msgrcv time */
+	unsigned long	msg_ctime_high;
+	unsigned long	msg_ctime;	/* last change time */
+#endif
+	unsigned long	msg_cbytes;	/* current number of bytes on queue */
+	unsigned long	msg_qnum;	/* number of messages in queue */
+	unsigned long	msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t	msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t	msg_lrpid;	/* last receive pid */
+	unsigned long	__unused1;
+	unsigned long	__unused2;
+};
+
+#endif /* __hppa__ */
+
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define HAVE_MSQID64_DS
+/*
+ * The msqid64_ds structure for the PowerPC architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+#ifdef __powerpc64__
+	long		 msg_stime;	/* last msgsnd time */
+	long		 msg_rtime;	/* last msgrcv time */
+	long		 msg_ctime;	/* last change time */
+#else
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long  msg_stime_high;
+	unsigned long  msg_stime;	/* last msgsnd time */
+	unsigned long  msg_rtime_high;
+	unsigned long  msg_rtime;	/* last msgrcv time */
+	unsigned long  msg_ctime_high;
+	unsigned long  msg_ctime;	/* last change time */
+#endif
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused4;
+	unsigned long  __unused5;
+};
+
+#endif /* defined(__powerpc__) || defined(__powerpc64__) */
+
+#if defined(__sparc__)
+#define HAVE_MSQID64_DS
+/*
+ * The msqid64_ds structure for sparc64 architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+#if defined(__arch64__)
+	long msg_stime;			/* last msgsnd time */
+	long msg_rtime;			/* last msgrcv time */
+	long msg_ctime;			/* last change time */
+#else
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long msg_stime_high;
+	unsigned long msg_stime;	/* last msgsnd time */
+	unsigned long msg_rtime_high;
+	unsigned long msg_rtime;	/* last msgrcv time */
+	unsigned long msg_ctime_high;
+	unsigned long msg_ctime;	/* last change time */
+#endif
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused1;
+	unsigned long  __unused2;
+};
+
+#endif /* __sparc__ */
+
+#if defined(__x86_64__) && defined(__ILP32__)
+#define HAVE_MSQID64_DS
+/*
+ * The msqid64_ds structure for x86 architecture with x32 ABI.
+ *
+ * On x86-32 and x86-64 we can just use the generic definition, but
+ * x32 uses the same binary layout as x86_64, which is differnet
+ * from other 32-bit architectures.
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+	__kernel_long_t msg_stime;	/* last msgsnd time */
+	__kernel_long_t msg_rtime;	/* last msgrcv time */
+	__kernel_long_t msg_ctime;	/* last change time */
+	__kernel_ulong_t msg_cbytes;	/* current number of bytes on queue */
+	__kernel_ulong_t msg_qnum;	/* number of messages in queue */
+	__kernel_ulong_t msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	__kernel_ulong_t __unused4;
+	__kernel_ulong_t __unused5;
+};
+
+#endif /* defined(__x86_64__) && defined(__ILP32__) */
+
+#if defined(__xtensa__)
+#define HAVE_MSQID64_DS
+/*
+ * The msqid64_ds structure for the Xtensa architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+#ifdef __XTENSA_EB__
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long  msg_stime_high;
+	unsigned long  msg_stime;	/* last msgsnd time */
+	unsigned long  msg_rtime_high;
+	unsigned long  msg_rtime;	/* last msgrcv time */
+	unsigned long  msg_ctime_high;
+	unsigned long  msg_ctime;	/* last change time */
+#elif defined(__XTENSA_EL__)
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long  msg_stime;	/* last msgsnd time */
+	unsigned long  msg_stime_high;
+	unsigned long  msg_rtime;	/* last msgrcv time */
+	unsigned long  msg_rtime_high;
+	unsigned long  msg_ctime;	/* last change time */
+	unsigned long  msg_ctime_high;
+#else
+# error processor byte order undefined!
+#endif
+	unsigned long  msg_cbytes;	/* current number of bytes on queue */
+	unsigned long  msg_qnum;	/* number of messages in queue */
+	unsigned long  msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long  __unused4;
+	unsigned long  __unused5;
+};
+
+#endif /* __xtensa__ */
+
+#ifndef HAVE_MSQID64_DS
+/*
+ * generic msqid64_ds structure.
+ *
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * msqid64_ds was originally meant to be architecture specific, but
+ * everyone just ended up making identical copies without specific
+ * optimizations, so we may just as well all use the same one.
+ *
+ * 64 bit architectures use a 64-bit long time field here, while
+ * 32 bit architectures have a pair of unsigned long values.
+ * On big-endian systems, the lower half is in the wrong place.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct msqid64_ds {
+	struct ipc64_perm msg_perm;
+#if __BITS_PER_LONG == 64
+	long		 msg_stime;	/* last msgsnd time */
+	long		 msg_rtime;	/* last msgrcv time */
+	long		 msg_ctime;	/* last change time */
+#else
+#define HAVE_MSQID64_DS_TIME_HIGH
+	unsigned long	msg_stime;	/* last msgsnd time */
+	unsigned long	msg_stime_high;
+	unsigned long	msg_rtime;	/* last msgrcv time */
+	unsigned long	msg_rtime_high;
+	unsigned long	msg_ctime;	/* last change time */
+	unsigned long	msg_ctime_high;
+#endif
+	unsigned long	msg_cbytes;	/* current number of bytes on queue */
+	unsigned long	msg_qnum;	/* number of messages in queue */
+	unsigned long	 msg_qbytes;	/* max number of bytes on queue */
+	__kernel_pid_t msg_lspid;	/* pid of last msgsnd */
+	__kernel_pid_t msg_lrpid;	/* last receive pid */
+	unsigned long	 __unused4;
+	unsigned long	 __unused5;
+};
+
+#endif /* msqid64_ds */
+
+#endif /* HAVE_MSQID64_DS */
+
+#endif /* IPC_MSGBUF_H */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
