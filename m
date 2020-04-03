Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20819DC46
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:59:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 103633C2F98
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:59:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CF5AF3C2F7D
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:59:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 83D04600A3C
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:59:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68458AA7C;
 Fri,  3 Apr 2020 16:59:23 +0000 (UTC)
Date: Fri, 3 Apr 2020 18:59:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200403165922.GA20326@dell5510>
References: <20200403165432.19358-1-pvorel@suse.cz>
 <20200403165432.19358-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403165432.19358-3-pvorel@suse.cz>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> +++ b/runtest/net_stress.route
> @@ -2,11 +2,15 @@
>  route4-change-dst route-change-dst.sh
>  route4-change-gw route-change-gw.sh
>  route4-change-if route-change-if.sh
> +route4-change-netlink-dst route-change-netlink.sh
> +route4-change-netlink-gw route-change-netlink.sh -g
>  route4-redirect route4-redirect
>  route4-rmmod route4-rmmod

>  route6-change-dst route-change-dst.sh -6
>  route6-change-gw route-change-gw.sh -6
>  route6-change-if route-change-if.sh -6
> +route6-change-netlink-dst route-change-netlink.sh
> +route6-change-netlink-gw route-change-netlink.sh -g
>  route6-redirect route6-redirect
>  route6-rmmod route6-rmmod

I haven't updated the runtest file (route-change-netlink.sh =>
route-change-netlink-dst.sh and route-change-netlink-gw.sh)

Kind regards,
Petr

diff --git runtest/net_stress.route runtest/net_stress.route
index cfe31df02..0a8cfec39 100644
--- runtest/net_stress.route
+++ runtest/net_stress.route
@@ -2,15 +2,15 @@
 route4-change-dst route-change-dst.sh
 route4-change-gw route-change-gw.sh
 route4-change-if route-change-if.sh
-route4-change-netlink-dst route-change-netlink.sh
-route4-change-netlink-gw route-change-netlink.sh -g
+route4-change-netlink-dst route-change-netlink-dst.sh
+route4-change-netlink-gw route-change-netlink-gw.sh -g
 route4-redirect route4-redirect
 route4-rmmod route4-rmmod
 
 route6-change-dst route-change-dst.sh -6
 route6-change-gw route-change-gw.sh -6
 route6-change-if route-change-if.sh -6
-route6-change-netlink-dst route-change-netlink.sh
-route6-change-netlink-gw route-change-netlink.sh -g
+route6-change-netlink-dst route-change-netlink-dst.sh
+route6-change-netlink-gw route-change-netlink-gw.sh -g
 route6-redirect route6-redirect
 route6-rmmod route6-rmmod

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
