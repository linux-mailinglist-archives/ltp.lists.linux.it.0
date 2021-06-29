Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC263B6EBF
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1DB93C6C89
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E1F03C6C91
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C97F210009CC
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 85C3E2260E;
 Tue, 29 Jun 2021 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624951671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzzHSP2t5UqIOib+PLSsxKIdhrp/BhmJGn8aXnNjFjI=;
 b=NYe79glRvx7XtUjjR8CS8xxCeY4sSVV468esN5Xdwols1+/CO0pEWKbunMiVoBFNDCyC6z
 iGzArZFuiy25SChqowtpJu8AdTSMghSwt178OOX/7urzTq+k8/aPFYDMKRaUzcW5TxbELA
 rJVZreqsjoi6kkRd3iVYU4OzmYAoc4s=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 5685EA3B8A;
 Tue, 29 Jun 2021 07:27:51 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:27:10 +0100
Message-Id: <20210629072710.23800-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629072710.23800-1-rpalethorpe@suse.com>
References: <20210629072710.23800-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] Reference LTP-002 rule in Cocci scripts
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
