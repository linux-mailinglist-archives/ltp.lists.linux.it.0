Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A01F1EA0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 19:59:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F29BE3C2EC1
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 19:59:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E84593C2EB1
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 19:59:37 +0200 (CEST)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2941E10009E5
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 19:59:37 +0200 (CEST)
Received: by mail-lj1-x244.google.com with SMTP id 9so21652849ljc.8
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XENzgsM1qvJgpIXn3AhYORNJjBhFpxGIEfx+ns4qi8U=;
 b=wNl/zHI08njkjEe2AfNUSvlvjbw1fjnISOLiievqFJkuNOaMs9oLgfuDuRv51e3swX
 faP9eMZ4UPXS0/QZgkVfeNDRiGioHk32w/6vFU4GkJgExN0oQJbeYcNGeTZceVJ2ttCE
 iLTOrpRGW4jC0LHx/Cd1TaYIBgSX+wXoHxnkohezx6tQdLATSgYja4iPT8R8YgS2EOEJ
 baEtu8v+oWs0KauPlMYMThWzm8DaywZBarBx1B2ktGAIUZjB/4dZ/HnCYRSTrCDnMsuz
 /R5myoO8RSpvOVBrmFzw1lLrT3AizHf40eOYNTvcT/412EErua8nUjC/Pd34UWCy7Y2a
 9aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XENzgsM1qvJgpIXn3AhYORNJjBhFpxGIEfx+ns4qi8U=;
 b=HT+d7CfCFGXCfDBlcDl8QoB/iivQv6SYUdkb7LoYfPw5AlhQNWIgWKIDnTOkOgnGKP
 qSlntY5CSoBvhyTw7F/qQi1mJJJo6qD5dCHYtXGxjeuCeobA5htU9/nD4H4tusrMuiCH
 qZhCZq2LQIH2c78w23qRLSmUMcZRvPFsiFdai196y1YCX9xFQFOoGKikPnjUhkrqQXsz
 jfp7PfAUe2SGB8G/JuT/9NGaoaRJLPk1fyKY3H5KvY0Xa2hLevOc+NKkGILg1ncSpz+r
 W1nE+xx4EFCsGD1lUwYXTHUq97SABMktmWwAlSCDYpl8jkB/hvh4UsB9UbTFGLFmuHyg
 rM1A==
X-Gm-Message-State: AOAM531gaBzh+4I24Ea7EVq9e/eaCgWj0CyjjG+pj/jnhP8JQitP4Wsx
 WgxbSoIFCZPkre5jFW8AsN8UFJ/MXgMfRU5rsTPo0A==
X-Google-Smtp-Source: ABdhPJw4VNpf8tlUfBl06qtVZ8YOmV3Z84B8JLpkT4c5kKerBg3pWvWA2nIYpfCwPoryDCL0p0v7Vr0crxxIxVzr8UU=
X-Received: by 2002:a2e:984b:: with SMTP id e11mr10839229ljj.358.1591639176349; 
 Mon, 08 Jun 2020 10:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
In-Reply-To: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 8 Jun 2020 23:29:24 +0530
Message-ID: <CA+G9fYuHsezzit3pzHiz-6ad4AfbgRsdbuqfUKvLif7_Jk5WkA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime03: Fix issues with negative offset
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 4 Jun 2020 at 17:11, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The tests takes difference between two time readings and check it
> against the offset set by the test. When the offset is set to a positive
> value (eg 10000 ms), then the diff comes to a value >= 10000 ms (eg
> 10001 ms), and with divided by 1000, both sides evaluate to 10.
>
> But when the offset is set to -10000 ms, then the delta is >= -10000 ms
> (eg -9999) ms. And when divided by 1000, it comes to -9 != -10 and the
> test reports error. Over that we are comparing value in seconds, which
> is too large of a value. Change the test to compare delta in ms and fix
> the false failures.

Test ran for 100 iterations on x86 device and confirmed test getting pass.

>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Tested-by:  Naresh Kamboju <naresh.kamboju@linaro.org>

ref:
https://bugs.linaro.org/show_bug.cgi?id=5640
- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
