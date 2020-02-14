Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A530415D697
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3541C3C2575
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B0C5B3C13BB
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:09 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E5CF81039BFC
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:08 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id y5so4761772pfb.11
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iHf3cPiPPOdXuO7OQXLPVT4zgXtK+W1TZR7hU3hx1w=;
 b=qpeo1Ye4udtIt4vYtt5gxAHiLuOokf/Nag8suFvfyvlE+25NqcBUnofxV2T3TZw5Xd
 6/MNwf36z35IWLfdrw6WKgS18lOup0v49Ag83EmSXE83uUpl64dqsBmMm/HlZQk15NAF
 Mo874jq6qd4avknWV84SJPBIx04Pojm0V8lu1ukPqrwYlFeVzevgIOQfBlxX0v4VjLSq
 oxnZ10OG9Tia7Ts6nFaywJqu79FUXGEZF+N4SboViDoP1zGvUNZt5W5tnFbDIsXuiYU1
 TQcGyQaoKYKsp6jkAplD9NIYEBsqcEuqZ5fMOKSsuUl2y5DjsE0KLEXa5U4yo6EhtMoE
 9jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1iHf3cPiPPOdXuO7OQXLPVT4zgXtK+W1TZR7hU3hx1w=;
 b=EkjvPVOJZLQjpUrIxymuQd0ekxt8Hwsv/JSMaceqAvsPg8q7IjZVo3UERGYe0KeiRb
 F1QhEFxdukXV6I26+Y7p5oYyuE4TN8ihLqxpPZjry9FlLTWXRRSe3nDq+s9yXhJKu9Yv
 8ocUD9PC+nTPZulU9zWHuaPhK0AM8Ljxn/EWcG4lKxpSvqcA2ONKZjJhPi3M4zhL5Vxt
 sK/rCn0egzwIwxPyaATPStAWuqz1w+KpnQ5nkGvhGA035O+sUhdlbrjhqwvxih4IhFK+
 KniWSknX4xLgVhuOwvpVMgwHWQdGwltYqpAboGM5HnwSBpYpFEsjYSGUxcnYGYfZQpce
 IAFg==
X-Gm-Message-State: APjAAAV4a3adC5w14FLYza0xpxoO00rOs06QX8YQXJymRMC4IB8/Hcqz
 0y6rZKV7nta8OLSF3KBIVLWwIg==
X-Google-Smtp-Source: APXvYqzZgyn99ttcB+NHRpKQlwWLapmFpFrk5x2DzBH4e939adwz5d/ZqOTm0U4GidGRfAyDDWBAHg==
X-Received: by 2002:a63:ba19:: with SMTP id k25mr3181616pgf.333.1581680167394; 
 Fri, 14 Feb 2020 03:36:07 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id 84sm7033595pgg.90.2020.02.14.03.36.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:06 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:50 +0530
