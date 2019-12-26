Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997312AC78
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Dec 2019 14:54:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 231503C238C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Dec 2019 14:54:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4BECA3C020A
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 14:54:23 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 21C7E6009F2
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 14:54:21 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBQDo5CZ033330
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=SDiIUm36V1ad5szYXsXBxFhjMZrdz2GvEOMq5H9AG4M=;
 b=E3yHhyTKMalEUbPIwpseUt4fLq0NqyiNeGpM93M3Uh7oiT+g1fi4Q2MpoqkhUii4MQ7f
 XK0K4GE9xk/Va60hz5LfAYpce2MpX/EqIh7BFSQVmKa03fhuF9xez4PoyE0puxOkaE7P
 L3AW/zmsvF87mqLacYFN2UN18VXS0iW+so4T06i/XQ0GQH6XdHaCxGKl2vpdyed1DAYf
 /ha6Fac3T+CPFdPCauqqZZfPsBjhPOQe1uRBwUofGEViB4S/B40YW/B/pU80RQTJrfnc
 dWiCLt+ApsbEAHW8RRWpFB2atKujJ7pzYjw83qC1WR5oKbqfKRLDERpcRMq8pU7upTt9 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2x1c1r23tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 13:54:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBQDsFQX140901
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 13:54:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2x4wj1ws1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 13:54:17 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBQDsDql024793
 for <ltp@lists.linux.it>; Thu, 26 Dec 2019 13:54:16 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Dec 2019 05:54:12 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 26 Dec 2019 16:58:01 +0300
Message-Id: <20191226135801.11839-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9481
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912260128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9481
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912260127
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,LOTS_OF_MONEY,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] network/iptables: add ipv6 support
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

New tests: ip6tables, nft6.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.ipv6                           |   2 +
 testcases/network/iptables/iptables_lib.sh | 120 +++++++++++----------
 testcases/network/iptables/nft01.sh        |  17 +--
 3 files changed, 77 insertions(+), 62 deletions(-)

diff --git a/runtest/net.ipv6 b/runtest/net.ipv6
index a238a087a..e599978c0 100644
--- a/runtest/net.ipv6
+++ b/runtest/net.ipv6
@@ -8,3 +8,5 @@ traceroute601 traceroute01.sh -6
 dhcpd6 dhcpd_tests.sh -6
 dnsmasq6 dnsmasq_tests.sh -6
 ipneigh6_ip ipneigh01.sh -6 -c ip
+ip6tables iptables01.sh -6
+nft6 nft01.sh -6
diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
index b029950f9..ad2a894b6 100755
--- a/testcases/network/iptables/iptables_lib.sh
+++ b/testcases/network/iptables/iptables_lib.sh
@@ -12,43 +12,52 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 TST_SETUP="${TST_SETUP:-init}"
 TST_CLEANUP="${TST_CLEANUP:-cleanup}"
+TST_NEEDS_CMDS="grep telnet"
 
