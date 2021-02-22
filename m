Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFE321DF2
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 18:20:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41E1F3C611F
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 18:20:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2712D3C6021
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 18:20:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3051E140075C
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 18:20:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8650EAC69
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:20:44 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Feb 2021 18:20:43 +0100
Message-Id: <20210222172043.24294-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add test for possible writev() issues with NULL
 buffer in iovec
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

Fixes #790

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

This test triggers temporary write of invalid data into test file on some
file systems on kernel 4.4.21 and older.

Changes since v1:
- Simplify main thread
- Use atomic load/store when passing read limit between threads (I hope I'm
  doing it correctly)
- Check for too big writes just in case
- Require at least 2 CPUs, the bugs are not reproducible on single-CPU systems

 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/writev/.gitignore |   1 +
 testcases/kernel/syscalls/writev/Makefile   |   3 +
 testcases/kernel/syscalls/writev/writev03.c | 145 ++++++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 testcases/kernel/syscalls/writev/writev03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index ae47a6d5e..f01d94540 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1675,6 +1675,7 @@ write05 write05
 
 writev01 writev01
 writev02 writev02
+writev03 writev03
 writev05 writev05
 writev06 writev06
 writev07 writev07
diff --git a/testcases/kernel/syscalls/writev/.gitignore b/testcases/kernel/syscalls/writev/.gitignore
index d60da0f43..167779736 100644
--- a/testcases/kernel/syscalls/writev/.gitignore
+++ b/testcases/kernel/syscalls/writev/.gitignore
@@ -1,5 +1,6 @@
 /writev01
 /writev02
+/writev03
 /writev05
 /writev06
 /writev07
diff --git a/testcases/kernel/syscalls/writev/Makefile b/testcases/kernel/syscalls/writev/Makefile
index 4844a6910..6627abaed 100644
--- a/testcases/kernel/syscalls/writev/Makefile
+++ b/testcases/kernel/syscalls/writev/Makefile
@@ -9,4 +9,7 @@ endif
 
 include $(top_srcdir)/include/mk/testcases.mk
 
+writev03: CFLAGS += -pthread
+writev03: LDLIBS += -lrt
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/writev/writev03.c b/testcases/kernel/syscalls/writev/writev03.c
new file mode 100644
index 000000000..58d6931d2
--- /dev/null
+++ b/testcases/kernel/syscalls/writev/writev03.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <mdoucha@suse.cz>
+ *
+ * Check for potential issues in writev() if the first iovec entry is NULL
+ * and the next one is not present in RAM. This can result in a brief window
+ * where writev() first writes uninitialized data into the file (possibly
+ * exposing internal kernel structures) and then overwrites it with the real
+ * iovec contents later. Bugs fixed in:
+ *
+ *  commit d4690f1e1cdabb4d61207b6787b1605a0dc0aeab
+ *  Author: Al Viro <viro@ZenIV.linux.org.uk>
+ *  Date:   Fri Sep 16 00:11:45 2016 +0100
+ *
+ *  fix iov_iter_fault_in_readable()
+ */
+
+#include <sys/uio.h>
+#include "tst_test.h"
+#include "tst_atomic.h"
+#include "tst_fuzzy_sync.h"
+
+#define CHUNK_SIZE 256
+#define BUF_SIZE (2 * CHUNK_SIZE)
+#define MNTPOINT "mntpoint"
+#define TEMPFILE MNTPOINT "/test_file"
+#define MAPFILE MNTPOINT "/map_file"
+
+static unsigned char buf[BUF_SIZE], *map_ptr;
+static int mapfd = -1, writefd = -1, readfd = -1;
+static int written;
+static struct tst_fzsync_pair fzsync_pair;
+struct iovec iov[5];
+
+static void setup(void)
+{
+	int i;
+
+	for (i = 0; i < BUF_SIZE; i++)
+		buf[i] = i & 0xff;
+
+	mapfd = SAFE_OPEN(MAPFILE, O_CREAT|O_RDWR|O_TRUNC, 0644);
+	SAFE_WRITE(1, mapfd, buf, BUF_SIZE);
+
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		writefd = SAFE_OPEN(TEMPFILE, O_CREAT|O_WRONLY|O_TRUNC, 0644);
+		written = BUF_SIZE;
+		tst_fzsync_wait_b(&fzsync_pair);
+
+		/*
+		 * Do *NOT* preload the data using MAP_POPULATE or touching
+		 * the mapped range. We're testing whether writev() handles
+		 * fault-in correctly.
+		 */
+		map_ptr = SAFE_MMAP(NULL, BUF_SIZE, PROT_READ, MAP_SHARED,
+			mapfd, 0);
+		iov[1].iov_base = map_ptr;
+		iov[1].iov_len = CHUNK_SIZE;
+		iov[3].iov_base = map_ptr + CHUNK_SIZE;
+		iov[3].iov_len = CHUNK_SIZE;
+
+		tst_fzsync_start_race_b(&fzsync_pair);
+		tst_atomic_store(writev(writefd, iov, ARRAY_SIZE(iov)),
+			&written);
+		tst_fzsync_end_race_b(&fzsync_pair);
+
+		SAFE_MUNMAP(map_ptr, BUF_SIZE);
+		map_ptr = NULL;
+		SAFE_CLOSE(writefd);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	int total_read;
+	unsigned char readbuf[BUF_SIZE + 1];
+
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		tst_fzsync_wait_a(&fzsync_pair);
+		readfd = SAFE_OPEN(TEMPFILE, O_RDONLY);
+		tst_fzsync_start_race_a(&fzsync_pair);
+
+		for (total_read = 0; total_read < tst_atomic_load(&written);) {
+			total_read += SAFE_READ(0, readfd, readbuf+total_read,
+				BUF_SIZE + 1 - total_read);
+		}
+
+		tst_fzsync_end_race_a(&fzsync_pair);
+		SAFE_CLOSE(readfd);
+
+		if (total_read > BUF_SIZE)
+			tst_brk(TBROK, "writev() wrote too much data");
+
+		if (total_read <= 0)
+			continue;
+
+		if (memcmp(readbuf, buf, total_read)) {
+			tst_res(TFAIL, "writev() wrote invalid data");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "writev() handles page fault-in correctly");
+}
+
+static void cleanup(void)
+{
+	if (map_ptr && map_ptr != MAP_FAILED)
+		SAFE_MUNMAP(map_ptr, BUF_SIZE);
+
+	if (mapfd >= 0)
+		SAFE_CLOSE(mapfd);
+
+	if (readfd >= 0)
+		SAFE_CLOSE(readfd);
+
+	if (writefd >= 0)
+		SAFE_CLOSE(writefd);
+
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.min_cpus = 2,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "d4690f1e1cda"},
+		{}
+	}
+};
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
