Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3E74407
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 05:37:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FD433C1CF9
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 05:37:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 582693C02C2
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 05:37:22 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 154166011D4
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 05:37:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B8A683179164;
 Thu, 25 Jul 2019 03:37:18 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F34C6061B;
 Thu, 25 Jul 2019 03:37:17 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 25 Jul 2019 11:37:13 +0800
Message-Id: <20190725033713.8551-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 25 Jul 2019 03:37:18 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] move_pages12: handle errno EBUSY for madvise(...,
 MADV_SOFT_OFFLINE)
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

The test#2 is going to simulate the race condition, where move_pages()
and soft offline are called on a single hugetlb page concurrently. But,
it return EBUSY and report FAIL in soft-offline a moving hugepage as a
result sometimes.

The root cause seems a call to page_huge_active return false, then the
soft offline action will failed to isolate hugepage with EBUSY return as
below call trace:

In Parent:
  madvise(..., MADV_SOFT_OFFLINE)
  ...
    soft_offline_page
      soft_offline_in_use_page
        soft_offline_huge_page
          isolate_huge_page
            page_huge_active  --> return false at here

In Child:
  move_pages()
  ...
    do_move_pages
      do_move_pages_to_node
        add_page_for_migration
          isolate_huge_page   --> it has already isolated the hugepage

In this patch, I simply regard the returned EBUSY as a normal situation and
mask it in error handler. Because move_pages is calling add_page_for_migration
to isolate hugepage before do migration, so that's very possible to hit the
collision and return EBUSY on the same page.

Error log:
----------
move_pages12.c:235: INFO: Free RAM 8386256 kB
move_pages12.c:253: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:263: INFO: Increasing 2048kB hugepages pool on node 1 to 6
move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:179: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:169: PASS: Bug not reproduced
move_pages12.c:81: FAIL: madvise failed: SUCCESS
move_pages12.c:81: FAIL: madvise failed: SUCCESS
move_pages12.c:143: BROK: mmap((nil),4194304,3,262178,-1,0) failed: ENOMEM
move_pages12.c:114: FAIL: move_pages failed: EINVAL

Dmesg:
------
[165435.492170] soft offline: 0x61c00 hugepage failed to isolate
[165435.590252] soft offline: 0x61c00 hugepage failed to isolate
[165435.725493] soft offline: 0x61400 hugepage failed to isolate

Other two fixes in this patch:
 * use TERRNO(but not TTERRNO) to catch madvise(..., MADV_SOFT_OFFLINE) errno
 * go out test when hugepage allocating failed with ENOMEM

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    v1 --> v2
       attempt to retry the mmap() on ENOMEM.

 .../kernel/syscalls/move_pages/move_pages12.c | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
index 964b712fb..203402cfb 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages12.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
@@ -77,8 +77,8 @@ static void *addr;
 static int do_soft_offline(int tpgs)
 {
 	if (madvise(addr, tpgs * hpsz, MADV_SOFT_OFFLINE) == -1) {
-		if (errno != EINVAL)
-			tst_res(TFAIL | TTERRNO, "madvise failed");
+		if (errno != EINVAL && errno != EBUSY)
+			tst_res(TFAIL | TERRNO, "madvise failed");
 		return errno;
 	}
 	return 0;
@@ -121,7 +121,8 @@ static void do_child(int tpgs)
 
 static void do_test(unsigned int n)
 {
-	int i;
+	int i, ret, retrys;
+	void *ptr;
 	pid_t cpid = -1;
 	int status;
 	unsigned int twenty_percent = (tst_timeout_remaining() / 5);
@@ -135,19 +136,37 @@ static void do_test(unsigned int n)
 	if (cpid == 0)
 		do_child(tcases[n].tpages);
 
-	for (i = 0; i < LOOPS; i++) {
-		void *ptr;
+	for (i = 0; i < LOOPS; retrys = 0, i++) {
+retry:
+		ptr = mmap(NULL, tcases[n].tpages * hpsz,
+				PROT_READ | PROT_WRITE,
+				MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
+		if (ptr == MAP_FAILED) {
+			if (errno == ENOMEM) {
+				if (retrys < LOOPS) {
+					retrys++;
+					usleep(1000);
+					goto retry;
+				}
+
+				if (i > 0) {
+					tst_res(TINFO, "Test run %d times", i);
+					goto out;
+				}
+			}
+
+			tst_brk(TBROK | TERRNO, "Cannot allocate hugepage");
+		}
 
-		ptr = SAFE_MMAP(NULL, tcases[n].tpages * hpsz,
-			PROT_READ | PROT_WRITE,
-			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 		if (ptr != addr)
 			tst_brk(TBROK, "Failed to mmap at desired addr");
 
 		memset(addr, 0, tcases[n].tpages * hpsz);
 
 		if (tcases[n].offline) {
-			if (do_soft_offline(tcases[n].tpages) == EINVAL) {
+			ret = do_soft_offline(tcases[n].tpages);
+
+			if (ret == EINVAL) {
 				SAFE_KILL(cpid, SIGKILL);
 				SAFE_WAITPID(cpid, &status, 0);
 				SAFE_MUNMAP(addr, tcases[n].tpages * hpsz);
@@ -163,6 +182,7 @@ static void do_test(unsigned int n)
 			break;
 	}
 
+out:
 	SAFE_KILL(cpid, SIGKILL);
 	SAFE_WAITPID(cpid, &status, 0);
 	if (!WIFEXITED(status))
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
