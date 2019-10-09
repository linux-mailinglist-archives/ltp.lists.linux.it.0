Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB03D112A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:26:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04ABD3C2288
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:26:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0E42F3C209D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:26:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5CF901A01528
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:26:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67183AE55;
 Wed,  9 Oct 2019 14:26:00 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  9 Oct 2019 16:24:46 +0200
Message-Id: <20191009142446.6997-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
Cc: "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernelci@groups.io, George Kennedy <george.kennedy@oracle.com>,
 syzkaller@googlegroups.com, automated-testing@yoctoproject.org,
 chrubis@suse.com, shuah <shuah@kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

First attempt at wrapping the Syzkaller reproducers in the LTP library. I am
posting this in case anyone wants to experiment with it early or has a
radically different approach in mind.

This just uses exec to run the reproducer executables as per Metan's
suggestion. There is a simple script which creates a runtest file allowing it
to work with existing LTP test runners, albeit with a bit of extra work for
now.

This would benefit from the following LTP library patch:
https://patchwork.ozlabs.org/patch/935568/

Running it without KASAN and the other kernel debugging options is not a good
idea. We can easily detect when the kernel config is wrong and print a
warning or even refuse to run, but I haven't added it yet.

Having to download, compile and install the reproducers seperately is annoying
and I bet most users won't do it. We can probably automate that as part of the
install, it is just a question of how much we do as default.

---
 runtest/.gitignore                            |  1 +
 testcases/kernel/Makefile                     |  1 +
 testcases/kernel/syzkaller-repros/.gitignore  |  1 +
 testcases/kernel/syzkaller-repros/Makefile    | 10 +++
 testcases/kernel/syzkaller-repros/README.md   | 39 +++++++++
 .../kernel/syzkaller-repros/gen-runtest.sh    |  8 ++
 testcases/kernel/syzkaller-repros/syzwrap.c   | 85 +++++++++++++++++++
 7 files changed, 145 insertions(+)
 create mode 100644 runtest/.gitignore
 create mode 100644 testcases/kernel/syzkaller-repros/.gitignore
 create mode 100644 testcases/kernel/syzkaller-repros/Makefile
 create mode 100644 testcases/kernel/syzkaller-repros/README.md
 create mode 100755 testcases/kernel/syzkaller-repros/gen-runtest.sh
 create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c

diff --git a/runtest/.gitignore b/runtest/.gitignore
new file mode 100644
index 000000000..e3725dd42
--- /dev/null
+++ b/runtest/.gitignore
@@ -0,0 +1 @@
+syzkaller-repros
diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 3319b3163..0150cfb4f 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -53,6 +53,7 @@ SUBDIRS			+= connectors \
 			   sched \
 			   security \
 			   sound \
+			   syzkaller-repros \
 			   tracing \
 			   uevents \
 
