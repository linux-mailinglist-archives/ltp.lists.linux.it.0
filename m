Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDC109D58
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 12:54:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD9F43C2095
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 12:54:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CB9D33C1D76
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:54:50 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CF4F3600715
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:54:49 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQBowWK102225
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=8x8sI7Hv/8liJEj06w+Zr4cWRZFACMcRtB/ACtkP0ww=;
 b=q6Yr55RuVjJj42KOejstHx19HISZc2D+bwmajo2z9QWRQawptYJfZxs3rvyeNt1CksCp
 UPeC9GADwJ+4hUSWJntOGwwjzW/U2CjxRTqPvskdONtEr/v+h2uUoXay8COBpU3YTsRL
 R29O8qdltng+v7h6+ArDA5Sc2DNuSRSeKhOK1e4pwctGviEVCZ7APE9wITxNqOlRP0WF
 54HTf+B3VFtwWHzsL1x4yZBEaPtktX11yNYTWFLofnvXQKIcWcauc1Ax0FkB6VcGK9xk
 nE3LwsqtuSgIfTU68cdR6cFw9KBuvgX7xkbPJo1D9LAAzx05pEN4v/gTbVyc6KPrX7W3 YQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2wev6u6amk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQBsfj0179446
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2wh0rbaaw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:44 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQBruq2025169
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:53:57 GMT
Received: from gyrotron.nl.oracle.com (/10.175.39.117)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 03:53:55 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 14:53:44 +0300
Message-Id: <20191126115344.15926-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126115344.15926-1-alexey.kodanev@oracle.com>
References: <20191126115344.15926-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260107
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

* Reuse the test-cases from iptables_tests by moving them
  into iptables_lib.sh.

* create nft rules with iptables-translate.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.tcp_cmds                          |   3 +-
 testcases/network/iptables/Makefile           |  23 +--
 testcases/network/iptables/iptables01.sh      |  18 ++
 .../{iptables_tests.sh => iptables_lib.sh}    | 163 +++++++++---------
 testcases/network/iptables/nft01.sh           |  18 ++
 5 files changed, 119 insertions(+), 106 deletions(-)
 create mode 100755 testcases/network/iptables/iptables01.sh
 rename testcases/network/iptables/{iptables_tests.sh => iptables_lib.sh} (65%)
 create mode 100755 testcases/network/iptables/nft01.sh

diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
index 423a81756..afe6d7c71 100644
--- a/runtest/net.tcp_cmds
+++ b/runtest/net.tcp_cmds
@@ -17,7 +17,8 @@ rsh rsh01.sh
 sendfile sendfile01.sh
 tcpdump tcpdump01.sh
 telnet telnet01.sh
-iptables iptables_tests.sh
+iptables iptables01.sh
+nft nft01.sh
 dhcpd dhcpd_tests.sh
 dnsmasq dnsmasq_tests.sh
 iproute ip_tests.sh
diff --git a/testcases/network/iptables/Makefile b/testcases/network/iptables/Makefile
index afb96e9cb..1b42f25db 100644
--- a/testcases/network/iptables/Makefile
+++ b/testcases/network/iptables/Makefile
@@ -1,29 +1,12 @@
-#
-#    network/iptables testcases Makefile.
-#
-#    Copyright (C) 2009, Cisco Systems Inc.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
 #
 # Ngie Cooper, July 2009
-#
 
 top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_TARGETS		:= iptables_tests.sh
+INSTALL_TARGETS		:= *.sh
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/iptables/iptables01.sh b/testcases/network/iptables/iptables01.sh
new file mode 100755
index 000000000..de38272e1
--- /dev/null
+++ b/testcases/network/iptables/iptables01.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_CNT=6
+TST_SETUP="init"
+TST_TESTFUNC="test"
+TST_CLEANUP="cleanup"
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="iptables grep ping telnet"
+TST_NEEDS_DRIVERS="ip_tables"
+use_iptables=1
+
+. iptables_lib.sh
+. tst_test.sh
+
+tst_run
diff --git a/testcases/network/iptables/iptables_tests.sh b/testcases/network/iptables/iptables_lib.sh
similarity index 65%
rename from testcases/network/iptables/iptables_tests.sh
rename to testcases/network/iptables/iptables_lib.sh
index d8b23283f..35548d88e 100755
--- a/testcases/network/iptables/iptables_tests.sh
+++ b/testcases/network/iptables/iptables_lib.sh
@@ -6,41 +6,47 @@
 #  Author:	Jan 20 2004 Hubert Lin <linux02NOSPAAAM@tw.ibm.com>
 #				       <hubertNOSPAAAM@symbio.com.tw>
 
-TST_CNT=6
-TST_SETUP="init"
-TST_TESTFUNC="test"
-TST_CLEANUP="cleanup"
-TST_NEEDS_TMPDIR=1
-TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="iptables grep ping telnet"
+if [ "$use_iptables" -eq 1 ]; then
+	toolname=iptables
+else
+	toolname=nft
+fi
 
