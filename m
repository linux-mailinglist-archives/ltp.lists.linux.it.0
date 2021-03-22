Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81234526C
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 23:26:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 795093C9500
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 23:26:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 129313C0EF5
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 15:33:08 +0100 (CET)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A72DD60086D
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 15:33:08 +0100 (CET)
Received: by mail-il1-x136.google.com with SMTP id d2so15010409ilm.10
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/cDRTAC1Vc+ZRykhyHXSrcA5favyfg0y6H7wgohyAQ=;
 b=gDrmLkEXOSWQNDk845SNHYSbKVwMnhfJCAiqRKHj6GIAhmr2f6RqYDrPhypk95aXzF
 gUZzLIQo/CbSNasomeR4f1RHkj9GuuMnvMke7FuxRZnTFlsCwijuue7VtzioqT5pvjUc
 8LkexkLrPYrS304Y3wK8pTSRdZ2+HiNmbPtTzkHtJWB8LOtTp4aIScaiW+hXwkvEG7Kj
 Ui3RBcOK7nBbw1HqdRvRN9RG9iFF2unZT+AOWUSHqMDyseDOnFP4AIdcDicD3vDxGGOI
 DRa05+6dPerE1lBeSMObDtwekYhMmeL8E/Xkw5jHahlH8/kCqzYN1iAsP052Cd3r9uzX
 Uvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/cDRTAC1Vc+ZRykhyHXSrcA5favyfg0y6H7wgohyAQ=;
 b=dVnd6AdC56y7oP/dXkfApAosA4T72xn6GJ2P+GeeOjKJiRn9Givn3hpSTyzumL+DcJ
 87bDWzmcN8jAXjIREmlS7gPh75KE8qZKuSBvGGvOjPwoC2rzBu92oEmG6MR5VFUE4tTi
 YCiWfzj77NFuc4t9elKGZ5wfhRpbu0crjtlpqgyes+r9SZ7QJ4/xnC2S30r0IDDBF0t0
 mU5hwcc2TVFwiFjAKHUv3xgs81nw3yp6Em4EPy/VLmzw9wyP60E1Hii2gOrSU+32dvw1
 nPVLfaFoD64sWYV2OZFl6pm2ELLSO5/ozskJ2/hk9jSeIl6JJL15NSJsjQhda82Pooc1
 JeQA==
X-Gm-Message-State: AOAM533yL+rT6RtvSHYW+ek9aIwEW9CTEeFzAJ8mwLEXRgb3Y44Jax3K
 slDu+aVKJnLRScxPvokGnLYA47ApP7X5vksUVVw=
X-Google-Smtp-Source: ABdhPJzzfiZ/qMRGQpJASxVzwtYpebwPvOmU60CU34jlZ8o1+2sYKqsFR/TDMIRtROiECm4+bDqDmQ7siEEoSJyHzfo=
X-Received: by 2002:a05:6e02:1069:: with SMTP id
 q9mr241580ilj.97.1616423587457; 
 Mon, 22 Mar 2021 07:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210322083553.GI32426@xsang-OptiPlex-9020>
 <161640335063.3537.6668586361113979688@kwain.local>
 <20210322090536.GK1719932@casper.infradead.org>
 <161640517096.3021.7957377947074787708@kwain.local>
In-Reply-To: <161640517096.3021.7957377947074787708@kwain.local>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 22 Mar 2021 07:32:56 -0700
Message-ID: <CAKgT0UdKtBU22dwnZmkP8+kjDBRhOZHc9-V3PhfsR+4Tt-N3nA@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: kbuild test robot <lkp@intel.com>, lkp@lists.01.org,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>,
 "David S. Miller" <davem@davemloft.net>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Mar 22, 2021 at 2:26 AM Antoine Tenart <atenart@kernel.org> wrote:
>
> Quoting Matthew Wilcox (2021-03-22 10:05:36)
> > On Mon, Mar 22, 2021 at 09:55:50AM +0100, Antoine Tenart wrote:
> > > I only had a quick look at this, but I think the issue should be fixed
> > > with:
> > >
> > > diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> > > index e16d54aabd4c..3ae3c20eb64c 100644
> > > --- a/net/core/net-sysfs.c
> > > +++ b/net/core/net-sysfs.c
> > > @@ -1378,7 +1378,7 @@ static ssize_t xps_queue_show(struct net_device *dev, unsigned int index,
> > >         nr_ids = dev_maps ? dev_maps->nr_ids :
> > >                  (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
> > >
> > > -       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> > > +       mask = bitmap_zalloc(nr_ids, GFP_ATOMIC);
> > >         if (!mask) {
> > >                 rcu_read_unlock();
> > >                 return -ENOMEM;
> >
> > sysfs isn't a good reason to use GFP_ATOMIC.
> >
> > try something like this:
> >
> > -       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +       mask = bitmap_zalloc(nr_ids, GFP_NOWAIT);
> >         if (!mask) {
> > +               int new_nr_ids;
> > +
> >                 rcu_read_unlock();
> > -               return -ENOMEM;
> > +               mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> > +               if (!mask)
> > +                       return -ENOMEM;
> > +               rcu_read_lock();
> > +               dev_maps = rcu_dereference(dev->xps_maps[type]);
> > +               /* if nr_ids shrank while we slept, do not overrun array.
> > +                * if it increased, we just won't show the new ones
> > +                */
> > +               new_nr_ids = dev_maps ? dev_maps->nr_ids :
> > +                       (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
> > +               if (new_nr_ids < nr_ids)
> > +                       nr_ids = new_nr_ids;
>
> Thanks for the suggestion, I'll look into that. We could also just
> return -ENOMEM if the first allocation fails, retrying adds a lot of
> complexity.
>
> Antoine

I agree that the retry logic is probably unneeded. In addition we
probably don't need GFP_ATOMIC as GFP_NOWAIT will probably be good
enough as the allocation can fail and just return an -ENOMEM in the
case of low memory.

Thanks.

- Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
