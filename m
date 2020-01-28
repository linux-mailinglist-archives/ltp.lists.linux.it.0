Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72914BD75
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 17:07:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B78E73C2530
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 17:07:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0A4753C2462
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 17:07:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DAFAC1A013B1
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 17:07:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E0D7AC92;
 Tue, 28 Jan 2020 16:07:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 17:07:35 +0100
Message-Id: <20200128160735.26241-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128160735.26241-1-pvorel@suse.cz>
References: <20200128160735.26241-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] rpc01.sh: Rewrite into new shell API
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

Added rpc_lib.sh to share portmap or rpcbind check.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/rpc/basic_tests/Makefile    |  1 +
 .../network/rpc/basic_tests/rpc01/rpc01.sh    | 50 +++++++------------
 testcases/network/rpc/basic_tests/rpc_lib.sh  | 16 ++++++
 .../rpc/basic_tests/rpcinfo/rpcinfo01.sh      | 11 +---
 4 files changed, 36 insertions(+), 42 deletions(-)
 create mode 100644 testcases/network/rpc/basic_tests/rpc_lib.sh

diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
index 66e9d5675..7862e41e5 100644
--- a/testcases/network/rpc/basic_tests/Makefile
+++ b/testcases/network/rpc/basic_tests/Makefile
@@ -21,6 +21,7 @@
 #
 
 top_srcdir		?= ../../../..
+INSTALL_TARGETS	:= rpc_lib.sh
 
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/network/rpc/basic_tests/rpc01/rpc01.sh b/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
index 7cc69f0fa..b666b1347 100755
--- a/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
+++ b/testcases/network/rpc/basic_tests/rpc01/rpc01.sh
@@ -1,29 +1,15 @@
 #!/bin/sh
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2017 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2000
-#
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation; either version 2 of
-# the License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it would be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program. If not, see <http://www.gnu.org/licenses/>.
-
-TCID="rpc01"
-TST_TOTAL=6
-TST_CLEANUP=do_cleanup
+# Copyright (c) International Business Machines Corp., 2000
 
-TST_USE_LEGACY_API=1
-. tst_net.sh
+TST_TESTFUNC=do_test
+TST_SETUP=do_setup
+TST_CLEANUP=do_cleanup
+. rpc_lib.sh
 
-NUMLOOPS=${NUMLOOPS:=3}
-DATAFILES=${DATAFILES:="file.1 file.2"}
+NUMLOOPS=${NUMLOOPS:-3}
+DATAFILES="${DATAFILES:-file.1 file.2}"
 
 do_cleanup()
 {
@@ -32,32 +18,30 @@ do_cleanup()
 
 do_setup()
 {
-	tst_resm TINFO "start rpc_server"
-	rpc_server
+	check_portmap_rpcbind
 
-	tst_resm TINFO "wait for server to be registered"
+	tst_res TINFO "start rpc_server"
+	ROD rpc_server
+
+	tst_res TINFO "wait for server to be registered"
 	for i in $(seq 1 30); do
 		rpcinfo -T udp $(tst_ipaddr) 2000333 10 >/dev/null 2>&1 && break
-		[ "$i" -eq 30 ] && tst_brkm TBROK "server not registered"
+		[ "$i" -eq 30 ] && tst_brk TBROK "server not registered"
 		tst_sleep 100ms
 	done
 }
 
 do_test()
 {
-	local thost="$(tst_ipaddr)"
+	tst_res TINFO "starting client process"
 
-	tst_resm TINFO "starting client process"
 	local cnt=1
 	while [ $cnt -le $NUMLOOPS ]; do
 		for f in $DATAFILES; do
-			EXPECT_RHOST_PASS rpc1 -s $thost -f $LTP_DATAROOT/$f
+			EXPECT_RHOST_PASS rpc1 -s $(tst_ipaddr) -f $TST_DATAROOT/$f
 		done
 		cnt=$(($cnt + 1))
 	done
 }
 
-do_setup
-do_test
-
-tst_exit
+tst_run
diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
new file mode 100644
index 000000000..6d53f07da
--- /dev/null
+++ b/testcases/network/rpc/basic_tests/rpc_lib.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+
+. tst_net.sh
+
+check_portmap_rpcbind()
+{
+	tst_res TINFO "Checking for portmap or rpcbind"
+
+	if pgrep portmap > /dev/null; then
+		PORTMAPPER="portmap"
+	else
+		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
+			tst_brk TCONF "portmap or rpcbind is not running"
+	fi
+}
diff --git a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
index 2d1d4e7ec..fd33e1533 100755
--- a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
+++ b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
@@ -6,18 +6,11 @@
 TST_TESTFUNC=do_test
 TST_SETUP=do_setup
 TST_NEEDS_TMPDIR=1
-. tst_net.sh
+. rpc_lib.sh
 
 do_setup()
 {
-	tst_res TINFO "Checking for portmap or rpcbind"
-
-	if pgrep portmap > /dev/null; then
-		PORTMAPPER="portmap"
-	else
-		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
-			tst_brk TCONF "portmap or rpcbind is not running"
-	fi
+	check_portmap_rpcbind
 
 	# Create file with 1 tcp and 1 udp line. Use for variable assignments.
 	rpcinfo -p $(tst_ipaddr) | grep tcp | sed -n 2p > rpc_out
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
