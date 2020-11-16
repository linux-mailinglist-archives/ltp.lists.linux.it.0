Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363D2B43EF
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:46:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AE8E3C5D2F
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:46:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 639743C5D9E
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:46:26 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D9721600438
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:46:25 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 74955A0807;
 Mon, 16 Nov 2020 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605530784; bh=QjXTdwFrP7JI33K9YF+ZjlOaJpb32OQRjw55P4ncMk0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=oPqD4LPi9fmK6KiMvy7u/KVp4kBjKe2Vfi/Qs2pzrCpt84+5at3j4QOqvHPWZ5D2l
 SWbVmlEgPu26wQCw8VEz9HUdQ2k+6Z4t4hGiukbvk0E/yjKuHr02/rwryBWrAscV4d
 d8LNTICmtnZNU2ani1HJhu0PGf0QqEjXl0JIOl7c=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 13:46:11 +0100
Message-Id: <20201116124611.16919-4-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116124611.16919-1-lkml@jv-coder.de>
References: <20201116124611.16919-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 3/3] network/stress/route: Convert to tst_net.sh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../network/stress/route/route4-redirect      | 155 +++++-------------
 .../network/stress/route/route6-redirect      | 143 ++++------------
 2 files changed, 74 insertions(+), 224 deletions(-)

diff --git a/testcases/network/stress/route/route4-redirect b/testcases/network/stress/route/route4-redirect
index 53df9abf2..8c0b09347 100644
--- a/testcases/network/stress/route/route4-redirect
+++ b/testcases/network/stress/route/route4-redirect
@@ -42,26 +42,10 @@
 #trace_logic=${trace_logic:-"set -x"}
 $trace_logic
 
-# The test case ID, the test case count and the total number of test case
-TCID=route4-redirect01
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Test description
-tst_resm TINFO "Verify the kernel is not crashed when the IPv4 route is modified by  ICMP Redirects frequently"
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# The number of times where route is changed
-NS_TIMES=${NS_TIMES:-10000}
+TST_TESTFUNC=test_body
+TST_NEEDS_ROOT=1
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
 
 # The number of the test link where tests run
 LINK_NUM=${LINK_NUM:-0}
@@ -69,14 +53,7 @@ LINK_NUM=${LINK_NUM:-0}
 # Network portion of the IPv4 address
 IPV4_NETWORK=${IPV4_NETWORK:-"10.0.0"}
 
-# Netmask of for the tested network
-IPV4_NETMASK_NUM=24
-
-# Broadcast address of the tested network
-IPV4_BROADCAST=${IPV4_NETWORK}.255
-
 # Host portion of the IPv4 address
-LHOST_IPV4_HOST=${LHOST_IPV4_HOST:-"1"}	# src
 RHOST_IPV4_HOST="2"	# gateway
 
 # The destination network
@@ -84,24 +61,12 @@ DST_NETWORK="10.10.0"   # destination network would be 10.10.0.0/24
 DST_HOST="5"
 DST_PORT="7"
 
+. tst_net.sh
 
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_cleanup
-#
-# DESCRIPTION:
-#   Recover the tested interfaces
-#
-#-----------------------------------------------------------------------
 do_cleanup()
 {
-    # Kill the redirector utility
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
+	# Kill the redirector utility
+	tst_rhost_run -c "killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1"
 }
 
 
@@ -113,55 +78,25 @@ do_cleanup()
 # DESCRIPTION:
 #   Set the initial route and start icmp redirect on the remote host
 #
