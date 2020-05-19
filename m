Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DA1D92A0
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:54:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A40043C4E9F
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:54:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5AA1A3C003A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:54:30 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 11779600D0D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:54:06 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id z26so6088776pfk.12
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NGkk3i/D38rVQSVhhRhrxVnIHuK3rptFOg9UfHgv1Oo=;
 b=GLQEEuoSZfDGB/ifQc2UpPChis6lMtp4AKVjPSBiKR7z1m0iBzQO6Y9UbOf0vFOfVQ
 4weBE9tGTScQzXz1tVFM1kKPwcgmtASaOR8aB/XZ1h3bbLkUJWJ1nngdr5TZ4/QgJm62
 UFr5FxirE5BpcnIIk+fHL26RQajezCCYg8Y55Ehz+cWIfrOMA8bA+qGE8oI951N5bLZR
 6DLhKIabN+UIK5clMvMjpOVNUbEL7PCMorip94pfaXJ9JKi7hf6nM1+Tb/wj0xrjN1pD
 WOduw0QZgHmk04VyAtd/KTBI/1mP56JQbO/DKdI7MPBO1K5inbP8ELAaOklZIXGoCGDL
 W4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NGkk3i/D38rVQSVhhRhrxVnIHuK3rptFOg9UfHgv1Oo=;
 b=gyt/JkwUr+knpAefaYfJnSIXjTXQqwfsMuOmtfR04vjEDzkbFQPNZJWoMVSDqVEkhG
 RH4l+Um6yewdO6qgDJj+obCTkPrQLwmuVWWKK6eFP+kKnvldnaJ164yCiilyL8d3zDVW
 yOgKPVY0uzZJ7Io4NSC6HNvC82keDcHC4Y+f8wDc5L+GglyeVoArZcIWZHCjvIv9dVwa
 GFg5lij/blzLaHVEIKLPlgH8tcsjz5tFwLF3HdqKWDsTxF22ojhRm+UyjyX1DXHNgRTK
 KrhpHXWi7pIewnZu8Mv9kxTlMdhyNmzYriGp6qKzeJ95TRM3veu4i3+VJ1UGbAMoY2ow
 cF8Q==
X-Gm-Message-State: AOAM533IETdloyBvyr9DPBaDYIb5LAK6uOZDAvPjRFDUfHUzHBg5bBcR
 h6/a79a9iRJPfSWM2haf+Wc0Sw==
X-Google-Smtp-Source: ABdhPJyZRxyK0CODrLqBspmTltHQ52A+n/JeAwkFBMjiJG61UxgSHqLPHajdMNBYiPZkDBhkJxbCsQ==
X-Received: by 2002:a63:30c2:: with SMTP id
 w185mr18084993pgw.353.1589878468117; 
 Tue, 19 May 2020 01:54:28 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id u5sm10981183pfu.198.2020.05.19.01.54.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:54:26 -0700 (PDT)
Date: Tue, 19 May 2020 14:24:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519085425.vajbfnt7uj7yjq5k@vireshk-i7>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
 <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
 <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18-05-20, 11:21, Arnd Bergmann wrote:
> On Mon, May 18, 2020 at 11:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Ahh, if I understand correct you are only talking about the cases
> > where the syscall is called directly without the libc wrapper, right ?
> > We can't use timeval/timespec there anymore.
> 
> Exactly.

There weren't a lot of offenders I believe. I have fixed them and sent a
patchset for that.

> There are probably also ioctls with the same problem, but
> I don't know which ioctl commands are actually tested by ltp.
> 
> I would guess that the socket timestamps (both ioctl and
> setsockopt based ones) do have some tests that need to be
> updated.

I tried to do some search based on:

git grep "ioctl" `git grep -l tst_syscall`
git grep "setsockopt" `git grep -l tst_syscall`

but found nothing :(

Do I need to look for something else ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
