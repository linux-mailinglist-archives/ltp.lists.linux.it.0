Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40134295173
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 19:23:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C499D3C56A7
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 19:23:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0A0303C263E
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 19:23:09 +0200 (CEST)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6E1EE1000232
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 19:23:08 +0200 (CEST)
Received: by mail-io1-xd41.google.com with SMTP id k21so3975520ioa.9
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7535FUlfM8DZDchGw8aykWjhU0FVacKPwMt6VunyyW4=;
 b=ub1i2qnqq5gc5yWa++WfJbKGLRDF3XgcjuF4SNEwsZorMl0qqBlkzzk65jDvd1rIp6
 lsc7BJmCFH+/nkMbVQcVwn4bYWFUNTGPYV9LnCocI598fe1uL6/mDLuJIxfahYegMgmV
 O6P5shfiwBpbj5CWne+FmGk5phLqk0nId5IETHoA04NJ3VI8BSq+2EJbyBFyDYvD9KOQ
 SIXqL0Q6SqAfgMBeJW3/ZMjqQX2LwKMlStEFUHBOIC/HAkX92HVDxbei5SvC4AtBDDgM
 BjeK/N4wHt0pTqvRnrqr83fx4BR3FWwhR0strhBEMc39uPq0fD7cDyRbXeouxt7OuCWl
 kfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7535FUlfM8DZDchGw8aykWjhU0FVacKPwMt6VunyyW4=;
 b=b95zSz83gleER+jBsZFRgdEEqi50GC4RrxiVXL4bfZYRqgOG7rEa9e8vMv36kYStuA
 EOS/aPjLRedbV7uy9saRi/2J8wegFVpw75ZAU6qb6WyN4hFhcGxjbOFhM4YkLxjAnHfF
 UpTIQ/6PkFSH/2XrNITgKpjhpUSjCqLMWVemP/Tv8M4BtWOHqf84gXYGmAz7Ju8d0ist
 LICW/XqIGiUmmEKi58HY2xhDrRuuRAweNqSUr4YYsl2zvaIUGr8UK33wm1geq0hwvH5S
 jyPfrXtAWHTltlNNYlKxoZydBjjfHb1xmmpzBtrNfFJXZCsOUaaoM1SNO9ukBsy/Pu9n
 /VMA==
X-Gm-Message-State: AOAM530VQAahvIXxpQdeNiJpQIkaJ+/DCbtSTvjTQPC6QWqUXhZc3GoH
 z0A0Tp0r4KwQwp02Ml4rFMAnjst0vFkVAZqHpweF2w==
X-Google-Smtp-Source: ABdhPJwAHwzHnXyK/Q61hpqVatVAWev4QhEe6lQZY+aucdSgk3iXPP53Fr7H1mN9nTWnRSkEsIkHirrQTjnUX0bFcLQ=
X-Received: by 2002:a6b:5c06:: with SMTP id z6mr3661750ioh.49.1603300986883;
 Wed, 21 Oct 2020 10:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
In-Reply-To: <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 Oct 2020 22:52:55 +0530
Message-ID: <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, zenglg.jy@cn.fujitsu.com,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Dmitry Vyukov <dvyukov@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 21 Oct 2020 at 22:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> > x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> > This regression started happening from next-20201015 nowards
>
> Is it repeatable enough to be bisectable?

Yes. This is easily reproducible.
I will bisect and report here.

>
>              Linus

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
