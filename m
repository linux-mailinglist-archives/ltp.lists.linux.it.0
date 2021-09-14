Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D273D40AD4D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:15:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 681A03C89F2
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:15:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB6203C1DB4
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:15:43 +0200 (CEST)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7274200DDA
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:15:42 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id t6so18136005edi.9
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2IBqSDhOVEDFvwBK5B69Ld/BKdedhZu0WbMQKGDl2s=;
 b=dgdIiBwnyBBp3h/ZmQxMDA9QIMYgxTpn9A6JmFaGHXmNjt8gG6VfeE8mNeZkS3bb82
 VdoJyxu7UFulFR5FihxC29QDqTE5RKF1oEegQPeB4rOCvCWWFZaecZ/oTrY72zrT11v8
 k/fu+KeX3UObGxkHBQVkMpVRa1o90UJ0SSKPmAr/mAl/WWbRvp12Wt0yVM7LfPgvdB2X
 EBK7KSCXVVyqUDaOc/OVODam1vnCOM8m7G6r8Kl8wCeOM2iadgrwuGOEIu+flCBBMZ5r
 P/vVWPQ6h5V3IGt/wCV38EOq9BKfRh6SM5d57yqQkcPndk6MPM/FE724HmIn9ywIa+kf
 dvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2IBqSDhOVEDFvwBK5B69Ld/BKdedhZu0WbMQKGDl2s=;
 b=QVsUgAFvw+osdpSe0XC8zpfazPpPT7Z3RRYqO3PumSlu3qu80D86AyOtzV1pSDAE5W
 JxW8Y5a68fcC/tZlN5BwLxJ1fUlNxopFUboTDliBFj6hbM/S2sE564m3OXiojMvxePIT
 Vd+9ir3UyLSypx9q4itG8IPTl6btPDPXAf8IOiDP+Xy6d5b/h+VbLNW7xPIFlfkBDy43
 6IgzKPvhOfT6z0+V9gHQQKs8BKpMBI2A7c/MsdrAxOtWdS/6gePtBX/2U8g0xC7A3n6T
 B2V+d3+83zBrGY98fnF43yCMEmta/vhV6hP4o1FJg4HUnnWB7pFoE7iX2+CmQAXA5NNA
 NICA==
X-Gm-Message-State: AOAM530eGUkw+UUhtpm5pi+vx37yErVCYb/JCw08sf5ttlpo+IgkhykK
 rKw4/gYpXe1C0GujDvEnwHetQSEC48m3FzcUbZ7gbg==
X-Google-Smtp-Source: ABdhPJwXksD1jDWChIU28d14t57g4IyoNzXkeY0x4x0i9jOrXf8tjKPq3EzgUr7HxuTeqibDpd5r4iF+8hjaHCDXNy0=
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr11673337edp.103.1631621742223; 
 Tue, 14 Sep 2021 05:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtJYK4C4q7v2VBgyHe1EdOeZ=auEytoKJr0gYThj8gS5w@mail.gmail.com>
 <YUA4tLquwA3XRKfW@pevik>
In-Reply-To: <YUA4tLquwA3XRKfW@pevik>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 14 Sep 2021 17:45:30 +0530
Message-ID: <CA+G9fYtLzhDG+kz-4yigaV_Pxu2UvSa-azXNtzrbr5qv-MZZjw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: smoketest: route4-change-dst fails intermittently
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

On Tue, 14 Sept 2021 at 11:22, Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Naresh, Alexey,
>
> > LTP smoketest  "route4-change-dst" fails intermittently on various
> > devices and qemu.
> > We do not want any intermittent failures on LTP smoketest.
> > Shall i send a patch to delete this test case from runtest/smoketest ?
>
> > - Naresh
>
> After Alexey merges DAD related fix [1] we can keep route test right?

No.
We will delete " route4-change-dst".

> Do we want to add ping02.sh -6 or replace route with test with ping02.sh?
Yes. I replace it with
ping02.sh -6

- Naresh

>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/patch/20210913123935.10761-2-aleksei.kodanev@bell-sw.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