-if [ "$use_iptables" = 1 ]; then
-	toolname=iptables
-	cmds="$toolname"
-	TST_NEEDS_DRIVERS="ip_tables"
-else
-	toolname=nft
-	cmds="$toolname iptables-translate"
-	TST_NEEDS_DRIVERS="nf_tables"
-fi
-
-TST_NEEDS_CMDS="$cmds grep ping telnet"
-
-. tst_test.sh
+. tst_net.sh
 
 NFRUN()
 {
 	local rule
 
 	if [ "$use_iptables" = 1 ]; then
-		iptables $@
+		ip${TST_IPV6}tables $@
 	else
-		$(iptables-translate $@ | sed 's,\\,,g')
+		$(ip${TST_IPV6}tables-translate $@ | sed 's,\\,,g')
 	fi
 }
 
 NFRUN_REMOVE()
 {
 	if [ "$use_iptables" = 1 ]; then
-		ROD iptables -D INPUT 1
+		ROD ip${TST_IPV6}tables -D INPUT 1
 	else
-		ROD nft flush chain ip filter INPUT
+		ROD nft flush chain ip${TST_IPV6} filter INPUT
 	fi
 }
 
 init()
 {
+	if [ "$use_iptables" = 1 ]; then
+		toolname=ip${TST_IPV6}tables
+		cmds="$toolname"
+		tst_require_drivers ip${TST_IPV6}_tables
+	else
+		toolname=nft
+		cmds="$toolname ip${TST_IPV6}tables-translate"
+	fi
+
+	if [ "$TST_IPV6" ];then
+		loc_addr="::1"
+		proto="icmpv6"
+	else
+		loc_addr="127.0.0.1"
+		proto="icmp"
+	fi
+
+	ping_cmd="ping$TST_IPV6"
+	tst_require_cmds $cmds $ping_cmd
+
 	tst_res TINFO "INIT: Flushing all rules"
 	NFRUN -F -t filter > tst_iptables.out 2>&1
 	NFRUN -F -t nat > tst_iptables.out 2>&1
@@ -57,29 +66,28 @@ init()
 
 cleanup()
 {
-	if lsmod | grep -q "ip_tables"; then
+	if lsmod | grep -q "ip${TST_IPV6}_tables"; then
 		NFTRUN -F -t filter > /dev/null 2>&1
 		NFTRUN -F -t nat > /dev/null 2>&1
 		NFTRUN -F -t mangle > /dev/null 2>&1
 		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
-			 iptable_mangle iptable_nat ip_conntrack \
-			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
-			 nf_log_ipv4 nf_log_common nf_reject_ipv4 \
-			 nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack \
+			 ip${TST_IPV6}table_mangle ip${TST_IPV6}table_nat ip_conntrack \
+			 ip${TST_IPV6}table_filter ip${TST_IPV6}_tables nf_nat_ipv${TST_IPVER} nf_nat \
+			 nf_log_ipv${TST_IPVER} nf_log_common nf_reject_ipv${TST_IPVER} \
+			 nf_conntrack_ipv${TST_IPVER} nf_defrag_ipv${TST_IPVER} nf_conntrack \
 			 > tst_iptables.out 2>&1
 	fi
 }
 
 test1()
 {
-
 	if [ "$use_iptables" != 1 ]; then
 		tst_res TCONF "$toolname not applicable for test $1"
 		return
 	fi
 	local chaincnt=0
-
-	local cmd="iptables -L -t filter"
+	local ipt_cmd="ip${TST_IPV6}tables"
+	local cmd="$ipt_cmd -L -t filter"
 	tst_res TINFO "$cmd will list all rules in table filter"
 	$cmd > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
@@ -97,7 +105,7 @@ test1()
 		fi
 	fi
 
-	local cmd="iptables -L -t nat"
+	local cmd="$ipt_cmd -L -t nat"
 	tst_res TINFO "$cmd will list all rules in table nat"
 	$cmd > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
@@ -115,7 +123,7 @@ test1()
 		fi
 	fi
 
-	local cmd="iptables -L -t mangle"
+	local cmd="$ipt_cmd -L -t mangle"
 	tst_res TINFO "$cmd will list all rules in table mangle"
 	$cmd > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
@@ -132,23 +140,23 @@ test1()
 		fi
 	fi
 
-	tst_res TPASS "iptables -L lists rules"
+	tst_res TPASS "$ipt_cmd -L lists rules"
 }
 
 test2()
 {
 	tst_res TINFO "Use $toolname to DROP packets from particular IP"
-	tst_res TINFO "Rule to block icmp from 127.0.0.1"
+	tst_res TINFO "Rule to block icmp from $loc_addr"
 
-	NFRUN -A INPUT -s 127.0.0.1 -p icmp -j DROP > tst_iptables.out 2>&1
+	NFRUN -A INPUT -s $loc_addr -p $proto -j DROP > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname command failed to append new rule"
 		cat tst_iptables.out
 		return
 	fi
 
-	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	tst_res TINFO "Pinging $loc_addr"
+	$ping_cmd -c 2 $loc_addr -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
@@ -157,19 +165,19 @@ test2()
 			cat tst_iptables.err
 			return
 		else
-			tst_res TINFO "Ping 127.0.0.1 not successful"
+			tst_res TINFO "Ping $loc_addr not successful"
 		fi
 	else
-		tst_res TFAIL "$toolname did not block icmp from 127.0.0.1"
+		tst_res TFAIL "$toolname did not block $proto from $loc_addr"
 		cat tst_iptables.out
 		return
 	fi
 
-	tst_res TINFO "Deleting icmp DROP from 127.0.0.1 rule"
+	tst_res TINFO "Deleting $proto DROP from $loc_addr rule"
 	NFRUN_REMOVE
 
-	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	tst_res TINFO "Pinging $loc_addr again"
+	$ping_cmd -c 2 $loc_addr -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname blocking loopback. This is expected" \
 			       "behaviour on certain distributions where" \
@@ -186,7 +194,7 @@ test3()
 	tst_res TINFO "Use $toolname to REJECT ping request"
 	tst_res TINFO "Rule to reject ping request"
 
-	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -j \
+	NFRUN -A INPUT -p $proto --${proto}-type echo-request -d $loc_addr -j \
 		 REJECT > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname command failed to append new rule"
@@ -194,8 +202,8 @@ test3()
 		return
 	fi
 
-	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	tst_res TINFO "Pinging $loc_addr"
+	$ping_cmd -c 2 $loc_addr -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
@@ -203,7 +211,7 @@ test3()
 			cat tst_iptables.err
 			return
 		else
-			tst_res TINFO "Ping 127.0.0.1 not successful"
+			tst_res TINFO "Ping $loc_addr not successful"
 		fi
 	else
 		tst_res TFAIL "$toolname did not reject ping request"
@@ -214,8 +222,8 @@ test3()
 	tst_res TINFO "Deleting icmp request REJECT rule"
 	NFRUN_REMOVE
 
-	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	tst_res TINFO "Pinging $loc_addr again"
+	$ping_cmd -c 2 $loc_addr -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname blocking ping requests. This is" \
 			      "expected behaviour on certain distributions" \
@@ -236,7 +244,7 @@ test4()
 	tst_res TINFO "Use $toolname to log packets to particular port"
 	tst_res TINFO "Rule to log tcp packets to particular port"
 
-	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport $dport -j LOG \
+	NFRUN -A INPUT -p tcp -d $loc_addr --dport $dport -j LOG \
 		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname command failed to append new rule"
@@ -244,8 +252,8 @@ test4()
 		return
 	fi
 
-	tst_res TINFO "telnet 127.0.0.1 $dport"
-	telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
+	tst_res TINFO "telnet $loc_addr $dport"
+	telnet $loc_addr $dport > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		sleep 2
 		dmesg | grep "$logprefix" > tst_iptables.err 2>&1
@@ -258,7 +266,7 @@ test4()
 			tst_res TINFO "Packets to port $dport logged"
 		fi
 	else
-		tst_res TFAIL "telnet to 127.0.0.1 $dport should fail"
+		tst_res TFAIL "telnet to $loc_addr $dport should fail"
 		cat tst_iptables.out
 		return
 	fi
@@ -277,7 +285,7 @@ test5()
 
 	tst_res TINFO "Use $toolname to log packets to multiple ports"
 	tst_res TINFO "Rule to log tcp packets to port 45801 - 45803"
-	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport 45801:45803 -j LOG \
+	NFRUN -A INPUT -p tcp -d $loc_addr --dport 45801:45803 -j LOG \
 		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname command failed to append new rule"
@@ -286,7 +294,7 @@ test5()
 	fi
 
 	tst_res TINFO "Rule to log tcp packets to port 45804 - 45806"
-	NFRUN -A INPUT -p tcp -d 127.0.0.1 -m multiport --dports \
+	NFRUN -A INPUT -p tcp -d $loc_addr -m multiport --dports \
 		 45804,45806,45805 -j LOG --log-prefix "$logprefix" \
 		 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
@@ -296,8 +304,8 @@ test5()
 	fi
 
 	for dport in 45801 45802 45803 45804 45805 45806; do
-		tst_res TINFO "telnet 127.0.0.1 $dport"
-		telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
+		tst_res TINFO "telnet $loc_addr $dport"
+		telnet $loc_addr $dport > tst_iptables.out 2>&1
 		if [ $? -ne 0 ]; then
 			sleep 2
 			dmesg | grep "$logprefix" | grep "=$dport " \
@@ -311,7 +319,7 @@ test5()
 				tst_res TINFO "Packets to port $dport logged"
 			fi
 		else
-			tst_res TFAIL "telnet to 127.0.0.1 $dport should fail"
+			tst_res TFAIL "telnet to $loc_addr $dport should fail"
 			cat tst_iptables.out
 			return
 		fi
@@ -336,7 +344,7 @@ test6()
 	tst_res TINFO "Use $toolname to log ping request with limited rate"
 	tst_res TINFO "Rule to log ping request"
 
-	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -m \
+	NFRUN -A INPUT -p $proto --$proto-type echo-request -d $loc_addr -m \
 		 limit -j LOG --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "$toolname command failed to append new rule"
@@ -344,8 +352,8 @@ test6()
 		return
 	fi
 
-	tst_res TINFO "ping 127.0.0.1"
-	ping -c 10 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	tst_res TINFO "Pinging $loc_addr"
+	$ping_cmd -c 10 $loc_addr -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -eq 0 ]; then
 		sleep 2
 		logcnt=$(dmesg | grep -c "$logprefix")
@@ -358,7 +366,7 @@ test6()
 			tst_res TINFO "ping requests logged with limited rate"
 		fi
 	else
-		tst_res TFAIL "ping to 127.0.0.1 failed. This is expected" \
+		tst_res TFAIL "ping to $loc_addr failed. This is expected" \
 			      "behaviour on certain distributions where" \
 			      "enabling firewall drops all packets by default"
 		cat tst_iptables.out
diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
index 6cbd7a3a6..1ae086678 100755
--- a/testcases/network/iptables/nft01.sh
+++ b/testcases/network/iptables/nft01.sh
@@ -4,6 +4,7 @@
 
 TST_SETUP="do_setup"
 TST_CLEANUP="do_cleanup"
+TST_NEEDS_DRIVERS="nf_tables"
 use_iptables=0
 cleanup_table=0
 cleanup_chain=0
@@ -12,12 +13,14 @@ cleanup_chain=0
 
 do_setup()
 {
-	if ! nft list table ip filter > /dev/null 2>&1; then
-		ROD nft add table ip filter
+	local ip_table="ip${TST_IPV6}"
+
+	if ! nft list table $ip_table filter > /dev/null 2>&1; then
+		ROD nft add table $ip_table filter
 		cleanup_table=1
 	fi
-	if ! nft list chain ip filter INPUT > /dev/null 2>&1; then
-		ROD nft add chain ip filter INPUT '{ type filter hook input priority 0; }'
+	if ! nft list chain $ip_table filter INPUT > /dev/null 2>&1; then
+		ROD nft add chain $ip_table filter INPUT '{ type filter hook input priority 0; }'
 		cleanup_chain=1
 	fi
 	init
@@ -25,8 +28,10 @@ do_setup()
 
 do_cleanup()
 {
-	[ "$cleanup_chain" = 1 ] && nft delete chain ip filter INPUT >/dev/null 2>&1
-	[ "$cleanup_table" = 1 ] && nft delete table ip filter >/dev/null 2>&1
+	local ip_table="ip${TST_IPV6}"
+
+	[ "$cleanup_chain" = 1 ] && nft delete chain $ip_table filter INPUT >/dev/null 2>&1
+	[ "$cleanup_table" = 1 ] && nft delete table $ip_table filter >/dev/null 2>&1
 	cleanup
 }
 
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
