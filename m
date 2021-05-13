Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597737FA8D
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A446C3C89F9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 104A93C2306
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8A4AD601DD0
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620919315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9D1755uPQ794cU0marU+wRRtbXoi7s23JkpEnJReMjk=;
 b=LSm6seLawTVSrGgMLzS2mt0I1/I6Vfq1slN+6qsX9ZOL+20/+rUNTHJSmAwIiOFYFuoRAI
 qtDQiZdpKjV/fgMguAl5LYyaeiZqZu12nCKqY8YAL4bOz3APHco63FD1YHVGS7lOm6n9Ch
 FJM36prJwzB8VVlzfnDXer2iXpNu1fQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19CB9B19F;
 Thu, 13 May 2021 15:21:55 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 16:21:20 +0100
Message-Id: <20210513152125.25766-2-rpalethorpe@suse.com>
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
Subject: [LTP] [PATCH 1/6] API/cgroups: Allow fetching of CGroup name
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

Lets the test author get the name of a CGroup.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_cgroup.h | 4 ++++
 lib/tst_cgroup.c     | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index bcf465a91..0df989bfd 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -133,6 +133,10 @@ struct tst_cgroup_group *
 tst_cgroup_group_mk(const struct tst_cgroup_group *const parent,
 		    const char *const group_name)
 		    __attribute__ ((nonnull, warn_unused_result));
+const char *
+tst_cgroup_group_name(const struct tst_cgroup_group *const cg)
+		      __attribute__ ((nonnull, warn_unused_result));
+
 /* Remove a descendant CGroup */
 struct tst_cgroup_group *
 tst_cgroup_group_rm(struct tst_cgroup_group *const cg)
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 9b1270331..d3f1a8ba4 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -855,6 +855,11 @@ tst_cgroup_group_mk(const struct tst_cgroup_group *const parent,
 	return cg;
 }
 
+const char *tst_cgroup_group_name(const struct tst_cgroup_group *const cg)
+{
+	return cg->group_name;
+}
+
 struct tst_cgroup_group *tst_cgroup_group_rm(struct tst_cgroup_group *const cg)
 {
 	struct cgroup_dir **dir;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
