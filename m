Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFD3A5D81
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 09:14:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0ABB3C72C5
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 09:14:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F0253C2819
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 09:14:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E855D60070F
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 09:14:39 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3DC41FD32;
 Mon, 14 Jun 2021 07:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623654878;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2lBdG68a812h2vldJlQxp8h9NETmGvvxRNX43tAYkU=;
 b=gutaPufVnfNmD+51Wo/ButasuNVdzU3wZohv4Xmn2jk25c9HFG112l9pMSblwbD0LR0dXf
 6baMGCK1qQ+636cKKhsxHpYKvjq6Expy93+jGqytIyP+7m95Ccrn4nUz1AB3jAtmZR6iRt
 dfN0Sf5iVm77pAPEGi+qBbdM1LKjJPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623654878;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2lBdG68a812h2vldJlQxp8h9NETmGvvxRNX43tAYkU=;
 b=5asJt8y9LXMODHmyNtGNcqk1AAC2vcMuWsNoT8DRM0eIhqE38lI56RMhDXtSflOti3KpK7
 HdkzuCkDlD5qjuDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A451F118DD;
 Mon, 14 Jun 2021 07:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623654878;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2lBdG68a812h2vldJlQxp8h9NETmGvvxRNX43tAYkU=;
 b=gutaPufVnfNmD+51Wo/ButasuNVdzU3wZohv4Xmn2jk25c9HFG112l9pMSblwbD0LR0dXf
 6baMGCK1qQ+636cKKhsxHpYKvjq6Expy93+jGqytIyP+7m95Ccrn4nUz1AB3jAtmZR6iRt
 dfN0Sf5iVm77pAPEGi+qBbdM1LKjJPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623654878;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2lBdG68a812h2vldJlQxp8h9NETmGvvxRNX43tAYkU=;
 b=5asJt8y9LXMODHmyNtGNcqk1AAC2vcMuWsNoT8DRM0eIhqE38lI56RMhDXtSflOti3KpK7
 HdkzuCkDlD5qjuDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id b/s7Jt4Bx2A3fAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 14 Jun 2021 07:14:38 +0000
Date: Mon, 14 Jun 2021 09:14:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMcB3Wcu0J9C3Z/Q@pevik>
References: <20210610101917.1251564-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610101917.1251564-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ssh-stress: Convert to new api
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

[ Cc Alexey ]
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> Apart from pure conversion:
>  - Use "StrictModes no" in ssh config, to get rid of
>    access permission problems; All part of the path of the
>    authorized_keys file must not be writeable by anyone but the owner.
>    This allows writing the file to the default temp directory
>  - Moved all rhost scripts into ssh-stress.sh
+1

Nice work, LGTM, few small notes (could be fixed before merge).
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Out of curiosity, did you test this on Two Host Configuration [2] (i.e. ssh)?
Or just netns?

https://github.com/linux-test-project/ltp/blob/master/testcases/network/README.md

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../network/stress/ssh/00_Descriptions.txt    |  11 -
>  testcases/network/stress/ssh/Makefile         |  24 +-
>  testcases/network/stress/ssh/ssh-stress.sh    | 262 ++++++++++++------
>  .../network/stress/ssh/ssh-stress01-rmt.sh    |  65 -----
>  .../network/stress/ssh/ssh-stress02-rmt.sh    |  76 -----
>  .../network/stress/ssh/ssh-stress03-rmt.sh    |  77 -----
>  6 files changed, 176 insertions(+), 339 deletions(-)
>  delete mode 100644 testcases/network/stress/ssh/00_Descriptions.txt
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress01-rmt.sh
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress02-rmt.sh
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress03-rmt.sh

> diff --git a/testcases/network/stress/ssh/00_Descriptions.txt b/testcases/network/stress/ssh/00_Descriptions.txt
> deleted file mode 100644
> index 543e60d7d..000000000
> --- a/testcases/network/stress/ssh/00_Descriptions.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -ssh-stress01
> -	Verify the ssh connectivity over IPv4/IPv6 is not broken
> -	after creating many ssh sessions
> -
> -ssh-stress02
> -	Verify the ssh connectivity over IPv4/IPv6 is not broken
> -	after logged in/out by many clients asynchronously for a long time
> -
> -ssh-stress03
> -	Verify the ssh connectivity over IPv4/IPv6 is not broken
> -	after forwarding TCP traffic for a long time
> diff --git a/testcases/network/stress/ssh/Makefile b/testcases/network/stress/ssh/Makefile
> index 1a6d052eb..7ebeec142 100644
> --- a/testcases/network/stress/ssh/Makefile
> +++ b/testcases/network/stress/ssh/Makefile
> @@ -1,24 +1,6 @@
> -#
> -#    testcases/network/stress/ssh Makefile.
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, October 2009
> -#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2009, Cisco Systems Inc.
> +# Ngie Cooper, July 2009

