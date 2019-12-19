Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54187125BFD
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:26:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01FCE3C2384
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:26:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 827DC3C149E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:26:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 32D411001560
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:26:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AA0BAC12;
 Thu, 19 Dec 2019 07:26:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Dec 2019 08:26:38 +0100
Message-Id: <20191219072638.31824-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] iptables: Reduce code duplicity
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey,

feel free to not ack this as not needed syntax optimalization.
This way the most of variables is set in the library,
so people would hopefuly search for them there.

0 is the default in [ "$foo" = 1 ], but maybe use_iptables=0 in
nft01.sh is better for readability.

Kind regards,
Petr

 testcases/network/iptables/iptables01.sh   |  5 -----
 testcases/network/iptables/iptables_lib.sh | 10 ++++++++++
 testcases/network/iptables/nft01.sh        |  6 ------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/testcases/network/iptables/iptables01.sh b/testcases/network/iptables/iptables01.sh
index e6ed4afab..b788b919a 100755
--- a/testcases/network/iptables/iptables01.sh
+++ b/testcases/network/iptables/iptables01.sh
@@ -2,13 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
 
-TST_SETUP="init"
-TST_CLEANUP="cleanup"
-TST_NEEDS_CMDS="iptables grep ping telnet"
-TST_NEEDS_DRIVERS="ip_tables"
 use_iptables=1
 
 . iptables_lib.sh
-. tst_test.sh
 
 tst_run
diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
index b098479e4..b029950f9 100755
--- a/testcases/network/iptables/iptables_lib.sh
+++ b/testcases/network/iptables/iptables_lib.sh
@@ -10,13 +10,23 @@ TST_CNT=6
 TST_TESTFUNC="test"
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
+TST_SETUP="${TST_SETUP:-init}"
+TST_CLEANUP="${TST_CLEANUP:-cleanup}"
 
 if [ "$use_iptables" = 1 ]; then
 	toolname=iptables
+	cmds="$toolname"
+	TST_NEEDS_DRIVERS="ip_tables"
 else
 	toolname=nft
+	cmds="$toolname iptables-translate"
+	TST_NEEDS_DRIVERS="nf_tables"
 fi
 
+TST_NEEDS_CMDS="$cmds grep ping telnet"
+
+. tst_test.sh
+
 NFRUN()
 {
 	local rule
diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
index 9bd10a7f5..7d3fc4e0d 100755
--- a/testcases/network/iptables/nft01.sh
+++ b/testcases/network/iptables/nft01.sh
@@ -4,14 +4,8 @@
 
 TST_SETUP="do_setup"
 TST_CLEANUP="do_cleanup"
-TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
-TST_NEEDS_DRIVERS="nf_tables"
-use_iptables=0
-cleanup_table=0
-cleanup_chain=0
 
 . iptables_lib.sh
-. tst_test.sh
 
 do_setup()
 {
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
