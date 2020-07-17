Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE92239F1
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:04:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BE4A3C2919
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 13:04:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 21DF43C2629
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:04:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 43F851A01083
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 13:04:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFAA8B8ED;
 Fri, 17 Jul 2020 11:04:16 +0000 (UTC)
Date: Fri, 17 Jul 2020 13:04:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200717110408.GA47598@x230>
References: <1594959191-25155-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200717073842.GA31254@dell5510> <20200717080840.GB32407@dell5510>
 <1eac1ed9-66dd-5141-0bc2-cc05312704c8@cn.fujitsu.com>
 <20200717103816.GA28835@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717103816.GA28835@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/io_uring.h: Add declaration of __kernel_rwf_t
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > how about the follwing change

> > +#ifdef __CHECKER__
> > +#define __bitwise__ __attribute__((bitwise))
> > +#else
> > +#define __bitwise__
> > +#endif
> > +#define __bitwise __bitwise__
> > +
> > +#ifndef __kernel_rwf_t
> > +typedef int __bitwise __kernel_rwf_t;
> > +#endif

> > Also, I think we should replace _u32 with uint32 in lapi/loop.h if we 
> > don't want to include linux kernel header for single use.

> The whole __bitwise is used only by a sparse checker, there is no point
> to include it in LTP. So we can just typedef the __kernel_rwf_t to int.
Make sense, going to push this variant.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
