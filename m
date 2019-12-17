Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2312335F
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 18:20:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81A183C1CB8
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 18:20:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3650B3C18F9
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:19:54 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 272726009B4
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:19:52 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHHJJDA020072
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=61ppUoJNXY6OPpq1zX41X3rGO6Wy0hohSlVFPGhGlyU=;
 b=SNSxHeM3I87l3XZvLpQCoAx0MnOu1AaaxbRU31MBTWQJw9TyNCZ9KmerfKYgMAFNZrWl
 pgJxnd8Zbcb3/ypQG5lRoZnRbiRCNq60vhOz/pOeyKkTdgrUT7S+xxqU+SWV464EfDaC
 wI+4ZZqHcqCoiUYSq19z9t0XlWaAUm7CiBDly6af+Ub0c59l+fUW4eXK3rbNXN9EDUZn
 Z49n5f9398T7t0WR7bIo5WgTCoTfQ/NDo6mFsgUizrdoJPwGZzpfGCQHkS1mxl1ZBTXQ
 OK5a6Lu3AqAFsrYULXkou1KHONFDiE/4Dl7W0bW0LkcEIHmUi2vTcUn5PoTmK85Uv7P1 CA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2wvrcr81e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHHJUOE126450
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2wxm72rag9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:49 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBHHJlwV021007
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:48 GMT
Received: from gyrotron.nl.oracle.com (/10.175.8.42)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Dec 2019 09:19:46 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 17 Dec 2019 20:19:18 +0300
Message-Id: <20191217171918.10237-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217171918.10237-1-alexey.kodanev@oracle.com>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912170137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912170137
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,LOTS_OF_MONEY,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] network/iptables: add new test for
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

* Reuse the test-case from iptables_tests by moving them
  in iptables_lib.sh.

