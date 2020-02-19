Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4CB164062
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:29:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B7A93C2532
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:29:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 99E413C2456
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:35 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DAB482011F9
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:34 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id b22so9314807pls.12
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gREXfolvfhmnQd7pj0HqIASlKZzAy/ZKCGdWJkQEcY=;
 b=Oxgz8A041sChJwpfQmksyKq46v9QVf8l8dfapeMba3IMPeeO6pmEmNHDgu0thE4SQx
 /faVzOoSpFLCpZVO6MH1N92qvRW1TBP5fj3uCGELKhhbEXikvmNgo9EDa3LMlS9cExj+
 vFLP0F8OglWJ6dxl/WMTL0OduMlEsW5Sm0bUoyZc6/aBoYapCiGn9utjQ3oicSAEWwkx
 Rx/zNjHglrsKANVV7uGQIIxPvkRJCv27ZMKSbUej/EGaXFI67To6KIgNEcm+/elnICEf
 trdMFMX+xwpf82idMXZeMpzvxbroE7NC2QF/bVNCGUcJzaf/7I4NbXNiskzepcAc3ijK
 bS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gREXfolvfhmnQd7pj0HqIASlKZzAy/ZKCGdWJkQEcY=;
 b=k5E55/brEJ6HHgd5/QVuUXf41sQwKCi5NaEacIBOXLR3CYYbx5Pghz6umkfKjU0On8
 cZ/QegioXCDzLyE35+8CKUvmsh1n9Od/LTBjIyLwIRVHoGKbTeQFgB6bF6QOhDE4+4yB
 D6S61BOJHCohjSPsmrZ5cs3kt5xkeIjTWAEDycdNAZwbuOXIbPHkvmREL+RLqrY/ZN11
 iMkwN8v/71hb0u5oi1JwnKFf+PQi6CdT0W0pzz/GoMnLtYMUnM5XX5l6oeMhnpOC+PGM
 BvG25aTB9LbOu6c+lZJPN96Uz20CYpsio5BRGUd70OfkfyxKP91LQk8HTBDztTVoBrKU
 4/0Q==
X-Gm-Message-State: APjAAAXsmokjfD6AE2z3jgphSjbUlzjKDmdjzd/DiNQaj/9CoHpuZyKU
 0r9jhbkBsPmu08Z1S7KXQFHSggSscNs=
X-Google-Smtp-Source: APXvYqwK6o1aqbCpu2NopnPvXm8qA5MZjIgUCAG9TzPirVW5ML/NpKlS3Umhfh+hHRYg3jJygnGesw==
X-Received: by 2002:a17:90a:e389:: with SMTP id b9mr7900052pjz.7.1582104512977; 
 Wed, 19 Feb 2020 01:28:32 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id az9sm1781589pjb.3.2020.02.19.01.28.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:32 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:58:03 +0530
Message-Id: <98ee754dfa93fa8e9d026fd8aa57ac1c4a94795c.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 07/10] syscalls/fsmount: Add failure tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds fsmount02.c tests to verify all the errors returned on
failures.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
 testcases/kernel/syscalls/fsmount/fsmount02.c | 81 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 4fcbd5f710eb..5b652a518dc6 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -345,6 +345,7 @@ fsconfig01 fsconfig01
 fsconfig02 fsconfig02
 
 fsmount01 fsmount01
+fsmount02 fsmount02
 
 fsopen01 fsopen01
 fsopen02 fsopen02
diff --git a/testcases/kernel/syscalls/fsmount/.gitignore b/testcases/kernel/syscalls/fsmount/.gitignore
index e2f01ea17a40..7b77c5e33ee6 100644
--- a/testcases/kernel/syscalls/fsmount/.gitignore
+++ b/testcases/kernel/syscalls/fsmount/.gitignore
@@ -1 +1,2 @@
 /fsmount01
+/fsmount02
diff --git a/testcases/kernel/syscalls/fsmount/fsmount02.c b/testcases/kernel/syscalls/fsmount/fsmount02.c
new file mode 100644
index 000000000000..cdb43612ae75
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Description:
+ * Basic fsmount() failure tests.
+ */
+#include "tst_test.h"
+#include "lapi/fsmount.h"
+
+int fd = -1, invalid_fd = -1;
+
+#define MNTPOINT	"mntpoint"
+
+static struct tcase {
+	char *name;
+	int *fd;
+	unsigned int flags;
+	unsigned int mount_attrs;
+	int exp_errno;
+} tcases[] = {
+	{"invalid-fd", &invalid_fd, FSMOUNT_CLOEXEC, 0, EBADF},
+	{"invalid-flags", &fd, 0x02, 0, EINVAL},
+	{"invalid-attrs", &fd, FSMOUNT_CLOEXEC, 0x100, EINVAL},
+};
+
+static void cleanup(void)
+{
+	if (fd != -1)
+		SAFE_CLOSE(fd);
+}
+
+static void setup(void)
+{
+	fsopen_supported_by_kernel();
+
+	TEST(fsopen(tst_device->fs_type, 0));
+	fd = TST_RET;
+
+	if (fd == -1)
+		tst_brk(TBROK | TERRNO, "fsopen() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+
+	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	TEST(fsmount(*tc->fd, tc->flags, tc->mount_attrs));
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		tst_brk(TFAIL, "%s: fsmount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_brk(TFAIL | TTERRNO, "%s: fsmount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	}
+
+	tst_res(TPASS | TTERRNO, "%s: fsmount() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.format_device = 1,
+	.all_filesystems = 1,
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+};
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
