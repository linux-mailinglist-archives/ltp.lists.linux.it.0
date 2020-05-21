Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37E1DCB57
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 068203C4D77
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0A1343C4D5F
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:48:08 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 93BA36010BA
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:47:38 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id v63so3134486pfb.10
 for <ltp@lists.linux.it>; Thu, 21 May 2020 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRYToiVC3zCrcylcJX8q1HADWSTNtB/ViFAwm0hWvW8=;
 b=Ma6NQCvyXnUOZmbPIda3ntVZpCRJzQcSpShZRr6qhPfOPUmBl2UYArfgAWVz/ah5WK
 uKm5T6/x87vcSQTehBBT1OmF/ovvY4QOS9rp3GdPk9wk/G3o3jcZ2+w48YdkBtAVuT4Y
 fk9JRA1Q6IG+br/nqMug/7iae38Lc595ZkcpdoIiKlY+elSmluiA3JkYpkZpbBlFvLau
 ZE/QhiU0EalEv9tiq4MbBjspQvkLO54YxobzECbl+Pke70dv64CjiUNQUV8/z6ZgLNBI
 K5vWG+qUsS6+Xfwo6Xk5bJhS1q8t57im8aTYRDEsA2mGKANXkC9QwUOcSNZNBn2B5Q8D
 nvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRYToiVC3zCrcylcJX8q1HADWSTNtB/ViFAwm0hWvW8=;
 b=aXS2j46xnEf5dxoWogPcrsk8Fuw08ncMNIp9h9Z4WCJ6HXYRHK13luE/O9Lote6RYA
 zxLRKNugLL9QZrNoOkzhw8MGqOKoXnXlGCqahg61bw6zJ8hBLEuBTXSZhVwZtPxCN6Kz
 J4OiKwu5SvZoDqUqJMTdStCMhGYA9DhrPq/gLv8aVPFEDPV5yJ17qtmgCmA9ahQhUKNQ
 g3jnbPVqXhorc9ayG7A7x0w0AnDHwyKfZJwEeeEpeXdGdxXm9SMKsNG689ic6fQJ5ND1
 T4mbc16QNFqi4Qvca9kC6do8gA09djkmMstx3sHGGwVlqPDvRt7kofn4u2cOWGzo2kYk
 6Xdw==
X-Gm-Message-State: AOAM532PvFkwkmuJjOBjVBqyGfvu5HFJ/tcWT9z4ceh+XfLgjnXjR36z
 C7PcYXqNFzFCC+z6AD0S/unJRIM1P4I=
X-Google-Smtp-Source: ABdhPJyRt1wzO/6TKh0Bv4kuPDzqs0nytgDkCIq009zd1uCcT0mIqCtpUfXB9OSlSHCu4QM1RrUdTQ==
X-Received: by 2002:a62:3181:: with SMTP id x123mr8546931pfx.109.1590058081381; 
 Thu, 21 May 2020 03:48:01 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id v9sm4203017pju.3.2020.05.21.03.48.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 03:48:00 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 21 May 2020 16:17:36 +0530
Message-Id: <96f9e90b0903939f6dab9dfe66e84e23d31c9e97.1590057824.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590057824.git.viresh.kumar@linaro.org>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] syscalls: msgctl: Add new test to verify the
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
 include/msgbuf.h                              | 306 ++++++++++++++++++
 runtest/syscalls                              |   1 +
 runtest/syscalls-ipc                          |   1 +
 .../kernel/syscalls/ipc/msgctl/.gitignore     |   1 +
 .../kernel/syscalls/ipc/msgctl/msgctl05.c     |  48 +++
 6 files changed, 358 insertions(+)
 create mode 100644 include/msgbuf.h
 create mode 100644 testcases/kernel/syscalls/ipc/msgctl/msgctl05.c

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
diff --git a/include/msgbuf.h b/include/msgbuf.h
new file mode 100644
index 000000000000..779362c4f07a
--- /dev/null
+++ b/include/msgbuf.h
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
diff --git a/runtest/syscalls b/runtest/syscalls
index 297b225448b8..e6e354bbf797 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -796,6 +796,7 @@ msgctl01 msgctl01
 msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
+msgctl05 msgctl05
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 5ba3b1449a6c..c3a35896c5a8 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -2,6 +2,7 @@ msgctl01 msgctl01
 msgctl02 msgctl02
 msgctl03 msgctl03
 msgctl04 msgctl04
+msgctl05 msgctl05
 msgstress01 msgstress01
 msgstress02 msgstress02
 msgstress03 msgstress03
diff --git a/testcases/kernel/syscalls/ipc/msgctl/.gitignore b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
index f179f2606a3e..0157f4611bdf 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgctl/.gitignore
@@ -2,4 +2,5 @@
 /msgctl02
 /msgctl03
 /msgctl04
+/msgctl05
 /msgctl12
diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
new file mode 100644
index 000000000000..db13b19f9248
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Cross verify the _high fields being set to 0 by the kernel.
+ */
+#include <sys/msg.h>
+#include "libnewipc.h"
+#include "msgbuf.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+
+#ifdef HAVE_MSQID64_DS_TIME_HIGH
+
+static void run(void)
+{
+	struct msqid64_ds buf_ds = {
+		.msg_stime_high = 0x0A0A,
+		.msg_rtime_high = 0x0A0A,
+		.msg_ctime_high = 0x0A0A,
+	};
+	int msqid;
+	key_t key;
+
+	key = GETIPCKEY();
+
+	msqid = SAFE_MSGGET(key, IPC_CREAT | IPC_EXCL | MSG_RW | 0600);
+
+	TEST(msgctl(msqid, IPC_STAT, (struct msqid_ds *)&buf_ds));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "msqctl() failed");
+
+	if (buf_ds.msg_stime_high || buf_ds.msg_rtime_high || buf_ds.msg_ctime_high)
+		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
+	else
+		tst_res(TPASS, "time_high fields cleared by the kernel");
+
+	SAFE_MSGCTL(msqid, IPC_RMID, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
+#else
+TST_TEST_TCONF("test requires struct msqid64_ds to have the time_high fields");
+#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
