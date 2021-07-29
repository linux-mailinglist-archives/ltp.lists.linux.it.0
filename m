Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 488833D9EEB
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:42:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08E8D3C8F71
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 09:42:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49C7E3C6304
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:42:34 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D9CE81000EC1
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 09:42:32 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16T7fdkj026818;
 Thu, 29 Jul 2021 15:41:39 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 29 Jul 2021
 15:41:36 +0800
Date: Thu, 29 Jul 2021 15:41:33 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210729074133.GA21036@andestech.com>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
 <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
 <YQAFcVwvz+eXGOsk@yuki> <YQAP8hoNpE+xykFA@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQAP8hoNpE+xykFA@pevik>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16T7fdkj026818
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 Alan Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, 
On Tue, Jul 27, 2021 at 09:53:54PM +0800, Petr Vorel wrote:
> Hi,
> 
> FYI this discussion is on v4, there is already v5 (marking it changes requested
> in patchwork) and obviously v6 will be needed. Leo, I suppose you'll implement
> everything mentioned here in v6.
> 

No problem! Thanks for all the advice!
Will prepare a v6 soon!


> > Hi!
> > > I had a first look at this patches and was curious, what the reasoning 
> > > behind the "/" is.
> +1 I should have ask myself as well :).
> 
> > > The comment you suggest is wrong. The / was introduced to prevent 
> > > unmounting some other mountpoint,
> > > where the device was cgroup.
> > > Imho the approach of adding a / to the end was wrong and intransparent. 
> > > I would rather use "./cgroup" or "$PWD/cgroup".
> 
> > Passing full path to the cgroup directory sound much safer to me
> > especially when the directory name is just 'cgroup', try it yourself:
> 
> > device=cgroup/; grep "${device%/}" /proc/mounts
> 
> > On my machine this yields 10 lines and 21 matches.
> 
> > > If possible, I'd actually change tst_umount, to always unmount the 
> > > mountpoint and not the device, i.e. if the given path is not an absolute 
> > > path, make it absolute (e.g. by prepending $PWD").
> > > This way the check if the mountpoint exist wouldn't be the fuzzy thing 
> > > it is right now.
> +1

> 
> > Strongly agree here.
> 
> > I would go even one step further and change the library so that it
> > rejects anything that does not start with '/'.
> +1
> 

Will include both points in v6 patch!

> Kind regards,
> Petr

Best regards,
Leo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
