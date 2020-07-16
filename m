Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E7221AC2
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 05:20:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D90E3C2AB0
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 05:20:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C97A83C22AD
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 05:20:10 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9FECD20005D
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 05:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594869607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=miIjFzbp8kHQEKsHlMq4HRsuAlfs4TZ3GHFxfQMpUds=;
 b=K3NQJIaYZl+cKwdbWugp1fOli0GUKiLyyAo/+E7zqRZqbjCTIrkwDRwLjQUxdPXH7Bmam8
 r1RQBJVEgZOE0HUr/buWe4tvrky7A1Fowkxe0xU5UOGbFCtx6e9/MbOGEijRcVGmW/+/VW
 /M1/s4KMDss4DA4I+sLJ+rghy1BL2uw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-BuT_er1LO6KmcRKmkzJTuw-1; Wed, 15 Jul 2020 23:20:04 -0400
X-MC-Unique: BuT_er1LO6KmcRKmkzJTuw-1
Received: by mail-lf1-f70.google.com with SMTP id m24so2173932lfh.2
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 20:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=miIjFzbp8kHQEKsHlMq4HRsuAlfs4TZ3GHFxfQMpUds=;
 b=fCnWshh1owNFzuZZyTCOIaxhDtoUSSxtMvvbxLxKh0jeGYrCaUeak/z7wA33Z8nO1X
 V4hs8RIN8zvIkS4rD1JS1NWDBFBG2oiWhnZJ6ZKq4v2N79uoePRUnChzJS7Q7iXxgePk
 tEDqnJhm1/gBVQlRW3zqw3D3p50TBjBJBq/BQZeXZdCfAHESQpv7ffFufbWr5WRwZEN1
 p5TmJunSJ+yshIx3yd68ZU0gDEmpYAMOc22y6PZskxqAWOoM4KHc3O4s7jB9qrvH/2aX
 o2tQ+QSwaIImoMJaHXzrbsrvcnus6inUdvPfSk2Yt+Dh4cb7WXeXFLpP50hcJTeLuKF3
 s/2w==
X-Gm-Message-State: AOAM533GoqESW+x3+H0zP6UBPasgSmHc6d1bt0fFGwIgfDM0v+EFwCsy
 3ufFUmlCkofJqO/YXRVSgE5UMvx9pPwMvQl6KEQoOUsOhjTIYt074VAyHwllRBw77T9XpD5It6s
 kw1eKOKjzCU32W7niRANDAuoSmbw=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr994806ljk.309.1594869602291;
 Wed, 15 Jul 2020 20:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0CIi8WOfG0K/eFIews1XspYZiRTDuSVTiqsrYvkxmwphAPCj8m0bC8qQKfFwyblvQGuFmY7lHTSic0QbGSLk=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr994798ljk.309.1594869602027;
 Wed, 15 Jul 2020 20:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200709085237.10158-1-liwang@redhat.com>
 <20200715092923.GC7741@yuki.lan>
In-Reply-To: <20200715092923.GC7741@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 16 Jul 2020 11:19:49 +0800
Message-ID: <CAEemH2edLfM9icD8o=ZJJ2GvkKvmBwH0hRXFb25E8390tuCNVA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] iopl: convert to new API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2071574603=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2071574603==
Content-Type: multipart/alternative; boundary="00000000000017a72105aa86845a"

--00000000000017a72105aa86845a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 15, 2020 at 5:29 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > +     /*
> > +      * Test the system call for possible privelege levels.
> > +      * As the privelge level for a normal process is 0,
> > +      * start by setting/changing the level to 0.
> > +      */
>
> This comment should be moved to the test description at the start of the
> test, right?
>

Agree, let's move it up.