-. tst_test.sh
-
-init()
+NFRUN()
 {
-	tst_res TINFO "INIT: Inititalizing tests."
+	local rule
 
-	modprobe ip_tables
-	if [ $? -ne 0 ]; then
-		iptables -L > tst_iptables.out 2>&1
-		if [ $? -ne 0 ]; then
-			tst_brk TCONF "no iptables support in kernel."
-		fi
+	if [ "$use_iptables" -eq 1 ]; then
+		iptables $@
+	else
+		$(iptables-translate $@ | sed 's,\\,,g')
 	fi
+}
 
+NFRUN_REMOVE()
+{
+	if [ "$use_iptables" -eq 1 ]; then
+		ROD iptables -D INPUT 1
+	else
+		ROD nft flush chain ip filter INPUT
+	fi
+}
+
+init()
+{
 	tst_res TINFO "INIT: Flushing all rules."
-	iptables -F -t filter > tst_iptables.out 2>&1
-	iptables -F -t nat > tst_iptables.out 2>&1
-	iptables -F -t mangle > tst_iptables.out 2>&1
+	NFRUN -F -t filter > tst_iptables.out 2>&1
+	NFRUN -F -t nat > tst_iptables.out 2>&1
+	NFRUN -F -t mangle > tst_iptables.out 2>&1
 }
 
 cleanup()
 {
 	lsmod | grep "ip_tables" > tst_iptables.out 2>&1
 	if [ $? -eq 0 ]; then
-		iptables -F -t filter > tst_iptables.out 2>&1
-		iptables -F -t nat > tst_iptables.out 2>&1
-		iptables -F -t mangle > tst_iptables.out 2>&1
+		NFRUN -F -t filter > tst_iptables.out 2>&1
+		NFRUN -F -t nat > tst_iptables.out 2>&1
+		NFRUN -F -t mangle > tst_iptables.out 2>&1
 		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
 			 iptable_mangle iptable_nat ip_conntrack \
 			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
@@ -52,6 +58,11 @@ cleanup()
 
 test1()
 {
+
+	if [ "$use_iptables" -ne 1 ]; then
+		tst_res TCONF "$toolname not applicable for test $1"
+		return
+	fi
 	local chaincnt=0
 
 	local cmd="iptables -L -t filter"
@@ -112,12 +123,12 @@ test1()
 
 test2()
 {
-	tst_res TINFO "Use iptables to DROP packets from particular IP"
+	tst_res TINFO "Use $toolname to DROP packets from particular IP"
 	tst_res TINFO "Rule to block icmp from 127.0.0.1"
 
-	iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP > tst_iptables.out 2>&1
+	NFRUN -A INPUT -s 127.0.0.1 -p icmp -j DROP > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
@@ -128,47 +139,43 @@ test2()
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
 			tst_res TFAIL \
-				 "iptables did not block packets from loopback"
+				 "$toolname did not block packets from loopback"
 			cat tst_iptables.err
 			return
 		else
 			tst_res TINFO "Ping 127.0.0.1 not successful."
 		fi
 	else
-		tst_res TFAIL "iptables did not block icmp from 127.0.0.1"
+		tst_res TFAIL "$toolname did not block icmp from 127.0.0.1"
 		cat tst_iptables.out
 		return
 	fi
 
 	tst_res TINFO "Deleting icmp DROP from 127.0.0.1 rule."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
+	NFRUN_REMOVE
+
 	tst_res TINFO "Pinging 127.0.0.1 again"
 	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables blocking loopback. This is expected" \
+		tst_res TFAIL "$toolname blocking loopback. This is expected" \
 			       "behaviour on certain distributions where" \
 			       "enabling firewall drops all packets by default."
 		cat tst_iptables.out
 		return
 	fi
 	tst_res TINFO "Ping succsess"
-	tst_res TPASS "iptables can DROP packets from particular IP."
+	tst_res TPASS "$toolname can DROP packets from particular IP."
 }
 
 test3()
 {
-	tst_res TINFO "Use iptables to REJECT ping request."
+	tst_res TINFO "Use $toolname to REJECT ping request."
 	tst_res TINFO "Rule to reject ping request."
 
-	iptables -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -j \
+	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -j \
 		 REJECT > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
@@ -178,29 +185,25 @@ test3()
 	if [ $? -ne 0 ]; then
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
-			tst_res TFAIL "iptables did not block ping request."
+			tst_res TFAIL "$toolname did not block ping request."
 			cat tst_iptables.err
 			return
 		else
 			tst_res TINFO "Ping 127.0.0.1 not successful."
 		fi
 	else
-		tst_res TFAIL "iptables did not reject ping request."
+		tst_res TFAIL "$toolname did not reject ping request."
 		cat tst_iptables.out
 		return
 	fi
 
 	tst_res TINFO "Deleting icmp request REJECT rule."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
+	NFRUN_REMOVE
+
 	tst_res TINFO "Pinging 127.0.0.1 again"
 	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables blocking ping requests. This is" \
+		tst_res TFAIL "$toolname blocking ping requests. This is" \
 			      "expected behaviour on certain distributions" \
 			      "where enabling firewall drops all packets by" \
 			      "default."
@@ -208,7 +211,7 @@ test3()
 		return
 	fi
 	tst_res TINFO "Ping succsess"
-	tst_res TPASS "iptables can REJECT ping requests."
+	tst_res TPASS "$toolname can REJECT ping requests."
 }
 
 test4()
@@ -216,13 +219,13 @@ test4()
 	local dport=45886
 	local logprefix="${TCID}$(date +%m%d%H%M%S):"
 
-	tst_res TINFO "Use iptables to log packets to particular port."
+	tst_res TINFO "Use $toolname to log packets to particular port."
 	tst_res TINFO "Rule to log tcp packets to particular port."
 
-	iptables -A INPUT -p tcp -d 127.0.0.1 --dport $dport -j LOG \
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport $dport -j LOG \
 		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
@@ -234,7 +237,7 @@ test4()
 		dmesg | grep "$logprefix" > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
 			tst_res TFAIL \
-				 "iptables did not log packets to port $dport"
+				 "$toolname did not log packets to port $dport"
 			cat tst_iptables.err
 			return
 		else
@@ -247,14 +250,10 @@ test4()
 	fi
 
 	tst_res TINFO "Deleting the rule to log."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "iptables logging succsess"
-	tst_res TPASS "iptables can log packets to particular port."
+	NFRUN_REMOVE
+
+	tst_res TINFO "$toolname logging succsess"
+	tst_res TPASS "$toolname can log packets to particular port."
 }
 
 test5()
@@ -262,22 +261,22 @@ test5()
 	local dport=0
 	local logprefix="${TCID}$(date +%m%d%H%M%S):"
 
-	tst_res TINFO "Use iptables to log packets to multiple ports."
+	tst_res TINFO "Use $toolname to log packets to multiple ports."
 	tst_res TINFO "Rule to log tcp packets to port 45801 - 45803."
-	iptables -A INPUT -p tcp -d 127.0.0.1 --dport 45801:45803 -j LOG \
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport 45801:45803 -j LOG \
 		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
 
 	tst_res TINFO "Rule to log tcp packets to port 45804 - 45806."
-	iptables -A INPUT -p tcp -d 127.0.0.1 -m multiport --dports \
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 -m multiport --dports \
 		 45804,45806,45805 -j LOG --log-prefix "$logprefix" \
 		 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
@@ -290,7 +289,7 @@ test5()
 			dmesg | grep "$logprefix" | grep "=$dport " \
 				> tst_iptables.err 2>&1
 			if [ $? -ne 0 ]; then
-				tst_res TFAIL "iptables did not log packets" \
+				tst_res TFAIL "$toolname did not log packets" \
 					       "to port $dport"
 				cat tst_iptables.err
 				return
@@ -305,14 +304,14 @@ test5()
 	done
 
 	tst_res TINFO "Flushing all rules."
-	iptables -F > tst_iptables.out 2>&1
+	NFRUN -F > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not flush all rules."
+		tst_res TFAIL "$toolname did not flush all rules."
 		cat tst_iptables.out
 		return
 	fi
-	tst_res TINFO "iptables logging succsess"
-	tst_res TPASS "iptables can log packets to multiple ports."
+	tst_res TINFO "$toolname logging succsess"
+	tst_res TPASS "$toolname can log packets to multiple ports."
 }
 
 test6()
