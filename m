Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AC25589F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 12:33:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADD1E3C2218
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 12:33:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8C28E3C2218
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:33:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 135D2200D45
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 12:33:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 224C2AD52;
 Fri, 28 Aug 2020 10:34:26 +0000 (UTC)
Date: Fri, 28 Aug 2020 12:33:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200828103351.GA12046@dell5510>
References: <1598005119-2147-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200828084818.GB1648@dell5510>
 <373798f7-d1e4-330a-0911-efcd6f1d1480@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <373798f7-d1e4-330a-0911-efcd6f1d1480@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_af_alg: fix build error when
 ALG_SET_AEAD_ASSOCLEN undefined
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

Hi Xu,

> Hi Petr

> > Hi,

> > ...
> > > --- a/configure.ac
> > > +++ b/configure.ac
> > > @@ -193,6 +193,12 @@ AC_CHECK_TYPES([struct xt_entry_match, struct xt_entry_target],,,[
> > >   #include <linux/netfilter_ipv4/ip_tables.h>
> > >   ])

> > > +AC_CHECK_TYPES([struct sockaddr_alg, struct af_alg_iv],,,[
> > > +#ifdef HAVE_LINUX_IF_ALG_H
> > > +# include <linux/if_alg.h>
> > > +#endif
> > IMHO <linux/if_alg.h> does not need to be guarded.
> > (as the definitions are in it it either fail because missing or fail because not
> > loaded)
> > > +])
> Yes. Do you merge this patch with deleting this ifdef? Or I sent a v2 patch
> for this.

> Also, I think you can remove" #ifdef HAVE_LINUX_IF_PACKET_H" pair in
> configure.ac
> AC_CHECK_TYPES([struct tpacket_req3],,,[
> #ifdef HAVE_LINUX_IF_PACKET_H
> # include <linux/if_packet.h>
> #endif
> ])
I'll fix it and merge.

Kind regards,
Petr

> Best Regards
> Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
