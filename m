Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 178261FADC4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AF243C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:20:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 312783C2D06
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:34 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 34F421BCD7BD
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:20:33 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id a45so1046867pje.1
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqWPuZuYXoYkRhOsIMXrTm0u8fyyDqJ6HTW9Vjml2OM=;
 b=RUfGnWzjZ+T8/JU/pmzh5VidFyT8WijLKlen84MpiH/5UyqXq1+DeJqPxIpCMaYILq
 IN8Rn7nLNM6ZXxBqEEnsCp2XMawgOoH079jPOKEZdY65fyFa5qFcs0v00VEMW1R9X6f6
 1WcG4ckWVbDP7rs+SYL0dV7jW//zpP3X+JrgGWxkaEVEK6/K6RFCy+wY7PXqkcgolQQC
 FNqovm+TWTGTSPIPDcY6eA//ESHoClBFe3ysVzFXj4ck2GysUhrUanTIwZgFqGeIaNkh
 mqfycrGrNpRpfuRMTu6X8jQhIChBWbRvWZHZ4YcfQPTQ1D4LWP0+0vikG38TJzyETobL
 N8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqWPuZuYXoYkRhOsIMXrTm0u8fyyDqJ6HTW9Vjml2OM=;
 b=hjT5huXwEhq2X/rwf774XMkvPokVU7ubh8CdrNNTtxKuGXBhsSzAi0WMfzaRSs1h99
 7NtYsJKvoK6/B7IsdIReUqWtA2PB97dGTtORyT1t6NFyQnfb5J4/oEzcW1mVK/gpKBT0
 C/Uf35rN8BKVWptj+XnwMQFGGTZo7shOuekkkz2hC8lGP4yr2SdWh/EPWKwHaVWgRU5p
 F1cSs2RUugRTCTJIunQp82c9ThGd0Ae9V9I5Dxnbpc0odeX088r/nd7rQUqrjG3wZQwA
 Y8K8iFlzMiRJpEtFiIKtj2J0nxVafy5rjJkQjBrYZL5AVCvB5c/gjW0BIpBKCwf5gSh2
 Im9g==
X-Gm-Message-State: AOAM533dl1X0lFMw5KgjIz3iKe5zkuqUJOQtgMD93sY65lNyB8txRKiC
 nFd/P+TjRBe7AhSOG5KZ5pJ425W56Lk=
X-Google-Smtp-Source: ABdhPJx1clWag9xyFo6zSyQGA7q3fssOBS74icLfGDYw+Xa31MOZn4Ix59Deg2PfnSxmLc5FgCQbtg==
X-Received: by 2002:a17:90a:32d1:: with SMTP id
 l75mr2188343pjb.85.1592302831319; 
 Tue, 16 Jun 2020 03:20:31 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id i125sm13839696pgd.21.2020.06.16.03.20.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:20:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 15:50:19 +0530
Message-Id: <d11e74663f3ea7e3765d36597a6bfbaa0c70b7d7.1592302358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1592302358.git.viresh.kumar@linaro.org>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/6] include: Add declaration of struct semid64_ds
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

This adds declaration of struct semid64_ds, which will be used by
following patches.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 configure.ac          |   1 +
 include/lapi/sembuf.h | 234 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 235 insertions(+)
 create mode 100644 include/lapi/sembuf.h

diff --git a/configure.ac b/configure.ac
index eaf33dd60350..c513fdf440c2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -151,6 +151,7 @@ AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
 AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
 AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
 AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
+AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
 
 AC_CHECK_TYPES([struct mmsghdr],,,[
 #define _GNU_SOURCE
diff --git a/include/lapi/sembuf.h b/include/lapi/sembuf.h
new file mode 100644
index 000000000000..00263abca995
--- /dev/null
+++ b/include/lapi/sembuf.h
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IPC_SEMBUF_H
+#define IPC_SEMBUF_H
+
+#include <linux/posix_types.h>
+#include <sys/sem.h>
+#include "tst_timer.h"
+#include "ipcbuf.h"
+
+#ifndef HAVE_SEMID64_DS
+
+#if defined(__mips__)
+#define HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for the MIPS architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for 2 miscellaneous 64-bit values on mips64,
+ * but used for the upper 32 bit of the time values on mips32.
+ */
+#if defined(__arch64__)
+struct semid64_ds {
+	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+	long		 sem_otime;		/* last semop time */
+	long		 sem_ctime;		/* last change time */
+	unsigned long	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	__unused1;
+	unsigned long	__unused2;
+};
+#else
+#define HAVE_SEMID64_DS_TIME_HIGH
+struct semid64_ds {
+	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+	unsigned long   sem_otime;		/* last semop time */
+	unsigned long   sem_ctime;		/* last change time */
+	unsigned long	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	sem_otime_high;
+	unsigned long	sem_ctime_high;
+};
+#endif
+#endif /* __mips__ */
+
+#if defined(__hppa__)
+#define HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for parisc architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+struct semid64_ds {
+	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+#if __BITS_PER_LONG == 64
+	long		sem_otime;		/* last semop time */
+	long		sem_ctime;		/* last change time */
+#else
+#define HAVE_SEMID64_DS_TIME_HIGH
+	unsigned long	sem_otime_high;
+	unsigned long	sem_otime;		/* last semop time */
+	unsigned long	sem_ctime_high;
+	unsigned long	sem_ctime;		/* last change time */
+#endif
+	unsigned long	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	__unused1;
+	unsigned long	__unused2;
+};
+#endif /* __hppa__ */
+
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for PPC architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32/64-bit values
+ */
+
+struct semid64_ds {
+	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
+#ifndef __powerpc64__
+#define HAVE_SEMID64_DS_TIME_HIGH
+	unsigned long	sem_otime_high;
+	unsigned long	sem_otime;	/* last semop time */
+	unsigned long	sem_ctime_high;
+	unsigned long	sem_ctime;	/* last change time */
+#else
+	long		sem_otime;	/* last semop time */
+	long		sem_ctime;	/* last change time */
+#endif
+	unsigned long	sem_nsems;	/* no. of semaphores in array */
+	unsigned long	__unused3;
+	unsigned long	__unused4;
+};
+#endif /* defined(__powerpc__) || defined(__powerpc64__) */
+
+#if defined(__sparc__)
+#define HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for sparc architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct semid64_ds {
+	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+#if defined(__arch64__)
+	long		sem_otime;		/* last semop time */
+	long		sem_ctime;		/* last change time */
+#else
+#define HAVE_SEMID64_DS_TIME_HIGH
+	unsigned long	sem_otime_high;
+	unsigned long	sem_otime;		/* last semop time */
+	unsigned long	sem_ctime_high;
+	unsigned long	sem_ctime;		/* last change time */
+#endif
+	unsigned long	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	__unused1;
+	unsigned long	__unused2;
+};
+#endif /* __sparc__ */
+
+#if defined(__x86_64__)
+#define HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for x86 architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 2 miscellaneous 32-bit values
+ *
+ * x86_64 and x32 incorrectly added padding here, so the structures
+ * are still incompatible with the padding on x86.
+ */
+struct semid64_ds {
+	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
+#ifdef __i386__
+#define HAVE_SEMID64_DS_TIME_HIGH
+	unsigned long	sem_otime;	/* last semop time */
+	unsigned long	sem_otime_high;
+	unsigned long	sem_ctime;	/* last change time */
+	unsigned long	sem_ctime_high;
+#else
+	__kernel_long_t sem_otime;	/* last semop time */
+	__kernel_ulong_t __unused1;
+	__kernel_long_t sem_ctime;	/* last change time */
+	__kernel_ulong_t __unused2;
+#endif
+	__kernel_ulong_t sem_nsems;	/* no. of semaphores in array */
+	__kernel_ulong_t __unused3;
+	__kernel_ulong_t __unused4;
+};
+#endif /* defined(__x86_64__) */
+
+#if defined(__xtensa__)
+#define HAVE_SEMID64_DS
+#define HAVE_SEMID64_DS_TIME_HIGH
+
+struct semid64_ds {
+	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+#ifdef __XTENSA_EL__
+	unsigned long	sem_otime;		/* last semop time */
+	unsigned long	sem_otime_high;
+	unsigned long	sem_ctime;		/* last change time */
+	unsigned long	sem_ctime_high;
+#else
+	unsigned long	sem_otime_high;
+	unsigned long	sem_otime;		/* last semop time */
+	unsigned long	sem_ctime_high;
+	unsigned long	sem_ctime;		/* last change time */
+#endif
+	unsigned long	sem_nsems;		/* no. of semaphores in array */
+	unsigned long	__unused3;
+	unsigned long	__unused4;
+};
+
+#endif /* __xtensa__ */
+
+#ifndef HAVE_SEMID64_DS
+/*
+ * The semid64_ds structure for most architectures (though it came
+ * from x86_32 originally). Note extra padding because this structure
+ * is passed back and forth between kernel and user space.
+ *
+ * semid64_ds was originally meant to be architecture specific, but
+ * everyone just ended up making identical copies without specific
+ * optimizations, so we may just as well all use the same one.
+ *
+ * 64 bit architectures use a 64-bit long time field here, while
+ * 32 bit architectures have a pair of unsigned long values.
+ *
+ * On big-endian systems, the padding is in the wrong place for
+ * historic reasons, so user space has to reconstruct a time_t
+ * value using
+ *
+ * user_semid_ds.sem_otime = kernel_semid64_ds.sem_otime +
+ *		((long long)kernel_semid64_ds.sem_otime_high << 32)
+ *
+ * Pad space is left for 2 miscellaneous 32-bit values
+ */
+struct semid64_ds {
+	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
+#if __BITS_PER_LONG == 64
+	long		sem_otime;	/* last semop time */
+	long		sem_ctime;	/* last change time */
+#else
+#define HAVE_SEMID64_DS_TIME_HIGH
+	unsigned long	sem_otime;	/* last semop time */
+	unsigned long	sem_otime_high;
+	unsigned long	sem_ctime;	/* last change time */
+	unsigned long	sem_ctime_high;
+#endif
+	unsigned long	sem_nsems;	/* no. of semaphores in array */
+	unsigned long	__unused3;
+	unsigned long	__unused4;
+};
+#endif /* semid64_ds */
+
+#endif /* HAVE_SEMID64_DS */
+
+#endif /* IPC_SEMBUF_H */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
