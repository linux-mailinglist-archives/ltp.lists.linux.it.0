Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3E1F332B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 06:47:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58B073C2E46
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 06:47:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1AF243C12D0
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 06:47:16 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6F39D2010AA
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 06:47:14 +0200 (CEST)
Date: Tue, 09 Jun 2020 04:46:41 -0000
To: ltp@lists.linux.it
Message-ID: <20200609044641.3623-1-kushalchand@zilogic.com>
From: "Kushal Chand" <kushalchand@zilogic.com>
Received: from localhost.localdomain (broadband.actcorp.in [49.207.129.164])
 by mail.zilogic.com; Tue, 09 Jun 2020 04:47:04 -0000
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Added test case to test mmap with
 MAP_FIXED_NOREPLACE flag
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
Cc: "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


This patch adds a new test case for the mmap syscall. It tests the
MAP_FIXED_NOREPLACE flag of mmap. The code checks if MAP_FIXED_NOREPLACE
returns with EEXIST when mapped with an already mapped address. It does
so by allocating an available address by passing NULL to first argument
of mmap and tries to mmap with MAP_FIXED_NOREPLACE flag at the same
address returned by the first mmap call. This fails as expected. It also
does the necessary changes required to run the syscall using the runltp
command after building the LTP test suite.
Git Hub Issue link - https://github.com/linux-test-project/ltp/issues/299

Signed-off-by: Kushal Chand <kushalchand@zilogic.com>
Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>

---
 include/lapi/mmap.h                       | 10 +++
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/mmap/.gitignore |  1 +
 testcases/kernel/syscalls/mmap/mmap17.c   | 85 +++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mmap/mmap17.c

diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
index b3db94128..12845b76e 100644
--- a/include/lapi/mmap.h
+++ b/include/lapi/mmap.h
@@ -66,6 +66,16 @@
 # define MADV_KEEPONFORK 19
 #endif

+#ifndef MAP_FIXED_NOREPLACE
+
+#ifdef __alpha__
+# define MAP_FIXED_NOREPLACE 0x200000
+#else
+# define MAP_FIXED_NOREPLACE 0x100000
+#endif
+
+#endif /* MAP_FIXED_NOREPLACE */
+
 #ifdef HAVE_SYS_SHM_H
 # include <sys/shm.h>
 # define MMAP_GRANULARITY SHMLBA
diff --git a/runtest/syscalls b/runtest/syscalls
index edd3e8de7..e685037c7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -745,6 +745,7 @@ mmap14 mmap14
 #mmap11 mmap11 -i 30000
 mmap15 mmap15
 mmap16 mmap16
+mmap17 mmap17

 modify_ldt01 modify_ldt01
 modify_ldt02 modify_ldt02
diff --git a/testcases/kernel/syscalls/mmap/.gitignore b/testcases/kernel/syscalls/mmap/.gitignore
index 39ed2aab0..c5c083d4b 100644
--- a/testcases/kernel/syscalls/mmap/.gitignore
+++ b/testcases/kernel/syscalls/mmap/.gitignore
@@ -15,3 +15,4 @@
 /mmap14
 /mmap15
 /mmap16
+/mmap17
diff --git a/testcases/kernel/syscalls/mmap/mmap17.c b/testcases/kernel/syscalls/mmap/mmap17.c
new file mode 100644
index 000000000..a620f104a
--- /dev/null
+++ b/testcases/kernel/syscalls/mmap/mmap17.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
+ * Email: code@zilogic.com
+ */
+
+/*
+ * Test mmap with MAP_FIXED_NOREPLACE flag
+ *
+ * We are testing the MAP_FIXED_NOREPLACE flag of mmap() syscall. To check
+ * if an attempt to mmap at an exisiting mapping fails with EEXIST.
+ * The code allocates a free address by passing NULL to first mmap call
+ * Then tries to mmap with the same address using MAP_FIXED_NOREPLACE flag
+ * and the mapping fails as expected.
+ */
+
+#include <stdio.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <error.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+#include "tst_test.h"
+
+static int fd_file1;
+static int fd_file2;
+static void *mapped_address;
+static const char str[] = "Writing to mapped file";
+
+#define FNAME1 "file1_to_mmap"
+#define FNAME2 "file2_to_mmap"
+
+static void setup(void)
+{
+	fd_file1 = SAFE_OPEN(FNAME1, O_CREAT | O_RDWR, 0600);
+	fd_file2 = SAFE_OPEN(FNAME2, O_CREAT | O_RDWR, 0600);
+}
+
+static void cleanup(void)
+{
+	int str_len;
+
+	str_len = strlen(str);
+
+	if (fd_file2 > 0)
+		SAFE_CLOSE(fd_file2);
+	if (fd_file1 > 0)
+		SAFE_CLOSE(fd_file1);
+	if (mapped_address)
+		SAFE_MUNMAP(mapped_address, str_len);
+}
+
+static void test_mmap(void)
+{
+	int str_len;
+	void *address;
+
+	str_len = strlen(str);
+
+	SAFE_WRITE(1, fd_file1, str, str_len);
+	mapped_address = SAFE_MMAP(NULL, str_len, PROT_WRITE,
+				   MAP_PRIVATE, fd_file1, 0);
+
+	SAFE_WRITE(1, fd_file2, str, str_len);
+
+	address = mmap(mapped_address, str_len, PROT_WRITE,
+		  MAP_PRIVATE | MAP_FIXED_NOREPLACE, fd_file2, 0);
+	if (address == MAP_FAILED && errno == EEXIST)
+		tst_res(TPASS, "mmap set errno to EEXIST as expected");
+	else
+		tst_res(TFAIL | TERRNO, "mmap failed, with unexpected error "
+			"code, expected EEXIST");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = test_mmap,
+	.min_kver = "4.17",
+	.needs_tmpdir = 1
+};
--
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
