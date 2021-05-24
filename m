Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D122B38E985
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68FE33C59A5
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 16:48:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 344AC3C1886
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B542C600A31
 for <ltp@lists.linux.it>; Mon, 24 May 2021 16:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621867696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1pmBd0k7oLxND8ITP8ca/Y+BwS0jlGkXl0HiBpdvSg=;
 b=eXQ5qVXeoUi581hAc94L8SU/0+/z3cEtfgm6ozT3+a2UVORUs0LYIX+S7pwCVQhlmnkgah
 1ErYtQaE+swW4NsjxpUXgTbs7lmUGyd0xhrAkUfnHR045izu/4Oso59G3eOg2iWwWmKC6i
 4BiaRfabG2D0S43KfyZkAvZVL+LOe3E=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51B5CADCE;
 Mon, 24 May 2021 14:48:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 24 May 2021 15:47:43 +0100
Message-Id: <20210524144745.10887-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524144745.10887-1-rpalethorpe@suse.com>
References: <20210524144745.10887-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/4] Add script to run Coccinelle checks
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

---
 scripts/coccinelle/libltp_checks.sh | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100755 scripts/coccinelle/libltp_checks.sh

diff --git a/scripts/coccinelle/libltp_checks.sh b/scripts/coccinelle/libltp_checks.sh
new file mode 100755
index 000000000..6fdaa7ae8
--- /dev/null
+++ b/scripts/coccinelle/libltp_checks.sh
@@ -0,0 +1,29 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
+
+# Run the Coccinelle checks for the library. Running the fixes
+# requires passing -D fix instead of -D report.
+
+if [[ ! -d lib || ! -d scripts/coccinelle ]]; then
+    echo "$0: Can't find lib or scripts directories. Run me from top src dir"
+    exit 1
+fi
+
+echo Python args ${COCCI_PYTHON:=--python python3} >&2
+
+libltp_spatch() {
+    spatch $COCCI_PYTHON --dir lib \
+	   --ignore lib/parse_opts.c \
+	   --ignore lib/newlib_tests \
+	   --ignore lib/tests \
+	   --very-quiet \
+	   --use-gitgrep \
+	   -D report \
+	   --include-headers \
+	   $*
+}
+
+libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro.cocci
+libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
+	      --ignore lib/tst_test.c
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
