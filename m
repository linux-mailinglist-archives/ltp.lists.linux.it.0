Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A519429AD2F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:24:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CC603C5605
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:24:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E9FF83C4B5B
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:23:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 56A666009F1
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603805037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exhX71/taWhKAUcfTzHXcTGM5ZNrwagh8lHots9X3+M=;
 b=MMExUk2T1dxtUTV60ebxag6dN1O8uBeAqqBZQ9wVD81CtJOsHRvXuRNr/JnCc+gaOrm6SR
 Nvh9aDgTYT/KDiWo/QtYN4ZYsquVa0QEWQ7PaYfK2qBYyqw2A5iOi0dt3uOxxjqPStnSra
 f7RUcmFXdv1Mg5y7a4B2ZRdjZVtkmOk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EA71ACAE;
 Tue, 27 Oct 2020 13:23:57 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 27 Oct 2020 13:23:34 +0000
Message-Id: <20201027132334.1027-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAEemH2d8+5qLLKWsuf5WJeLHdv2VfPZiyM9-oW=WyH4m==h=8g@mail.gmail.com>
References: <CAEemH2d8+5qLLKWsuf5WJeLHdv2VfPZiyM9-oW=WyH4m==h=8g@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] madvise06: Increase reliability and diagnostic info
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When memcg.limit_in_bytes is set to PASS_THRESHOLD it's unlikely
swapcached will increase by more than PASS_THRESHOLD unless processes
in other memcgs are also increasing it. Additionally MADV_WILLNEED
must remove pages from memory as it adds more so that the first page
may not be in memory by the time the last page is faulted if the
amount exceeds the memory limit (which it does because CHUNK_SZ >
PASS_THRESSHOLD). Worse if pages are faulted in a non-linear way, or
the process must access some other pages, then there is no guarantee
which parts of the range will be resident in memory. This results in
spurious test failures.

To solve this we can set PASS_THRESHOLD to 1/4 of CHUNK_SZ and
memcg.limit_in_bytes to 1/2 of CHUNK_SZ (MEM_LIMIT), then mark
MEM_LIMIT bytes as needed. That way the amount in the SwapCache will
easily be more than the threshold. Secondly we can run madvise again
on PASS_THRESHOLD bytes and check that dirtying all of these does not
result in too many page faults. We also run the second test on every
occasion to ensure the test code itself is still valid. If the
original bug is present then both tests fail.

Finally this prints more diagnostic information to help with debugging
the test.

While debugging the test a kernel bug was found in 5.9 which effects
CGroupV1 when use_hierarchy=0. This is unlikely to effect many users,
but a fix is pending and will be referenced in the test when
available. It is recommended that you set use_hierarchy=1.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Li Wang <liwang@redhat.com>
---

V2:
+ Avoid syntax error on compilers which don't allow zero length var args
+ Reviewed by Li Wang

 testcases/kernel/syscalls/madvise/madvise06.c | 107 ++++++++++++++----
 1 file changed, 84 insertions(+), 23 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index f76f3f6aa..23ebbead6 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -19,6 +19,23 @@
  *   Date:   Thu May 22 11:54:17 2014 -0700
  *
  *       mm: madvise: fix MADV_WILLNEED on shmem swapouts
+ *
+ *   Two checks are performed, the first looks at how SwapCache
+ *   changes during madvise. When the pages are dirtied, about half
+ *   will be accounted for under Cached and the other half will be
+ *   moved into Swap. When madvise is run it will cause the pages
+ *   under Cached to also be moved to Swap while rotating the pages
+ *   already in Swap into SwapCached. So we expect that SwapCached has
+ *   roughly MEM_LIMIT bytes added to it, but for reliability the
+ *   PASS_THRESHOLD is much lower than that.
+ *
+ *   Secondly we run madvise again, but only on the first
+ *   PASS_THRESHOLD bytes to ensure these are entirely in RAM. Then we
+ *   dirty these pages and check there were (almost) no page
+ *   faults. Two faults are allowed incase some tasklet or something
+ *   else unexpected, but irrelevant procedure, registers a fault to
+ *   our process.
+ *
  */
 
 #include <errno.h>
@@ -28,8 +45,10 @@
 #include "tst_test.h"
 
 #define CHUNK_SZ (400*1024*1024L)
-#define CHUNK_PAGES (CHUNK_SZ / pg_sz)
+#define MEM_LIMIT (CHUNK_SZ / 2)
+#define MEMSW_LIMIT (2 * CHUNK_SZ)
 #define PASS_THRESHOLD (CHUNK_SZ / 4)
+#define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
 
 #define MNT_NAME "memory"
 #define GROUP_NAME "madvise06"
@@ -37,12 +56,39 @@
 static const char drop_caches_fname[] = "/proc/sys/vm/drop_caches";
 static int pg_sz;
 
+static long init_swap, init_swap_cached, init_cached;
+
 static void check_path(const char *path)
 {
 	if (access(path, R_OK | W_OK))
 		tst_brk(TCONF, "file needed: %s\n", path);
 }
 