>  top_srcdir		?= ../../../..

> diff --git a/testcases/network/stress/ssh/ssh-stress.sh b/testcases/network/stress/ssh/ssh-stress.sh
> index 516bce765..b571063a1 100755
> --- a/testcases/network/stress/ssh/ssh-stress.sh
> +++ b/testcases/network/stress/ssh/ssh-stress.sh
> @@ -1,147 +1,231 @@
>  #!/bin/sh
> -
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
>  # Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
> -# Copyright (c) International Business Machines  Corp., 2005
> -#
> -# This program is free software; you can redistribute it and/or
> -# modify it under the terms of the GNU General Public License as
> -# published by the Free Software Foundation; either version 2 of
> -# the License, or (at your option) any later version.
> -#
> -# This program is distributed in the hope that it would be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write the Free Software Foundation,
> -# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> +# Copyright (c) International Business Machines Corp., 2005
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>
> -#

> -TCID=ssh-stress
> -TST_TOTAL=3
>  TST_CLEANUP="cleanup"
> +TST_SETUP="setup"
> +TST_TESTFUNC="test"
> +TST_CNT=3
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_TMPDIR=1
> +TST_NEEDS_CMDS="sshd ssh od xargs"

> -TST_USE_LEGACY_API=1
>  . tst_net.sh

> -# Temporary directory to store sshd setting or ssh key
> -# Note: ssh doesn't work when those directory is under /tmp.
> -TMPDIR="/root"
> +# SSH config file on the remote host
> +RHOST_SSH_CONF=
> +# SSG command to connect from the remote host to the test host
> +RHOST_SSH=
> +# Processes started on the remote host, killed at cleanup
> +RHOST_PIDS=
> +# Netstress process started on the test host, killed at cleanup
> +NETSTRESS_PID=

>  cleanup()
>  {
> +	local pids
Here needs to be pid as well.
> +
>  	# Stop the ssh daemon
> -	test -s sshd.pid && kill $(cat sshd.pid)
> -	pkill 'netstress$'
> -	tst_rmdir
> -	[ "$rtmpdir" ] && tst_rhost_run -c "rm -rf $rtmpdir"
> -	TMPDIR=
> +	[ -s sshd.pid ] && kill $(cat sshd.pid)
> +	[ -n "$NETSTRESS_PID" ] && kill -2 $NETSTRESS_PID >/dev/null 2>&1
> +
> +	for pid in $RHOST_PIDS; do
> +		tst_rhost_run -c "kill -- $pid"  >/dev/null 2>&1
> +	done
> +
> +	# Kill all remaining ssh processes
> +	tst_rhost_run -c "ps auwx | \
> +		awk '\$0 ~ \"$RHOST_SSH_CONF\" && \$11 == \"ssh\" {print \$2}' | \
> +		xargs -r -t kill -- >/dev/null 2>&1"
>  }

>  setup()
>  {
> -	trap "tst_brkm TBROK 'test interrupted'" INT
> -
> -	tst_require_root
> -	tst_require_cmds pkill sshd ssh od
> -
> -	# Get the sshd command with absolute path
> -	SSHD=$(which sshd)
> -	test "$SSHD" || tst_brkm TBROK "sshd daemon is not found"
> +	local port rc

> -	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) || \
> -		tst_brkm TBROK "Failed to ping to $(tst_ipaddr rhost)"
> +	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) \
> +		|| tst_brk TBROK "Failed to ping $(tst_ipaddr rhost)"
Anything from testcases/network/stress/ns-tools/ is deprecated,
including check_icmpv{4,6}_connectivity. But this can be safely removed.
Although I don't see any connectivity check in tst_net.sh, it should be handled
there. IMHO it's needed at least for for two host based configuration, but it does not harm to test also netns based setup, thus somewhere after init_ltp_netspace.

>  	port=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} stream")

