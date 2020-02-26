Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B14ED16F59A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 03:28:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 600833C12E6
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 03:28:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D389B3C0823
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 03:28:04 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9C5BF600BC0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 03:28:03 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id d6so514828pgn.5
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 18:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jG+nZNOIscDkQPklfVPqvk8+7IQS8AfhwFYZLy5WHY4=;
 b=jW2QO/OOTFtNh1g1+zBAFk9a0revV4vvUdeTLwsPBg8GenYDauImln+uxZA4KVodSV
 kc8EVh8AJAyHLjiC8RiQDnoIo2lvAqjFvdTs8vsRhJVOMU8iE47OpIZKsSly8ixHwXK1
 iIC2iKCrYrmadxxIR4kkUJpKTiRgEbLITc7a4okBF68WwXWLPgHXUNqYw5DjFgh+Ma8n
 1devRCN2d2m4RP21dNSju5fNzGmwnnqSIIzS5g4L72b2mPChvD14lUR5smQkOpOjas2K
 u/gEynM2PrJYnpeDYH1eHvHZNZ3PQdR2TvbDHw3WodkDv9wbrI2eW0fcYLXpW+ZI1y9j
 5Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jG+nZNOIscDkQPklfVPqvk8+7IQS8AfhwFYZLy5WHY4=;
 b=crMEoStGfJiT5CNJw3b+LBwGxlvbPGNdphjKHBtiS+UkfDIc58ZWMCGnTbpE5UQ/ci
 8rIVI1cFUyKTnX2gMli+IY5FqFH0vaIK9F+GU252jOTK5EPZhi/fdvdwzxzp8jx+NMDI
 zoFgkfBzkh2UvUNJqqD5Lc3eIgvKk7bskCD8VjQoIBZgiWAIwmB6XM/pNCNadroRHHyI
 g/uwWL6Pb9xor4Rc/RSUsfg7u+neBWClvipfevIOvRWpm3ah7+jYXRNFvEEETkpY4ada
 V2ku0QhaZQF9wAuiuPab1Iq8TqXs196YLT8QlspwQihczMfZNB38lk5yICU+XNSmUyAX
 MvSw==
X-Gm-Message-State: APjAAAXMK/OcRjay5HZuQqhGE69L+ZlEr4ODWrbsxNYaOjI425t671EP
 K+boSwdOVF/OHSWgODJyqMZnSg==
X-Google-Smtp-Source: APXvYqwizgDyV+ya7dupsPUaFLPAAaIv15hGbBMY/6eDNIJmXtK9VjsHV53sACpDJuDFw7bNkxnmsg==
X-Received: by 2002:a63:291:: with SMTP id 139mr1456411pgc.342.1582684081657; 
 Tue, 25 Feb 2020 18:28:01 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id h13sm403739pjc.9.2020.02.25.18.28.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 18:28:00 -0800 (PST)
Date: Wed, 26 Feb 2020 07:57:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Message-ID: <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225135709.GC62318@gacrux.arch.suse.de>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

On 25-02-20, 14:57, Petr Vorel wrote:
> > +	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > +	if (TST_RET == -1) {
> > +		SAFE_CLOSE(fd);
> > +		tst_res(TBROK | TERRNO, "fsconfig() failed");
> These should be TFAIL otherwise it 1) breaks all tests 2) does not report any
> result:
> 
> move_mount02.c:37: BROK: fsopen() failed: SUCCESS (0)
> tst_test.c:1051: BROK: Test 0 haven't reported results!

I am a bit confused about TBROK and TFAIL to be honest. The test
writing guideline says this:

| 'TFAIL' | Test has failed.
| 'TBROK' | Something has failed in test preparation phase.

And so in my code I have been using TFAIL only for the failures for the
actual syscalls that we are testing, like move_mount here. And I have
been using TBROK for pretty much everything else.

Would be good if you and Cyril can explain what's the correct usage
model for these is.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
