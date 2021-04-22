Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2221368152
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05C4B3C6AE2
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B05913C6AD4
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:03 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B37C160157D
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:02 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MDE2LG172458
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=3vrrmw3EOwyjN5wM7FiJ+jQfsSZ8dSN+6J014sUQqu8=;
 b=W7N6grq6QasPXq4FEpDw4pr0pldNzqDB8MgdAP3CSfv9VoXniy5Gx2JgePmh9B04hD81
 y9HFSaZ8zfXwNEkrUuZWoSjepuaCrSbs5VcOeIduUQWzc8sMaWBYBbmfJ0l3jSAFIngw
 1RO0xcIYWXAQ5ZPwy/wbdR3BjtQQtESZuUcU1d4ld3CsMKFUQrOj4jaUY7kW/rTrVLsa
 nOLUcrvZSxdnJTJtd2OjYUN/M6z1naJdM6NTonBxb9iUpgELJE98OvhfvOrrP86HIDkB
 zP6m71794z/XC1o5uijA6d6wqd/1msAHNAy/txGvAAf4BeEv485f5ZzWGT6HoD7fDQwi ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 37yn6cdd7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MDGGWJ161520
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3809k3geut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13MDH0Ub164924
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 3809k3geua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 13:17:00 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13MDGxmm008811;
 Thu, 22 Apr 2021 13:16:59 GMT
Received: from gyrotron.nl.oracle.com (/10.175.36.197)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Apr 2021 06:16:59 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 22 Apr 2021 16:16:30 +0300
Message-Id: <20210422131630.28565-4-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422131630.28565-1-alexey.kodanev@oracle.com>
References: <20210422131630.28565-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xENXrmXpQ4ISnZfwv5rCRsNC2QTU4w4u
X-Proofpoint-ORIG-GUID: xENXrmXpQ4ISnZfwv5rCRsNC2QTU4w4u
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220109
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] network/virt: new foo over udp (fou) tunneling
 test
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

The test sets up GRE(IPv4 and IPv6) virtual device using Foo
over UDP for each side.

Then, it transmits TCP/UDP/UDP-Lite as inner packets with random
size payload in both directions (using virt_netperf_rand_sizes()).

The test will pass if the performance of encapsulation is not
significantly worse than without it. This is controlled by
VIRT_PERF_THRESHOLD.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.features               |  3 ++
 testcases/network/virt/fou01.sh    | 48 ++++++++++++++++++++++++++++++
 testcases/network/virt/virt_lib.sh | 31 +++++++++++--------
 3 files changed, 70 insertions(+), 12 deletions(-)
 create mode 100755 testcases/network/virt/fou01.sh

diff --git a/runtest/net.features b/runtest/net.features
index 091cf9c55..4e1504df5 100644
--- a/runtest/net.features
+++ b/runtest/net.features
@@ -63,6 +63,9 @@ gre_ipv6_02 gre02.sh -6
 gue01 gue01.sh
 gue01_ipv6 gue01.sh -6
 
+fou01 fou01.sh
+fou01_ipv6 fou01.sh -6
+
 dctcp_ipv4_01 dctcp01.sh
 dctcp_ipv6_01 dctcp01.sh -6
 
diff --git a/testcases/network/virt/fou01.sh b/testcases/network/virt/fou01.sh
new file mode 100755
index 000000000..77521e260
--- /dev/null
+++ b/testcases/network/virt/fou01.sh
@@ -0,0 +1,48 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_TESTFUNC=virt_netperf_rand_sizes
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
+TST_NEEDS_TMPDIR=1
+
+virt_type="fou"
+. virt_lib.sh
+
+# GRE IP protocol number
+PROTO=47
+
+do_cleanup()
+{
+	if [ "$FOU_PORT" ]; then
+		tst_net_run -l $FOU_PORT -r $FOU_PORT_RMT \
+			"ip fou del ipproto $PROTO ${TST_IPV6_FLAG} port"
+	fi
+
+	virt_cleanup_rmt
+	virt_cleanup
+}
+
+do_setup()
+{
+	local get_port_cmd="tst_get_unused_port ipv${TST_IPVER} dgram"
+	local encap_cmd="encap fou encap-sport auto encap-dport"
+	local loc_ip=$(tst_ipaddr)
+	local rmt_ip=$(tst_ipaddr rhost)
+	local fou="fou$TST_IPV6"
+
+	tst_require_drivers $fou
+	tst_net_run -s modprobe $fou
+
+	FOU_PORT=$($get_port_cmd)
+	FOU_PORT_RMT=$(tst_rhost_run -c "$get_port_cmd")
+
+	tst_net_run -s -l $FOU_PORT -r $FOU_PORT_RMT \
+		"ip fou add ipproto $PROTO ${TST_IPV6_FLAG} port"
+
+	virt_setup "local $loc_ip remote $rmt_ip $encap_cmd $FOU_PORT_RMT" \
+		   "local $rmt_ip remote $loc_ip $encap_cmd $FOU_PORT"
+}
+
+tst_run
diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index f5c8bab09..f511d3f92 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -99,6 +99,19 @@ virt_cleanup()
 	virt_cleanup_rmt
 }
 
+_get_gue_fou_tnl()
+{
+	local enc_type="$1"
+	local tnl=sit
+
+	if [ "$enc_type" = "gue" ]; then
+		[ -n "$TST_IPV6" ] && tnl="ip6tnl"
+	else
+		[ -n "$TST_IPV6" ] && tnl="ip6gre" || tnl="gre"
+	fi
+	echo "$tnl"
+}
+
 virt_add()
 {
 	local vname=$1
@@ -118,7 +131,7 @@ virt_add()
 		[ -z "$opt" ] && \
 			opt="remote $(tst_ipaddr rhost) dev $(tst_iface)"
 	;;
-	sit|gue)
+	sit|gue|fou)
 		[ -z "$opt" ] && opt="remote $(tst_ipaddr rhost) local $(tst_ipaddr)"
 	;;
 	esac
@@ -130,11 +143,8 @@ virt_add()
 	gre|ip6gre)
 		ip -f inet$TST_IPV6 tu add $vname mode $virt_type $opt
 	;;
-	gue)
-		local tnl=sit
-
-		[ -n "$TST_IPV6" ] && tnl="ip6tnl"
-		ip link add name $vname type $tnl $opt
+	gue|fou)
+		ip link add name $vname type $(_get_gue_fou_tnl $virt_type) $opt
 	;;
 	*)
 		ip li add link $(tst_iface) $vname type $virt_type $opt
@@ -158,12 +168,9 @@ virt_add_rhost()
 		tst_rhost_run -s -c "ip -f inet$TST_IPV6 tu add ltp_v0 \
 				     mode $virt_type $@"
 	;;
-	gue)
-		local tnl=sit
-
-		[ -n "$TST_IPV6" ] && tnl="ip6tnl"
-
-		tst_rhost_run -s -c "ip link add name ltp_v0 type $tnl $@"
+	gue|fou)
+		tst_rhost_run -s -c "ip link add name ltp_v0 \
+				     type $(_get_gue_fou_tnl $virt_type) $@"
 	;;
 	*)
 		tst_rhost_run -s -c "ip li add link $(tst_iface rhost) ltp_v0 \
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
