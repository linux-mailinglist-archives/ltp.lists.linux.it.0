Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A2F4D1127
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Mar 2022 08:38:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 136663C21E7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Mar 2022 08:38:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6370C3C2220
 for <ltp@lists.linux.it>; Tue,  8 Mar 2022 08:37:22 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0DD81000AE9
 for <ltp@lists.linux.it>; Tue,  8 Mar 2022 08:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646725040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAd5mFGL21tpSJJpYqgnP3DAfzshl8Yp8WNSGz89yzs=;
 b=d4dS4PVKl/I4M5dF8v1U2QNgvPqCXsCq4eAEvi/jLc+x2zeayzgbh1E9xxptejmR090MtC
 NKvQ7SmiR3Cj3vf1a7xzeT/wbLtnG8Xtw2ewGYeb4SdUpR2Gp1ARcQ2OFabtS30icnAAyS
 Q0bf6SueVboWsy/c6TDcWFX0JCIexLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-bpTdOUAePKOOhpeTCFPrEg-1; Tue, 08 Mar 2022 02:37:19 -0500
X-MC-Unique: bpTdOUAePKOOhpeTCFPrEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3C11091DA0
 for <ltp@lists.linux.it>; Tue,  8 Mar 2022 07:37:18 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7086D101E59D
 for <ltp@lists.linux.it>; Tue,  8 Mar 2022 07:37:17 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  8 Mar 2022 15:37:09 +0800
Message-Id: <20220308073709.4125677-5-liwang@redhat.com>
In-Reply-To: <20220308073709.4125677-1-liwang@redhat.com>
References: <20220308073709.4125677-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] ksm: cleanup work and make use of .save_restore
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/mem/ksm/ksm01.c      | 38 ++++++++++-----------------
 testcases/kernel/mem/ksm/ksm02.c      | 25 +++++-------------
 testcases/kernel/mem/ksm/ksm03.c      | 25 +++++-------------
 testcases/kernel/mem/ksm/ksm04.c      | 24 +++++------------
 testcases/kernel/mem/ksm/ksm05.c      | 29 ++++++--------------
 testcases/kernel/mem/ksm/ksm_common.h |  2 --
 6 files changed, 43 insertions(+), 100 deletions(-)

diff --git a/testcases/kernel/mem/ksm/ksm01.c b/testcases/kernel/mem/ksm/ksm01.c
index 0a81e2016..301c4d3c2 100644
--- a/testcases/kernel/mem/ksm/ksm01.c
+++ b/testcases/kernel/mem/ksm/ksm01.c
@@ -66,30 +66,7 @@ static void verify_ksm(void)
 
 static void setup(void)
 {
-	if (access(PATH_KSM, F_OK) == -1)
-		tst_brk(TCONF, "KSM configuration is not enabled");
-
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
-
-	/*
-	 * kernel commit 90bd6fd introduced a new KSM sysfs knob
-	 * /sys/kernel/mm/ksm/merge_across_nodes, setting it to '0'
-	 * will prevent KSM pages being merged across numa nodes,
-	 * which will cause the case fail, so we need to make sure
-	 * it is enabled before testing.
-	 */
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-				"%d", &merge_across_nodes);
-		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
-	}
-}
-
-static void cleanup(void)
-{
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
 }
 
 static struct tst_test test = {
@@ -102,11 +79,24 @@ static struct tst_test test = {
 		{}
 	},
 	.setup = setup,
-	.cleanup = cleanup,
 	.save_restore = (const struct tst_path_val const[]) {
+		{"!/sys/kernel/mm/ksm/run", NULL},
+		{"!/sys/kernel/mm/ksm/sleep_millisecs", NULL},
 		{"?/sys/kernel/mm/ksm/max_page_sharing", NULL},
+		/*
+		 * kernel commit 90bd6fd introduced a new KSM sysfs knob
+		 * /sys/kernel/mm/ksm/merge_across_nodes, setting it to '0'
+		 * will prevent KSM pages being merged across numa nodes,
+		 * which will cause the case fail, so we need to make sure
+		 * it is enabled before testing.
+		 */
+		{"?/sys/kernel/mm/ksm/merge_across_nodes", "1"},
 		NULL,
 	},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KSM=y",
+		NULL
+	},
 	.test_all = verify_ksm,
 	.min_kver = "2.6.32",
 };
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index 6ba6ee868..6ad7bcadb 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -82,26 +82,9 @@ static void verify_ksm(void)
 	SAFE_CG_PRINTF(tst_cg_drain, "cgroup.procs", "%d", getpid());
 }
 