Message-Id: <98f8a5780f679b90f53fdded8b1b8821d7eb1ce9.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1581680021.git.viresh.kumar@linaro.org>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] lapi/fsmount: Add definitions for fsmount related
 syscalls
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds definitions for all fsmount related syscalls which will be
used by multiple syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h | 134 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 include/lapi/fsmount.h

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
new file mode 100644
index 000000000000..a384526e6a14
--- /dev/null
+++ b/include/lapi/fsmount.h
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef FSMOUNT_H
+#define FSMOUNT_H
+
+#include <fcntl.h>
+#include <sys/mount.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+
+#include "config.h"
+#include "lapi/syscalls.h"
+
+#ifndef HAVE_FSOPEN
+int fsopen(const char *fsname, unsigned int flags)
+{
+	return tst_syscall(__NR_fsopen, fsname, flags);
+}
+#endif /* HAVE_FSOPEN */
+
+#ifndef HAVE_FSCONFIG
+int fsconfig(int fd, unsigned int cmd, const char *key,
+	     const void *value, int aux)
+{
+	return tst_syscall(__NR_fsconfig, fd, cmd, key, value, aux);
+}
+#endif /* HAVE_FSCONFIG */
+
+#ifndef HAVE_FSMOUNT
+int fsmount(int fd, unsigned int flags, unsigned int mount_attrs)
+{
+	return tst_syscall(__NR_fsmount, fd, flags, mount_attrs);
+}
+#endif /* HAVE_FSMOUNT */
+
+#ifndef HAVE_FSPICK
+int fspick(int dirfd, const char *pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_fspick, dirfd, pathname, flags);
+}
+#endif /* HAVE_FSPICK */
+
+#ifndef HAVE_MOVE_MOUNT
+int move_mount(int from_dirfd, const char *from_pathname, int to_dirfd,
+	       const char *to_pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_move_mount, from_dirfd, from_pathname, to_dirfd,
+			   to_pathname, flags);
+}
+#endif /* HAVE_MOVE_MOUNT */
+
+#ifndef HAVE_OPEN_TREE
+int open_tree(int dirfd, const char *pathname, unsigned int flags)
+{
+	return tst_syscall(__NR_open_tree, dirfd, pathname, flags);
+}
+#endif /* HAVE_OPEN_TREE */
+
+/*
+ * New headers added in kernel after 5.2 release, create them for old userspace.
+*/
+
+#ifndef OPEN_TREE_CLONE
+
+/*
+ * open_tree() flags.
+ */
+#define OPEN_TREE_CLONE		1		/* Clone the target tree and attach the clone */
+#define OPEN_TREE_CLOEXEC	O_CLOEXEC	/* Close the file on execve() */
+
+/*
+ * move_mount() flags.
+ */
+#define MOVE_MOUNT_F_SYMLINKS		0x00000001 /* Follow symlinks on from path */
+#define MOVE_MOUNT_F_AUTOMOUNTS		0x00000002 /* Follow automounts on from path */
+#define MOVE_MOUNT_F_EMPTY_PATH		0x00000004 /* Empty from path permitted */
+#define MOVE_MOUNT_T_SYMLINKS		0x00000010 /* Follow symlinks on to path */
+#define MOVE_MOUNT_T_AUTOMOUNTS		0x00000020 /* Follow automounts on to path */
+#define MOVE_MOUNT_T_EMPTY_PATH		0x00000040 /* Empty to path permitted */
+#define MOVE_MOUNT__MASK		0x00000077
+
+/*
+ * fsopen() flags.
+ */
+#define FSOPEN_CLOEXEC		0x00000001
+
+/*
+ * fspick() flags.
+ */
+#define FSPICK_CLOEXEC		0x00000001
+#define FSPICK_SYMLINK_NOFOLLOW	0x00000002
+#define FSPICK_NO_AUTOMOUNT	0x00000004
+#define FSPICK_EMPTY_PATH	0x00000008
+
+/*
+ * The type of fsconfig() call made.
+ */
+enum fsconfig_command {
+	FSCONFIG_SET_FLAG	= 0,	/* Set parameter, supplying no value */
+	FSCONFIG_SET_STRING	= 1,	/* Set parameter, supplying a string value */
+	FSCONFIG_SET_BINARY	= 2,	/* Set parameter, supplying a binary blob value */
+	FSCONFIG_SET_PATH	= 3,	/* Set parameter, supplying an object by path */
+	FSCONFIG_SET_PATH_EMPTY	= 4,	/* Set parameter, supplying an object by (empty) path */
+	FSCONFIG_SET_FD		= 5,	/* Set parameter, supplying an object by fd */
+	FSCONFIG_CMD_CREATE	= 6,	/* Invoke superblock creation */
+	FSCONFIG_CMD_RECONFIGURE = 7,	/* Invoke superblock reconfiguration */
+};
+
+/*
+ * fsmount() flags.
+ */
+#define FSMOUNT_CLOEXEC		0x00000001
+
+/*
+ * Mount attributes.
+ */
+#define MOUNT_ATTR_RDONLY	0x00000001 /* Mount read-only */
+#define MOUNT_ATTR_NOSUID	0x00000002 /* Ignore suid and sgid bits */
+#define MOUNT_ATTR_NODEV	0x00000004 /* Disallow access to device special files */
+#define MOUNT_ATTR_NOEXEC	0x00000008 /* Disallow program execution */
+#define MOUNT_ATTR__ATIME	0x00000070 /* Setting on how atime should be updated */
+#define MOUNT_ATTR_RELATIME	0x00000000 /* - Update atime relative to mtime/ctime. */
+#define MOUNT_ATTR_NOATIME	0x00000010 /* - Do not update access times. */
+#define MOUNT_ATTR_STRICTATIME	0x00000020 /* - Always perform atime updates */
+#define MOUNT_ATTR_NODIRATIME	0x00000080 /* Do not update directory access times */
+
+#endif /* OPEN_TREE_CLONE */
+
+
+#endif /* FSMOUNT_H */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
