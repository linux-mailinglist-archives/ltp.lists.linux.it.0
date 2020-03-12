Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B03182FBE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 290053C5F07
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 038373C5EBE
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:41 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2601A1001F3A
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:41 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id bo3so1147865pjb.5
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnX6iGQKyJfa/w3Hn1unFiY1+JnA82tqH51NBs7fl5c=;
 b=SrZxiFlanlWKfw/TmMO0qfw8judj7w6IoTj9qqkoSAWNdJoiYZWgf8uIB9gcNGbBDW
 d0yCdE/r6bOFrOG1xD3KEjH4UqiwqoEIwT8XP/BhWD4Bvcgf64yvZTRleE1pBaMAQPX5
 7OAOKGlVWuE4HEpe6jH09vo++95Z0PZF5C0WKQQ2QjfGf7EwlVWkmIRYv3hwyd4W5RRk
 UpiiAJmpIh7DV9W+8LFdl+mc4Sog+dE6alGA3dVVHDmKesE53YI4axrxH0K88+tLLeH9
 o/CeGMI0wwzZzj0LWM6pRHMbFtk3JyZ5gB7bfbJYO9lLyQtD7xDucW0FjKEejl9s9bFq
 1gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnX6iGQKyJfa/w3Hn1unFiY1+JnA82tqH51NBs7fl5c=;
 b=IUoEjenhvF3fAR+yTMuaWjLGlakpON8cQ9k8+ag1jsteCZUBYX6Wdcfl8JssHlGCZO
 CZPG7dO+1hYBULot7i4DJyYhCtZFWtNoT+Z9ZuLv2OMYynU2qcDWDH0ixuwNvC+diEdD
 37MeuTxFdzr/i/sDMkFFY73waVaWzmpWyFNXloA/ipJox/iqGKs1cbVqIsL5BQ7ifgGR
 3zqHQYR5pxNogJWGJrRvEJ5zX5l6pM6n7r0pKvRYaTKtwXarJgr0gW1/zrPn0YyifQKv
 RUq/Et4uAeTWcYS0J70yWXFKT2qfjkTff83S0R2yL/51byvmE7EWey7NDQ7KhqH42Igl
 dapw==
X-Gm-Message-State: ANhLgQ0cRz4/I4ckqtUmn9GD4zHA4L7wwW6focWIeeDYfC/izHK3F4IV
 xLcDpRGVoBxj9Lbzk1D3WB54siXgH20=
X-Google-Smtp-Source: ADFU+vuzwY1ZsWvktW0HUTbkpD47FZCV6sE/QoJL7seeOKQWkLTZ+Ew7asOcSVj+aP+NcCatpvE5Tw==
X-Received: by 2002:a17:90a:8983:: with SMTP id
 v3mr3726192pjn.65.1584014499072; 
 Thu, 12 Mar 2020 05:01:39 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id u12sm53409206pfm.165.2020.03.12.05.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:38 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:07 +0530
Message-Id: <0345637ff16eb9232412028b20c11fc2c33620e9.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V6 07/10] syscalls/fsmount: Add failure tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds fsmount02.c tests to verify all the errors returned on
failures.

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
 testcases/kernel/syscalls/fsmount/fsmount02.c | 80 +++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 72e59059f98a..41d824562dde 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -346,6 +346,7 @@ fsconfig01 fsconfig01
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
index 000000000000..e3419200961c
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
+ *
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
+	TEST(fd = fsopen(tst_device->fs_type, 0));
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
+		tst_res(TFAIL, "%s: fsmount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: fsmount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
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
