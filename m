Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DBC1EF3CE
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:14:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9C833C2F66
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:14:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id ADE753C2F81
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:13:28 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id EA5A960111C
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591348406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryx2pFWWjuUBaM6iymPCBF/5ZXJShHM9ZCx+kpcmg1o=;
 b=T2Wj26judnmFoMEFwskpl5zHGMnCl1Na9fW/kooNuUSbytgtYhufPrVSbp6s1YGheSp3kr
 XdPWtM6JqrbCdP+atglGnUL1ew+4FDytayWyoeR/UzpLKXYFNuu11vq28XwSvn9CziQIkC
 6wlDtHEX0nwWbDT6xnhn3O3VByIusmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-wHd6bTrIMMSk4bPC67tk3A-1; Fri, 05 Jun 2020 05:13:22 -0400
X-MC-Unique: wHd6bTrIMMSk4bPC67tk3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE2E80B725
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:13:21 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59EA55D9D7
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:13:20 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  5 Jun 2020 17:13:14 +0800
Message-Id: <20200605091316.27546-2-liwang@redhat.com>
In-Reply-To: <20200605091316.27546-1-liwang@redhat.com>
References: <20200605091316.27546-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/4] mem: take use of new cgroup API
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

For issue #611:
  https://github.com/linux-test-project/ltp/issues/611

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/mem/cpuset/cpuset01.c | 19 +++++++------
 testcases/kernel/mem/include/mem.h     |  1 +
 testcases/kernel/mem/ksm/ksm02.c       | 10 +++----
 testcases/kernel/mem/ksm/ksm03.c       | 12 +++-----
 testcases/kernel/mem/ksm/ksm04.c       | 19 +++++--------
 testcases/kernel/mem/lib/mem.c         |  8 ++----
 testcases/kernel/mem/oom/oom03.c       | 22 ++++-----------
 testcases/kernel/mem/oom/oom04.c       | 12 ++++----
 testcases/kernel/mem/oom/oom05.c       | 38 ++++++++------------------
 9 files changed, 52 insertions(+), 89 deletions(-)

diff --git a/testcases/kernel/mem/cpuset/cpuset01.c b/testcases/kernel/mem/cpuset/cpuset01.c
index 853f7fe55..77f6e4dca 100644
--- a/testcases/kernel/mem/cpuset/cpuset01.c
+++ b/testcases/kernel/mem/cpuset/cpuset01.c
@@ -51,11 +51,11 @@ static void test_cpuset(void)
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
 	char mems[BUFSIZ], buf[BUFSIZ];
 
-	read_cpuset_files(CPATH, "cpus", buf);
-	write_cpuset_files(CPATH_NEW, "cpus", buf);
-	read_cpuset_files(CPATH, "mems", mems);
-	write_cpuset_files(CPATH_NEW, "mems", mems);
-	SAFE_FILE_PRINTF(CPATH_NEW "/tasks", "%d", getpid());
+	tst_cgroup_move_current(PATH_TMP_CG_CST);
+	read_cpuset_files(tst_cgroup_mnt_path, "cpus", buf);
+	write_cpuset_files(tst_cgroup_new_path, "cpus", buf);
+	read_cpuset_files(tst_cgroup_mnt_path, "mems", mems);
+	write_cpuset_files(tst_cgroup_new_path, "mems", mems);
 
 	child = SAFE_FORK();
 	if (child == 0) {
@@ -70,9 +70,9 @@ static void test_cpuset(void)
 	}
 
 	snprintf(buf, BUFSIZ, "%d", nodes[0]);
-	write_cpuset_files(CPATH_NEW, "mems", buf);
+	write_cpuset_files(tst_cgroup_new_path, "mems", buf);
 	snprintf(buf, BUFSIZ, "%d", nodes[1]);
