Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7932A411
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:28:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4359B3C6E64
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:28:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C3ABB3C56FD
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2194B1407114
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614698876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NC1qNWUlykIXVredFKewfuoGV4e1xkK9SBJV2ga3lkI=;
 b=CsMhV+MrrymkGp5dkPfsfNeSnsGIoBQOhHBh4I1iqxnO02Pttih/bRk3cdGHZd8AFGZcdz
 PY/FAhlINJXZmvwvxHdk8tBE7S1Gs5X4a5MM/BHmcsspnM3/hvjy+XPGazGF6mmvu3h9UX
 vANhmdREPnMysF5PVv+wbN8GM4iTNjw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4CA5AC54;
 Tue,  2 Mar 2021 15:27:56 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  2 Mar 2021 15:25:09 +0000
Message-Id: <20210302152510.15116-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210302152510.15116-1-rpalethorpe@suse.com>
References: <20210302152510.15116-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 6/7] mem: Convert tests to new CGroups API
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
 testcases/kernel/mem/cpuset/cpuset01.c | 34 ++++++++++++--------------
 testcases/kernel/mem/include/mem.h     |  2 +-
 testcases/kernel/mem/ksm/ksm02.c       | 13 +++++++---
 testcases/kernel/mem/ksm/ksm03.c       | 12 ++++++---
 testcases/kernel/mem/ksm/ksm04.c       | 17 +++++++------
 testcases/kernel/mem/lib/mem.c         | 10 +++-----
 testcases/kernel/mem/oom/oom03.c       | 18 ++++++++------
 testcases/kernel/mem/oom/oom04.c       | 19 ++++++++------
 testcases/kernel/mem/oom/oom05.c       | 32 ++++++++++++++----------
 9 files changed, 87 insertions(+), 70 deletions(-)

diff --git a/testcases/kernel/mem/cpuset/cpuset01.c b/testcases/kernel/mem/cpuset/cpuset01.c
index 528c3eddd..9771fb952 100644
--- a/testcases/kernel/mem/cpuset/cpuset01.c
+++ b/testcases/kernel/mem/cpuset/cpuset01.c
@@ -35,6 +35,8 @@
 
 #ifdef HAVE_NUMA_V2
 
+static const struct tst_cgroup *cg;
+
 volatile int end;
 static int *nodes;
 static int nnodes;
@@ -47,15 +49,14 @@ static long count_cpu(void);
 
 static void test_cpuset(void)
 {
-	int child, i, status;
+	int child, i;
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
-	char mems[BUFSIZ], buf[BUFSIZ];
+	char buf[BUFSIZ];
 
-	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "cpus", buf, BUFSIZ);
-	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "cpus", buf);
-	tst_cgroup_cpuset_read_files(PATH_TMP_CG_CST, "mems", mems, BUFSIZ);
-	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "mems", mems);
-	tst_cgroup_move_current(PATH_TMP_CG_CST);
+	SAFE_CGROUP_READ(&cg->cpuset.cpus, buf, sizeof(buf));
+	SAFE_CGROUP_PRINT(&cg->cpuset.cpus, buf);
+	SAFE_CGROUP_READ(&cg->cpuset.mems, buf, sizeof(buf));
+	SAFE_CGROUP_PRINT(&cg->cpuset.mems, buf);
 
 	child = SAFE_FORK();
 	if (child == 0) {
@@ -69,33 +70,30 @@ static void test_cpuset(void)
 		exit(mem_hog_cpuset(ncpus > 1 ? ncpus : 1));
 	}
 
-	snprintf(buf, BUFSIZ, "%d", nodes[0]);
-	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "mems", buf);
-	snprintf(buf, BUFSIZ, "%d", nodes[1]);
-	tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "mems", buf);
+	SAFE_CGROUP_PRINTF(&cg->cpuset.mems, "%d", nodes[0]);
+	SAFE_CGROUP_PRINTF(&cg->cpuset.mems, "%d", nodes[1]);
 
