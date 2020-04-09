Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6911A39E0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 20:37:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F02483C2CF6
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 20:37:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A85C63C0300
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 20:37:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0EC70140138F
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 20:37:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8835AC19;
 Thu,  9 Apr 2020 18:37:15 +0000 (UTC)
Date: Thu, 9 Apr 2020 20:37:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200409183714.GA915479@x230>
References: <20200403165432.19358-1-pvorel@suse.cz>
 <20200403165432.19358-3-pvorel@suse.cz>
 <06e299d0-0663-a868-f8cc-1f9002d9d43f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06e299d0-0663-a868-f8cc-1f9002d9d43f@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 2/2] net/route: Add netlink based route
 change gw/dest tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

thanks for your review!

> > diff --git a/testcases/network/stress/route/route-change-gw.sh b/testcases/network/stress/route/route-change-gw.sh
...
> >  setup()
> >  {
> >  	tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
> > -
> > -	rt="$(tst_ipaddr_un -p 0 0)"
> > -	lhost="$(tst_ipaddr_un 1 1)"
> > -	rhost="$(tst_ipaddr_un 0 1)"
> > -	tst_add_ipaddr -s -q -a $lhost
> > -	tst_add_ipaddr -s -q -a $rhost rhost
> > +	setup_gw
> >  }

> TST_SETUP=setup_gw

OK, I hesitated, whether
tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
should be part of setup_gw() or not in the end I accidentally left it on both
places. OK, I'll keep it in setup_gw() and remove from
route-change-netlink-gw.sh + use TST_SETUP=setup_gw here (in
route-change-gw.sh).

> > diff --git a/testcases/network/stress/route/route-lib.sh b/testcases/network/stress/route/route-lib.sh
...
> > +test_netlink()
> > +{
> > +	local ip_flag
> > +	[ "$TST_IPV6" ] && ip_flag="-6"
> > +
> > +	local port=$(tst_rhost_run -s -c "tst_get_unused_port ipv${TST_IPVER} dgram")
> > +

> What will be listen on this remote port?
Nothing. We've talked about it in the past. I struggled to setup remote workers
(problems to detect that the setup is up before testing starts), but I can
rethink it again. What do you suggest: one daemon which would run several
threads (each of them bind to specific IP) or several single thread instances?
IMHO not binding to specific IP does not garant traffic is taking path we want.

> > +	EXPECT_PASS route-change-netlink -c $NS_TIMES -d $(tst_iface) $ip_flag -p $port $ROUTE_CHANGE_NETLINK_PARAMS

> EXPECT_PASS doesn't handle TCONF when libmnl-devel is missing.

Thanks, I'll fix it.

tst_test.c:865: CONF: libmnl library and headers are required
route-change-netlink-gw 1 TFAIL: route-change-netlink -c 10 -d ltp_ns_veth2 -p 40645 -g 10.23.1.7^10.23.1.6^10.23.1.5^10.23.1.4^10.23.1.3^ -l 10.23.1.1 -r 10.23.0.1 failed unexpectedly

I propose to handle this in EXPECT_PASS() (send a separate RFC patch for it).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
