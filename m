Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEA2972F4
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 17:55:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B1E23C317C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 17:55:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 28ED03C2620
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 17:55:05 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6D64D2009AD
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 17:55:05 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id a5so2065496ljj.11
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
 b=GD436E2U3ELljPkL4nM1PYvlFMy+YQnW7aen5YTspfRl7ksFgb2HDAmkn6V4t+JDaG
 dMMQj13VpeQs7o/RmxbX2tP6MlGCxWLIBdmEqKZM5NLiH7YFdLHZUROFosyHo2YrU1Oc
 /mkd7zfPG7SEUfxCAGBxjhO9Vpkj4+BC/pLM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
 b=TCseXA2/hL8LZeqGnfOGzj/VoSZSbQxaLyIQRUgUTM6BI7UqtUh489Wes+zBhwarq2
 x0oP05LPmizezu6QLjbctPnSpNDNFV3rmRlGnN8oXnyeOg3wjke5y6m0YoO6q7mNWUn3
 4I2MLdSUaKWARneuBdlpR0FcRH/HAUlXcOX0pHllsX2oZsQBOYQ2Gd3l25ecJ6vQUkF+
 M4EyNrgCSLwnWMAeBUO/swIeKEURRiYGYyOTFb13C/0yy2CblbAatFsLC4WwUGZ0MDO3
 JQBLkGxctFxngNbKTw9f3o6ZQ1GFt+D4IIOD2jepfOf4OzbVNTLTvpRxr0QDW0SpPPV2
 ekpQ==
X-Gm-Message-State: AOAM5315JzOFuGfVt9riEbuJC5xrGsD/c3M61fwfkFs6KwvEPrfXXiKZ
 4sTv7cW2ULsFhBW01BYHapMvNoBUgsXU+Q==
X-Google-Smtp-Source: ABdhPJz7jh1t0SeKKyzae5O2+w94kBG4NXtt+YOT+bTiHzwHNgTdzdqtmeRgrNWjgDraZoo9BK9L8w==
X-Received: by 2002:a05:651c:484:: with SMTP id
 s4mr1198756ljc.272.1603468504464; 
 Fri, 23 Oct 2020 08:55:04 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id j17sm202118ljg.82.2020.10.23.08.55.01
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 08:55:04 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id m20so2097151ljj.5
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:55:01 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr1227378ljh.312.1603468500894; 
 Fri, 23 Oct 2020 08:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com>
 <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
In-Reply-To: <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2020 08:54:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
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
Cc: zenglg.jy@cn.fujitsu.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, X86 ML <x86@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Vyukov <dvyukov@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> could break something else), but the obvious first step of rearranging
> so that the ptr argument is evaluated before the assignment to __val_pu

Ack. We could do that.

I'm more inclined to just bite the bullet and go back to the ugly
conditional on the size that I had hoped to avoid, but if that turns
out too ugly, mind signing off on your patch and I'll have that as a
fallback?

             Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