@@ -320,13 +319,13 @@ test6()
 	local logcnt=0
 	local logprefix="${TCID}$(date +%m%d%H%M%S):"
 
-	tst_res TINFO "Use iptables to log ping request with limited rate."
+	tst_res TINFO "Use $toolname to log ping request with limited rate."
 	tst_res TINFO "Rule to log ping request."
 
-	iptables -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -m \
+	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -m \
 		 limit -j LOG --log-prefix "$logprefix" > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
+		tst_res TFAIL "$toolname command failed to append new rule."
 		cat tst_iptables.out
 		return
 	fi
@@ -337,7 +336,7 @@ test6()
 		sleep 2
 		logcnt=$(dmesg | grep -c "$logprefix")
 		if [ $logcnt -ne 5 ]; then
-			tst_res TFAIL "iptables did not log packets with" \
+			tst_res TFAIL "$toolname did not log packets with" \
 				      "limited rate."
 			cat tst_iptables.out
 			return
@@ -353,14 +352,8 @@ test6()
 	fi
 
 	tst_res TINFO "Deleting the rule to log."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "iptables limited logging succsess"
-	tst_res TPASS "iptables can log packets with limited rate."
-}
+	NFRUN_REMOVE
 
-tst_run
+	tst_res TINFO "$toolname limited logging succsess"
+	tst_res TPASS "$toolname can log packets with limited rate."
+}
diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
new file mode 100755
index 000000000..1d378b2b7
--- /dev/null
+++ b/testcases/network/iptables/nft01.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_CNT=6
+TST_SETUP="init"
+TST_TESTFUNC="test"
+TST_CLEANUP="cleanup"
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
+TST_NEEDS_DRIVERS="nf_tables"
+use_iptables=0
+
+. iptables_lib.sh
+. tst_test.sh
+
+tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
