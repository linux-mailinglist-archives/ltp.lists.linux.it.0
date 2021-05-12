Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174D37CB50
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 18:57:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05F9F3C6475
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 18:57:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEC843C6464
 for <ltp@lists.linux.it>; Wed, 12 May 2021 18:57:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DFC66600D62
 for <ltp@lists.linux.it>; Wed, 12 May 2021 18:57:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED45AB148
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:57:11 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 18:57:01 +0200
Message-Id: <20210512165702.22883-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] build.sh: Support passing configure options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

and document that in help

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 build.sh | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/build.sh b/build.sh
index 1ec6a51d8..985cc00e8 100755
--- a/build.sh
+++ b/build.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# Copyright (c) 2017-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
 # Script for travis builds.
 #
 # TODO: Implement comparison of installed files. List of installed files can
@@ -15,9 +15,9 @@ CC="${CC:-gcc}"
 DEFAULT_PREFIX="$HOME/ltp-install"
 DEFAULT_BUILD="native"
 DEFAULT_TREE="in"
-CONFIGURE_OPTS_IN_TREE="--with-open-posix-testsuite --with-realtime-testsuite"
+CONFIGURE_OPTS_IN_TREE="${CONFIGURE_OPT:---with-open-posix-testsuite --with-realtime-testsuite $CONFIGURE_OPT_EXTRA}"
 # TODO: open posix testsuite is currently broken in out-tree-build. Enable it once it's fixed.
-CONFIGURE_OPTS_OUT_TREE="--with-realtime-testsuite"
+CONFIGURE_OPTS_OUT_TREE="${CONFIGURE_OPT:---with-realtime-testsuite $CONFIGURE_OPT_EXTRA}"
 MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN)"
 
 build_32()
@@ -172,6 +172,14 @@ BUILD TYPES:
 32       32-bit build (PKG_CONFIG_LIBDIR auto-detection for x86_64)
 cross    cross-compile build (requires set compiler via -c switch)
 native   native build
+
+Default configure options:
+in-tree:    $CONFIGURE_OPTS_IN_TREE
+out-of-tree $CONFIGURE_OPTS_OUT_TREE
+
+configure options can be:
+- overwritten with \$CONFIGURE_OPT environment variable
+- extended the default with \$CONFIGURE_OPT_EXTRA environment variable
 EOF
 }
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