-# SET VALUES:
-#   rhost_ipv4addr      - IPv4 Address of the remote host
-#   lhost_ifname        - Interface name of the local host
-#   rhost_ifname        - Interface name of the remote host
-#
 #-----------------------------------------------------------------------
 do_setup()
 {
-    # Make sure to clean up
-    do_cleanup
-
-    # Get the Interface name of local host
-    lhost_ifname=`get_ifname lhost ${LINK_NUM}`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    # Get the Interface name of remote host
-    rhost_ifname=`get_ifname rhost ${LINK_NUM}`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Remove the link-local address of the remote host
-    sleep 3
-    $LTP_RSH $RHOST "ip addr flush dev $rhost_ifname" > /dev/null
-
-    # Assign IPv4 address to the interface of the local host
-    set_ipv4addr lhost ${LINK_NUM} ${IPV4_NETWORK} ${LHOST_IPV4_HOST}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to assign an IPv4 address at the local host"
-	return 1
-    fi
-
-    # Add route to the initial gateway
-    route add -net ${DST_NETWORK}.0 netmask 255.255.255.0 gw ${IPV4_NETWORK}.${RHOST_IPV4_HOST} dev $lhost_ifname
-
-    # Make sure the sysctl value is set for accepting the redirect
-    sysctl -w net.ipv4.conf.${lhost_ifname}.accept_redirects=1 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.secure_redirects=0 >/dev/null
-
-    # Run the redirector utility at the remote host
-    ret=`$LTP_RSH $RHOST "${LTPROOT}/testcases/bin/ns-icmp_redirector -I $rhost_ifname -b ; "'echo $?'`
-    if [ $ret -ne 0 ]; then
-	tst_resm TBROK "Failed to run icmp redirector at the remote host"
-	exit $TST_TOTAL
-    fi
+	local lhost_ifname=$(tst_iface lhost ${LINK_NUM})
+	local rhost_ifname=$(tst_iface rhost ${LINK_NUM})
+
+	# Remove the link-local address of the remote host
+	sleep 3
+	tst_rhost_run -s -c "ip addr flush dev $rhost_ifname"
+
+	# Add route to the initial gateway
+	route add -net ${DST_NETWORK}.0 netmask 255.255.255.0 gw ${IPV4_NETWORK}.${RHOST_IPV4_HOST} dev $lhost_ifname
+
+	# Make sure the sysctl value is set for accepting the redirect
+	sysctl -w net.ipv4.conf.${lhost_ifname}.accept_redirects=1 >/dev/null
+	sysctl -w net.ipv4.conf.${lhost_ifname}.secure_redirects=0 >/dev/null
+
+	# Run the redirector utility at the remote host
+	tst_rhost_run -s -c "ns-icmp_redirector -I $rhost_ifname -b"
 }
 
 
@@ -180,33 +115,21 @@ do_setup()
 #-----------------------------------------------------------------------
 test_body()
 {
-    # Loop for changing the route
-    cnt=0
-    while [ $cnt -lt $NS_TIMES ]; do
-	ns-udpsender -f 4 -D ${DST_NETWORK}.${DST_HOST} -p $DST_PORT -o -s 8
-	if [ $? -ne 0 ]; then
-	    tst_resm TBROK "Failed to run udp packet sender"
-	    return 1
-	fi
-	cnt=`expr $cnt + 1`
-    done
-
-    tst_resm TPASS "Test is finished correctly."
-    return 0
+	# Test description
+	tst_resm TINFO "Verify the kernel is not crashed when the IPv4 route is modified by  ICMP Redirects frequently"
+	# Loop for changing the route
+	cnt=0
+	while [ $cnt -lt $NS_TIMES ]; do
+		ns-udpsender -f 4 -D ${DST_NETWORK}.${DST_HOST} -p $DST_PORT -o -s 8
+		if [ $? -ne 0 ]; then
+			tst_res TBROK "Failed to run udp packet sender"
+			return 1
+		fi
+		cnt=`expr $cnt + 1`
+	done
+
+	tst_res TPASS "Test is finished correctly."
+	return 0
 }
 
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-# Exit Value:
-#   The number of the failure
-#
-#-----------------------------------------------------------------------
-RC=0
-do_setup
-test_body || RC=`expr $RC + 1`
-do_cleanup
-
-exit $RC
+tst_run
diff --git a/testcases/network/stress/route/route6-redirect b/testcases/network/stress/route/route6-redirect
index e12c7c816..8ecbdd626 100644
--- a/testcases/network/stress/route/route6-redirect
+++ b/testcases/network/stress/route/route6-redirect
@@ -42,26 +42,11 @@
 #trace_logic=${trace_logic:-"set -x"}
 $trace_logic
 
-# The test case ID, the test case count and the total number of test case
-TCID=route6-redirect01
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Test description
-tst_resm TINFO "Verify the kernel is not crashed when the IPv6 route is modified by  ICMP Redirects frequently"
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# The number of times where route is changed
-NS_TIMES=${NS_TIMES:-10000}
+TST_TESTFUNC=test_body
+TST_NEEDS_ROOT=1
+TST_IPV6=1
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
 
 # The number of the test link where tests run
 LINK_NUM=${LINK_NUM:-0}
@@ -81,24 +66,11 @@ DST_NETWORK="fec0:100:100:100"   # destination network
 DST_HOST=":5"
 DST_PORT="7"
 
