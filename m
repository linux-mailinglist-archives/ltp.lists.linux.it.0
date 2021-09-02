Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA03FF348
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 20:32:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DE453C9921
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 20:32:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF0E83C29E2
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 20:32:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 66700600F6B
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 20:32:40 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D96C46102A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630607557;
 bh=4Uv+DCXrnA6ZfhVGgASolUc5pp/EvW1znCp7vw+gans=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fnzoNKNgbZxHxXsV17FmfO7Uq2TrNYoR1jgxi/SqJ3+2DQYlw8G+w7vIc+Db7NuZ7
 VwigPBeHFIaeDrjL8nzz2abkYTJbxfhPCGuDChQOL4AJ4duMJJa6gJBO47QvEn0T6g
 symA4YRvCtUTJ3nH83pg/NvtpsC60SxF6bm4yV6XCFDIkEyUPmlD0obC5p19CC5luq
 gVehopU5TP75LcS9S7qb6PhnYQ2aQuxqsc8eZgWTGIAjEWBjMn1aeqZ4Y93GonFvJ5
 w36bqETLG+mW8obQfLYFogf6r0qdPdzRTw9LG0m18fh7eiwrsB0XmobRmTYBkKn6c4
 Ji7BtdBY+5C0g==
Received: by mail-wm1-f46.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so2035806wmq.0
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 11:32:37 -0700 (PDT)
X-Gm-Message-State: AOAM531MSBqjSWB25f2FrASJsPRynR9E0PPKcyxd1Bzu+tfXB21lcsAW
 rD1n2azXAR6B7Vi2SIzUy/D8BtI7ZulBPx1o1Tw=
X-Google-Smtp-Source: ABdhPJx2YTSr8EVrjjGP3wDbstUOaEtGQha6xbDMaLO02Qsj5Kob/DAMFSOEs5ibmeeXZiXrAAcXUlEkJ76yF7ghE6I=
X-Received: by 2002:a7b:c769:: with SMTP id x9mr4456560wmk.75.1630607556569;
 Thu, 02 Sep 2021 11:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210902093655.6104-1-lkml@jv-coder.de>
 <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
In-Reply-To: <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 2 Sep 2021 18:32:20 +0000
X-Gmail-Original-Message-ID: <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
Message-ID: <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 2, 2021 at 9:42 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> +Arnd
>
> On 02-09-21, 11:36, Joerg Vehlow wrote:
> > From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> >
> > These syscalls are not available in 64 bit builds of linux.
> > See: <linux>/include/uapi/asm-generic/unistd.h
> >
> > With the syscall defined, the test clock_gettim04 fails with
> > ../../../../include/tst_timer.h:216: TCONF: syscall(403) __NR_clock_gettime64 not supported
> >
> > Fixes: 59d278d61ed90117607f389326e0816a14dbf53c ("lapi/syscalls: Update syscall numbers")
> > Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> > ---
> >
> > I am not 100% sure, how the syscall table for aarch64 is generated.
> > There are also compat version for some of the 32 bit only 64 bit syscalls,
> > but I think they are only available, when running an 32 bit arm application.

The syscall table for aarch64 is generated from the kernel's
include/uapi/asm-generic/unistd.h, which has a number of #ifdefs in
it. A lot of these are disabled on aarch64 since they refer to older or
32-bit-only calls.

https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html has a table
with the correct set of syscalls for each architecture, and scripts to generate
them from both the old asm-generic/unistd.h method (now only still used on
modern architectures) and the newer syscall.tbl format (used on older
architectures)

It would be good to finally convert asm-generic/unistd.h to the new format
in order to automatically generate tables like the one used by ltp. In the
meantime, please double-check all architectures against Marcin's tables.
The same problem likely also exists elsewhere, e.g. for rv64.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
