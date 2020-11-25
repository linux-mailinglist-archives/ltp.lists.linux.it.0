Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12D2C38B8
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 06:35:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914033C4E43
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 06:35:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AA9A23C4E35
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 06:35:25 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DF3DA6009F6
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 06:35:23 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A377CA0A7F;
 Wed, 25 Nov 2020 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1606282520; bh=mhL5S5/+KDgD6fupXV90HD0POjj+Pj7UIBV1UX9Yq9w=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=t/a7rfi1qHPHdVeMae/oUly8Elm4T9n31s4NQ5rDu8vefjRGjegxIrVPxUgHofo7v
 sVjw4lG/sVf+jPhPkBDb20Dm2qd4YOq4VVlA+VEA4ZuuQdnAdJjsaXqgkUP8zgdN6K
 2DoGpBKoydn40gSqjqocqaAGZtwp7ZAuuzYoCblA=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed, 25 Nov 2020 06:34:58 +0100
Message-Id: <20201125053459.3314021-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125053459.3314021-1-lkml@jv-coder.de>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 2/3] network/stress/multicast/query-flood: Convert
 to new API
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
 runtest/net_stress.multicast                  |  12 +
 .../multicast/query-flood/mcast-queryfld01.sh |  37 +++
 .../multicast/query-flood/mcast-queryfld02.sh |  38 +++
 .../multicast/query-flood/mcast-queryfld03.sh |  46 ++++
 .../multicast/query-flood/mcast-queryfld04.sh |  38 +++
 .../multicast/query-flood/mcast-queryfld05.sh |  57 +++++
 .../multicast/query-flood/mcast-queryfld06.sh |  65 ++++++
 .../multicast/query-flood/mcast4-queryfld01   | 199 ----------------
 .../multicast/query-flood/mcast4-queryfld02   | 202 ----------------
 .../multicast/query-flood/mcast4-queryfld03   | 208 -----------------
 .../multicast/query-flood/mcast4-queryfld04   | 202 ----------------
 .../multicast/query-flood/mcast4-queryfld05   | 213 -----------------
 .../multicast/query-flood/mcast4-queryfld06   | 219 ------------------
 .../multicast/query-flood/mcast6-queryfld01   | 197 ----------------
 .../multicast/query-flood/mcast6-queryfld02   | 199 ----------------
 .../multicast/query-flood/mcast6-queryfld03   | 205 ----------------
 .../multicast/query-flood/mcast6-queryfld04   | 199 ----------------
 .../multicast/query-flood/mcast6-queryfld05   | 209 -----------------
 .../multicast/query-flood/mcast6-queryfld06   | 213 -----------------
 19 files changed, 293 insertions(+), 2465 deletions(-)
 create mode 100755 testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
 create mode 100644 testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
 create mode 100644 testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
 create mode 100644 testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
 create mode 100644 testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
 create mode 100644 testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld01
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld02
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld03
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld04
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld05
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast4-queryfld06
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld01
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld02
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld03
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld04
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld05
 delete mode 100644 testcases/network/stress/multicast/query-flood/mcast6-queryfld06

diff --git a/runtest/net_stress.multicast b/runtest/net_stress.multicast
index fff5133f6..0d61db289 100644
--- a/runtest/net_stress.multicast
+++ b/runtest/net_stress.multicast
@@ -8,6 +8,12 @@ mcast4-group-same-group mcast-group-same-group
 mcast4-group-source-filter mcast-group-source-filter
 mcast4-pktfld01 mcast-pktfld01.sh
 mcast4-pktfld02 mcast-pktfld02.sh
+mcast4-queryfld01 mcast-queryfld01.sh
+mcast4-queryfld02 mcast-queryfld02.sh
+mcast4-queryfld03 mcast-queryfld03.sh
+mcast4-queryfld04 mcast-queryfld04.sh
+mcast4-queryfld05 mcast-queryfld05.sh
+mcast4-queryfld06 mcast-queryfld06.sh
 
 mcast6-group-single-socket mcast-group-single-socket -6
 mcast6-group-multiple-socket mcast-group-multiple-socket -6
@@ -15,3 +21,9 @@ mcast6-group-same-group mcast-group-same-group -6
 mcast6-group-source-filter mcast-group-source-filter -6
 mcast6-pktfld01 mcast-pktfld01.sh -6
 mcast6-pktfld02 mcast-pktfld02.sh -6