-	write_cpuset_files(CPATH_NEW, "mems", buf);
+	write_cpuset_files(tst_cgroup_new_path, "mems", buf);
 
 	SAFE_WAITPID(child, &status, WUNTRACED | WCONTINUED);
 	if (WEXITSTATUS(status) != 0) {
@@ -85,7 +85,7 @@ static void test_cpuset(void)
 
 static void setup(void)
 {
-	mount_mem("cpuset", "cpuset", NULL, CPATH, CPATH_NEW);
+	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
 	ncpus = count_cpu();
 	if (get_allowed_nodes_arr(NH_MEMS | NH_CPUS, &nnodes, &nodes) < 0)
 		tst_brk(TBROK | TERRNO, "get_allowed_nodes_arr");
@@ -95,7 +95,7 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	umount_mem(CPATH, CPATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_CST);
 }
 
 static void sighandler(int signo LTP_ATTRIBUTE_UNUSED)
@@ -183,6 +183,7 @@ static long count_cpu(void)
 
 static struct tst_test test = {
 	.needs_root = 1,
+	.forks_child = 1,
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = test_cpuset,
diff --git a/testcases/kernel/mem/include/mem.h b/testcases/kernel/mem/include/mem.h
index cce9c0497..f553651c2 100644
--- a/testcases/kernel/mem/include/mem.h
+++ b/testcases/kernel/mem/include/mem.h
@@ -2,6 +2,7 @@
 #define _MEM_H
 #include "config.h"
 #include "tst_test.h"
+#include "tst_cgroup.h"
 #include "ksm_helper.h"
 
 #if defined(__powerpc__) || defined(__powerpc64__)
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index 3d4c19deb..72e650a53 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -59,13 +59,13 @@
 #ifdef HAVE_NUMA_V2
 #include <numaif.h>
 
-static int cpuset_mounted;
-
 static void verify_ksm(void)
 {
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
 	unsigned int node;
 
+	tst_cgroup_move_current(PATH_TMP_CG_CST);
+
 	node = get_a_numa_node();
 	set_node(nmask, node);
 
@@ -88,8 +88,7 @@ static void cleanup(void)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
 
-	if (cpuset_mounted)
-		umount_mem(CPATH, CPATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_CST);
 }
 
 static void setup(void)
@@ -105,8 +104,7 @@ static void setup(void)
 		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
 	}
 
-	mount_mem("cpuset", "cpuset", NULL, CPATH, CPATH_NEW);
-	cpuset_mounted = 1;
+	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index 0e5131654..cc3695e95 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -59,11 +59,10 @@
 #include "mem.h"
 #include "ksm_common.h"
 
-static int memcg_mounted;
-
 static void verify_ksm(void)
 {
-	write_memcg();
+	tst_cgroup_move_current(PATH_TMP_CG_MEM);
+	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 	create_same_memory(size, num, unit);
 }
 
@@ -79,8 +78,7 @@ static void setup(void)
 	}
 
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
-	mount_mem("memcg", "cgroup", "memory", MEMCG_PATH, MEMCG_PATH_NEW);
-	memcg_mounted = 1;
+	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
 }
 
 static void cleanup(void)
@@ -88,9 +86,7 @@ static void cleanup(void)
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
-
-	if (memcg_mounted)
-		umount_mem(MEMCG_PATH, MEMCG_PATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_MEM);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index e393dbd40..cafab479c 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -59,9 +59,6 @@
 #ifdef HAVE_NUMA_V2
 #include <numaif.h>
 
-static int cpuset_mounted;
-static int memcg_mounted;
-
 static void verify_ksm(void)
 {
 	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
@@ -70,7 +67,8 @@ static void verify_ksm(void)
 	node = get_a_numa_node();
 	set_node(nmask, node);
 
-	write_memcg();
+	tst_cgroup_move_current(PATH_TMP_CG_MEM);
+	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 
 	if (set_mempolicy(MPOL_BIND, nmask, MAXNODES) == -1) {
 		if (errno != ENOSYS)
@@ -81,6 +79,7 @@ static void verify_ksm(void)
 	}
 	create_same_memory(size, num, unit);
 
+	tst_cgroup_move_current(PATH_TMP_CG_CST);
 	write_cpusets(node);
 	create_same_memory(size, num, unit);
 }
@@ -91,10 +90,8 @@ static void cleanup(void)
 		FILE_PRINTF(PATH_KSM "merge_across_nodes",
 				 "%d", merge_across_nodes);
 
-	if (cpuset_mounted)
-		umount_mem(CPATH, CPATH_NEW);
-	if (memcg_mounted)
-		umount_mem(MEMCG_PATH, MEMCG_PATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_MEM);
+	tst_cgroup_umount(PATH_TMP_CG_CST);
 }
 
 static void setup(void)
@@ -110,10 +107,8 @@ static void setup(void)
 
 	parse_ksm_options(opt_sizestr, &size, opt_numstr, &num, opt_unitstr, &unit);
 
