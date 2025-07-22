Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5856B0D22D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jul 2025 08:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1753167367; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=VPkdf6Ozgfq2dM2qUynfKY32mhA197ogtB8R6kolH2w=;
 b=rLagECRU78Q/KOLZ73G90lwuVMNmF17MDq/uzKix22Zmpwdq/wlAPzf/yJwtZUIhNe1zT
 t4w76eKnyFPrjMEXPXJyqO807tFxr7GchMbg4RkON3lkoWzsA5+dRCp8I2MtzN+RAjeIPp0
 UK3LJdl//YY7jW3d9DkR1cyouu2QxwA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 997983CCC60
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jul 2025 08:56:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC3E03CBE23
 for <ltp@lists.linux.it>; Tue, 22 Jul 2025 08:55:54 +0200 (CEST)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9615A200AC5
 for <ltp@lists.linux.it>; Tue, 22 Jul 2025 08:55:53 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so23310395e9.3
 for <ltp@lists.linux.it>; Mon, 21 Jul 2025 23:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1753167353; x=1753772153; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoQLOptltGAo0SWLJ8//WcWAwVPR0ItiFrJhjV3qwq8=;
 b=MXBffP5FaqS4PXTIVmUE3biMQs+qE6JBD0V+NlOQRDPRydd5NjCCbm3047iK+bynjp
 W9J4X0wNoxKJfily8XHTYCF3mbt+I55G87ffR6EEXRGorCkrjWg1p9P8FNtMUfrV5FM7
 uy28x6XDhuon+UaM265o8wJN5y+Uuj3+9dSeEXE95h8FOJgDBhO9FbUee0qm6peaSrl4
 sosFRDHgN+pstRs29mcHBrCInqQ/FSEFNXgKk3ZtCAA0bdazrtFcQ7DrlneZ6Axn9ikZ
 u0DS0XQHSd3iOVMhyWT4pHP4d+nuOfRDLX4fBDjFch0nUcA4Dz4RkMsj3JF0uUQMw3mW
 NbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753167353; x=1753772153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoQLOptltGAo0SWLJ8//WcWAwVPR0ItiFrJhjV3qwq8=;
 b=GoLYKbud0OJaPqrFCCD54JS/qDi2wAeojAAx5srlEeZN9SXgC3VKIujvtRSN0Lg+N6
 jfZqfLJOqw5P8fbB0t5DEZlavD9P/w+63qvxIcPTX9vqG4x1F4IGYyUD+4Ev1v+YRWwS
 e3XEsFIbdrHV1xK89w1418veOewzmr4SqlJ7OpeFyA3YGBG7L53giUsxbtyktr+6JSnF
 RuALp2FEM0Z86IVRvT8lKzDMc7gp+EBv4a3SWESlYsfxDkZxKJtNKLdZzS+lv6B+Vyu0
 Ky2HsnccHVOFQVJaI37M2/wKV/XtSz4PuURGDQzVTwFppcY86TrcnNChk/E78T2cTCFE
 QfAA==
X-Gm-Message-State: AOJu0YxfnUssgnLGKMDJ7C2yrlwah0NwqQ4ZoQSE/FwYn7P6AOMqfF6c
 YJPR7E4kWmUztE+KGkVOrMCVBBFb86O/995W7hiQfmasbesKdTbFvK4Sj9m1ixttLYgwqdcF6ZP
 pnYU=
X-Gm-Gg: ASbGnct1zAvrrwXAUBGmFryUIGLcAzmsFe2yW8IfT9ySbN7v8i8ah9zw9RjhW9tsKfJ
 gORk879we76NmT+NbSW5DaR/uGUnanFUlDXUwGyn98N+JTnmQC24RzSO41mM3LY1FgCrZw3/vI8
 ANqER1idD+ix6tYptfVH77/H3qXDDbHB6REQgGnYfunCAiNnkNuSXJ8IbPL5jsr1UgEypF/e1ju
 wgX/8PX3W+jBdF1H2JN9jcA2gaRtK8eLSr3SQx5NBwiej0Gp2ANQjImxJmdSVQwf815rS2Z3IAQ
 kZd3qOfmpyXCuWEJrVkEiTsaTXM9oDRxE77HDLkYw32V374ywqpDtfIJrfnB/ki4HhuJ3+HU787
 Ru4i/z+oJ2N6Wawv2xM6JRQ==
