Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44359219E1F
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 12:46:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B41503C2976
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 12:46:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3CD843C2921
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 12:46:41 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 492941401279
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 12:46:40 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id i14so839026pfu.13
 for <ltp@lists.linux.it>; Thu, 09 Jul 2020 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EAll+SVtmrPbxdCLZUlUKZtTpMhP2KtDyoBQrUWamO8=;
 b=CXdFWci5kQ4vEZzb5sAP+9UayoBC50YVVA+0XcTWRcm3jsNADnB56PE/Md1wdhUWik
 buIP37clIZG3RasSId/8PoU8IjF/DBf0JWcygVoU56YePuLOUvgcglU2q+swY+IwJ+8i
 EUBbonU53uy9EBg/LEUTerGgDEgDdfO8eWq/uS7p7QWW3mzjRjn77Tr0ZNhDOhTEvi2T
 H0nkoIEr/1YV28GCtLPkZsyNPc/gHpZeH8zEPAhX2KsqimDZRTL5OS9TCk8cRSyMMlKf
 Hqh4aunnb9b9Tw8K/xY9ghtz6F2je/FnZ2cg2+7vhl7O7furqSu1duOhe/XSmjZC3K1k
 TfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EAll+SVtmrPbxdCLZUlUKZtTpMhP2KtDyoBQrUWamO8=;
 b=LZToiOeMf42l/qUSerIvd4sIY0D80zAqzoVlWGUN46HZeqTdV8Sjj1QgqtNu8ZG0Iv
 9feQYxZuRwP9nxaFjchClIQD1qojuVxxqQ/6ZMMz/uWN9z48UfqyBFAvTjYCzQ1msBx3
 4sIE8A78/vfKThVmwS2rAMdjUrmYpV7aEmzcL7U3A90aRtsJDvYA0dUvSHcATEUQR9vI
 3obbqIkmNtmRI0hFNFVVfcUFA+hKbld/URaOS+O1YZn6b7ryLIPBLFiUKPo5VkHUM7E/
 GsJ50c+DGLR35oeTxNNswj/1FA+XGgKQqNBy8pAQTiivPI3Qo5yN0C71wH+SjMihWxAs
 Q4pQ==
X-Gm-Message-State: AOAM531N7TJ1KI3o2UNyNBh9fZp5K3Q39jaPg21ktF+9EEFwPMWPtReA
 cifarwzHn5voTxRPCUUeep108w==
X-Google-Smtp-Source: ABdhPJxlLeVJc81CZzqkIXuZhdIOE4l+akZ2HPEebuypjAvGDCs7ESBzyvGXEMGMR7h3L8blITnMpg==
X-Received: by 2002:a63:1e20:: with SMTP id e32mr35159539pge.429.1594291598679; 
 Thu, 09 Jul 2020 03:46:38 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id f29sm2455250pga.59.2020.07.09.03.46.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:46:37 -0700 (PDT)
Date: Thu, 9 Jul 2020 16:16:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200709104635.ce3ehbfggpd32lqc@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <18d8603306f51f243faca04cf63bcaf2c7168d56.1593152309.git.viresh.kumar@linaro.org>
 <20200703135812.GC2308@yuki.lan>
 <20200706023941.ievw6vsdp6gvr3g7@vireshk-i7>
 <20200707151631.GA5197@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707151631.GA5197@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 09/19] syscalls/sigwaitinfo: Migrate to new
 test framework
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

On 07-07-20, 17:16, Cyril Hrubis wrote:
> Hi!
> > > Honestly I'm not sure what we should do about this test. Obviously this
> > > is a step into right direction but it still keeps the SUCCEED_OR_DIE()
> > > macro that produces many warnings.
> > > 
> > > I'm also not happy about the fact that we compile different test based
> > > on ifdefs and that there are empty directories where binaries are
> > > magically appear during the build. I would be much happier if we had a
> > > real test sources there and share the large enough common bits in a
> > > different way.
> > 
> > What about merging this patch as is (so I don't to keep sending it)
> > and then I fix all the issues you want to get fixed in this test
> > separately ?
> 
> Fair enough, merged.

I believe you will apply the next patch (10/19) as well, which touches
this file and so I am starting to work on top of that now.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
