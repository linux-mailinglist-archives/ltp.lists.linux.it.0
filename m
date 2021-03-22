Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DB343C41
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 10:06:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF5563C5424
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 10:06:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3A4443C297A
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 10:06:25 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C111E20099A
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 10:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y88xpMhgq5zhCFUMWKJhYJpArZg4gL5FM5u/M3LEbN0=; b=NG7ypSSQhKuIShw+4yjVov+Uxw
 ISo3H4b1YKU3thK66l5MuRg0hA+qGX28eHgUkWAqXnr6H7kJkR49zQZm6gwwerdOKX3IAERKulGlE
 F4RMGCb3Yt+ntR3VgoME/FqF56PbW/3r4fMpeOWeTM2xdemPZ4a44hy2gRF6GV6xNivkWUVWIhdlB
 9zWvM1l/sSUOoFQaDmzsk03dU7qwJIYn3ciZx/k9gqv0tpuU4VicwKSkpz7vxw2OfMiLaWbkS6rE/
 BRi4quh4eQAjEnISiOtj13/H57MnU7ntDPVPE7TN/FX804oY2h6pvPI3kvRhIYjiAHWwdy4jVFEHQ
 OC/R89Rw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lOGVE-008FGi-S6; Mon, 22 Mar 2021 09:05:41 +0000
Date: Mon, 22 Mar 2021 09:05:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Antoine Tenart <atenart@kernel.org>
Message-ID: <20210322090536.GK1719932@casper.infradead.org>
References: <20210322083553.GI32426@xsang-OptiPlex-9020>
 <161640335063.3537.6668586361113979688@kwain.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161640335063.3537.6668586361113979688@kwain.local>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On Mon, Mar 22, 2021 at 09:55:50AM +0100, Antoine Tenart wrote:
> I only had a quick look at this, but I think the issue should be fixed
> with:
> 
> diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> index e16d54aabd4c..3ae3c20eb64c 100644
> --- a/net/core/net-sysfs.c
> +++ b/net/core/net-sysfs.c
> @@ -1378,7 +1378,7 @@ static ssize_t xps_queue_show(struct net_device *dev, unsigned int index,
>         nr_ids = dev_maps ? dev_maps->nr_ids :
>                  (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
>  
> -       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
> +       mask = bitmap_zalloc(nr_ids, GFP_ATOMIC);
>         if (!mask) {
>                 rcu_read_unlock();
>                 return -ENOMEM;

sysfs isn't a good reason to use GFP_ATOMIC.

try something like this:

-       mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
+       mask = bitmap_zalloc(nr_ids, GFP_NOWAIT);
        if (!mask) {
+               int new_nr_ids;
+
                rcu_read_unlock();
-               return -ENOMEM;
+               mask = bitmap_zalloc(nr_ids, GFP_KERNEL);
+               if (!mask)
+                       return -ENOMEM;
+               rcu_read_lock();
+               dev_maps = rcu_dereference(dev->xps_maps[type]);
+               /* if nr_ids shrank while we slept, do not overrun array.
+                * if it increased, we just won't show the new ones
+                */
+               new_nr_ids = dev_maps ? dev_maps->nr_ids :
+                       (type == XPS_CPUS ? nr_cpu_ids : dev->num_rx_queues);
+               if (new_nr_ids < nr_ids)
+                       nr_ids = new_nr_ids;


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
