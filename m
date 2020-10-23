Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693529761A
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:50:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDC103C317D
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:50:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2A54C3C23E0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:50:26 +0200 (CEST)
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9E7B11401333
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:50:25 +0200 (CEST)
Received: by mail-io1-xd43.google.com with SMTP id z5so2829087iob.1
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHLmS2i+xk5cy1+Hh+6vgNtXSGGSQNTTVydbxoIIvxM=;
 b=zC+oRhFaf2/DzBVi/uf1QHqmlqYAMFk/0Yiq6WYy9+Xgfh3NGCaUCcTJ5Q7xSOvUZb
 xe6Nolg1AUdP4BtgPyn07pt0IrBoA9v6TPP5Zfonzu9OhuRJOOPnfM9l4P489FofeFwK
 MfB12Fm281RSTLVc2auMXC/NjKcR9gM+7yPsbZGb6xRuj/RVIewwfCV+5XqaGZnYtALt
 XJ/4OaJYvehbbklG3uz5H59+p1C9Jz2kLQ0URQd+x0aYhYZCEVAU/yJBvItYYSk/tetF
 ss5gP7Je4RLLDflZH5pdRyLfYVhSwGK+kZrSB3N6p+ziSWiyM5NEFfOhAGetgintlI5G
 I8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHLmS2i+xk5cy1+Hh+6vgNtXSGGSQNTTVydbxoIIvxM=;
 b=stT8tHL+g7bVxPT5xoIXERWE9SPqubLi9BLOByEd3LVq1Z/HLpnM+cY0GwmqV6qp4T
 hHg4Q4DWc2eWC7PTyohER/nkBCkA5gv2QWudnO0R/WySBBSF9Y7cgJr2/BzlZ1N1Hogi
 /c7Lnlm5rgpQ9tN+mQz2K3x+6soeDHhM4IcPXcAuqYeL6peXYu7nc2yG0ohmskrsfkdz
 Ma2mnwdDAc3y5Tg41HIgy9jelgTCI/0hEcVgU7cNrZMwWH3HEeAC2s8R3sOr2uuc66GI
 F6OJ8mWgaiESLiOH8xTSjVBaX//0lMFSLfBNgoIorPYXcxYwtK2Cwz4A0f9dRTJZlntT
 P+mw==
X-Gm-Message-State: AOAM532K5oFb7ltsGxFixwmOfMGxP3LCzz1M++qJG8BABOh1UZGuAUz+
 3/Kbi8AVV9WLkSKlpzI9tFkpSXbYBVIKzbPreqV+Fw==
X-Google-Smtp-Source: ABdhPJyI9aI5b3pmXuhMgGrCrrMpBrygNRxfLkTQjP+IQ0Z6lG4mFD0G0YvJFmbR/nZxXl1QGX0zhYxPd3SDPBH82Q8=
X-Received: by 2002:a02:a910:: with SMTP id n16mr2826341jam.35.1603475424367; 
 Fri, 23 Oct 2020 10:50:24 -0700 (PDT)
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
 <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
 <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
In-Reply-To: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 Oct 2020 23:20:13 +0530
Message-ID: <CA+G9fYtR9p_OqYNT6=tKh=hsQDXC_1m1TgERPFH0ubuZGcg-DA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, lkft-triage@lists.linaro.org,
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

On Fri, 23 Oct 2020 at 22:03, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 8:54 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
> > >
> > > That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> > > could break something else), but the obvious first step of rearranging
> > > so that the ptr argument is evaluated before the assignment to __val_pu
> >
> > Ack. We could do that.
> >
> > I'm more inclined to just bite the bullet and go back to the ugly
> > conditional on the size that I had hoped to avoid, but if that turns
> > out too ugly, mind signing off on your patch and I'll have that as a
> > fallback?
>
> Actually, looking at that code, and the fact that we've used the
> "register asm()" format forever for the get_user() side, I think your
> approach is the right one.
>
> I'd rename the internal ptr variable to "__ptr_pu", and make sure the
> assignments happen just before the asm call (with the __val_pu
> assignment being the final thing).
>
> lso, it needs to be
>
>         void __user *__ptr_pu;
>
> instead of
>
>         __typeof__(ptr) __ptr = (ptr);
>
> because "ptr" may actually be an array, and we need to have the usual
> C "array to pointer" conversions happen, rather than try to make
> __ptr_pu be an array too.
>
> So the patch would become something like the appended instead, but I'd
> still like your sign-off (and I'd put you as author of the fix).
>
> Narest, can you confirm that this patch fixes the issue for you?

This patch fixed the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build location:
https://builds.tuxbuild.com/uDAiW8jkN61oWoyxZDkEYA/

Test logs,
https://lkft.validation.linaro.org/scheduler/job/1868045#L1597

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
