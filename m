Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 907413A82D7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 16:28:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 470CB3C71D6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 16:28:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D436E3C4D64
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 16:28:50 +0200 (CEST)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D38391A007F0
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 16:28:49 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id m21so27310384lfg.13
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ak4L1+uwdh1vhc8golc+oSypUwGk/jUNdjTbBmOfp0M=;
 b=lC5tf5PH2oWZzr/pstnAgJCoIQSn5epTUBKXb9hkm2zlmiwMTh+QdnuwWxzwAMe29x
 5FXk8IVBX6yaDx1r505a63ZC+oXc1ptLL/O+0SLRxM6245sg9RXN5kk/ZC2fdoOTPIpE
 OnUUxZwqYa7c8hMrg6/+S+2tuGhRbAdfF61Va3Pzne+jpmOk5/mNojmUp5f0kG3P/oEz
 tx76xNtQyfsMIQ0D3LBNCdYiZ63Tx4ySbVPZmTc5Npq+70GieE0LzvTQT7UFsdhdJQMM
 R2yTKLXgH4UNkNYifC0Uncr8gH2pmvo0rWcTApbxubsW/wo/Jcv5zTUzvlc7TU8YfKny
 +o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ak4L1+uwdh1vhc8golc+oSypUwGk/jUNdjTbBmOfp0M=;
 b=t/bYWd686pd8qUyDNj8A9fY3SQF10yvDpMImmex+Qrj4Xpj9z3Z/WtqLIODalalG4l
 pJ8eAEB62OK23C27WqcgZeUHReF44hCZkElgWZpsekRex4TrkzYo7DTaV8rKRomyMaTI
 TkaST5jeQNugdEhFstqgUUQcUlRiw0XPPiJ7lz7NpKVnc4blgGoef/rml5uqe0pY6o2p
 zD/LcW+6E7l4iyAChrFqY8L5IFiijVtgxt0UoeW0EAZXNk1hgVYudWDT1M5ESFiJiO4g
 TVUXJGOSg/pPP2lLunLWCN3+an1PGB8JED94BP23PKsCnsr5pF9zYIKysQWFUAGNo7ER
 ACdg==
X-Gm-Message-State: AOAM532lO2OKPUnXQd/qWAdO3/GbR9NTscVDXapI7L1GtWIDrK1Moh8j
 8w/vIWNWBnjJO2+Gn7rYNW1w
X-Google-Smtp-Source: ABdhPJyRGN8v5NTbo3wZ5Hdr4HXZhSRjZux2hrtauBvzU54eMCC+R/0G0NzCDPqRkxvdQbSvCfMqwQ==
X-Received: by 2002:a05:6512:16a6:: with SMTP id
 bu38mr15774258lfb.92.1623767329076; 
 Tue, 15 Jun 2021 07:28:49 -0700 (PDT)
Received: from [192.168.1.53] ([91.233.45.237])
 by smtp.gmail.com with ESMTPSA id u12sm2182125ljo.37.2021.06.15.07.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:28:48 -0700 (PDT)
To: Joerg Vehlow <lkml@jv-coder.de>, ltp@lists.linux.it, pvorel@suse.cz
References: <20210614094338.125870-1-lkml@jv-coder.de>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <a2ad7106-3e96-48a0-d195-80d7d09c8613@bell-sw.com>
Date: Tue, 15 Jun 2021 17:28:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614094338.125870-1-lkml@jv-coder.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ssh-stress: Convert to new api
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

On 14.06.2021 12:43, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 

Hi Joerg,

