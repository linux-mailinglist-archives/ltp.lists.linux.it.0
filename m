Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06B1B4369
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:40:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E04DF3C2977
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:40:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9B47C3C295D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:40:50 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E2FA52009B8
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587555648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLm/F93wfR9V6Cz1qVNsBOh3z1eohvHs+5qCsqNfVb4=;
 b=SlRD71pN1H2n8CrRVZvTCW0kl+wepaWTIsDEqCXDTojhPO0BSY/7F/ofoLweSUQVGJeQon
 hIrmzAlvDIfj0iVg/zQ9P2CjlYMmyxkLtBbaeuxaNYG6xNkGd4A7rZr/1zBcE38f2RBH05
 h9N+AA88QaJkCprIk+skTGgD46XeWoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-M3sIP7TUP2eN7e7Hzs0BvQ-1; Wed, 22 Apr 2020 07:40:46 -0400
X-MC-Unique: M3sIP7TUP2eN7e7Hzs0BvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B349D8017F3;
 Wed, 22 Apr 2020 11:40:45 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 424795C1D4;
 Wed, 22 Apr 2020 11:40:42 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 13:40:38 +0200
Message-Id: <3529bb886952f26fa38095ce99ceef115f71cb18.1587554860.git.jstancek@redhat.com>
In-Reply-To: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
References: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] hugetlb: check for requested huge pages first
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

/sys/kernel/mm/hugepages is not present when there are no
supported hugepage sizes. This is common for ppc64le KVM guests,
when hypervisor does not enable hugepages. Guest will boot with:
  hugetlbfs: disabling because there are no supported hugepage sizes

  # cat /proc/filesystems  | grep huge; echo $?
  1

Move the check up in setup to check it as first thing to avoid
running into TBROK on mount or set_sys_tune when hugetlbfs is
not available:
  safe_macros.c:766: BROK: hugemmap01.c:82: mount(none, /mnt/testarea/ltp-07Kg6lCOmm/Ai9D0M, hugetlbfs, 0, (nil)) failed: ENODEV (19)
  safe_macros.c:766: BROK: hugemmap02.c:129: mount(none, /mnt/testarea/ltp-07Kg6lCOmm/Cxf7A6, hugetlbfs, 0, (nil)) failed: ENODEV (19)
  safe_macros.c:766: BROK: hugemmap04.c:100: mount(none, /mnt/testarea/ltp-07Kg6lCOmm/kS60Mk, hugetlbfs, 0, (nil)) failed: ENODEV (19)
  safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at hugemmap06.c:42
  safe_file_ops.c:155: BROK: The FILE '/proc/sys/vm/nr_hugepages' ended prematurely at mem.c:836
  safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at hugeshmat05.c:39

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c   | 6 +++---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c   | 6 +++---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c   | 6 +++---
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c   | 2 +-
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c | 3 +++
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat05.c | 6 +++---
 6 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
index 891c42e4613c..d7ea6d87ae85 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
@@ -77,13 +77,13 @@ static void test_hugemmap(void)
 
 void setup(void)
 {
+	if (tst_hugepages == 0)
+		tst_brk(TCONF, "Not enough hugepages for testing.");
+
 	if (!Hopt)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (tst_hugepages == 0)
-		tst_brk(TCONF, "No enough hugepages for testing.");
-
 	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
 }
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
index c0dbb60d659e..85f39c5d5829 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
@@ -124,13 +124,13 @@ static void test_hugemmap(void)
 
 static void setup(void)
 {
+	if (tst_hugepages == 0)
+		tst_brk(TCONF, "Not enough hugepages for testing.");
+
 	if (!Hopt)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (tst_hugepages == 0)
-		tst_brk(TCONF, "No enough hugepages for testing.");
-
 	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
 }
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
index 5fcbe27891c6..7c8ed8a78975 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
@@ -95,13 +95,13 @@ static void test_hugemmap(void)
 
 void setup(void)
 {
+	if (tst_hugepages == 0)
+		tst_brk(TCONF, "Not enough hugepages for testing!");
+
 	if (!Hopt)
 		Hopt = tst_get_tmpdir();
 	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
 
-	if (tst_hugepages == 0)
-		tst_brk(TCONF, "No enough hugepages for testing!");
-
 	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
 }
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
index 93f9af7f3901..ab2ccc40b82d 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
@@ -39,9 +39,9 @@ struct mp {
 
 static void setup(void)
 {
-	hpage_size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
 	if (tst_hugepages != test.request_hugepages)
 		tst_brk(TCONF, "System RAM is not enough to test.");
+	hpage_size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
 }
 
 static void *thr(void *arg)
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
index 0808496711fc..e9bb9fbf7b4b 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
@@ -74,6 +74,9 @@ static void setup(void)
 {
 	long mem_total, hpage_size, orig_hugepages;
 
+	if (tst_hugepages == 0)
+		tst_brk(TCONF, "Not enough hugepages for testing.");
+
 	orig_hugepages = get_sys_tune("nr_hugepages");
 	mem_total = SAFE_READ_MEMINFO("MemTotal:");
 	SAFE_FILE_SCANF(PATH_SHMMAX, "%ld", &orig_shmmax);
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat05.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat05.c
index a30e1e3c3d3f..7152e3363acd 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat05.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat05.c
@@ -35,11 +35,11 @@ static long hpage_size;
 
 void setup(void)
 {
+	if (tst_hugepages != test.request_hugepages)
+		tst_brk(TCONF, "Not enough hugepages for testing.");
+
 	page_size = getpagesize();
 	hpage_size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
-
-	if (tst_hugepages != test.request_hugepages)
-		tst_brk(TCONF, "No enough hugepages for testing.");
 }
 
 void shm_test(int size)
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
