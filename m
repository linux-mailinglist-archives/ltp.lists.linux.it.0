Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 945CD310CFC
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AC193C7327
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 869F63C70F9
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 904632013DB
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC5BDAC43
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:10:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 Feb 2021 16:10:12 +0100
Message-Id: <20210205151015.7465-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] net/multicast: Create mcast_setup_normal()
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

to reduce duplicity
+ define TST_SETUP in tests

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../grp-operation/mcast-group-multiple-socket.sh         | 1 +
 .../multicast/grp-operation/mcast-group-same-group.sh    | 6 +-----
 .../multicast/grp-operation/mcast-group-single-socket.sh | 1 +
 .../multicast/grp-operation/mcast-group-source-filter.sh | 6 +-----
 .../network/stress/multicast/grp-operation/mcast-lib.sh  | 6 +++++-
 .../stress/multicast/packet-flood/mcast-pktfld01.sh      | 9 +++------
 .../stress/multicast/packet-flood/mcast-pktfld02.sh      | 9 +++------
 .../stress/multicast/query-flood/mcast-queryfld01.sh     | 6 +-----
 .../stress/multicast/query-flood/mcast-queryfld02.sh     | 6 +-----
 .../stress/multicast/query-flood/mcast-queryfld03.sh     | 6 +-----
 .../stress/multicast/query-flood/mcast-queryfld04.sh     | 6 +-----
 .../stress/multicast/query-flood/mcast-queryfld05.sh     | 6 +-----
 .../stress/multicast/query-flood/mcast-queryfld06.sh     | 8 ++------
 13 files changed, 22 insertions(+), 54 deletions(-)

diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
index 7b79b42df..2780a8d7c 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
@@ -19,6 +19,7 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_SETUP="do_setup"
 . mcast-lib.sh
 
 do_setup()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
index e10f16c09..01fc95a1a 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
@@ -19,13 +19,9 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining and leaving the same IPv$TST_IPVER multicast group on $MCASTNUM_NORMAL sockets in $NS_TIMES times"
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
index ff58152cb..6e26ff52d 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
@@ -19,6 +19,7 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_SETUP="do_setup"
 . mcast-lib.sh
 
 do_setup()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
index df70344da..65fff0f63 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
@@ -19,13 +19,9 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining and leaving the same IPv$TST_IPVER multicast group with a different source filters on $MCASTNUM_NORMAL sockets in $NS_TIMES times"
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
index 381ab6bdf..52a90ca50 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
@@ -6,7 +6,6 @@
 #
 # Setup script for multicast stress tests.
 
-TST_SETUP="do_setup"
 TST_CLEANUP="mcast_cleanup"
 TST_TESTFUNC="do_test"
 TST_NEEDS_TMPDIR=1
@@ -59,6 +58,11 @@ mcast_setup()
 	[ "$TST_IPV6" ] && mcast_setup6 || mcast_setup4 $max
 }
 
+mcast_setup_normal()
+{
+	mcast_setup $MCASTNUM_NORMAL
+}
+
 mcast_cleanup4()
 {
 	[ -n "$SYSFS_IGMP_MAX_MEMBERSHIPS" ] && sysctl -q -w net.ipv4.igmp_max_memberships=$SYSFS_IGMP_MAX_MEMBERSHIPS
diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
index 57eddb7f2..29798c84c 100755
--- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
+++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
@@ -8,14 +8,11 @@
 # a single socket, then receiving a large number of UDP packets at the socket
 
 TST_NEEDS_ROOT=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-	MCAST_LCMD=ns-mcast_receiver
-	MCAST_RCMD=ns-udpsender
-}
+MCAST_LCMD="ns-mcast_receiver"
+MCAST_RCMD="ns-udpsender"
 
 do_test()
 {
diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
index 76d184995..2c356917a 100755
--- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
+++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
@@ -9,14 +9,11 @@
 # packets at each socket
 
 TST_NEEDS_ROOT=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-	MCAST_LCMD=ns-mcast_receiver
-	MCAST_RCMD=ns-udpsender
-}
+MCAST_LCMD="ns-mcast_receiver"
+MCAST_RCMD="ns-udpsender"
 
 do_test()
 {
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
index c88f079a1..d472a0c54 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
@@ -9,13 +9,9 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of General Queries in $NS_DURATION seconds"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
index 1c977d18b..199a8a016 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
@@ -10,13 +10,9 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of Multicast Address Specific Query in $NS_DURATION seconds"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
index 9d3d318d0..2ea22605f 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
@@ -10,17 +10,13 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
 SRC_ADDR_IPV4="10.10.10.1"
 SRC_ADDR_IPV6="fec0:100:100:100::1"
 FILTER_MODE="include"
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of Multicast Address and Source Specific Queries in $NS_DURATION seconds"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
index 6e276901e..dd341d7a3 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
@@ -9,13 +9,9 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate socket, then receiving a large number of General Queries in $NS_DURATION seconds"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
index d6879841d..c73fca460 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
@@ -10,13 +10,9 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of Multicast Address Specific Queries in $NS_DURATION seconds"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
index 43798f231..ee7b5016f 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
@@ -10,22 +10,18 @@
 
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
+TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
 SRC_ADDR_IPV4=10.10.10.1
 SRC_ADDR_IPV6=fec0:100:100:100::1
 FILTER_MODE="include"
 
-do_setup()
-{
-	mcast_setup $MCASTNUM_NORMAL
-}
-
 do_test()
 {
 	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of Multicast Address and Source Specific Queries in $NS_DURATION seconds"
 
-    local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
 	local src_addr="$SRC_ADDR_IPV4"
 	if [ "$TST_IPV6" ]; then
 		prefix="$MCAST_IPV6_ADDR_PREFIX"
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