> -#else /* __i386__ */
> > -
> > -#include "test.h"
> > -
> > -int TST_TOTAL = 0;
> > -
> > -int main(void)
> > -{
> > -     tst_resm(TPASS,
> > -              "LSB v1.3 does not specify iopl() for this
> architecture.");
> > -     tst_exit();
> > -}
> > +static struct tst_test test = {
> > +     .test_all = verify_iopl,
> > +     .needs_root = 1,
> > +     .cleanup = cleanup,
> > +};
> >
> > -#endif /* __i386__ */
> > +#else /* __i386__, __x86_64__*/
> > +TST_TEST_TCONF("LSB v1.3 does not specify iopl() for this architecture.
> (only for i386 or x86_64)");
> > +#endif /* __i386_, __x86_64__*/
> > diff --git a/testcases/kernel/syscalls/iopl/iopl02.c
> b/testcases/kernel/syscalls/iopl/iopl02.c
> > index 35d239268..747a1ca56 100644
> > --- a/testcases/kernel/syscalls/iopl/iopl02.c
> > +++ b/testcases/kernel/syscalls/iopl/iopl02.c
> > @@ -1,221 +1,82 @@
> > ...
> > +
> > +#if defined __i386__ || defined(__x86_64__)
> >
> >  #define INVALID_LEVEL 4              /* Invalid privilege level */
> >  #define EXP_RET_VAL -1
>
> Do we need to have macros for these? I doubt so...
>

Yes, we can delete the macros.


> +     if (i == 1) {
> > +             /* setup Non super-user for second test */
> > +             struct passwd *pw;
> > +             pw = SAFE_GETPWNAM("nobody");
>
> This should be put into the test setup, also the comment is useless.
>

Good point, it doesn't matter to run all the tests under non-super-user.


> > +             if (seteuid(pw->pw_uid) == -1) {
> > +                     tst_res(TWARN, "Failed to set effective"
> > +                                     "uid to %d", pw->pw_uid);
> > +                     return;
> >               }
> >       }
> >
> > -     /* cleanup and exit */
> > -     cleanup();
> > -
> > -     tst_exit();
> > -
> > -}
> > -
> > -/* setup1() - set up non-super user for second test case */
> > -int setup1(void)
> > -{
> > -     /* switch to "nobody" user */
> > -     if (seteuid(ltpuser->pw_uid) == -1) {
> > -             tst_resm(TWARN, "Failed to set effective"
> > -                      "uid to %d", ltpuser->pw_uid);
> > -             return 1;
> > +     TEST(iopl(tcases[i].level));
> > +
> > +     if ((TST_RET == EXP_RET_VAL) && (TST_ERR == tcases[i].exp_errno)) {
> > +             tst_res(TPASS, "Expected failure for %s, "
> > +                             "errno: %d", tcases[i].desc,
> > +                             TST_ERR);
>
> Please use TTERRNO to print TST_ERR. Also the tst_res() prints TPASS so
> we can omit the "Expected failure" as well and print it with something
> as:
>
>         tst_res(TPASS | TTERRNO, "%s", tcases[i].desc);
>
> > +     } else {
> > +             tst_res(TFAIL, "Unexpected results for %s ; "
> > +                             "returned %ld (expected %d), errno %d "
> > +                             "(expected errno  %d)",
> > +                             tcases[i].desc,
> > +                             TST_RET, EXP_RET_VAL,
> > +                             TST_ERR, tcases[i].exp_errno);
>
> Here as well, the TST_ERR should be printed with TTERRNO and the
> exp_errno should be printed with tst_strerrno(). We can do this with
> somethign as:
>
>         tst_res(TFAIL | TTERRNO,
>                 "%s returned %ld expected -1, expected %s got ",
>                 tcases[i].desc, tst_strerrno(tcases[i].exp_errno));
>

Quite good suggestions. I missed that TTERRNO.

-- 
Regards,
Li Wang

--00000000000017a72105aa86845a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 15, 2020 at 5:29 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Test the system call for possible privelege le=
vels.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * As the privelge level for a normal process is =
0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * start by setting/changing the level to 0.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
This comment should be moved to the test description at the start of the<br=
>
test, right?<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Agree, let&#39;s move it up.</div></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; -#else /* __i386__ */<br>
&gt; -<br>
&gt; -#include &quot;test.h&quot;<br>
&gt; -<br>
&gt; -int TST_TOTAL =3D 0;<br>
&gt; -<br>
&gt; -int main(void)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tst_resm(TPASS,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;LSB v1.3 does =
not specify iopl() for this architecture.&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tst_exit();<br>
&gt; -}<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_all =3D verify_iopl,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; +};<br>
&gt;=C2=A0 <br>
&gt; -#endif /* __i386__ */<br>
&gt; +#else /* __i386__, __x86_64__*/<br>
&gt; +TST_TEST_TCONF(&quot;LSB v1.3 does not specify iopl() for this archit=
ecture. (only for i386 or x86_64)&quot;);<br>
&gt; +#endif /* __i386_, __x86_64__*/<br>
&gt; diff --git a/testcases/kernel/syscalls/iopl/iopl02.c b/testcases/kerne=
l/syscalls/iopl/iopl02.c<br>
&gt; index 35d239268..747a1ca56 100644<br>
&gt; --- a/testcases/kernel/syscalls/iopl/iopl02.c<br>
&gt; +++ b/testcases/kernel/syscalls/iopl/iopl02.c<br>
&gt; @@ -1,221 +1,82 @@<br>
&gt; <span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +<br>
&gt; +#if defined __i386__ || defined(__x86_64__)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define INVALID_LEVEL 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* Invalid privilege level */<br>
&gt;=C2=A0 #define EXP_RET_VAL -1<br>
<br>
Do we need to have macros for these? I doubt so...<br></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, we =
can delete the macros.</div><br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0if (i =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup Non super-us=
er for second test */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct passwd *pw;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw =3D SAFE_GETPWNAM(=
&quot;nobody&quot;);<br>
<br>
This should be put into the test setup, also the comment is useless.<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Good point, it doesn&#39;t matter=C2=A0to run all the tests under=
 non-super-user.</div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid(pw-&gt;pw=
_uid) =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TWARN, &quot;Failed to set effective&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;uid to=
 %d&quot;, pw-&gt;pw_uid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* cleanup and exit */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cleanup();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tst_exit();<br>
&gt; -<br>
&gt; -}<br>
&gt; -<br>
&gt; -/* setup1() - set up non-super user for second test case */<br>
&gt; -int setup1(void)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* switch to &quot;nobody&quot; user */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (seteuid(ltpuser-&gt;pw_uid) =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TWARN, &quot=
;Failed to set effective&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;uid to %d&quot;, ltpuser-&gt;pw_uid);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST(iopl(tcases[i].level));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((TST_RET =3D=3D EXP_RET_VAL) &amp;&amp; (TST_=
ERR =3D=3D tcases[i].exp_errno)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;=
Expected failure for %s, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errno: %d&quot;, tcases[i].desc,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_ERR);<br>
<br>
Please use TTERRNO to print TST_ERR. Also the tst_res() prints TPASS so<br>
we can omit the &quot;Expected failure&quot; as well and print it with some=
thing<br>
as:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS | TTERRNO, &quot;%s&quot;, tcases=
[i].desc);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
Unexpected results for %s ; &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;returned %ld (expected %d), errno =
%d &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(expected errno=C2=A0 %d)&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcases[i].desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RET, EXP_RET_VAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_ERR, tcases[i].exp_errno);<br>
<br>
Here as well, the TST_ERR should be printed with TTERRNO and the<br>
exp_errno should be printed with tst_strerrno(). We can do this with<br>
somethign as:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s returned %=
ld expected -1, expected %s got &quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcases[i].desc, tst=
_strerrno(tcases[i].exp_errno));<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Quite good suggestions. I =
missed that TTERRNO.</div></div></div><div><br></div>-- <br><div dir=3D"ltr=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--00000000000017a72105aa86845a--


--===============2071574603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2071574603==--