+#define READ_CGMEM(item)						\
+	({long tst_rval;						\
+	  SAFE_FILE_LINES_SCANF(MNT_NAME"/"GROUP_NAME"/memory."item, 	\
+				"%ld",					\
+				&tst_rval);				\
+	  tst_rval;})
+
+static void meminfo_diag(const char *point)
+{
+	FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
+	tst_res(TINFO, "%s", point);
+	tst_res(TINFO, "\tSwap: %ld Kb",
+		SAFE_READ_MEMINFO("SwapTotal:") - SAFE_READ_MEMINFO("SwapFree:") - init_swap);
+	tst_res(TINFO, "\tSwapCached: %ld Kb",
+		SAFE_READ_MEMINFO("SwapCached:") - init_swap_cached);
+	tst_res(TINFO, "\tCached: %ld Kb",
+		SAFE_READ_MEMINFO("Cached:") - init_cached);
+	tst_res(TINFO, "\tcgmem.usage_in_bytes: %ld Kb",
+		READ_CGMEM("usage_in_bytes") / 1024);
+	tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb",
+		READ_CGMEM("memsw.usage_in_bytes") / 1024);
+	tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb",
+		READ_CGMEM("kmem.usage_in_bytes") / 1024);
+}
+
 static void setup(void)
 {
 	struct sysinfo sys_buf_start;
@@ -77,9 +123,19 @@ static void setup(void)
 
 	SAFE_FILE_PRINTF("/proc/self/oom_score_adj", "%d", -1000);
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes", "%ld\n",
-		PASS_THRESHOLD);
+			 MEM_LIMIT);
+	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes", "%ld\n",
+			 MEMSW_LIMIT);
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.swappiness", "60");
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/tasks", "%d\n", getpid());
+
+	meminfo_diag("Initial meminfo, later values are relative to this (except memcg)");
+	init_swap = SAFE_READ_MEMINFO("SwapTotal:") - SAFE_READ_MEMINFO("SwapFree:");
+	init_swap_cached = SAFE_READ_MEMINFO("SwapCached:");
+	init_cached = SAFE_READ_MEMINFO("Cached:");
+
+	tst_res(TINFO, "mapping %ld Kb (%ld pages), limit %ld Kb, pass threshold %ld Kb",
+		CHUNK_SZ / 1024, CHUNK_SZ / pg_sz, MEM_LIMIT / 1024, PASS_THRESHOLD_KB);
 }
 
 static void cleanup(void)
@@ -112,55 +168,60 @@ static int get_page_fault_num(void)
 
 static void test_advice_willneed(void)
 {
-	int loops = 50;
+	int loops = 50, res;
 	char *target;
 	long swapcached_start, swapcached;
 	int page_fault_num_1, page_fault_num_2;
 
+	meminfo_diag("Before mmap");
+	tst_res(TINFO, "PageFault(before mmap): %d", get_page_fault_num());
 	target = SAFE_MMAP(NULL, CHUNK_SZ, PROT_READ | PROT_WRITE,
 			MAP_SHARED | MAP_ANONYMOUS,
 			-1, 0);
+	meminfo_diag("Before dirty");
+	tst_res(TINFO, "PageFault(before dirty): %d", get_page_fault_num());
 	dirty_pages(target, CHUNK_SZ);
+	tst_res(TINFO, "PageFault(after dirty): %d", get_page_fault_num());
 
+	meminfo_diag("Before madvise");
 	SAFE_FILE_LINES_SCANF("/proc/meminfo", "SwapCached: %ld",
 		&swapcached_start);
-	tst_res(TINFO, "SwapCached (before madvise): %ld", swapcached_start);
 
-	TEST(madvise(target, CHUNK_SZ, MADV_WILLNEED));
+	TEST(madvise(target, MEM_LIMIT, MADV_WILLNEED));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TERRNO, "madvise failed");
 
 	do {
 		loops--;
 		usleep(100000);
+		FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
 		SAFE_FILE_LINES_SCANF("/proc/meminfo", "SwapCached: %ld",
 			&swapcached);
-	} while (swapcached < swapcached_start + PASS_THRESHOLD / 1024
-		&& loops > 0);
-
-	tst_res(TINFO, "SwapCached (after madvise): %ld", swapcached);
-	if (swapcached > swapcached_start + PASS_THRESHOLD / 1024) {
-		tst_res(TPASS, "Regression test pass");
-		SAFE_MUNMAP(target, CHUNK_SZ);
-		return;
-	}
+	} while (swapcached < swapcached_start + PASS_THRESHOLD_KB && loops > 0);
+
+	meminfo_diag("After madvise");
+	res = swapcached > swapcached_start + PASS_THRESHOLD_KB;
+	tst_res(res ? TPASS : TFAIL,
+		"%s than %ld Kb were moved to the swap cache",
+		res ? "more" : "less", PASS_THRESHOLD_KB);
+
+
+	TEST(madvise(target, PASS_THRESHOLD, MADV_WILLNEED));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TERRNO, "madvise failed");
 
-	/*
-	 * We may have hit a bug or we just have slow I/O,
-	 * try accessing first page.
-	 */
 	page_fault_num_1 = get_page_fault_num();
 	tst_res(TINFO, "PageFault(madvice / no mem access): %d",
 			page_fault_num_1);
-	target[0] = 'a';
+	dirty_pages(target, PASS_THRESHOLD);
 	page_fault_num_2 = get_page_fault_num();
 	tst_res(TINFO, "PageFault(madvice / mem access): %d",
 			page_fault_num_2);
+	meminfo_diag("After page access");
 
-	if (page_fault_num_1 != page_fault_num_2)
-		tst_res(TFAIL, "Bug has been reproduced");
-	else
-		tst_res(TPASS, "Regression test pass");
+	res = page_fault_num_2 - page_fault_num_1;
+	tst_res(res < 3 ? TPASS : TFAIL,
+		"%d pages were faulted out of 2 max", res);
 
 	SAFE_MUNMAP(target, CHUNK_SZ);
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
