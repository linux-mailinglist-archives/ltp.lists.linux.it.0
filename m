Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6091DE0B2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:16:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35B713C4CAD
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:16:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C63613C2352
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:16:20 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2B55F1401803
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:16:16 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id y18so4811051pfl.9
 for <ltp@lists.linux.it>; Fri, 22 May 2020 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yg9eTIifgacd/TI2Q7HM4VVAE2FdWWx5RgeHzX7P7Ag=;
 b=Jr/ieLLv8mc0qbjLWNXuuJZNzDqNlWbjX2GI6zqZlY3HMcRr6En5MD6qfvKT6sbn8q
 0X5Yg7MogTXCn2HKbVU+Zc36/JMzhwKszfD1uvlUouNRMgaZYt9iv6yAUgjTKnFY6ZDv
 JxHLeCMNylEr+ErtuHlNmC/AUL33/bnO/7kSYWCa8tbLJfub8R+uSV1ELNo463FQggA5
 H6OC9PBJ4buud6YslTnOtjmEBrv9W2aw2tiyqI26tCR9kbRp6AWmGgivk3a89WTlu4nW
 uFRrzIcOcfgGxGavv4FKtxOWwOLj9wg9SPxsRdGtm1K8DFsfPeURRHR2es4movzQxgYQ
 wK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yg9eTIifgacd/TI2Q7HM4VVAE2FdWWx5RgeHzX7P7Ag=;
 b=UAE7lEGz+xzWZkM46T+sdnNaJGdjXSt7GF9s0lh4TpHfQkA2J8QiE10SAUsV2sMXLC
 6kc9SfV/BDwlYglM7Ieghlwi6maPDU3d5n1HiCsFAlwqoSO8cMmZM5I7C2+zc5VS1FuW
 BcXGuDuAnZquwTyX5dxE4HSa9UT6uKbGq/XXkPvo6gE7aqTBMn+lIm/kpH2X5VXAD46f
 bExuzsrIAlib4MnZtqIfo/yhdU5NLxd2UCwIkkZXTbTVnF8gAOTR4JMNCCn0FyNAxK6v
 L8uqUlzKmiQhn7xywsuwj7RDexhTaPKS6TZHz5bW3eenGE/oR1o3lOm/iSYRkGh5mHCY
 n4+Q==
X-Gm-Message-State: AOAM533cxt4TNKYqIofl15LeNZk6u91pAEU8EbFN5a/4WBK3vY7z3VEd
 Mt4KMUjQpWJ4620MdKjAZdy2sXLyZCY=
X-Google-Smtp-Source: ABdhPJyR6nsECzIeosQFXMMh8ICS9nNiMDCHXC2qCsfUY2iKuwgD+yLP4l2TkCQUow8/vbyXr5F9kg==
X-Received: by 2002:a62:a518:: with SMTP id v24mr2419186pfm.295.1590131774258; 
 Fri, 22 May 2020 00:16:14 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q18sm5532478pgn.34.2020.05.22.00.16.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 00:16:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:46:04 +0530
Message-Id: <dc4d34a42d4ca85d4d73b9e87974382368d02296.1590131635.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
References: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/5] include: Add declaration of struct ipc64_perm
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

This adds declaration of struct ipc64_perm, which will be used by
following patches.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Include definitions for other architectures as well.

 configure.ac     |   1 +
 include/ipcbuf.h | 199 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 include/ipcbuf.h

