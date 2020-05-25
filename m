Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB71E0C44
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 12:54:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 488843C335C
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 12:54:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 454ED3C331B
 for <ltp@lists.linux.it>; Mon, 25 May 2020 12:54:19 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BB4AD1001127
 for <ltp@lists.linux.it>; Mon, 25 May 2020 12:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590404057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eAKumzNTBd0HEJ1kPHVFphJ2GZI1yGGZrss9m0N3ih8=;
 b=ZSqQbDBAnGoSgduYGkzwt7tGmsN6r6mc2gJqz9PrY3UumSqTpWBiADhqEexVJPQ1f1RoWd
 fQ5MFTt62VlM0WYK/VNkVxLEeqA9eWps0qYmpsU0+XDTXmPbJSW/UomXxQqnfPCwwjjseg
 KJ3ZLx2gbkPGEbUggsY2wp7q0NYm5M4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-VMtTGmS5M72m8A7FZKKU5A-1; Mon, 25 May 2020 06:54:15 -0400
X-MC-Unique: VMtTGmS5M72m8A7FZKKU5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75241009447
 for <ltp@lists.linux.it>; Mon, 25 May 2020 10:54:12 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3C2760CC0;
 Mon, 25 May 2020 10:54:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 25 May 2020 18:54:10 +0800
Message-Id: <20200525105410.4328-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] hugemmap05: check if the reserving hpages as expected
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

To get rid of TBROK on small box:
  hugemmap05.c:88: BROK: mmap((nil),201326592,3,1,6,0) failed: ENOMEM (12)

And, reduce the reserved testing huge pages to 2, it also works well.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Jan Stancek <jstancek@redhat.com>
---

Notes:
      I didn't remove the variable 'size' and 'length' because that could be
      used to reset testing hpages via parameter '-a xxx'
    
      # ./hugemmap05 -a 128

 .../kernel/mem/hugetlb/hugemmap/hugemmap05.c  | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
index d80a636c8..dee3ef685 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c
@@ -57,9 +57,9 @@ static char path_sys_sz_huge[BUFSIZ];
 static unsigned long long shmmax;
 static char *path, *pathover;
 static int key = -1, shmid = -1, fd = -1;
-static int mounted, restore_shmmax, restore_nr_hgpgs, restore_overcomm_hgpgs;
-static long hugepagesize, nr_hugepages, nr_overcommit_hugepages;
-static long size = 128, length = 384;
+static int mounted, restore_shmmax, restore_overcomm_hgpgs;
+static long hugepagesize, nr_overcommit_hugepages;
+static long size = 2, length = 6;
 
 char *opt_sysfs;
 char *opt_alloc;
@@ -176,11 +176,6 @@ static void cleanup(void)
 	if (mounted)
 		tst_umount(MOUNT_DIR);
 
-	if (restore_nr_hgpgs) {
-		tst_res(TINFO, "restore nr_hugepages to %ld.", nr_hugepages);
-		SAFE_FILE_PRINTF(path, "%ld", nr_hugepages);
-	}
-
 	if (restore_shmmax)
 		SAFE_FILE_PRINTF(PATH_SHMMAX, "%llu", shmmax);
 
@@ -193,7 +188,9 @@ static void cleanup(void)
 
 static void setup(void)
 {
-	check_hugepage();
+	if (tst_hugepages != 2)
+		tst_brk(TCONF, "Not enough hugepages for testing!");
+
 	hugepagesize = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
 	init_sys_sz_paths();
 
@@ -219,12 +216,8 @@ static void setup(void)
 		}
 	}
 
-	SAFE_FILE_SCANF(path, "%ld", &nr_hugepages);
-	tst_res(TINFO, "original nr_hugepages is %ld", nr_hugepages);
-
 	/* Reset. */
 	SAFE_FILE_PRINTF(path, "%ld", size);
-	restore_nr_hgpgs = 1;
 
 	if (access(pathover, F_OK)) {
 		tst_brk(TCONF, "file %s does not exist in the system",
@@ -309,4 +302,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = test_overcommit,
+	.request_hugepages = 2,
 };
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
