Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 977671BDF51
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:43:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50D633C5ECB
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:43:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B85983C2822
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:43:14 +0200 (CEST)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F03451001893
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:43:13 +0200 (CEST)
Received: by mail-qk1-x741.google.com with SMTP id s63so1951588qke.4
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBkljX9ocCvU6DCy6UBMMSnA1lVr9TGI/E/Fo2B+jHc=;
 b=hGZgWaJOGhXQh+28wy0edywIzaJ2j4uNrNCLeJjoMz4rNuYQaxuJ4SqPj98Q7JqZJW
 kziousqOoN5HBQxPfBZDUtzOn15eBKFpPzoaslsLrlsBjuK+y6QunAmkcvBd3gUuhakj
 HS115WocvS/Oct0z+yQA7Wn6qomzVVlaL8TMTaN8QuICcNsdtuCbSTQp6etcMIqaIRk+
 C51lsPqxcXIRMf2mFnFoVolQ8cZSWjGolrg3M1ylixklVrET0zhYT80nfzr3PBKna2sL
 16g0k9eCCsuXsyVbXAy+621iNXVHQj6itfOKLhnXTabFiI7DH3FmAgwvjVjEvTFHD6vJ
 6p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBkljX9ocCvU6DCy6UBMMSnA1lVr9TGI/E/Fo2B+jHc=;
 b=TDPJDB+B5oSeP4VFgq78Zg8dtcKVZ+xKkPTF2yJeeiORjTVt9A/r196HsPk5iHZ7xW
 lTUuPHw7gJ8SfZ+c0meRy5dKQD7eIVLdSNtgCgqxxu1N7wJxAixCtlSPTDtPIdcxP7Nf
 wNhUVPqlpKxRxwxVqraSFoPXZd7v8GK3PFjUAZw+cUnHDEzKaX3FrKwGJ0mo7Y4E9oic
 wT2mOStOuk2u3hJLrMaJ6gMNgZMPzTizIG6ZPhE/5ZOuNROAYJMnc2oxBl3sseaMSxDq
 qXD29aeCazArF/Q4nBNsNG9pa/iM6MMza6W3Jj2xVaWJWwJT14emfD9hDxVigMtZwXke
 tCRg==
X-Gm-Message-State: AGi0PuYvMoXFP3rWAtmGwXzo1Lp8+4/XP4r4a/rFsAqlWnSAJ9n5mFNL
 jqPmGEkJK7FhiyrZRbbEeGetDyD7RqqjUWEBYGo=
X-Google-Smtp-Source: APiQypLDBgFzh2m2nhO08Doj9Oc2pF489J9IY1coUj5Y4VGiwjIWfQ5PzrChIo9nW+mom7+bERg4bqzZnZFE/5ld2VI=
X-Received: by 2002:a37:7143:: with SMTP id m64mr33835617qkc.215.1588167792703; 
 Wed, 29 Apr 2020 06:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200429033511.1848449-1-raj.khem@gmail.com>
 <20200429131624.GB10236@dell5510>
In-Reply-To: <20200429131624.GB10236@dell5510>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Apr 2020 06:42:46 -0700
Message-ID: <CAMKF1srKzdh=VnoxDyumQHo25-ZWREcRPkyJ+V5tW4vZdiMuZA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Define __NR_futex to be __NR_futex_time64 on
 riscv32
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

On Wed, Apr 29, 2020 at 6:16 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Khem,
>
> > RISCV glibc has decided to use 64bit time_t from get go unlike
> > other 32bit architecture therefore aliasing __NR_futex to
> > __NR_futex_time64 helps avoid the below errors on rv32
>
> > tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'
>
> Thanks for your fix.
>
> BTW, out of curiosity, is Risc-v 32 bit merged into glibc master?

Not yet but its almost finalised and should be merged before 2.32 hopefully

>
> I found a patch from Alistair Francis from January, which implements what you claim:
> https://sourceware.org/legacy-ml/libc-alpha/2020-01/msg00205.html
> ...
> +/* RV32 and RV64 both use 64-bit time_t */
> +#define __TIMESIZE     64
> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> ...
>

right

> (part of https://patches-gcc.linaro.org/project/glibc/list/?series=21554
> patchset) but it hasn't been merged yet to master.

Its being reviewed

>
> + There is older patchset from Zong Li, not yet merged.
> https://patches-gcc.linaro.org/cover/12952/
>

above patches are newer versions of this one.

> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  lib/tst_checkpoint.c                        | 4 ++++
> >  testcases/kernel/syscalls/clone/clone08.c   | 4 ++++
> >  testcases/kernel/syscalls/futex/futextest.h | 4 ++++
> >  3 files changed, 12 insertions(+)
>
> > diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
> > index 5e5b11496c..0388e9db2f 100644
> > --- a/lib/tst_checkpoint.c
> > +++ b/lib/tst_checkpoint.c
> > @@ -21,6 +21,10 @@
> >   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> >   */
>
> > +#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
> > +# define __NR_futex __NR_futex_time64
> > +#endif
>
> I guess this should go to include/lapi/futex.h, so we don't repeat ourselves.
> (and clone08.c needs to include it, others already do).
>

OK makes sense, will send v2 ?

> ...
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
