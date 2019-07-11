Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B06584D
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 15:58:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25B333C1C90
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 15:58:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 09E333C02C3
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 15:58:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8AB681000353
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 15:58:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66ABFAF1B
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 13:58:50 +0000 (UTC)
Received: by localhost (Postfix, from userid 1000)
 id 31E21829CE; Thu, 11 Jul 2019 15:58:50 +0200 (CEST)
From: Michael Moese <mmoese@suse.de>
To: ltp@lists.linux.it
Date: Thu, 11 Jul 2019 15:58:45 +0200
Message-Id: <20190711135845.14177-1-mmoese@suse.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Add a regression test for CVE-2017-1000380
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A race condition was present in the linux kernel, which could lead to
a leak of arbitrary kernel memory to userspace applications.

The issue was fixed in those kernel commits:
 http://git.kernel.org/linus/d11662f4f798b50d8c8743f433842c3e40fe3378
 http://git.kernel.org/linus/ba3021b2c79b2fa9114f92790a99deb27a65b728

This patch adds a regression test triggering this race condition.

Signed-off-by: Michael Moese <mmoese@suse.de>
---

Changes to v1:
 - Initialize buffers in ioctl_thread() outside of the loop
 - use return unused() instead of a void* cast of NULL in ioctl_thread()
 - reset non-zero flag in run() for every iteration of the main loop
---
 runtest/cve                          |   1 +
 testcases/kernel/Makefile            |   1 +
 testcases/kernel/sound/.gitignore    |   1 +
 testcases/kernel/sound/Makefile      |  12 +++
 testcases/kernel/sound/snd_timer01.c | 140 +++++++++++++++++++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 testcases/kernel/sound/.gitignore
 create mode 100644 testcases/kernel/sound/Makefile
 create mode 100644 testcases/kernel/sound/snd_timer01.c

diff --git a/runtest/cve b/runtest/cve
index 031bcdc2a..33c9196e0 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -36,6 +36,7 @@ cve-2017-17052 cve-2017-17052
 cve-2017-16939 cve-2017-16939
 cve-2017-17053 cve-2017-17053
 cve-2017-18075 pcrypt_aead01
+cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-1000001 realpath01
 cve-2018-19854 crypto_user01
diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 39d79c7d8..eff5b3e7d 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -52,6 +52,7 @@ SUBDIRS			+= connectors \
 			   pty \
 			   sched \
 			   security \
+			   sound \
 			   timers \
 			   tracing \
 
diff --git a/testcases/kernel/sound/.gitignore b/testcases/kernel/sound/.gitignore
new file mode 100644
index 000000000..57eae0593
--- /dev/null
+++ b/testcases/kernel/sound/.gitignore
@@ -0,0 +1 @@
+snd_timer
diff --git a/testcases/kernel/sound/Makefile b/testcases/kernel/sound/Makefile
new file mode 100644
index 000000000..5fdc7dd42
--- /dev/null
+++ b/testcases/kernel/sound/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		:= ../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CPPFLAGS		+= -D_GNU_SOURCE
+
+LDLIBS 			+= -pthread
+
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sound/snd_timer01.c b/testcases/kernel/sound/snd_timer01.c
new file mode 100644
index 000000000..80b03022a
--- /dev/null
+++ b/testcases/kernel/sound/snd_timer01.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Copyright (c) 2019 Michael Moese <mmoese@suse.com>
+ * Regression test for CVE-2017-1000380 based on the original PoC exploit
+ * by Alexander Potapenko <glider@google.com>
+ *
+ * Be careful! This test may crash your kernel!
+ *
+ * The test performs several ioctl() parallel with readv() on the same
+ * file descriptor to /dev/snd/timer. A buggy kernel will leak memory
+ * to the process, which may contain information from the the kernel or
+ * any other process on the system.
+ *
+ * The issue was fixed with
+ *   http://git.kernel.org/linus/d11662f4f798b50d8c8743f433842c3e40fe3378
+ *   http://git.kernel.org/linus/ba3021b2c79b2fa9114f92790a99deb27a65b728
+ */
+
+#include "config.h"
+#include "tst_test.h"
+#include "tst_taint.h"
+#include "tst_fuzzy_sync.h"
+#include "tst_safe_macros.h"
+#include "tst_safe_pthread.h"
+
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/uio.h>
+#include <sys/ioctl.h>
+#include <sound/asound.h>
+
+#define MAX_BUFSIZE 1024
+
+static int snd_fd;
+static struct tst_fzsync_pair fzsync_pair;
+
+static void *ioctl_thread(void *unused)
+{
+	(void) unused;
+	int tread_arg = 1;
+	struct snd_timer_select ts;
+	struct snd_timer_params tp;
+
+	memset(&ts, 0, sizeof(ts));
+	ts.id.dev_class = 1;
+
+	memset(&tp, 0, sizeof(tp));
+	tp.ticks = 1;
+	tp.filter = 0xf;
+
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+
+		ioctl(snd_fd, SNDRV_TIMER_IOCTL_TREAD, &tread_arg);
+
+		ioctl(snd_fd, SNDRV_TIMER_IOCTL_SELECT, &ts);
+
+		ioctl(snd_fd, SNDRV_TIMER_IOCTL_PARAMS, &tp);
+
+		ioctl(snd_fd, SNDRV_TIMER_IOCTL_START, 0);
+
+		tst_fzsync_end_race_b(&fzsync_pair);
+	}
+	return unused;
+}
+
+static void setup(void)
+{
+	tst_fzsync_pair_init(&fzsync_pair);
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+	snd_fd = SAFE_OPEN("/dev/snd/timer",
+			O_RDONLY|O_CREAT|O_NOCTTY|O_SYNC|O_LARGEFILE, 0);
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+	SAFE_CLOSE(snd_fd);
+}
+
+static void run(void)
+{
+	size_t len;
+	int size;
+	struct iovec iov;
+	pthread_t th;
+	char read_buf[MAX_BUFSIZE];
+	int i, nz;
+	pthread_attr_t thread_attr;
+
+	pthread_attr_init(&thread_attr);
+	pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);
+	SAFE_PTHREAD_CREATE(&th, &thread_attr, ioctl_thread, NULL);
+
+	iov.iov_base = read_buf;
+	iov.iov_len = sizeof(read_buf);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		nz = 0;
+		memset(read_buf, 0, sizeof(read_buf));
+		size = readv(snd_fd, &iov, 1);
+
+		tst_fzsync_end_race_a(&fzsync_pair);
+
+		/* check if it could be a valid ioctl result */
+		if (size == 0)
+			continue;
+
+		/* check if the buffer is non-empty */
+		for (i = 0; i < size; i++) {
+			if (read_buf[i]) {
+				nz = 1;
+				break;
+			}
+		}
+		if (!nz)
+			continue;
+
+		len = strlen(read_buf);
+		/* the kernel's struct snd_timer_read is two unsigned integers*/
+		if (len <= 2 * sizeof(unsigned int))
+			continue;
+
+		tst_res(TFAIL, "kernel seems vulnerable");
+		return;
+	}
+
+	if (tst_taint_check() != 0)
+		tst_res(TFAIL, "kernel seems vulnerable");
+	else
+		tst_res(TPASS, "kernel seems not vulnerable");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
