Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C51511A47D8
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 17:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 325BE3C2C7E
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Apr 2020 17:27:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 00C1E3C2C68
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 17:27:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8AADB600BA5
 for <ltp@lists.linux.it>; Fri, 10 Apr 2020 17:27:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6301AE63;
 Fri, 10 Apr 2020 15:27:10 +0000 (UTC)
Date: Fri, 10 Apr 2020 17:27:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200410152709.GA2245028@x230>
References: <20200403165432.19358-1-pvorel@suse.cz>
 <20200403165432.19358-3-pvorel@suse.cz>
 <06e299d0-0663-a868-f8cc-1f9002d9d43f@oracle.com>
 <20200409183714.GA915479@x230>
 <bd634f12-b4f2-18ad-c2f3-ab5e42a0c973@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd634f12-b4f2-18ad-c2f3-ab5e42a0c973@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

> Then, for now we can pass arbitrary port, no need for tst_get_unused_port(),
> e.g. 65535.
Right, it really does not matter to check that port.


> >>> +	EXPECT_PASS route-change-netlink -c $NS_TIMES -d $(tst_iface) $ip_flag -p $port $ROUTE_CHANGE_NETLINK_PARAMS

> >> EXPECT_PASS doesn't handle TCONF when libmnl-devel is missing.

> > Thanks, I'll fix it.

> > tst_test.c:865: CONF: libmnl library and headers are required
> > route-change-netlink-gw 1 TFAIL: route-change-netlink -c 10 -d ltp_ns_veth2 -p 40645 -g 10.23.1.7^10.23.1.6^10.23.1.5^10.23.1.4^10.23.1.3^ -l 10.23.1.1 -r 10.23.0.1 failed unexpectedly

> > I propose to handle this in EXPECT_PASS() (send a separate RFC patch for it).

> Not sure if it would work for non-ltp binaries...
True. Do you think there would be more usage for something like
EXPECT_PASS_LTP(), where I'd handle 32 as TCONF, 3 as TFAIL, 4 as TWARN?
I can handle it just in the test.

BTW there is this error handling already in tst_netload() for netstress.c, so
there could be function which returns $res according to exit code and
EXPECT_PASS_LTP() which uses it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
