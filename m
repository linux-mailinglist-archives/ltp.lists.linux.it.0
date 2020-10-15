Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB928F1FF
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:23:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B13DB3C325C
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:23:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 092343C23F5
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:23:20 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B15A21400759
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:23:19 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCEgSc178760
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=DHt1VDhrSWVJpfe5AIqNrY3718TXmMX/TygXfXxOoS4=;
 b=fhzqbxiGgeDTTwxb3c2ncHmQ9irY3Cv46dDNbDeA8Q3ADG8L+8j11Ar9SVnLzjG5DuHW
 Q1/HRVmMysR2Q2NC3fw7qba08mr4qILf8avtfK5LEzJUKRTINQ3jDqHkaeAtHSSbgsIF
 jU82335mzDrHs/Icv7WQCuVFOJHgp2nNQ+WvV5xyFZY98ACgBrAMAGJdMBX6ql/TrjIg
 rvb6QgN9+YVsEaB7SegaF01Qe7QV1+WVuT0fcszSHPZE977LsixaQ3q5nvXLLmiOcoZV
 ID8zmyt+8KEqc6zF+jfwRlI6+uAXsjvLfWuv2/WdkqjS0Cdz9aeOgqkFHHNySu8UUfNf Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 346g8ghj0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:23:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCFdkm079818
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 344by53w3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09FCLGJ9020867
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:16 GMT
Received: from gyrotron.uk.oracle.com (/10.175.204.150)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:21:15 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 15 Oct 2020 15:20:55 +0300
Message-Id: <20201015122056.20715-4-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015122056.20715-1-alexey.kodanev@oracle.com>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=1 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=1
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] network/virt: add wireguard01
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

* performance tests with TCP traffic

* invalid configuration with allowed IPs, public key

* emulation of the lossy link for the underlying interface.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.features                    |  3 ++
 testcases/network/virt/virt_lib.sh      |  4 +-
 testcases/network/virt/wireguard01.sh   | 56 ++++++++++++++++++++
 testcases/network/virt/wireguard_lib.sh | 68 +++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100755 testcases/network/virt/wireguard01.sh
 create mode 100755 testcases/network/virt/wireguard_lib.sh

diff --git a/runtest/net.features b/runtest/net.features
index 44a974563..c5a1ba714 100644
--- a/runtest/net.features
+++ b/runtest/net.features
@@ -78,3 +78,6 @@ mpls03_ipv6 mpls03.sh -6
 mpls04 mpls04.sh
 
 fanout01 fanout01
+
+wireguard01 wireguard01.sh
+wireguard01_ipv6 wireguard01.sh -6
diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index f62120347..abf331428 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -124,7 +124,7 @@ virt_add()
 	esac
 
 	case $virt_type in
-	vxlan|geneve|sit)
+	vxlan|geneve|sit|wireguard)
 		ip li add $vname type $virt_type $opt
 	;;
 	gre|ip6gre)
@@ -145,7 +145,7 @@ virt_add_rhost()
 		[ "$vxlan_dstport" -eq 1 ] && opt="$opt dstport 0"
 		tst_rhost_run -s -c "ip li add ltp_v0 type $virt_type $@ $opt"
 	;;
-	sit)
+	sit|wireguard)
 		tst_rhost_run -s -c "ip link add ltp_v0 type $virt_type $@"
 	;;
 	gre|ip6gre)
