Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6932A412
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:28:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B29383C56FC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 16:28:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1400B3C6166
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 690391407115
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 16:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614698877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccnu2Hhkch7+2IK3q/TDyOR06wW+FlxUlHut4RmnOJo=;
 b=azr9V5iZ0CcK17kt/ykDU283IWyA8qycqznGgExeMLyzIapqdfxqI5b3Zdxp55MuRBrSj/
 MWmgLpcOig54Xda72fW3r7z7mBGE6pULuKPbUzmIn9P0B6tUqzVHmk9b+4U9pYrdCCzcGL
 oVtvYtPiX7ZxJF55GM/5mKX7F91uCYI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A696AD57;
 Tue,  2 Mar 2021 15:27:57 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  2 Mar 2021 15:25:10 +0000
Message-Id: <20210302152510.15116-8-rpalethorpe@suse.com>
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
Subject: [LTP] [RFC PATCH v2 7/7] madvise06: Convert to new CGroups API
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
 testcases/kernel/syscalls/madvise/madvise06.c | 83 +++++++++----------
 1 file changed, 38 insertions(+), 45 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 2099df6c3..209066d77 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -3,8 +3,8 @@
  * Copyright (c) 2016 Red Hat, Inc.
  */
 
-/*
- * DESCRIPTION
+/*\
+ * [DESCRIPTION]
  *
  *   Page fault occurs in spite that madvise(WILLNEED) system call is called
  *   to prefetch the page. This issue is reproduced by running a program
@@ -36,13 +36,14 @@
  *   else unexpected, but irrelevant procedure, registers a fault to
  *   our process.
  *
- */
+\*/
 
 #include <errno.h>
 #include <stdio.h>
 #include <sys/mount.h>
 #include <sys/sysinfo.h>
 #include "tst_test.h"
+#include "tst_cgroup.h"
 
 #define CHUNK_SZ (400*1024*1024L)
 #define MEM_LIMIT (CHUNK_SZ / 2)
@@ -50,8 +51,7 @@
 #define PASS_THRESHOLD (CHUNK_SZ / 4)
 #define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
 
-#define MNT_NAME "memory"
-#define GROUP_NAME "madvise06"
+static const struct tst_cgroup *cg;
 
 static const char drop_caches_fname[] = "/proc/sys/vm/drop_caches";
 static int pg_sz, stat_refresh_sup;
@@ -64,17 +64,20 @@ static void check_path(const char *path)
 		tst_brk(TCONF, "file needed: %s\n", path);
 }
 
-#define READ_CGMEM(item)						\
-	({long tst_rval = 0;						\
-	  const char *cgpath = MNT_NAME"/"GROUP_NAME"/memory."item;	\
-	  if (!access(cgpath, R_OK))					\
-		  SAFE_FILE_LINES_SCANF(cgpath, "%ld", &tst_rval);	\
-	  tst_rval;})
+static void print_cgmem(const struct tst_cgroup_file *file)
+{
+	const char *name = file->locations[0].name;
+	long ret;
+
+	if (!TST_CGROUP_HAS(file))
+		return;
+
+	SAFE_CGROUP_SCANF(file, "%ld", &ret);
+	tst_res(TINFO, "\t%s: %ld Kb", name, ret / 1024);
+}
 
 static void meminfo_diag(const char *point)
 {
-	long rval;
-
 	if (stat_refresh_sup)
 		SAFE_FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
 
@@ -85,16 +88,10 @@ static void meminfo_diag(const char *point)
 		SAFE_READ_MEMINFO("SwapCached:") - init_swap_cached);
 	tst_res(TINFO, "\tCached: %ld Kb",
 		SAFE_READ_MEMINFO("Cached:") - init_cached);
-	tst_res(TINFO, "\tcgmem.usage_in_bytes: %ld Kb",
-		READ_CGMEM("usage_in_bytes") / 1024);
-
-	rval = READ_CGMEM("memsw.usage_in_bytes") / 1024;
-	if (rval)
-		tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb", rval);
 
-	rval = READ_CGMEM("kmem.usage_in_bytes") / 1024;
-	if (rval)
-		tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb", rval);
+	print_cgmem(&cg->memory.current);
+	print_cgmem(&cg->memory.swap.current);
+	print_cgmem(&cg->memory.kmem.current);
 }
 
 static void setup(void)
@@ -117,28 +114,24 @@ static void setup(void)
 			2 * CHUNK_SZ);
 	}
 
-	SAFE_MKDIR(MNT_NAME, 0700);
-	if (mount("memory", MNT_NAME, "cgroup", 0, "memory") == -1) {
-		if (errno == ENODEV || errno == ENOENT)
-			tst_brk(TCONF, "memory cgroup needed");
-	}
-	SAFE_MKDIR(MNT_NAME"/"GROUP_NAME, 0700);
-
 	check_path("/proc/self/oom_score_adj");
-	check_path(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes");
-	check_path(MNT_NAME"/"GROUP_NAME"/memory.swappiness");
-	check_path(MNT_NAME"/"GROUP_NAME"/tasks");
-
 	SAFE_FILE_PRINTF("/proc/self/oom_score_adj", "%d", -1000);
-	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes", "%ld\n",
-			 MEM_LIMIT);
 
-	if (!access(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes", W_OK)) {
-		SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes",
-				 "%ld\n", MEMSW_LIMIT);
+	tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
+	cg = tst_cgroup_get_default();
+
+	SAFE_CGROUP_PRINTF(&cg->memory.max, "%ld", MEM_LIMIT);
+	if (TST_CGROUP_HAS(&cg->memory.swap))
+		SAFE_CGROUP_PRINTF(&cg->memory.swap.max, "%ld", MEMSW_LIMIT);
+
+	if (TST_CGROUP_HAS(&cg->memory.swappiness)) {
+		SAFE_CGROUP_PRINT(&cg->memory.swappiness, "60");
+	} else {
+		check_path("/proc/sys/vm/swappiness");
+		SAFE_FILE_PRINTF("/proc/sys/vm/swappiness", "%d", 60);
 	}
-	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.swappiness", "60");
-	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/tasks", "%d\n", getpid());
+
+	SAFE_CGROUP_PRINTF(&cg->cgroup.procs, "%d", getpid());
 
 	meminfo_diag("Initial meminfo, later values are relative to this (except memcg)");
 	init_swap = SAFE_READ_MEMINFO("SwapTotal:") - SAFE_READ_MEMINFO("SwapFree:");
@@ -154,11 +147,7 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	if (!access(MNT_NAME"/tasks", F_OK)) {
-		SAFE_FILE_PRINTF(MNT_NAME"/tasks", "%d\n", getpid());
-		SAFE_RMDIR(MNT_NAME"/"GROUP_NAME);
-		SAFE_UMOUNT(MNT_NAME);
-	}
+	tst_cgroup_cleanup();
 }
 
 static void dirty_pages(char *ptr, long size)
@@ -248,6 +237,10 @@ static struct tst_test test = {
 	.min_kver = "3.10.0",
 	.needs_tmpdir = 1,
 	.needs_root = 1,
+	.save_restore = (const char * const[]) {
+		"?/proc/sys/vm/swappiness",
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "55231e5c898c"},
 		{"linux-git", "8de15e920dc8"},
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
