Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4325201596
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 18:29:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA4723C5F0E
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 18:29:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 328823C2C46
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 18:29:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 20F4C600BF3
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 18:28:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 822CFAEB2
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 16:29:23 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Jun 2020 18:29:22 +0200
Message-Id: <20200619162922.20465-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619162922.20465-1-mdoucha@suse.cz>
References: <20200619162922.20465-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Add test for CVE 2017-1000405
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

Fixes #316

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                       |   1 +
 runtest/mm                        |   1 +
 testcases/kernel/mem/.gitignore   |   1 +
 testcases/kernel/mem/thp/Makefile |   1 +
 testcases/kernel/mem/thp/thp04.c  | 154 ++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 testcases/kernel/mem/thp/thp04.c

diff --git a/runtest/cve b/runtest/cve
index a3a25dbe1..fdb455af1 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -43,6 +43,7 @@ cve-2017-18075 pcrypt_aead01
 cve-2017-1000111 setsockopt07
 cve-2017-1000112 setsockopt05
 cve-2017-1000380 snd_timer01
+cve-2017-1000405 thp04
 cve-2018-5803 sctp_big_chunk
 cve-2018-7566 snd_seq01
 cve-2018-8897 ptrace09
diff --git a/runtest/mm b/runtest/mm
index 612a4d066..4701a14bd 100644
--- a/runtest/mm
+++ b/runtest/mm
@@ -86,6 +86,7 @@ swapping01 swapping01 -i 5
 thp01 thp01 -I 120
 thp02 thp02
 thp03 thp03
+thp04 thp04
 
 vma01 vma01
 vma02 vma02
diff --git a/testcases/kernel/mem/.gitignore b/testcases/kernel/mem/.gitignore
index ce21ca70f..b95ada109 100644
--- a/testcases/kernel/mem/.gitignore
+++ b/testcases/kernel/mem/.gitignore
@@ -65,6 +65,7 @@
 /thp/thp01
 /thp/thp02
 /thp/thp03
+/thp/thp04
 /tunable/max_map_count
 /tunable/min_free_kbytes
 /tunable/overcommit_memory
diff --git a/testcases/kernel/mem/thp/Makefile b/testcases/kernel/mem/thp/Makefile
index 867dcf089..89abdc7cd 100644
--- a/testcases/kernel/mem/thp/Makefile
+++ b/testcases/kernel/mem/thp/Makefile
@@ -18,6 +18,7 @@
 #
 
 top_srcdir		?= ../../../..
+thp04:			LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 include $(top_srcdir)/testcases/kernel/mem/include/libmem.mk
diff --git a/testcases/kernel/mem/thp/thp04.c b/testcases/kernel/mem/thp/thp04.c
new file mode 100644
index 000000000..22c5d3170
--- /dev/null
+++ b/testcases/kernel/mem/thp/thp04.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2017-1000405
+ *
+ * Check for the Huge Dirty Cow vulnerability which allows a userspace process
+ * to overwrite the huge zero page. Race fixed in:
+ *
+ *  commit a8f97366452ed491d13cf1e44241bc0b5740b1f0
+ *  Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
+ *  Date:   Mon Nov 27 06:21:25 2017 +0300
+ *
+ *   mm, thp: Do not make page table dirty unconditionally in touch_p[mu]d()
+ */
+
+#include <sys/mman.h>
+
+#include "tst_test.h"
+#include "tst_fuzzy_sync.h"
+
+static char *write_thp, *read_thp;
+static int *write_ptr, *read_ptr;
+static size_t thp_size;
+static int writefd = -1, readfd = -1;
+static struct tst_fzsync_pair fzsync_pair;
+
+static void *alloc_zero_page(void *baseaddr)
+{
+	int i;
+	void *ret;
+
+	/* Find aligned chunk of address space. MAP_HUGETLB doesn't work. */
+	for (i = 0; i < 16; i++, baseaddr += thp_size) {
+		ret = mmap(baseaddr, thp_size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+		if (ret == baseaddr) {
+			TEST(madvise(ret, thp_size, MADV_HUGEPAGE));
+
+			if (TST_RET) {
+				tst_brk(TBROK | TTERRNO,
+					"madvise(MADV_HUGEPAGE) failed");
+			}
+
+			return ret;
+		}
+
+		if (ret != MAP_FAILED)
+			SAFE_MUNMAP(ret, thp_size);
+	}
+
+	tst_brk(TBROK, "Cannot map huge zero page near the specified address");
+	return NULL;	/* Silence compiler warning */
+}
+
+static void setup(void)
+{
+	size_t i;
+
+	thp_size = tst_get_hugepage_size();
+
+	if (!thp_size)
+		tst_brk(TCONF, "Kernel does not support huge pages");
+
+	write_thp = alloc_zero_page((void*)thp_size);
+
+	for (i = 0; i < thp_size; i++) {
+		if (write_thp[i]) {
+			tst_brk(TCONF, "Huge zero page is pre-polluted");
+		}
+	}
+
+	/* leave a hole between read and write THP to prevent merge */
+	read_thp = alloc_zero_page(write_thp + 2 * thp_size);
+	write_ptr = (int*)(write_thp + thp_size - sizeof(int));
+	read_ptr = (int*)(read_thp + thp_size - sizeof(int));
+	writefd = SAFE_OPEN("/proc/self/mem", O_RDWR);
+	readfd = SAFE_OPEN("/proc/self/mem", O_RDWR);
+
+	fzsync_pair.exec_loops = 100000;
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	int c;
+
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		madvise(write_thp, thp_size, MADV_DONTNEED);
+		memcpy(&c, write_ptr, sizeof(c));
+		SAFE_LSEEK(readfd, (off_t)write_ptr, SEEK_SET);
+		SAFE_READ(1, readfd, &c, sizeof(int));
+		tst_fzsync_end_race_b(&fzsync_pair);
+		/* Wait for dirty page handling before next madvise() */
+		usleep(10);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	int c = 0xdeadbeef;
+
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		/* Write into the main huge page */
+		tst_fzsync_start_race_a(&fzsync_pair);
+		SAFE_LSEEK(writefd, (off_t)write_ptr, SEEK_SET);
+		madvise(write_thp, thp_size, MADV_DONTNEED);
+		SAFE_WRITE(1, writefd, &c, sizeof(int));
+		tst_fzsync_end_race_a(&fzsync_pair);
+
+		/* Check the other huge zero page for pollution */
+		madvise(read_thp, thp_size, MADV_DONTNEED);
+
+		if (*read_ptr != 0) {
+			tst_res(TFAIL, "Huge zero page was polluted");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "Huge zero page is still clean");
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+
+	if (readfd >= 0)
+		SAFE_CLOSE(readfd);
+
+	if (writefd >= 0)
+		SAFE_CLOSE(writefd);
+
+	SAFE_MUNMAP(read_thp, thp_size);
+	SAFE_MUNMAP(write_thp, thp_size);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "a8f97366452e"},
+		{"CVE", "2017-1000405"},
+		{}
+	}
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