-	mount_mem("cpuset", "cpuset", NULL, CPATH, CPATH_NEW);
-	cpuset_mounted = 1;
-	mount_mem("memcg", "cgroup", "memory", MEMCG_PATH, MEMCG_PATH_NEW);
-	memcg_mounted = 1;
+	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
+	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
index eca4c61c8..45f155922 100644
--- a/testcases/kernel/mem/lib/mem.c
+++ b/testcases/kernel/mem/lib/mem.c
@@ -692,7 +692,7 @@ void write_cpusets(long nd)
 	char cpus[BUFSIZ] = "";
 
 	snprintf(buf, BUFSIZ, "%ld", nd);
-	write_cpuset_files(CPATH_NEW, "mems", buf);
+	write_cpuset_files(tst_cgroup_new_path, "mems", buf);
 
 	gather_node_cpus(cpus, nd);
 	/*
@@ -701,14 +701,12 @@ void write_cpusets(long nd)
 	 * the value of cpuset.cpus.
 	 */
 	if (strlen(cpus) != 0) {
-		write_cpuset_files(CPATH_NEW, "cpus", cpus);
+		write_cpuset_files(tst_cgroup_new_path, "cpus", cpus);
 	} else {
 		tst_res(TINFO, "No CPUs in the node%ld; "
 				"using only CPU0", nd);
-		write_cpuset_files(CPATH_NEW, "cpus", "0");
+		write_cpuset_files(tst_cgroup_new_path, "cpus", "0");
 	}
-
-	SAFE_FILE_PRINTF(CPATH_NEW "/tasks", "%d", getpid());
 }
 
 void umount_mem(char *path, char *path_new)
diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/oom/oom03.c
index ce0b34c31..fc860c660 100644
--- a/testcases/kernel/mem/oom/oom03.c
+++ b/testcases/kernel/mem/oom/oom03.c
@@ -36,27 +36,19 @@
 
 #ifdef HAVE_NUMA_V2
 
-static int memcg_mounted;
-
 static void verify_oom(void)
 {
 #ifdef TST_ABI32
 	tst_brk(TCONF, "test is not designed for 32-bit system.");
 #endif
 
-	SAFE_FILE_PRINTF(MEMCG_PATH_NEW "/tasks", "%d", getpid());
-	SAFE_FILE_PRINTF(MEMCG_LIMIT, "%ld", TESTMEM);
+	tst_cgroup_move_current(PATH_TMP_CG_MEM);
+	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 
 	testoom(0, 0, ENOMEM, 1);
 
-	if (access(MEMCG_SW_LIMIT, F_OK) == -1) {
-		if (errno == ENOENT)
-			tst_res(TCONF,
-				"memcg swap accounting is disabled");
-		else
-			tst_brk(TBROK | TERRNO, "access");
-	} else {
-		SAFE_FILE_PRINTF(MEMCG_SW_LIMIT, "%ld", TESTMEM);
+	if (tst_cgroup_mem_swapacct_enabled(PATH_TMP_CG_MEM)) {
+		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, TESTMEM);
 		testoom(0, 1, ENOMEM, 1);
 	}
 
@@ -73,16 +65,14 @@ static void setup(void)
 {
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
-	mount_mem("memcg", "cgroup", "memory", MEMCG_PATH, MEMCG_PATH_NEW);
-	memcg_mounted = 1;
+	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
 }
 
 static void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	if (memcg_mounted)
-		umount_mem(MEMCG_PATH, MEMCG_PATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_MEM);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/oom/oom04.c b/testcases/kernel/mem/oom/oom04.c
index 7185ef973..c1c809b63 100644
--- a/testcases/kernel/mem/oom/oom04.c
+++ b/testcases/kernel/mem/oom/oom04.c
@@ -36,14 +36,14 @@
 
 #ifdef HAVE_NUMA_V2
 
-static int cpuset_mounted;
-
 static void verify_oom(void)
 {
 #ifdef TST_ABI32
 	tst_brk(TCONF, "test is not designed for 32-bit system.");
 #endif
 
+	tst_cgroup_move_current(PATH_TMP_CG_CST);
+
 	tst_res(TINFO, "OOM on CPUSET...");
 	testoom(0, 0, ENOMEM, 1);
 
@@ -53,7 +53,7 @@ static void verify_oom(void)
 		 * is in charge of cpuset.memory_migrate, we can write
 		 * 1 to cpuset.memory_migrate to enable the migration.
 		 */
-		write_cpuset_files(CPATH_NEW, "memory_migrate", "1");
+		write_cpuset_files(tst_cgroup_new_path, "memory_migrate", "1");
 		tst_res(TINFO, "OOM on CPUSET with mem migrate:");
 		testoom(0, 0, ENOMEM, 1);
 	}
@@ -69,8 +69,7 @@ static void setup(void)
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
 
-	mount_mem("cpuset", "cpuset", NULL, CPATH, CPATH_NEW);
-	cpuset_mounted = 1;
+	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
 
 	/*
 	 * Some nodes do not contain memory, so use
@@ -89,8 +88,7 @@ static void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	if (cpuset_mounted)
-		umount_mem(CPATH, CPATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_CST);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/oom/oom05.c b/testcases/kernel/mem/oom/oom05.c
index db24df6de..ef70864ff 100644
--- a/testcases/kernel/mem/oom/oom05.c
+++ b/testcases/kernel/mem/oom/oom05.c
@@ -36,18 +36,16 @@
 
 #ifdef HAVE_NUMA_V2
 
-static int memcg_mounted;
-static int cpuset_mounted;
-
 static void verify_oom(void)
 {
-	int swap_acc_on = 1;
-
 #ifdef TST_ABI32
 	tst_brk(TCONF, "test is not designed for 32-bit system.");
 #endif
 
 	tst_res(TINFO, "OOM on CPUSET & MEMCG...");
+	tst_cgroup_move_current(PATH_TMP_CG_MEM);
+	tst_cgroup_move_current(PATH_TMP_CG_CST);
+	tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, TESTMEM);
 	testoom(0, 0, ENOMEM, 1);
 
 	/*
@@ -56,29 +54,22 @@ static void verify_oom(void)
 	 * 1 to cpuset.memory_migrate to enable the migration.
 	 */
 	if (is_numa(NULL, NH_MEMS, 2)) {
-		write_cpuset_files(CPATH_NEW, "memory_migrate", "1");
+		tst_cgroup_move_current(PATH_TMP_CG_CST);
+		write_cpuset_files(tst_cgroup_new_path, "memory_migrate", "1");
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"cpuset.memory_migrate=1");
 		testoom(0, 0, ENOMEM, 1);
 	}
 
