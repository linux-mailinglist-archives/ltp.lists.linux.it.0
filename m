Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 337CAD410F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC2603C227B
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:25:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 74EC83C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 49BB26013E4
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:23:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7464AE5E;
 Fri, 11 Oct 2019 13:24:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 15:24:26 +0200
Message-Id: <20191011132433.24197-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011132433.24197-1-pvorel@suse.cz>
References: <20191011132433.24197-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/8] tst_net.sh: enhance tst_add_ipaddr(),
 add tst_del_ipaddr()
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

to be reusable in tests (not just for internal tst_net.sh usage)

Added -a, -d, -q, -s options:
-a IP: IP address to be added, default value is
$(tst_ipaddr)/$IPV{4,6}_{L,R}PREFIX
-d: delete address instead of adding
-q: quiet mode (don't print info)
-s: safe option, if something goes wrong, will exit with TBROK

-a and -d are intended for easier handling with IP addresses
(not have to calculate dad for IPv6 when adding IP address).

-q is for limit noise in test output, when test uses many loops.

tst_del_ipaddr() which is just tst_add_ipaddr() wrapper was added
mainly for better code readability.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 50 +++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 6c3ae708d..2f6f0b275 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2016-2018 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2016-2019 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 
 [ -n "$TST_LIB_NET_LOADED" ] && return 0
@@ -447,14 +447,35 @@ tst_init_iface()
 	tst_rhost_run -c "ip link set $iface up"
 }
 
-# tst_add_ipaddr [TYPE] [LINK]
-# TYPE: { lhost | rhost }; Default value is 'lhost'.
-# LINK: link number starting from 0. Default value is '0'.
+# tst_add_ipaddr [TYPE] [LINK] [-a IP] [-d] [-q] [-s]
+# Options:
+# TYPE: { lhost | rhost }, default value is 'lhost'
+# LINK: link number starting from 0, default value is '0'
+# -a IP: IP address to be added, default value is
+# $(tst_ipaddr)/$IPV{4,6}_{L,R}PREFIX
+# -d: delete address instead of adding
+# -q: quiet mode (don't print info)
+# -s: safe option, if something goes wrong, will exit with TBROK
 tst_add_ipaddr()
 {
+	local action="add"
+	local addr dad lsafe mask quiet rsafe
+
+	local OPTIND
+	while getopts a:dqs opt; do
+		case "$opt" in
+		a) addr="$OPTARG" ;;
+		d) action="del" ;;
+		q) quiet=1 ;;
+		s) lsafe="ROD"; rsafe="-s" ;;
+		*) tst_brk TBROK "tst_add_ipaddr: unknown option: $OPTARG" ;;
+		esac
+	done
+	shift $((OPTIND - 1))
+
 	local type="${1:-lhost}"
 	local link_num="${2:-0}"
-	local mask dad
+	local iface=$(tst_iface $type $link_num)
 
 	if [ "$TST_IPV6" ]; then
 		dad="nodad"
@@ -462,17 +483,24 @@ tst_add_ipaddr()
 	else
 		[ "$type" = "lhost" ] && mask=$IPV4_LPREFIX || mask=$IPV4_RPREFIX
 	fi
-
-	local iface=$(tst_iface $type $link_num)
+	[ -n "$addr" ] || addr="$(tst_ipaddr $type)"
+	echo $addr | grep -q / || addr="$addr/$mask"
 
 	if [ $type = "lhost" ]; then
-		tst_res_ TINFO "set local addr $(tst_ipaddr)/$mask"
-		ip addr add $(tst_ipaddr)/$mask dev $iface $dad
+		[ "$quiet" ] || tst_res_ TINFO "$action local addr $addr"
+		$lsafe ip addr $action $addr dev $iface $dad
 		return $?
 	fi
 
-	tst_res_ TINFO "set remote addr $(tst_ipaddr rhost)/$mask"
-	tst_rhost_run -c "ip addr add $(tst_ipaddr rhost)/$mask dev $iface $dad"
+	[ "$quiet" ] || tst_res_ TINFO "set remote addr $addr"
+	tst_rhost_run $rsafe -c "ip addr $action $addr dev $iface $dad"
+}
+
+# tst_del_ipaddr [ tst_add_ipaddr options ]
+# Delete IP address
+tst_del_ipaddr()
+{
+	tst_add_ipaddr -d $@
 }
 
 # tst_restore_ipaddr [TYPE] [LINK]
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
