Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA10310CFA
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CF1C3C7316
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 43B3B3C70F9
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8DF2A2013D8
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13D7EB0B6
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:10:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 Feb 2021 16:10:14 +0100
Message-Id: <20210205151015.7465-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205151015.7465-1-pvorel@suse.cz>
References: <20210205151015.7465-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] net/multicast: Remove duplicity
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../multicast/grp-operation/mcast-lib.sh       | 18 +++++++++++++++++-
 .../multicast/query-flood/mcast-queryfld01.sh  | 13 ++-----------
 .../multicast/query-flood/mcast-queryfld02.sh  | 14 ++++----------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
index 851aadd5b..555501df7 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2017-2018 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) International Business Machines Corp., 2006
 # Author: Petr Vorel <pvorel@suse.cz>
 #
@@ -141,3 +141,19 @@ do_multicast_test_join_leave()
 
 	tst_res TPASS "test is finished successfully"
 }
+
+do_multicast_test_join_single_socket()
+{
+	local extra="$1"
+	local prefix="$MCAST_IPV4_ADDR_PREFIX"
+	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
+
+	# Run a multicast join tool
+	local tmpfile=$$
+	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix \> $tmpfile
+	tst_res TINFO "joined $(grep groups $tmpfile)"
+
+	local params
+	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m"
+	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params $extra
+}
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
index faa1c08ef..e80026720 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2006 International Business Machines  Corp.
 # Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 #
 # Verify that the kernel is not crashed when joining a multicast group
@@ -18,18 +19,8 @@ do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of General Queries in $NS_DURATION seconds"
 
-	local prefix="$MCAST_IPV4_ADDR_PREFIX"
-	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
-
-	# Run a multicast join tool
-	local tmpfile=$$
-	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix \> $tmpfile
-	tst_res TINFO "joined $(grep groups $tmpfile)"
-
 	# Send General Query from the remote host
-	local params
-	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m"
-	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+	do_multicast_test_join_single_socket
 }
 
 tst_run
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
index 66012a6f3..8773bd86b 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2006 International Business Machines  Corp.
 # Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 #
 # Verify that the kernel is not crashed when joining a multicast group
@@ -19,18 +20,11 @@ do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group on a single socket, then receiving a large number of Multicast Address Specific Query in $NS_DURATION seconds"
 
-	local prefix="$MCAST_IPV4_ADDR_PREFIX"
-	[ "$TST_IPV6" ] && prefix="$MCAST_IPV6_ADDR_PREFIX"
-
-	# Run a multicast join tool
-	local tmpfile=$$
-	EXPECT_PASS $MCAST_LCMD -n 1 -p $prefix \> $tmpfile
-	tst_res TINFO "joined $(grep groups $tmpfile)"
+	local extra="-m $MCAST_IPV4_ADDR"
+	[ "$TST_IPV6" ] && extra="-D $MCAST_IPV6_ADDR"
 
 	# Send IGMP Multicast Address Specific Query from the remote host
-	local params="-m $MCAST_IPV4_ADDR"
-	[ "$TST_IPV6" ] && params="-S $(tst_ipaddr) -m -D $MCAST_IPV6_ADDR"
-	EXPECT_RHOST_PASS $MCAST_RCMD -t $NS_DURATION -r 0 $params
+	do_multicast_test_join_single_socket "$extra"
 }
 
 tst_run
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
