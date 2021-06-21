Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B71533AE83A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C5A23C7037
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:38:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D737A3C2324
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5CDF71000472
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:38:16 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BF5AF1FD2F;
 Mon, 21 Jun 2021 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624275495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2JOjkISOL+ecMFaSASsT3LyQ8waq1ezNL7hwsz95mVE=;
 b=enjdCuXRz9a9cWuMEbzzBa2fjY83hk9cZjpFs9EYqoKmJwGQUSeH18FWFrDF1oqmfdOnqy
 Fc2ZGVVecNDW785+T63wk+hiyF3/RvEGM4EsBkkfrVFsKvA+eW7PJBsZq/Im2b1HidFVJh
 g3ocLOXd3MDi5AfhZ9Iid9LkoZSXhGQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 91039A3BAB;
 Mon, 21 Jun 2021 11:38:15 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 21 Jun 2021 12:38:02 +0100
Message-Id: <20210621113804.26179-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] scripts/coccinelle: Add headers to lib checks and
 fix macro fix
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

We have to explicitly add the header directory.

Also allow the TEST macro fix to replace multiple variables.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 scripts/coccinelle/libltp-test-macro.cocci |  4 +++-
 scripts/coccinelle/run-spatch.sh           | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/coccinelle/libltp-test-macro.cocci b/scripts/coccinelle/libltp-test-macro.cocci
index 7563d23aa..937d6c94f 100644
--- a/scripts/coccinelle/libltp-test-macro.cocci
+++ b/scripts/coccinelle/libltp-test-macro.cocci
@@ -24,7 +24,7 @@ virtual fix
 
  TEST(...)
 
- ...
+ <...
 
 (
 - TST_RET
@@ -37,6 +37,8 @@ virtual fix
 + TERRNO
 )
 
+ ...>
+
 // Replace TEST in all functions where it occurs only at the start. It
 // is slightly complicated by adding a newline if a statement appears
 // on the line after TEST(). It is not clear to me what the rules are
diff --git a/scripts/coccinelle/run-spatch.sh b/scripts/coccinelle/run-spatch.sh
index e8e6f47d8..978998cd1 100755
--- a/scripts/coccinelle/run-spatch.sh
+++ b/scripts/coccinelle/run-spatch.sh
@@ -25,6 +25,12 @@ libltp_spatch() {
 	       -D fix \
 	       --include-headers \
 	       $*
+	spatch --dir include \
+	       --use-gitgrep \
+	       --in-place \
+	       -D fix \
+	       --include-headers \
+	       $*
     else
 	spatch --dir lib \
 	       --ignore lib/parse_opts.c \
@@ -33,6 +39,10 @@ libltp_spatch() {
 	       --use-gitgrep \
 	       --include-headers \
 	       $*
+	spatch --dir include \
+	       --use-gitgrep \
+	       --include-headers \
+	       $*
     fi
 }
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
