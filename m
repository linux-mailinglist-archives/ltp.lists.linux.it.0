Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D8B0FDE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 15:27:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32B8F3C20A4
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 15:27:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6617C3C025A
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 15:27:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D58BA1028308
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 15:26:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 589E1AF98;
 Thu, 12 Sep 2019 13:27:01 +0000 (UTC)
Date: Thu, 12 Sep 2019 15:26:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190912132659.GA22246@dell5510>
References: <20190903141610.28887-1-pvorel@suse.cz>
 <20190903141610.28887-2-pvorel@suse.cz>
 <867402c7-9a38-9646-6936-1eb6988a48b8@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <867402c7-9a38-9646-6936-1eb6988a48b8@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/7] tst_net.sh: enhance tst_add_ipaddr(),
 add tst_del_ipaddr()
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

> Hi Petr,
> On 03.09.2019 17:16, Petr Vorel wrote:
> > These changes are intended for easier handling with IP addresses
> > (not have to calculate dad for IPv6 when adding IP address).
> > Add -a IP and -s options to tst_add_ipaddr()

> > tst_del_ipaddr() (which uses internally tst_add_ipaddr()) is defined
> > mainly for better code readability.
> ...

> > -	tst_res_ TINFO "set remote addr $(tst_ipaddr rhost)/$mask"
> > -	tst_rhost_run -c "ip addr add $(tst_ipaddr rhost)/$mask dev $iface $dad"
> > +	tst_res_ TINFO "set remote addr $addr"

>                          ^
>                   Should be $action here?
Sure, thanks!


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