-static void cleanup(void)
-{
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
-	}
-}
-
 static void setup(void)
 {
-	if (access(PATH_KSM, F_OK) == -1)
-		tst_brk(TCONF, "KSM configuration is not enabled");
-
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
-
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-				"%d", &merge_across_nodes);
-		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
-	}
 }
 
 static struct tst_test test = {
@@ -114,11 +97,17 @@ static struct tst_test test = {
 		{}
 	},
 	.setup = setup,
-	.cleanup = cleanup,
 	.save_restore = (const struct tst_path_val const[]) {
+		{"!/sys/kernel/mm/ksm/run", NULL},
+		{"!/sys/kernel/mm/ksm/sleep_millisecs", NULL},
 		{"?/sys/kernel/mm/ksm/max_page_sharing", NULL},
+		{"?/sys/kernel/mm/ksm/merge_across_nodes", "1"},
 		NULL,
 	},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KSM=y",
+		NULL
+	},
 	.test_all = verify_ksm,
 	.min_kver = "2.6.32",
 	.needs_cgroup_ctrls = (const char *const []){ "cpuset", NULL },
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index 71d2d8bd9..94223e332 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -66,29 +66,12 @@ static void verify_ksm(void)
 
 static void setup(void)
 {
-	if (access(PATH_KSM, F_OK) == -1)
-		tst_brk(TCONF, "KSM configuration is not enabled");
-
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-				"%d", &merge_across_nodes);
-		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
-	}
-
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
 
 	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
 	SAFE_CG_PRINTF(tst_cg, "memory.max", "%lu", TESTMEM);
 }
 
-static void cleanup(void)
-{
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
-	}
-}
-
 static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
@@ -99,11 +82,17 @@ static struct tst_test test = {
 		{}
 	},
 	.setup = setup,
-	.cleanup = cleanup,
 	.save_restore = (const struct tst_path_val const[]) {
+		{"!/sys/kernel/mm/ksm/run", NULL},
+		{"!/sys/kernel/mm/ksm/sleep_millisecs", NULL},
 		{"?/sys/kernel/mm/ksm/max_page_sharing", NULL},
+		{"?/sys/kernel/mm/ksm/merge_across_nodes", "1"},
 		NULL,
 	},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KSM=y",
+		NULL
+	},
 	.test_all = verify_ksm,
 	.min_kver = "2.6.32",
 	.needs_cgroup_ctrls = (const char *const []){ "memory", NULL },
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index 8429f4843..3e8a77bec 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -82,24 +82,8 @@ static void verify_ksm(void)
 	create_same_memory(size, num, unit);
 }
 
-static void cleanup(void)
-{
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
-}
-
 static void setup(void)
 {
-	if (access(PATH_KSM, F_OK) == -1)
-		tst_brk(TCONF, "KSM configuration is not enabled");
-
-	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0) {
-		SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-				"%d", &merge_across_nodes);
-		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
-	}
-
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
 
 	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
@@ -115,11 +99,17 @@ static struct tst_test test = {
 		{}
 	},
 	.setup = setup,
-	.cleanup = cleanup,
 	.save_restore = (const struct tst_path_val const[]) {
+		{"!/sys/kernel/mm/ksm/run", NULL},
+		{"!/sys/kernel/mm/ksm/sleep_millisecs", NULL},
 		{"?/sys/kernel/mm/ksm/max_page_sharing", NULL},
+		{"?/sys/kernel/mm/ksm/merge_across_nodes", "1"},
 		NULL,
 	},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KSM=y",
+		NULL
+	},
 	.test_all = verify_ksm,
 	.min_kver = "2.6.32",
 	.needs_cgroup_ctrls = (const char *const []){
diff --git a/testcases/kernel/mem/ksm/ksm05.c b/testcases/kernel/mem/ksm/ksm05.c
index 380bb0202..33721d388 100644
--- a/testcases/kernel/mem/ksm/ksm05.c
+++ b/testcases/kernel/mem/ksm/ksm05.c
@@ -83,32 +83,19 @@ static void sighandler(int sig)
 	_exit((sig == SIGSEGV) ? 0 : sig);
 }
 
-static void setup(void)
-{
-	if (access(PATH_KSM, F_OK) == -1)
-		tst_brk(TCONF, "KSM configuration is not enabled");
-
-	/* save original /sys/kernel/mm/ksm/run value */
-	SAFE_FILE_SCANF(PATH_KSM "run", "%d", &ksm_run_orig);
-
-	/* echo 1 > /sys/kernel/mm/ksm/run */
-	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
-}
-
-static void cleanup(void)
-{
-	/* restore /sys/kernel/mm/ksm/run value */
-	if (ksm_run_orig > 0)
-		FILE_PRINTF(PATH_KSM "run", "%d", ksm_run_orig);
-}
-
 static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
-	.setup = setup,
-	.cleanup = cleanup,
 	.test_all = test_ksm,
 	.min_kver = "2.6.32",
+	.save_restore = (const struct tst_path_val const[]) {
+		{"!/sys/kernel/mm/ksm/run", "1"},
+		NULL,
+	},
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KSM=y",
+		NULL
+	},
 };
 
 #else
diff --git a/testcases/kernel/mem/ksm/ksm_common.h b/testcases/kernel/mem/ksm/ksm_common.h
index e6d5387c8..56faf01e4 100644
--- a/testcases/kernel/mem/ksm/ksm_common.h
+++ b/testcases/kernel/mem/ksm/ksm_common.h
@@ -9,8 +9,6 @@
 
 #include "tst_test.h"
 
-int merge_across_nodes;
-
 int size = 128, num = 3, unit = 1;
 char *opt_sizestr, *opt_numstr, *opt_unitstr;
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
