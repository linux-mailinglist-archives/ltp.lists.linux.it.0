Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE341DCB54
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D024F3C4D73
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 12:48:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4EC703C4D47
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:47:57 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90C64600F01
 for <ltp@lists.linux.it>; Thu, 21 May 2020 12:47:27 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id ci21so2898356pjb.3
 for <ltp@lists.linux.it>; Thu, 21 May 2020 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LU8YOvI1+Vs/f/JH0fZMninv6yggQbHxL8DMw59JB8=;
 b=x8hp0ZajNZTkq8rRSnNZtSGt8JHsW0yRYDLJGhdZloTq2vjJsYJhVfkNOupQrriFtu
 BWHhvsyxZd8WlZMZUHFQSHbWEa4HZ0iC3DIBmBkOrST94VJH7gkE2TBoNs+DBrXkyx8p
 prMSmpsnOwtUNDV/vih8eIYpxhPY/Eny0AMcsRnhBskoQL11/QQWPhZVBpdtg0XjcGo/
 zpedo+MGTtgvFU/8Eqwyg77pp/P5sxYr8BlT7vFB4LIx4NZsHn6cDQk5QcN30XOuNBu0
 gowPPAY9tB/kNbZ4067OgUFlTxyClAMj+cipIXeh1rjmMJqIDMjGgwy0kxPdSFrSRgRg
 AgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LU8YOvI1+Vs/f/JH0fZMninv6yggQbHxL8DMw59JB8=;
 b=aVeBissdNiFMmksrlz80PNrk1upsCQMZdynllQUyLpM2qViyv78QVXjPC64Ugycm6F
 zFbCuJOP/SI9fGeGlsXhRJFoPDhyn6niR57ywqZg2ySVhceIw3cIBeq5QRtGVofC+KQU
 WtzqhdXQm44QvozqC8aKs4ROdBzDsUgzYnIEyCTARY6wDGTp/9RnjHaFlQ8UjL317dWS
 9yrNo3HP2maRuN9/mgTG/D9UPNnFvUPBJQ2FherXD7gS/3u6nUFsP1m0qf5qm9VcfVV5
 ualJ+obd0ECvHtJk48o/w1jUpkt2eFSoqZZnDXIUTlHosqhfhhhszqe1qDyLmFSX4XGX
 Itfg==
X-Gm-Message-State: AOAM533mxidiYjzDOv21JpmvtzAaGFn2uLKdZIVCISd8U8L1o6YKGdkQ
 dr79gkTIUi4Sjg2yZaPJ4BVUYmBSh8Y=
X-Google-Smtp-Source: ABdhPJxgX1+7feW22GuNqihk85Spj1IyzsZJmBwmcJIHZUOS4Wwvd0oPfR1vGwUvcyotLMZyLL+Wtw==
X-Received: by 2002:a17:902:9a83:: with SMTP id w3mr9159536plp.6.1590058070967; 
 Thu, 21 May 2020 03:47:50 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q44sm6356758pja.2.2020.05.21.03.47.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 03:47:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 21 May 2020 16:17:33 +0530
Message-Id: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590057824.git.viresh.kumar@linaro.org>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] include: Add declaration of struct ipc64_perm
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
 configure.ac     |  1 +
 include/ipcbuf.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
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
index 000000000000..85162296ab44
--- /dev/null
+++ b/include/ipcbuf.h
@@ -0,0 +1,45 @@
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
+#endif
+
+#endif /* IPCBUF_H */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
