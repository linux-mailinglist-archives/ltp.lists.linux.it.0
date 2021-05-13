Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE337FA91
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7FC23C641A
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 708DE3C2306
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0C91D60035B
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620919315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZSZw38XbPXP43AO2Yup9Mf/caIQ4DCqRjvoZRSaOzc=;
 b=EWfZxUh4UrgUWu50z4yEncEAE7cOxK4o8qGKVuFfT9mwgxcxWjHIIMphtc6O6AHdpHYXg8
 wcz7ohn5An82Nm1ykSykF+NlR7A5dlENzPpmmQkWFkJYttDSeugN3koSiMltAnyVAvtnaq
 08AIYhEetUKUXB3UhjLNZ2F4gJX64YQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4F7DB1DE;
 Thu, 13 May 2021 15:21:55 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 16:21:22 +0100
Message-Id: <20210513152125.25766-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513152125.25766-1-rpalethorpe@suse.com>
References: <20210513152125.25766-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/6] API/cgroups: Check for unknown controller name
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
 lib/tst_cgroup.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 316dddde5..54636fd7e 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -306,7 +306,7 @@ void tst_cgroup_print_config(void)
 }
 
 __attribute__ ((nonnull, warn_unused_result))
-static struct cgroup_ctrl *cgroup_find_ctrl(const char *const ctrl_name)
+static struct cgroup_ctrl *cgroup_try_find_ctrl(const char *const ctrl_name)
 {
 	struct cgroup_ctrl *ctrl = controllers;
 
@@ -319,6 +319,22 @@ static struct cgroup_ctrl *cgroup_find_ctrl(const char *const ctrl_name)
 	return ctrl;
 }
 
+__attribute__ ((nonnull, returns_nonnull, warn_unused_result))
+static struct cgroup_ctrl *cgroup_find_ctrl(const char *const file,
+					    const int lineno,
+					    const char *const ctrl_name)
+{
+	struct cgroup_ctrl *const ctrl = cgroup_try_find_ctrl(ctrl_name);
+
+	if (!ctrl) {
+		tst_brk_(file, lineno, TBROK,
+			 "Did not find controller '%s'\n", ctrl_name);
+	}
+
+	return ctrl;
+}
+
+
 /* Determine if a mounted cgroup hierarchy is unique and record it if so.
  *
  * For CGroups V2 this is very simple as there is only one
@@ -355,7 +371,7 @@ static void cgroup_root_scan(const char *const mnt_type,
 	SAFE_FILE_READAT(mnt_dfd, "cgroup.controllers", buf, sizeof(buf));
 
 	for (tok = strtok(buf, " "); tok; tok = strtok(NULL, " ")) {
-		if ((const_ctrl = cgroup_find_ctrl(tok)))
+		if ((const_ctrl = cgroup_try_find_ctrl(tok)))
 			add_ctrl(&ctrl_field, const_ctrl);
 	}
 
@@ -371,7 +387,7 @@ static void cgroup_root_scan(const char *const mnt_type,
 
 v1:
 	for (tok = strtok(mnt_opts, ","); tok; tok = strtok(NULL, ",")) {
-		if ((const_ctrl = cgroup_find_ctrl(tok)))
+		if ((const_ctrl = cgroup_try_find_ctrl(tok)))
 			add_ctrl(&ctrl_field, const_ctrl);
 
 		no_prefix |= !strcmp("noprefix", tok);
@@ -580,7 +596,8 @@ void tst_cgroup_require(const char *const ctrl_name,
 			const struct tst_cgroup_opts *options)
 {
 	const char *const cgsc = "cgroup.subtree_control";
-	struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(ctrl_name);
+	struct cgroup_ctrl *const ctrl =
+		cgroup_find_ctrl(__FILE__, __LINE__, ctrl_name);
 	struct cgroup_root *root;
 
 	if (!options)
@@ -892,13 +909,7 @@ static const struct cgroup_file *cgroup_file_find(const char *const file,
 	memcpy(ctrl_name, file_name, len);
 	ctrl_name[len] = '\0';
 
-        ctrl = cgroup_find_ctrl(ctrl_name);
-
-	if (!ctrl) {
-		tst_brk_(file, lineno, TBROK,
-			 "Did not find controller '%s'\n", ctrl_name);
-		return NULL;
-	}
+	ctrl = cgroup_find_ctrl(file, lineno, ctrl_name);
 
 	for (cfile = ctrl->files; cfile->file_name; cfile++) {
 		if (!strcmp(file_name, cfile->file_name))
@@ -919,7 +930,8 @@ enum tst_cgroup_ver tst_cgroup_ver(const char *const file, const int lineno,
 				    const struct tst_cgroup_group *const cg,
 				    const char *const ctrl_name)
 {
-	const struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(ctrl_name);
+	const struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(file, lineno,
+								ctrl_name);
 	const struct cgroup_dir *dir;
 
 	if (!strcmp(ctrl_name, "cgroup")) {
@@ -929,12 +941,6 @@ enum tst_cgroup_ver tst_cgroup_ver(const char *const file, const int lineno,
 		return 0;
 	}
 
-	if (!ctrl) {
-		tst_brk_(file, lineno,
-			 TBROK, "Unknown controller '%s'", ctrl_name);
-		return 0;
-	}
-
 	dir = cg->dirs_by_ctrl[ctrl->ctrl_indx];
 
 	if (!dir) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