-	SAFE_WAITPID(child, &status, WUNTRACED | WCONTINUED);
-	if (WEXITSTATUS(status) != 0) {
-		tst_res(TFAIL, "child exit status is %d", WEXITSTATUS(status));
-		return;
-	}
+	tst_reap_children();
 
 	tst_res(TPASS, "cpuset test pass");
 }
 
 static void setup(void)
 {
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
+	tst_cgroup_require(TST_CGROUP_CPUSET, NULL);
 	ncpus = count_cpu();
 	if (get_allowed_nodes_arr(NH_MEMS | NH_CPUS, &nnodes, &nodes) < 0)
 		tst_brk(TBROK | TERRNO, "get_allowed_nodes_arr");
 	if (nnodes <= 1)
 		tst_brk(TCONF, "requires a NUMA system.");
+
+	cg = tst_cgroup_get_default();
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
 }
 
 static void cleanup(void)
 {
-	tst_cgroup_umount(PATH_TMP_CG_CST);
+	tst_cgroup_cleanup();
 }
 
 static void sighandler(int signo LTP_ATTRIBUTE_UNUSED)
diff --git a/testcases/kernel/mem/include/mem.h b/testcases/kernel/mem/include/mem.h
index 42b12a230..549507b0d 100644
--- a/testcases/kernel/mem/include/mem.h
+++ b/testcases/kernel/mem/include/mem.h
@@ -61,7 +61,7 @@ void check_hugepage(void);
 void write_memcg(void);
 
 /* cpuset/memcg - include/tst_cgroup.h */
-void write_cpusets(const char *cgroup_dir, long nd);
+void write_cpusets(const struct tst_cgroup *cg, long nd);
 
 /* shared */
 unsigned int get_a_numa_node(void);
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index 51f5d4cca..fe6d7a096 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -59,6 +59,9 @@
 #ifdef HAVE_NUMA_V2
 #include <numaif.h>
 
+static const struct tst_cgroup *cg;
+static const struct tst_cgroup *cg_drain;
+
 static void verify_ksm(void)
 {
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
@@ -76,9 +79,10 @@ static void verify_ksm(void)
 	}
 	create_same_memory(size, num, unit);
 
-	write_cpusets(PATH_TMP_CG_CST, node);
-	tst_cgroup_move_current(PATH_TMP_CG_CST);
+	write_cpusets(cg, node);
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
 	create_same_memory(size, num, unit);
+	SAFE_CGROUP_PRINTF(&cg_drain->cgroup.procs, "%d", getpid());
 }
 
 static void cleanup(void)
@@ -87,7 +91,7 @@ static void cleanup(void)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
 
-	tst_cgroup_umount(PATH_TMP_CG_CST);
+	tst_cgroup_cleanup();
 }
 
 static void setup(void)
@@ -103,7 +107,8 @@ static void setup(void)
 		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
 	}
 
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
+	tst_cgroup_require(TST_CGROUP_CPUSET, NULL);
+	cg = tst_cgroup_get_default();
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index e9949280e..1fde489f6 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -59,10 +59,10 @@
 #include "mem.h"
 #include "ksm_common.h"
 
+static const struct tst_cgroup *cg;
+
 static void verify_ksm(void)
 {
-	tst_cgroup_move_current(PATH_TMP_CG_MEM);
-	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 	create_same_memory(size, num, unit);
 }
 
@@ -78,7 +78,11 @@ static void setup(void)
 	}
 
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
+
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
+	cg = tst_cgroup_get_default();
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
+	SAFE_CGROUP_PRINTF(&cg->memory.max, "%lu", TESTMEM);
 }
 
 static void cleanup(void)
@@ -86,7 +90,7 @@ static void cleanup(void)
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
+	tst_cgroup_cleanup();
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index b4ad41831..56d9ae28f 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -59,6 +59,8 @@
 #ifdef HAVE_NUMA_V2
 #include <numaif.h>
 
+static const struct tst_cgroup *cg;
+
 static void verify_ksm(void)
 {
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
@@ -67,8 +69,7 @@ static void verify_ksm(void)
 	node = get_a_numa_node();
 	set_node(nmask, node);
 
-	tst_cgroup_move_current(PATH_TMP_CG_MEM);
-	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
+	SAFE_CGROUP_PRINTF(&cg->memory.max, "%lu", TESTMEM);
 
 	if (set_mempolicy(MPOL_BIND, nmask, MAXNODES) == -1) {
 		if (errno != ENOSYS)
@@ -79,8 +80,7 @@ static void verify_ksm(void)
 	}
 	create_same_memory(size, num, unit);
 
-	write_cpusets(PATH_TMP_CG_CST, node);
-	tst_cgroup_move_current(PATH_TMP_CG_CST);
+	write_cpusets(cg, node);
 	create_same_memory(size, num, unit);
 }
 