diff --git a/testcases/network/virt/wireguard01.sh b/testcases/network/virt/wireguard01.sh
new file mode 100755
index 000000000..ff0c7e92b
--- /dev/null
+++ b/testcases/network/virt/wireguard01.sh
@@ -0,0 +1,56 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_NEEDS_CMDS="tc"
+TST_SETUP=setup
+TST_CLEANUP=cleanup
+TST_TESTFUNC=test
+TST_CNT=3
+
+. wireguard_lib.sh
+
+setup()
+{
+	if [ -n "$LTP_NETNS" -a "$VIRT_PERF_THRESHOLD" -lt 700 ]; then
+		tst_res TINFO "Adjust threshold for veth (no encap/encrypt)"
+		VIRT_PERF_THRESHOLD=700
+	fi
+
+	local netem_opt="reorder 30% 50% delay 1"
+	tst_res TINFO "Use netem $netem_opt"
+	ROD tc qdisc add dev $(tst_iface) root netem $netem_opt
+	wireguard_lib_setup
+}
+
+cleanup()
+{
+	tc qdisc del dev $(tst_iface) root netem >/dev/null 2>&1
+	wireguard_lib_cleanup
+}
+
+test1()
+{
+	tst_res TINFO "Using correct wireguard configuration"
+	virt_netperf_msg_sizes
+	wireguard_lib_cleanup
+}
+
+test2()
+{
+	tst_res TINFO "Invalid configuration with allowed IPs"
+	wireguard_lib_setup invalid_allowed_ips
+	virt_minimize_timeout
+	virt_compare_netperf "fail"
+	wireguard_lib_cleanup
+}
+
+test3()
+{
+	tst_res TINFO "Invalid configuration with public keys"
+	wireguard_lib_setup invalid_pub_keys
+	virt_minimize_timeout
+	virt_compare_netperf "fail"
+}
+
+tst_run
diff --git a/testcases/network/virt/wireguard_lib.sh b/testcases/network/virt/wireguard_lib.sh
new file mode 100755
index 000000000..c6ea7334e
--- /dev/null
+++ b/testcases/network/virt/wireguard_lib.sh
@@ -0,0 +1,68 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_CMDS="$TST_NEEDS_CMDS wg"
+TST_TESTFUNC=${TST_TESTFUNC:-virt_netperf_msg_sizes}
+TST_SETUP=${TST_SETUP:-wireguard_lib_setup}
+TST_CLEANUP=${TST_CLEANUP:-wireguard_lib_cleanup}
+TST_NEEDS_DRIVERS="wireguard"
+VIRT_PERF_THRESHOLD_MIN=${VIRT_PERF_THRESHOLD_MIN:-200}
+
+virt_type="wireguard"
+. virt_lib.sh
+
+# Usage: wireguard_lib_setup [TYPE]
+# TYPE: [ default | invalid_allowed_ips | invalid_pub_keys ]
+wireguard_lib_setup()
+{
+	local type="${1:-default}"
+	local pub_key0="$(wg genkey | tee wg0.key | wg pubkey)"
+	local pub_key1="$(wg genkey | tee wg1.key | wg pubkey)"
+
+	local port_loc="$(tst_get_unused_port ipv${TST_IPVER} dgram)"
+	local port_rmt=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} dgram")
+
+	# copy private key to remote host
+	tst_rhost_run -s -c "echo '$(cat wg1.key)' > wg1.key"
+
+	tst_res TINFO "setup wireguard UDPv${TST_IPVER} tunnel, port $port_loc/$port_rmt"
+	tst_res TINFO "lhost[$(tst_ipaddr)] <-> rhost[$(tst_ipaddr rhost)]"
+
+	virt_setup
+
+	local ka_opt="persistent-keepalive 1"
+	local allow_ip_loc="${ip_virt_local}/32,${ip6_virt_local}/128"
+	local allow_ip_rmt="${ip_virt_remote}/32,${ip6_virt_remote}/128"
+
+	case $type in
+	invalid_allowed_ips)
+		allow_ip_loc="${ip_virt_remote}/32,${ip6_virt_remote}/128"
+		allow_ip_rmt="${ip_virt_local}/32,${ip6_virt_local}/128"
+		tst_res TINFO "Allowed IPs are source IPs only"
+		;;
+	invalid_pub_keys)
+		pub_key0="$(wg genkey | wg pubkey)"
+		tst_res TINFO "Invalid peer public key of lhost"
+		;;
+	esac
+
+	ROD wg set ltp_v0 listen-port $port_loc private-key wg0.key
+	ROD wg set ltp_v0 peer $pub_key1 endpoint \
+		$(tst_ipaddr rhost):$port_rmt $ka_opt \
+		allowed-ips $allow_ip_rmt
+
+	tst_rhost_run -s -c \
+		"wg set ltp_v0 listen-port $port_rmt private-key wg1.key"
+	tst_rhost_run -s -c "wg set ltp_v0 peer $pub_key0 \
+		endpoint $(tst_ipaddr):$port_loc $ka_opt \
+		allowed-ips $allow_ip_loc"
+
+	tst_net_run -s "ip route add 128.0.0.0/1 dev ltp_v0"
+}
+
+wireguard_lib_cleanup()
+{
+	virt_cleanup
+}
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