+mcast6-queryfld01 mcast-queryfld01.sh -6
+mcast6-queryfld02 mcast-queryfld02.sh -6
+mcast6-queryfld03 mcast-queryfld03.sh -6
+mcast6-queryfld04 mcast-queryfld04.sh -6
+mcast6-queryfld05 mcast-queryfld05.sh -6
+mcast6-queryfld06 mcast-queryfld06.sh -6
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
new file mode 100755
index 000000000..e54499864
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
@@ -0,0 +1,37 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining a multicast group
+# on a single socket, then receiving a large number of General Queries
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of General Queries in $NS_DURATION seconds"
+
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+	# Send General Query from the remote host
+	local params
+	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m"
+	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
new file mode 100644
index 000000000..f1f2d062c
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining a multicast group
+# on a single socket, then receiving a large number of Multicast Address
+# Specific Query
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of Multicast Address Specific Query in $NS_DURATION seconds"
+
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+	# Send IGMP Multicast Address Specific Query from the remote host
+	local params="-m $MCAST_IPV4_ADDR"
+	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m -D $MCAST_IPV6_ADDR"
+	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
new file mode 100644
index 000000000..b15b273c5
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining a multicast group
+# on a single socket, then receiving a large number of Multicast Address
+# and Source Specific Queries
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+SRC_ADDR_IPV4=10.10.10.1
+SRC_ADDR_IPV6=fec0:100:100:100::1
+FILTER_MODE="include"
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of Multicast Address and Source Specific Queries in $NS_DURATION seconds"
+
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	local src_addr="$SRC_ADDR_IPV4"
+	if [ "$TST_IPV6" ]; then
+		prefix="$MCAST_IPV6_ADDR_PREFIX"
+		src_addr="$SRC_ADDR_IPV6"
+	fi
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix -s $src_addr -F $FILTER_MODE \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+    # Send Multicast Address and Source Specific Queries from the remote host
+	local params="-m $MCAST_IPV4_ADDR -s $src_addr"
+	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m -D $MCAST_IPV6_ADDR -a $src_addr"
+	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
new file mode 100644
index 000000000..ede04980a
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining multiple multicast
+# groups on separate socket, then receiving a large number of General Queries
+
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate socket, then receiving a large number of General Queries in $NS_DURATION seconds"
+
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n $MCASTNUM_NORMAL -p $prefix \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+	# Send General Queries from the remote host
+	local params
+	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m"
+	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
new file mode 100644
index 000000000..7db63f124
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
@@ -0,0 +1,57 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining multiple 
+# multicast groups on separate sockets, then receiving a large number of
+# Multicast Address Specific Queries
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of Multicast Address Specific Queries in $NS_DURATION seconds"
+
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n $MCASTNUM_NORMAL -p $prefix \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+	# Send IGMP Multicast Address Specific Query from the remote host
+	local n=0
+	while [ $n -lt $MCASTNUM_NORMAL ]; do
+		# Define the multicast address
+		if [ "$TST_IPV6" ]; then
+    		local n_hex=$(printf "%x" $n)
+    		local addr=${MCAST_IPV6_ADDR_PREFIX}:${n_hex}
+		else
+			local x=$((n / 254))
+			local y=$((n % 254 + 1))
+			local addr=${MCAST_IPV4_ADDR_PREFIX}.${x}.${y}
+		fi
+
+		local params="-m $addr"
+		[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m -D $addr"
+		tst_rhost_run -c "$MCAST_RCMD -t $NS_DURATION -r 0 -b $params"
+
+		: $((n += 1))
+	done
+
+	sleep $NS_DURATION
+
+	tst_res TPASS "Test finished successfully"
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
new file mode 100644
index 000000000..3745f12fb
--- /dev/null
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
@@ -0,0 +1,65 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2006 International Business Machines  Corp.
+# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Author: Mitsuru Chinen <mitch@jp.ibm.com>
+#
+# Verify that the kernel is not crashed when joining multiple 
+# multicast groups on separate sockets, then receiving a large number of
+# Multicast Address and Source Specific Queries
+
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+. mcast-lib.sh
+
+SRC_ADDR_IPV4=10.10.10.1
+SRC_ADDR_IPV6=fec0:100:100:100::1
+FILTER_MODE="include"
+
+do_setup()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
+do_test()
+{
+	tst_res TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of Multicast Address and Source Specific Queries in $NS_DURATION seconds"
+
+    local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	local src_addr="$SRC_ADDR_IPV4"
+	if [ "$TST_IPV6" ]; then
+		prefix="$MCAST_IPV6_ADDR_PREFIX"
+		src_addr="$SRC_ADDR_IPV6"
+	fi
+    
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n $MCASTNUM_NORMAL -p $prefix -s $src_addr -F $FILTER_MODE \> $tmpfile
+    tst_res TINFO "joined $(grep groups $tmpfile)"
+
+    # Send Multicast Address Specific Queries from the remote host
+    local n=0
+    while [ $n -lt $MCASTNUM_NORMAL ]; do
+		# Define the multicast address
+		if [ "$TST_IPV6" ]; then
+    		local n_hex=$(printf "%x" $n)
+    		local addr=${MCAST_IPV6_ADDR_PREFIX}:${n_hex}
+		else
+			local x=$((n / 254))
+			local y=$((n % 254 + 1))
+			local addr=${MCAST_IPV4_ADDR_PREFIX}.${x}.${y}
+		fi
+
+	    local params="-m $addr -s $src_addr"
+	    [ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m -D $addr -a $src_addr"
+        tst_rhost_run -c "$MCAST_RCMD -t $NS_DURATION -r 0 -b $params"
+
+        : $((n += 1))
+    done
+
+    sleep $NS_DURATION
+
+    tst_res TPASS "Test finished successfully"
+}
+
+tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld01 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld01
deleted file mode 100644
index 992cf423e..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld01
+++ /dev/null
@@ -1,199 +0,0 @@
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
-#   mcast4-queryfld01
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv4 multicast group
-#   on a single socket, then receiving a large number of General Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld01
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv4 multicast group on a single socket, then receiving a large number of General Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP General Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -t $NS_DURATION -r 0' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start IGMP querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld02 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld02
deleted file mode 100644
index b731e0218..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld02
+++ /dev/null
@@ -1,202 +0,0 @@
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
-#   mcast4-queryfld02
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv4 multicast group
-#   on a single socket, then receiving a large number of Multicast Address
-#   Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld02
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-# Multicast Address
-MCAST_ADDR=224.10.0.1	# If you modify this, please refer ns-mcast_join.c
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv4 multicast group on a single socket, then receiving a large number of Multicast Address Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP Multicast Address Specific Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -m $MCAST_ADDR -t $NS_DURATION -r 0' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start IGMP querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld03 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld03
deleted file mode 100644
index 568178b32..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld03
+++ /dev/null
@@ -1,208 +0,0 @@
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
-#   mcast4-queryfld03
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv4 multicast group
-#   on a single socket, then receiving a large number of Multicast Address
-#   and Source Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld03
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-# Multicast Address
-MCAST_ADDR=224.10.0.1	# If you modify this, please refer ns-mcast_join.c
-
-# Source Address
-SRC_ADDR=10.10.10.1
-
-# Filter Mode
-FILTER_MODE="include"
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv4 multicast group on a single socket, then receiving a large number of Multicast Address and Source Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX -s $SRC_ADDR -F $FILTER_MODE >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP Multicast Address and Source Specific Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -m $MCAST_ADDR -s $SRC_ADDR -t $NS_DURATION -r 0' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start IGMP querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld04 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld04
deleted file mode 100644
index f89393ffc..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld04
+++ /dev/null
@@ -1,202 +0,0 @@
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
-#   mcast4-queryfld04
-#
-# Description:
-#   Verify that the kernel is not crashed when joining plural IPv4 multicast
-#   groups on separate socket, then receiving a large number of General Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld04
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv4 multicast groups on separate sockets, then receiving a large number of General Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP General Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -t $NS_DURATION -r 0' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start IGMP querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld05 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld05
deleted file mode 100644
index 6d73027a6..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld05
+++ /dev/null
@@ -1,213 +0,0 @@
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
-#   mcast4-queryfld05
-#
-# Description:
-#   Verify that the kernel is not crashed when joining joining plural IPv4
-#   multicast groups on separate socket, then receiving a large number of
-#   Multicast Address Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld05
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv4 multicast groups on separate sockets, then receiving a large number of Multicast Address Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX > /dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP Multicast Address Specific Query from the remote host
-querier_num=0
-while [ $querier_num -lt $MCASTNUM_NORMAL ]; do
-    # Define the multicast address
-    x=`expr $querier_num \/ 254`
-    y=`expr $querier_num % 254 + 1`
-    if [ $x -gt 254 ]; then
-	tst_resm TINFO "The number of the connection is less than $querier_num"
-	break
-    fi
-    mcast_addr=${MCAST_ADDR_PREFIX}.${x}.${y}
-
-    $LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -m $mcast_addr -t $NS_DURATION -r 0 -b
-
-    querier_num=`expr $querier_num + 1`
-done
-sleep $NS_DURATION
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-do_cleanup
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast4-queryfld06 b/testcases/network/stress/multicast/query-flood/mcast4-queryfld06
deleted file mode 100644
index b45162045..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast4-queryfld06
+++ /dev/null
@@ -1,219 +0,0 @@
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
-#   mcast4-queryfld06
-#
-# Description:
-#   Verify that the kernel is not crashed when joining joining plural IPv4
-#   multicast groups on separate socket, then receiving a large number of
-#   Multicast Address and Source Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast4-queryfld06
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv4 address
-NETWORK_PART=${IPV4_NETWORK:-"10.0.0"}
-
-# Netmask of the IPv4 network
-NETWORK_MASK=24
-
-# Host portion of the IPv4 address
-LHOST_HOST_PART=${LHOST_IPV4_HOST:-"2"}     # local host
-RHOST_HOST_PART=${RHOST_IPV4_HOST:-"1"}     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=224.10
-
-# Source Address
-SRC_ADDR=10.10.10.1
-
-# Filter Mode
-FILTER_MODE="include"
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-igmp_querier >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv4 addresses to the interfaces
-    set_ipv4addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    set_ipv4addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv4 address of the local/remote host
-    lhost_addr="${NETWORK_PART}.${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}.${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv4_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv4 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv4.igmp_max_memberships=20 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv4.igmp_max_msf=10 >/dev/null
-    sysctl -w net.ipv4.conf.${lhost_ifname}.force_igmp_version=0 >/dev/null
-    sysctl -w net.ipv4.conf.all.force_igmp_version=0 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv4 multicast groups on separate sockets, then receiving a large number of Multicast Address and Source Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 4 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX -s $SRC_ADDR -F $FILTER_MODE > /dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send IGMP Multicast Address Specific Query from the remote host
-querier_num=0
-while [ $querier_num -lt $MCASTNUM_NORMAL ]; do
-    # Define the multicast address
-    x=`expr $querier_num \/ 254`
-    y=`expr $querier_num % 254 + 1`
-    if [ $x -gt 254 ]; then
-	tst_resm TINFO "The number of the connection is less than $querier_num"
-	break
-    fi
-    mcast_addr=${MCAST_ADDR_PREFIX}.${x}.${y}
-
-    $LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-igmp_querier -I $rhost_ifname -m $mcast_addr -s $SRC_ADDR -t $NS_DURATION -r 0 -b
-
-    querier_num=`expr $querier_num + 1`
-done
-sleep $NS_DURATION
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-do_cleanup
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld01 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld01
deleted file mode 100644
index 8c09d4897..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld01
+++ /dev/null
@@ -1,197 +0,0 @@
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
-#   mcast6-queryfld01
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv6 multicast
-#   group on a single socket, then receiving a large number of General Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 7 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld01
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"	# local host
-RHOST_HOST_PART=":1"	# remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv6 multicast group on a single socket, then receiving a large number of General Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD General Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -r 0 -t $NS_DURATION' ; echo $?'`
-
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start MLD querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld02 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld02
deleted file mode 100644
index 17cdae75d..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld02
+++ /dev/null
@@ -1,199 +0,0 @@
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
-#   mcast6-queryfld02
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv6 multicast group
-#   on a single socket, then receiving a large number of Multicast Address
-#   Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 7 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld02
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"	# local host
-RHOST_HOST_PART=":1"	# remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-# Multicast Address
-MCAST_ADDR=ff0e::1	# If you modify this, please refer ns-mcast_join.c
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv6 multicast group on a single socket, then receiving a large number of Multicast Address Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD Multicast Address Specific Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -D $MCAST_ADDR -r 0 -t $NS_DURATION' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start MLD querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld03 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld03
deleted file mode 100644
index bac7726a9..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld03
+++ /dev/null
@@ -1,205 +0,0 @@
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
-#   mcast6-queryfld03
-#
-# Description:
-#   Verify that the kernel is not crashed when joining an IPv6 multicast group
-#   on a single socket, then receiving a large number of Multicast Address
-#   and Source Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 1 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld03
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"     # local host
-RHOST_HOST_PART=":1"     # remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-# Multicast Address
-MCAST_ADDR=ff0e::1	# If you modify this, please refer ns-mcast_join.c
-
-# Source Address
-SRC_ADDR=fec0:100:100:100::1
-
-# Filter Mode
-FILTER_MODE="include"
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining an IPv6 multicast group on a single socket, then receiving a large number of Multicast Address and Source Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n 1 -p $MCAST_ADDR_PREFIX -s $SRC_ADDR -F $FILTER_MODE >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD Multicast Address and Source Specific Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -D $MCAST_ADDR -a $SRC_ADDR -r 0 -t $NS_DURATION' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start MLD querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld04 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld04
deleted file mode 100644
index cd56d4b40..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld04
+++ /dev/null
@@ -1,199 +0,0 @@
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
-#   mcast6-queryfld04
-#
-# Description:
-#   Verify that the kernel is not crashed when joining plural IPv6 multicast
-#   groups on separate socket, then receiving a large number of General Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 7 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld04
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"	# local host
-RHOST_HOST_PART=":1"	# remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv6 multicast groups on separate sockets, then receiving a large number of General Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX >/dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD General Query from the remote host
-ret=`$LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -r 0 -t $NS_DURATION' ; echo $?'`
-if [ $ret -ne 0 ]; then
-    tst_resm TBROK "Failed to start MLD querier"
-    exit 1
-fi
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld05 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld05
deleted file mode 100644
index 84c2ee109..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld05
+++ /dev/null
@@ -1,209 +0,0 @@
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
-#   mcast6-queryfld05
-#
-# Description:
-#   Verify that the kernel is not crashed when joining joining plural IPv6
-#   multicast groups on separate socket, then receiving a large number of
-#   Multicast Address Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 7 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld05
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"	# local host
-RHOST_HOST_PART=":1"	# remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv6 multicast groups on separate sockets, then receiving a large number of Multicast Address Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX > /dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD Multicast Address Specific Query from the remote host
-querier_num=0
-while [ $querier_num -lt $MCASTNUM_NORMAL ]; do
-    # Define the multicast address
-    if [ $querier_num -gt 65535 ]; then
-	tst_resm TINFO "The number of the querier is less than 65535"
-	break
-    fi
-    querier_num_hex=`printf "%x" $querier_num`
-    mcast_addr=${MCAST_ADDR_PREFIX}:${querier_num_hex}
-
-    $LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -D $mcast_addr -r 0 -t $NS_DURATION -b
-
-    querier_num=`expr $querier_num + 1`
-done
-sleep $NS_DURATION
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-do_cleanup
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
diff --git a/testcases/network/stress/multicast/query-flood/mcast6-queryfld06 b/testcases/network/stress/multicast/query-flood/mcast6-queryfld06
deleted file mode 100644
index d94a78efe..000000000
--- a/testcases/network/stress/multicast/query-flood/mcast6-queryfld06
+++ /dev/null
@@ -1,213 +0,0 @@
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
-#   mcast6-queryfld06
-#
-# Description:
-#   Verify that the kernel is not crashed when joining joining plural IPv6
-#   multicast groups on separate socket, then receiving a large number of
-#   Multicast Address and Source Specific Query
-#
-# Setup:
-#   See testcases/network/stress/README
-#
-# Author:
-#   Mitsuru Chinen <mitch@jp.ibm.com>
-#
-# History:
-#	May 7 2006 - Created (Mitsuru Chinen)
-#
-#-----------------------------------------------------------------------
-# Uncomment line below for debug output.
-#trace_logic=${trace_logic:-"set -x"}
-$trace_logic
-
-# The test case ID, the test case count and the total number of test case
-TCID=mcast6-queryfld06
-TST_TOTAL=1
-TST_COUNT=1
-export TCID
-export TST_COUNT
-export TST_TOTAL
-
-# Make sure the value of LTPROOT
-LTPROOT=${LTPROOT:-`(cd ../../../../.. ; pwd)`}
-export LTPROOT
-
-# Check the environmanet variable
-. check_envval || exit $TST_TOTAL
-
-# Dulation of the test [sec]
-NS_DURATION=${NS_DURATION:-3600}	# 1 hour
-
-# Number of the multicast to join
-MCASTNUM_NORMAL=${MCASTNUM_NORMAL:-20}
-
-# The number of the test link where tests run
-LINK_NUM=${LINK_NUM:-0}
-
-# Network portion of the IPv6 address
-NETWORK_PART="fec0:1:1:1"
-
-# Host portion of the IPv6 address
-LHOST_HOST_PART=":2"	# local host
-RHOST_HOST_PART=":1"	# remote host
-
-# Prefix of the Multicast Address
-MCAST_ADDR_PREFIX=ff0e:
-
-# Source Address
-SRC_ADDR=fec0:100:100:100::1
-
-# Filter Mode
-FILTER_MODE="include"
-
-#-----------------------------------------------------------------------
-#
-# Function: do_cleanup
-#
-# Description:
-#   Recover the system configuration
-#
-#-----------------------------------------------------------------------
-do_cleanup()
-{
-    # Make sure to kill the multicast receiver and sender
-    killall -SIGHUP ns-mcast_join >/dev/null 2>&1
-    $LTP_RSH $RHOST killall -SIGHUP ns-icmpv6_sender >/dev/null 2>&1
-
-    # Clean up each interface
-    initialize_if lhost ${LINK_NUM}
-    initialize_if rhost ${LINK_NUM}
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Function: do_setup
-#
-# Description:
-#   Configure the ssystem for the test
-#
-#-----------------------------------------------------------------------
-do_setup()
-{
-    # Initialize the system configuration
-    do_cleanup
-
-    # Call do_cleanup function before exit
-    trap do_cleanup 0
-
-    # name of interface of the local/remote host
-    lhost_ifname=`get_ifname lhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the local host"
-	exit $TST_TOTAL
-    fi
-
-    rhost_ifname=`get_ifname rhost $LINK_NUM`
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to get the interface name at the remote host"
-	exit $TST_TOTAL
-    fi
-
-    # Set IPv6 addresses to the interfaces
-    add_ipv6addr lhost $LINK_NUM $NETWORK_PART $LHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the local host"
-	exit 1
-    fi
-
-    add_ipv6addr rhost $LINK_NUM $NETWORK_PART $RHOST_HOST_PART
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to add any IP address at the remote host"
-	exit 1
-    fi
-
-    # IPv6 address of the local/remote host
-    lhost_addr="${NETWORK_PART}:${LHOST_HOST_PART}"
-    rhost_addr="${NETWORK_PART}:${RHOST_HOST_PART}"
-    rhost_linklocal="fe80:${RHOST_HOST_PART}"
-
-    # Make sure the connectvity
-    check_icmpv6_connectivity $lhost_ifname $rhost_addr
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "There is no IPv6 connectivity."
-	exit 1
-    fi
-
-    # Make sure the sysctl values
-    sysctl -w net.ipv6.conf.all.force_mld_version=0 >/dev/null
-    if [ $? -ne 0 ]; then
-	tst_resm TBROK "Failed to set the sysctl value regarding multicast"
-	exit $TST_TOTAL
-    fi
-
-    sysctl -w net.ipv6.conf.${lhost_ifname}.force_mld_version=0 >/dev/null
-    sysctl -w net.ipv6.mld_max_msf=10 >/dev/null
-}
-
-
-#-----------------------------------------------------------------------
-#
-# Main
-#
-#
-
-# Test description
-tst_resm TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv6 multicast groups on separate sockets, then receiving a large number of Multicast Address and Source Specific Query in $NS_DURATION [sec]"
-
-do_setup
-
-# Run a multicast join tool
-ns-mcast_join -f 6 -I $lhost_ifname -n $MCASTNUM_NORMAL -p $MCAST_ADDR_PREFIX -s $SRC_ADDR -F $FILTER_MODE > /dev/null
-if [ $? -ne 0 ]; then
-    tst_resm TBROK "Failed to start multicast joining tool Please check the environment"
-    exit 1
-fi
-
-# Send MLD Multicast Address Specific Query from the remote host
-querier_num=0
-while [ $querier_num -lt $MCASTNUM_NORMAL ]; do
-    if [ $querier_num -gt 65535 ]; then
-	tst_resm TINFO "The number of the querier is less than 65535"
-	break
-    fi
-    querier_num_hex=`printf "%x" $querier_num`
-    mcast_addr=${MCAST_ADDR_PREFIX}:${querier_num_hex}
-
-    $LTP_RSH $RHOST ${LTPROOT}/testcases/bin/ns-icmpv6_sender -I $rhost_ifname -S $rhost_linklocal -m -D $mcast_addr -a $SRC_ADDR -r 0 -t $NS_DURATION -b
-    querier_num=`expr $querier_num + 1`
-done
-sleep $NS_DURATION
-
-#-----------------------------------------------------------------------
-#
-# Clean up
-#
-
-do_cleanup
-tst_resm TPASS "Test is finished successfully."
-
-exit 0
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
