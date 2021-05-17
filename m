Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A03839F6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 646533C3339
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 97FD03C4AF2
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8BC7C6005E6
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CbsDHZNM3/pLimxmfp15Xy9SG6NMNLVEwltxRP43Mo=;
 b=pNT1D125WY+aWQZ9UgEdyoOr+u02CGvnEfSqNwbQzcJ8eyz2VHf1FY+tEA0WtzXlMnPEHL
 P69zhfIyVE+b6JDfjLS7ALxC01uI5U1+sS4UnazWcbC1BbGSD7xPztRN/vE7WT33D3dd/d
 UAbkKkatWx0kNVq2DMn+0V7ybXlOA70=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EEB8B240;
 Mon, 17 May 2021 16:30:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:28 +0100
Message-Id: <20210517163029.22974-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 5/6] API: Add tst_ to hugepage opt vars
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_hugepage.h                             |  4 ++--
 lib/tst_hugepage.c                                 |  8 ++++----
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c | 14 +++++++-------
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c | 14 +++++++-------
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c | 14 +++++++-------
 .../kernel/mem/hugetlb/hugeshmat/hugeshmat01.c     |  2 +-
 .../kernel/mem/hugetlb/hugeshmat/hugeshmat02.c     |  2 +-
 .../kernel/mem/hugetlb/hugeshmat/hugeshmat03.c     |  2 +-
 .../kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c     |  2 +-
 .../kernel/mem/hugetlb/hugeshmget/hugeshmget01.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmget/hugeshmget02.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmget/hugeshmget03.c   |  2 +-
 .../kernel/mem/hugetlb/hugeshmget/hugeshmget05.c   |  2 +-
 16 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/include/tst_hugepage.h b/include/tst_hugepage.h
index e08a2daa2..67104de14 100644
--- a/include/tst_hugepage.h
+++ b/include/tst_hugepage.h
@@ -9,8 +9,8 @@
 #define PATH_HUGEPAGES	"/sys/kernel/mm/hugepages/"
 #define PATH_NR_HPAGES	"/proc/sys/vm/nr_hugepages"
 
-extern char *nr_opt; /* -s num   Set the number of the been allocated hugepages */
-extern char *Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
+extern char *tst_hugepage_nr_opt; /* -s num   Set the number of the been allocated hugepages */
+extern char *tst_hugepage_Hopt;   /* -H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs */
 
 /*
  * Get the default hugepage size. Returns 0 if hugepages are not supported.
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index 1d0e62e5b..1180beb87 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -9,8 +9,8 @@
 #include "tst_hugepage.h"
 
 unsigned long tst_hugepages;
-char *nr_opt;
-char *Hopt;
+char *tst_hugepage_nr_opt;
+char *tst_hugepage_Hopt;
 
 size_t tst_get_hugepage_size(void)
 {
@@ -29,8 +29,8 @@ unsigned long tst_request_hugepages(unsigned long hpages)
 		goto out;
 	}
 
-	if (nr_opt)
-		tst_hugepages = SAFE_STRTOL(nr_opt, 1, LONG_MAX);
+	if (tst_hugepage_nr_opt)
+		tst_hugepages = SAFE_STRTOL(tst_hugepage_nr_opt, 1, LONG_MAX);
 	else
 		tst_hugepages = hpages;
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
index 1783bfb12..564f6aaf3 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c
@@ -74,25 +74,25 @@ void setup(void)
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "Not enough hugepages for testing.");
 
-	if (!Hopt)
-		Hopt = tst_get_tmpdir();
-	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
+	if (!tst_hugepage_Hopt)
+		tst_hugepage_Hopt = tst_get_tmpdir();
+	SAFE_MOUNT("none", tst_hugepage_Hopt, "hugetlbfs", 0, NULL);
 
-	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
+	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", tst_hugepage_Hopt, getpid());
 }
 
 void cleanup(void)
 {
 	unlink(TEMPFILE);
-	umount(Hopt);
+	umount(tst_hugepage_Hopt);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"H:", &Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"H:", &tst_hugepage_Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
index 0b27154af..df1f27419 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c
@@ -121,25 +121,25 @@ static void setup(void)
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "Not enough hugepages for testing.");
 
-	if (!Hopt)
-		Hopt = tst_get_tmpdir();
-	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
+	if (!tst_hugepage_Hopt)
+		tst_hugepage_Hopt = tst_get_tmpdir();
+	SAFE_MOUNT("none", tst_hugepage_Hopt, "hugetlbfs", 0, NULL);
 
-	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
+	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", tst_hugepage_Hopt, getpid());
 }
 
 static void cleanup(void)
 {
 	unlink(TEMPFILE);
-	umount(Hopt);
+	umount(tst_hugepage_Hopt);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"H:", &Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"H:", &tst_hugepage_Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
index f63b41f28..12d7705fd 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c
@@ -92,25 +92,25 @@ void setup(void)
 	if (tst_hugepages == 0)
 		tst_brk(TCONF, "Not enough hugepages for testing!");
 
-	if (!Hopt)
-		Hopt = tst_get_tmpdir();
-	SAFE_MOUNT("none", Hopt, "hugetlbfs", 0, NULL);
+	if (!tst_hugepage_Hopt)
+		tst_hugepage_Hopt = tst_get_tmpdir();
+	SAFE_MOUNT("none", tst_hugepage_Hopt, "hugetlbfs", 0, NULL);
 
-	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", Hopt, getpid());
+	snprintf(TEMPFILE, sizeof(TEMPFILE), "%s/mmapfile%d", tst_hugepage_Hopt, getpid());
 }
 
 void cleanup(void)
 {
 	unlink(TEMPFILE);
-	umount(Hopt);
+	umount(tst_hugepage_Hopt);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"H:", &Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"H:", &tst_hugepage_Hopt,   "-H /..   Location of hugetlbfs, i.e.  -H /var/hugetlbfs"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
index f206522c0..f6235f8eb 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat01.c
@@ -173,7 +173,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.tcnt = ARRAY_SIZE(tcases),
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
index fcad8f5d9..739b29c43 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat02.c
@@ -100,7 +100,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.tcnt = ARRAY_SIZE(tcases),
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
index 1f1d2613a..4e20434f1 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat03.c
@@ -95,7 +95,7 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.test_all = verify_hugeshmat,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
index b5b5496fd..45157fc6f 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl01.c
@@ -303,7 +303,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
index e014edd94..ed819e949 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl02.c
@@ -105,7 +105,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
index 8c485810d..3c35efc4b 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
@@ -128,7 +128,7 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_tmpdir = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
index 571a4cf10..c6641d041 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmdt/hugeshmdt01.c
@@ -146,7 +146,7 @@ void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
index 470563653..a161a1da0 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c
@@ -72,7 +72,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
index 323b5d6d1..d102b8f40 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c
@@ -91,7 +91,7 @@ void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
index f18c1a124..0b1e2fcd0 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
@@ -90,7 +90,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
index 60c86455c..4452f97e3 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c
@@ -86,7 +86,7 @@ void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.options = (struct tst_option[]) {
-		{"s:", &nr_opt, "-s num   Set the number of the been allocated hugepages"},
+		{"s:", &tst_hugepage_nr_opt, "-s num   Set the number of the been allocated hugepages"},
 		{}
 	},
 	.setup = setup,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
