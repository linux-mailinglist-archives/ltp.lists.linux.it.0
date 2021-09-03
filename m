Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2053FFE9D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 13:04:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9606D3C27F0
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 13:03:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E0053C27F0
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 13:03:54 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D190600FA7
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 13:03:53 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E13246109E
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 11:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630667030;
 bh=tjkMRLU51kyTMHh5GQ8IdRCg3WZEQEXxnEm2WjHnUPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AOVke4NVbLfZHCtJ4z3vru/MteN3eP6JdeSJ5SYmroKfNO4W2Eh3rw3zvo3qc1I1s
 Hx6EKggZEXkSc2a2Ww82SRs13IPaNx8Wqfq65i7vqSReWwnC0KZ3Bma3HiKaSu923g
 Z78kU/1zbcAB2ky4Q2IpTcSgUl83fXdCakhiX4p5Whjavfg0BP7x8wFFMmPyPRr4LC
 zY/UF/SN1NqdWIrL+Syv8ccYlX5fHojPTWTgf6cwHhuQQPpYIyDKOVERNNdnTZba5R
 aM5ufajcRt8sT2IzCndBSMfXFjw+UsAUUDhPTbfvaFeqt/IYL/2nNm+MqNogN20Eeh
 9g/5KKgy7IA8g==
Received: by mail-wm1-f45.google.com with SMTP id g138so3235516wmg.4
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 04:03:50 -0700 (PDT)
X-Gm-Message-State: AOAM533ZSuB3bUUhePDHiu/eLAFLcGTTel3H83uSorReCvx82Xpu+U+n
 C+imHaPJX7SwqBBW4b8/AlrouJ7JQxN3kafavbA=
X-Google-Smtp-Source: ABdhPJx31suOvV1jwgUl27wrzeyn6XwDbZ1S6KVUMSU/fE+86UURJ166rySch4VPv9npJpuBq0PC5zeSMnp2g26lIRM=
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr7779126wmc.142.1630667029480; 
 Fri, 03 Sep 2021 04:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210902093655.6104-1-lkml@jv-coder.de>
 <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
 <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
 <84a0c4aa-4faf-4271-36c4-5570f8c3a004@jv-coder.de> <YTG/MERCvZkBalov@pevik>
In-Reply-To: <YTG/MERCvZkBalov@pevik>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 3 Sep 2021 11:03:33 +0000
X-Gmail-Original-Message-ID: <CAK8P3a3wOfFnN5UQ6MC0z+PtCSmMz_3NFmatAuD1Lb6jH7J+YA@mail.gmail.com>
Message-ID: <CAK8P3a3wOfFnN5UQ6MC0z+PtCSmMz_3NFmatAuD1Lb6jH7J+YA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/aarch64: Remove 32 bit only syscalls
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Sep 3, 2021 at 6:22 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi all,
>
> > Hi Arnd,
>
> > On 9/2/2021 8:32 PM, Arnd Bergmann wrote:
>
> > > > > I am not 100% sure, how the syscall table for aarch64 is generated.
> > > > > There are also compat version for some of the 32 bit only 64 bit syscalls,
> > > > > but I think they are only available, when running an 32 bit arm application.
> > > The syscall table for aarch64 is generated from the kernel's
> > > include/uapi/asm-generic/unistd.h, which has a number of #ifdefs in
> > > it. A lot of these are disabled on aarch64 since they refer to older or
> > > 32-bit-only calls.
>
> > > https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html has a table
> > > with the correct set of syscalls for each architecture, and scripts to generate
> > > them from both the old asm-generic/unistd.h method (now only still used on
> > > modern architectures) and the newer syscall.tbl format (used on older
> > > architectures)
> @Arnd: thanks a lot for this table and explanations! I would not expect this
> kind of error in kernel sources.

I don't see anything wrong in the kernel sources here, just a little misleading
when read by a human rather than a compiler.

> When I changed / reviewed syscall numbers for LTP, I usually compared with
> kernel and musl sources. I never noticed change, but now I see for
> clock_gettime64 it's in musl only for arm (arch/arm/bits/syscall.h.in), but in
> kernel it's not only for arm, but also for arm64:
> arm64/include/asm/unistd.h:30:#define __NR_compat_clock_gettime64       403

This is a kernel-internal definition that is used to build the 32-bit VDSO. The
file is not made available to user space applications.

The file you need to look at for arm64 is include/uapi/asm-generic/unistd.h.
As I said, that file has a lot of #ifdefs and other magic in it, but I suppose
we could come up with a script to process it with /usr/bin/unifdef to only
get the parts you are interested in. Ideally though we would just
convert it into the modern machine-readable syscall.tbl format.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
