Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 232FA2E0264
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 23:18:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C32D33C5739
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 23:18:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 19E763C2A11
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 23:18:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 717FD1401171
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 23:18:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B552AAE66;
 Mon, 21 Dec 2020 22:18:39 +0000 (UTC)
Date: Mon, 21 Dec 2020 23:18:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201221221838.GC4453@pevik>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125053459.3314021-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] network/stress/multicast/packet-flood:
 Update to new API
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


Minor comments, please update them if v4 needed.
Otherwise it can be fixed during merge.
Thanks for your work.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> @@ -0,0 +1,55 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2006 International Business Machines  Corp.
> +# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> +# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> +#
> +# Verify that the kernel is not crashed when joining multiple multicast
> +# groups on separate sockets, then receiving a large number of UDP
> +# packets at each socket
> +
> +TST_NEEDS_ROOT=1
> +. mcast-lib.sh
> +
> +do_setup()
> +{
> +	mcast_setup $n_NORMAL


This should be (error during global replace):

	mcast_setup $MCASTNUM_NORMAL

> +	MCAST_LCMD=ns-mcast_receiver
> +	MCAST_RCMD=ns-udpsender
> +}
> +
> +do_test()
> +{
> +	tst_res TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of UDP packets at each socket in $NS_DURATION seconds"
I'd prefer these drop boilerplate "Verify that the kernel is not crashed when"
+ the same in the description at the top of the file.

> +
> +	local n=0
> +	while [ $n -lt $MCASTNUM_NORMAL ]; do
> +		# Define the multicast address
> +		if [ "$TST_IPV6" ]; then
> +    		local n_hex=$(printf "%x" $n)
> +    		local addr=${MCAST_IPV6_ADDR_PREFIX}:${n_hex}
nit: wrong indent

> +		else
> +			local x=$((n / 254))
> +			local y=$((n % 254 + 1))
> +			local addr=${MCAST_IPV4_ADDR_PREFIX}.${x}.${y}
> +		fi
> +
> +		local port=$(tst_get_unused_port ipv${TST_IPVER} dgram)
> +		[ $? -ne 0 ] && tst_brk TBROK "No free udp port available."
nit: no dot please.

> +		tst_res TINFO Port: $port
This should be quoted.

> +
> +		# Run a receiver
> +		ROD ns-mcast_receiver -f $TST_IPVER -I $(tst_iface lhost) -m $addr -p $port -b
> +	
> +		# Run a sender
> +		tst_rhost_run -s -c "ns-udpsender -D $addr -f $TST_IPVER -p $port -m -I $(tst_iface rhost) -b -t $NS_DURATION"
> +
> +		: $((n += 1))
sure this works, but I'd prefer:
n=$((n += 1))
> +	done

The rest LGTM.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
