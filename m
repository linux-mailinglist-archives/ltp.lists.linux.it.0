Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF427A792
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 08:32:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07B063C2B2E
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 08:32:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DBB493C285E
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 08:32:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 81FBF1A00678
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 08:32:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,312,1596470400"; d="scan'208";a="99669190"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Sep 2020 14:32:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id EB75848990F4
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 14:32:19 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Sep 2020 14:32:21 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 28 Sep 2020 14:32:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 28 Sep 2020 14:13:47 +0800
Message-ID: <20200928061347.275858-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: EB75848990F4.A8BF8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/libcpuset.c: Add 'cpuset' prefix for
 cpuset files
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

cpuset_cpusetofpid() in cpuset_cpu_hog.c cannot find cpuset files by
wrong names(without 'cpuset' prefix) so cpuset_load_balance_test.sh
reported the following error:
---------------------------------------
cpuset_load_balance 1 TFAIL: load balance test failed.
---------------------------------------

Use correct names(with 'cpuset' prefix) to find cpuset files.

Fixes: #690
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .../controllers/cpuset/cpuset_lib/libcpuset.c | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c b/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c
index 172e23714..a687ad2ee 100644
--- a/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c
+++ b/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c
@@ -2093,11 +2093,11 @@ int cpuset_query(struct cpuset *cp, const char *relpath)
 
 	fullpath(buf, sizeof(buf), relpath);
 
-	if (load_flag(buf, &cp->cpu_exclusive, "cpu_exclusive") < 0)
+	if (load_flag(buf, &cp->cpu_exclusive, "cpuset.cpu_exclusive") < 0)
 		goto err;
 	cp->cpu_exclusive_valid = 1;
 
-	if (load_flag(buf, &cp->mem_exclusive, "mem_exclusive") < 0)
+	if (load_flag(buf, &cp->mem_exclusive, "cpuset.mem_exclusive") < 0)
 		goto err;
 	cp->mem_exclusive_valid = 1;
 
@@ -2105,60 +2105,60 @@ int cpuset_query(struct cpuset *cp, const char *relpath)
 		goto err;
 	cp->notify_on_release_valid = 1;
 
-	if (exists_flag(buf, "memory_migrate")) {
-		if (load_flag(buf, &cp->memory_migrate, "memory_migrate") < 0)
+	if (exists_flag(buf, "cpuset.memory_migrate")) {
+		if (load_flag(buf, &cp->memory_migrate, "cpuset.memory_migrate") < 0)
 			goto err;
 		cp->memory_migrate_valid = 1;
 	}
 
-	if (exists_flag(buf, "mem_hardwall")) {
-		if (load_flag(buf, &cp->mem_hardwall, "mem_hardwall") < 0)
+	if (exists_flag(buf, "cpuset.mem_hardwall")) {
+		if (load_flag(buf, &cp->mem_hardwall, "cpuset.mem_hardwall") < 0)
 			goto err;
 		cp->mem_hardwall_valid = 1;
 	}
 
-	if (exists_flag(buf, "memory_pressure_enabled")) {
+	if (exists_flag(buf, "cpuset.memory_pressure_enabled")) {
 		if (load_flag
 		    (buf, &cp->memory_pressure_enabled,
-		     "memory_pressure_enabled") < 0)
+		     "cpuset.memory_pressure_enabled") < 0)
 			goto err;
 		cp->memory_pressure_enabled_valid = 1;
 	}
 
-	if (exists_flag(buf, "memory_spread_page")) {
+	if (exists_flag(buf, "cpuset.memory_spread_page")) {
 		if (load_flag
-		    (buf, &cp->memory_spread_page, "memory_spread_page") < 0)
+		    (buf, &cp->memory_spread_page, "cpuset.memory_spread_page") < 0)
 			goto err;
 		cp->memory_spread_page_valid = 1;
 	}
 
-	if (exists_flag(buf, "memory_spread_slab")) {
+	if (exists_flag(buf, "cpuset.memory_spread_slab")) {
 		if (load_flag
-		    (buf, &cp->memory_spread_slab, "memory_spread_slab") < 0)
+		    (buf, &cp->memory_spread_slab, "cpuset.memory_spread_slab") < 0)
 			goto err;
 		cp->memory_spread_slab_valid = 1;
 	}
 
-	if (exists_flag(buf, "sched_load_balance")) {
+	if (exists_flag(buf, "cpuset.sched_load_balance")) {
 		if (load_flag
-		    (buf, &cp->sched_load_balance, "sched_load_balance") < 0)
+		    (buf, &cp->sched_load_balance, "cpuset.sched_load_balance") < 0)
 			goto err;
 		cp->sched_load_balance_valid = 1;
 	}
 
-	if (exists_flag(buf, "sched_relax_domain_level")) {
+	if (exists_flag(buf, "cpuset.sched_relax_domain_level")) {
 		if (load_number
 		    (buf, &cp->sched_relax_domain_level,
-		     "sched_relax_domain_level") < 0)
+		     "cpuset.sched_relax_domain_level") < 0)
 			goto err;
 		cp->sched_relax_domain_level_valid = 1;
 	}
 
-	if (load_mask(buf, &cp->cpus, cpuset_cpus_nbits(), "cpus") < 0)
+	if (load_mask(buf, &cp->cpus, cpuset_cpus_nbits(), "cpuset.cpus") < 0)
 		goto err;
 	cp->cpus_valid = 1;
 
-	if (load_mask(buf, &cp->mems, cpuset_mems_nbits(), "mems") < 0)
+	if (load_mask(buf, &cp->mems, cpuset_mems_nbits(), "cpuset.mems") < 0)
 		goto err;
 	cp->mems_valid = 1;
 
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