diff --git a/testcases/kernel/syzkaller-repros/.gitignore b/testcases/kernel/syzkaller-repros/.gitignore
new file mode 100644
index 000000000..dbda1c71f
--- /dev/null
+++ b/testcases/kernel/syzkaller-repros/.gitignore
@@ -0,0 +1 @@
+syzwrap
diff --git a/testcases/kernel/syzkaller-repros/Makefile b/testcases/kernel/syzkaller-repros/Makefile
new file mode 100644
index 000000000..8e74805c2
--- /dev/null
+++ b/testcases/kernel/syzkaller-repros/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Linux Test Project
+
+top_srcdir		?= ../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CFLAGS			+= -D_GNU_SOURCE
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syzkaller-repros/README.md b/testcases/kernel/syzkaller-repros/README.md
new file mode 100644
index 000000000..e95ae19e2
--- /dev/null
+++ b/testcases/kernel/syzkaller-repros/README.md
@@ -0,0 +1,39 @@
+LTP wrapper for Syzkaller reproducers
+=====================================
+
+This allows you to run the autogenerated bug reproducers from the Syzkaller
+fuzzer within the LTP framework. Meaning that you may use an existing test
+runner compatible with the LTP.
+
+However some extra setup is currently required.
+
+Instructions
+------------
+
+1. Download and compile the reproducers.
+2. Build the LTP as normal
+3. Use the gen-runtest.sh script to create a runtest file
+4. Install the LTP and the reproducers to the SUT
+5. Execute the tests in the syzkaller-repros runtest file
+
+For now you can download the reproducers from here:
+https://github.com/dvyukov/syzkaller-repros. Soon they will be available on
+kernel.org.
+
+The gen-runtest takes two arguments:
+
+1. The directory where the reproducer executables are currently accessible
+2. The *absolute* path to the directory where they will be on the SUT (If
+   different, can be omitted)
+
+For example:
+```
+./gen-runtest.sh ~/qa/syzkaller-repros/bin /mnt/syzkaller-repros/bin >
+~/qa/ltp-build/runtest/syzkaller-repros
+```
+
+For the LTP, just doing `make install` will copy all the relevant files
+(assuming you put the runtest file in the runtest folder). However you will
+need to copy the reproducers yourself.
+
+
diff --git a/testcases/kernel/syzkaller-repros/gen-runtest.sh b/testcases/kernel/syzkaller-repros/gen-runtest.sh
new file mode 100755
index 000000000..091818fb2
--- /dev/null
+++ b/testcases/kernel/syzkaller-repros/gen-runtest.sh
@@ -0,0 +1,8 @@
+#!/usr/bin/sh
+
+BUILD_DIR=$1
+SUT_DIR=$2
+
+for f in $(ls $BUILD_DIR); do
+    echo $f syzwrap -d ${SUT_DIR:-$BUILD_DIR} -n $f
+done
diff --git a/testcases/kernel/syzkaller-repros/syzwrap.c b/testcases/kernel/syzkaller-repros/syzwrap.c
new file mode 100644
index 000000000..7951d1819
--- /dev/null
+++ b/testcases/kernel/syzkaller-repros/syzwrap.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ *
+ * Run a single reproducer generated by the Syzkaller fuzzer.
+ */
+
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <signal.h>
+#include <stdio.h>
+
+#include "tst_test.h"
+#include "tst_taint.h"
+#include "tst_safe_stdio.h"
+
+static char *dir;
+static char *name;
+static char *path;
+
+static struct tst_option options[] = {
+	{"d:", &dir, "Mandatory directory containing reproducers"},
+	{"n:", &name, "Mandatory executable name of reproducer"},
+	{NULL, NULL, NULL}
+};
+
+static void setup(void)
+{
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	if (!dir)
+		tst_brk(TBROK, "No reproducer directory specified");
+
+	if (!name)
+		tst_brk(TBROK, "No reproducer name specified");
+
+	tst_res(TINFO, "https://syzkaller.appspot.com/bug?id=%s", name);
+
+	SAFE_ASPRINTF(&path, "%s/%s", dir, name);
+	tst_res(TINFO, "%s", path);
+}
+
+static void run(void)
+{
+	unsigned int backoff = 100;
+	int rem, status, sent_kill = 0;
+	float exec_time_start = (float)tst_timeout_remaining();
+	int pid = SAFE_FORK();
+
+	if (!pid) {
+		execle(path, name, environ);
+		tst_brk(TBROK | TERRNO, "Failed to exec reproducer");
+	}
+
+	while (!waitpid(pid, &status, WNOHANG)) {
+		rem = tst_timeout_remaining();
+
+		if (!sent_kill && rem / exec_time_start < 0.98) {
+			tst_res(TINFO, "Timeout; killing reproducer");
+
+			TEST(kill(pid, SIGKILL));
+			if (TST_RET == -1)
+				tst_res(TWARN | TTERRNO, "kill() failed");
+			else
+				sent_kill = 1;
+		}
+
+		usleep(backoff);
+		backoff = MIN(2 * backoff, 1000000);
+	}
+
+	if (tst_taint_check()) {
+		tst_res(TFAIL, "Kernel is tainted");
+	} else {
+		tst_res(TPASS, "Kernel is not tainted");
+	}
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.options = options,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
