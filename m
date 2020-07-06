Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F4232215130
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 04:39:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBD493C2A04
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 04:39:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B077A3C20BC
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 04:39:46 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 73E266002A8
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 04:38:42 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id f16so5959820pjt.0
 for <ltp@lists.linux.it>; Sun, 05 Jul 2020 19:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uwaF7JQtoDxxjRUU7Nv1y65vgtaofw8EDep3hCeF6mQ=;
 b=znYL1WXl8vrwVongNXulC7d9xZC+Ur95WJ8bFY7CfBPZ2IkbjnxpgoKRiNsHjp1FO7
 ogG2IZ1RVRuLr6rR8iXHWxL+kTAn8Vq4IcOIEKtVUc6zniFXUCmRitv0VIesTohgM8Hi
 9HnVp6K0/LUx9GguRsQSdIEHJHgpZkbEYBLQGKuROd8w+J60uGc9jA7iEF9swAOSz9S7
 HUJ5UZvoz4jPh8GP6EKRSlADg1Ew0+Rm/d2Ri0v92gPwO95OtkfJpXn5ZmlAlax5SN06
 oFEIjWs+OQi1Ux6RDRQrcCQxbRgfQ/hRg3eaUEl6JsyVTgOzS88x/uz2cZcRU11vtL8C
 SbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uwaF7JQtoDxxjRUU7Nv1y65vgtaofw8EDep3hCeF6mQ=;
 b=KQMqeV85OQRkWg6SQPKY2t0KgwJcMFioeLexWo4/FBmN2kYzWYCLQ7egKkKM3y3lsq
 354Y1jMORDfKUVg2QwqbwIw+cmmoEnLpsijWReeDGbNCZavkL4kQG8iyYYIM/zY9O4Kq
 h8xesLq+SC4saWqtmGEbQEukIdMkLjeHQJF++rDAA4pE2lxRhjAtEewH4Nvjxl7x8TMZ
 N/mGuqRs4ECXqSxJ13bMt3CJ3yArA2Z6W909tSMuwTdnWQphfY24z7bfcrVUcrkbEDAI
 RsfazEasJIOhCRjjZrKYII1WYeEIZgt1Jkg+85yN+hNOtg/TtjF+5DoaPfNalqQjKYpy
 3Jfg==
X-Gm-Message-State: AOAM531skn0AFflbqe6JBwDotzkv+eBHqBhZ0bY9RePigqLC/wmmHAWH
 nUIcuBK25vCfP8KDKYZuRvjhoA==
X-Google-Smtp-Source: ABdhPJyLXpvjTar5AKu5hGBWOhDxYYeMELaA3NcuQaEQteFAQkERQEsYQ7sYTB7/+MeYSF46pKtjcQ==
X-Received: by 2002:a17:90a:32cb:: with SMTP id
 l69mr44905810pjb.205.1594003184558; 
 Sun, 05 Jul 2020 19:39:44 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id 76sm17911178pfu.139.2020.07.05.19.39.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 19:39:43 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:09:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200706023941.ievw6vsdp6gvr3g7@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <18d8603306f51f243faca04cf63bcaf2c7168d56.1593152309.git.viresh.kumar@linaro.org>
 <20200703135812.GC2308@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703135812.GC2308@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On 03-07-20, 15:58, Cyril Hrubis wrote:
> Hi!
> Honestly I'm not sure what we should do about this test. Obviously this
> is a step into right direction but it still keeps the SUCCEED_OR_DIE()
> macro that produces many warnings.
> 
> I'm also not happy about the fact that we compile different test based
> on ifdefs and that there are empty directories where binaries are
> magically appear during the build. I would be much happier if we had a
> real test sources there and share the large enough common bits in a
> different way.

What about merging this patch as is (so I don't to keep sending it)
and then I fix all the issues you want to get fixed in this test
separately ?

I agree with the issues you raised. It took me a while to understand
how it tests different syscalls and how things magically work in
multiple directories :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