X-Google-Smtp-Source: AGHT+IGTRt/LwcdEjpKpGswpmlUXDvUqTgJLR5wVjMrYXkKM3mHiI840HxymH8VJTBWVi3uDEQg+TA==
X-Received: by 2002:a5d:5d11:0:b0:3a6:f2da:7fe5 with SMTP id
 ffacd0b85a97d-3b60ddc6571mr17756544f8f.55.1753167352772; 
 Mon, 21 Jul 2025 23:55:52 -0700 (PDT)
Received: from localhost ([202.127.77.110])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b3f2fe8dd22sm6344027a12.30.2025.07.21.23.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 23:55:52 -0700 (PDT)
To: ltp@lists.linux.it
Date: Tue, 22 Jul 2025 14:54:55 -0400
Message-ID: <20250722185503.3224765-1-wegao@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721200428.2627117-1-wegao@suse.com>
References: <20250721200428.2627117-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v6] mount08.c: Restrict overmounting of ephemeral
 entities
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a new test to verify that mount will raise ENOENT if we try to mount
on magic links under /proc/<pid>/fd/<nr>.
Refer to the following kernel commit for more information:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d80b065bb172

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                           |  1 +
 testcases/kernel/syscalls/mount/.gitignore |  1 +
 testcases/kernel/syscalls/mount/mount08.c  | 57 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mount/mount08.c

diff --git a/runtest/syscalls b/runtest/syscalls
index e738c332b..3531c2a3c 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -865,6 +865,7 @@ mount04 mount04
 mount05 mount05
 mount06 mount06
 mount07 mount07
+mount08 mount08
 
 mount_setattr01 mount_setattr01
 
diff --git a/testcases/kernel/syscalls/mount/.gitignore b/testcases/kernel/syscalls/mount/.gitignore
index 80885dbf0..3eee5863a 100644
--- a/testcases/kernel/syscalls/mount/.gitignore
+++ b/testcases/kernel/syscalls/mount/.gitignore
@@ -6,3 +6,4 @@
 /mount05
 /mount06
 /mount07
+/mount08
diff --git a/testcases/kernel/syscalls/mount/mount08.c b/testcases/kernel/syscalls/mount/mount08.c
new file mode 100644
index 000000000..e2824ac55
--- /dev/null
+++ b/testcases/kernel/syscalls/mount/mount08.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Wei Gao <wegao@suse.com>
+ */
+
+/*\
+ * Verify that mount will raise ENOENT if we try to mount on magic links
+ * under /proc/<pid>/fd/<nr>.
+ */
+
+#include "tst_test.h"
+#include <sys/mount.h>
+#include "tst_safe_file_at.h"
+
+#define MNTPOINT "mntpoint"
+#define FOO MNTPOINT "/foo"
+#define BAR MNTPOINT "/bar"
+
+static void run(void)
+{
+	char path[PATH_MAX];
+	int fd, proc_fd;
+
+	fd = SAFE_OPEN(FOO, O_RDONLY | O_NONBLOCK, 0640);
+
+	sprintf(path, "/proc/%d/fd/%d", getpid(), fd);
+
+	proc_fd = SAFE_OPENAT(AT_FDCWD, path, O_PATH | O_NOFOLLOW);
+
+	sprintf(path, "/proc/%d/fd/%d", getpid(), proc_fd);
+
+	TST_EXP_FAIL(
+		mount(BAR, path, "", MS_BIND, 0),
+		ENOENT,
+		"mount(%s)", path
+	);
+
+	SAFE_CLOSE(fd);
+	SAFE_CLOSE(proc_fd);
+}
+
+static void setup(void)
+{
+	SAFE_TOUCH(FOO, 0777, NULL);
+	SAFE_TOUCH(BAR, 0777, NULL);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "d80b065bb172"},
+		{}
+	}
+};
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
