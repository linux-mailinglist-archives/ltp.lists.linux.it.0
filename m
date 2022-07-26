Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167105816DD
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jul 2022 17:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 251643CA154
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jul 2022 17:57:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 325C43C9AC8
 for <ltp@lists.linux.it>; Tue, 26 Jul 2022 17:56:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B0E4460066A
 for <ltp@lists.linux.it>; Tue, 26 Jul 2022 17:56:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B15F8380BB;
 Tue, 26 Jul 2022 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1658851011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8cRd2FnHk2VDWGNm8EsJ/G0dNptD/lWViMby0/X0m8=;
 b=pgWKtDDrQxIqHN+57g+uq+kLr+DprC1Pp/DgiKwxowKb0f1zUi0Wjb2o3Ylin67iAmhSFS
 LzTH6OJBNekrecc5Nrlxd7BF4u1GE4Hy8T+l4U4hlLQP9LFxMYpdslaXibDEQseDCowSoz
 tj0gQRjx/4tkyyu8mxG+rqhCADd3C48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1658851011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8cRd2FnHk2VDWGNm8EsJ/G0dNptD/lWViMby0/X0m8=;
 b=W2t/30KcPobziGeH3Dp6Gjg3yMyZZ4ipWzuEnGB9IoY7+IcTA6WZzuphVvmva9xJTYNF6N
 eTWpWahmKO/g6/Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DFF813A7C;
 Tue, 26 Jul 2022 15:56:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2PcgGcMO4GJQYwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 26 Jul 2022 15:56:51 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Jul 2022 17:56:46 +0200
Message-Id: <20220726155646.26468-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726155646.26468-1-pvorel@suse.cz>
References: <20220726155646.26468-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_cgroup: Add macro
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_cgroup.c | 69 +++++++++++++++---------------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 6f24e0450..1cfd79243 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -229,11 +229,11 @@ static const struct cgroup_file freezer_ctrl_files[] = {
 	{ }
 };
 
-static const struct cgroup_file netcls_ctrl_files[] = {
+static const struct cgroup_file net_cls_ctrl_files[] = {
 	{ }
 };
 
-static const struct cgroup_file netprio_ctrl_files[] = {
+static const struct cgroup_file net_prio_ctrl_files[] = {
 	{ }
 };
 
@@ -254,54 +254,27 @@ static const struct cgroup_file debug_ctrl_files[] = {
 };
 
 #define CTRL_NAME_MAX 31
+#define CGROUP_CTRL_MEMBER(x, y)[y] = { .ctrl_name = #x, .files = \
+	x ## _ctrl_files, .ctrl_indx = y, NULL, 0 }
+
 /* Lookup tree for item names. */
 static struct cgroup_ctrl controllers[] = {
-	[0] = { "cgroup", cgroup_ctrl_files, 0, NULL, 0 },
-	[CTRL_MEMORY] = {
-		"memory", memory_ctrl_files, CTRL_MEMORY, NULL, 0
-	},
-	[CTRL_CPU] = {
-		"cpu", cpu_ctrl_files, CTRL_CPU, NULL, 0
-	},
-	[CTRL_CPUSET] = {
-		"cpuset", cpuset_ctrl_files, CTRL_CPUSET, NULL, 0
-	},
-	[CTRL_IO] = {
-		"io", io_ctrl_files, CTRL_IO, NULL, 0
-	},
-	[CTRL_PIDS] = {
-		"pids", pids_ctrl_files, CTRL_PIDS, NULL, 0
-	},
-	[CTRL_HUGETLB] = {
-		"hugetlb", hugetlb_ctrl_files, CTRL_HUGETLB, NULL, 0
-	},
-	[CTRL_CPUACCT] = {
-		"cpuacct", cpuacct_ctrl_files, CTRL_CPUACCT, NULL, 0
-	},
-	[CTRL_DEVICES] = {
-		"devices", devices_ctrl_files, CTRL_DEVICES, NULL, 0
-	},
-	[CTRL_FREEZER] = {
-		"freezer", freezer_ctrl_files, CTRL_FREEZER, NULL, 0
-	},
-	[CTRL_NETCLS] = {
-		"net_cls", netcls_ctrl_files, CTRL_NETCLS, NULL, 0
-	},
-	[CTRL_NETPRIO] = {
-		"net_prio", netprio_ctrl_files, CTRL_NETPRIO, NULL, 0
-	},
-	[CTRL_BLKIO] = {
-		"blkio", blkio_ctrl_files, CTRL_BLKIO, NULL, 0
-	},
-	[CTRL_MISC] = {
-		"misc", misc_ctrl_files, CTRL_MISC, NULL, 0
-	},
-	[CTRL_PERFEVENT] = {
-		"perf_event", perf_event_ctrl_files, CTRL_PERFEVENT, NULL, 0
-	},
-	[CTRL_DEBUG] = {
-		"debug", debug_ctrl_files, CTRL_DEBUG, NULL, 0
-	},
+	CGROUP_CTRL_MEMBER(cgroup, 0),
+	CGROUP_CTRL_MEMBER(memory, CTRL_MEMORY),
+	CGROUP_CTRL_MEMBER(cpu, CTRL_CPU),
+	CGROUP_CTRL_MEMBER(cpuset, CTRL_CPUSET),
+	CGROUP_CTRL_MEMBER(io, CTRL_IO),
+	CGROUP_CTRL_MEMBER(pids, CTRL_PIDS),
+	CGROUP_CTRL_MEMBER(hugetlb, CTRL_HUGETLB),
+	CGROUP_CTRL_MEMBER(cpuacct, CTRL_CPUACCT),
+	CGROUP_CTRL_MEMBER(devices, CTRL_DEVICES),
+	CGROUP_CTRL_MEMBER(freezer, CTRL_FREEZER),
+	CGROUP_CTRL_MEMBER(net_cls, CTRL_NETCLS),
+	CGROUP_CTRL_MEMBER(net_prio, CTRL_NETPRIO),
+	CGROUP_CTRL_MEMBER(blkio, CTRL_BLKIO),
+	CGROUP_CTRL_MEMBER(misc, CTRL_MISC),
+	CGROUP_CTRL_MEMBER(perf_event, CTRL_PERFEVENT),
+	CGROUP_CTRL_MEMBER(debug, CTRL_DEBUG),
 	{ }
 };
 
-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
