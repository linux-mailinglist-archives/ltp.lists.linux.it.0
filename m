Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8719F6F1
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 15:29:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D7F23C2DEB
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 15:29:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3D57E3C0519
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 15:29:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 52619600973
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 15:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586179785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z3pApJbYrwKcSIuEwf6N0ANi1DFPlDTD8+XFpU2o6To=;
 b=S43OCsjbxwcF2rjTXuPESGS4euDZQx50VOWB8JoIoxj1YnhaAw1MxdndQb02wHrRNKGgkF
 rrBBo9JHWSiwYYqahqZOUni7i2shKuJN04IUTdlaLCWXKco8OFvmh/ssdtXGZmuERKG+QV
 PH+OHdWbybYNSFgmjl7Uswy0J80E+lU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-Z8R4UbNkPRmQ9opLqJ7KBg-1; Mon, 06 Apr 2020 09:29:43 -0400
X-MC-Unique: Z8R4UbNkPRmQ9opLqJ7KBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97F8C801A01;
 Mon,  6 Apr 2020 13:29:42 +0000 (UTC)
Received: from bootp-66-81-246.lab.eng.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0995E9A260;
 Mon,  6 Apr 2020 13:29:40 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  6 Apr 2020 21:29:32 +0800
Message-Id: <20200406132932.12951-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] hugetlb: move nr_opt to tst_hugepage.h
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

This is to get rid of the following error:
  # ./hugemmap01 -s 2
  tst_hugepage.c:29: INFO: Requested number(128) of hugepages is too large,
                     limiting to 80% of the max hugepage count 28
  tst_hugepage.c:40: BROK: nr_hugepages = 5, but expect 22

The root cause is that hugetlb test hits TBROK if the system can't satisfy 80%
of .request_hugepages(default: 128), it doesn't get a chance to set nr_hugepages
with specified page number via '-s xxx'.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/tst_hugepage.h                                 |  3 +++
 lib/tst_hugepage.c                                     | 10 +++++++---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c     |  5 -----
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c     |  5 -----
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c     |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c   |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c   |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c   |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c   |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c |  5 -----
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c |  5 -----
 testcases/kernel/mem/hugetlb/lib/hugetlb.h             |  3 ---
 17 files changed, 10 insertions(+), 76 deletions(-)

diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
index 8600b3adb..30e00a377 100644
--- a/include/tst_hugepage.h
+++ b/include/tst_hugepage.h
@@ -9,6 +9,9 @@
 #define PATH_HUGEPAGES	"/sys/kernel/mm/hugepages/"
 #define PATH_NR_HPAGES	"/proc/sys/vm/nr_hugepages"
 
+char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
+char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
+
 /*
  * Try the best to request a specified number of huge pages from system,
  * it will store the reserved hpage number in tst_hugepages.
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index c75fb264d..34fd27ede 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -19,14 +19,18 @@ unsigned long tst_request_hugepages(unsigned long hpages)
 		goto out;
 	}
 
-	tst_hugepages = hpages;
+	if (nr_opt)
+		tst_hugepages = SAFE_STRTOL(nr_opt, 1, LONG_MAX);
+	else
+		tst_hugepages = hpages;
+
 	SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
 	max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
 
-	if (hpages > max_hpages) {
+	if (tst_hugepages > max_hpages) {
 		tst_res(TINFO, "Requested number(%lu) of hugepages is too large, "
 				"limiting to 80%% of the max hugepage count %lu",
-				hpages, max_hpages);
+				tst_hugepages, max_hpages);
 		tst_hugepages = max_hpages * 0.8;
 
 		if (tst_hugepages < 1)
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
index eecbe93f8..891c42e46 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
@@ -81,11 +81,6 @@ void setup(void)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
index 4a4b5680e..c0dbb60d6 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
@@ -128,11 +128,6 @@ static void setup(void)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 1, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
index 74a90c01a..5fcbe2789 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
@@ -99,11 +99,6 @@ void setup(void)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing!");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
index 0e6e64d3d..807d1c454 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
@@ -154,11 +154,6 @@ static void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
index cfc18a795..febe03d12 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
@@ -79,11 +79,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
index ea784da70..42965e4d7 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
@@ -74,11 +74,6 @@ static void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
index 84321d94c..1e84fec59 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -288,11 +288,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
index 9d835394c..69db058d1 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
@@ -77,11 +77,6 @@ static void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
index 739b57f95..fedc22246 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
@@ -106,11 +106,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
index f0947e703..066f34d1c 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
@@ -119,11 +119,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
index d77f4ae97..e1f8fec5a 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
@@ -54,11 +54,6 @@ static void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
index ad81c979c..ebe6f0bcd 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
@@ -72,11 +72,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
index e08ed9f42..226985d53 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
@@ -51,11 +51,6 @@ static void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
index 4c175d59a..506d1df06 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
@@ -66,11 +66,6 @@ void setup(void)
 {
 	long hpage_size;
 
-	if (nr_opt) {
-		tst_hugepages = SAFE_STRTOL(nr_opt, 0, LONG_MAX);
-		tst_request_hugepages(tst_hugepages);
-	}
-
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "No enough hugepages for testing.");
 
diff --git a/testcases/kernel/mem/hugetlb/lib/hugetlb.h b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
index 7c03a317c..88890ebfb 100644
--- a/testcases/kernel/mem/hugetlb/lib/hugetlb.h
+++ b/testcases/kernel/mem/hugetlb/lib/hugetlb.h
@@ -40,7 +40,4 @@ int getipckey(void);
 int getuserid(char *user);
 void rm_shm(int shm_id);
 
-char *nr_opt;
-char *Hopt;
-
 #endif /* hugetlb.h */
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
