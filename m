Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015F28F200
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:23:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27DD93C3250
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:23:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 367933C23F5
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:23:21 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 730E81400756
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:23:20 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCDrKP140240
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=i3OP1eeHuvIrw41eoepciR2fuk+0bnUlKZQzsOJSj7c=;
 b=a2TPpenzkRPjFiss4PEuyzd2/tRTEEc6Vt9fZGh8D8UujCwZQMt2mISKVQxR6lYJIyGd
 myMz/vQP16bLMbKkZlnHvT8lmctDLPnu4ZCFrdNmgrD9erF54xRMq36AfGilDo3h+fAG
 VZ2SVNJGRyNP+7n+iNVIpLcohJBUasRJLFUB9RQSUbfU12HV6t8vW5qP/5Os9967qy/Q
 lYfoUyWG4BKaFWWGAQQNyvwmYE7+ob2Relulmf+JgnjXP71TuB2c8OXwYtoKJ8rmBMzS
 4uJgVnl3jpuRgIiXohHYuH9cymiI/FuB+IsgY4VQxw9556vlLNJGw310bWQM6PbZmDgp 5g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 343vaejq4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:23:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCFKUY014020
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 343pv1rr4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FCLDtb025308
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
Received: from gyrotron.uk.oracle.com (/10.175.204.150)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:21:12 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 15 Oct 2020 15:20:52 +0300
Message-Id: <20201015122056.20715-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=1 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=1 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] lib/tst_net: add generic tst_netload_compare()
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

* Remove duplicate code for comparing time-based results in
  network tests (bbr, busy_poll, sctp, tcp fastopen, virt tests)

* Expand thresholds for sctp, bbr test-cases, in order to avoid
  false-positive failures.

* In virt_lib.sh, keep sign for VIRT_PERF_THRESHOLD.

* TWARN when the base result is too bad (threshold_hi arg is set)

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh                      | 31 +++++++++++++++++++
 testcases/network/busy_poll/busy_poll01.sh    | 10 ++----
 testcases/network/busy_poll/busy_poll02.sh    |  8 +----
 testcases/network/busy_poll/busy_poll03.sh    |  8 +----
 testcases/network/dccp/dccp01.sh              | 15 ++-------
 testcases/network/sctp/sctp01.sh              |  8 +----
 testcases/network/tcp_cc/bbr01.sh             |  2 +-
 testcases/network/tcp_cc/bbr02.sh             |  2 +-
 testcases/network/tcp_cc/dctcp01.sh           |  2 +-
 testcases/network/tcp_cc/tcp_cc_lib.sh        |  8 +----
 .../network/tcp_fastopen/tcp_fastopen_run.sh  | 15 ++-------
 testcases/network/virt/virt_lib.sh            | 21 ++-----------
 12 files changed, 46 insertions(+), 84 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index d939a5780..b29e076c3 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -741,6 +741,37 @@ tst_netload()
 	return $ret
 }
 
+# Compares results for netload runs.
+# tst_netload_compare TIME_BASE TIME THRESHOLD_LOW [THRESHOLD_HI]
+# TIME_BASE: time taken to run netstress load test - 100%
+# TIME: time that is compared to the base one
+# THRESHOD_LOW: lower limit for TFAIL
+# THRESHOD_HIGH: upper limit for TWARN
+tst_netload_compare()
+{
+	local base_time=$1
+	local new_time=$2
+	local threshold_low=$3
+	local threshold_hi=$4
+
+	if [ -z "$base_time" -o -z "$new_time" -o -z "$threshold_low" ]; then
+		tst_brk_ TBROK "tst_netload_compare: invalid argument(s)"
+	fi
+
+	local res=$(((base_time - new_time) * 100 / base_time))
+	local msg="performance result is ${res}%"
+
+	if [ "$res" -lt "$threshold_low" ]; then
+		tst_res_ TFAIL "$msg < threshold ${threshold_low}%"
+		return
+	fi
+
+	[ "$threshold_hi" ] && [ "$res" -gt "$threshold_hi" ] && \
+		tst_res_ TWARN "$msg > threshold ${threshold_hi}%"
+
+	tst_res_ TPASS "$msg, in range [${threshold_low}:${threshold_hi:-}]%"
+}
+
 # tst_ping [IFACE] [DST ADDR] [MESSAGE SIZE ARRAY]
 # Check icmp connectivity
 # IFACE: source interface name or IP address
diff --git a/testcases/network/busy_poll/busy_poll01.sh b/testcases/network/busy_poll/busy_poll01.sh
index 0023f6cef..d306d1be8 100755
--- a/testcases/network/busy_poll/busy_poll01.sh
+++ b/testcases/network/busy_poll/busy_poll01.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2015-2018 Oracle and/or its affiliates. All Rights Reserved.
+# Copyright (c) 2015-2020 Oracle and/or its affiliates. All Rights Reserved.
 #
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 
@@ -47,13 +47,7 @@ test()
 		tst_netload -H $(tst_ipaddr rhost) -n 10 -N 10 -d res_$x
 	done
 
