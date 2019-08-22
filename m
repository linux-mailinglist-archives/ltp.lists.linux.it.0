Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CB98F71
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 11:35:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27213C1CE7
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 11:35:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0538B3C1CE7
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 11:35:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 94A85200C21
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 11:35:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C053CAD82;
 Thu, 22 Aug 2019 09:35:35 +0000 (UTC)
References: <20190808153825.18363-1-rpalethorpe@suse.com>
 <20190808153825.18363-2-rpalethorpe@suse.com>
 <5D5E5551.9050308@cn.fujitsu.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
In-reply-to: <5D5E5551.9050308@cn.fujitsu.com>
Date: Thu, 22 Aug 2019 11:35:35 +0200
Message-ID: <87tva9v8yg.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Reply-To: rpalethorpe@suse.de
Cc: Michael Moese <mmoese@suse.com>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,
> Hi Richard
>
> If we use _LINUX_CAPABILITY_VERSION_1, kernel will report the following warning: `cap_test' uses 32-bit capabilities (legacy support in use)
>
> _LINUX_CAPABILITY_VERSION_2 has been deprecated since kernel 2.6.25, so we can only use _LINUX_CAPABILITY_VERSION_3.
>
> But _LINUX_CAPABILITY_VERSION_3 uses 64-bit capabilities as man-page said, effective defined as uint32_t in tst_cap_usr_data is not enough.
> I guess we need to define cur[2] ,new[2] and compare. Also, it can slove the EPERM failure as Li wang's cap_test.c found.
>  ps: I changed  kernel code to track this problem.
> diff --git a/security/commoncap.c b/security/commoncap.c
> index f4ee0ae106b2..291eb4e71031 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -247,24 +247,31 @@ int cap_capset(struct cred *new,
>         if (cap_inh_is_capped()&&
>             !cap_issubset(*inheritable,
>                           cap_combine(old->cap_inheritable,
> -                                     old->cap_permitted)))
> +                                     old->cap_permitted))) {
>                 /* incapable of using this inheritable set */
> +               printk("xuyang 0\n");
>                 return -EPERM;
> +       }
>
>         if (!cap_issubset(*inheritable,
>                           cap_combine(old->cap_inheritable,
> -                                     old->cap_bset)))
> +                                     old->cap_bset))) {
>                 /* no new pI capabilities outside bounding set */
> +               printk("xuyang 1\n");
>                 return -EPERM;
> +       }
>
>         /* verify restrictions on target's new Permitted set */
> -       if (!cap_issubset(*permitted, old->cap_permitted))
> +       if (!cap_issubset(*permitted, old->cap_permitted)) {
> +               printk("xuyang  2\n");
>                 return -EPERM;
> +       }
>
>         /* verify the _new_Effective_ is a subset of the _new_Permitted_ */
> -       if (!cap_issubset(*effective, *permitted))
> +       if (!cap_issubset(*effective, *permitted)) {
> +               printk("xuyang 3\n");
>                 return -EPERM;
> -
> +       }
>         new->cap_effective   = *effective;
>         new->cap_inheritable = *inheritable;
>
> #./cap_test  (dmesg will report "xuyang 3",return EPERM if use version 3)
>
> Thanks
> Yang Xu

Yes, sorry I should have said earlier. I am converting it to use 64bit
capabilities. Also I have created some tests for this and will try to
use the upper bits.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
