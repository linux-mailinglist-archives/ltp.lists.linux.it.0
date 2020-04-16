Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68B1AC563
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 16:19:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E43023C648B
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 16:19:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C3E813C2AF6
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 16:19:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2E5EE1000BE3
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 16:19:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10CBFAE53;
 Thu, 16 Apr 2020 14:19:13 +0000 (UTC)
Date: Thu, 16 Apr 2020 16:19:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200416141909.GA16790@dell5510>
References: <20200414152412.8278-1-pvorel@suse.cz>
 <20200414152412.8278-3-pvorel@suse.cz>
 <b7673e46-60de-9039-5179-3d96c0b9a538@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7673e46-60de-9039-5179-3d96c0b9a538@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] net/route: Add netlink based route change
 gw/dest tests
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

> > +++ b/runtest/net_stress.route
> > @@ -2,11 +2,15 @@
> >  route4-change-dst route-change-dst.sh
> >  route4-change-gw route-change-gw.sh
> >  route4-change-if route-change-if.sh
> > +route4-change-netlink-dst route-change-netlink-dst.sh
> > +route4-change-netlink-gw route-change-netlink-gw.sh -g
> >  route4-redirect route4-redirect
> >  route4-rmmod route4-rmmod

> >  route6-change-dst route-change-dst.sh -6
> >  route6-change-gw route-change-gw.sh -6
> >  route6-change-if route-change-if.sh -6
> > +route6-change-netlink-dst route-change-netlink-dst.sh
> > +route6-change-netlink-gw route-change-netlink-gw.sh -g

> "-6" option?
Thanks!
+ -g should not be there (first I thought I'd have a single script).

> > +++ b/testcases/network/stress/route/route-change-netlink.c
...
> > +#define IP_ADDR_DELIMITER '^'

> Why not to use more obvious delimiter, comma?
+1
BTW going to use IP_ADDR_DELIM (shorter name).

...
> > +struct ip_addr {
> > +	char ip[INET6_ADDRSTRLEN];

> What about adding 'struct addrinfo' here, and use it instead of ip
> string manipulation during the test?
Hm, probably good idea.
String manipulation is needed for creating destination (char dst[INET6_ADDRSTRLEN]).
But that should be done during setup as well => would it be better to have also
struct ip_addr *dst?

I separated number if IP from number of loops, so one can have really big loop
to stress system without requiring a lot of memory.

...
> > +int save_ip(struct ip_addr **list, char *item)
> > +{
> > +	int len = 0;
> > +
> > +	while ((item = strtok(item, CHR2STR(IP_ADDR_DELIMITER))) != NULL) {
> > +		save_ip_str(list, item);
> > +		item = NULL;
> > +		len++;
> > +	}
> > +
> > +	return len;
> > +}
> > +

> It would be better to pass a callback (save_ip_str or save_iface_str), these
> two functions are almost identical.
+1

...
> > +static void send_udp(char *local, char *remote)
> > +{
> > +	fd = SAFE_SOCKET(family, SOCK_DGRAM, IPPROTO_UDP);
> > +
> > +	struct addrinfo hints;
> > +	memset(&hints, 0, sizeof(struct addrinfo));
> > +	hints.ai_family = family;
> > +	hints.ai_socktype = SOCK_DGRAM;
> > +	hints.ai_flags = 0;
> > +	hints.ai_protocol = 0;
> > +	hints.ai_addr = INADDR_ANY;

> It seems this block can be moved to setup, socket() and hints.
+1

> > +
> > +	tst_setup_addrinfo(local, NULL, &hints, &lhost_addrinfo);

> lhost_addrinfo - is it used?
No, it's not, thanks. Yes, it does not make even sense, as code is for client.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