> Apart from pure conversion:
>  - Use "StrictModes no" in ssh config, to get rid of
>    access permission problems; All part of the path of the
>    authorized_keys file must not be writeable by anyone but the owner.
>    This allows writing the file to the default temp directory
>  - Moved all rhost scripts into ssh-stress.sh
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../network/stress/ssh/00_Descriptions.txt    |  11 -
>  testcases/network/stress/ssh/Makefile         |  24 +-
>  testcases/network/stress/ssh/ssh-stress.sh    | 260 ++++++++++++------
>  .../network/stress/ssh/ssh-stress01-rmt.sh    |  65 -----
>  .../network/stress/ssh/ssh-stress02-rmt.sh    |  76 -----
>  .../network/stress/ssh/ssh-stress03-rmt.sh    |  77 ------
>  6 files changed, 174 insertions(+), 339 deletions(-)
>  delete mode 100644 testcases/network/stress/ssh/00_Descriptions.txt
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress01-rmt.sh
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress02-rmt.sh
>  delete mode 100755 testcases/network/stress/ssh/ssh-stress03-rmt.sh
> 
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
>  
>  top_srcdir		?= ../../../..
>  
> diff --git a/testcases/network/stress/ssh/ssh-stress.sh b/testcases/network/stress/ssh/ssh-stress.sh
> index 516bce765..49122eb54 100755
> --- a/testcases/network/stress/ssh/ssh-stress.sh
> +++ b/testcases/network/stress/ssh/ssh-stress.sh
> @@ -1,147 +1,229 @@
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
>  
> -TCID=ssh-stress
> -TST_TOTAL=3
>  TST_CLEANUP="cleanup"
> +TST_SETUP="setup"
> +TST_TESTFUNC="test"
> +TST_CNT=3
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_TMPDIR=1
> +TST_NEEDS_CMDS="sshd ssh od xargs"
>  
> -TST_USE_LEGACY_API=1
>  . tst_net.sh
>  
> -# Temporary directory to store sshd setting or ssh key
> -# Note: ssh doesn't work when those directory is under /tmp.
> -TMPDIR="/root"
> +# SSH config file on the remote host
> +RHOST_SSH_CONF=
> +# SSG command to connect from the remote host to the test host

      ^
     SSH

> +RHOST_SSH=
> +# Processes started on the remote host, killed at cleanup
> +RHOST_PIDS=
> +# Netstress process started on the test host, killed at cleanup
> +NETSTRESS_PID=
>  
>  cleanup()
>  {
> +	local pids pid
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

tst_rhost_run -c "kill $RHOST_PIDS"

> +
> +	# Kill all remaining ssh processes
> +	tst_rhost_run -c "ps auwx | \
> +		awk '\$0 ~ \"$RHOST_SSH_CONF\" && \$11 == \"ssh\" {print \$2}' | \
> +		xargs -r -t kill -- >/dev/null 2>&1"
>  }
>  