* create nft rules with iptables-translate.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
v2: * added nft setup with default input chain (in case firewalld not installed)
    * removed dots in the messages
    * removed redirection to file in cleanup

 runtest/net.tcp_cmds                         |   3 +-
 testcases/network/iptables/Makefile          |  23 +-
 testcases/network/iptables/iptables01.sh     |  18 +
 testcases/network/iptables/iptables_lib.sh   | 358 ++++++++++++++++++
 testcases/network/iptables/iptables_tests.sh | 366 -------------------
 testcases/network/iptables/nft01.sh          |  41 +++
 6 files changed, 422 insertions(+), 387 deletions(-)
 create mode 100755 testcases/network/iptables/iptables01.sh
 create mode 100755 testcases/network/iptables/iptables_lib.sh
 delete mode 100755 testcases/network/iptables/iptables_tests.sh
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
diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
new file mode 100755
index 000000000..7ecec99f9
--- /dev/null
+++ b/testcases/network/iptables/iptables_lib.sh
@@ -0,0 +1,358 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
+# Copyright (c) International Business Machines  Corp., 2001
+#
+#  Author:	Jan 20 2004 Hubert Lin <linux02NOSPAAAM@tw.ibm.com>
+#				       <hubertNOSPAAAM@symbio.com.tw>
+
+if [ "$use_iptables" -eq 1 ]; then
+	toolname=iptables
+else
+	toolname=nft
+fi
+
+NFRUN()
+{
+	local rule
+
+	if [ "$use_iptables" -eq 1 ]; then
+		iptables $@
+	else
+		$(iptables-translate $@ | sed 's,\\,,g')
+	fi
+}
+
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
+	tst_res TINFO "INIT: Flushing all rules"
+	NFRUN -F -t filter > tst_iptables.out 2>&1
+	NFRUN -F -t nat > tst_iptables.out 2>&1
+	NFRUN -F -t mangle > tst_iptables.out 2>&1
+}
+
+cleanup()
+{
+	if lsmod | grep -q "ip_tables"; then
+		NFTRUN -F -t filter > /dev/null 2>&1
+		NFTRUN -F -t nat > /dev/null 2>&1
+		NFTRUN -F -t mangle > /dev/null 2>&1
+		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
+			 iptable_mangle iptable_nat ip_conntrack \
+			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
+			 nf_log_ipv4 nf_log_common nf_reject_ipv4 \
+			 nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack \
+			 > tst_iptables.out 2>&1
+	fi
+}
+
+test1()
+{
+
+	if [ "$use_iptables" -ne 1 ]; then
+		tst_res TCONF "$toolname not applicable for test $1"
+		return
+	fi
+	local chaincnt=0
+
+	local cmd="iptables -L -t filter"
+	tst_res TINFO "$cmd will list all rules in table filter"
+	$cmd > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$cmd failed to list rules"
+		cat tst_iptables.out
+		return
+	else
+		chaincnt=$(grep -c Chain tst_iptables.out)
+		if [ $chaincnt -lt 3 ]; then
+			tst_res TFAIL "$cmd failed to list rules"
+			cat tst_iptables.out
+			return
+		else
+			tst_res TINFO "$cmd lists rules"
+		fi
+	fi
+
+	local cmd="iptables -L -t nat"
+	tst_res TINFO "$cmd will list all rules in table nat"
+	$cmd > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$cmd failed to list rules"
+		cat tst_iptables.out
+		return
+	else
+		chaincnt=$(grep -c Chain tst_iptables.out)
+		if [ $chaincnt -lt 3 ]; then
+			tst_res TFAIL "$cmd failed to list rules"
+			cat tst_iptables.out
+			return
+		else
+			tst_res TINFO "$cmd lists rules"
+		fi
+	fi
+
+	local cmd="iptables -L -t mangle"
+	tst_res TINFO "$cmd will list all rules in table mangle"
+	$cmd > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$cmd failed to list rules"
+		cat tst_iptables.out
+		return
+	else
+		chaincnt=$(grep -c Chain tst_iptables.out)
+		if [ $chaincnt -lt 5 ]; then
+			tst_res TFAIL "$cmd failed to list rules"
+			cat tst_iptables.out
+		else
+			tst_res TINFO "$cmd lists rules"
+		fi
+	fi
+
+	tst_res TPASS "iptables -L lists rules"
+}
+
+test2()
+{
+	tst_res TINFO "Use $toolname to DROP packets from particular IP"
+	tst_res TINFO "Rule to block icmp from 127.0.0.1"
+
+	NFRUN -A INPUT -s 127.0.0.1 -p icmp -j DROP > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Pinging 127.0.0.1"
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
+		if [ $? -ne 0 ]; then
+			tst_res TFAIL \
+				 "$toolname did not block packets from loopback"
+			cat tst_iptables.err
+			return
+		else
+			tst_res TINFO "Ping 127.0.0.1 not successful"
+		fi
+	else
+		tst_res TFAIL "$toolname did not block icmp from 127.0.0.1"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Deleting icmp DROP from 127.0.0.1 rule"
+	NFRUN_REMOVE
+
+	tst_res TINFO "Pinging 127.0.0.1 again"
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname blocking loopback. This is expected" \
+			       "behaviour on certain distributions where" \
+			       "enabling firewall drops all packets by default"
+		cat tst_iptables.out
+		return
+	fi
+	tst_res TINFO "Ping succsess"
+	tst_res TPASS "$toolname can DROP packets from particular IP"
+}
+
+test3()
+{
+	tst_res TINFO "Use $toolname to REJECT ping request"
+	tst_res TINFO "Rule to reject ping request"
+
+	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -j \
+		 REJECT > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Pinging 127.0.0.1"
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
+		if [ $? -ne 0 ]; then
+			tst_res TFAIL "$toolname did not block ping request"
+			cat tst_iptables.err
+			return
+		else
+			tst_res TINFO "Ping 127.0.0.1 not successful"
+		fi
+	else
+		tst_res TFAIL "$toolname did not reject ping request"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Deleting icmp request REJECT rule"
+	NFRUN_REMOVE
+
+	tst_res TINFO "Pinging 127.0.0.1 again"
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname blocking ping requests. This is" \
+			      "expected behaviour on certain distributions" \
+			      "where enabling firewall drops all packets by" \
+			      "default"
+		cat tst_iptables.out
+		return
+	fi
+	tst_res TINFO "Ping succsess"
+	tst_res TPASS "$toolname can REJECT ping requests"
+}
+
+test4()
+{
+	local dport=45886
+	local logprefix="${TCID}$(date +%m%d%H%M%S):"
+
+	tst_res TINFO "Use $toolname to log packets to particular port"
+	tst_res TINFO "Rule to log tcp packets to particular port"
+
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport $dport -j LOG \
+		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "telnet 127.0.0.1 $dport"
+	telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		sleep 2
+		dmesg | grep "$logprefix" > tst_iptables.err 2>&1
+		if [ $? -ne 0 ]; then
+			tst_res TFAIL \
+				 "$toolname did not log packets to port $dport"
+			cat tst_iptables.err
+			return
+		else
+			tst_res TINFO "Packets to port $dport logged"
+		fi
+	else
+		tst_res TFAIL "telnet to 127.0.0.1 $dport should fail"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Deleting the rule to log"
+	NFRUN_REMOVE
+
+	tst_res TINFO "$toolname logging succsess"
+	tst_res TPASS "$toolname can log packets to particular port"
+}
+
+test5()
+{
+	local dport=0
+	local logprefix="${TCID}$(date +%m%d%H%M%S):"
+
+	tst_res TINFO "Use $toolname to log packets to multiple ports"
+	tst_res TINFO "Rule to log tcp packets to port 45801 - 45803"
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 --dport 45801:45803 -j LOG \
+		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Rule to log tcp packets to port 45804 - 45806"
+	NFRUN -A INPUT -p tcp -d 127.0.0.1 -m multiport --dports \
+		 45804,45806,45805 -j LOG --log-prefix "$logprefix" \
+		 > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	for dport in 45801 45802 45803 45804 45805 45806; do
+		tst_res TINFO "telnet 127.0.0.1 $dport"
+		telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
+		if [ $? -ne 0 ]; then
+			sleep 2
+			dmesg | grep "$logprefix" | grep "=$dport " \
+				> tst_iptables.err 2>&1
+			if [ $? -ne 0 ]; then
+				tst_res TFAIL "$toolname did not log packets" \
+					       "to port $dport"
+				cat tst_iptables.err
+				return
+			else
+				tst_res TINFO "Packets to port $dport logged"
+			fi
+		else
+			tst_res TFAIL "telnet to 127.0.0.1 $dport should fail"
+			cat tst_iptables.out
+			return
+		fi
+	done
+
+	tst_res TINFO "Flushing all rules"
+	NFRUN -F > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname did not flush all rules"
+		cat tst_iptables.out
+		return
+	fi
+	tst_res TINFO "$toolname logging succsess"
+	tst_res TPASS "$toolname can log packets to multiple ports"
+}
+
+test6()
+{
+	local logcnt=0
+	local logprefix="${TCID}$(date +%m%d%H%M%S):"
+
+	tst_res TINFO "Use $toolname to log ping request with limited rate"
+	tst_res TINFO "Rule to log ping request"
+
+	NFRUN -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -m \
+		 limit -j LOG --log-prefix "$logprefix" > tst_iptables.out 2>&1
+	if [ $? -ne 0 ]; then
+		tst_res TFAIL "$toolname command failed to append new rule"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "ping 127.0.0.1"
+	ping -c 10 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
+	if [ $? -eq 0 ]; then
+		sleep 2
+		logcnt=$(dmesg | grep -c "$logprefix")
+		if [ $logcnt -ne 5 ]; then
+			tst_res TFAIL "$toolname did not log packets with" \
+				      "limited rate"
+			cat tst_iptables.out
+			return
+		else
+			tst_res TINFO "ping requests logged with limited rate"
+		fi
+	else
+		tst_res TFAIL "ping to 127.0.0.1 failed. This is expected" \
+			      "behaviour on certain distributions where" \
+			      "enabling firewall drops all packets by default"
+		cat tst_iptables.out
+		return
+	fi
+
+	tst_res TINFO "Deleting the rule to log"
+	NFRUN_REMOVE
+
+	tst_res TINFO "$toolname limited logging succsess"
+	tst_res TPASS "$toolname can log packets with limited rate"
+}
diff --git a/testcases/network/iptables/iptables_tests.sh b/testcases/network/iptables/iptables_tests.sh
deleted file mode 100755
index d8b23283f..000000000
--- a/testcases/network/iptables/iptables_tests.sh
+++ /dev/null
@@ -1,366 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2001
-#
-#  Author:	Jan 20 2004 Hubert Lin <linux02NOSPAAAM@tw.ibm.com>
-#				       <hubertNOSPAAAM@symbio.com.tw>
-
-TST_CNT=6
-TST_SETUP="init"
-TST_TESTFUNC="test"
-TST_CLEANUP="cleanup"
-TST_NEEDS_TMPDIR=1
-TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="iptables grep ping telnet"
-
-. tst_test.sh
-
-init()
-{
-	tst_res TINFO "INIT: Inititalizing tests."
-
-	modprobe ip_tables
-	if [ $? -ne 0 ]; then
-		iptables -L > tst_iptables.out 2>&1
-		if [ $? -ne 0 ]; then
-			tst_brk TCONF "no iptables support in kernel."
-		fi
-	fi
-
-	tst_res TINFO "INIT: Flushing all rules."
-	iptables -F -t filter > tst_iptables.out 2>&1
-	iptables -F -t nat > tst_iptables.out 2>&1
-	iptables -F -t mangle > tst_iptables.out 2>&1
-}
-
-cleanup()
-{
-	lsmod | grep "ip_tables" > tst_iptables.out 2>&1
-	if [ $? -eq 0 ]; then
-		iptables -F -t filter > tst_iptables.out 2>&1
-		iptables -F -t nat > tst_iptables.out 2>&1
-		iptables -F -t mangle > tst_iptables.out 2>&1
-		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
-			 iptable_mangle iptable_nat ip_conntrack \
-			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
-			 nf_log_ipv4 nf_log_common nf_reject_ipv4 \
-			 nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack \
-			 > tst_iptables.out 2>&1
-	fi
-}
-
-test1()
-{
-	local chaincnt=0
-
-	local cmd="iptables -L -t filter"
-	tst_res TINFO "$cmd will list all rules in table filter."
-	$cmd > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "$cmd failed to list rules."
-		cat tst_iptables.out
-		return
-	else
-		chaincnt=$(grep -c Chain tst_iptables.out)
-		if [ $chaincnt -lt 3 ]; then
-			tst_res TFAIL "$cmd failed to list rules."
-			cat tst_iptables.out
-			return
-		else
-			tst_res TINFO "$cmd lists rules."
-		fi
-	fi
-
-	local cmd="iptables -L -t nat"
-	tst_res TINFO "$cmd will list all rules in table nat."
-	$cmd > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "$cmd failed to list rules."
-		cat tst_iptables.out
-		return
-	else
-		chaincnt=$(grep -c Chain tst_iptables.out)
-		if [ $chaincnt -lt 3 ]; then
-			tst_res TFAIL "$cmd failed to list rules."
-			cat tst_iptables.out
-			return
-		else
-			tst_res TINFO "$cmd lists rules."
-		fi
-	fi
-
-	local cmd="iptables -L -t mangle"
-	tst_res TINFO "$cmd will list all rules in table mangle."
-	$cmd > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "$cmd failed to list rules."
-		cat tst_iptables.out
-		return
-	else
-		chaincnt=$(grep -c Chain tst_iptables.out)
-		if [ $chaincnt -lt 5 ]; then
-			tst_res TFAIL "$cmd failed to list rules."
-			cat tst_iptables.out
-		else
-			tst_res TINFO "$cmd lists rules."
-		fi
-	fi
-
-	tst_res TPASS "iptables -L lists rules."
-}
-
-test2()
-{
-	tst_res TINFO "Use iptables to DROP packets from particular IP"
-	tst_res TINFO "Rule to block icmp from 127.0.0.1"
-
-	iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL \
-				 "iptables did not block packets from loopback"
-			cat tst_iptables.err
-			return
-		else
-			tst_res TINFO "Ping 127.0.0.1 not successful."
-		fi
-	else
-		tst_res TFAIL "iptables did not block icmp from 127.0.0.1"
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Deleting icmp DROP from 127.0.0.1 rule."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables blocking loopback. This is expected" \
-			       "behaviour on certain distributions where" \
-			       "enabling firewall drops all packets by default."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "Ping succsess"
-	tst_res TPASS "iptables can DROP packets from particular IP."
-}
-
-test3()
-{
-	tst_res TINFO "Use iptables to REJECT ping request."
-	tst_res TINFO "Rule to reject ping request."
-
-	iptables -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -j \
-		 REJECT > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL "iptables did not block ping request."
-			cat tst_iptables.err
-			return
-		else
-			tst_res TINFO "Ping 127.0.0.1 not successful."
-		fi
-	else
-		tst_res TFAIL "iptables did not reject ping request."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Deleting icmp request REJECT rule."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables blocking ping requests. This is" \
-			      "expected behaviour on certain distributions" \
-			      "where enabling firewall drops all packets by" \
-			      "default."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "Ping succsess"
-	tst_res TPASS "iptables can REJECT ping requests."
-}
-
-test4()
-{
-	local dport=45886
-	local logprefix="${TCID}$(date +%m%d%H%M%S):"
-
-	tst_res TINFO "Use iptables to log packets to particular port."
-	tst_res TINFO "Rule to log tcp packets to particular port."
-
-	iptables -A INPUT -p tcp -d 127.0.0.1 --dport $dport -j LOG \
-		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "telnet 127.0.0.1 $dport"
-	telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		sleep 2
-		dmesg | grep "$logprefix" > tst_iptables.err 2>&1
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL \
-				 "iptables did not log packets to port $dport"
-			cat tst_iptables.err
-			return
-		else
-			tst_res TINFO "Packets to port $dport logged."
-		fi
-	else
-		tst_res TFAIL "telnet to 127.0.0.1 $dport should fail."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Deleting the rule to log."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "iptables logging succsess"
-	tst_res TPASS "iptables can log packets to particular port."
-}
-
-test5()
-{
-	local dport=0
-	local logprefix="${TCID}$(date +%m%d%H%M%S):"
-
-	tst_res TINFO "Use iptables to log packets to multiple ports."
-	tst_res TINFO "Rule to log tcp packets to port 45801 - 45803."
-	iptables -A INPUT -p tcp -d 127.0.0.1 --dport 45801:45803 -j LOG \
-		 --log-prefix "$logprefix" > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Rule to log tcp packets to port 45804 - 45806."
-	iptables -A INPUT -p tcp -d 127.0.0.1 -m multiport --dports \
-		 45804,45806,45805 -j LOG --log-prefix "$logprefix" \
-		 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	for dport in 45801 45802 45803 45804 45805 45806; do
-		tst_res TINFO "telnet 127.0.0.1 $dport"
-		telnet 127.0.0.1 $dport > tst_iptables.out 2>&1
-		if [ $? -ne 0 ]; then
-			sleep 2
-			dmesg | grep "$logprefix" | grep "=$dport " \
-				> tst_iptables.err 2>&1
-			if [ $? -ne 0 ]; then
-				tst_res TFAIL "iptables did not log packets" \
-					       "to port $dport"
-				cat tst_iptables.err
-				return
-			else
-				tst_res TINFO "Packets to port $dport logged."
-			fi
-		else
-			tst_res TFAIL "telnet to 127.0.0.1 $dport should fail."
-			cat tst_iptables.out
-			return
-		fi
-	done
-
-	tst_res TINFO "Flushing all rules."
-	iptables -F > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not flush all rules."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "iptables logging succsess"
-	tst_res TPASS "iptables can log packets to multiple ports."
-}
-
-test6()
-{
-	local logcnt=0
-	local logprefix="${TCID}$(date +%m%d%H%M%S):"
-
-	tst_res TINFO "Use iptables to log ping request with limited rate."
-	tst_res TINFO "Rule to log ping request."
-
-	iptables -A INPUT -p icmp --icmp-type echo-request -d 127.0.0.1 -m \
-		 limit -j LOG --log-prefix "$logprefix" > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables command failed to append new rule."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "ping 127.0.0.1"
-	ping -c 10 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
-	if [ $? -eq 0 ]; then
-		sleep 2
-		logcnt=$(dmesg | grep -c "$logprefix")
-		if [ $logcnt -ne 5 ]; then
-			tst_res TFAIL "iptables did not log packets with" \
-				      "limited rate."
-			cat tst_iptables.out
-			return
-		else
-			tst_res TINFO "ping requests logged with limited rate."
-		fi
-	else
-		tst_res TFAIL "ping to 127.0.0.1 failed. This is expected" \
-			      "behaviour on certain distributions where" \
-			      "enabling firewall drops all packets by default."
-		cat tst_iptables.out
-		return
-	fi
-
-	tst_res TINFO "Deleting the rule to log."
-	iptables -D INPUT 1 > tst_iptables.out 2>&1
-	if [ $? -ne 0 ]; then
-		tst_res TFAIL "iptables did not remove the rule."
-		cat tst_iptables.out
-		return
-	fi
-	tst_res TINFO "iptables limited logging succsess"
-	tst_res TPASS "iptables can log packets with limited rate."
-}
-
-tst_run
diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
new file mode 100755
index 000000000..b3fde842f
--- /dev/null
+++ b/testcases/network/iptables/nft01.sh
@@ -0,0 +1,41 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_CNT=6
+TST_SETUP="do_setup"
+TST_TESTFUNC="test"
+TST_CLEANUP="do_cleanup"
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
+TST_NEEDS_DRIVERS="nf_tables"
+use_iptables=0
+
+. iptables_lib.sh
+. tst_test.sh
+
+cleanup_tables=0
+cleanup_chain=0
+
+do_setup()
+{
+	if ! nft list table ip filter > /dev/null 2>&1; then
+		ROD nft add table ip filter
+		cleanup_table=1
+	fi
+	if ! nft list chain ip filter INPUT > /dev/null 2>&1; then
+		ROD nft add chain ip filter INPUT '{ type filter hook input priority 0; }'
+		cleanup_chain=1
+	fi
+	init
+}
+
+do_cleanup()
+{
+	[ $cleanup_chain -eq 1 ] && nft delete chain ip filter INPUT >/dev/null 2>&1
+	[ $cleanup_table -eq 1 ] && nft delete table ip filter >/dev/null 2>&1
+	cleanup
+}
+
+tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
