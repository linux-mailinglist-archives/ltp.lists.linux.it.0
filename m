Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 145EA2B5F48
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 13:43:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91CFA3C5F83
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 13:43:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 73DBE3C4F35
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 13:43:45 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8E3EA1A009AE
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 13:43:44 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 82652A0807;
 Tue, 17 Nov 2020 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605617022; bh=UAAIkTbm+/8PNvpgp3ValPmTa9y2SQFGWs4um9Z0sRg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=UKN/YbJCa8RifYu0ev/LgkTnULMwvh/FHdQ4c6sT4cNzm5TVZZ6YNLn0iV+jnMq0K
 y2nfsuf79/gDVY7FGJDG1TaDASz/Ef9w6tkLH/yo/k4HQUVRMp0f8VE2aIL46l6sus
 6Y7tezM/O1ePxhDCr1UxRHt339s9O0/yv89YGv2A=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Tue, 17 Nov 2020 13:43:20 +0100
Message-Id: <20201117124320.783802-3-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117124320.783802-1-lkml@jv-coder.de>
References: <20201117124320.783802-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 3/3] network/stress/route-change: Convert to new API
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
 runtest/net_stress.route                      |   2 +
 .../network/stress/route/route-redirect.sh    |  63 ++++++
 .../network/stress/route/route4-redirect      | 212 ------------------
 .../network/stress/route/route6-redirect      | 207 -----------------
 4 files changed, 65 insertions(+), 419 deletions(-)
 create mode 100644 testcases/network/stress/route/route-redirect.sh
 delete mode 100644 testcases/network/stress/route/route4-redirect
 delete mode 100644 testcases/network/stress/route/route6-redirect

diff --git a/runtest/net_stress.route b/runtest/net_stress.route
index b60e55bd6..5590ef023 100644
--- a/runtest/net_stress.route
+++ b/runtest/net_stress.route
@@ -5,6 +5,7 @@ route4-change-if route-change-if.sh
 route4-change-netlink-dst route-change-netlink-dst.sh
 route4-change-netlink-gw route-change-netlink-gw.sh
 route4-change-netlink-if route-change-netlink-if.sh
+route4-redirect route-redirect.sh
 
 route6-change-dst route-change-dst.sh -6
 route6-change-gw route-change-gw.sh -6
@@ -12,3 +13,4 @@ route6-change-if route-change-if.sh -6
 route6-change-netlink-dst route-change-netlink-dst.sh -6
 route6-change-netlink-gw route-change-netlink-gw.sh -6
 route6-change-netlink-if route-change-netlink-if.sh -6
