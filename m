Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030879A549
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 10:02:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B91C3CB3AE
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 10:02:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA09E3CB382
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 10:02:41 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0764920118E
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 10:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694419359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dpi/sS7XZmMpRIp7b0yMImtW+GLz30qJGDRA1TPd638=;
 b=JbQ1PzKV0JXsTbdI50Khf4Jc8DY3+gXK8Najl3ZlEI0yHDXsAHIIwTVPyOC7ueCUM53R/I
 Tv/kUYoEY3v/8V7hCANOslSpHj4tJ+U3dLbthjvLWZo13OcwgdNS/cn916mc0NTC6Ck0FE
 GMi4c28he6gs8G9Z5y011w2pYo+g1BA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-gcoFPfu6NXGokjyLcIJI2Q-1; Mon, 11 Sep 2023 04:02:37 -0400
X-MC-Unique: gcoFPfu6NXGokjyLcIJI2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B082729ABA09
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 08:02:37 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEBAA2027045
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 08:02:36 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 11 Sep 2023 16:02:32 +0800
Message-Id: <20230911080233.1305942-1-liwang@redhat.com>
In-Reply-To: <20230524093930.43971-1-liwang@redhat.com>
References: <20230524093930.43971-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: add support for kinds of hpsize
 reservation
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

Typically when we make use of huge page via LTP library, .hugepages choose
the default hugepage size, but this can not satisfy all scenarios.

So this patch introduces applying a specified hpsize huge page for user.

There is nothing that needs to change for the existing test cases which
already using .hugepages, it only needs to fill one more field in the
structure of .hugepages if a different hpsize is required.

e.g.

    static struct tst_test test = {
	.needs_root = 1,
	...
	.hugepages = {2, TST_NEEDS, 1024 * 1024},
    };

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    V1 --> V2
        * check if the specific hugepage size exist or not
        * guarantee the HugePages_Free-$(size)kB as expected
        * print the reserved hugepage size

 doc/c-test-api.txt     | 38 ++++++++++++++++++++++++++++++++++++--
 include/tst_hugepage.h |  1 +
 lib/tst_hugepage.c     | 33 ++++++++++++++++++++++++++-------
 3 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index f692909e2..ec728cf8a 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -2034,9 +2034,15 @@ For full documentation see the comments in 'include/tst_fuzzy_sync.h'.
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 Many of the LTP tests need to use hugepage in their testing, this allows the
-test can reserve hugepages from system via '.hugepages = {xx, TST_REQUEST}'.
+test can reserve specify size of hugepages from system via:
+  '.hugepages = {xx, TST_REQUEST, yy}'.
 
-We achieved two policies for reserving hugepages:
+xx: This is used to set how many pages we wanted.
+
+yy: This is used to specify the size of the hugepage.
+    (If not set it will use the default hugepage size)
+
+Two policies for reserving hugepages:
 
 TST_REQUEST:
   It will try the best to reserve available huge pages and return the number
@@ -2103,6 +2109,34 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
+or,
+
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+#define GIGANTIC_PGSZ 1024 * 1024
+
+static void run(void)
+{
+	...
+}
+
+static void setup(void)
+{
+	/*
+	 * Specify hpsize reserved automatically in the library
+	 * $ echo 2 > /sys/kernel/mm//hugepages/hugepages-1048576kB/nr_hugepages
+	 * Do check if 2 hpages are reserved correctly in there
+	 */
+}
+
+struct tst_test test = {
+	.test_all = run,
+	.hugepages = {2, TST_NEEDS, GIGANTIC_PGSZ},
+	...
+};
+-------------------------------------------------------------------------------
+
 1.35 Checking for required commands
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
index 46327c79a..e96bfbe53 100644
--- a/include/tst_hugepage.h
+++ b/include/tst_hugepage.h
@@ -27,6 +27,7 @@ enum tst_hp_policy {
 struct tst_hugepage {
 	const unsigned long number;
 	enum  tst_hp_policy policy;
+	const unsigned long hpsize;
 };
 
 /*
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index d2e70a955..f4b18bbbf 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -5,6 +5,7 @@
 
 #define TST_NO_DEFAULT_MAIN
 
+#include <stdio.h>
 #include "tst_test.h"
 #include "tst_hugepage.h"
 
@@ -22,9 +23,10 @@ size_t tst_get_hugepage_size(void)
 
 unsigned long tst_reserve_hugepages(struct tst_hugepage *hp)
 {
-	unsigned long val, max_hpages;
+	unsigned long val, max_hpages, hpsize;
+	char hugepage_path[PATH_MAX];
 	struct tst_path_val pvl = {
-		.path = PATH_NR_HPAGES,
+		.path = hugepage_path,
 		.val = NULL,
 		.flags = TST_SR_SKIP_MISSING | TST_SR_TCONF_RO
 	};
@@ -41,6 +43,19 @@ unsigned long tst_reserve_hugepages(struct tst_hugepage *hp)
 	else
 		tst_hugepages = hp->number;
 
+	if (hp->hpsize)
+		hpsize = hp->hpsize;
+	else
+		hpsize = SAFE_READ_MEMINFO(MEMINFO_HPAGE_SIZE);
+
+	sprintf(hugepage_path, PATH_HUGEPAGES"/hugepages-%lukB/nr_hugepages", hpsize);
+	if (access(hugepage_path, F_OK)) {
+		if (hp->policy == TST_NEEDS)
+			tst_brk(TCONF, "Hugepage size %lu not supported", hpsize);
+		tst_hugepages = 0;
+		goto out;
+	}
+
 	if (hp->number == TST_NO_HUGEPAGES) {
 		tst_hugepages = 0;
 		goto set_hugepages;
@@ -53,7 +68,7 @@ unsigned long tst_reserve_hugepages(struct tst_hugepage *hp)
 		goto set_hugepages;
 	}
 
-	max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
+	max_hpages = SAFE_READ_MEMINFO("MemFree:") / hpsize;
 	if (tst_hugepages > max_hpages) {
 		tst_res(TINFO, "Requested number(%lu) of hugepages is too large, "
 				"limiting to 80%% of the max hugepage count %lu",
@@ -66,22 +81,26 @@ unsigned long tst_reserve_hugepages(struct tst_hugepage *hp)
 
 set_hugepages:
 	tst_sys_conf_save(&pvl);
-	SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%lu", tst_hugepages);
-	SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);
+
+	SAFE_FILE_PRINTF(hugepage_path, "%lu", tst_hugepages);
+	SAFE_FILE_SCANF(hugepage_path, "%lu", &val);
+
 	if (val != tst_hugepages)
 		tst_brk(TCONF, "nr_hugepages = %lu, but expect %lu. "
 				"Not enough hugepages for testing.",
 				val, tst_hugepages);
 
 	if (hp->policy == TST_NEEDS) {
-		unsigned long free_hpages = SAFE_READ_MEMINFO("HugePages_Free:");
+		unsigned long free_hpages;
+		sprintf(hugepage_path, PATH_HUGEPAGES"/hugepages-%lukB/free_hugepages", hpsize);
+		SAFE_FILE_SCANF(hugepage_path, "%lu", &free_hpages);
 		if (hp->number > free_hpages)
 			tst_brk(TCONF, "free_hpages = %lu, but expect %lu. "
 				"Not enough hugepages for testing.",
 				free_hpages, hp->number);
 	}
 
-	tst_res(TINFO, "%lu hugepage(s) reserved", tst_hugepages);
+	tst_res(TINFO, "%lu (%luMB) hugepage(s) reserved", tst_hugepages, hpsize/1024);
 out:
 	return tst_hugepages;
 }
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