-	local poll_cmp=$(( 100 - ($(cat res_50) * 100) / $(cat res_0) ))
-
-	if [ "$poll_cmp" -lt 1 ]; then
-		tst_res TFAIL "busy poll result is '$poll_cmp' %"
-	else
-		tst_res TPASS "busy poll increased performance by '$poll_cmp' %"
-	fi
+	tst_netload_compare $(cat res_0) $(cat res_50) 1
 }
 
 tst_run
diff --git a/testcases/network/busy_poll/busy_poll02.sh b/testcases/network/busy_poll/busy_poll02.sh
index 1f25b7373..abb5160f9 100755
--- a/testcases/network/busy_poll/busy_poll02.sh
+++ b/testcases/network/busy_poll/busy_poll02.sh
@@ -37,13 +37,7 @@ test()
 		tst_netload -H $(tst_ipaddr rhost) -n 10 -N 10 -d res_$x -b $x
 	done
 
-	local poll_cmp=$(( 100 - ($(cat res_50) * 100) / $(cat res_0) ))
-
-	if [ "$poll_cmp" -lt 1 ]; then
-		tst_res TFAIL "busy poll result is '$poll_cmp' %"
-	else
-		tst_res TPASS "busy poll increased performance by '$poll_cmp' %"
-	fi
+	tst_netload_compare $(cat res_0) $(cat res_50) 1
 }
 
 tst_run
diff --git a/testcases/network/busy_poll/busy_poll03.sh b/testcases/network/busy_poll/busy_poll03.sh
index 3c7029927..55ffefb07 100755
--- a/testcases/network/busy_poll/busy_poll03.sh
+++ b/testcases/network/busy_poll/busy_poll03.sh
@@ -40,13 +40,7 @@ test()
 			    -b $x -T $2
 	done
 
-	local poll_cmp=$(( 100 - ($(cat res_50) * 100) / $(cat res_0) ))
-
-	if [ "$poll_cmp" -lt 1 ]; then
-		tst_res TFAIL "busy poll result is '$poll_cmp' %"
-	else
-		tst_res TPASS "busy poll increased performance by '$poll_cmp' %"
-	fi
+	tst_netload_compare $(cat res_0) $(cat res_50) 1
 }
 
 tst_run
diff --git a/testcases/network/dccp/dccp01.sh b/testcases/network/dccp/dccp01.sh
index d18ac6f18..52f232591 100755
--- a/testcases/network/dccp/dccp01.sh
+++ b/testcases/network/dccp/dccp01.sh
@@ -9,17 +9,6 @@ TST_NEEDS_ROOT=1
 
 . tst_net.sh
 
-compare()
-{
-	local per=$(( $res0 * 100 / $res1 - 100 ))
-
-	if [ "$per" -gt "100" -o "$per" -lt "-100" ]; then
-		tst_res TFAIL "$1 performance $per %"
-	else
-		tst_res TPASS "$1 performance $per % in range -100 ... 100 %"
-	fi
-}
-
 test1()
 {
 	tst_res TINFO "run UDP"
@@ -31,14 +20,14 @@ test2()
 	tst_res TINFO "compare UDP/DCCP performance"
 	tst_netload -H $(tst_ipaddr rhost) -T dccp
 	res1="$(cat tst_netload.res)"
-	compare DCCP
+	tst_netload_compare $res0 $res1 -100 100
 }
 test3()
 {
 	tst_res TINFO "compare UDP/UDP-Lite performance"
 	tst_netload -H $(tst_ipaddr rhost) -T udp_lite
 	res1="$(cat tst_netload.res)"
-	compare UDP-Lite
+	tst_netload_compare $res0 $res1 -100 100
 }
 
 tst_run
diff --git a/testcases/network/sctp/sctp01.sh b/testcases/network/sctp/sctp01.sh
index a66020061..a42bd4975 100755
--- a/testcases/network/sctp/sctp01.sh
+++ b/testcases/network/sctp/sctp01.sh
@@ -23,13 +23,7 @@ test()
 	tst_netload -S $(tst_ipaddr) -H $(tst_ipaddr rhost) -T sctp -R 3 $opts
 	local res1="$(cat tst_netload.res)"
 
-	local per=$(( $res0 * 100 / $res1 - 100 ))
-
-	if [ "$per" -gt "100" -o "$per" -lt "-100" ]; then
-		tst_res TFAIL "sctp performance $per %"
-	else
-		tst_res TPASS "sctp performance $per % in range -100 ... 100 %"
-	fi
+	tst_netload_compare $res0 $res1 -200 200
 }
 
 tst_run
diff --git a/testcases/network/tcp_cc/bbr01.sh b/testcases/network/tcp_cc/bbr01.sh
index a6592b32d..3b80d50e4 100755
--- a/testcases/network/tcp_cc/bbr01.sh
+++ b/testcases/network/tcp_cc/bbr01.sh
@@ -27,7 +27,7 @@ setup()
 
 do_test()
 {
-	tcp_cc_test01 bbr -50
+	tcp_cc_test01 bbr -100
 }
 
 tst_run
