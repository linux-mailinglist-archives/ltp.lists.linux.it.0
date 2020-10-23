Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E63298A92
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 11:42:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A123C5618
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 11:42:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BC4B53C23CB
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 23:16:10 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4C4B600A3F
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 23:16:09 +0200 (CEST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B16282467D
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603487767;
 bh=qQcFmOGTx12wPD63RiThRe7Vh0MNAYSb3WtVSv6KO9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ylYjv002r5/d4PJz5MfpZMB4thciSwlk1eXkJiCA3bvenmoPxzuiHjvcXDcackAcE
 w6VNJ7rBH6083fbGYBlG3chnrNZbtJNPqO54/g2gQKHUjVIOrFDXlaNINXtFbJdoKt
 OK0nV4hNeaJ18/R+8VfmdHAtYYky9/5RkmV0QCgE=
Received: by mail-lj1-f175.google.com with SMTP id c21so3031765ljj.0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 14:16:06 -0700 (PDT)
X-Gm-Message-State: AOAM533SpgTpAr2FeDqFl3Wtn3QjcYwKWlyBin7Toe3/aP8VC41uh9gF
 EMBblvYK1eJ+59nApvSvDnE+06CwsjrxfoQYC6k=
X-Google-Smtp-Source: ABdhPJxMP4Oqfuc0h+oHI0VayAXX1a002RyckvG+CEYT7Qe0w/jJqsSdKxhG124OF9Ag+jl4aWynWIOTPbYK55JDXo0=
X-Received: by 2002:a05:651c:cd:: with SMTP id
 13mr1498277ljr.392.1603487764782; 
 Fri, 23 Oct 2020 14:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
 <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
In-Reply-To: <CAHk-=wjyp3Y_vXJwvoieBJpmmTrs46kc4GKbq5x_nvonHvPJBw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 23 Oct 2020 14:15:53 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6wZRVoT3Bu6YBVjWVm6JBz9n6_RoZKGM7KrVAXx89SFQ@mail.gmail.com>
Message-ID: <CAPhsuW6wZRVoT3Bu6YBVjWVm6JBz9n6_RoZKGM7KrVAXx89SFQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 26 Oct 2020 11:42:14 +0100
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lkft-triage@lists.linaro.org,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 23, 2020 at 10:51 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 10:00 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > [Old patch from yesterday]
> >
> > After applying your patch on top on linux next tag 20201015
> > there are two observations,
> >   1) i386 build failed. please find build error build
>
> Yes, this was expected. That patch explicitly only works on x86-64,
> because 32-bit needs the double register handling for 64-bit values
> (mainly loff_t).
>
> >   2) x86_64 kasan test PASS and the reported error not found.
>
> Ok, good. That confirms that the problem you reported is indeed the
> register allocation.
>
> The patch I sent an hour ago (the one based on Rasmus' one from
> yesterday) should fix things too, and - unlike yesterday's - work on
> 32-bit.
>
> But I'll wait for confirmation (and hopefully a sign-off from Rasmus
> so that I can give him authorship) before actually committing it.
>
>               Linus

My test vm failed to boot since

commit d55564cfc222326e944893eff0c4118353e349ec
x86: Make __put_user() generate an out-of-line call

The patch also fixed it.

Thanks!
Song

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
