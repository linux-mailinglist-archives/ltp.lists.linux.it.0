Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD43C7F24
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A9323C6630
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75CCA3C74E6
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C9BC61000DD2
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:13 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7DE38229A3;
 Wed, 14 Jul 2021 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626246733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzzHSP2t5UqIOib+PLSsxKIdhrp/BhmJGn8aXnNjFjI=;
 b=iwdbgXSrl9aA/VFQ6OpvNVCdj2at68uu4tvqL6AfEIJG9/AlIUhgRG0xwq4xaxyZWBU+Uu
 esv2tJG/8aQrZnbcjontjvmaieD/A8ccH/rWWLUsGMKcwHEhVj9izHViMq2CCW37BN/8Bh
 5KsrAezTGVGShRFcZxuZ1S1l06bo6yk=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 283B5A3B8F;
 Wed, 14 Jul 2021 07:12:13 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 08:11:56 +0100
Message-Id: <20210714071158.15868-7-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714071158.15868-1-rpalethorpe@suse.com>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/8] Reference LTP-002 rule in Cocci scripts
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

Avoid duplication of rule description

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 scripts/coccinelle/libltp-test-macro-vars.cocci | 6 +-----
 scripts/coccinelle/libltp-test-macro.cocci      | 4 +---
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/coccinelle/libltp-test-macro-vars.cocci b/scripts/coccinelle/libltp-test-macro-vars.cocci
index ed5459a48..e0fe4e2a7 100644
--- a/scripts/coccinelle/libltp-test-macro-vars.cocci
+++ b/scripts/coccinelle/libltp-test-macro-vars.cocci
@@ -1,11 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
 
-// The TEST macro should not be used in the library because it sets
-// TST_RET and TST_ERR which are global variables. The test author
-// only expects these to be changed if *they* call TEST directly.
-
-// Find all positions where TEST's variables are used
+// Find violations of LTP-002
 @ find_use exists @
 expression E;
 @@
diff --git a/scripts/coccinelle/libltp-test-macro.cocci b/scripts/coccinelle/libltp-test-macro.cocci
index 7563d23aa..86c55c6c4 100644
--- a/scripts/coccinelle/libltp-test-macro.cocci
+++ b/scripts/coccinelle/libltp-test-macro.cocci
@@ -1,9 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
 
-// The TEST macro should not be used in the library because it sets
-// TST_RET and TST_ERR which are global variables. The test author
-// only expects these to be changed if *they* call TEST directly.
+// Find and fix violations of rule LTP-002
 
 // Set with -D fix
 virtual fix
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