@@ -90,8 +90,7 @@ static void cleanup(void)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
 
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
-	tst_cgroup_umount(PATH_TMP_CG_CST);
+	tst_cgroup_cleanup();
 }
 
 static void setup(void)
@@ -107,8 +106,10 @@ static void setup(void)
 
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
 
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
+	tst_cgroup_require(TST_CGROUP_CPUSET, NULL);
+	cg = tst_cgroup_get_default();
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
index 2de3f83a6..b980daf48 100644
--- a/testcases/kernel/mem/lib/mem.c
+++ b/testcases/kernel/mem/lib/mem.c
@@ -629,13 +629,11 @@ static void gather_node_cpus(char *cpus, long nd)
 	cpus[strlen(cpus) - 1] = '\0';
 }
 
-void write_cpusets(const char *cgroup_dir, long nd)
+void write_cpusets(const struct tst_cgroup *cg, long nd)
 {
-	char buf[BUFSIZ];
 	char cpus[BUFSIZ] = "";
 
-	snprintf(buf, BUFSIZ, "%ld", nd);
-	tst_cgroup_cpuset_write_files(cgroup_dir, "mems", buf);
+	SAFE_CGROUP_PRINTF(&cg->cpuset.mems, "%ld", nd);
 
 	gather_node_cpus(cpus, nd);
 	/*
@@ -644,11 +642,11 @@ void write_cpusets(const char *cgroup_dir, long nd)
 	 * the value of cpuset.cpus.
 	 */
 	if (strlen(cpus) != 0) {
-		tst_cgroup_cpuset_write_files(cgroup_dir, "cpus", cpus);
+		SAFE_CGROUP_PRINT(&cg->cpuset.cpus, cpus);
 	} else {
 		tst_res(TINFO, "No CPUs in the node%ld; "
 				"using only CPU0", nd);
-		tst_cgroup_cpuset_write_files(cgroup_dir, "cpus", "0");
+		SAFE_CGROUP_PRINT(&cg->cpuset.cpus, "0");
 	}
 }
 
diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/oom/oom03.c
index fc860c660..abc627833 100644
--- a/testcases/kernel/mem/oom/oom03.c
+++ b/testcases/kernel/mem/oom/oom03.c
@@ -36,19 +36,17 @@
 
 #ifdef HAVE_NUMA_V2
 
