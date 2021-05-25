Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB13902C3
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5ECF3C67E4
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E7D43C77B3
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5C2136006C9
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621950626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MGERQs5dpTgwhFVoQ0i5Ib2Uky/513fs21hOoqbkZ28=;
 b=cIlglckQAjDJhiXdXHZeyv9ySpIHO21+GBD3f1vnWhJPrEctH/8P2dZ/hHM7yzZgguwHf2
 adLfXHHLyJqBqeQfoeLe+6eALlWXRexXlaE3MB3sOhQq/P6g5bYpYDdwcDr5ek8jSzaw7f
 ixc3gy1lndkld5YmK8p2KdTVljn/jBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621950626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MGERQs5dpTgwhFVoQ0i5Ib2Uky/513fs21hOoqbkZ28=;
 b=4TvnZ6bZtf+oj43Y74qm50pnaMjNHUb23Uo8l1LALTHxfUs16s6dMjCFVNEfDZqHftuQSE
 BENh9BbkeVIbk5BA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FF53AE34;
 Tue, 25 May 2021 13:50:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 May 2021 15:50:10 +0200
Message-Id: <20210525135012.877-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_net.sh: Move check_portmap_rpcbind() + fixes
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

move from rpc_lib.sh, because it'll be used also in NFS tests.

Fixes:
* check for pgrep
* local and lowercase for variable

And remove rpc_lib.sh, as check_portmap_rpcbind() was the only function
in it.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh                       | 18 +++++++++++++++++-
 testcases/network/rpc/basic_tests/Makefile     |  1 -
 .../network/rpc/basic_tests/rpc01/rpc01.sh     |  2 +-
 testcases/network/rpc/basic_tests/rpc_lib.sh   | 15 ---------------
 .../rpc/basic_tests/rpcinfo/rpcinfo01.sh       |  2 +-
 testcases/network/rpc/rpc-tirpc/rpc_test.sh    |  2 +-
 6 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 testcases/network/rpc/basic_tests/rpc_lib.sh

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index fc5719057..d793541e2 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2016-2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2016-2021 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 
 [ -n "$TST_LIB_NET_LOADED" ] && return 0
@@ -933,6 +933,22 @@ tst_default_max_pkt()
 	echo "$((mtu + mtu / 10))"
 }
 
+check_portmap_rpcbind()
+{
+	local portmapper
+
+	tst_require_cmds pgrep
+
+	if pgrep portmap > /dev/null; then
+		portmapper="portmap"
+	else
+		pgrep rpcbind > /dev/null && portmapper="rpcbind" || \
+			tst_brk TCONF "portmap or rpcbind is not running"
+	fi
+
+	tst_res TINFO "using $portmapper"
+}
+
 # Management Link
 [ -z "$RHOST" ] && TST_USE_NETNS="yes"
 export RHOST="$RHOST"
diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
index 7862e41e5..66e9d5675 100644
--- a/testcases/network/rpc/basic_tests/Makefile
+++ b/testcases/network/rpc/basic_tests/Makefile
@@ -21,7 +21,6 @@
 #
 
 top_srcdir		?= ../../../..
-INSTALL_TARGETS	:= rpc_lib.sh
 
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/network/rpc/basic_tests/rpc01/rpc01.sh b/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
index 9ca5daae6..7a8ff75e6 100755
--- a/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
+++ b/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
@@ -7,7 +7,7 @@ TST_TESTFUNC=do_test
 TST_SETUP=do_setup
 TST_CLEANUP=do_cleanup
 TST_NEEDS_CMDS="pkill rpcinfo"
-. rpc_lib.sh
+. tst_net.sh
 
 NUMLOOPS=${NUMLOOPS:-3}
 DATAFILES="${DATAFILES:-file.1 file.2}"
diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
deleted file mode 100644
index c7c868709..000000000
--- a/testcases/network/rpc/basic_tests/rpc_lib.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
-
-. tst_net.sh
-
-check_portmap_rpcbind()
-{
-	if pgrep portmap > /dev/null; then
-		PORTMAPPER="portmap"
-	else
-		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
-			tst_brk TCONF "portmap or rpcbind is not running"
-	fi
-	tst_res TINFO "using $PORTMAPPER"
-}
diff --git a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
index 811f79ef7..0a371ceac 100755
--- a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
+++ b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
@@ -7,7 +7,7 @@ TST_TESTFUNC=do_test
 TST_SETUP=do_setup
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="rpcinfo wc"
-. rpc_lib.sh
+. tst_net.sh
 
 do_setup()
 {
diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
index ffb58769d..48ed97742 100755
--- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -17,7 +17,7 @@ TST_SETUP=setup
 TST_CLEANUP=cleanup
 TST_PARSE_ARGS=rpc_parse_args
 TST_NEEDS_CMDS="pkill rpcinfo"
-. rpc_lib.sh
+. tst_net.sh
 
 usage()
 {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
