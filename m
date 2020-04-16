Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056D1ABE5D
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:46:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 139693C64A0
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:46:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0B4453C050E
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:46:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3680F1401634
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:46:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EAABAED9;
 Thu, 16 Apr 2020 10:46:11 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 16 Apr 2020 12:45:48 +0200
Message-Id: <20200416104548.27897-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104548.27897-1-pvorel@suse.cz>
References: <20200416104548.27897-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] net/sendfile01.sh: Rewrite into new API
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

* reduce sleep to 1s (from 10s)
* continue testing on size failure

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../network/tcp_cmds/sendfile/sendfile01.sh   | 125 ++++++------------
 1 file changed, 38 insertions(+), 87 deletions(-)

diff --git a/testcases/network/tcp_cmds/sendfile/sendfile01.sh b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
index 2cbde0ab7..4e4cc161b 100755
--- a/testcases/network/tcp_cmds/sendfile/sendfile01.sh
+++ b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
@@ -1,111 +1,62 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014 Oracle and/or its affiliates. All Rights Reserved.
+# Copyright (c) Linux Test Project, 2001-2013
+# Copyright (c) Manoj Iyer <manjo@mail.utexas.edu> 2003
+# Copyright (c) Robbie Williamson <robbiew@us.ibm.com> 2002-2003
 # Copyright (c) International Business Machines  Corp., 2000
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
-# along with this program; if not, write the Free Software Foundation,
-# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-#
-#  PURPOSE: Copy files from server to client using the sendfile()
-#           function.
-#
-#
-#  SETUP: The home directory of root on the machine exported as "RHOST"
-#         MUST have a ".rhosts" file with the hostname of the client
-#         machine, where the test is executed.
-#
-#  HISTORY:
-#    06/09/2003 Manoj Iyer manjo@mail.utexas.edu
-#    - Modified to use LTP APIs, and added check to if commands used in test
-#    exists.
-#    03/01 Robbie Williamson (robbiew@us.ibm.com)
-#      -Ported
-#
-#
-#***********************************************************************
 
-TST_TOTAL=1
-TCID="sendfile01"
+TST_SETUP=do_setup
 TST_CLEANUP=do_cleanup
+TST_TESTFUNC=do_test
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_CMDS="diff stat"
+. tst_net.sh
 
 do_setup()
 {
-	TCdat=${TCdat:-$LTPROOT/testcases/bin/datafiles}
 
-	CLIENT="testsf_c${TST_IPV6}"
-	SERVER="testsf_s${TST_IPV6}"
+	tst_res TINFO "copy files from server to client using the sendfile() on IPv$TST_IPVER"
 
-	FILES=${FILES:-"ascii.sm ascii.med ascii.lg ascii.jmb"}
+	client="testsf_c${TST_IPV6}"
+	server="testsf_s${TST_IPV6}"
 
-	tst_require_cmds diff stat
+	port=$(tst_rhost_run -s -c "tst_get_unused_port ipv$TST_IPVER stream")
+	[ -z "$port" ] && tst_brk TBROK "failed to get unused port"
 
-	tst_tmpdir
+	tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
+	server_started=1
+	tst_res TINFO "wait for the server to start"
+	sleep 1
 }
 
 do_test()
 {
-	tst_resm TINFO "Doing $0."
-
-	local ipv="ipv${TST_IPV6:-"4"}"
-	local ipaddr=$(tst_ipaddr rhost)
-	local port=$(tst_rhost_run -s -c "tst_get_unused_port $ipv stream")
-	[ -z "$port" ] && tst_brkm TBROK "failed to get unused port"
-
-	tst_rhost_run -s -b -c "$SERVER $ipaddr $port"
-	server_started=1
-	sleep 10
-
-	for clnt_fname in $FILES; do
-		serv_fname=${TCdat}/$clnt_fname
-		local size=$(stat -c '%s' $serv_fname)
-
-		tst_resm TINFO \
-			"$CLIENT ip '$ipaddr' port '$port' file '$clnt_fname'"
-
-		$CLIENT $ipaddr $port $clnt_fname $serv_fname $size >\
-			/dev/null 2>&1
-
-		local ret=$?
-		if [ $ret -ne 0 ]; then
-			tst_resm TFAIL "$CLIENT returned error '$ret'"
-			return;
-		fi
-
-		diff $serv_fname $clnt_fname > /dev/null 2>&1
-		local diff_res=$?
-		if [ $diff_res -gt 1 ]; then
-			tst_resm TFAIL "ERROR: Cannot compare files"
-			return
-		fi
-
-		if [ $diff_res -eq 1 ]; then
-			tst_resm TFAIL "The file copied differs from the original"
-			return
+	local file lfile ret size
+
+	for file in $(ls $TST_NET_DATAROOT/ascii.*); do
+		lfile="$(basename $file)"
+		size=$(stat -c '%s' $file)
+
+		tst_res TINFO "test IP: $(tst_ipaddr rhost), port: $port, file: $lfile"
+		ROD $client $(tst_ipaddr rhost) $port $lfile $file $size \> /dev/null
+
+		diff $file $lfile > /dev/null
+		ret=$?
+		if [ $ret -eq 0 ]; then
+			tst_res TPASS "coped file is the same as the original"
+		elif [ $ret -gt 1 ]; then
+			tst_brk TFAIL "cannot compare files"
+		else
+			tst_res TFAIL "the copied file differs from the original"
 		fi
 	done
-	tst_resm TPASS "test finished successfully"
 }
 
 do_cleanup()
 {
-	[ -n "$server_started" ] && tst_rhost_run -c "pkill $SERVER"
-	tst_rmdir
+	[ -n "$server_started" ] && tst_rhost_run -c "pkill $server"
 }
 
-TST_USE_LEGACY_API=1
-. tst_net.sh
-
-do_setup
-do_test
-
-tst_exit
+tst_run
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
