Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 801363971EC
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:55:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4705C3C8016
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:55:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66E653C59F3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 087C71A0081C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 76167218AB;
 Tue,  1 Jun 2021 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622544946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBqdIf6/rWTlzlofsOzqAtSgW+m2+A/eyi30HEUylR4=;
 b=lHKXJTdrCGciNNoC8LB+n3CJC9tje20hTcrXhvdbB0TXjwbfYe7RrUoOnR9xDVjQKmAO5E
 Z7fxo7HgCSAaJvfwKOuGNrTXFXWOs4kUg1jXjiX00JK7rN160kvLn73EWNSAGLActozo6r
 FWJosTDFWL1m2kWzwX2ZAewoGqxQ1ek=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 3B114A3B84;
 Tue,  1 Jun 2021 10:55:46 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:55:16 +0100
Message-Id: <20210601105521.27459-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601105521.27459-1-rpalethorpe@suse.com>
References: <20210601105521.27459-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/6] API/cgroups: Allow fetching of CGroup name
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
index d4c93db79..de72645bc 100644
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
index 1e036d3c3..793a712e1 100644
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
