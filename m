Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE1368153
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D0E83C6AD8
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 31D123C6AE2
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:05 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6387860227F
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:04 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MD529S097073
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=vJ3sxjJ4jvlvpQFcbBSBsOXUObvuO31oWQkCqgx7mmU=;
 b=ISs9X1hWFXqbnTsjOOHJkeixu9dUNQ0beH/qdcy3qJ3uEXQvLCVnXsZ+wPtCZ75kdM/3
 W3KbfhRC65B6gRVnRUjswbnD6ZyoNeCBPXtqtu9b9sw8Yn2WMiI91rlYS12mmLq9YSu/
 +d563aX9AuyHH+lNOKrkjRWjuzdGJLw0D6HSDUxqByrkdFfUIxndkGMeFbg5cInsVHrp
 0/wPQcfsVyZ17vKztkRGSmSeuYaRKsE9jmIUu3VSXJ3St39jWxDaXoPSTCHDB3vlviWa
 Z1RmlG+GWs9TGFBwemNPFVHaOi8xX5xLCa14ecbSXtmroGM2jtQiMMooVSfOfRgkRT+y 8Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37yvean04g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MDGHD0161685
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3809k3gewa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:01 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13MDH1Gw165159
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 3809k3gev3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 13:17:01 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13MDGwgm004284;
 Thu, 22 Apr 2021 13:16:58 GMT
Received: from gyrotron.nl.oracle.com (/10.175.36.197)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Apr 2021 06:16:58 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 22 Apr 2021 16:16:29 +0300
Message-Id: <20210422131630.28565-3-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422131630.28565-1-alexey.kodanev@oracle.com>
References: <20210422131630.28565-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-GUID: U5UZ64zcngFSqyw9evHo5SrnIa97fP-U
X-Proofpoint-ORIG-GUID: U5UZ64zcngFSqyw9evHo5SrnIa97fP-U
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=997 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220106
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] network/virt: new test for generic udp
 encapsulation (gue)
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

The test sets up sit(IPv4) or ip6tnl(IPv6) virtual device using
Generic UDP Encapsulation for each side.

Then, it transmits TCP/UDP/UDP-Lite as inner packets with random
size payload in both directions (using virt_netperf_rand_sizes()).

The test will pass if the performance of encapsulation is not
significantly worse than without it. This is controlled by
VIRT_PERF_THRESHOLD.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.features               |  3 ++
 testcases/network/virt/gue01.sh    | 45 ++++++++++++++++++++++++++++++
 testcases/network/virt/virt_lib.sh | 17 +++++++++--
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100755 testcases/network/virt/gue01.sh

diff --git a/runtest/net.features b/runtest/net.features
index 617a6b91e..091cf9c55 100644
--- a/runtest/net.features
+++ b/runtest/net.features
@@ -60,6 +60,9 @@ gre_ipv6_01 gre01.sh -6
 gre_ipv4_02 gre02.sh
 gre_ipv6_02 gre02.sh -6
 
+gue01 gue01.sh
+gue01_ipv6 gue01.sh -6
+
 dctcp_ipv4_01 dctcp01.sh
 dctcp_ipv6_01 dctcp01.sh -6
 
diff --git a/testcases/network/virt/gue01.sh b/testcases/network/virt/gue01.sh
new file mode 100755
index 000000000..13ac03211
--- /dev/null
+++ b/testcases/network/virt/gue01.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_TESTFUNC=virt_netperf_rand_sizes
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
+TST_NEEDS_TMPDIR=1
+
+virt_type="gue"
+. virt_lib.sh
+
+do_cleanup()
+{
+	if [ "$FOU_PORT" ]; then
+		tst_net_run -l $FOU_PORT -r $FOU_PORT_RMT \
+			"ip fou del gue ${TST_IPV6_FLAG} port"
+	fi
+
+	virt_cleanup_rmt
+	virt_cleanup
+}
+
+do_setup()
+{
+	local get_port_cmd="tst_get_unused_port ipv${TST_IPVER} dgram"
+	local encap_cmd="encap gue encap-sport auto encap-dport"
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
+		"ip fou add gue ${TST_IPV6_FLAG} port"
+
+	virt_setup "local $loc_ip remote $rmt_ip $encap_cmd $FOU_PORT_RMT" \
+		   "local $rmt_ip remote $loc_ip $encap_cmd $FOU_PORT"
+}
+
+tst_run
diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index abf331428..f5c8bab09 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2018-2019 Petr Vorel <pvorel@suse.cz>
-# Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
+# Copyright (c) 2014-2021 Oracle and/or its affiliates. All Rights Reserved.
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 #
 # VxLAN
@@ -118,7 +118,7 @@ virt_add()
 		[ -z "$opt" ] && \
 			opt="remote $(tst_ipaddr rhost) dev $(tst_iface)"
 	;;
-	sit)
+	sit|gue)
 		[ -z "$opt" ] && opt="remote $(tst_ipaddr rhost) local $(tst_ipaddr)"
 	;;
 	esac
@@ -130,6 +130,12 @@ virt_add()
 	gre|ip6gre)
 		ip -f inet$TST_IPV6 tu add $vname mode $virt_type $opt
 	;;
+	gue)
+		local tnl=sit
+
+		[ -n "$TST_IPV6" ] && tnl="ip6tnl"
+		ip link add name $vname type $tnl $opt
+	;;
 	*)
 		ip li add link $(tst_iface) $vname type $virt_type $opt
 	;;
@@ -152,6 +158,13 @@ virt_add_rhost()
 		tst_rhost_run -s -c "ip -f inet$TST_IPV6 tu add ltp_v0 \
 				     mode $virt_type $@"
 	;;
+	gue)
+		local tnl=sit
+
+		[ -n "$TST_IPV6" ] && tnl="ip6tnl"
+
+		tst_rhost_run -s -c "ip link add name ltp_v0 type $tnl $@"
+	;;
 	*)
 		tst_rhost_run -s -c "ip li add link $(tst_iface rhost) ltp_v0 \
 				     type $virt_type $@"
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
