Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5434526A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 23:26:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E64753C94FC
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 23:26:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9C0173C2857
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 10:26:17 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD60F2002B8
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 10:26:16 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD61A60233;
 Mon, 22 Mar 2021 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616405174;
 bh=E2bivXSoDRMs7r3zMZVSaMr3GBidjFUkYCkNU0ecnDs=;
 h=In-Reply-To:References:Subject:Cc:From:To:Date:From;
 b=gnV0wWkuwrUy4FWlG4rSqyC7z+OLCTzeqSL7gEv2kIA/p8ycJHV9+S0Dsklnv4QbU
 +SmVeBy8+KaUSfWOnGa+dQXgXZrNm4cyYNmOSRXisLoT+PLM4Zyt8WzubUgBldxEe/
 M/mQdFQh8sPBOkPUbBz+Bkz0+xCC8aoq9Wx73xhNlQrt4JfyAZIXhArxZLTS/RZ5uj
 vjZ3quCo/y393PCXarHrJWBKOQFIJBNpBEZFQfpT2cVBbgFhDc6WaFNz6DyfDAs/T8
 veh/Rx3ad7qNigCXWfVj73lRNZSbXbKv+SRlDG2QCpMWfXn9rhiUjQgw8w1vxXUhUe
 bV8Xid8fmCmQQ==
MIME-Version: 1.0
In-Reply-To: <20210322090536.GK1719932@casper.infradead.org>
References: <20210322083553.GI32426@xsang-OptiPlex-9020>
 <161640335063.3537.6668586361113979688@kwain.local>
 <20210322090536.GK1719932@casper.infradead.org>
From: Antoine Tenart <atenart@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <161640517096.3021.7957377947074787708@kwain.local>
Date: Mon, 22 Mar 2021 10:26:11 +0100
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 22 Mar 2021 23:26:08 +0100
Subject: Re: [LTP] [net] 5478fcd0f4:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
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
Cc: lkp@intel.com, lkp@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>,
 "David S. Miller" <davem@davemloft.net>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Quoting Matthew Wilcox (2021-03-22 10:05:36)
> On Mon, Mar 22, 2021 at 09:55:50AM +0100, Antoine Tenart wrote:
> > I only had a quick look at this, but I think the issue should be fixed
> > with:
> > 
> > diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> > index e16d54aabd4c..3ae3c20eb64c 100644
> > --- a/net/core/net-sysfs.c
> > +++ b/net/core/net-sysfs.c
> > @@ -1378,7 +1378,7 @@ static ssize_t xps_queue_show(struct net_device *dev, unsigned int index,
> >         nr_ids = dev_maps ? dev_maps->nr_ids :
> >                  (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
> >  
> > -       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +       mask = bitmap_zalloc(nr_ids, GFP_ATOMIC);
> >         if (!mask) {
> >                 rcu_read_unlock();
> >                 return -ENOMEM;
> 
> sysfs isn't a good reason to use GFP_ATOMIC.
> 
> try something like this:
> 
> -       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> +       mask = bitmap_zalloc(nr_ids, GFP_NOWAIT);
>         if (!mask) {
> +               int new_nr_ids;
> +
>                 rcu_read_unlock();
> -               return -ENOMEM;
> +               mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> +               if (!mask)
> +                       return -ENOMEM;
> +               rcu_read_lock();
> +               dev_maps = rcu_dereference(dev->xps_maps[type]);
> +               /* if nr_ids shrank while we slept, do not overrun array.
> +                * if it increased, we just won't show the new ones
> +                */
> +               new_nr_ids = dev_maps ? dev_maps->nr_ids :
> +                       (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
> +               if (new_nr_ids < nr_ids)
> +                       nr_ids = new_nr_ids;

Thanks for the suggestion, I'll look into that. We could also just
return -ENOMEM if the first allocation fails, retrying adds a lot of
complexity.

Antoine

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
