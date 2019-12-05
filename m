Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659A113F72
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 11:34:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F02B43C23CC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 11:34:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 536523C23AF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 11:33:53 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C9AAE1415ACF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 11:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575542031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDoUZyC0CA+fBASLK4dIPxuWCgsf9P6ho3wqh3OgDkE=;
 b=CGEckPDUf+Dnc3Ei0wcfLdwdaD2GYZacFlezTHZx5EuMI9owlLpfHhoGx6J2cl9TVFUFUG
 9ku+9v2utBQAccqRlCsLTVMPmDE0YFjQCptrVPJAptICbdlMoIUfKU/TkCef3bB/0ekG+X
 qC1ak8aMyVorfJ7/4Y3YAwIc6B+Psdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-CHjSTFdwMjub3kxYbZDL_A-1; Thu, 05 Dec 2019 05:33:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CFA418543A6
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 10:33:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66BD55C1C3
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 10:33:48 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  5 Dec 2019 18:33:42 +0800
Message-Id: <20191205103342.5980-2-liwang@redhat.com>
In-Reply-To: <20191205103342.5980-1-liwang@redhat.com>
References: <20191205103342.5980-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: CHjSTFdwMjub3kxYbZDL_A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] pkey01: disable hugetlb test if failed to
 reserve hugepage
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

To handle the false positive:
  pkey01.c:69: BROK: nr_hugepages = 0, but expect 1

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/pkeys/pkey01.c | 27 ++++++------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c b/testcases/kernel/syscalls/pkeys/pkey01.c
index fa84e71f3..929be4e7c 100644
--- a/testcases/kernel/syscalls/pkeys/pkey01.c
+++ b/testcases/kernel/syscalls/pkeys/pkey01.c
@@ -36,12 +36,6 @@
 #define PATH_VM_NRHPS "/proc/sys/vm/nr_hugepages"
 
 static int size;
-static int no_hugepage;
-
-static const char * const save_restore[] = {
-	"?/proc/sys/vm/nr_hugepages",
-	NULL,
-};
 
 static struct tcase {
 	unsigned long flags;
@@ -56,21 +50,12 @@ static void setup(void)
 {
 	int i, fd;
 
-	if (access("/sys/kernel/mm/hugepages/", F_OK)) {
-		tst_res(TINFO, "Huge page is not supported");
+	check_pkey_support();
+
+	if (tst_no_hugepage)
 		size = getpagesize();
-		no_hugepage = 1;
-	} else {
-		int val;
-		SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);
-		SAFE_FILE_SCANF(PATH_VM_NRHPS, "%d", &val);
-		if (val != 1)
-			tst_brk(TBROK, "nr_hugepages = %d, but expect %d",
-					val, 1);
+	else
 		size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
-	}
-
-	check_pkey_support();
 
 	fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
 	for (i = 0; i < 128; i++)
@@ -147,7 +132,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
 	int pkey, status;
 	int fd = mpa->fd;
 
-	if (no_hugepage && (mpa->flags & MAP_HUGETLB)) {
+	if (tst_no_hugepage && (mpa->flags & MAP_HUGETLB)) {
 		tst_res(TINFO, "Skip test on (%s) buffer", flag_to_str(mpa->flags));
 		return;
 	}
@@ -236,5 +221,5 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.test = verify_pkey,
 	.setup = setup,
-	.save_restore = save_restore,
+	.needs_hugepages = 1,
 };
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