> -	tst_tmpdir
> -
> -	tmpdir=$TST_TMPDIR
> -
> -	cat << EOD > $tmpdir/sshd_config
> +	cat << EOD > sshd_config
>  Port $port
>  ListenAddress $(tst_ipaddr)
>  PermitRootLogin yes
> -AuthorizedKeysFile $tmpdir/authorized_keys
> +AuthorizedKeysFile $TST_TMPDIR/authorized_keys
>  PasswordAuthentication no
>  AllowTcpForwarding yes
>  TCPKeepAlive yes
>  UseDNS no
> -PidFile $tmpdir/sshd.pid
> +StrictModes no
> +PidFile $TST_TMPDIR/sshd.pid
>  EOD

> -	$SSHD -f $tmpdir/sshd_config || \
> -		tst_brkm TBROK "Failed to run sshd daemon"
> -
> -	tst_resm TINFO "Generate configuration file and key at the remote host"
> -	rtmpdir=$(tst_rhost_run -c "mktemp -d -p $TMPDIR")
> -	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $rtmpdir/id_rsa > /dev/null"
> +	tst_res TINFO "Generate configuration file and key at the remote host"
> +	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $TST_TMPDIR/id_rsa \
> +		>/dev/null"

> -	rconfig=$rtmpdir/ssh_config
> +	RHOST_SSH_CONF=$TST_TMPDIR/ssh_config

>  	tst_rhost_run -s -c "printf \"\
>  Port $port\n\
>  StrictHostKeyChecking no\n\
>  PasswordAuthentication no\n\
> -UserKnownHostsFile $rtmpdir/known_hosts\n\
> -IdentityFile $rtmpdir/id_rsa\n\" > $rconfig"
> +UserKnownHostsFile $TST_TMPDIR/known_hosts\n\
> +IdentityFile $TST_TMPDIR/id_rsa\n\" > $RHOST_SSH_CONF"

> -	tst_rhost_run -s -c "chmod 700 $rtmpdir; chmod 600 $rtmpdir/*"
> +	tst_res TINFO "Generate authorized_keys"
> +	tst_rhost_run -c "cat ${TST_TMPDIR}/id_rsa.pub" > authorized_keys

> -	tst_resm TINFO "Generate authorized_keys"
> -	tst_rhost_run -c "cat ${rtmpdir}/id_rsa.pub" > $tmpdir/authorized_keys
> +	tst_res TINFO "restore context of authorized_keys"
> +	rc=$(command -v restorecon)
> +	[ -n "$rc" ] && $rc authorized_keys

> -	tst_resm TINFO "restore context of authorized_keys"
> -	local rc=$(which restorecon)
> -	test "$rc" && $rc $tmpdir/authorized_keys
> +	$(command -v sshd) -f $TST_TMPDIR/sshd_config || \
> +		tst_brk TBROK "Failed to run sshd daemon"

