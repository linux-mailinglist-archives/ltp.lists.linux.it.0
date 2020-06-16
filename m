Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB131FAD93
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:09:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1209B3C2CE9
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:09:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D06EC3C072E
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:09:43 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 147DB69B495
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:09:43 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id z63so8338962pfb.1
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pb4bEnyxOqbxjWLm2HMvDW3h/SVCj0QvyexQ1MpJeyY=;
 b=G1lY3AZ9k5OenxzCRkqn77EVUaIAJsuAMK7BsEGT28p7CHPNCunvLysHX3uTeMMDFg
 PYZKvKariYtYQKtEo9gBhMFQjbFQLi5nOHLAUrkyaW2DJBmyNfqowMEXmJCTGQn+mLcF
 Zqa1Mtc3GblTH40RujTt6Zv+o2bJuF3qnwLnIQV1W7Py0/WmXB7LPh1RQG5mRgE14jYE
 Ze1ZIj6/WpAJ3Doa+wKFGYhN4qkVfTVgZGfm8ZOv/R9Ln9/XXgQyvlfuahRXP8G7JIH2
 zCVMQ+HdnTottpRwVv3vyd1uyZVUKIvdjMtLeAUpRwGNrrt2uBYwIglZptEAvbtgZ5AH
 ze1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pb4bEnyxOqbxjWLm2HMvDW3h/SVCj0QvyexQ1MpJeyY=;
 b=Wm1MgNOaTtplIPBtj1DaJ4RVsKz3Iq/2CzxyvA/tWkFJxO0e7NwMQ9uZeXwVamF5v2
 89bHzos8/m9ynU4cz9q0JfLjWadxYqfUgqQXMYxG5Q+ae8Pb0p2pQT6rW/b29MNBGnFR
 r+0+WU+akCbRHlPVyWSWAegqvJHzRViU432XufB1QyuWR0DaVOk7sMVF/uoM3iien9Pe
 jZ1PuxEQdB9PK/CxXKPR+0413QL++dU7FKGSlwI/P2o/z3ieXPeHfFsZdfqbg4cSYG4e
 Cu+47dpDd4c4j01BwvrduB08UaUU5clf+UOXbVM0Dj60q30RNLiMiJLRJyY4PNz2iBbf
 VkLw==
X-Gm-Message-State: AOAM533eXGctLMH0fsRp0sPiEzMesLaj1zDEKfcJNHuU+mmNTGE0Hvyr
 /ZXlP28umn/vylFz4s0p5cvUFA==
X-Google-Smtp-Source: ABdhPJwi+roFs3yg3FHS38mfziiqF/8Vg/sF3azNfhlM6e108BXx2Am03sO2LgX0H4BSheSxuo4Wbw==
X-Received: by 2002:a63:6dc2:: with SMTP id i185mr1483794pgc.250.1592302181205; 
 Tue, 16 Jun 2020 03:09:41 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id p16sm13986437pgj.53.2020.06.16.03.09.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:09:40 -0700 (PDT)
Date: Tue, 16 Jun 2020 15:39:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200616100938.4iump75rvgrvjnnj@vireshk-i7>
References: <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
 <7d7363384b5719fa48a5a5ba71b0aa581ebc91bd.1590131635.git.viresh.kumar@linaro.org>
 <20200615133125.GC25279@yuki.lan>
 <20200616064047.7njwpmlmxzyoikwo@vireshk-i7>
 <20200616095204.GA6239@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616095204.GA6239@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/5] syscalls: semctl: Add new test to verify
 the _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-06-20, 11:52, Cyril Hrubis wrote:
> Ah, right, the rule that rebuilds the libraries does not work correctly
> for more than one library because I do pass "$^" there which is the list
> of directories and not a single directory.
> 
> As a quick hack this should fix it:
> 
> diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
> index 684655fbf..7e0ec13f9 100644
> --- a/include/mk/testcases.mk
> +++ b/include/mk/testcases.mk
> @@ -49,7 +49,9 @@ LTPLIBS_FILES = $(addsuffix .a, $(addprefix $(abs_top_builddir)/libs/, $(foreach
>  MAKE_DEPS += $(LTPLIBS_FILES)
>  
>  $(LTPLIBS_FILES): $(LTPLIBS_DIRS)
> -       $(MAKE) -C "$^" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$^)/Makefile" all
> +       for dir in $^; do \
> +               $(MAKE) -C "$$dir" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$$dir)/Makefile" all; \
> +       done
>  
>  LDFLAGS += $(addprefix -L$(top_builddir)/libs/lib, $(LTPLIBS))
> 
> 
> This does not parallelize the build but I guess that it would be fine since
> when we rebuild LTP from top directory the libraries are build first anyways
> and this is no-op.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

Please merge it, I am sending my patches again based on this.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