What about using pkill -f instead of ps|awk|kill?

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
>  
> -	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) || \
> -		tst_brkm TBROK "Failed to ping to $(tst_ipaddr rhost)"
>  
>  	port=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} stream")
>  
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
>  
> -	$SSHD -f $tmpdir/sshd_config || \
> -		tst_brkm TBROK "Failed to run sshd daemon"
> -
> -	tst_resm TINFO "Generate configuration file and key at the remote host"
> -	rtmpdir=$(tst_rhost_run -c "mktemp -d -p $TMPDIR")
> -	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $rtmpdir/id_rsa > /dev/null"
> +	tst_res TINFO "Generate configuration file and key at the remote host"
> +	tst_rhost_run -s -c "ssh-keygen -t rsa -N \"\" -f $TST_TMPDIR/id_rsa \
> +		>/dev/null"
>  
> -	rconfig=$rtmpdir/ssh_config
> +	RHOST_SSH_CONF=$TST_TMPDIR/ssh_config
>  
>  	tst_rhost_run -s -c "printf \"\
>  Port $port\n\
>  StrictHostKeyChecking no\n\
>  PasswordAuthentication no\n\
> -UserKnownHostsFile $rtmpdir/known_hosts\n\
> -IdentityFile $rtmpdir/id_rsa\n\" > $rconfig"
> +UserKnownHostsFile $TST_TMPDIR/known_hosts\n\
> +IdentityFile $TST_TMPDIR/id_rsa\n\" > $RHOST_SSH_CONF"
>  
> -	tst_rhost_run -s -c "chmod 700 $rtmpdir; chmod 600 $rtmpdir/*"
> +	tst_res TINFO "Generate authorized_keys"
> +	tst_rhost_run -c "cat ${TST_TMPDIR}/id_rsa.pub" > authorized_keys
>  
> -	tst_resm TINFO "Generate authorized_keys"
> -	tst_rhost_run -c "cat ${rtmpdir}/id_rsa.pub" > $tmpdir/authorized_keys
> +	tst_res TINFO "restore context of authorized_keys"
> +	rc=$(command -v restorecon)
> +	[ -n "$rc" ] && $rc authorized_keys
>  
> -	tst_resm TINFO "restore context of authorized_keys"
> -	local rc=$(which restorecon)
> -	test "$rc" && $rc $tmpdir/authorized_keys
> +	$(command -v sshd) -f $TST_TMPDIR/sshd_config || \
> +		tst_brk TBROK "Failed to run sshd daemon"
>  
> -	chmod 700 $tmpdir
> -	chmod 600 $tmpdir/*
> +	RHOST_SSH="ssh -$TST_IPVER -F $RHOST_SSH_CONF $(tst_ipaddr)"
>  }
>  
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
> +	[ $? -ne 0 ] && tst_brk TFAIL "SSH not reachable"
>  }
>  
> -test02()
> +test1()
>  {
> -	tst_resm TINFO "Log in/out by many clients asynchronously"
> -	tst_resm TINFO "'$CONNECTION_TOTAL' clients, time $NS_DURATION sec"
> +	local num all_conn pid
>  
> -	tst_rhost_run -s -c "ssh-stress02-rmt.sh $TST_IPVER $(tst_ipaddr) \
> -		$rconfig $CONNECTION_TOTAL $NS_DURATION"
> +	tst_res TINFO "Verify the ssh connectivity over IPv4/IPv6 is not broken after creating many ssh sessions"
                                                           ^
The message may have indicated the exact IP version with $TST_IPVER

>  
> -	tst_resm TPASS "Test is finished successfully"
> +	test_ssh_connectivity
> +
> +	RHOST_PIDS=
> +	num=0
> +	while [ $num -lt $CONNECTION_TOTAL ]; do
> +		pid=$(tst_rhost_run -c "$RHOST_SSH -N </dev/null 1>/dev/null 2>&1 \
> +			& echo \$!")
> +		RHOST_PIDS="$RHOST_PIDS $pid"
> +		num=$(($num + 1))
> +	done
> +
> +	tst_res TINFO "Killing all ssh sessions"
> +	num=0
> +	for pid in $RHOST_PIDS; do
> +		tst_rhost_run -c "kill $pid" >/dev/null
> +		[ $? -ne 0 ] && num=$((num + 1))

Do we need $((num + 1)) here? At least it could be used in the
message below instead of "some ssh"...

> +	done
> +	
> +	[ $num -ne 0 ] && tst_brk TFAIL "Some ssh processes died during execution"
> +
> +	test_ssh_connectivity
> +
> +	tst_res TPASS "Test finished successfully"
>  }
>  
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
> +			continue
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
> +		tst_sleep 1
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
>  
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
>  
> -	netstress -R 3 -g $port > tcp_server.log 2>&1 &
> +	# Start a tcp server
> +	netstress -R 3 -g $port >/dev/null 2>&1 &
> +	NETSTRESS_PID=$!


We can now use netstress -B, it will go to background only after sucessfully
performing bind()/listen(). The actual port number will be saved in the
netstress_port file, i.e.:

netstress -B .
port=$(cat netstress_port)

>  
> -	tst_rhost_run -s -c "ssh-stress03-rmt.sh $TST_IPVER $(tst_ipaddr) \
> -		$rconfig $port $NS_TIMES"
> +	# Setup an ssh tunnel from the remote host to testhost
> +	RHOST_PIDS=$(tst_rhost_run -c \
> +		"$RHOST_SSH -N -L $lport:$rhost:$port </dev/null 1>/dev/null 2>&1 \
> +		& echo \$!")
> +	tst_sleep 1

Why you don't use -f option with ssh? I wouldn't rely on sleep 1 here.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
