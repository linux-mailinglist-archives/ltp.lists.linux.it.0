Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E237FA99
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD38C3C6426
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 81A0E3C641A
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E91560035B
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620919316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmOr9HMm/9CeEs7Wh2C824sWjSVRs+3SB/MKEJPOYgM=;
 b=ebRIiXAitQp2RQuluJpEFoeLZ+FshN1JhX5FOxunN6tRQeJijLb2S+z1u431dDM6MxMj9P
 QjQKzqkytBH85COM59CkDfLKFeMl/J2LekgIoSoo1qta3uBYNSnosbg+Ii9abZHm3bNVPL
 lN/Z69uy2qJIPxeoAQEaZixlhnE24/U=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31C00B1E0;
 Thu, 13 May 2021 15:21:56 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 16:21:24 +0100
Message-Id: <20210513152125.25766-6-rpalethorpe@suse.com>
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
Subject: [LTP] [PATCH 5/6] API/cgroups: Auto add controllers to
 subtree_control in new subgroup
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

This is what we have always wanted so far. If we do not want to do it
on a new test then a new config option can be added during require.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_cgroup.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index da177a1ad..279617297 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -843,19 +843,28 @@ static void cgroup_group_init(struct tst_cgroup_group *const cg,
 	strcpy(cg->group_name, group_name);
 }
 
-__attribute__ ((nonnull))
-static void cgroup_group_add_dir(struct tst_cgroup_group *const cg,
+__attribute__((nonnull (2, 3)))
+static void cgroup_group_add_dir(const struct tst_cgroup_group *const parent,
+				 struct tst_cgroup_group *const cg,
 				 struct cgroup_dir *const dir)
 {
 	const struct cgroup_ctrl *ctrl;
 	int i;
 
-	if (dir->dir_root->ver == TST_CGROUP_V2)
+	if (dir->dir_root->ver != TST_CGROUP_V1)
 		cg->dirs_by_ctrl[0] = dir;
 
 	for_each_ctrl(ctrl) {
-		if (has_ctrl(dir->ctrl_field, ctrl))
-			cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
+		if (!has_ctrl(dir->ctrl_field, ctrl))
+			continue;
+
+		cg->dirs_by_ctrl[ctrl->ctrl_indx] = dir;
+
+		if (!parent || dir->dir_root->ver == TST_CGROUP_V1)
+			continue;
+
+		SAFE_CGROUP_PRINTF(parent, "cgroup.subtree_control",
+				   "+%s", ctrl->ctrl_name);
 	}
 
 	for (i = 0; cg->dirs[i]; i++);
@@ -876,7 +885,7 @@ tst_cgroup_group_mk(const struct tst_cgroup_group *const parent,
 	for_each_dir(parent, 0, dir) {
 		new_dir = SAFE_MALLOC(sizeof(*new_dir));
 		cgroup_dir_mk(*dir, group_name, new_dir);
-		cgroup_group_add_dir(cg, new_dir);
+		cgroup_group_add_dir(parent, cg, new_dir);
 	}
 
 	return cg;
@@ -1029,7 +1038,7 @@ static struct tst_cgroup_group *cgroup_group_from_roots(const size_t tree_off)
 		dir = (typeof(dir))(((char *)root) + tree_off);
 
 		if (dir->ctrl_field)
-			cgroup_group_add_dir(cg, dir);
+			cgroup_group_add_dir(NULL, cg, dir);
 	}
 
 	if (cg->dirs[0]) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
