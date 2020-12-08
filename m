Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 060592D2FA2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 17:27:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B57143C4B8A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 17:27:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E14913C2BDC
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 17:27:05 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1F47C200B7E
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 17:27:04 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8GJJCR145498
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=6UfGVJnGSf2l64K8hbpvuVafeZeA6Ltmd+8CQ0ZVGD8=;
 b=o2CsgpZuLDog7EFMDqBOGN1LClBbyMl9NHbYrfjzbC8CP7w00ahhFMUUmECE/Eo4GX3I
 LmiwgGHAstczN+5fb0Z2Td6nay+OnG/Nymg2zGLQBNpEvBhCfVlSsM7FGomlf9YSmWbD
 NENMUB88uAoWHh3uMBJ8TnUFY4ZAJj62fbblSpAnZsUxhFWImCUtvjeOJ2ugbEX3vEoV
 BvvwwTh8W26dR/KyrfW0sbgpa/X+BBfH26n06kC0oU4BI0bOKwtlYvX+wSMjYoXyZ9rq
 SbDqAANNfEiUhqkNEbRYZYMxrRqwamYd0d7XgWAIk5LNxTYtuu7MdLbs2DMaGzzV5DOG 2g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 357yqbusrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 16:27:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8GFn7D138189
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:25:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 358m4y3egn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 16:25:02 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8GOxQM023010
 for <ltp@lists.linux.it>; Tue, 8 Dec 2020 16:25:01 GMT
Received: from gyrotron.nl.oracle.com (/10.175.28.120)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 08:24:59 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  8 Dec 2020 19:24:39 +0300
Message-Id: <20201208162440.14538-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080099
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_net.sh: add getopts to tst_ping()
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

* Replace '-i 0' with '-f'

* Add similar checks for the flood and interval options as
  in ping02 test

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh                      | 55 +++++++++++++------
 testcases/network/mpls/mpls02.sh              |  2 +-
 testcases/network/mpls/mpls_lib.sh            |  4 +-
 .../network/stress/icmp/icmp-uni-basic.sh     |  2 +-
 testcases/network/stress/icmp/icmp-uni-vti.sh |  2 +-
 .../network/stress/interface/if-mtu-change.sh |  2 +-
 .../network/stress/ns-tools/tst_net_stress.sh |  2 +-
 7 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 46d3fb88e..ef9354903 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -800,37 +800,58 @@ tst_netload_compare()
 	tst_res_ TPASS "$msg, in range [${threshold_low}:${threshold_hi}]%"
 }
 
-# tst_ping [IFACE] [DST ADDR] [MESSAGE SIZE ARRAY]
+tst_ping_opt_unsupported()
+{
+	ping $@ 2>&1 | grep -q "invalid option"
+}
+
+# tst_ping -c COUNT -s MESSAGE_SIZES -p PATTERN -I IFACE -H HOST
 # Check icmp connectivity
 # IFACE: source interface name or IP address
-# DST ADDR: destination IPv4 or IPv6 address
-# MESSAGE SIZE ARRAY: message size array
+# HOST: destination IPv4 or IPv6 address
+# MESSAGE_SIZES: message size array
 tst_ping()
 {
 	# The max number of ICMP echo request
-	PING_MAX="${PING_MAX:-500}"
-
-	local src_iface="${1:-$(tst_iface)}"
-	local dst_addr="${2:-$(tst_ipaddr rhost)}"; shift $(( $# >= 2 ? 2 : 0 ))
-	local msg_sizes="$*"
-	local msg="tst_ping $dst_addr iface/saddr $src_iface, msg_size"
+	local ping_count="${PING_MAX:-500}"
+	local flood_opt="-f"
+	local pattern_opt
+	local msg_sizes
+	local src_iface="$(tst_iface)"
+	local dst_addr="$(tst_ipaddr rhost)"
 	local cmd="ping"
 	local ret=0
+	local opts
+
+	local OPTIND
+	while getopts c:s:p:I:H: opt; do
+		case "$opt" in
+		c) ping_count="$OPTARG";;
+		s) msg_sizes="$OPTARG";;
+		p) pattern_opt="-p $OPTARG";;
+		I) src_iface="$OPTARG";;
+		H) dst_addr="$OPTARG";;
+		*) tst_brk_ TBROK "tst_ping: unknown option: $OPTARG";;
+		esac
+	done
 
 	echo "$dst_addr" | grep -q ':' && cmd="ping6"
 	tst_require_cmds $cmd
 
+	if tst_ping_opt_unsupported $flood_opt; then
+		flood_opt="-i 0.01"
+		[ "$pattern_opt" ] && pattern_opt="-p aa"
+
+		tst_ping_opt_unsupported -i $pattern_opt && \
+			tst_brk_ TCONF "unsupported ping version (old busybox?)"
+	fi
+
 	# ping cmd use 56 as default message size
 	for size in ${msg_sizes:-"56"}; do
