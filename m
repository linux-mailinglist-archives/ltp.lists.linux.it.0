Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BACDC878
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 17:30:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BABFD3C22C4
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 17:30:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E75EF3C2216
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 17:30:35 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 47592140117D
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 17:30:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD62F693E7
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:30:33 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 535955D70E
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 15:30:33 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 18 Oct 2019 17:30:28 +0200
Message-Id: <651aa5d59504efe89ee8428afd95fe90a9bbea38.1571412608.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 18 Oct 2019 15:30:33 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] thp02: simplify test to lower memory requirements
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test is using 4 hugepages per allocation, and makes 4*3 allocations
in total. This is problem for aarch64, where default huge page size
is 512M. Systems are running into unexpected OOMs, because there
is no check for available memory.

Simplify test by:
- dropping 3rd allocation, it's used only for pattern comparison
- run test function in new child process, so we don't need to worry
  about cleaning up after mremap() and it lowers overall memory
  requirements
- add a simple check if there's enough memory to setup()
- drop .needs_root, there's no need for it

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/thp/thp02.c | 79 +++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/testcases/kernel/mem/thp/thp02.c b/testcases/kernel/mem/thp/thp02.c
index 6502210e50de..4d0c929f91ff 100644
--- a/testcases/kernel/mem/thp/thp02.c
+++ b/testcases/kernel/mem/thp/thp02.c
@@ -47,46 +47,62 @@
 #ifdef HAVE_MREMAP_FIXED
 static int ps;
 static long hps, size;
-static void *p, *p2, *p3, *p4;
+
+/*
+ * Will try to do the following 4 mremaps cases:
+ *   mremap(p, size-ps, size-ps, flag, p3);
+ *   mremap(p, size-ps, size-ps, flag, p3+ps);
+ *   mremap(p+ps, size-ps, size-ps, flag, p3);
+ *   mremap(p+ps, size-ps, size-ps, flag, p3+ps);
+ */
+static void do_child(int i)
+{
+	long j, remap_size;
+	unsigned char *p1, *p2, *ret, *old_addr, *new_addr;
+
+	p1 = SAFE_MEMALIGN(hps, size);
+	p2 = SAFE_MEMALIGN(hps, size);
+
+	memset(p1, 0xff, size);
+	memset(p2, 0x77, size);
+
+	old_addr = p1 + ps * (i >> 1);
+	new_addr = p2 + ps * (i & 1);
+	remap_size = size - ps;
+
+	tst_res(TINFO, "mremap (%p-%p) to (%p-%p)",
+		old_addr, old_addr + remap_size,
+		new_addr, new_addr + remap_size);
+
+	ret = mremap(old_addr, remap_size, remap_size,
+		    MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);
+	if (ret == MAP_FAILED)
+		tst_brk(TBROK | TERRNO, "mremap");
+
+	for (j = 0; j < size - ps; j++) {
+		if (ret[j] != 0xff)
+			tst_brk(TBROK, "mremap bug");
+	}
+
+	exit(0);
+}
 
 static void do_mremap(void)
 {
 	int i;
-	void *old_addr, *new_addr;
 
 	for (i = 0; i < 4; i++) {
-		p = SAFE_MEMALIGN(hps, size);
-		p2 = SAFE_MEMALIGN(hps, size);
-		p3 = SAFE_MEMALIGN(hps, size);
-
-		memset(p, 0xff, size);
-		memset(p2, 0xff, size);
-		memset(p3, 0x77, size);
-
-		/*
-		 * Will try to do the following 4 mremaps cases:
-		 *   mremap(p, size-ps, size-ps, flag, p3);
-		 *   mremap(p, size-ps, size-ps, flag, p3+ps);
-		 *   mremap(p+ps, size-ps, size-ps, flag, p3);
-		 *   mremap(p+ps, size-ps, size-ps, flag, p3+ps);
-		 */
-		old_addr = p + ps * (i >> 1);
-		new_addr = p3 + ps * (i & 1);
-		tst_res(TINFO, "mremap %p to %p", old_addr, new_addr);
-
-		p4 = mremap(old_addr, size - ps, size - ps,
-			    MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);
-		if (p4 == MAP_FAILED)
-			tst_brk(TBROK | TERRNO, "mremap");
-		if (memcmp(p4, p2, size - ps))
-			tst_brk(TBROK, "mremap bug");
+		if (SAFE_FORK() == 0)
+			do_child(i);
+		tst_reap_children();
 	}
-
 	tst_res(TPASS, "Still alive.");
 }
 
 static void setup(void)
 {
+	long memfree;
+
 	if (access(PATH_THP, F_OK) == -1)
 		tst_brk(TCONF, "THP not enabled in kernel?");
 
@@ -95,12 +111,17 @@ static void setup(void)
 	ps = sysconf(_SC_PAGESIZE);
 	hps = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
 	size = hps * 4;
+
+	memfree = (SAFE_READ_MEMINFO("MemFree:") * 1024 +
+		SAFE_READ_MEMINFO("Cached:") * 1024);
+	if (memfree < size * 2)
+		tst_brk(TCONF, "not enough memory");
 }
 
 static struct tst_test test = {
-	.needs_root = 1,
 	.setup = setup,
 	.test_all = do_mremap,
+	.forks_child = 1,
 };
 
 #else
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
