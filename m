Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 846032B92AB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:39:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F6F03C5F6D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:39:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 958733C2E8F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:39:31 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EEEBC1A00926
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:39:30 +0100 (CET)
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kfjDl-0007It-TM
 for ltp@lists.linux.it; Thu, 19 Nov 2020 12:39:29 +0000
Received: by mail-lf1-f71.google.com with SMTP id y6so2100425lfk.8
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 04:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K95VyMEt+WXmyTVj4TfVUVN6Dcd35jtxe/w89VkDSQY=;
 b=KFul+AlKLc8u1M7q+GB7Yw2D+erbSXwKn408mUSdhqfaH2CbmGCZRxgPJAYh+9aFwC
 GJcDfxnWALG52odQ5mgwn25ndPayF3GJqVFZUZ7AlvcrvK2NNuf4AeTNPlA5aUXkDfcG
 srLtUS97utTveEfEU+YQ/gBFe1Wy/EYosdvMLNHdazU5H2h3A+wwzJl1DrsM7vdjW9NA
 1SItvpyLe24znXbPhnHZeIoTYSRCbaYoKm7hpbW/lgJ4W+DGNePudYv0S9l2iYuh220S
 yICz28iuxVZU/1ozc9e10h9iOsmb8k6OHaH35Krserofj+tnR1A2yyBxItGc7RGYDxUU
 emeA==
X-Gm-Message-State: AOAM533IfzLrM0SkawXbko0qsrYcjcX4bqCauXa7TqtYkRgTJx0LW7un
 kRFQk6hyLTp//uizn0RUX6+85mQQadx9O0RsWntBQU1veofVykOPj0MEeO2G6FoD7bEDwu8krQv
 Ucbas4dWsQWtvdi9GGHOs/dReOzQ6MX6Iyj3wp5mOlr4=
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr5770583lji.418.1605789569105; 
 Thu, 19 Nov 2020 04:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkAsHfWG0ROdkYsqEMT2fMBGlClFXIwGgzBR0YAUei14aJDApH8tG51PRHH91sObiy3Ly5Aaj7Ycqc3lR/CEA=
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr5770575lji.418.1605789568850; 
 Thu, 19 Nov 2020 04:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20201119100617.70968-1-po-hsu.lin@canonical.com>
 <20201119103825.GG2785@yuki.lan>
In-Reply-To: <20201119103825.GG2785@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 19 Nov 2020 20:39:17 +0800
Message-ID: <CAMy_GT_vgtbEuT=zxs+0CxT0FGzQ-ZRkBEVVeZQmt87k=+s+EA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: make explicit kernel config requirement
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 19, 2020 at 6:37 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > With commit eeed458492cc ("lib/tst_kconfig: Validate variables"), the
> > kernel config check is now more strict.
> >
> > In this acct02 test, it will fail on an ARM64 system running with
> > Ubuntu Bionic 4.15 kernel:
> >   tag=acct02 stime=1605709219 dur=0 exit=exited stat=2 core=no cu=0 cs=0
> >   startup='Wed Nov 18 14:20:19 2020'
> >   CONFIG_BSD_PROCESS_ACCT
> >   ^
> >   Missing value
> >
> >   tst_kconfig.c:475: TBROK: Invalid kconfig variables!
>
> Sigh, I will fix this so that we can have config variables without
> values again.
>
> > While the kernel config shows:
> >   $ grep CONFIG_BSD_PROCESS_ACCT /boot/config-4.15.0-1087-aws
> >   CONFIG_BSD_PROCESS_ACCT=y
> >   CONFIG_BSD_PROCESS_ACCT_V3=y
> >
> > Change the kernel config requirement to CONFIG_BSD_PROCESS_ACCT=y
> > to solve this issue.
>
> But I guess that we should change the kconfig into:
>
> "CONFIG_BSD_PROCESS_ACCT | CONFIG_BSD_PROCESS_ACCT_V3"

Hello,
from the help text it says:
"If you say Y here, the process accounting information is written in a
new file format that also logs the process IDs of each process and its
parent. Note that this file format is incompatible with previous
v0/v1/v2 file formats, so you will need updated tools for processing
it."

I am not sure if this test can work with a kernel that just has
CONFIG_BSD_PROCESS_ACCT_V3 enabled.
Thanks

>
> > Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> > ---
> >  testcases/kernel/syscalls/acct/acct02.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> > index fbcde0bcb..bd0427848 100644
> > --- a/testcases/kernel/syscalls/acct/acct02.c
> > +++ b/testcases/kernel/syscalls/acct/acct02.c
> > @@ -255,7 +255,7 @@ static void cleanup(void)
> >  }
> >
> >  static const char *kconfigs[] = {
> > -     "CONFIG_BSD_PROCESS_ACCT",
> > +     "CONFIG_BSD_PROCESS_ACCT=y",
> >       NULL
> >  };
> >
> > --
> > 2.25.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