> -	chmod 700 $tmpdir
> -	chmod 600 $tmpdir/*
> +	RHOST_SSH="ssh -$TST_IPVER -F $RHOST_SSH_CONF $(tst_ipaddr)"
>  }

> -test01()
> +test_ssh_connectivity()
>  {
> -	tst_resm TINFO "Creating '$CONNECTION_TOTAL' ssh sessions"
> -
> -	tst_rhost_run -s -c "ssh-stress01-rmt.sh $TST_IPVER $(tst_ipaddr) \
> -		$rconfig $CONNECTION_TOTAL"
> -
> -	tst_resm TPASS "Test is finished successfully"
> +	tst_rhost_run -c "$RHOST_SSH 'true >/dev/null 2>&1' >/dev/null"
> +	[ $? -ne 0 ] && tst_res TFAIL "SSH not reachable"
I guess you removed -s (security), to get more descriptive error.
But then you IMHO need to use tst_brk to quit the test.
Or if it was deliberate to keep other tests running, then test1
would print TPASS "Test finished successfully" even it fails due this.

>  }

> -test02()
> +test1()
>  {
> -	tst_resm TINFO "Log in/out by many clients asynchronously"
> -	tst_resm TINFO "'$CONNECTION_TOTAL' clients, time $NS_DURATION sec"
> +	local num all_conn pid

> -	tst_rhost_run -s -c "ssh-stress02-rmt.sh $TST_IPVER $(tst_ipaddr) \
> -		$rconfig $CONNECTION_TOTAL $NS_DURATION"
> +	tst_res TINFO "Verify the ssh connectivity over IPv4/IPv6 is not broken after creating many ssh sessions"

> -	tst_resm TPASS "Test is finished successfully"
> +	test_ssh_connectivity
> +
> +	RHOST_PIDS=
> +	num=0
> +	while [ $num -lt $CONNECTION_TOTAL ]; do
> +		pid=$(tst_rhost_run -c "$RHOST_SSH -N </dev/null 1>/dev/null 2>&1 \
> +			& \echo \$!")
> +		RHOST_PIDS="$RHOST_PIDS $pid"
> +		num=$(($num + 1))
> +	done
> +
> +	tst_res TINFO "Killing all ssh sessions"
> +	num=0
> +	for pid in $RHOST_PIDS; do
> +		tst_rhost_run -c "kill $pid" >/dev/null
> +		[ $? -ne 0 ] && num=$((num + 1))
> +	done
> +	
> +	[ $num -ne 0 ] && tst_brk TFAIL "Some ssh processes died during execution"
> +
> +	test_ssh_connectivity
> +
> +	tst_res TPASS "Test finished successfully"
>  }

> -test03()
> +test2()
>  {
> -	tst_resm TINFO "Forwarding TCP traffic with $NS_TIMES requests"
> +	local start_epoc pids total_connections elapse_epoc new_pids
> +	local ssh_num wait_sec login_sec
> +
> +	tst_res TINFO "Verify the ssh connectivity over IPv4/IPv6 is not broken after logged in/out by many clients asynchronously for a long time"
> +
> +	test_ssh_connectivity
> +
> +	start_epoc=$(date +%s)
> +	RHOST_PIDS=
> +	total_connections=0
> +	while true ; do
> +		# Exit after the specified time has elapsed.
> +		elapse_epoc=$(( $(date +%s) - $start_epoc))
> +		[ $elapse_epoc -ge $NS_DURATION ] && break
> +
> +		new_pids=
> +		for pid in $RHOST_PIDS; do
> +			if tst_rhost_run -c "kill -0 $pid" >/dev/null; then
> +				new_pids="$new_pids $pid"
> +			fi
> +		done
> +		RHOST_PIDS="$new_pids"
> +
> +		# Do not make ssh connection over the specified quantity
> +		ssh_num=$(echo "$pids" | wc -w)
> +		if [ $ssh_num -ge $CONNECTION_TOTAL ]; then
> +			tst_res TINFO "Max connections reached"
> +			tst_sleep 1

> +			continue;
nit: trailing ; unneeded (error from the original ssh-stress02-rmt.sh)
> +		fi
> +
> +		# specified wait time and login time
> +		wait_sec=$(( $(od -A n -d -N 1 /dev/urandom) * 3 / 255 ))
> +		login_sec=$(( $(od -A n -d -N 1 /dev/urandom) * 10 / 255 ))
> +
> +		# Login to the server
> +		pid=$(tst_rhost_run -c "( \
> +			  sleep $wait_sec && $RHOST_SSH -l root \"sleep $login_sec\" \
> +			) </dev/null 1>/dev/null 2>&1 & echo \$!"
> +		)
> +		RHOST_PIDS="$RHOST_PIDS $pid"
> +		total_connections=$(( total_connections + 1 ))
> +	done
> +
> +	tst_res TINFO "Waiting for all connections to terminate"
> +	while [ -n "$RHOST_PIDS" ]; do
> +		tst_sleep 1s
nit: I'd be consistent with previous (1s vs. 1).

The rest LGTM.

Kind regards,
Petr

> +		new_pids=
> +		for pid in $RHOST_PIDS; do
> +			if tst_rhost_run -c "kill -0 $pid" >/dev/null 2>&1; then
> +				new_pids="$new_pids $pid"
> +			fi
> +		done
> +		RHOST_PIDS="$new_pids"
> +	done
> +
> +	test_ssh_connectivity
> +
> +	tst_res TPASS "Test finished successfully ($total_connections connections)"
> +}

> -	# Run a TCP traffic server
> +test3()
> +{
> +	local port lport localhost rhost ret
> +	tst_res TINFO "Verify the ssh connectivity over IPv4/IPv6 is not broken after forwarding TCP traffic for a long time"
> +
> +	localhost="127.0.0.1"
> +	rhost="$(tst_ipaddr)"
> +	if [ "$TST_IPVER" = "6" ]; then
> +		localhost="::1"
> +		rhost="[$(tst_ipaddr)]"
> +	fi
> +
> +	test_ssh_connectivity
> +
> +	# Get a port for the server and a forwarding port
>  	port=$(tst_get_unused_port ipv${TST_IPVER} stream)
> +	lport=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} stream")

> -	netstress -R 3 -g $port > tcp_server.log 2>&1 &
> +	# Start a tcp server
> +	netstress -R 3 -g $port >/dev/null 2>&1 &
> +	NETSTRESS_PID=$!

> -	tst_rhost_run -s -c "ssh-stress03-rmt.sh $TST_IPVER $(tst_ipaddr) \
> -		$rconfig $port $NS_TIMES"
> +	# Setup an ssh tunnel from the remote host to testhost
> +	RHOST_PIDS=$(tst_rhost_run -c \
> +		"$RHOST_SSH -N -L $lport:$rhost:$port </dev/null 1>/dev/null 2>&1 \
> +		& echo \$!")
> +	tst_sleep 1

> -	tst_resm TPASS "Test is finished successfully"
> -}
> +	# Start the TCP traffic clients
> +	tst_rhost_run -s -c "netstress -r $NS_TIMES -l -H $localhost -g $lport > /dev/null"

> -setup
> +	kill $RHOST_PIDS
> +	
> +	test_ssh_connectivity

> -test01
> -test02
> -test03
> +	tst_res TPASS "Test finished successfully"
> +}

> -tst_exit
> +tst_run
> diff --git a/testcases/network/stress/ssh/ssh-stress01-rmt.sh b/testcases/network/stress/ssh/ssh-stress01-rmt.sh
> deleted file mode 100755
> index b2f65793e..000000000
> --- a/testcases/network/stress/ssh/ssh-stress01-rmt.sh
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -#!/bin/sh
> -
> -# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
> -# Copyright (c) International Business Machines  Corp., 2005
> -#
> -# This program is free software; you can redistribute it and/or
> -# modify it under the terms of the GNU General Public License as
> -# published by the Free Software Foundation; either version 2 of
> -# the License, or (at your option) any later version.
> -#
> -# This program is distributed in the hope that it would be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write the Free Software Foundation,
> -# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> -# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> -#
> -
> -TCID="ssh_stress01_rmt"
> -TST_TOTAL=1
> -
> -. test.sh
> -
> -if [ $# -ne 4 ]; then
> -	tst_brkm TBROK "Usage: $0 ipver rhost config connections"
> -fi
> -
> -ip_ver="$1"
> -server_ipaddr="$2"
> -ssh_config="$3"
> -connections="$4"
> -
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -
> -[ $? -ne 0 ] && tst_brkm TBROK "Can't connect to '$server_ipaddr'"
> -
> -# Make ssh connections
> -num=0
> -while [ $num -lt $connections ]; do
> -	ssh -$ip_ver -f -N -F $ssh_config $server_ipaddr
> -	if [ $? -ne 0 ]; then
> -		tst_resm TINFO "'$num' seems the max num of ssh conn"
> -		break
> -	fi
> -	num=$(($num + 1))
> -done
> -
> -# Disconnect all ssh connection
> -all_conn=$(ps auxw | grep -Fv grep | \
> -	grep "ssh[[:blank:]].*${ssh_config}" | awk '{print $2}')
> -kill $all_conn
> -
> -# Check the connectivity again
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -if [ $? -ne 0 ]; then
> -	tst_brkm TBROK "Failed to connect $server_ipaddr"
> -fi
> -
> -tst_exit
> diff --git a/testcases/network/stress/ssh/ssh-stress02-rmt.sh b/testcases/network/stress/ssh/ssh-stress02-rmt.sh
> deleted file mode 100755
> index 05f4c3847..000000000
> --- a/testcases/network/stress/ssh/ssh-stress02-rmt.sh
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -#!/bin/sh
> -
> -# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
> -# Copyright (c) International Business Machines  Corp., 2005
> -#
> -# This program is free software; you can redistribute it and/or
> -# modify it under the terms of the GNU General Public License as
> -# published by the Free Software Foundation; either version 2 of
> -# the License, or (at your option) any later version.
> -#
> -# This program is distributed in the hope that it would be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write the Free Software Foundation,
> -# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> -# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> -#
> -
> -TCID="ssh_stress02_rmt"
> -TST_TOTAL=1
> -
> -. test.sh
> -
> -# Check the arguments
> -if [ $# -ne 5 ]; then
> -	tst_brkm TBROK "Usage: $0 ipver rhost config connections duration"
> -fi
> -
> -ip_ver="$1"
> -server_ipaddr="$2"
> -ssh_config="$3"
> -connections="$4"
> -duration="$5"
> -
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
> -
> -start_epoc=$(date +%s)
> -while true ; do
> -	# Exit when the specified seconds have passed.
> -	current_epoc=$(date +%s)
> -	elapse_epoc=$(($current_epoc - $start_epoc))
> -
> -	[ $elapse_epoc -ge $duration ] && break
> -
> -	# Do not make ssh connection over the specified quantity
> -	ssh_num=$(jobs | wc -l)
> -	if [ $ssh_num -ge $connections ]; then
> -		sleep 1
> -		continue;
> -	fi
> -
> -	# specified wait time and login time
> -	wait_sec=$(($(od -A n -d -N 1 /dev/random) * 3 / 255))
> -	login_sec=$(($(od -A n -d -N 1 /dev/random) * 10 / 255))
> -
> -	# Login to the server
> -	(sleep $wait_sec ; ssh -$ip_ver -F $ssh_config -l root $server_ipaddr \
> -		"sleep $login_sec < /dev/null > /dev/null 2>&1") > \
> -		/dev/null 2>&1 &
> -done
> -
> -# wait for the finish of all process
> -wait
> -
> -# Check the connectivity again
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
> -
> -tst_exit
> diff --git a/testcases/network/stress/ssh/ssh-stress03-rmt.sh b/testcases/network/stress/ssh/ssh-stress03-rmt.sh
> deleted file mode 100755
> index da1abebcd..000000000
> --- a/testcases/network/stress/ssh/ssh-stress03-rmt.sh
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -#!/bin/sh
> -
> -# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
> -# Copyright (c) International Business Machines  Corp., 2005
> -#
> -# This program is free software; you can redistribute it and/or
> -# modify it under the terms of the GNU General Public License as
> -# published by the Free Software Foundation; either version 2 of
> -# the License, or (at your option) any later version.
> -#
> -# This program is distributed in the hope that it would be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write the Free Software Foundation,
> -# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> -# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> -#
> -
> -TCID="ssh_stress03_rmt"
> -TST_TOTAL=1
> -
> -. test.sh
> -
> -# Check the arguments
> -if [ $# -ne 5 ]; then
> -	tst_brkm TBROK "Usage: $0 ipver rhost config port requests"
> -fi
> -
> -ip_ver="$1"
> -server_ipaddr="$2"
> -ssh_config="$3"
> -rport="$4"
> -requests="$5"
> -
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
> -
> -lport=$(tst_get_unused_port ipv${ip_ver} stream)
> -
> -# Set the ssh port-forwarding
> -case $ip_ver in
> -4)
> -	localhost="127.0.0.1"
> -	ssh -4 -f -N -L $lport:$server_ipaddr:$rport \
> -		root@$server_ipaddr -F $ssh_config
> -;;
> -6)
> -	localhost="::1"
> -	ssh -6 -f -N -L $lport:[$server_ipaddr]:$rport \
> -		root@$server_ipaddr -F $ssh_config
> -;;
> -esac
> -
> -# Start the TCP traffic clients
> -netstress -r $requests -l -H $localhost -g $lport > /dev/null
> -ret=$?
> -
> -# Stop the ssh port forwarding
> -all_conn=$(ps auxw | grep -Fv grep | \
> -	grep "ssh[[:blank:]].*${ssh_config}" | awk '{print $2}')
> -for ssh_pid in $all_conn ; do
> -	kill $ssh_pid
> -done
> -
> -[ $ret -ne 0 ] && tst_brkm TBROK "TCP traffic client is dead"
> -
> -# Check the connectivity again
> -ssh -$ip_ver -F $ssh_config $server_ipaddr \
> -	"true < /dev/null > /dev/null 2>&1" > /dev/null
> -[ $? -ne 0 ] && tst_brkm TBROK "Failed to connect '$server_ipaddr'"
> -
> -tst_exit

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