-	if (access(MEMCG_SW_LIMIT, F_OK) == -1) {
-		if (errno == ENOENT) {
-			tst_res(TCONF, "memcg swap accounting is disabled");
-			swap_acc_on = 0;
-		} else
-			tst_brk(TBROK|TERRNO, "access");
-	}
-
-	if (swap_acc_on) {
+	if (tst_cgroup_mem_swapacct_enabled(PATH_TMP_CG_MEM)) {
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"special memswap limitation:");
-		SAFE_FILE_PRINTF(MEMCG_SW_LIMIT, "%ld", TESTMEM);
+		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, TESTMEM);
 		testoom(0, 0, ENOMEM, 1);
 
 		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
 				"disabled memswap limitation:");
-		SAFE_FILE_PRINTF(MEMCG_SW_LIMIT, "-1");
+		tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, -1);
 		testoom(0, 0, ENOMEM, 1);
 	}
 }
@@ -93,11 +84,8 @@ void setup(void)
 	overcommit = get_sys_tune("overcommit_memory");
 	set_sys_tune("overcommit_memory", 1, 1);
 
-	mount_mem("memcg", "cgroup", "memory", MEMCG_PATH, MEMCG_PATH_NEW);
-	memcg_mounted = 1;
-	mount_mem("cpuset", "cpuset", NULL, CPATH, CPATH_NEW);
-	cpuset_mounted = 1;
-	write_memcg();
+	tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
+	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
 
 	/*
 	 * Some nodes do not contain memory, so use
@@ -116,10 +104,8 @@ void cleanup(void)
 {
 	if (overcommit != -1)
 		set_sys_tune("overcommit_memory", overcommit, 0);
-	if (cpuset_mounted)
-		umount_mem(CPATH, CPATH_NEW);
-	if (memcg_mounted)
-		umount_mem(MEMCG_PATH, MEMCG_PATH_NEW);
+	tst_cgroup_umount(PATH_TMP_CG_MEM);
+	tst_cgroup_umount(PATH_TMP_CG_CST);
 }
 
 static struct tst_test test = {
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
