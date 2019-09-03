Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3224A6B04
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 562543C2108
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7B21E3C20BA
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 927E31000D07
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35D3DAF79;
 Tue,  3 Sep 2019 14:16:19 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Sep 2019 16:16:04 +0200
Message-Id: <20190903141610.28887-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190903141610.28887-1-pvorel@suse.cz>
References: <20190903141610.28887-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/7] tst_net.sh: enhance tst_add_ipaddr(),
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

These changes are intended for easier handling with IP addresses
(not have to calculate dad for IPv6 when adding IP address).
Add -a IP and -s options to tst_add_ipaddr()

tst_del_ipaddr() (which uses internally tst_add_ipaddr()) is defined
mainly for better code readability.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 48 +++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 6c3ae708d..83871fe2c 100644
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
@@ -447,14 +447,33 @@ tst_init_iface()
 	tst_rhost_run -c "ip link set $iface up"
 }
 
-# tst_add_ipaddr [TYPE] [LINK]
-# TYPE: { lhost | rhost }; Default value is 'lhost'.
-# LINK: link number starting from 0. Default value is '0'.
+# tst_add_ipaddr [TYPE] [LINK] [-a IP] [-d] [-s]
+# Options:
+# TYPE: { lhost | rhost }, default value is 'lhost'
+# LINK: link number starting from 0, default value is '0'
+# -a IP: IP address to be added, default value is
+# $(tst_ipaddr)/$IPV{4,6}_{L,R}PREFIX
+# -d: delete address instead of adding
+# -s: safe option, if something goes wrong, will exit with TBROK
 tst_add_ipaddr()
 {
+	local action="add"
+	local addr dad lsafe mask rsafe
+
+	local OPTIND
+	while getopts a:ds opt; do
+		case "$opt" in
+		a) addr="$OPTARG" ;;
+		d) action="del" ;;
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
@@ -462,17 +481,24 @@ tst_add_ipaddr()
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
+		tst_res_ TINFO "set local addr $addr"
+		$lsafe ip addr $action $addr dev $iface $dad
 		return $?
 	fi
 
-	tst_res_ TINFO "set remote addr $(tst_ipaddr rhost)/$mask"
-	tst_rhost_run -c "ip addr add $(tst_ipaddr rhost)/$mask dev $iface $dad"
+	tst_res_ TINFO "set remote addr $addr"
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
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
