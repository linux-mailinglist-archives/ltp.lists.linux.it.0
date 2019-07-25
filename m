Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7174C95
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:11:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC7523C1CF7
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:11:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 929813C1D19
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:10:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1633F6012DC
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:10:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29C67B024;
 Thu, 25 Jul 2019 11:10:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 25 Jul 2019 13:10:26 +0200
Message-Id: <20190725111027.18716-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725111027.18716-1-pvorel@suse.cz>
References: <20190725111027.18716-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] network/route: Rewrite route-change-gw into
 new API
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

* Drop route command (use just ip command), support both IPv4 and IPv6
* Use unused network range to avoid clash with real network
* Add verification with ping (previous version sent UDP datagram with
ns-udpsender, but didn't verify receiving it on rhost and didn't setup
rhost ip at all)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/net_stress.route                      |   4 +-
 .../network/stress/route/00_Descriptions.txt  |  18 +-
 .../network/stress/route/route-change-gw      |  38 +++
 .../network/stress/route/route4-change-gw     | 292 ------------------
 .../network/stress/route/route6-change-gw     | 292 ------------------
 5 files changed, 43 insertions(+), 601 deletions(-)
 create mode 100755 testcases/network/stress/route/route-change-gw
 delete mode 100644 testcases/network/stress/route/route4-change-gw
 delete mode 100644 testcases/network/stress/route/route6-change-gw

diff --git a/runtest/net_stress.route b/runtest/net_stress.route
index b6ea11c2e..0cc033e1a 100644
--- a/runtest/net_stress.route
+++ b/runtest/net_stress.route
@@ -3,13 +3,13 @@
 #
 
 route4-change-dst route-change-dst
-route4-change-gw route4-change-gw
+route4-change-gw route-change-gw
 route4-change-if route4-change-if
 route4-redirect route4-redirect
 route4-rmmod route4-rmmod
 
 route6-change-dst route-change-dst -6
-route6-change-gw route6-change-gw
+route6-change-gw route-change-gw -6
 route6-change-if route6-change-if
 route6-redirect route6-redirect
 route6-rmmod route6-rmmod
diff --git a/testcases/network/stress/route/00_Descriptions.txt b/testcases/network/stress/route/00_Descriptions.txt
index 518e5ce7f..2a98636ad 100644
--- a/testcases/network/stress/route/00_Descriptions.txt
+++ b/testcases/network/stress/route/00_Descriptions.txt
@@ -2,13 +2,9 @@ route-change-dst
 	Verify the IPv4/IPv6 is not broken when ip command changes route
 	destination many times
 
-route4-change-gw01
-	Verify the kernel is not crashed when the gateway of an IPv4 route is
-	changed frequently by route command
-
-route4-change-gw02
-	Verify the kernel is not crashed when the gateway of an IPv4 route is
-	changed frequently by ip command
+route-change-gw
+	Verify the IPv4/IPv6 is not broken when ip command changes route
+	gateway many times
 
 route4-change-if01
 	Verify the kernel is not crashed when the interface of an IPv4 route is
@@ -31,14 +27,6 @@ route4-rmmod02
 	then it is deleted by the removing network driver
 
 
-route6-change-gw01
-	Verify the kernel is not crashed when the gateway of an IPv6 route is
-	changed frequently by route command
-
-route6-change-gw02
-	Verify the kernel is not crashed when the gateway of an IPv6 route is
-	changed frequently by ip command
-
 route6-change-if01
 	Verify the kernel is not crashed when the interface of an IPv6 route is
 	changed frequently by route command
