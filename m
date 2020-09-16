Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D426BBFB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 07:51:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 789053C2B05
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 07:51:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9D8B23C2AD6
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 07:51:16 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 33B7A600CE0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 07:51:16 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id y1so3265529pgk.8
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vlYEq+a5Je6/+rz2Gjo5o1IrLcIoOHTa3LejpW3GQJ8=;
 b=hLMBRv1zRP8R447lhwZPGz/OxvZLr+g8a9GZuvLoK8JsGueW66Ig37kFVwDUruTQmh
 eHQ6A8hum5swUo/0vJw3A88o2K1tZlUvS79xZHjSGBq3J/GCm1HsIQDnVITeq9j/CuNa
 eXpme3rcn7tYpl3mkevoWCWiV77SJaWymxb/i5NzDcVfWpVcDwkY1q5KGcMj0zlEf/rc
 kxC5FlAAJ8cs98PitgAGr5USWhNInOCzSFt2cgNgvIOaElprHK7xLTbzJxBH5GXYzELZ
 EtFpU8Y8Hknvm0BcP0vCKegL2lw1KJoPW2P2cBq6ToeM3njUFUnIzPHr8I7fHksR5lO7
 rFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vlYEq+a5Je6/+rz2Gjo5o1IrLcIoOHTa3LejpW3GQJ8=;
 b=LbuQYd2BE31YBu5yhtK3f/CQzeCkVyI2OcsV3BLCksvEDPiKr/LI8aaQapaxLAeryU
 WUj/BSXDKbFT3uFLeoDbQXHhRfv5CWcXJzS/2ARS7doYJuCXlL4KF+VCYW9GeduVMAU3
 1Tx9iBS88dHaZ6SX20F2WulM7o9/3ZClBf+V9w8HpgZv7cLJs8cgJR4hnxnbwO1qoMQo
 YUrsGJ4WelCAUNJMs/Zx0UhkW/YfKPV9vgiGDMDF/10X6VXrueepovYD/FCK1WYPcaVg
 tWgoXlNf9itr7ViQ7J8U6FFjZJM9ZMGxfQBxQNdI6aPFQkkq8iC9TvvKo1BoZy2ynU77
 JAow==
X-Gm-Message-State: AOAM530BeBiKtbVDMaYhV9jD/+aoQY4Z5kUGkBAjOaKW53L9+BWvzYyv
 8Q4eBpn5EBApkHnOLo8xbk27YA==
X-Google-Smtp-Source: ABdhPJwv5/T4THFesYr2xNtOfVpAsFccov5vhcBS2nXhmaYg1k+VIH9Z25zyXnalt7A29c5yIf3Cww==
X-Received: by 2002:a62:52ce:0:b029:13e:50c8:499b with SMTP id
 g197-20020a6252ce0000b029013e50c8499bmr21133373pfb.14.1600235474384; 
 Tue, 15 Sep 2020 22:51:14 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id q4sm1399952pjl.28.2020.09.15.22.51.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 22:51:13 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:21:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200916055110.2g5sdnpmrufsiayq@vireshk-i7>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
 <20200911095314.GA9505@dell5510>
 <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
 <20200911110141.6vgc44hrl2hbtq3r@vireshk-i7>
 <20200911134739.GB4608@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911134739.GB4608@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-09-20, 15:47, Cyril Hrubis wrote:
> Hi!
> > > --- a/include/time64_variants.h
> > > +++ b/include/time64_variants.h
> > > @@ -7,10 +7,13 @@
> > >  #ifndef TIME64_VARIANTS_H
> > >  #define TIME64_VARIANTS_H
> > >  
> > > +#ifdef HAVE_LIBAIO
> > >  #include <libaio.h>
> > > +#endif /* HAVE_LIBAIO */
> > > +
> > >  #include <signal.h>
> > >  #include <stdio.h>
> > > -#include <sys/poll.h>
> > > +#include <poll.h>
> > >  #include <time.h>
> > >  #include "tst_timer.h"
> > >  
> > > @@ -32,8 +35,12 @@ struct time64_variants {
> > >         int (*timer_settime)(kernel_timer_t timerid, int flags, void *its, void *old_its);
> > >         int (*tfd_gettime)(int fd, void *its);
> > >         int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
> > > +
> > > +#ifdef HAVE_LIBAIO
> > >         int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
> > >                         struct io_event *events, void *timeout, sigset_t *sigmask);
> > > +#endif /* HAVE_LIBAIO */
> > > +
> > >         int (*mqt_send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
> > >                         unsigned int msg_prio, void *abs_timeout);
> > >         ssize_t (*mqt_receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
> > 
> > And both these changes broke my build. I don't even understand how
> > could the ifdef change break it for me :(
> 
> My guess would be missing include for "config.h" in this file to get
> HAVE_LIBAIO definitions.

Right. That was it. Thanks.

Though I still get failures if I include poll.h instead of sys/poll.h
here and the errors happen only in mq_timedsend/receive tests. I am
trying to figure out why, but no clue yet.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