+static const struct tst_cgroup *cg;
+
 static void verify_oom(void)
 {
 #ifdef TST_ABI32
 	tst_brk(TCONF, "test is not designed for 32-bit system.");
 #endif
-
-	tst_cgroup_move_current(PATH_TMP_CG_MEM);
-	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
-
 	testoom(0, 0, ENOMEM, 1);
 
-	if (tst_cgroup_mem_swapacct_enabled(PATH_TMP_CG_MEM)) {
-		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, TESTMEM);
+	if (TST_CGROUP_HAS(&cg->memory.swap)) {
+		SAFE_CGROUP_PRINTF(&cg->memory.swap.max, "%lu", TESTMEM);
 		testoom(0, 1, ENOMEM, 1);
 	}
 
@@ -65,14 +63,18 @@ static void setup(void)
 {
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
+
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
+	cg = tst_cgroup_get_default();
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
+	SAFE_CGROUP_PRINTF(&cg->memory.max, "%lu", TESTMEM);
 }
 
 static void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
+	tst_cgroup_cleanup();
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/oom/oom04.c b/testcases/kernel/mem/oom/oom04.c
index 582663275..acffb0436 100644
--- a/testcases/kernel/mem/oom/oom04.c
+++ b/testcases/kernel/mem/oom/oom04.c
@@ -36,24 +36,25 @@
 
 #ifdef HAVE_NUMA_V2
 
+static const struct tst_cgroup *cg;
+
 static void verify_oom(void)
 {
 #ifdef TST_ABI32
 	tst_brk(TCONF, "test is not designed for 32-bit system.");
 #endif
-
-	tst_cgroup_move_current(PATH_TMP_CG_CST);
-
 	tst_res(TINFO, "OOM on CPUSET...");
 	testoom(0, 0, ENOMEM, 1);
 
-	if (is_numa(NULL, NH_MEMS, 2)) {
+	if (is_numa(NULL, NH_MEMS, 2) &&
+	    TST_CGROUP_HAS(&cg->cpuset.memory_migrate)) {
 		/*
 		 * Under NUMA system, the migration of cpuset's memory
 		 * is in charge of cpuset.memory_migrate, we can write
 		 * 1 to cpuset.memory_migrate to enable the migration.
 		 */
-		tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "memory_migrate", "1");
+		SAFE_CGROUP_PRINT(&cg->cpuset.memory_migrate, "1");
+
 		tst_res(TINFO, "OOM on CPUSET with mem migrate:");
 		testoom(0, 0, ENOMEM, 1);
 	}
@@ -69,7 +70,8 @@ static void setup(void)
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
 
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
+	tst_cgroup_require(TST_CGROUP_CPUSET, NULL);
+	cg = tst_cgroup_get_default();
 
 	/*
 	 * Some nodes do not contain memory, so use
@@ -81,14 +83,15 @@ static void setup(void)
 	if (ret < 0)
 		tst_brk(TBROK, "Failed to get a memory node "
 			      "using get_allowed_nodes()");
-	write_cpusets(PATH_TMP_CG_CST, memnode);
+	write_cpusets(cg, memnode);
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
 }
 
 static void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	tst_cgroup_umount(PATH_TMP_CG_CST);
+	tst_cgroup_cleanup();
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/oom/oom05.c b/testcases/kernel/mem/oom/oom05.c
index 871f302e3..7a7959d79 100644
--- a/testcases/kernel/mem/oom/oom05.c
+++ b/testcases/kernel/mem/oom/oom05.c
@@ -36,6 +36,8 @@
 
 #ifdef HAVE_NUMA_V2
 
+static const struct tst_cgroup *cg;
+
 static void verify_oom(void)
 {
 #ifdef TST_ABI32
@@ -43,9 +45,6 @@ static void verify_oom(void)
 #endif
 
 	tst_res(TINFO, "OOM on CPUSET & MEMCG...");
-	tst_cgroup_move_current(PATH_TMP_CG_MEM);
-	tst_cgroup_move_current(PATH_TMP_CG_CST);
-	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 	testoom(0, 0, ENOMEM, 1);
 
 	/*
@@ -53,22 +52,26 @@ static void verify_oom(void)
 	 * is in charge of cpuset.memory_migrate, we can write
 	 * 1 to cpuset.memory_migrate to enable the migration.
 	 */
-	if (is_numa(NULL, NH_MEMS, 2)) {
-		tst_cgroup_cpuset_write_files(PATH_TMP_CG_CST, "memory_migrate", "1");
+	if (is_numa(NULL, NH_MEMS, 2) &&
+	    TST_CGROUP_HAS(&cg->cpuset.memory_migrate)) {
+		SAFE_CGROUP_PRINT(&cg->cpuset.memory_migrate, "1");
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"cpuset.memory_migrate=1");
 		testoom(0, 0, ENOMEM, 1);
 	}
 
-	if (tst_cgroup_mem_swapacct_enabled(PATH_TMP_CG_MEM)) {
+	if (TST_CGROUP_HAS(&cg->memory.swap)) {
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"special memswap limitation:");
-		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, TESTMEM);
+		SAFE_CGROUP_PRINTF(&cg->memory.swap.max, "%lu", TESTMEM);
 		testoom(0, 0, ENOMEM, 1);
 
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"disabled memswap limitation:");
-		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, -1);
+		if (cg->memory.ver == TST_CGROUP_V1)
+			SAFE_CGROUP_PRINTF(&cg->memory.swap.max, "%lu", ~0UL);
+		else
+			SAFE_CGROUP_PRINT(&cg->memory.swap.max, "max");
 		testoom(0, 0, ENOMEM, 1);
 	}
 }
@@ -83,8 +86,9 @@ void setup(void)
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
 
-	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
-	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
+	tst_cgroup_require(TST_CGROUP_CPUSET, NULL);
+	cg = tst_cgroup_get_default();
 
 	/*
 	 * Some nodes do not contain memory, so use
@@ -96,15 +100,17 @@ void setup(void)
 	if (ret < 0)
 		tst_brk(TBROK, "Failed to get a memory node "
 			      "using get_allowed_nodes()");
-	write_cpusets(PATH_TMP_CG_CST, memnode);
+
+	write_cpusets(cg, memnode);
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
+	SAFE_CGROUP_PRINTF(&cg->memory.max, "%lu", TESTMEM);
 }
 
 void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	tst_cgroup_umount(PATH_TMP_CG_MEM);
-	tst_cgroup_umount(PATH_TMP_CG_CST);
+	tst_cgroup_cleanup();
 }
 
 static struct tst_test test = {
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
