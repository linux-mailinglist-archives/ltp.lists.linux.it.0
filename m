Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49E2034A4
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:16:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E8AF3C227B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 12:16:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 449633C1D32
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:16:45 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D08B6011F6
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 12:15:52 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id 9so18615483ljv.5
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3B47LhSzlhf0CyG1tgvim2OLOrvyZ3razYI3nJme5U=;
 b=F7/MYp6K3ALqvV1Pk4dcuMsGKwszBlgZe6Wswk+bxqBKID6d74blxWVWa8ithjNlbB
 f+ZfUhB55CLLROLEhJ/H71hH4eGx/w74csavIqcgv2EUFST86ArC2UEIQN/srrf83gGj
 5UbUUqyvat9aUPnhxdtMeGggVsExXeL7vO3xXKMMMybrsHMSNMAr8IwdwtSbEZJM6JaM
 25hZeuIRs4MnuCB81nu7KQGTa+ZxC2MHgMzQOgAj/vZT5c+jKs39G2PVD6hKP6fNq31j
 981OSedENF5UJm6cPOHI+q/RjPTzDzvIvgFpySUuC1ijacExCY4BKFyAOTEpmQqF49Xb
 rP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3B47LhSzlhf0CyG1tgvim2OLOrvyZ3razYI3nJme5U=;
 b=YAfnckigEY3fFAbWPsgSXGd1+9Q3T+whkueSc7MZbh3PtDtHtRAVPle+rAGTH4UGH2
 IM2BYOSvPHZIZ1oyONCxinsJWKHH5CZO0NN9DC6BfPqLL/GuFKxd6/Ewu/AZ+d0H+xRP
 uPtMJagmV0ASAEhgVu4pzkKen0VDRmejUxwMaYrVq5OFdYzjzBel4g8NFV2hgWGRI/2F
 jrqTHkD0WFWR6MH1PTh+BM9AGrvSeGCN8mS7h3FwcXHy8Hd+iWrL5py8pX3RsMjgeD64
 JptSpmHyZLdwvzxAD0VMpVGfjhNi+aa1XOm/JXc9nchB0FROqT9hAIa/c3xl1IK2VZIV
 uyYA==
X-Gm-Message-State: AOAM530Ty192ZU7ALRaRWEiAOvIV3MzGOxsguIZ7IOfZ9vtp5Z4q31LV
 NMo5dBL6/nVubLRpDkmQuVVf0mWLrwAlntGeCl2Zpw==
X-Google-Smtp-Source: ABdhPJyKVFwQEbwtY+Abdz6wmfxYTSKmli499smwlc6siT5OYxo93F6Kbx9OmqeCMdTsTov+7kmIswdfNAfgYfOBi4o=
X-Received: by 2002:a2e:984b:: with SMTP id e11mr7726051ljj.358.1592821003711; 
 Mon, 22 Jun 2020 03:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
 <20200616132705.GW2531@hirez.programming.kicks-ass.net>
 <20200617131742.GD8389@yuki.lan>
 <87r1ucb0rt.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87r1ucb0rt.fsf@nanos.tec.linutronix.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 22 Jun 2020 15:46:32 +0530
Message-ID: <CA+G9fYu18y4iWOkTCDWi9dUj+FosStVTH-6swN7wE4GePZa=Ng@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Cyril Hrubis <chrubis@suse.cz>,
 LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [LKP] Re:  [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, lkp@lists.01.org,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 19 Jun 2020 at 01:32, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Cyril Hrubis <chrubis@suse.cz> writes:
> > What is does is to write:
> >
> >       (void*)1 to u_debugreg[0]
> >       (void*)1 to u_debugreg[7]
> >       do_debug addr to u_debugreg[0]
> >
> > Looking at the kernel code the write to register 7 enables the breakpoints and
> > what we attempt here is to change an invalid address to a valid one after we
> > enabled the breakpoint but that's as far I can go.
> >
> > So does anyone has an idea how to trigger the bug without the do_debug function
> > address? Would any valid kernel function address suffice?
>
> According to https://www.openwall.com/lists/oss-security/2018/05/01/3
> the trigger is to set the breakpoint to do_debug() and then execute
> INT1, aka. ICEBP which ends up in do_debug() ....
>
> In principle each kernel address is ok, but do_debug() is interesting
> due to the recursion issue because user space can reach it by executing
> INT1.
>
> So you might check for exc_debug() if do_debug() is not available and
> make the whole thing fail gracefully with a usefu error message.

My two cents,
LTP test case ptrace08 fails on x86_64 and i386.

ptrace08.c:62: BROK: Cannot find address of kernel symbol \"do_debug\"

This error is coming from test case setup
KERNEL_SYM = do_debug

if (strcmp(symname, KERNEL_SYM))
tst_brk(TBROK, "Cannot find address of kernel symbol \"%s\"",
KERNEL_SYM);

Test case got pass when DEBUG_INFO config enabled

CONFIG_DEBUG_INFO=y

ptrace08.c:68: INFO: Kernel symbol \"do_debug\" found at 0xd8898410

Full test log,
https://lkft.validation.linaro.org/scheduler/job/1483117#L1325

ref:
https://bugs.linaro.org/show_bug.cgi?id=5651#c1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