+. tst_net.sh
 
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_cleanup
-#
-# DESCRIPTION:
-#   Recover the tested interfaces
-#
-#-----------------------------------------------------------------------
 do_cleanup()
 {
-    # Kill the redirector utility
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
+	tst_rhost_run -c "killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1"
 }
 
 
@@ -110,54 +82,25 @@ do_cleanup()
 # DESCRIPTION:
 #   Set the initial route and start icmp redirect on the remote host
 #
-# SET VALUES:
-#   rhost_ipv6addr      - IPv6 Address of the remote host
-#   lhost_ifname        - Interface name of the local host
-#   rhost_ifname        - Interface name of the remote host
-#
 #-----------------------------------------------------------------------
 do_setup()
 {
-    # Make sure to cleanup the test environment
-    do_cleanup
-
-    # Get the Interface name of local host
-    lhost_ifname=`get_ifname lhost ${LINK_NUM}`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    # Get the Interface name of remote host
-    rhost_ifname=`get_ifname rhost ${LINK_NUM}`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Remove the link-local address of the remote host
-    sleep 5
-    $LTP_RSH $RHOST "ip addr flush dev $rhost_ifname" > /dev/null
-
-    # Assign IPv6 address to the interface of the local host
-    add_ipv6addr lhost ${LINK_NUM} ${IPV6_NETWORK} ${LHOST_IPV6_HOST}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to assign an IPv6 address at the local host"
-	return 1
-    fi
-
-    # Add route to the initial gateway
-    route -A inet6 add ${DST_NETWORK}::/64 gw fe80:${RHOST_IPV6_HOST} dev $lhost_ifname
-
-    # Make sure the sysctl value is set for accepting the redirect
-    sysctl -w net.ipv6.conf.${lhost_ifname}.accept_redirects=1 >/dev/null
-
-    # Run the redirector utility at the remote host
-    ret=`$LTP_RSH $RHOST "${LTPROOT}/testcases/bin/ns-icmp_redirector -I $rhost_ifname -b ; "'echo $?'`
-    if [ $ret -ne 0 ]; then
-	tst_resm TBROK "Failed to run icmp redirector at the remote host"
-	exit $TST_TOTAL
-    fi
+	local lhost_ifname=$(tst_iface lhost ${LINK_NUM})
+	local rhost_ifname=$(tst_iface rhost ${LINK_NUM})
+	
+	# Remove the link-local address of the remote host
+	sleep 3
+	tst_rhost_run -s -c "ip addr flush dev $rhost_ifname"
+	tst_rhost_run -s -c "ip addr add ${IPV6_NETWORK}:${LHOST_IPV6_HOST}/${IPV6_NETMASK_NUM} dev ${rhost_ifname}"
+
+	# Add route to the initial gateway
+	route -A inet6 add ${DST_NETWORK}::/${IPV6_NETMASK_NUM} gw fe80:${RHOST_IPV6_HOST} dev $lhost_ifname
+
+	# Make sure the sysctl value is set for accepting the redirect
+	sysctl -w net.ipv6.conf.${lhost_ifname}.accept_redirects=1 >/dev/null
+
+	# Run the redirector utility at the remote host
+	tst_rhost_run -s -c "ns-icmp_redirector -I $rhost_ifname -b"
 }
 
 
@@ -175,33 +118,17 @@ do_setup()
 #-----------------------------------------------------------------------
 test_body()
 {
-    # Loop for changing the route
-    cnt=0
-    while [ $cnt -lt $NS_TIMES ]; do
-	ns-udpsender -f 6 -D ${DST_NETWORK}:${DST_HOST} -p $DST_PORT -o -s 8
-	if [ $? -ne 0 ]; then
-	    tst_resm TBROK "Failed to run udp packet sender"
-	    return 1
-	fi
-	cnt=`expr $cnt + 1`
-    done
-
-    tst_resm TPASS "Test is finished correctly."
-    return 0
+	# Loop for changing the route
+	cnt=0
+	while [ $cnt -lt $NS_TIMES ]; do
+		ns-udpsender -f 6 -D ${DST_NETWORK}:${DST_HOST} -p $DST_PORT -o -s 8
+		if [ $? -ne 0 ]; then
+			tst_brk TBROK "Failed to run udp packet sender"
+		fi
+		cnt=`expr $cnt + 1`
+	done
+
+	tst_res TPASS "Test is finished correctly."
 }
 
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-# Exit Value:
-#   The number of the failure
-#
-#-----------------------------------------------------------------------
-RC=0
-do_setup
-test_body || RC=`expr $RC + 1`
-do_cleanup
-
-exit $RC
+tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
