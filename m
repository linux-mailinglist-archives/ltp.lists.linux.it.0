Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9982B69BB
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 17:16:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3EBE3C6466
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 17:16:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 730AB3C0041
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 17:16:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E89291400990
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 17:16:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B938AC23;
 Tue, 17 Nov 2020 16:16:38 +0000 (UTC)
Date: Tue, 17 Nov 2020 17:16:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201117161636.GA44486@pevik>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/route: Rewrite route-rmmod to new API
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

Hi Alexey,

thanks for your comments.

> > +module='veth'
> > +TST_NEEDS_DRIVERS="$module"
> > +
> > +. route-lib.sh
> > +TST_CNT=$ROUTE_CHANGE_IP
> > +
> > +setup()
> > +{
> > +	tst_res TINFO "adding IPv$TST_IPVER route destination and delete network driver $ROUTE_CHANGE_IP times"
> > +}

> It is probably unsafe to go straight to the do_test() and removing
> the veth... it would be nice to check that it is indeed using default
> ltp netns, and veth not used for other interfaces, TCONF otherwise...
I had this in old version and thought it's not necessary. OK, with check (or
better custom setup you suggest later) is safer for paralel run, which LTP
hopefully sooner or later support).

> Perhaps in init_ltp_netspace(), create a special symlink in the if block,
> where the default ltp netns created:

> if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
>    ...
>    ROD ln -s /var/run/netns/ltp_ns /var/run/netns/ltp_ns_default
>    ...
> }

> then check via this function:

> is_ltp_ns_default()
> {
> 	test -f /var/run/netns/ltp_ns_default
> }

Interesting.

> BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
> and remove that driver, so that this test can be run with custom setup, and
> with remote host setup?
I actually had version with add_macvlan(), but than I thought using netns is
enough. OK, I'll move back to that version (paralel run).

I also had a concert, that only virtualized drivers are tested.
Hope this simplification is ok.

> > +
> > +cleanup()
> > +{
> > +	modprobe $module
> > +	route_cleanup
> > +}
> > +
> > +do_test()
> > +{
> > +	local iface="$(tst_iface)"
> > +	local rt="$(tst_ipaddr_un -p $1)"
> > +	local rhost="$(tst_ipaddr_un $1 1)"
> > +
> > +	tst_res TINFO "testing route '$rt'"
> > +
> > +	tst_add_ipaddr -s -q -a $rhost rhost
> > +	ROD ip route add $rt dev $iface
> > +	EXPECT_PASS_BRK ping$TST_IPV6 -c1 -I $(tst_ipaddr) $rhost \>/dev/null
> > +
> > +	ROD rmmod $module

> ROD modprobe -r $module

+1, thanks!

> > +	ROD modprobe $module
> > +	reset_ltp_netspace

> should be in cleanup too, in case of test timeout or TBROK?
You mean reset_ltp_netspace? IMHO route_cleanup is enough, but I'll have a
closer look.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
