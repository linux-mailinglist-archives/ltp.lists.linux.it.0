Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD43A94DA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 10:19:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D96623C5655
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 10:19:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C77BA3C2DD3
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 10:19:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 769C61000DD2
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 10:19:08 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8A9869F7E5;
 Wed, 16 Jun 2021 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1623831544; bh=6PXuK3dsmdI/oXV5jheog0v/4ZJu0mIzb/63U+i7mWE=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ARjXeJ7Zbpr+7jICvqhofptvKwNDm0DVVOJJapDZ6FaA4ywMoVniFJrw3oXYTK/CJ
 leVg5q9QQxhypC2rKj02+sQEp7EAcFYGSCqNxsPPI+ccRxGwevfLuX+KEpHUcjwv5p
 VaGNO3TAojsfq7nl/SQcwx7SlodyJbE0ZoEbbG6g=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	aleksei.kodanev@bell-sw.com,
	pvorel@suse.cz
Date: Wed, 16 Jun 2021 10:18:56 +0200
Message-Id: <20210616081856.3026223-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] ssh-stress: Convert to new api
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

Apart from pure conversion:
 - Use "StrictModes no" in ssh config, to get rid of
   access permission problems; All part of the path of the
   authorized_keys file must not be writeable by anyone but the owner.
   This allows writing the file to the default temp directory
 - Moved all rhost scripts into ssh-stress.sh

Changes in v3:
- use pkill instead of ps | awk | xargs
- Changed test descriptions slightly
  * include actual ip version
  * dropped "for a long time", the tests do not run
    for a long time with the default config
- Use netstress -B and ssh -f for background processes
  This implies using pgrep to get the pids of these processes.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../network/stress/ssh/00_Descriptions.txt    |  11 -
 testcases/network/stress/ssh/Makefile         |  24 +-
 testcases/network/stress/ssh/ssh-stress.sh    | 259 ++++++++++++------
 .../network/stress/ssh/ssh-stress01-rmt.sh    |  65 -----
 .../network/stress/ssh/ssh-stress02-rmt.sh    |  76 -----
 .../network/stress/ssh/ssh-stress03-rmt.sh    |  77 ------
 6 files changed, 172 insertions(+), 340 deletions(-)
 delete mode 100644 testcases/network/stress/ssh/00_Descriptions.txt
 delete mode 100755 testcases/network/stress/ssh/ssh-stress01-rmt.sh
 delete mode 100755 testcases/network/stress/ssh/ssh-stress02-rmt.sh
 delete mode 100755 testcases/network/stress/ssh/ssh-stress03-rmt.sh

diff --git a/testcases/network/stress/ssh/00_Descriptions.txt b/testcases/network/stress/ssh/00_Descriptions.txt
deleted file mode 100644
index 543e60d7d..000000000
--- a/testcases/network/stress/ssh/00_Descriptions.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-ssh-stress01
-	Verify the ssh connectivity over IPv4/IPv6 is not broken
-	after creating many ssh sessions
-
-ssh-stress02
-	Verify the ssh connectivity over IPv4/IPv6 is not broken
-	after logged in/out by many clients asynchronously for a long time
-
-ssh-stress03
-	Verify the ssh connectivity over IPv4/IPv6 is not broken
-	after forwarding TCP traffic for a long time
diff --git a/testcases/network/stress/ssh/Makefile b/testcases/network/stress/ssh/Makefile
index 1a6d052eb..7ebeec142 100644
--- a/testcases/network/stress/ssh/Makefile
+++ b/testcases/network/stress/ssh/Makefile
@@ -1,24 +1,6 @@
-#
-#    testcases/network/stress/ssh Makefile.
-#
-#    Copyright (C) 2009, Cisco Systems Inc.
-#
-#    This program is free software; you can redistribute it and/or modify
-#    it under the terms of the GNU General Public License as published by
-#    the Free Software Foundation; either version 2 of the License, or
-#    (at your option) any later version.
-#
-#    This program is distributed in the hope that it will be useful,
-#    but WITHOUT ANY WARRANTY; without even the implied warranty of
-#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#    GNU General Public License for more details.
-#
-#    You should have received a copy of the GNU General Public License along
-#    with this program; if not, write to the Free Software Foundation, Inc.,
-#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Ngie Cooper, October 2009
-#
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
+# Ngie Cooper, July 2009
 
 top_srcdir		?= ../../../..
 
