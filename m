Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7F29663A
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 22:55:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E97283C3201
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 22:55:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EDEFB3C295A
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 22:55:36 +0200 (CEST)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 10DA8200DAA
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 22:55:32 +0200 (CEST)
Received: by mail-io1-xd2b.google.com with SMTP id r9so3135332ioo.7
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VDqQ1zUFMtHdEQX/XnB1xFyEhicaRQXlC/XVGrEZwa8=;
 b=VyEe68XlMV50b/P9pS/svd5VOtStgjDnCFZMZjKTTx7pdFDDhzCENV4HcxJM9i+Uuw
 LiDRngh7O9Fhy7t3czR8G9POoGKJpzUcMMpE1KWlgBTNmSNaqB++disNaWd9E1RwFlbR
 mGcwn/ktt+GC/IvkgbcVni01WjvOc/MWsa+mCzzp38xtrKCPVsJKBs2zakxjrmPEoly5
 4wSESx7ApniV/x9orqnTmBy63HxvP9CrSQwEyhWS0mpkEEWpcKIZ2X9Kl99vLuruKYpo
 Q8HWU9xP/cvr2EBSZCnacbWsDa8VuNrqvliEVRVD/1BzqJNXTLpIX7MCpYtmnfhCSqko
 95HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDqQ1zUFMtHdEQX/XnB1xFyEhicaRQXlC/XVGrEZwa8=;
 b=mPU8hESa6Y0dwzSNbttEB5JCQCaLjagsJCn513DvJg7f60bKD9Z+JpIsx5TYT1LM3s
 W65lolIxMKpLDBzMWjkwjjZmDhSGMPprcmuLQxkA/kmghAnl0/gjoVszOuuV7nbFnSAq
 /+frT+lu93JRDmevW6mX63mmKCrU6g4x4AO+TixSrOqBuOjAdqnktuOjgG1iGdLDJ7JM
 R/xK0NbnEBaEpoXMN00NCdN9+ipE5VOn39WNsPZe6gestLaqHAA6XR6BGlV0krmGwaG4
 R3fSFv1Z4TnsA2iKHL52CaoZwqixh+yj7t7Xkxgz8/TiL8RHREeEY2p9371Mgk/Ac+aT
 Z/fg==
X-Gm-Message-State: AOAM5313TpkuyP9sarzmddVQ1Eecm+znRNz2FPf9ZFMG6SUwjj5PTELf
 Rv6TY5zHC6eD7jlFyVcrBn72LMAR5wGYhEP7PsxUMg==
X-Google-Smtp-Source: ABdhPJzNAEoDdzk8im6Rre99ntzZ1ceh3FOZU/YY1017p4KAHNCXoSiYj9RA6tXJM5tmAF3CrywzIjbpBzUeroOsy8o=
X-Received: by 2002:a02:ec3:: with SMTP id 186mr3173967jae.92.1603400131365;
 Thu, 22 Oct 2020 13:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
In-Reply-To: <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 Oct 2020 02:25:19 +0530
Message-ID: <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
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

On Wed, 21 Oct 2020 at 22:52, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Wed, 21 Oct 2020 at 22:35, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Oct 21, 2020 at 9:58 AM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
> > >
> > > LTP mm mtest05 (mmstress), mtest06_3 and mallocstress01 (mallocstress) tested on
> > > x86 KASAN enabled build. But tests are getting PASS on Non KASAN builds.
> > > This regression started happening from next-20201015 nowards
> >
> > Is it repeatable enough to be bisectable?
>
> Yes. This is easily reproducible.
> I will bisect and report here.

The bad commit points to,

commit d55564cfc222326e944893eff0c4118353e349ec
x86: Make __put_user() generate an out-of-line call

I have reverted this single patch and confirmed the reported
problem is not seen anymore.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