+route6-redirect route-redirect.sh -6
diff --git a/testcases/network/stress/route/route-redirect.sh b/testcases/network/stress/route/route-redirect.sh
new file mode 100644
index 000000000..fb4612ee9
--- /dev/null
+++ b/testcases/network/stress/route/route-redirect.sh
@@ -0,0 +1,63 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify the kernel is not crashed when the route is modified by
+# ICMP Redirects frequently
+
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
+TST_TESTFUNC=do_test
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="ip"
+
+. tst_net.sh
+
+DST_HOST=""
+DST_PORT="7"
+
+do_setup()
+{
+	local lhost_ifname=$(tst_iface lhost)
+	local rhost_ifname=$(tst_iface rhost)
+	local rhost_net="$(tst_ipaddr_un -p 1)"
+	DST_HOST="$(tst_ipaddr_un 1 5)"
+
+	# Remove the link-local address of the remote host
+	tst_rhost_run -s -c "ip addr flush dev $rhost_ifname"
+
+	# Add route to the initial gateway
+	ip route add $rhost_net dev $lhost_ifname
+
+	# Make sure the sysctl value is set for accepting the redirect
+	sysctl -w net.ipv${TST_IPVER}.conf.${lhost_ifname}.accept_redirects=1 > /dev/null
+	[ ! "$TST_IPV6" ] && sysctl -w net.ipv4.conf.${lhost_ifname}.secure_redirects=0 > /dev/null
+
+	# Run the redirector utility at the remote host
+	tst_rhost_run -s -c "ns-icmp_redirector -I $rhost_ifname -b"
+}
+
+do_cleanup()
+{
+	# Kill the redirector utility
+	tst_rhost_run -c "killall -SIGHUP ns-icmp_redirector"
+}
+
+do_test()
+{
+	# Loop for changing the route
+	local cnt=0
+	while [ $cnt -lt $NS_TIMES ]; do
+		ns-udpsender -f $TST_IPVER -D $DST_HOST -p $DST_PORT -o -s 8
+		if [ $? -ne 0 ]; then
+			tst_res TBROK "Failed to run udp packet sender"
+		fi
+		: $((cnt += 1))
+	done
+
+	tst_res TPASS "Test finished successfully"
+}
+
+tst_run
diff --git a/testcases/network/stress/route/route4-redirect b/testcases/network/stress/route/route4-redirect
deleted file mode 100644
index 53df9abf2..000000000
--- a/testcases/network/stress/route/route4-redirect
+++ /dev/null
@@ -1,212 +0,0 @@
-#!/bin/sh
-
-################################################################################
-##                                                                            ##
-## Copyright (c) International Business Machines  Corp., 2006                 ##
-##                                                                            ##
-## This program is free software;  you can redistribute it and#or modify      ##
-## it under the terms of the GNU General Public License as published by       ##
-## the Free Software Foundation; either version 2 of the License, or          ##
-## (at your option) any later version.                                        ##
-##                                                                            ##
-## This program is distributed in the hope that it will be useful, but        ##
-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-## for more details.                                                          ##
-##                                                                            ##
-## You should have received a copy of the GNU General Public License          ##
-## along with this program;  if not, write to the Free Software               ##
-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-##                                                                            ##
-##                                                                            ##
-################################################################################
-#
-# File:
-#   route4-redirect
-#
-# Description:
-#   Verify the kernel is not crashed when the IPv4 route is modified by
-#   ICMP Redirects frequently
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	Apr 07 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
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
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-IPV4_NETWORK=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of for the tested network
-IPV4_NETMASK_NUM=24
-
-# Broadcast address of the tested network
-IPV4_BROADCAST=${IPV4_NETWORK}.255
-
-# Host portion of the IPv4 address
-LHOST_IPV4_HOST=${LHOST_IPV4_HOST:-"1"}	# src
-RHOST_IPV4_HOST="2"	# gateway
-
-# The destination network
-DST_NETWORK="10.10.0"   # destination network would be 10.10.0.0/24
-DST_HOST="5"
-DST_PORT="7"
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_cleanup
-#
-# DESCRIPTION:
-#   Recover the tested interfaces
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Kill the redirector utility
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_setup
-#
-# DESCRIPTION:
-#   Set the initial route and start icmp redirect on the remote host
-#
-# SET VALUES:
-#   rhost_ipv4addr      - IPv4 Address of the remote host
-#   lhost_ifname        - Interface name of the local host
-#   rhost_ifname        - Interface name of the remote host
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
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
-}
-
-
-
-#-----------------------------------------------------------------------
-#
-# FUNCTION:
-#   test_body
-#
-# DESCRIPTION:
-#   main code of the test
-#
-# Arguments:
-#   None
-#
-#-----------------------------------------------------------------------
-test_body()
-{
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
-}
-
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
diff --git a/testcases/network/stress/route/route6-redirect b/testcases/network/stress/route/route6-redirect
deleted file mode 100644
index e12c7c816..000000000
--- a/testcases/network/stress/route/route6-redirect
+++ /dev/null
@@ -1,207 +0,0 @@
-#!/bin/sh
-
-################################################################################
-##                                                                            ##
-## Copyright (c) International Business Machines  Corp., 2006                 ##
-##                                                                            ##
-## This program is free software;  you can redistribute it and#or modify      ##
-## it under the terms of the GNU General Public License as published by       ##
-## the Free Software Foundation; either version 2 of the License, or          ##
-## (at your option) any later version.                                        ##
-##                                                                            ##
-## This program is distributed in the hope that it will be useful, but        ##
-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
-## for more details.                                                          ##
-##                                                                            ##
-## You should have received a copy of the GNU General Public License          ##
-## along with this program;  if not, write to the Free Software               ##
-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
-##                                                                            ##
-##                                                                            ##
-################################################################################
-#
-# File:
-#   route6-redirect
-#
-# Description:
-#   Verify the kernel is not crashed when the route is modified by
-#   ICMP Redirects frequently
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	Apr 07 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
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
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-IPV6_NETWORK="fec0:1:1:1"
-
-# Netmask of for the tested network
-IPV6_NETMASK_NUM=64
-
-# Host portion of the IPv6 address
-LHOST_IPV6_HOST=":1"	# src
-RHOST_IPV6_HOST=":2"	# gateway
-
-# The destination network
-DST_NETWORK="fec0:100:100:100"   # destination network
-DST_HOST=":5"
-DST_PORT="7"
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_cleanup
-#
-# DESCRIPTION:
-#   Recover the tested interfaces
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Kill the redirector utility
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmp_redirector >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_setup
-#
-# DESCRIPTION:
-#   Set the initial route and start icmp redirect on the remote host
-#
-# SET VALUES:
-#   rhost_ipv6addr      - IPv6 Address of the remote host
-#   lhost_ifname        - Interface name of the local host
-#   rhost_ifname        - Interface name of the remote host
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
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
-}
-
-
-#-----------------------------------------------------------------------
-#
-# FUNCTION:
-#   test_body
-#
-# DESCRIPTION:
-#   main code of the test
-#
-# Arguments:
-#   None
-#
-#-----------------------------------------------------------------------
-test_body()
-{
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
-}
-
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
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
