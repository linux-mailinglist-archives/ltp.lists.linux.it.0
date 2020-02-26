Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA916FA18
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:59:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F0BC3C2555
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:59:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2997E3C18F9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:59:32 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 73068600F95
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:59:31 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id m7so2018450pjs.0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 00:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kdSodyGSfeHEa1gnAWCHVfa2wl8fpXmUJv6EWYPlyx0=;
 b=B9wSH2X1gAAgnjyLihInNzWNQ/Tzu5vp4oKf2k9N3Ij65BiXukaILK5hm1F3Xb36FV
 nELOQMJ09liNSf864CzQtGTPkw1W4MGohRH8lOxF1hlxiY9V8y7/k7OBBf/SBgahnyl3
 YQ8ifAh2kv5BffXnmvJBiEpqdoHu01wtg+pOKJntFQkOrAQeESsIHHBPf/ASMHVRQynE
 it+9h2Mg97wQqFVTd5UQviIdUWymmn3i3AYg+999n+8iBgxblem+bnCwyVIjASbWbxu4
 v0yuRPBdjdClHFr1rKG1ETo4plExVfBlFSUBrsPwLaWxq1Gr3dSTN89TG59e9Oqze11X
 F2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kdSodyGSfeHEa1gnAWCHVfa2wl8fpXmUJv6EWYPlyx0=;
 b=kxic2fQTfBivc8PnM0veu+8YHmo+5LvcHIidBzFDzLlCSHw2fV3QFrrcWImsoyRziI
 EE5DOo/MMYgjcTfIebhHqsdFIzzp8rCMRMTXxQ5AVR5ADWnlwXTrJEz4eLnnGnWq1JTe
 pITVk90A3MCpn/ol3rJqPd2U4ATo86A+nUxLfW2usaCqqm8fQQMpZe+A1hknm83hEXhs
 +uh6Ksk6XJRuXeTOn60/oCIleEmyVMWfAiFyu5urzoCwFmk8Bv5atpc53OQEJYhELlwP
 Hc/awS1M4Cz8Im1ctkb4MpvEnNbGm/4ZRKL4+jGmUAcsCPwu3k9W/O9NQkCNINQuUzGk
 Q3Fg==
X-Gm-Message-State: APjAAAUDQ3YGX8Cg71l4ZPBzngxeUfb5paBbUAUM/voKcHF5A7Z3jy8i
 MJ5LgVqgcCxuO/i+Py+n0qQ33A==
X-Google-Smtp-Source: APXvYqw6RQtKRBbm91DKGTcOmA0EXmoEz6JIIoXj4oQ/wu0kXUPlqYES4Hlt3vyTIcbacAStCMDmig==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr2927126ple.226.1582707569855; 
 Wed, 26 Feb 2020 00:59:29 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id e1sm2031951pff.188.2020.02.26.00.59.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:59:28 -0800 (PST)
Date: Wed, 26 Feb 2020 14:29:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200226085927.xuwos7nbcfehfckj@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
 <20200226074729.GA15207@dell5510>
 <20200226082318.eq5ozhgg2myscpqt@vireshk-i7>
 <20200226085303.GA30488@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226085303.GA30488@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 08/10] syscalls/move_mount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-02-20, 09:53, Petr Vorel wrote:
> Hi Viresh,
> 
> > On 26-02-20, 08:47, Petr Vorel wrote:
> > > Your idea is correct, but IMHO it's not good to skip all the tests, which is
> > > done due
> > > tst_test.c:1051: BROK: Test 0 haven't reported results!
> > > if you use tst_res(TBROK ...).
> 
> > I don't think that is the case. tst_res(TBROK, ...) shouldn't (and
> > isn't for me) result in skipping of tests.
> Correct, tst_res() itself doesn't exit the test. But the fact it uses TBROK
> without reporting any result previously leads to tst_brk from the library:
> 
> tst_test.c:1036: BROK: Test haven't reported results!

Ahh, I missed this part then.

> > Right, but in my case I can't put all setup stuff in setup() callback
> > and some of the setup bits stay in run() callback as well.
> Sure. But as a result of it I'd personally use tst_res(TFAIL).
> But maybe I'm wrong and others will correct me.

FWIW, I am the least educated guy here in terms of LTP stuff :)

I just want to make sure I don't need to do it again and so wanted to
better understand TBROK vs TFAIL thing.

So the conclusion is that in the run() callback we should always use
TFAIL ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
