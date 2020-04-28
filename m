Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE41BB59B
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:01:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 878263C283C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:01:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B6EF63C176C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:01:40 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE81D200B8E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:01:39 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id r14so10106841pfg.2
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 22:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xhUqFAyLQNiOj/9oiIGTBY9poyWz0hx5Nw/Usk6PK/0=;
 b=dgERDTSTZSilDcoM5Oq33wTwAmXJYz1QVLl+JdNnJx5R1PkTYBUTe1DG33K1POj6QY
 N18FG4nNI4pucX3Q+xTYObQCzo8ZEyEntvhdg/UUQUX0ISbGtg60fsrRrrJQ0BIM4ziF
 9pjtGg70Fp3GDpHu/vEo9qZdvyfXUQSyoJTOj6bgBVuM18bul2fdsobO3qCISAOxu8+b
 4QymXLAYqjy4yHojD+DMfrnWTu2AtLfhN3If/EyngBd8qTjEa+fUGFA18kS4YAHKw2wA
 fgsTJbh/KM2uNEAnP1Ha+w8b24RBO3LNWZJdx58LMa6QxT0z0jSRgnHFdhQMSZiSLFbr
 PKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xhUqFAyLQNiOj/9oiIGTBY9poyWz0hx5Nw/Usk6PK/0=;
 b=p9hXHgIe6ei2JQQEoc2z+bjggT00U2PfQ1WHpDPnhzLy2FjzK+5wwJY1PNnsym8pKT
 ori9nRb0l4gNPW1hO18go9UMVyScVztuFlwD1Cbp1SrH+/c5vqdYwkU0Ru9LK1K/BaUn
 tGmyqmCbmRC4JSrg7E3Wl4OOsmMmMu1F3K7ehQSVznkNTtaEv1Wdpa3YRsNMAuOz2dd6
 Cq1byTzJycGV8VhQw8f/bPttPVdWF6VPNeznGGp+AznrMZRoL1JKSSSmwC/J/4ZkvaKa
 xCsNouIoRobjgqWcXgZpjc9VSNmnfrXICEcH/UC3pRvnZ5yFegLJl7rO+gTJoVqpWK8K
 vaOA==
X-Gm-Message-State: AGi0PuamKTX/xeInKtfoRUCmPwrU5ZD2KN1Y6Hvav0Wkf1Qp3JJ9Q3lE
 ileD90WFUkOUQEYVQ6MIBqX3zA==
X-Google-Smtp-Source: APiQypLZ4nPqsZNGY/+hdiKZi/4FoZpzopFvYmKV/d2uQsZELY0g1vyt9cj1p6NfcFnTJxax2IFWVQ==
X-Received: by 2002:a63:6a84:: with SMTP id f126mr26278851pgc.14.1588050098233; 
 Mon, 27 Apr 2020 22:01:38 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 128sm13518097pfy.5.2020.04.27.22.01.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 22:01:37 -0700 (PDT)
Date: Tue, 28 Apr 2020 10:31:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200428050135.x2xggdaxe3yhmjq2@vireshk-i7>
References: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
 <20200427145212.GA5678@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427145212.GA5678@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/timer_gettime: Add support for
 time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 27-04-20, 16:52, Petr Vorel wrote:
> Hi Viresh,
> 
> > This adds support for time64 tests to the existing timer_gettime()
> > syscall tests.
> 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  include/tst_timer.h                           |  40 +++++++
> >  .../syscalls/timer_gettime/timer_gettime01.c  | 112 +++++++++---------
> >  2 files changed, 98 insertions(+), 54 deletions(-)
> 
> > diff --git a/include/tst_timer.h b/include/tst_timer.h
> > index 256e1d71e1bc..601f934da670 100644
> > --- a/include/tst_timer.h
> > +++ b/include/tst_timer.h
> > @@ -15,6 +15,7 @@
> >  #include <sys/time.h>
> >  #include <time.h>
> >  #include "tst_test.h"
> > +#include "lapi/common_timers.h"
> 
> Thanks for your patch. Unfortunately, the build got broken by this commit, I
> suspect this must be changed
> https://travis-ci.org/github/pevik/ltp/builds/680061434

I have sent a patch to fix this and that patch should be applied
before this series.

I didn't get this build error until the time I did a make clean,
followed by a fresh build. And so never caught this :(

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
