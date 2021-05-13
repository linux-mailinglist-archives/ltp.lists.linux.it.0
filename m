Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA337FA95
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 896D53C733F
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:22:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FFF23C6416
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 47BC31401267
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620919316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVDzbdcz4Hm5mlLdpLDWg19J0rBfblap01n+1kH9H6E=;
 b=K1SdOGlr8FgM/ASrgz6Bx0AEub/Y8w9+KfrDv6MwdxnrhLQX4x0Xc7YivjOOakcaNn/YOg
 eq3eboi6NWL1+Hn8A7vWTC+/FO3qNMH51Af+sVO6JQKwzcS3ASLfaIoAqze5h+1xCTZovO
 nn24gTY/uglHuR/vCeDgbGQLGngEGWc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E438FB180;
 Thu, 13 May 2021 15:21:55 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 16:21:23 +0100
Message-Id: <20210513152125.25766-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513152125.25766-1-rpalethorpe@suse.com>
References: <20210513152125.25766-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/6] API/cgroups: Add cpu controller
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
 lib/tst_cgroup.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 54636fd7e..da177a1ad 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -82,7 +82,8 @@ struct cgroup_root {
 /* Controller sub-systems */
 enum cgroup_ctrl_indx {
 	CTRL_MEMORY = 1,
-	CTRL_CPUSET = 2,
+	CTRL_CPU,
+	CTRL_CPUSET,
 };
 #define CTRLS_MAX CTRL_CPUSET
 
@@ -162,6 +163,18 @@ static const files_t memory_ctrl_files = {
 	{ }
 };
 
+static const files_t cpu_ctrl_files = {
+	/* The V1 quota and period files were combined in the V2 max
+	 * file. The quota is in the first column and if we just print
+	 * a single value to the file, it will be treated as the
+	 * quota. To get or set the period we need to branch on the
+	 * API version.
+	 */
+	{ "cpu.max", "cpu.cfs_quota_us", CTRL_CPU },
+	{ "cpu.cfs_period_us", "cpu.cfs_period_us", CTRL_CPU },
+	{ }
+};
+
 static const files_t cpuset_ctrl_files = {
 	{ "cpuset.cpus", "cpuset.cpus", CTRL_CPUSET },
 	{ "cpuset.mems", "cpuset.mems", CTRL_CPUSET },
@@ -174,6 +187,9 @@ static struct cgroup_ctrl controllers[] = {
 	[CTRL_MEMORY] = {
 		"memory", memory_ctrl_files, CTRL_MEMORY, NULL, 0
 	},
+	[CTRL_CPU] = {
+		"cpu", cpu_ctrl_files, CTRL_CPU, NULL, 0
+	},
 	[CTRL_CPUSET] = {
 		"cpuset", cpuset_ctrl_files, CTRL_CPUSET, NULL, 0
 	},
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