diff --git a/testcases/network/stress/route/route-change-gw b/testcases/network/stress/route/route-change-gw
new file mode 100755
index 000000000..025b5f2c2
--- /dev/null
+++ b/testcases/network/stress/route/route-change-gw
@@ -0,0 +1,38 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) International Business Machines Corp., 2006
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+
+# Change route gateway
+# lhost: 10.23.x.2, gw (on rhost): 10.23.x.1, rhost: 10.23.0.1
+
+TST_TESTFUNC="test_gw"
+. route-lib.sh
+
+setup()
+{
+	tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
+
+	rt="$(tst_ipaddr_un -m 0 0)"
+	lhost="$(tst_ipaddr_un 1 1)"
+	rhost="$(tst_ipaddr_un 0 1)"
+	tst_add_ipaddr -s -a $lhost
+	tst_add_ipaddr -s -a $rhost rhost
+}
+
+test_gw()
+{
+	local gw="$(tst_ipaddr_un 1 $(($1 + 1)))"
+	local iface="$(tst_iface)"
+
+	tst_res TINFO "testing route over gateway '$gw'"
+
+	tst_add_ipaddr -s -a $gw rhost
+	ROD ip route replace $rt dev $iface via $gw
+	EXPECT_PASS ping$TST_IPV6 -c1 -I $lhost $rhost
+	ROD ip route del $rt dev $iface via $gw
+	tst_del_ipaddr -s -a $gw rhost
+}
+
+tst_run
diff --git a/testcases/network/stress/route/route4-change-gw b/testcases/network/stress/route/route4-change-gw
deleted file mode 100644
index 791f98cc7..000000000
--- a/testcases/network/stress/route/route4-change-gw
+++ /dev/null
@@ -1,292 +0,0 @@
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
-#   route4-change-gw
-#
-# Description:
-#   Verify the kernel is not crashed when the gateway of an IPv4 route is
-#   changed frequently
-#    test01 - by route command
-#    test02 - by ip command
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	Mar 16 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../ ; pwd)`}
-export LTPROOT
-
-# Total number of the test case
-TST_TOTAL=2
-export TST_TOTAL
-
-# Default of the test case ID and the test case count
-TCID=route4-change-gw
-TST_COUNT=0
-export TCID
-export TST_COUNT
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
-RHOST_IPV4_HOST_TOP="10"	# gateway
-RHOST_IPV4_HOST_LAST=19
-
-# The destination network
-DST_NETWORK="10.10.0"	# destination network would be 10.10.0.0/24
-DST_HOST="5"
-DST_PORT="7"
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_setup
-#
-# DESCRIPTION:
-#   Make a IPv4 connectivity
-#
-# SET VALUES:
-#   rhost_ipv4addr	- IPv4 Address of the remote host
-#   lhost_ifname	- Interface name of the local host
-#   rhost_ifname	- Interface name of the remote host
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    TCID=route4-change-gw
-    TST_COUNT=0
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
-    # Initialize the interfaces of the remote host
-    initialize_if rhost ${LINK_NUM}
-
-    # Set IPv4 address to the interface of the remote host
-    rhost_part=$RHOST_IPV4_HOST_TOP
-    while [ $rhost_part -le $RHOST_IPV4_HOST_LAST ]; do
-	ret=`$LTP_RSH $RHOST '( PATH=/sbin:/usr/sbin:$PATH ; ip addr add '${IPV4_NETWORK}.${rhost_part}/${IPV4_NETMASK_NUM}' broadcast '${IPV4_NETWORK}'.255 dev '$rhost_ifname' ) > /dev/null ; echo $?'`
-	if [ $ret -ne 0 ]; then
-	    tst_resm TBROK "Failed to assign IP address to the interface at the remote host"
-	    exit $TST_TOTAL
-	fi
-	rhost_part=`expr $rhost_part + 1`
-    done
-}
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
-    killall -SIGHUP ns-udpsender >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
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
-#   $1: define the test type
-#       1 - route command case
-#       2 - ip command case
-#
-#-----------------------------------------------------------------------
-test_body()
-{
-    test_type=$1
-
-    TCID=route4-change-gw0${test_type}
-    TST_COUNT=$test_type
-
-    case $test_type in
-	1)
-	test_command="route"
-	;;
-	2)
-	test_command="ip"
-	;;
-	*)
-	tst_resm TBROK "unspecified case"
-	return 1
-	;;
-    esac
-
-    tst_resm TINFO "Verify the kernel is not crashed when the gateway of an IPv4 route is changed frequently by $test_command command in $NS_TIMES times"
-
-    # Initialize the interface of the local host
-    initialize_if lhost ${LINK_NUM}
-
-    # Assign IPv4 address to the interface of the local host
-    set_ipv4addr lhost ${LINK_NUM} ${IPV4_NETWORK} ${LHOST_IPV4_HOST}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to assign an IPv4 address at the local host"
-	return 1
-    fi
-
-    # Check the connectivity to the gateway
-    rhost_part=$RHOST_IPV4_HOST_TOP
-    check_icmpv4_connectivity $lhost_ifname ${IPV4_NETWORK}.${rhost_part}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Test Link $LINK_NUM is somthing wrong."
-	return 1
-    fi
-
-    # Set the variables regarding the destination host
-    dst_addr=${DST_NETWORK}.${DST_HOST}
-    dst_network=${DST_NETWORK}.0
-
-    # Set the first route
-    case $test_type in
-	1)
-	route add -net $dst_network netmask 255.255.255.0 gw ${IPV4_NETWORK}.${rhost_part} dev $lhost_ifname
-	;;
-	2)
-	ip route add ${dst_network}/24 via ${IPV4_NETWORK}.${rhost_part} dev $lhost_ifname
-	;;
-    esac
-
-    # Load the route with UDP traffic
-    ns-udpsender -f 4 -D $dst_addr -p $DST_PORT -b -s 1472
-    if [ $? -ne 0 ]; then
-	tst_resm TFAIL "Failed to run a UDP datagram sender"
-	return 1
-    fi
-
-    # Loop for changing the route
-    cnt=0
-    while [ $cnt -lt $NS_TIMES ]; do
-	pre_rhost_part=$rhost_part
-	rhost_part=`expr $rhost_part + 1`
-	if [ $rhost_part -gt $RHOST_IPV4_HOST_LAST ]; then
-	    rhost_part=$RHOST_IPV4_HOST_TOP
-	fi
-
-	case $test_type in
-	    1)
-	    route add -net $dst_network netmask 255.255.255.0 gw ${IPV4_NETWORK}.${rhost_part} dev $lhost_ifname
-	    route del -net $dst_network netmask 255.255.255.0 gw ${IPV4_NETWORK}.${pre_rhost_part} dev $lhost_ifname
-	    ;;
-	    2)
-	    ip route change ${dst_network}/24 via ${IPV4_NETWORK}.${rhost_part} dev $lhost_ifname
-	    ;;
-	esac
-	if [ $? -ne 0 ]; then
-	    tst_resm TFAIL "Failed to change the gateway to ${IPV4_NETWORK}.${rhost_part}"
-	    return 1
-	fi
-
-	# Rerun if udp datagram sender is dead
-	ps auxw | fgrep -v grep | grep ns-udpsender > /dev/null
-	if [ $? -ne 0 ]; then
-	    ns-udpsender -f 4 -D $dst_addr -p $DST_PORT -b -s 1472
-	    if [ $? -ne 0 ]; then
-		tst_resm TFAIL "Failed to run a UDP datagram sender"
-		return 1
-	    fi
-	fi
-
-	cnt=`expr $cnt + 1`
-    done
-
-    # Kill the udp datagram sender
-    killall -SIGHUP ns-udpsender >/dev/null 2>&1
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
-
-RC=0
-do_setup
-test_body 1 || RC=`expr $RC + 1`      # Case of route command
-test_body 2 || RC=`expr $RC + 1`      # Case of ip command
-do_cleanup
-
-exit $RC
diff --git a/testcases/network/stress/route/route6-change-gw b/testcases/network/stress/route/route6-change-gw
deleted file mode 100644
index 05e45b907..000000000
--- a/testcases/network/stress/route/route6-change-gw
+++ /dev/null
@@ -1,292 +0,0 @@
-#!/bin/sh
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
-#   route6-change-gw
-#
-# Description:
-#   Verify the kernel is not crashed when the gateway of an IPv6 route is
-#   changed frequently
-#    test01 - by route command
-#    test02 - by ip command
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	Mar 16 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../ ; pwd)`}
-export LTPROOT
-
-# Total number of the test case
-TST_TOTAL=2
-export TST_TOTAL
-
-# Default of the test case ID and the test case count
-TCID=route6-change-gw
-TST_COUNT=0
-export TCID
-export TST_COUNT
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
-LHOST_IPV6_HOST=":2"		# src
-RHOST_IPV6_HOST_TOP="10"	# gateway
-RHOST_IPV6_HOST_LAST="19"
-
-# The destination network
-DST_NETWORK="fd00:100:1:1"	# dest network would be fd00:100:1:1:::/64
-DST_HOST="5"
-DST_PORT="7"
-
-
-#-----------------------------------------------------------------------
-#
-# NAME:
-#   do_setup
-#
-# DESCRIPTION:
-#   Make a IPv6 connectivity
-#
-# SET VALUES:
-#   rhost_ipv6addr	- IPv6 Address of the remote host
-#   lhost_ifname	- Interface name of the local host
-#   rhost_ifname	- Interface name of the remote host
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    TCID=route6-change-gw
-    TST_COUNT=0
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
-    # Initialize the interfaces of the remote host
-    initialize_if rhost ${LINK_NUM}
-
-    # Set IPv6 address to the interface of the remote host
-    rhost_part=$RHOST_IPV6_HOST_TOP
-    rhost_part_hex=`printf "%x" $rhost_part`
-    while [ $rhost_part -le $RHOST_IPV6_HOST_LAST ]; do
-	rhost_part_hex=":`printf "%x" $rhost_part`"
-	add_ipv6addr rhost ${LINK_NUM} ${IPV6_NETWORK} ${rhost_part_hex}
-	if [ $? -ne 0 ]; then
-	    tst_resm TBROK "Failed to assign IP address to the interface at the remote host"
-	    exit $TST_TOTAL
-	fi
-	rhost_part=`expr $rhost_part + 1`
-    done
-}
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
-    killall -SIGHUP ns-udpsender >/dev/null 2>&1
-
-    # Initialize the interfaces
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
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
-#   $1: define the test type
-#       1 - route command case
-#       2 - ip command case
-#
-#-----------------------------------------------------------------------
-test_body()
-{
-    test_type=$1
-
-    TCID=route6-change-gw0${test_type}
-    TST_COUNT=$test_type
-
-    case $test_type in
-	1)
-	test_command="route"
-	;;
-	2)
-	test_command="ip"
-	;;
-	*)
-	tst_resm TBROK "unspecified case"
-	return 1
-	;;
-    esac
-
-    tst_resm TINFO "Verify the kernel is not crashed when the gateway of an IPv6 route is changed frequently by $test_command command in $NS_TIMES times"
-
-    # Initialize the interface of the local host
-    initialize_if lhost ${LINK_NUM}
-
-    # Assign IPv6 address to the interface of the local host
-    add_ipv6addr lhost ${LINK_NUM} ${IPV6_NETWORK} ${LHOST_IPV6_HOST}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to assign an IPv6 address at the local host"
-	return 1
-    fi
-
-    # Check the connectivity to the gateway
-    rhost_part=$RHOST_IPV6_HOST_TOP
-    rhost_part_hex=":`printf "%x" $rhost_part`"
-    check_icmpv6_connectivity $lhost_ifname ${IPV6_NETWORK}:${rhost_part_hex}
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Test Link $LINK_NUM is somthing wrong."
-	return 1
-    fi
-
-    # Set the variables regarding the destination host
-    dst_addr=${DST_NETWORK}::${DST_HOST}
-    dst_network=${DST_NETWORK}::
-
-    # Set the first route
-    case $test_type in
-	1)
-	route -A inet6 add ${dst_network}/64 gw ${IPV6_NETWORK}:${rhost_part_hex} dev $lhost_ifname
-	;;
-	2)
-	ip -f inet6 route add ${dst_network}/64 via ${IPV6_NETWORK}:${rhost_part_hex} dev $lhost_ifname
-	;;
-    esac
-
-    # Load the route with UDP traffic
-    ns-udpsender -f 6 -D $dst_addr -p $DST_PORT -b -s 1452
-    if [ $? -ne 0 ]; then
-	tst_resm TFAIL "Failed to run a UDP datagram sender"
-	return 1
-    fi
-
-    # Loop for changing the route
-    cnt=0
-    while [ $cnt -lt $NS_TIMES ]; do
-	pre_rhost_part_hex=$rhost_part_hex
-	rhost_part=`expr $rhost_part + 1`
-	if [ $rhost_part -gt $RHOST_IPV6_HOST_LAST ]; then
-	    rhost_part=$RHOST_IPV6_HOST_TOP
-	fi
-	rhost_part_hex=":`printf "%x" $rhost_part`"
-
-	case $test_type in
-	    1)
-	    route -A inet6 add ${dst_network}/64 gw ${IPV6_NETWORK}:${rhost_part_hex} dev $lhost_ifname
-	    route -A inet6 del ${dst_network}/64 gw ${IPV6_NETWORK}:${pre_rhost_part_hex} dev $lhost_ifname
-	    ;;
-	    2)
-	    ip -f inet6 route change ${dst_network}/64 via ${IPV6_NETWORK}:${rhost_part_hex} dev $lhost_ifname
-	    ;;
-	esac
-	if [ $? -ne 0 ]; then
-	    tst_resm TFAIL "Failed to change the gateway to ${IPV6_NETWORK}.${rhost_part}"
-	    return 1
-	fi
-
-	# Rerun if udp datagram sender is dead
-	ps auxw | fgrep -v grep | grep ns-udpsender > /dev/null
-	if [ $? -ne 0 ]; then
-	    ns-udpsender -f 4 -D $dst_addr -p $DST_PORT -o -s 1472
-	    if [ $? -ne 0 ]; then
-		tst_resm TFAIL "Failed to run a UDP datagram sender"
-		return 1
-	    fi
-	fi
-
-	cnt=`expr $cnt + 1`
-    done
-
-    # Kill the udp datagram sender
-    killall -SIGHUP ns-udpsender >/dev/null 2>&1
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
-
-RC=0
-do_setup
-test_body 1 || RC=`expr $RC + 1`      # Case of route command
-test_body 2 || RC=`expr $RC + 1`      # Case of ip command
-do_cleanup
-
-exit $RC
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
