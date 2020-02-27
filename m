Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01D17100A
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CBDD3C25DB
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:16:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7ABAA3C25C3
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:06 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1BAE51A00F0D
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:15:06 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id p14so993551pfn.4
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nz8ejQcOkPD1Cz0pgtihg9qjxAW5FHPOvnunWec1iNg=;
 b=EMwoGoMqNW5b2bSEtnTpfGFlyTE0TIHMN3U7LA/bxI1+2uK8Jtbx4YLal0fs6CkC5E
 w56qG38K947JyA7pV3zmnSPtuovH/tX8zM0m/SnfqTOWFrbFyfzPu0zIRqo/S7xx5c1J
 ZecENg7D+lxAVAAFo/J5CyR6RZ/nO32NQttOZglEpBvkuiKWLG+H8seDihzdWBvvsP5l
 k1DXBls6cGrWzB6H8zqU+inV58UmyofCnO62bSV630gTTT1HZsH5pMS1aR6qlWU7zSRh
 uOGGofnSQN589Wg0UohuLqDRmLG+t83FJPCeBJyJi7Y2i4TM4YUKF2YGJA8gL9+IVSqn
 Tpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nz8ejQcOkPD1Cz0pgtihg9qjxAW5FHPOvnunWec1iNg=;
 b=A2r/HYt7lc8G98G0whS6RsVzbiAOy+5WKkfigwxKhL7BC82kzBgRbofy4+V/utfmPj
 fwOckaiZemrts9IXQt3/fXr9/J0LHh0d8r6DAD1ikQSgQVK6J1lg8N3xLtCsBxsH6/Jd
 Fe6kni0na/Ee26ZxZ6vgbY1shq1x5Z2+SgKXIRYd9QjK9Bm9hHb9zMk+WAO0SiWZkMP6
 Ap9RwOZQ6EM04tU2r6m6ANsGK09EP0j2JxboONluJI8N+Mm8J4GdTkpxfKgy30Fshdak
 n707CAYqUVksHFOTJrKR7QWPGTdAl/ZPrw7+b/Rq465h25KUYylbfUcSS9aAD7jLIf9z
 zdHA==
X-Gm-Message-State: APjAAAXTort3CuhUfmL1vup6TLtENHLs/y1FfIPDdjBJgQHyyxuTMSQx
 ldf+Cn73cA4oJqg7npovd39rmxS6vps=
X-Google-Smtp-Source: APXvYqwP+oI4otNR+0kibPH7fId8rPIuACCPQ8DW6dQ2NSCLTTdquiZLUZ2aKG31xwAoyS5UQ2lAvw==
X-Received: by 2002:aa7:864f:: with SMTP id a15mr2248293pfo.184.1582780504214; 
 Wed, 26 Feb 2020 21:15:04 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id p21sm4791913pfn.103.2020.02.26.21.15.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:15:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:35 +0530
Message-Id: <4e16d9ee8734fe9f532df99ac9db5bcaf1daee17.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V5 07/10] syscalls/fsmount: Add failure tests
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

Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
 testcases/kernel/syscalls/fsmount/fsmount02.c | 80 +++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 97c0fea2fe57..1ac8c84d2567 100644
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
