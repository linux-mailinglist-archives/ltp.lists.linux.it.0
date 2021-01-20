Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E22FD2F8
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:47:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DB553C7CA5
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:47:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 76B853C24FD
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:47:39 +0100 (CET)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2D9C46005E9
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:47:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id a10so17253151ejg.10
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Tw5dLBZI3l4k5nStcrO3Fb0iMjhCqMCvKxY7HqFtMI=;
 b=XpOhwThfXDaf/r55cxyiA9J1dOC9O4a2qG1snsfPL11cSRq2jEn4/tjk/UuMOD1zQr
 mnhOn+Ws3kZFB6pUP1MZHUjlYM1pl9+4rmJm+WbVvNSH352OxvZYvQGWcheJKs5pdf0X
 qOo+GzlehU9pJbKRO8Z/5aDar6vCPnxchwcSD5l5Nu+S90R3Oac+1NQGY62frCTCYX91
 qaFr1Vb8EX4yoUS/HRtM5UkbYs7PeylIaBqvVa4Q/9vdPHN8dfza/aikcp0yh5h1b9Sa
 f/ulb0NQvv8EO7eeSEgpOv4wXsdaohSrh2cs1P0hgv+TyMDwSLGZtap7Q9nXB2vShNgD
 1UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Tw5dLBZI3l4k5nStcrO3Fb0iMjhCqMCvKxY7HqFtMI=;
 b=Yupxm2jiBeiX6Bwq5I1iyh01SmvnNxzmqWPpTIuL5YBETVuiYC9GMZu3uBOAiz77wO
 jIHXOgfFRESujs8IWJDyPO/6oGWrsdcMxwS0jVXj/IU37F9HWDsSuZVtA9evwMoheZQg
 xOHenhxfpCVGu/xfUVDcYQVhnBGsnXBxs3i4ymkaFmt9eAQqAQ9a1p5rMVywsvS22z6s
 JSwvVActEFIpAoG/n8QBJK76aytWfXnhEgq9Ag6UUzgDbbX4GH4LxP5fHgY3RrBG3qRs
 n/ZyCAVhQ/yyC1q1tJzWVQG5MX+UzpeusM2D+xfPaG6q2Bx/wItbUJjeQAl0ebO4Aw34
 TAHQ==
X-Gm-Message-State: AOAM5331t+GJBKUafW7kHYmqNQag5o3oJjSJQyPqGIjTBhI+S32Tfb7B
 vm+3a0KEvqzS6I32cBq2GazAbAsb+zoeMcpmbGnqAw==
X-Google-Smtp-Source: ABdhPJziU97sL5hH0xgPMimkRDqMMXTw1ZMBMcsFR/x9WcKkXxrXPrt4DDPQS/EP5cV4s1xAW+xvJVC84G5FP0jwNDk=
X-Received: by 2002:a17:906:796:: with SMTP id
 l22mr6428431ejc.247.1611154058646; 
 Wed, 20 Jan 2021 06:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20210118163240.29558-1-mdoucha@suse.cz>
 <YAbT62ecN/lq12cT@yuki.lan>
In-Reply-To: <YAbT62ecN/lq12cT@yuki.lan>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Jan 2021 20:17:27 +0530
Message-ID: <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_pollute_memory(): Set minimal safety margin
 to 64MB
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 19 Jan 2021 at 18:12, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> >       SAFE_SYSINFO(&info);
> > -     safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
> > +     safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 64 * 1024 * 1024);
> > +     safety /= info.mem_unit;
>
> I guess that this is safe enough for the release, since it will only
> increase the safety margin.
>
> Naresh can you please test this patch ASAP?

I have applied your patch and rebuilt completely and retested
ioctl_sg01 test case in a loop on three different devices.

1 PASS out of 20 runs with overcommit_memory 0 on x86_64.
1 PASS out of 20 runs with overcommit_memory 1 on x86_64.

Which means 19 times the test case triggered oom-killer and the test was broken.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
