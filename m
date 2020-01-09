Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B156D135766
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:51:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B53EF3C249F
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:51:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 68FD53C23D8
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:51:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E52E2201457
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:51:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35D0E6A255;
 Thu,  9 Jan 2020 10:51:03 +0000 (UTC)
Date: Thu, 9 Jan 2020 11:51:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200109105101.GA30367@dell5510>
References: <20191226135801.11839-1-alexey.kodanev@oracle.com>
 <20200103124851.GA24603@dell5510>
 <f65c32e4-e426-e6c9-5627-51bed11c31e6@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f65c32e4-e426-e6c9-5627-51bed11c31e6@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/iptables: add ipv6 support
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

> > now:
> > /bin/sh: 1: nft: not found
> > nft01 1 TBROK: nft add table ip filter failed

> Good catch, what about starting with init() in do_setup()?

> diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
> index 1ae086678..bf2a53c28 100755
> --- a/testcases/network/iptables/nft01.sh
> +++ b/testcases/network/iptables/nft01.sh
> @@ -13,6 +13,7 @@ cleanup_chain=0

>  do_setup()
>  {
> +       init
>         local ip_table="ip${TST_IPV6}"

>         if ! nft list table $ip_table filter > /dev/null 2>&1; then
> @@ -23,7 +24,6 @@ do_setup()
>                 ROD nft add chain $ip_table filter INPUT '{ type filter hook input priority 0; }'
>                 cleanup_chain=1
>         fi
> -       init
>  }

Great, what a simple fix :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
