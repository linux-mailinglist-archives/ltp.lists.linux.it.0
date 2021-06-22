Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C443B02DB
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:35:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CDB63C8E6A
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:35:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 560C83C229B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0651600713
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AD41A21985;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FI7AhrE6avmbgIQhQ9OHINDKUGwWApFvXL5SPuP+fG8=;
 b=RhoXQV+gqDlPpEJ8UwRv/yI0R8npoSCpVxtMg4XI2sPjfQqTWfneqF7veIQ6KO0KootAFX
 VQRunkGw5SRwyAy9TtZCA35+EoPoJhfaYaOUlQUNHvqG5qIiSxR3FRrheOcqMntIpd0nD1
 Vfz6GmYCSfvCG+Rj/vs9c9lYGjRSUbo=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 76B8DA3B84;
 Tue, 22 Jun 2021 11:35:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:09 +0100
Message-Id: <20210622113514.22284-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] hotplug: Fix uninitialized var
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

This assumes glctx is the correct thing to use as in every other
function.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/hotplug/memory_hotplug/commands.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index 6655d3553..78f46fbca 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -438,16 +438,11 @@ static int get_arg_nodeid_list(char *args, unsigned int *list)
  */
 static int get_current_nodeid_list(unsigned int *fromids)
 {
-	/*
-	 * FIXME (garrcoop): gcp is uninitialized and shortly hereafter used in
-	 * an initialization statement..... UHHHHHHH... test writer fail?
-	 */
-	glctx_t *gcp;
+	glctx_t *gcp = &glctx;
 	nodemask_t my_allowed_nodes;
 	int nr_nodes = 0, max_node = gcp->numa_max_node;
 	int node;
 
-	gcp = &glctx;
 	my_allowed_nodes = numa_get_membind_compat();
 	for (node = 0; node <= max_node; ++node) {
 		if (nodemask_isset(&my_allowed_nodes, node))
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
