Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 565143805F1
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:12:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DBA63C3326
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:12:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E5ED3C1937
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:12:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7275260080D
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620983561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XakTTX95U04k+MPdbwi6+eJ08f6AsXst5L7EWkZ4zDo=;
 b=Uc1J4yYbsTKnrfP7dpuIMQlAvF+cQibquQ/S3CvC6ydM5Pcfv6ZoZ6Gt43KWYr3JH1TyqS
 +eSwhzeF8MXY0dVvptfu76JA38rcLczzgEijEdMUkwjb5ZSKlXarU+ypZ4rAyCSo1p9/E0
 CGZu7qRgLGxA6Dv4zDCqs+A3rp4jRn8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA113B15A;
 Fri, 14 May 2021 09:12:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 14 May 2021 10:12:27 +0100
Message-Id: <20210514091227.8936-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] API/cgroups: Fix whitespace
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

It appears LSP mode with clangd was sneekily inserting spaces.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_cgroup.h | 4 ++--
 lib/tst_cgroup.c     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 0df989bfd..de72645bc 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -25,8 +25,8 @@
  * case we end up with a set of hierarchies like the follwoing. Where
  * existing system-manager-created CGroups have been omitted.
  *
- * 	(V2 Root)	(V1 Root 1)	...	(V1 Root N)
- * 	    |		     |			     |
+ *	(V2 Root)	(V1 Root 1)	...	(V1 Root N)
+ *	    |		     |			     |
  *	  (ltp)		   (ltp)	...	   (ltp)
  *	 /     \	  /	\		  /	\
  *  (drain) (test-n) (drain)  (test-n)  ...  (drain)  (test-n)
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 279617297..ce6e256d3 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -123,7 +123,7 @@ struct cgroup_ctrl {
 	const enum cgroup_ctrl_indx ctrl_indx;
 
 	/* Runtime; hierarchy the controller is attached to */
-        struct cgroup_root *ctrl_root;
+	struct cgroup_root *ctrl_root;
 	/* Runtime; whether we required the controller */
 	int we_require_it:1;
 };
@@ -468,7 +468,7 @@ void tst_cgroup_scan(void)
 	}
 
 	do {
-                if (strncmp(mnt->mnt_type, "cgroup", 6))
+		if (strncmp(mnt->mnt_type, "cgroup", 6))
 			continue;
 
 		cgroup_root_scan(mnt->mnt_type, mnt->mnt_dir, mnt->mnt_opts);
@@ -556,7 +556,7 @@ mount:
 	if (!ctrl->ctrl_root)
 		return;
 
-        ctrl->ctrl_root->we_mounted_it = 1;
+	ctrl->ctrl_root->we_mounted_it = 1;
 	ctrl->ctrl_root->mnt_dir.we_created_it = made_dir;
 
 	if (ctrl->ctrl_indx == CTRL_MEMORY) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
