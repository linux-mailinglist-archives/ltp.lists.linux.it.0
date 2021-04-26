Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F736AC1A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 08:24:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D3543C27D9
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 08:24:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86E8F3C27D9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 08:24:02 +0200 (CEST)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 76A221400B80
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 08:24:01 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id c19so2353849pfv.2
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wd8MxVnannBeZRSQIjC5Pa9raneP/q3cUsQwmJ4rWEI=;
 b=AK5ouHPsQgO7/8X2RgLu/cH/aAsiaZkfCCqkDIJK6SvpKQMoYMVZeCKmUp2bsG2iqv
 FcaLqlcW3F4xDB+2AN+vHyt9CwG9gZfaBsICpo9L4ok/PMfPHzWH1Bcpup94YJjs9LVD
 /YyHtrQDxSOh484zb+WdAI0fXfYu/L+0FKjV9lIv2l2DKhCUmqs10sb0SdgbpWng1ux9
 zmRCDCRqEtDt9Ody7pBhm/OHLoxpERR8+gAsae5m9ki6nqaduES0mdxIXaDZ86yiHFWe
 bjKgZSnepIRzqpxeD7zPfENbVOk3ozpkEGFuaD5vKb6KhHCvDGwbkTFVUGTPBdGInwYU
 sitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wd8MxVnannBeZRSQIjC5Pa9raneP/q3cUsQwmJ4rWEI=;
 b=SbdnI8/Mvc8OFOjIG7Tqupqh7ZwXsLRhbe8NDHR/s5LgqlKxdoEs0Ou/tCLFG+fgT/
 u2QGM/JXndxl1QTi53S89z1hLLjc6J24IaVtHRIbB1RC5mkAhYhiy6Y9dHEu6Mz01aCw
 YaTFhtLlaQlcgNcRR5d9Ck4U029EYDVVZdyVg8I8Oo9vDtochAl2Pn25arbdZHBbg3ez
 BMZYHisEjo8QWsrs5O48i0q+zTK7kHvnnCwnEmVO+7IWjmywJqWyI/2zeI5ZhrnjaCO5
 sE0yKThWwk9TJnV9gqFNMeD9LT14BwG5al0LSkLxBZ091x7m/4OXp7TEus76vAjbTOXv
 AtWQ==
X-Gm-Message-State: AOAM531xjVtnzR7zqZaNDT+XWP7cRp6bi0izekYUIlzRHSHMaRSsrsw7
 CBbu50xZffa9IKMSq4u0LExNsQ==
X-Google-Smtp-Source: ABdhPJzh3jeHyqdlGnvNVJkA86i4NUeyzo5ZQYeTnJYnELwietCf2/DiZH/9ynJBBnDQ3PEofUgrNQ==
X-Received: by 2002:a62:ee09:0:b029:211:1113:2e7c with SMTP id
 e9-20020a62ee090000b029021111132e7cmr16025098pfi.49.1619418239883; 
 Sun, 25 Apr 2021 23:23:59 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id a27sm10291251pfl.64.2021.04.25.23.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 23:23:59 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:53:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210426062357.i72js3urkoofvzcj@vireshk-i7>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIZa4Ph81LmkEkLZ@pevik>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Cc: ltp@lists.linux.it, sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-04-21, 08:17, Petr Vorel wrote:
> Hi Viresh,
> 
> ...
> > > > -#if defined(__arch64__)
> > > > +#if defined(__mips64)
> > > So __arch64__ is not defined for mips 64 bit? (as it's defined for sparc 64bit?)
> > > __mips64 is obviously correct and better readable, but is it really required?
> 
> > I am not sure what you meant by "is it really required?" The #ifdef hackery here
> > ? It is as can be seen in include/uapi/asm-generic/shmbuf.h in Linux source.
> I mean if #if defined(__mips__) && defined(__arch64__) detect 64bit mips
> the patch would not be needed (although IMHO __mips64 is more descriptive than
> __arch64__, for which you need to search for which architecture it was defined).

Ahh, right.

Actually the kernel has this instead:

#if __BITS_PER_LONG == 64

> But I'm not sure myself if __arch64__ is defined for mips 64bit.

Neither do I.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