-		$cmd -I $src_iface -c $PING_MAX $dst_addr \
-			-s $size -i 0 > /dev/null 2>&1
+		EXPECT_PASS $cmd -I $src_iface -c $ping_count -s $size \
+			$flood_opt $pattern_opt $dst_addr \>/dev/null
 		ret=$?
-		if [ $ret -eq 0 ]; then
-			tst_res_ TPASS "$msg $size: pass"
-		else
-			tst_res_ TFAIL "$msg $size: fail"
-			break
-		fi
+		[ "$ret" -ne 0 ] && break
 	done
 	return $ret
 }
diff --git a/testcases/network/mpls/mpls02.sh b/testcases/network/mpls/mpls02.sh
index c263f8aa8..2fd3ec5bf 100755
--- a/testcases/network/mpls/mpls02.sh
+++ b/testcases/network/mpls/mpls02.sh
@@ -43,7 +43,7 @@ do_test()
 	local max_size=$TST_NET_MAX_PKT
 
 	if [ "$type" = "icmp" ]; then
-		tst_ping $ip_loc $ip_rmt 10 100 1000 2000 $max_size
+		tst_ping -I $ip_loc -H $ip_rmt -s "10 100 1000 2000 $max_size"
 	else
 		tst_netload -S $ip_loc -H $ip_rmt -T $type -n 10 -N 10
 		tst_netload -S $ip_loc -H $ip_rmt -T $type -A $max_size
diff --git a/testcases/network/mpls/mpls_lib.sh b/testcases/network/mpls/mpls_lib.sh
index 8ebedba0f..30e069581 100755
--- a/testcases/network/mpls/mpls_lib.sh
+++ b/testcases/network/mpls/mpls_lib.sh
@@ -87,8 +87,8 @@ mpls_virt_test()
 	local max_size=$TST_NET_MAX_PKT
 
 	if [ "$type" = "icmp" ]; then
-		tst_ping $ip_virt_local $ip_virt_remote 10 100 1000 2000 $max_size
-		tst_ping $ip6_virt_local $ip6_virt_remote 10 100 1000 2000 $max_size
+		tst_ping -I $ip_virt_local -H $ip_virt_remote -s "10 100 1000 2000 $max_size"
+		tst_ping -I $ip6_virt_local -H $ip6_virt_remote -s "10 100 1000 2000 $max_size"
 	else
 		tst_netload -S $ip_virt_local -H $ip_virt_remote -T $type -n 10 -N 10
 		tst_netload -S $ip6_virt_local -H $ip6_virt_remote -T $type -n 10 -N 10
diff --git a/testcases/network/stress/icmp/icmp-uni-basic.sh b/testcases/network/stress/icmp/icmp-uni-basic.sh
index 5980b81e5..2ae616cc3 100755
--- a/testcases/network/stress/icmp/icmp-uni-basic.sh
+++ b/testcases/network/stress/icmp/icmp-uni-basic.sh
@@ -19,7 +19,7 @@ do_setup()
 
 do_test()
 {
-	tst_ping $(tst_iface) $(tst_ipaddr rhost) $2
+	tst_ping -s $2
 }
 
 tst_run
diff --git a/testcases/network/stress/icmp/icmp-uni-vti.sh b/testcases/network/stress/icmp/icmp-uni-vti.sh
index 24eca177c..18bc71cfb 100755
--- a/testcases/network/stress/icmp/icmp-uni-vti.sh
+++ b/testcases/network/stress/icmp/icmp-uni-vti.sh
@@ -18,7 +18,7 @@ do_setup()
 
 do_test()
 {
-	tst_ping $tst_vti $ip_rmt_tun $2
+	tst_ping -I $tst_vti -H $ip_rmt_tun -s $2
 }
 
 tst_run
diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
index b945fb6ce..8112cdf0e 100755
--- a/testcases/network/stress/interface/if-mtu-change.sh
+++ b/testcases/network/stress/interface/if-mtu-change.sh
@@ -77,7 +77,7 @@ test_body()
 
 		tst_sleep $CHANGE_INTERVAL
 
-		tst_ping $(tst_ipaddr) $(tst_ipaddr rhost) "1 1000 65507"
+		tst_ping -s "1 1000 65507"
 	done
 }
 
diff --git a/testcases/network/stress/ns-tools/tst_net_stress.sh b/testcases/network/stress/ns-tools/tst_net_stress.sh
index ae040bcf1..4b00ee7f8 100644
--- a/testcases/network/stress/ns-tools/tst_net_stress.sh
+++ b/testcases/network/stress/ns-tools/tst_net_stress.sh
@@ -69,7 +69,7 @@ check_connectivity()
 
 	tst_res TINFO "ping through $src_iface iface to ${dst_addr}$cnt_msg"
 
-	tst_ping $src_iface $dst_addr
+	tst_ping -I $src_iface -H $dst_addr
 }
 
 # check_connectivity_interval CNT [RESTORE] [SRC_IFACE] [DST_ADDR]
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
