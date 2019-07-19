Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B80116E2C3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 10:44:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70CC03C1D04
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 10:44:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 231AC3C1480
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 10:44:22 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D94291401AFF
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 10:44:21 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id u124so21037025vsu.2
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 01:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1A28HjUDraw7CCv3Ug6g6JrM+Jg39Z3Cai9dns8M8E=;
 b=klZi50lSYPnpAKMA8SL5OdnHAQdsr5VCtykBbnzc4x7W4d8J+VQ+EvgWFtcnLvQXEI
 WvtB4/n84LxZ8bynvZPeyrrHayeg6EPu/3ckyyCnQ9M/Qz9Wj+WM0fFTjRQl+unVTbGq
 O3RflhYpci/BbYhS0czxUISZGlww9SDngsb1JPF19MrdSfpklNMJqo5R3fIWTV9grgs5
 7/oV/igNT6vGEVM01+ClEZNA0roeGvGjBqhT6jtG3r2EDKSY5UtI9ZiacctlYU2GrSit
 fYmWOGSqyaIfGD0fcvIr02G+9HT4LzmolOnDwkQIgtM1e7kXZRMdfkuvJjrnnKPfOvq2
 ODlg==
X-Gm-Message-State: APjAAAVs516cqWhPiKJ/JrrQUdbDt+JvoLvch4N8YVYDHO+aRSinuFHx
 FPtlEfhBUq+CANS3fJ+zE4tBOSOEJIzOWEQVbqrW3g==
X-Google-Smtp-Source: APXvYqyz0Ya+XdE7lUt9i/t1VBYFb0+o97mL5u3wjrc6rUH4qr/rUNWrgnWiYqu1+4BDfTHeY3h8f4PSOoZUoiYry9o=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr9761490vsp.130.1563525860770; 
 Fri, 19 Jul 2019 01:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
 <20190717094614.GA9539@rei>
 <7d2c4936-2e89-6285-c856-a156d3a76284@windriver.com>
In-Reply-To: <7d2c4936-2e89-6285-c856-a156d3a76284@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jul 2019 16:44:09 +0800
Message-ID: <CAEemH2edg4R-JFM=u_ceLoRcNAMmV=c+hVV6kxoK4g6DOBnGeg@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Borislav Petkov <bp@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@linutronix.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Question about kernel/syscall/signal/signal06.c
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
Cc: x86-ml <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
 Oleg Nesterov <oleg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jul 19, 2019 at 4:14 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> This case fails when boot qemux86-64 with 1/2 cores.
>
> I find [kernel 5.2-rc1: 0d714dba162] causes the failure by git bisect.
>
> If git checkout a commit before 0d714dba162, the case will pass on the
> same qemu configuration.

It sounds like a new regression on fpu. I will have a try on this test then.

@Hongzhi, could you provide more info of your test machine? (e.g.
lscpu, uname -r)
and test result with 1vcpu, 2vcpus?

[Ccing fpu Dev in this loop]

>
>
> --Hongzhi
>
>
> On 7/17/19 5:46 PM, Cyril Hrubis wrote:
> > Hi!
> >> I find signal06 fails on qemux86-64 when qemu has a small number cores,
> >> e.g. "qemu -smp 1/2/4/6".
> >>
> >> ERROR INFO:
> >>
> >> signal06?????? 0?? TINFO?? :?? loop = 23
> >> signal06?????? 1?? TFAIL?? :?? signal06.c:87: Bug Reproduced!
> >>
> >> But if boot qemu with "-smp 16", the case has great chance to pass.
> >>
> >>
> >> I have two questions about this case:
> >>
> >> 1. I don't know why multi-core will affect the case.
> > Have you looked into the code? The test is trying to reproduce a race
> > condition between two threads of course the number of cores does affect
> > the reproducibility.
> >
> >> 2. On failure situation, what does break the "while loop" shown in below
> >> code.
> > Bug in a kernel that fails to restore fpu state.
> >



-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
