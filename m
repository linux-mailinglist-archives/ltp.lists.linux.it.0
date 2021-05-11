Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D227A37A809
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:47:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F7863C8BE2
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 15:47:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C41B93C6499
 for <ltp@lists.linux.it>; Tue, 11 May 2021 15:47:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E73B31400DBC
 for <ltp@lists.linux.it>; Tue, 11 May 2021 15:47:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A392AEB6;
 Tue, 11 May 2021 13:47:52 +0000 (UTC)
Date: Tue, 11 May 2021 15:47:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YJqLBoT36RG1Icon@pevik>
References: <20210511091630.23257-1-dongshijiang@inspur.com>
 <YJp2u+lUy9VMq9Wb@pevik>
 <d1dc697b-f73a-3be4-c5df-151aae021265@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1dc697b-f73a-3be4-c5df-151aae021265@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for network/lib6/getaddrinfo_01.c
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
Cc: dongshijiang <dongshijiang@inspur.com>,
 Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

thank you for your input!

> >> For test cases (test2 ,IPV4 canonical name) and (test13 ,IPV6 canonical name)

> >> The gethostname() API returns the official name of host, not the canonical name of host.
> >> The canonical name of host needs to be obtained through the gethostbyname() API;

> > Yes, test 2 and 13 fails systems which don't use FQDN as hostname and have DNS records
> > due mismatch short name and FQDN, e.g.:
> > getaddrinfo_01    2  TFAIL  :  getaddrinfo_01.c:140: getaddrinfo IPv4 canonical name ("foo.suse.cz") doesn't match hostname ("foo")

> > It's a bit strange to use deprecated gethostbyname() in getaddrinfo() tests :).

> Yeah, gethostbyname() is obsolete, we shouldn't compare both here,
> i.e. getaddrinfo() vs gethostbyname()...

> > Yes, it's the easiest way to get FQDN instead of just "short" hostname. But
> > Maybe simple check if we have FQDN with strchr for dot and TCONF it's just short
> > name would be better.

> +1, and instead of TCONF we could check the "shortname" that
> we pass to getaddrinfo():
shortname variable always contains "short name" (obviously).
But with correct configuration (e.g. search example.com in /etc/resolv.conf for
DNS or valid IP setup ADDR foo.suse.cz foo in /etc/hosts) it works.
The problem is really with value we use to check the result (i.e. now hostname).

> >>  	shortname[MAXHOSTNAMELEN] = '\0';
> >>  	p = strchr(shortname, '.');
> >>  	if (p)

> ...

> > FYI Workaround on systems which do not have DNS record is to use /etc/fstab.
> > We should document in testcases/network/README.md that when using /etc/fstab,

> /etc/hosts

Lol, sorry :)


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
