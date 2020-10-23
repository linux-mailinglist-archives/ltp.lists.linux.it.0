Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9F2974C2
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:40:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 961F63C5667
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 18:40:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DE4E23C317B
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:40:23 +0200 (CEST)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 45443600F9C
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 18:40:23 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id k3so3226768ejj.10
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
 b=bKJlp5Zi29qle5D9opf4NXlbOWJhqSLbkPTTzs3cyEfB6yY5yL2nVp+B2qxgDBuenW
 Ld6FBX1RcXCS8NhhbFgQYSvjxx2DmHG9Bt0hUX7JvJOKxhXXzfzBAxggPWaZ91DMIf/e
 dpBAABcXoHgqg2SosGBxhJHT4bBdoCmPY82fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
 b=d5OvM7TWARgLmVekTyuPnNEz7fwmdcOZhq2W+YRJok0HLFG7QgSj/bN1UB0ZpKQH3Q
 IvidR6ufIkiF/KtuItKxYe0e+vgVO+F6xTiVZuI1BHO0LqghG1YyUhE26ka1kfnIDXZH
 +nYBKa2KvZMEyqSk+n44s1UZ7cgoCYrZKNcSE4D1FCdvlM8ckSzTQIbxB70axmjecUhX
 0Pq9MK7EnRR2pyJfv07a3aFm0StZJrnB5IU+1sc+iiTCRKn0DvegOOfqsi6ArJ4wWjH5
 woZ9YY1cKcv9JyqZCsbsqfd3Y5hW4NObo8CanYft8SOqCIyWrqUiCshKmm1mvIq+wdrX
 HV8w==
X-Gm-Message-State: AOAM530z3GFiSS1fp5SAxpxlHjGaFgZuuc3FfNcYtQ9ikUYxYiM47ohT
 JGN6dHmdZ9qqcisaDz+j3zO7mNDDPjfNxQ==
X-Google-Smtp-Source: ABdhPJwS8B87ZktAvl+kwrMAFDzzyAubTwI6Hruj8zE6nI/EheAA4lGiWVr1plEWyyuYosxOcsucAQ==
X-Received: by 2002:a17:906:da03:: with SMTP id
 fi3mr1026366ejb.321.1603471222372; 
 Fri, 23 Oct 2020 09:40:22 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id e22sm1002404edr.41.2020.10.23.09.40.21
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 09:40:22 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id n18so2729595wrs.5
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:40:21 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr971141lff.105.1603470790607;
 Fri, 23 Oct 2020 09:33:10 -0700 (PDT)
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
In-Reply-To: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2020 09:32:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: multipart/mixed; boundary="000000000000e2112705b259227d"
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--000000000000e2112705b259227d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2020 at 8:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> >
> > That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> > could break something else), but the obvious first step of rearranging
> > so that the ptr argument is evaluated before the assignment to __val_pu
>
> Ack. We could do that.
>
> I'm more inclined to just bite the bullet and go back to the ugly
> conditional on the size that I had hoped to avoid, but if that turns
> out too ugly, mind signing off on your patch and I'll have that as a
> fallback?

Actually, looking at that code, and the fact that we've used the
"register asm()" format forever for the get_user() side, I think your
approach is the right one.

I'd rename the internal ptr variable to "__ptr_pu", and make sure the
assignments happen just before the asm call (with the __val_pu
assignment being the final thing).

lso, it needs to be

        void __user *__ptr_pu;

instead of

        __typeof__(ptr) __ptr = (ptr);

because "ptr" may actually be an array, and we need to have the usual
C "array to pointer" conversions happen, rather than try to make
__ptr_pu be an array too.

So the patch would become something like the appended instead, but I'd
still like your sign-off (and I'd put you as author of the fix).

Narest, can you confirm that this patch fixes the issue for you?

                  Linus

--000000000000e2112705b259227d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kgmh3alt0>
X-Attachment-Id: f_kgmh3alt0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRl
eCBmMTM2NTk1MjMxMDguLmQwMDZhZjkxNWQ0YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAt
MjExLDEzICsyMTEsMTUgQEAgZXh0ZXJuIHZvaWQgX19wdXRfdXNlcl9ub2NoZWNrXzgodm9pZCk7
CiAjZGVmaW5lIGRvX3B1dF91c2VyX2NhbGwoZm4seCxwdHIpCQkJCQlcCiAoewkJCQkJCQkJCVwK
IAlpbnQgX19yZXRfcHU7CQkJCQkJCVwKKwl2b2lkIF9fdXNlciAqX19wdHJfcHU7CQkJCQkJXAog
CXJlZ2lzdGVyIF9fdHlwZW9mX18oKihwdHIpKSBfX3ZhbF9wdSBhc20oIiUiX0FTTV9BWCk7CQlc
CiAJX19jaGtfdXNlcl9wdHIocHRyKTsJCQkJCQlcCisJX19wdHJfcHUgPSAocHRyKTsJCQkJCQlc
CiAJX192YWxfcHUgPSAoeCk7CQkJCQkJCVwKIAlhc20gdm9sYXRpbGUoImNhbGwgX18iICNmbiAi
XyVQW3NpemVdIgkJCQlcCiAJCSAgICAgOiAiPWMiIChfX3JldF9wdSksCQkJCQlcCiAJCQlBU01f
Q0FMTF9DT05TVFJBSU5UCQkJCVwKLQkJICAgICA6ICIwIiAocHRyKSwJCQkJCVwKKwkJICAgICA6
ICIwIiAoX19wdHJfcHUpLAkJCQkJXAogCQkgICAgICAgInIiIChfX3ZhbF9wdSksCQkJCQlcCiAJ
CSAgICAgICBbc2l6ZV0gImkiIChzaXplb2YoKihwdHIpKSkJCQlcCiAJCSAgICAgOiJlYngiKTsJ
CQkJCQlcCg==
--000000000000e2112705b259227d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--000000000000e2112705b259227d--