diff --git a/configure.ac b/configure.ac
index 1d3ea58d0082..eaf33dd60350 100644
--- a/configure.ac
+++ b/configure.ac
@@ -150,6 +150,7 @@ AC_CHECK_TYPES([struct file_dedupe_range],,,[#include <linux/fs.h>])
 AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
 AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
 AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
+AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
 
 AC_CHECK_TYPES([struct mmsghdr],,,[
 #define _GNU_SOURCE
diff --git a/include/ipcbuf.h b/include/ipcbuf.h
new file mode 100644
index 000000000000..caf1491df27f
--- /dev/null
+++ b/include/ipcbuf.h
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef IPCBUF_H
+#define IPCBUF_H
+
+#include <linux/posix_types.h>
+
+#ifndef HAVE_IPC64_PERM
+
+#if defined(__hppa__)
+#define HAVE_IPC64_PERM
+/*
+ * The ipc64_perm structure for PA-RISC is almost identical to
+ * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the kernel.
+ * 'seq' has been changed from long to int so that it's the same size
+ * on 64-bit kernels as on 32-bit ones.
+ */
+
+struct ipc64_perm
+{
+	__kernel_key_t		key;
+	__kernel_uid_t		uid;
+	__kernel_gid_t		gid;
+	__kernel_uid_t		cuid;
+	__kernel_gid_t		cgid;
+#if __BITS_PER_LONG != 64
+	unsigned short int	__pad1;
+#endif
+	__kernel_mode_t		mode;
+	unsigned short int	__pad2;
+	unsigned short int	seq;
+	unsigned int		__pad3;
+	unsigned long long int __unused1;
+	unsigned long long int __unused2;
+};
+#endif /* __hppa__ */
+
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define HAVE_IPC64_PERM
+/*
+ * The ipc64_perm structure for the powerpc is identical to
+ * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the
+ * kernel.  Note extra padding because this structure is passed back
+ * and forth between kernel and user space.  Pad space is left for:
+ *	- 1 32-bit value to fill up for 8-byte alignment
+ *	- 2 miscellaneous 64-bit values
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+struct ipc64_perm
+{
+	__kernel_key_t	key;
+	__kernel_uid_t	uid;
+	__kernel_gid_t	gid;
+	__kernel_uid_t	cuid;
+	__kernel_gid_t	cgid;
+	__kernel_mode_t	mode;
+	unsigned int	seq;
+	unsigned int	__pad1;
+	unsigned long long __unused1;
+	unsigned long long __unused2;
+};
+
+#endif /* defined(__powerpc__) || defined(__powerpc64__) */
+
+#if defined(__s390__)
+#define HAVE_IPC64_PERM
+/*
+ * The user_ipc_perm structure for S/390 architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 32-bit mode_t and seq
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct ipc64_perm
+{
+	__kernel_key_t		key;
+	__kernel_uid32_t	uid;
+	__kernel_gid32_t	gid;
+	__kernel_uid32_t	cuid;
+	__kernel_gid32_t	cgid;
+	__kernel_mode_t		mode;
+	unsigned short		__pad1;
+	unsigned short		seq;
+#ifndef __s390x__
+	unsigned short		__pad2;
+#endif /* ! __s390x__ */
+	unsigned long		__unused1;
+	unsigned long		__unused2;
+};
+
+#endif /* defined(__powerpc__) || defined(__powerpc64__) */
+
+#if defined(__sparc__)
+#define HAVE_IPC64_PERM
+/*
+ * The ipc64_perm structure for sparc/sparc64 architecture.
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * Pad space is left for:
+ * - 32-bit seq
+ * - on sparc for 32 bit mode (it is 32 bit on sparc64)
+ * - 2 miscellaneous 64-bit values
+ */
+
+struct ipc64_perm
+{
+	__kernel_key_t		key;
+	__kernel_uid32_t	uid;
+	__kernel_gid32_t	gid;
+	__kernel_uid32_t	cuid;
+	__kernel_gid32_t	cgid;
+#ifndef __arch64__
+	unsigned short		__pad0;
+#endif
+	__kernel_mode_t		mode;
+	unsigned short		__pad1;
+	unsigned short		seq;
+	unsigned long long	__unused1;
+	unsigned long long	__unused2;
+};
+
+#endif /* __sparc__ */
+
+#if defined(__xtensa__)
+#define HAVE_IPC64_PERM
+/*
+ * Pad space is left for:
+ * - 32-bit mode_t and seq
+ * - 2 miscellaneous 32-bit values
+ *
+ * This file is subject to the terms and conditions of the GNU General
+ * Public License.  See the file "COPYING" in the main directory of
+ * this archive for more details.
+ */
+
+struct ipc64_perm
+{
+	__kernel_key_t		key;
+	__kernel_uid32_t	uid;
+	__kernel_gid32_t	gid;
+	__kernel_uid32_t	cuid;
+	__kernel_gid32_t	cgid;
+	__kernel_mode_t		mode;
+	unsigned long		seq;
+	unsigned long		__unused1;
+	unsigned long		__unused2;
+};
+
+#endif /* __xtensa__ */
+
+#ifndef HAVE_IPC64_PERM
+/*
+ * The generic ipc64_perm structure:
+ * Note extra padding because this structure is passed back and forth
+ * between kernel and user space.
+ *
+ * ipc64_perm was originally meant to be architecture specific, but
+ * everyone just ended up making identical copies without specific
+ * optimizations, so we may just as well all use the same one.
+ *
+ * Pad space is left for:
+ * - 32-bit mode_t on architectures that only had 16 bit
+ * - 32-bit seq
+ * - 2 miscellaneous 32-bit values
+ */
+
+struct ipc64_perm {
+	__kernel_key_t		key;
+	__kernel_uid32_t	uid;
+	__kernel_gid32_t	gid;
+	__kernel_uid32_t	cuid;
+	__kernel_gid32_t	cgid;
+	__kernel_mode_t		mode;
+				/* pad if mode_t is u16: */
+	unsigned char		__pad1[4 - sizeof(__kernel_mode_t)];
+	unsigned short		seq;
+	unsigned short		__pad2;
+	__kernel_ulong_t	__unused1;
+	__kernel_ulong_t	__unused2;
+};
+
+#endif /* ipc64_perm */
+
+#endif /* HAVE_IPC64_PERM */
+
+#endif /* IPCBUF_H */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
