Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D96FD14BD74
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 17:07:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 719C53C2473
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 17:07:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BBD403C2462
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 17:07:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 796192011A1
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 17:07:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA1C7ACC9;
 Tue, 28 Jan 2020 16:07:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 17:07:34 +0100
Message-Id: <20200128160735.26241-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] rpcinfo01.sh: Rewrite into new shell API
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
 .../rpc/basic_tests/rpcinfo/rpcinfo01.sh      | 53 ++++++-------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
index afdfdb351..2d1d4e7ec 100755
--- a/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
+++ b/testcases/network/rpc/basic_tests/rpcinfo/rpcinfo01.sh
@@ -1,54 +1,38 @@
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
+# Copyright (c) International Business Machines Corp., 2000
 
-TCID="rpcinfo01"
-TST_TOTAL=16
-TST_CLEANUP=tst_rmdir
-
-TST_USE_LEGACY_API=1
+TST_TESTFUNC=do_test
+TST_SETUP=do_setup
+TST_NEEDS_TMPDIR=1
 . tst_net.sh
 
 do_setup()
 {
-	tst_resm TINFO "Checking for portmap or rpcbind"
+	tst_res TINFO "Checking for portmap or rpcbind"
 
 	if pgrep portmap > /dev/null; then
 		PORTMAPPER="portmap"
 	else
 		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
-			tst_brkm TCONF "portmap or rpcbind is not running"
+			tst_brk TCONF "portmap or rpcbind is not running"
 	fi
 
-	tst_tmpdir
-
 	# Create file with 1 tcp and 1 udp line. Use for variable assignments.
 	rpcinfo -p $(tst_ipaddr) | grep tcp | sed -n 2p > rpc_out
 	rpcinfo -p $(tst_ipaddr) | grep udp | sed -n 2p >> rpc_out
 
-	wc -l rpc_out | grep "2" > /dev/null || \
-		tst_brkm TBROK "Not enough programs registered on $(tst_ipaddr)"
+	wc -l rpc_out | grep -q "2" || \
+		tst_brk TBROK "Not enough programs registered on $(tst_ipaddr)"
 
 	# Using "rpc_out" file created above, assign variables for rpcinfo opts
-	TPNUM=`grep tcp rpc_out | awk '{print $1}'`
-	TVNUM=`grep tcp rpc_out | awk '{print $2}'`
-	TCPNAME=`grep tcp rpc_out | awk '{print $5}'`
-	UPNUM=`grep udp rpc_out | awk '{print $1}'`
-	UVNUM=`grep udp rpc_out | awk '{print $2}'`
-	UDPNAME=`grep udp rpc_out | awk '{print $5}'`
+	TPNUM=$(grep tcp rpc_out | awk '{print $1}')
+	TVNUM=$(grep tcp rpc_out | awk '{print $2}')
+	TCPNAME=$(grep tcp rpc_out | awk '{print $5}')
+	UPNUM=$(grep udp rpc_out | awk '{print $1}')
+	UVNUM=$(grep udp rpc_out | awk '{print $2}')
+	UDPNAME=$(grep udp rpc_out | awk '{print $5}')
 }
 
 do_test()
@@ -65,7 +49,7 @@ do_test()
 	EXPECT_RHOST_PASS rpcinfo -u $thost portmapper
 	EXPECT_RHOST_PASS rpcinfo -u $thost portmapper 2
 
-	tst_resm TINFO "Test rpcinfo with missing or bad options"
+	tst_res TINFO "Test rpcinfo with missing or bad options"
 	EXPECT_RHOST_FAIL rpcinfo -p bogushost
 	EXPECT_RHOST_FAIL rpcinfo -bogusflag
 	EXPECT_RHOST_FAIL rpcinfo -t $thost
@@ -75,7 +59,4 @@ do_test()
 	EXPECT_RHOST_FAIL rpcinfo -u $thost 100000 5
 }
 
-do_setup
-do_test
-
-tst_exit
+tst_run
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
