Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A71F16F98C
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:23:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F0AA3C2515
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:23:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 347613C07D0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:23:24 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BA941000C09
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:23:23 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id 7so950903pgr.2
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 00:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=s69Nf64G8NJ48voPn2+8qn7I8gEWYcbRmvHwLGxsMks=;
 b=bAoxugc4fsp+MFKgDtp3rfFmxKZbgZEgV0LzwUyiL1Gshbsmm6V8I5peIBPbUBvezT
 jt2KacK2gjB+dLQC+JpKcbOYxsO7Wk1zuL8OSzkv2VCTktO+vh4u7l+D7N2WPYaAw++f
 01yeLd3h03U9uhZVRKvIW0x5yJq2ZY0JOMhZkJJcoPv23dKkJZCkH1tJUeO2Jv8S9Hhr
 Fqm9ZNv1ApElUPjnZqjABtSq2VmqLsFhVFfFtlkftnVNawNUg673eVAny2eUYag1nWJn
 efu/cBHk+5OWx8ubcgKQSVcQsWC2j2NRs8M7HS0Hh+vQRwghmjagWiGnbNip5voVi3Hz
 VRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s69Nf64G8NJ48voPn2+8qn7I8gEWYcbRmvHwLGxsMks=;
 b=jiJ074gq9xbgrfxhqqmMzo6/NjqML4EWlOWi6FRZct9iF3WeHCKWLCLTb/4Mhe/kUC
 CoeIW4KTUcCyTpYdumMDffxqTNbk5vuJJMzXlt5NHDBP2k+SomZFHDrsXmggIuUIBaJ5
 S7ve8iJFGL7UXzSzw0hdtDdE8Uu4AjzRLMvOyyxz8lxVboKBHxN2OaYnY3KLRP7xlDwR
 WW9dXvCGdh4Gchmo6+hw6n57CRudR4QPVUKY6rEG6x6TLjn4yZJdbjR7NXxvbO6Gezyx
 XLgrie1LuucYrCAy78iItbOvwowO9uY3LVx/mDy4Us+NpowaQ4x4jFbrB2bJB8C80nXV
 wPgg==
X-Gm-Message-State: APjAAAUmWfkwyONtiZqYZF7MTzXPyk/Zylt14ZCa7rPVsFs/U90X9XCj
 u/YVAtqnFLEgPlw04Aaof2DlzQ==
X-Google-Smtp-Source: APXvYqzQBpFO/H8IUKVjmxGvJK/TIh6RX9rAn3DtX8A/Q4Lu2G55J6ZBhoEcSN7LeRgrHTff0dedDg==
X-Received: by 2002:a65:4305:: with SMTP id j5mr2806882pgq.315.1582705401909; 
 Wed, 26 Feb 2020 00:23:21 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id i2sm1671442pjs.21.2020.02.26.00.23.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:23:21 -0800 (PST)
Date: Wed, 26 Feb 2020 13:53:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200226082318.eq5ozhgg2myscpqt@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
 <20200226074729.GA15207@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226074729.GA15207@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On 26-02-20, 08:47, Petr Vorel wrote:
> Your idea is correct, but IMHO it's not good to skip all the tests, which is
> done due
> tst_test.c:1051: BROK: Test 0 haven't reported results!
> if you use tst_res(TBROK ...).

I don't think that is the case. tst_res(TBROK, ...) shouldn't (and
isn't for me) result in skipping of tests.

> tst_brk(TBROK) is used for setup, where you create some resource, which is then
> reused by all test runs, but this preparation fails.

Right, but in my case I can't put all setup stuff in setup() callback
and some of the setup bits stay in run() callback as well.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
