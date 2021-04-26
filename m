Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AA36ABEF
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 07:56:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E24D53C66C3
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 07:56:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7CA83C1948
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 07:56:01 +0200 (CEST)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CDD9F2000E9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 07:56:00 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id s14so21487798pjl.5
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bYO1wht3CnOFclQFxu5e8NWGNPLvxFMglSdR5/Rhc7g=;
 b=asbVeyNlw/YmXOwXkkYCXJyqsfEJEFO02vFjvULDSyxQ29sHIcrlJhNdsBhvGO/lSZ
 1bbvMBeGRiDztrbZhI/Rwgo9tuCogze/yU7FTB3OMhXUNKMS3TFBVI/yf8xYSkrlKtoi
 MSqD1egpslXygVsAXDTEG4lwClwzXTVLfv3zEfpXJY3IDLP1msL30PhM1dhcMQp/V4Xp
 mKi9ywBYE+Ko/GD08MrsjfOB2FMFgtVlvlQczvR44fGl5KdkzenoDDY/pGLg1JDCHv6R
 D/TY6C7hUkoFRewx0JkChpL6Ed9A1+D7Kp7Qu0fWIDypyLLRcA3h+8UzmTRPbeAxkzcK
 qkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bYO1wht3CnOFclQFxu5e8NWGNPLvxFMglSdR5/Rhc7g=;
 b=MlWUhr4fCrcEFEu6OJvjggx8lP7Zy0x3m3TPWcXpN/B0JPF7S0OKJ7b3uVZEFhzFeA
 lyvfwEiWjWaxCVZBKTRfYpdZvByqPALi4bcCtGT2h8uP+pbQb+a/y/g/7/rxdx9fMvIl
 Htnl133YBZtV1BMHcBeC3lyYbpzE0CpFwdTcynwXfZhaF/kY599x4aEXP+7CeSpNk8Jm
 12VkF290yag9lolfFMI4pPjyKdgAjrVblDkP0REgxFUfhd9qLqM9LAVqLc8ztftfF5vJ
 AFBgB/HhPOmKtpa060mEGWQ6/lKZdtYQJj9T1w4VCFQrn87BIxMQkF4iUWQz+5MKw0t5
 RTzg==
X-Gm-Message-State: AOAM532k0ZjRR46FbuqW9pS4Zick1R+K42IpiLiQFb5UnfkbZ+OsWM4l
 1Rli9xbax3LHwJAymwXgx3mAUA==
X-Google-Smtp-Source: ABdhPJyXzRS9RYMJmkwyDxhV++tEfFwCBI8c0C9UqOst2Cy3rcBfXQf4BjBLztSkD64Juc75cyGDWg==
X-Received: by 2002:a17:902:b70f:b029:ed:36ed:299d with SMTP id
 d15-20020a170902b70fb02900ed36ed299dmr2432901pls.48.1619416559229; 
 Sun, 25 Apr 2021 22:55:59 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id q11sm5166780pjq.6.2021.04.25.22.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:55:58 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:25:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIZSzNd9uK8kItYb@pevik>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On 26-04-21, 07:42, Petr Vorel wrote:
> Hi sujiaxun,
> 
> [ Cc: Viresh, the original author ]
> 
> > https://github.com/torvalds/linux/blob/master/arch/mips/include/uapi/asm/shmbuf.h
> > The mips 64-bit macro definition in the kernel is "__mips64",
> >  and the mips 64-bit macro definition in the ltp is "__arch64__".
> 
> > Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
> > ---
> >  include/lapi/msgbuf.h | 2 +-
> >  include/lapi/sembuf.h | 2 +-
> >  include/lapi/shmbuf.h | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> > diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
> > index f3277270d..f010695f1 100644
> > --- a/include/lapi/msgbuf.h
> > +++ b/include/lapi/msgbuf.h
> > @@ -17,7 +17,7 @@
> >  #if defined(__mips__)
> >  #define HAVE_MSQID64_DS
> 
> > -#if defined(__arch64__)
> > +#if defined(__mips64)
> So __arch64__ is not defined for mips 64 bit? (as it's defined for sparc 64bit?)
> __mips64 is obviously correct and better readable, but is it really required?

I am not sure what you meant by "is it really required?" The #ifdef hackery here
? It is as can be seen in include/uapi/asm-generic/shmbuf.h in Linux source.

> (you can check it with: echo | gcc -dM -E -).

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
