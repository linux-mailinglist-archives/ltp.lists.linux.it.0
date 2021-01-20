Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35B2FD65F
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 18:05:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62C663C6960
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 18:05:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BC7BC3C53CC
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 18:05:02 +0100 (CET)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4E29B1400351
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 18:05:02 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id g12so34546645ejf.8
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 09:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygo4ihXAQ6aNBNW76FuiLplTSvD7VKoQTP8g0Cy2UeI=;
 b=pF9PkoLoQEMblsHnjbnCjU+cyQ3TIRdi4hvcHzMD4bgKWoqFVMBcSNtYlF6k01jDuT
 vN0OoJKbxkI3fR2yoqV4P6H4Gc5NE1WBYZSs0rBDSV55DkqGgBaJasfs8+Y3amK7ESo8
 agl8kB4p0OLRwLu/JVVORcLpbIJdUoq+JmFzSwngrKVOlk5IpEh1c4XlPfZWZXB7QBwf
 SuNVBHx8XAfSxpZWclImjwaniO9l4HI98YpO5UWsNuxlsoYbcCkAYb6+38ybli1AyhQu
 rNx3R66sWKHzNjf/VSHBFm803VFomw0qNfI1+d6LL7KC5fgowaSwVM4fuS/U52wGo/uS
 ah8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygo4ihXAQ6aNBNW76FuiLplTSvD7VKoQTP8g0Cy2UeI=;
 b=C+FerC1H3YFkRqKdVQW5cvR7pKVP3UhypuGG+LNvPpjq1yB17adSNVBwKzTGrH4TUt
 bv/59PNlGldhXC6xeixQwTaz6liDd2iug+VCeF6gnfqmW9b1FrLE+8xsEf6QuTtKc1Ix
 36NuKerlQBx7L30FbCVj6Bfdx0Z0dP6CZRFtrQoUCNSZOtYg0FCJoqKFlQOXrBx+i1VZ
 ad3vd9aEZrWn5Y28DaJP2gnSvopEBqISwCTMdtTkP0hzq8/Jr/lzLzGeyGDYBFBYSPn3
 qg1Qoh1J2egE56djPnOv6+6L5+FIltbbdwzeiBfL8vEt3CaW7nQuH/PiqZ+PnNbJFVH3
 4vQQ==
X-Gm-Message-State: AOAM532zjv+PzNl0FLZIe+YtvkmI5TJAXdMOJWe+c1XoBCuZ2cIJxEKG
 bgzWWdh4gBV1MfM1gSFt5RcmpbsPRaNbVZrZMpeIEw==
X-Google-Smtp-Source: ABdhPJzppQPuiqFokIiZgXZPUPdHskuNuIkOGMG0GTOjRfn+Sr8xOZKgHV+SXJSS6lEoI5XH8Ob3wqJoHteSoIe0lTI=
X-Received: by 2002:a17:906:2695:: with SMTP id
 t21mr7211275ejc.287.1611162301695; 
 Wed, 20 Jan 2021 09:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20210118163240.29558-1-mdoucha@suse.cz>
 <YAbT62ecN/lq12cT@yuki.lan>
 <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
 <YAhEEzWShFLlHrk1@yuki.lan>
 <CA+G9fYuDpnJOcHA5Me4KM4v+NaFW=2_3id=Am6skbDavb1iACw@mail.gmail.com>
 <YAhHAWTedDb/6Hd/@yuki.lan>
In-Reply-To: <YAhHAWTedDb/6Hd/@yuki.lan>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Jan 2021 22:34:50 +0530
Message-ID: <CA+G9fYtKz+mW4S3SjgNDomPKo8JbVh9SyQYbbj92xZYxuEmG1Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

On Wed, 20 Jan 2021 at 20:35, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > > I have applied your patch and rebuilt completely and retested
> > > > ioctl_sg01 test case in a loop on three different devices.
> > > >
> > > > 1 PASS out of 20 runs with overcommit_memory 0 on x86_64.
> > > > 1 PASS out of 20 runs with overcommit_memory 1 on x86_64.
> > > >
> > > > Which means 19 times the test case triggered oom-killer and the test was broken.
> > >
> > > So it looks like 64MB is not enough in your case.
> > >
> > > Does it work with 128MB or 256MB?
> > >
> > > i.e.:
> > >
> > > safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);

After changing to 128MB the test got PASS with overcommit_memory 0 on x86_64.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