diff --git a/testcases/network/tcp_cc/bbr02.sh b/testcases/network/tcp_cc/bbr02.sh
index b04c0c173..3a61e8726 100755
--- a/testcases/network/tcp_cc/bbr02.sh
+++ b/testcases/network/tcp_cc/bbr02.sh
@@ -34,7 +34,7 @@ setup()
 do_test()
 {
 	tcp_cc_set_qdisc $2 || return
-	tcp_cc_test01 bbr -50
+	tcp_cc_test01 bbr -100
 }
 
 tst_run
diff --git a/testcases/network/tcp_cc/dctcp01.sh b/testcases/network/tcp_cc/dctcp01.sh
index 14ee96dbf..45311c5a2 100755
--- a/testcases/network/tcp_cc/dctcp01.sh
+++ b/testcases/network/tcp_cc/dctcp01.sh
@@ -33,7 +33,7 @@ setup()
 
 do_test()
 {
-	tcp_cc_test01 dctcp 10
+	tcp_cc_test01 dctcp -100
 }
 
 tst_run
diff --git a/testcases/network/tcp_cc/tcp_cc_lib.sh b/testcases/network/tcp_cc/tcp_cc_lib.sh
index 815cc9c0e..dff8cef19 100755
--- a/testcases/network/tcp_cc/tcp_cc_lib.sh
+++ b/testcases/network/tcp_cc/tcp_cc_lib.sh
@@ -101,11 +101,5 @@ tcp_cc_test01()
 	tst_netload -H $(tst_ipaddr rhost) -A $TST_NET_MAX_PKT
 	local res1="$(cat tst_netload.res)"
 
-	local per=$(( $res0 * 100 / $res1 - 100 ))
-
-	if [ "$per" -lt "$threshold" ]; then
-		tst_res TFAIL "$alg performance $per %"
-	else
-		tst_res TPASS "$alg performance $per %"
-	fi
+	tst_netload_compare $res0 $res1 $threshold
 }
diff --git a/testcases/network/tcp_fastopen/tcp_fastopen_run.sh b/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
index a4b542220..fb2cb8fc2 100755
--- a/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
+++ b/testcases/network/tcp_fastopen/tcp_fastopen_run.sh
@@ -36,17 +36,6 @@ cleanup()
 	tc qdisc del dev $(tst_iface) root netem delay 100 >/dev/null
 }
 
-compare()
-{
-	tfo_cmp=$(( 100 - ($time_tfo_on * 100) / $time_tfo_off ))
-
-	if [ "$tfo_cmp" -lt 3 ]; then
-		tst_res TFAIL "$1 perf result is '$tfo_cmp' percent"
-	else
-		tst_res TPASS "$1 perf result is '$tfo_cmp' percent"
-	fi
-}
-
 setup()
 {
 	if tst_kvcmp -lt "3.16" && [ "$TST_IPV6" ]; then
@@ -66,7 +55,7 @@ test1()
 	tst_netload -H $(tst_ipaddr rhost) -f -t 3 -R $srv_replies
 	time_tfo_on=$(cat tst_netload.res)
 
-	compare
+	tst_netload_compare $time_tfo_off $time_tfo_on 3
 }
 
 test2()
@@ -78,7 +67,7 @@ test2()
 	tst_netload -H $(tst_ipaddr rhost) -F -t 3 -R $srv_replies
 	time_tfo_on=$(cat tst_netload.res)
 
-	compare
+	tst_netload_compare $time_tfo_off $time_tfo_on 3
 }
 
 tst_run
diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index cb2b2ba97..80b9bcc90 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -295,25 +295,8 @@ virt_compare_netperf()
 	local lt="$(cat res_lan)"
 	tst_res TINFO "time lan IPv${TST_IPVER}($lt) $virt_type IPv4($vt) and IPv6($vt6) ms"
 
-	per=$(( $vt * 100 / $lt - 100 ))
-	per6=$(( $vt6 * 100 / $lt - 100 ))
-
-	case "$virt_type" in
-	vxlan|geneve)
-		tst_res TINFO "IP4 $virt_type over IP$TST_IPVER slower by $per %"
-		tst_res TINFO "IP6 $virt_type over IP$TST_IPVER slower by $per6 %"
-	;;
-	*)
-		tst_res TINFO "IP4 $virt_type slower by $per %"
-		tst_res TINFO "IP6 $virt_type slower by $per6 %"
-	esac
-
-	if [ "$per" -ge "$VIRT_PERF_THRESHOLD" -o \
-	     "$per6" -ge "$VIRT_PERF_THRESHOLD" ]; then
-		tst_res TFAIL "Test failed, threshold: $VIRT_PERF_THRESHOLD %"
-	else
-		tst_res TPASS "Test passed, threshold: $VIRT_PERF_THRESHOLD %"
-	fi
+	tst_netload_compare $lt $vt "-$VIRT_PERF_THRESHOLD"
+	tst_netload_compare $lt $vt6 "-$VIRT_PERF_THRESHOLD"
 }
 
 virt_check_cmd()
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
