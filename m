Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F7124257
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 10:02:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD5E53C22C7
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 10:02:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4ECBB3C2092
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 10:02:12 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D1B96601C82
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 10:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576659730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKXUvHldGBXP3Qq4b5I56eW2o1F3wv7nSpfz8QrncUs=;
 b=TSzEiyE+MyQAuoFf/M+LNztht82kOgraFe+80ZageOmJiYR0Vx1hC38rlF2LCNl3EC8KQ+
 OIV5dNDPfjGTAq5zBOum5IIVYzKMpkFFDm1tVnWOZSwgOWOdCJH2tyE0CYxyEvru5r5PAI
 QCwt7fgGUJ4Jg6z1Y9+l/YxifDEab4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-autWWK5AMKq74I8HdHqknA-1; Wed, 18 Dec 2019 04:02:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B4C477
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:02:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304CA5D9E2
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:02:06 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 18 Dec 2019 17:02:02 +0800
Message-Id: <20191218090202.26932-2-liwang@redhat.com>
In-Reply-To: <20191218090202.26932-1-liwang@redhat.com>
References: <20191218090202.26932-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: autWWK5AMKq74I8HdHqknA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] pkey01: disable hugetlb test if failed to
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
 testcases/kernel/syscalls/pkeys/pkey01.c | 29 ++++++------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c b/testcases/kernel/syscalls/pkeys/pkey01.c
index fa84e71f3..04f50924c 100644
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
@@ -56,22 +50,13 @@ static void setup(void)
 {
 	int i, fd;
 
-	if (access("/sys/kernel/mm/hugepages/", F_OK)) {
-		tst_res(TINFO, "Huge page is not supported");
-		size = getpagesize();
-		no_hugepage = 1;
-	} else {
-		int val;
-		SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);
-		SAFE_FILE_SCANF(PATH_VM_NRHPS, "%d", &val);
-		if (val != 1)
-			tst_brk(TBROK, "nr_hugepages = %d, but expect %d",
-					val, 1);
-		size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
-	}
-
 	check_pkey_support();
 
+	if (tst_hugepages == test.request_hugepages)
+		size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
+	else
+		size = getpagesize();
+
 	fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
 	for (i = 0; i < 128; i++)
 		SAFE_WRITE(1, fd, STR, strlen(STR));
@@ -147,7 +132,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
 	int pkey, status;
 	int fd = mpa->fd;
 
-	if (no_hugepage && (mpa->flags & MAP_HUGETLB)) {
+	if (!tst_hugepages && (mpa->flags & MAP_HUGETLB)) {
 		tst_res(TINFO, "Skip test on (%s) buffer", flag_to_str(mpa->flags));
 		return;
 	}
@@ -236,5 +221,5 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.test = verify_pkey,
 	.setup = setup,
-	.save_restore = save_restore,
+	.request_hugepages = 1,
 };
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
