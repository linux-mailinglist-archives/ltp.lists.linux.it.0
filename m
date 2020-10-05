Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB32832A5
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 10:56:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 190B13C2694
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 10:56:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CDB8D3C260A
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 10:56:35 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 875091A00242
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 10:56:34 +0200 (CEST)
Date: Mon, 05 Oct 2020 08:55:55 -0000
To: ltp@lists.linux.it
Message-ID: <20201005085555.2072-1-paulson@zilogic.com>
From: "Paulson Raja L" <paulson@zilogic.com>
Received: from localhost.localdomain (27.62.59.103 [27.62.59.103])
 by mail.zilogic.com; Mon, 05 Oct 2020 08:56:24 -0000
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] RFC:[PATCH v1] Added test case to test mmap with
 MAP_SHARED_VALIDATE flag
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
Cc: Paulson Raja L <paulson@zilogic.com>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


This patch adds a new test case for the mmap syscall. It tests the
MAP_SHARED_VALIDATE flag of mmap. The code checks if MAP_SHARED_VALIDATE
returns EOPNOTSUPP when mapped with an invalid flag value. It does so by
setting the unused bits of the flag argument.
Git Hub Issue link - https://github.com/linux-test-project/ltp/issues/298

Signed-off-by: Paulson Raja L. <paulson@zilogic.com>
Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>

---
 testcases/kernel/syscalls/mmap/mmap18.c | 66 +++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mmap/mmap18.c

diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
new file mode 100644
index 000000000..e9ed4dfa6
--- /dev/null
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
+ * Email: code@zilogic.com
+ */
+
+/*
+ * Test mmap with MAP_SHARED_VALIDATE flag
+ *
+ * We are testing the MAP_SHARED_VALIDATE flag of mmap() syscall. To check
+ * if there is an invalid flag value, the MAP_SHARED_VALIDATE returns
+ * EOPNOTSUPP.The unused bits in the MAP_SHARED_VALIDATE is found,
+ * and by setting the unused bits of the flag argument the flag value
+ * becomes invalid and the error EOPNOTSUPP is produced as expected.
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <linux/mman.h>
+#include <errno.h>
+#include "tst_test.h"
+
+#define TEST_FILE "file_to_mmap"
+#define TEST_FILE_SIZE 1024
+#define TEST_FILE_MODE 0600
+
+static int fd_file;
+static void *mapped_address;
+
+static void setup(void)
+{
+	fd_file = SAFE_OPEN(TEST_FILE, O_CREAT | O_RDWR, TEST_FILE_MODE);
+	if (tst_fill_file(TEST_FILE, 'a', TEST_FILE_SIZE, 1))
+		tst_brk(TBROK, "Could not fill Testfile !");
+}
+
+static void cleanup(void)
+{
+	if (fd_file > 0)
+		SAFE_CLOSE(fd_file);
+	if (mapped_address != MAP_FAILED && mapped_address != NULL)
+		SAFE_MUNMAP(mapped_address, TEST_FILE_SIZE);
+}
+
+static void test_mmap(void)
+{
+	mapped_address = mmap(NULL, TEST_FILE_SIZE, PROT_READ | PROT_WRITE,
+			(1 << 7) | (1 << 9) | MAP_SHARED_VALIDATE, fd_file, 0);
+	if (mapped_address != MAP_FAILED)
+		tst_res(TFAIL | TERRNO, "mmap() is successful,but it should have failed");
+	else if (errno == EOPNOTSUPP)
+		tst_res(TPASS, "mmap() failed with errno set to EOPNOTSUPP");
+	else
+		tst_res(TFAIL | TERRNO, "mmap() failed with the unexpected error");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = test_mmap,
+	.min_kver = "4.15",
+	.needs_tmpdir = 1,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