diff --git a/testcases/network/stress/ssh/ssh-stress.sh b/testcases/network/stress/ssh/ssh-stress.sh
index 516bce765..e187aac49 100755
--- a/testcases/network/stress/ssh/ssh-stress.sh
+++ b/testcases/network/stress/ssh/ssh-stress.sh
@@ -1,147 +1,226 @@
 #!/bin/sh
-
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
 # Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2005
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
+# Copyright (c) International Business Machines Corp., 2005
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
-#
 
-TCID=ssh-stress
-TST_TOTAL=3
 TST_CLEANUP="cleanup"
+TST_SETUP="setup"
+TST_TESTFUNC="test"
+TST_CNT=3
+TST_NEEDS_ROOT=1
+TST_NEEDS_TMPDIR=1
+TST_NEEDS_CMDS="sshd ssh od pkill pgrep"
 
-TST_USE_LEGACY_API=1
 . tst_net.sh
 
-# Temporary directory to store sshd setting or ssh key
-# Note: ssh doesn't work when those directory is under /tmp.
-TMPDIR="/root"
+# SSH config file on the remote host
+RHOST_SSH_CONF=
+# SSH command to connect from the remote host to the test host
+RHOST_SSH=
+# Processes started on the remote host, killed at cleanup
+RHOST_PIDS=
+# Netstress process started on the test host, killed at cleanup
+NETSTRESS_PID=
 
 cleanup()
 {
+	local pids
+
 	# Stop the ssh daemon
-	test -s sshd.pid && kill $(cat sshd.pid)
-	pkill 'netstress$'
-	tst_rmdir
-	[ "$rtmpdir" ] && tst_rhost_run -c "rm -rf $rtmpdir"
-	TMPDIR=
+	[ -s sshd.pid ] && kill $(cat sshd.pid)
+	[ -n "$NETSTRESS_PID" ] && kill -2 $NETSTRESS_PID >/dev/null 2>&1
+
+	tst_rhost_run -c "kill $RHOST_PIDS"  >/dev/null 2>&1
+
+	# Kill all remaining ssh processes
+	tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH_CONF'"
 }
 
 setup()
 {
-	trap "tst_brkm TBROK 'test interrupted'" INT
-
-	tst_require_root
-	tst_require_cmds pkill sshd ssh od
-
-	# Get the sshd command with absolute path
-	SSHD=$(which sshd)
-	test "$SSHD" || tst_brkm TBROK "sshd daemon is not found"
+	local port rc
 
-	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) || \
-		tst_brkm TBROK "Failed to ping to $(tst_ipaddr rhost)"
 
 	port=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} stream")
 
-	tst_tmpdir
-
-	tmpdir=$TST_TMPDIR
-
-	cat << EOD > $tmpdir/sshd_config
+	cat << EOD > sshd_config
 Port $port
 ListenAddress $(tst_ipaddr)
 PermitRootLogin yes
-AuthorizedKeysFile $tmpdir/authorized_keys
+AuthorizedKeysFile $TST_TMPDIR/authorized_keys
 PasswordAuthentication no
 AllowTcpForwarding yes
 TCPKeepAlive yes
 UseDNS no
-PidFile $tmpdir/sshd.pid
+StrictModes no
+PidFile $TST_TMPDIR/sshd.pid
 EOD
 
-	$SSHD -f $tmpdir/sshd_config || \
-		tst_brkm TBROK "Failed to run sshd daemon"
-
-	tst_resm TINFO "Generate configuration file and key at the remote host"
-	rtmpdir=$(tst_rhost_run -c "mktemp -d -p $TMPDIR")
-	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $rtmpdir/id_rsa > /dev/null"
+	tst_res TINFO "Generate configuration file and key at the remote host"
+	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $TST_TMPDIR/id_rsa \
+		>/dev/null"
 
-	rconfig=$rtmpdir/ssh_config
+	RHOST_SSH_CONF=$TST_TMPDIR/ssh_config
 
 	tst_rhost_run -s -c "printf \"\
 Port $port\n\
 StrictHostKeyChecking no\n\
 PasswordAuthentication no\n\
-UserKnownHostsFile $rtmpdir/known_hosts\n\
-IdentityFile $rtmpdir/id_rsa\n\" > $rconfig"
+ExitOnForwardFailure yes\n\
+UserKnownHostsFile $TST_TMPDIR/known_hosts\n\
+IdentityFile $TST_TMPDIR/id_rsa\n\" > $RHOST_SSH_CONF"
 
-	tst_rhost_run -s -c "chmod 700 $rtmpdir; chmod 600 $rtmpdir/*"
+	tst_res TINFO "Generate authorized_keys"
+	tst_rhost_run -c "cat ${TST_TMPDIR}/id_rsa.pub" > authorized_keys
 
