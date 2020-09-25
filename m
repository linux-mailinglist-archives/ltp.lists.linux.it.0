Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA32786F4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:20:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832DD3C3029
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:20:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 952AC3C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:20:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C885200DF6
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601036438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=US3NgQrsZ878WiAERQcYgWpMONZ5lyrdS4wrWMW6qWk=;
 b=N2VONAd69ObTOicQqc55Zq1pKvzJuG2uKSplqoChqoum3WI5CdGlsvPr02arQhAjkHK6FJ
 PtIiv0MH0XJOGmYzMjpI/PZuKG1fKZ+RWyTEwbZgF9ds0gag+k62a5KR23B/Dx9xTcxAQS
 9SxtGL7MwEyuqu5b4Sj5tXiMAEwT7rk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6365DAC5F;
 Fri, 25 Sep 2020 12:20:38 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Fri, 25 Sep 2020 13:19:41 +0100
Message-Id: <20200925121941.10475-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC][PATCH] tst_cgroup: Attempt to use CGroups V2 then V1
 instead of guessing
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The best way to find out if we can do something is to try it, we don't
check if the system has enough RAM and PIDs available before calling
fork() in safe_fork(). Currently we try to guess what cgroups are
currently in use then try to use the same version. We guess by
grepping the mounts and filesystem files, these files need to be
parsed in a structured way and even then, it is not the job of all
tests which *use* cgroups to test that if cgroup(2) is present in
mounts or filesystem that it can then be used.

The cpuset group is only available on V1 and we can mount and use V1
even if V2 is active. Just because the system has V2 active does not
mean we cannot execute tests which require V1. This is one example
where trying to figure out ahead of time what can or can't be used
results in less testing.

Furthermore removing these checks results in a ~50% reduction in code
and this is without correct parsing and checking of mounts and
filesystems. We also have to consider that just because one V1
controller is mounted, this does not prevent all V2 controllers from
being used. So someone may mount V1 cpuset for legacy reasons, while
using V2 for other controllers. To account for this we would need to
check each controller individually.

Note that the above may be a valid thing to do in a test checking
specific cgroup behavior, but this library code is meant for use by
all tests which need cgroups for some reason.
---
 include/tst_cgroup.h |   2 -
 lib/tst_cgroup.c     | 118 ++++++++++++++-----------------------------
 2 files changed, 39 insertions(+), 81 deletions(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 77780e0d6..62d381ce9 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -21,8 +21,6 @@ enum tst_cgroup_ctrl {
 	/* add cgroup controller */
 };
 
-enum tst_cgroup_ver tst_cgroup_version(void);
-
 /* To mount/umount specified cgroup controller on 'cgroup_dir' path */
 void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cgroup_dir);
 void tst_cgroup_umount(const char *cgroup_dir);
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index ba413d874..887423bc6 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -21,47 +21,6 @@
 static enum tst_cgroup_ver tst_cg_ver;
 static int clone_children;
 
-static int tst_cgroup_check(const char *cgroup)
-{
-	char line[PATH_MAX];
-	FILE *file;
-	int cg_check = 0;
-
-	file = SAFE_FOPEN("/proc/filesystems", "r");
-	while (fgets(line, sizeof(line), file)) {
-		if (strstr(line, cgroup) != NULL) {
-			cg_check = 1;
-			break;
-		}
-	}
-	SAFE_FCLOSE(file);
-
-	return cg_check;
-}
-
-enum tst_cgroup_ver tst_cgroup_version(void)
-{
-        enum tst_cgroup_ver cg_ver;
-
-        if (tst_cgroup_check("cgroup2")) {
-                if (!tst_is_mounted("cgroup2") && tst_is_mounted("cgroup"))
-                        cg_ver = TST_CGROUP_V1;
-                else
-                        cg_ver = TST_CGROUP_V2;
-
-                goto out;
-        }
-
-        if (tst_cgroup_check("cgroup"))
-                cg_ver = TST_CGROUP_V1;
-
-        if (!cg_ver)
-                tst_brk(TCONF, "Cgroup is not configured");
-
-out:
-        return cg_ver;
-}
-
 static void tst_cgroup1_mount(const char *name, const char *option,
 			const char *mnt_path, const char *new_path)
 {
@@ -100,26 +59,18 @@ out:
 	tst_res(TINFO, "Cgroup(%s) v1 mount at %s success", option, mnt_path);
 }
 
