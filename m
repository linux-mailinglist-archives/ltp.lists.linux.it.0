Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5516B9E3
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85E363C2618
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B5F8A3C2622
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:14 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 138BF6011BD
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:14 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id n7so6665671pfn.0
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+al83IlBlm9Pxz4eIN0mhj5bvL8SX/hlVgf5TQZhbI=;
 b=WZD2ADCkMPEpbG2Eul0Gi8xzIWk7SUMJ+j7C2BsE5IpwocByxxiB/nS/D04EYzxJl9
 Gd+lh7Mt59Ciw7JpfBsBLb+XkZAGWbvSwbhmVRzMUUbumiPkTXXVy9+qtIA+sRCMGPdc
 gvBG4LIb9Ui5xgu21jf1HloBS62dr060bQZ0+AXooUwxy+jTfO7XZct54peGzyBgs9qu
 zUeDKPjqWTCdYE9H1Ge+hNLQs2art51OIwAocp08HKHW8EpAWcs9z0XmwAfRuJ8tyzww
 yMo3SJyYjcIejGiA2A8uzdvKOUwOGRRUlK0Cdb/kIQJye+baOAr9piz3YwrAR0Pgmkoi
 Hr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+al83IlBlm9Pxz4eIN0mhj5bvL8SX/hlVgf5TQZhbI=;
 b=Tc8gsXN8s+yhdOpVN+SBS7iChnTLfNfFvJdxsRiGULE1H8PnkNGq3khwOQl1kQapu3
 /mfmPat2cNn6Vsk0Q+QvZjFJmXgrOZpLnkL/jebTknQBSmjlBcOtn4rUhvtADtwbcCHw
 IaaOn4enTRFK68vWHz09DYEqmVmZaRVa/Tj/E4k4oV5sIJZyPyS9MRUc8bqeyR2PdTKT
 PX6nZgYpP/xvfV8wV+4xvQ0fXA2jSFvVD8m+DpNsE3wgiKmRkLj+bxLCAiHgBe7nHy6I
 QwubBpb9+P+YzdY5uasFPnHGIYEd6AxzKYJ3s+UO9jBhGtFmaBG4ds97j5aO8SQZHtze
 JJ/Q==
X-Gm-Message-State: APjAAAUvbZWO/XVqE2Vc25xB7xQi1J4aUj1JdSfoIOOTPS0z4Ggv/knC
 miVZMs8mUFm3LUntugB361vh6tqWJMM=
X-Google-Smtp-Source: APXvYqy7HKJ3JhIC85Tzw4hmZW1Z9GsfQjnkRtVnnJbxMKnIp/QgFnAmMO8b+Rbu7OF5WXHEjvkMNg==
X-Received: by 2002:a63:fe4f:: with SMTP id x15mr57919296pgj.30.1582612872165; 
 Mon, 24 Feb 2020 22:41:12 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id r145sm15600470pfr.5.2020.02.24.22.41.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:41:11 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:45 +0530
Message-Id: <3038d7fa9aacb60da1820321e574d765f48aa268.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V3 07/10] syscalls/fsmount: Add failure tests
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
 testcases/kernel/syscalls/fsmount/fsmount02.c | 79 +++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index ebfbdfb4d5aa..9f61a7e6682d 100644
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
index 000000000000..c61caa8e8808
--- /dev/null
+++ b/testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -0,0 +1,79 @@
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
+		tst_res(TFAIL, "%s: fsmount() succeeded unexpectedly (index: %d)",
+			tc->name, n);
+	} else if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: fsmount() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	} else {
+		tst_res(TPASS | TTERRNO, "%s: fsmount() failed as expected",
+			tc->name);
+	}
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
