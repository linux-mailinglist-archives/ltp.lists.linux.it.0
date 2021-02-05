Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF1310CFB
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31C463C731E
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:10:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4DD3A3C70FC
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BF3C14044B4
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:10:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC869B066
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:10:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 Feb 2021 16:10:13 +0100
Message-Id: <20210205151015.7465-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205151015.7465-1-pvorel@suse.cz>
References: <20210205151015.7465-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] net/multicast: Move API variables from setup to
 tests
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

It's more readable to have variables in the test,
than mixing it in the test and in mcast-lib.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../multicast/grp-operation/mcast-group-multiple-socket.sh    | 4 ++++
 .../stress/multicast/grp-operation/mcast-group-same-group.sh  | 4 ++++
 .../multicast/grp-operation/mcast-group-single-socket.sh      | 4 ++++
 .../multicast/grp-operation/mcast-group-source-filter.sh      | 4 ++++
 testcases/network/stress/multicast/grp-operation/mcast-lib.sh | 3 ---
 .../network/stress/multicast/packet-flood/mcast-pktfld01.sh   | 3 +++
 .../network/stress/multicast/packet-flood/mcast-pktfld02.sh   | 3 +++
 .../network/stress/multicast/query-flood/mcast-queryfld01.sh  | 2 ++
 .../network/stress/multicast/query-flood/mcast-queryfld02.sh  | 2 ++
 .../network/stress/multicast/query-flood/mcast-queryfld03.sh  | 2 ++
 .../network/stress/multicast/query-flood/mcast-queryfld04.sh  | 2 ++
 .../network/stress/multicast/query-flood/mcast-queryfld05.sh  | 2 ++
 .../network/stress/multicast/query-flood/mcast-queryfld06.sh  | 2 ++
 13 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
index 2780a8d7c..e4cafc27d 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-multiple-socket.sh
@@ -19,7 +19,11 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="do_setup"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_setup()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
index 01fc95a1a..28c68c807 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-same-group.sh
@@ -19,7 +19,11 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
index 6e26ff52d..780eaf13c 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-single-socket.sh
@@ -19,7 +19,11 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="do_setup"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_setup()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh b/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
index 65fff0f63..4c5a6e4c7 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-group-source-filter.sh
@@ -19,7 +19,11 @@
 #
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
index 52a90ca50..851aadd5b 100644
--- a/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
+++ b/testcases/network/stress/multicast/grp-operation/mcast-lib.sh
@@ -6,9 +6,6 @@
 #
 # Setup script for multicast stress tests.
 
-TST_CLEANUP="mcast_cleanup"
-TST_TESTFUNC="do_test"
-TST_NEEDS_TMPDIR=1
 . tst_net_stress.sh
 
 mcast_setup4()
diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
index 29798c84c..37af5d354 100755
--- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
+++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
@@ -8,7 +8,10 @@
 # a single socket, then receiving a large number of UDP packets at the socket
 
 TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 MCAST_LCMD="ns-mcast_receiver"
diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
index 2c356917a..330722124 100755
--- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
+++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
@@ -9,7 +9,10 @@
 # packets at each socket
 
 TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 MCAST_LCMD="ns-mcast_receiver"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
index d472a0c54..faa1c08ef 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld01.sh
@@ -10,6 +10,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
index 199a8a016..66012a6f3 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld02.sh
@@ -11,6 +11,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
index 2ea22605f..8ab9af544 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld03.sh
@@ -11,6 +11,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 SRC_ADDR_IPV4="10.10.10.1"
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
index dd341d7a3..5947562f1 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld04.sh
@@ -10,6 +10,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
index c73fca460..3c064842f 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld05.sh
@@ -11,6 +11,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 do_test()
diff --git a/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
index ee7b5016f..bda064f7d 100755
--- a/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
+++ b/testcases/network/stress/multicast/query-flood/mcast-queryfld06.sh
@@ -11,6 +11,8 @@
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="mcast_setup_normal"
+TST_CLEANUP="mcast_cleanup"
+TST_TESTFUNC="do_test"
 . mcast-lib.sh
 
 SRC_ADDR_IPV4=10.10.10.1
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