-static void tst_cgroup2_mount(const char *mnt_path, const char *new_path)
+static int cgroup2_mount(const char *mnt_path, const char *new_path)
 {
-	if (tst_is_mounted(mnt_path))
-		goto out;
+	if (!tst_is_mounted(mnt_path)) {
+		SAFE_MKDIR(mnt_path, 0777);
 
-	SAFE_MKDIR(mnt_path, 0777);
-	if (mount("cgroup2", mnt_path, "cgroup2", 0, NULL) == -1) {
-		if (errno == ENODEV) {
-			if (rmdir(mnt_path) == -1)
-				tst_res(TWARN | TERRNO, "rmdir %s failed", mnt_path);
-			tst_brk(TCONF,
-				 "Cgroup v2 is not configured in kernel");
-		}
-		tst_brk(TBROK | TERRNO, "mount %s", mnt_path);
+		if (mount("cgroup2", mnt_path, "cgroup2", 0, NULL) == -1)
+			return -1;
 	}
 
-out:
 	SAFE_MKDIR(new_path, 0777);
 
-	tst_res(TINFO, "Cgroup v2 mount at %s success", mnt_path);
+	return 0;
 }
 
 static void tst_cgroupN_umount(const char *mnt_path, const char *new_path)
@@ -274,39 +225,48 @@ void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cgroup_dir)
 	char *cgroup_new_dir;
 	char knob_path[PATH_MAX];
 
-	tst_cg_ver = tst_cgroup_version();
-
 	tst_cgroup_set_path(cgroup_dir);
 	cgroup_new_dir = tst_cgroup_get_path(cgroup_dir);
 
-	if (tst_cg_ver & TST_CGROUP_V1) {
-		switch(ctrl) {
-		case TST_CGROUP_MEMCG:
-			tst_cgroup1_mount("memcg", "memory", cgroup_dir, cgroup_new_dir);
-		break;
-		case TST_CGROUP_CPUSET:
-			tst_cgroup1_mount("cpusetcg", "cpuset", cgroup_dir, cgroup_new_dir);
-		break;
-		default:
-			tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
-		}
+	if (ctrl == TST_CGROUP_CPUSET) {
+		tst_res(TINFO, "CGroup V2 lacks cpuset subsystem, trying V1");
+		goto cgroup_v1;
 	}
 
-	if (tst_cg_ver & TST_CGROUP_V2) {
-		tst_cgroup2_mount(cgroup_dir, cgroup_new_dir);
+	if (cgroup2_mount(cgroup_dir, cgroup_new_dir)) {
+		tst_res(TINFO | TERRNO, "Mounting CGroup V2 failed, trying V1");
+		goto cgroup_v1;
+	}
+
+	tst_res(TINFO, "Mounted CGroup V2");
+
+	switch(ctrl) {
+	case TST_CGROUP_MEMCG:
+		sprintf(knob_path, "%s/cgroup.subtree_control", cgroup_dir);
+		if (FILE_PRINTF(knob_path, "%s", "+memory")) {
+			tst_res(TINFO,
+				"Can't add V2 memory controller, this might be because it is mounted as V1");
+			break;
+		}
+		tst_cg_ver = TST_CGROUP_V2;
+		return;
+	default:
+		tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
+	}
 
-		switch(ctrl) {
-		case TST_CGROUP_MEMCG:
-			sprintf(knob_path, "%s/cgroup.subtree_control", cgroup_dir);
-			SAFE_FILE_PRINTF(knob_path, "%s", "+memory");
+cgroup_v1:
+	switch(ctrl) {
+	case TST_CGROUP_MEMCG:
+		tst_cgroup1_mount("memcg", "memory", cgroup_dir, cgroup_new_dir);
 		break;
-		case TST_CGROUP_CPUSET:
-			tst_brk(TCONF, "Cgroup v2 hasn't achieve cpuset subsystem");
+	case TST_CGROUP_CPUSET:
+		tst_cgroup1_mount("cpusetcg", "cpuset", cgroup_dir, cgroup_new_dir);
 		break;
-		default:
-			tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
-		}
+	default:
+		tst_brk(TBROK, "Invalid cgroup controller: %d", ctrl);
 	}
+
+	tst_cg_ver = TST_CGROUP_V1;
 }
 
 void tst_cgroup_umount(const char *cgroup_dir)
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