-	tst_resm TINFO "Generate authorized_keys"
-	tst_rhost_run -c "cat ${rtmpdir}/id_rsa.pub" > $tmpdir/authorized_keys
+	tst_res TINFO "restore context of authorized_keys"
+	rc=$(command -v restorecon)
+	[ -n "$rc" ] && $rc authorized_keys
 
-	tst_resm TINFO "restore context of authorized_keys"
-	local rc=$(which restorecon)
-	test "$rc" && $rc $tmpdir/authorized_keys
+	$(command -v sshd) -f $TST_TMPDIR/sshd_config || \
+		tst_brk TBROK "Failed to run sshd daemon"
 
-	chmod 700 $tmpdir
-	chmod 600 $tmpdir/*
+	RHOST_SSH="ssh -$TST_IPVER -F $RHOST_SSH_CONF $(tst_ipaddr)"
 }
 
-test01()
+test_ssh_connectivity()
 {
-	tst_resm TINFO "Creating '$CONNECTION_TOTAL' ssh sessions"
-
-	tst_rhost_run -s -c "ssh-stress01-rmt.sh $TST_IPVER $(tst_ipaddr) \
-		$rconfig $CONNECTION_TOTAL"
-
-	tst_resm TPASS "Test is finished successfully"
+	tst_rhost_run -c "$RHOST_SSH 'true >/dev/null 2>&1' >/dev/null"
+	[ $? -ne 0 ] && tst_brk TFAIL "SSH not reachable"
 }
 
-test02()
+test1()
 {
-	tst_resm TINFO "Log in/out by many clients asynchronously"
-	tst_resm TINFO "'$CONNECTION_TOTAL' clients, time $NS_DURATION sec"
+	local num all_conn pid
 
-	tst_rhost_run -s -c "ssh-stress02-rmt.sh $TST_IPVER $(tst_ipaddr) \
-		$rconfig $CONNECTION_TOTAL $NS_DURATION"
+	tst_res TINFO "Verify SSH connectivity over IPv$TST_IPVER is not broken after creating many SSH sessions"
 
-	tst_resm TPASS "Test is finished successfully"
+	test_ssh_connectivity
+
+	RHOST_PIDS=
+	num=0
+	while [ $num -lt $CONNECTION_TOTAL ]; do
+		pid=$(tst_rhost_run -c "$RHOST_SSH -N </dev/null 1>/dev/null 2>&1 \
+			& echo \$!")
+		RHOST_PIDS="$RHOST_PIDS $pid"
+		num=$(($num + 1))
+	done
+
+	tst_res TINFO "Killing all ssh sessions"
+	num=0
+	for pid in $RHOST_PIDS; do
+		tst_rhost_run -c "kill $pid" >/dev/null
+		[ $? -ne 0 ] && num=$((num + 1))
+	done
+	
+	[ $num -ne 0 ] && tst_brk TFAIL "$num ssh processes died unexpectedly during execution"
+
+	test_ssh_connectivity
+
+	tst_res TPASS "Test finished successfully"
 }
 
-test03()
+test2()
 {
-	tst_resm TINFO "Forwarding TCP traffic with $NS_TIMES requests"
+	local start_epoc pids total_connections elapse_epoc new_pids
+	local ssh_num wait_sec login_sec
+
+	tst_res TINFO "Verify SSH connectivity over IPv$TST_IPVER is not broken after logging in/out by many clients asynchronously"
+
+	test_ssh_connectivity
+
+	start_epoc=$(date +%s)
+	RHOST_PIDS=
+	total_connections=0
+	while true ; do
+		# Exit after the specified time has elapsed.
+		elapse_epoc=$(( $(date +%s) - $start_epoc))
+		[ $elapse_epoc -ge $NS_DURATION ] && break
+
+		new_pids=
+		for pid in $RHOST_PIDS; do
+			if tst_rhost_run -c "kill -0 $pid" >/dev/null; then
+				new_pids="$new_pids $pid"
+			fi
+		done
+		RHOST_PIDS="$new_pids"
+
+		# Do not make ssh connection over the specified quantity
+		ssh_num=$(echo "$pids" | wc -w)
+		if [ $ssh_num -ge $CONNECTION_TOTAL ]; then
+			tst_res TINFO "Max connections reached"
+			tst_sleep 1
+			continue
+		fi
+
+		# specified wait time and login time
+		wait_sec=$(( $(od -A n -d -N 1 /dev/urandom) * 3 / 255 ))
+		login_sec=$(( $(od -A n -d -N 1 /dev/urandom) * 10 / 255 ))
+
+		# Login to the server
+		pid=$(tst_rhost_run -c "( \
+			  sleep $wait_sec && $RHOST_SSH -l root \"sleep $login_sec\" \
+			) </dev/null 1>/dev/null 2>&1 & echo \$!"
+		)
+		RHOST_PIDS="$RHOST_PIDS $pid"
+		total_connections=$(( total_connections + 1 ))
+	done
+
+	tst_res TINFO "Waiting for all connections to terminate"
+	while [ -n "$RHOST_PIDS" ]; do
+		tst_sleep 1
+		new_pids=
+		for pid in $RHOST_PIDS; do
+			if tst_rhost_run -c "kill -0 $pid" >/dev/null 2>&1; then
+				new_pids="$new_pids $pid"
+			fi
+		done
+		RHOST_PIDS="$new_pids"
+	done
+
+	test_ssh_connectivity
+
+	tst_res TPASS "Test finished successfully ($total_connections connections)"
+}
 
-	# Run a TCP traffic server
-	port=$(tst_get_unused_port ipv${TST_IPVER} stream)
+test3()
+{
+	local port lport localhost rhost ret
+	tst_res TINFO "Verify SSH connectivity over IPv$TST_IPVER is not broken after forwarding TCP traffic"
 
-	netstress -R 3 -g $port > tcp_server.log 2>&1 &
+	localhost="127.0.0.1"
+	rhost="$(tst_ipaddr)"
+	if [ "$TST_IPVER" = "6" ]; then
+		localhost="::1"
+		rhost="[$(tst_ipaddr)]"
+	fi
 
-	tst_rhost_run -s -c "ssh-stress03-rmt.sh $TST_IPVER $(tst_ipaddr) \
-		$rconfig $port $NS_TIMES"
+	test_ssh_connectivity
 
-	tst_resm TPASS "Test is finished successfully"
-}
+	# Get an ssh forwarding port
+	lport=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} stream")
+
+	# Start a tcp server
+	netstress -R 3 -B $TST_TMPDIR >/dev/null 2>&1
+	[ $? -ne 0 ] && tst_brk TBROK "Unable to start netstress server"
+	NETSTRESS_PID=$(pgrep -f "^netstress .*$TST_TMPDIR")
+	port=$(cat netstress_port)
+
+	# Setup an ssh tunnel from the remote host to testhost
+	tst_rhost_run -c "$RHOST_SSH -f -N -L $lport:$rhost:$port </dev/null >/dev/null 2>&1"
+	[ "$?" -ne 0 ] && tst_brk TFAIL "Failed to create an SSH session with port forwarding"
+	RHOST_PIDS=$(tst_rhost_run -c "pgrep -f '^ssh .*$lport:$rhost:$port'")
 
-setup
+	# Start the TCP traffic clients
+	tst_rhost_run -s -c "netstress -r $NS_TIMES -l -H $localhost -g $lport > /dev/null"
 
-test01
-test02
-test03
+	tst_rhost_run -c "kill $RHOST_PIDS >/dev/null 2>&1"
+	
+	test_ssh_connectivity
+
+	tst_res TPASS "Test finished successfully"
+}
 
-tst_exit
+tst_run
diff --git a/testcases/network/stress/ssh/ssh-stress01-rmt.sh b/testcases/network/stress/ssh/ssh-stress01-rmt.sh
deleted file mode 100755
index b2f65793e..000000000
--- a/testcases/network/stress/ssh/ssh-stress01-rmt.sh
+++ /dev/null
@@ -1,65 +0,0 @@
-#!/bin/sh
-
-# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2005
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
-# Author: Mitsuru Chinen <mitch@jp.ibm.com>
-#
-
-TCID="ssh_stress01_rmt"
-TST_TOTAL=1
-
-. test.sh
-
-if [ $# -ne 4 ]; then
-	tst_brkm TBROK "Usage: $0 ipver rhost config connections"
-fi
-
-ip_ver="$1"
-server_ipaddr="$2"
-ssh_config="$3"
-connections="$4"
-
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-
-[ $? -ne 0 ] && tst_brkm TBROK "Can't connect to '$server_ipaddr'"
-
-# Make ssh connections
-num=0
-while [ $num -lt $connections ]; do
-	ssh -$ip_ver -f -N -F $ssh_config $server_ipaddr
-	if [ $? -ne 0 ]; then
-		tst_resm TINFO "'$num' seems the max num of ssh conn"
-		break
-	fi
-	num=$(($num + 1))
-done
-
-# Disconnect all ssh connection
-all_conn=$(ps auxw | grep -Fv grep | \
-	grep "ssh[[:blank:]].*${ssh_config}" | awk '{print $2}')
-kill $all_conn
-
-# Check the connectivity again
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-if [ $? -ne 0 ]; then
-	tst_brkm TBROK "Failed to connect $server_ipaddr"
-fi
-
-tst_exit
diff --git a/testcases/network/stress/ssh/ssh-stress02-rmt.sh b/testcases/network/stress/ssh/ssh-stress02-rmt.sh
deleted file mode 100755
index 05f4c3847..000000000
--- a/testcases/network/stress/ssh/ssh-stress02-rmt.sh
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/sh
-
-# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2005
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
-# Author: Mitsuru Chinen <mitch@jp.ibm.com>
-#
-
-TCID="ssh_stress02_rmt"
-TST_TOTAL=1
-
-. test.sh
-
-# Check the arguments
-if [ $# -ne 5 ]; then
-	tst_brkm TBROK "Usage: $0 ipver rhost config connections duration"
-fi
-
-ip_ver="$1"
-server_ipaddr="$2"
-ssh_config="$3"
-connections="$4"
-duration="$5"
-
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
-
-start_epoc=$(date +%s)
-while true ; do
-	# Exit when the specified seconds have passed.
-	current_epoc=$(date +%s)
-	elapse_epoc=$(($current_epoc - $start_epoc))
-
-	[ $elapse_epoc -ge $duration ] && break
-
-	# Do not make ssh connection over the specified quantity
-	ssh_num=$(jobs | wc -l)
-	if [ $ssh_num -ge $connections ]; then
-		sleep 1
-		continue;
-	fi
-
-	# specified wait time and login time
-	wait_sec=$(($(od -A n -d -N 1 /dev/random) * 3 / 255))
-	login_sec=$(($(od -A n -d -N 1 /dev/random) * 10 / 255))
-
-	# Login to the server
-	(sleep $wait_sec ; ssh -$ip_ver -F $ssh_config -l root $server_ipaddr \
-		"sleep $login_sec < /dev/null > /dev/null 2>&1") > \
-		/dev/null 2>&1 &
-done
-
-# wait for the finish of all process
-wait
-
-# Check the connectivity again
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
-
-tst_exit
diff --git a/testcases/network/stress/ssh/ssh-stress03-rmt.sh b/testcases/network/stress/ssh/ssh-stress03-rmt.sh
deleted file mode 100755
index da1abebcd..000000000
--- a/testcases/network/stress/ssh/ssh-stress03-rmt.sh
+++ /dev/null
@@ -1,77 +0,0 @@
-#!/bin/sh
-
-# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) International Business Machines  Corp., 2005
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
-# Author: Mitsuru Chinen <mitch@jp.ibm.com>
-#
-
-TCID="ssh_stress03_rmt"
-TST_TOTAL=1
-
-. test.sh
-
-# Check the arguments
-if [ $# -ne 5 ]; then
-	tst_brkm TBROK "Usage: $0 ipver rhost config port requests"
-fi
-
-ip_ver="$1"
-server_ipaddr="$2"
-ssh_config="$3"
-rport="$4"
-requests="$5"
-
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
-
-lport=$(tst_get_unused_port ipv${ip_ver} stream)
-
-# Set the ssh port-forwarding
-case $ip_ver in
-4)
-	localhost="127.0.0.1"
-	ssh -4 -f -N -L $lport:$server_ipaddr:$rport \
-		root@$server_ipaddr -F $ssh_config
-;;
-6)
-	localhost="::1"
-	ssh -6 -f -N -L $lport:[$server_ipaddr]:$rport \
-		root@$server_ipaddr -F $ssh_config
-;;
-esac
-
-# Start the TCP traffic clients
-netstress -r $requests -l -H $localhost -g $lport > /dev/null
-ret=$?
-
-# Stop the ssh port forwarding
-all_conn=$(ps auxw | grep -Fv grep | \
-	grep "ssh[[:blank:]].*${ssh_config}" | awk '{print $2}')
-for ssh_pid in $all_conn ; do
-	kill $ssh_pid
-done
-
-[ $ret -ne 0 ] && tst_brkm TBROK "TCP traffic client is dead"
-
-# Check the connectivity again
-ssh -$ip_ver -F $ssh_config $server_ipaddr \
-	"true < /dev/null > /dev/null 2>&1" > /dev/null
-[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
-
-tst_exit
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
