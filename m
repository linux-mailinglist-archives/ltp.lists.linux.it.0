Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7921BB800
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:47:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D88203C5F3F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 09:47:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 60F443C282E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:47:23 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 090921400965
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 09:47:22 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id x26so9908150pgc.10
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Om0Z+BpCcskkn4putpAs3JvNTyC34CsNqOp6PdWrcFM=;
 b=IOzCHw++81u1m9pCcuaURBF9q2JCeo3TOv2a3//njsqVNKJs31ySDH2vZkJB0C5neI
 f+iDe7Dhomr2GlmqDsSMLAwyCixt/bSO7xO2zgTA95fqCdKniGsd0U/mhnLo1nP0JESi
 beaZS/gtkqylhSVMoSye9culxQCr+YP8KYB0bLbqCpRJ/g1MqtL5lF090KlyYtguZlia
 OGnSdkZkc4PAqqHxJFNIjfoQeuK4u5Nzka/aTPrrOU7LMafjq3hCNbBY4CPynxW/+pC4
 kUDXe3CtqvDTTToO+C4MJiHO0Bh3JtuX/ledh8wOTcV2kLLJ7TfYA0yQ8OnrMiHLXAbC
 5m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Om0Z+BpCcskkn4putpAs3JvNTyC34CsNqOp6PdWrcFM=;
 b=kLZPFd0K4l/ftso1y31Yo4928YGJrvSPPUzKqUCpaTSLcdnQ+ZNL65F05QWwSnfbKz
 ++fQQqNfFvEepb7kuL+gPpavuRVbbm5DRDNeN3Wfc8Yldm0KsBTi3svFwLMEDq+c18fQ
 Prx/SXbC04bdfMPOWyhaO7/PrHMDeE9fgydi6Qv/Ucy33PyF+eO8rfb3fyW4SFciz/La
 pycnCFGe2EmAd/NqDQ7Cn/AhUswxWPCEYG8a0KcAu0UJGPpBvFq2Jqe+/eDI3dpsag60
 YyrtbK124l/SLLKQWHJLhiV0IDv0KJLY3rdFtmbjSlgLyvZjcCdL8htZKmvd7t5Mx4b1
 hWXA==
X-Gm-Message-State: AGi0PubyWi+qPj9uv/fjdfI4+etnaaYstLnt/RLiCjutTHfHj/5sivpR
 avyACxDeZSAYpGCFQMghrYFGiS+ub9o=
X-Google-Smtp-Source: APiQypLgLcYwLJ++xN2/cEKXdvz1N7cMMKxbeDkd669r4Fg3tASM2ne2uVrfGV4+3CE10kpoMGfgIw==
X-Received: by 2002:aa7:9d02:: with SMTP id k2mr9848814pfp.269.1588060041359; 
 Tue, 28 Apr 2020 00:47:21 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id y186sm14109804pfy.66.2020.04.28.00.47.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 00:47:20 -0700 (PDT)
Date: Tue, 28 Apr 2020 13:17:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200428074718.4ne7jnsflfbhjns7@vireshk-i7>
References: <20200427145212.GA5678@dell5510>
 <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
 <20200428061424.fj4mq676aoosoqyw@vireshk-i7>
 <CAK8P3a0On9euT2mzx+LsXVe21cqwNMR4Hzj3eVDhbCS_KeGb4w@mail.gmail.com>
 <20200428072516.GA8764@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428072516.GA8764@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] common_timers: staticize all definitions
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28-04-20, 09:25, Petr Vorel wrote:
> > There is usually no warning about variables in header files
> > that are marked 'static const' rather than just 'static', as that
> > is a common way to do things in C++.
> Correct, static const clock_t clock_list[] would work.
> I'd be for this solution.

static const it is then :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
