Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F472F3CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:23:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12B033C54C4
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:23:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 56B8F3C5451
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:23:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2448A60054A
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:23:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A99EB8FF;
 Wed, 13 Jan 2021 00:23:26 +0000 (UTC)
Date: Wed, 13 Jan 2021 01:23:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <X/49fDxHpYWfnlE2@pevik>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125053459.3314021-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
...
> +do_test()
> +{
> +	tst_res TINFO "Verify that the kernel is not crashed when joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of UDP packets at each socket in $NS_DURATION seconds"
> +
> +	local n=0
> +	while [ $n -lt $MCASTNUM_NORMAL ]; do
> +		# Define the multicast address
> +		if [ "$TST_IPV6" ]; then
> +    		local n_hex=$(printf "%x" $n)
> +    		local addr=${MCAST_IPV6_ADDR_PREFIX}:${n_hex}
> +		else
> +			local x=$((n / 254))
> +			local y=$((n % 254 + 1))
> +			local addr=${MCAST_IPV4_ADDR_PREFIX}.${x}.${y}
> +		fi
> +
> +		local port=$(tst_get_unused_port ipv${TST_IPVER} dgram)
> +		[ $? -ne 0 ] && tst_brk TBROK "No free udp port available."
> +		tst_res TINFO Port: $port
> +
> +		# Run a receiver
> +		ROD ns-mcast_receiver -f $TST_IPVER -I $(tst_iface lhost) -m $addr -p $port -b
> +	
> +		# Run a sender
> +		tst_rhost_run -s -c "ns-udpsender -D $addr -f $TST_IPVER -p $port -m -I $(tst_iface rhost) -b -t $NS_DURATION"
> +
> +		: $((n += 1))
> +	done
> +
> +	sleep $NS_DURATION
FYI: although this is in old tests, IMHO it's useless, thus I'll remove it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
