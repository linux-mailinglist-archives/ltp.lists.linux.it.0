Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABD2AD231
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 10:17:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93C4B3C2F67
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 10:17:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2657D3C2F43
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 10:17:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E9F80600428
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 10:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604999825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xslqd2Z1Lbvlfn7AEjzseUjq8FwS+U4PP2EjVfe2ruw=;
 b=b/8QfZ8tYhum6NvH6NhGb7E8v9xVbzMl5N6yc/S0nlcYa8vZdy3WjzEMPKtV60GsfXTuUO
 HKOIqj61lg02+2XdelDZbrC/TT3UCDEVwr+du4oNP0q2tUo+iUDP0cCiXguz1vH6GxMUwe
 Ys5JR4q3fJD2fDKG8H7pWUFglRhBFUg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-YvR1XkwMOTGfKIEM4KqLkg-1; Tue, 10 Nov 2020 04:17:02 -0500
X-MC-Unique: YvR1XkwMOTGfKIEM4KqLkg-1
Received: by mail-yb1-f197.google.com with SMTP id g129so2568802ybf.20
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 01:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xslqd2Z1Lbvlfn7AEjzseUjq8FwS+U4PP2EjVfe2ruw=;
 b=TbBjDvzXQ2caqFcI9IP05RvBRtBwlwBcmkQUPx0BQL3uLmC26NHq5+niW8i1XgOBfA
 9plr6a6HnHnDe7pVFos8fnpsrml/SWjoAIZNTj3x0v1Rac2l6Y8PtOUDi/kqqEWeqU3C
 /m/arC7Be7gq7j0dXHM5iKr5TedYhi8857hDeD1slXjx4QA9c8jJr6Qyuea00xl9lSx5
 E/IEu7ZqvFSRO8d/5Fc2LxYdkMwP4WgdAe9sk+/UBdFzJmJT3AoaaDUlh1Agecfod0jg
 DBpMj2LMBEghHqbQphpYLsSmiXJ/uwFXJo8nua2ZWe3p3JqZlptJHykXffzhbY7x11SQ
 X5RA==
X-Gm-Message-State: AOAM530sCB2hFrBfTXyAinmHclMa4wVIW8pWdgp0aamwGwJVM2bDMCWi
 a3G4i2LZa1ZFLS9z8p5F0UMBvvzcArFIpQ2exA7itUKbUJQotYMHLKqzCsERuxe0l5HQ6Z1lsiL
 UKtCSGmP0KRtHtG7E4M3T0gKDN7U=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr23711499ybj.366.1604999821870; 
 Tue, 10 Nov 2020 01:17:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGabumVA/2VxUxBKJdo02GjFeSeMYiePgf8/GCSqv7S3F/jQvxGdnXLTQ5p1mRzrJciM5LijQUgRGcyvl5kMM=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr23711477ybj.366.1604999821660; 
 Tue, 10 Nov 2020 01:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201109164605.25965-2-mdoucha@suse.cz>
 <CAEemH2egUaO=ebaRFOZDNCZYi1QKZN168xE=_J_U_yoBH5PyLQ@mail.gmail.com>
 <20201110085225.GA3767@yuki.lan>
In-Reply-To: <20201110085225.GA3767@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 10 Nov 2020 17:16:50 +0800
Message-ID: <CAEemH2d1iHcn40zju+j+8gO+iSgFaNOKGx6CjeHhZx7fAzju8w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/iopl,
 ioperm: Check for SecureBoot lockdown
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
Content-Type: multipart/mixed; boundary="===============0793752506=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0793752506==
Content-Type: multipart/alternative; boundary="0000000000003c315005b3bd24f1"

--0000000000003c315005b3bd24f1
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 10, 2020 at 4:51 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > ...
> > >
> > >  include $(top_srcdir)/include/mk/testcases.mk
> > >
> > > +CFLAGS                 += $(EFIVAR_CFLAGS)
> > > +LDLIBS                 += $(EFIVAR_LIBS)
> > >
> >
> > Where can we get the value of these two variables? Shouldn't we
> > add AC_SUBST() in the m4 file?
>
> These are exported by the PKG_CHECK_MODULES() pkgconfig autotools macro.
>

Good to know this.


>
> > > --- a/testcases/kernel/syscalls/ioperm/ioperm02.c
> > > +++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
> > > @@ -22,6 +22,7 @@
> > >  #include <pwd.h>
> > >  #include "tst_test.h"
> > >  #include "tst_safe_macros.h"
> > > +#include "tst_secureboot.h"
> > >
> > >  #if defined __i386__ || defined(__x86_64__)
> > >  #include <sys/io.h>
> > > @@ -45,6 +46,10 @@ static struct tcase_t {
> > >
> > >  static void setup(void)
> > >  {
> > > +       /* ioperm() is restricted under kernel lockdown. */
> > > +       if (tst_lockdown_enabled() || tst_secureboot_enabled() > 0)
> > > +               tst_brk(TCONF, "Kernel is locked down, skip this
> test");
> > >
> >
> > The ioperm02 is an error test for ioperm(), it doesn't matter without the
> > lockdown/secure-boot status. Better to remove this from setup().
> >
> > iopl02 as well.
>
> Actually I think that this is correct, since there is no imposed order
> on the checks in kernel, so we may not get the errors we expect to get.
>
>
> What we are actually missing are tests that iopl() and ioperm() does
> fail with EPERM when either of lockdown or secureboot are enabled.
>

I remember they(ioperm02, iopl02) works well with secure-boot
enabled/disabled.
(I did that test when reviewing Erico's tst_lockdown.c patch)

Okay, but I agree that it's safer to add this check because it may change
in the newer kernel someday.

Feel free to add:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000003c315005b3bd24f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 10, 2020 at 4:51 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; ...<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 include $(top_srcdir)/include/mk/<a href=3D"http://testcase=
s.mk" rel=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt; &gt;<br>
&gt; &gt; +CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D $(EFIVAR_CFLAGS)<br>
&gt; &gt; +LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D $(EFIVAR_LIBS)<br>
&gt; &gt;<br>
&gt; <br>
&gt; Where can we get the value of these two variables? Shouldn&#39;t we<br=
>
&gt; add AC_SUBST() in the m4 file?<br>
<br>
These are exported by the PKG_CHECK_MODULES() pkgconfig autotools macro.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Good to know this.</div></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; --- a/testcases/kernel/syscalls/ioperm/ioperm02.c<br>
&gt; &gt; +++ b/testcases/kernel/syscalls/ioperm/ioperm02.c<br>
&gt; &gt; @@ -22,6 +22,7 @@<br>
&gt; &gt;=C2=A0 #include &lt;pwd.h&gt;<br>
&gt; &gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
&gt; &gt;=C2=A0 #include &quot;tst_safe_macros.h&quot;<br>
&gt; &gt; +#include &quot;tst_secureboot.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #if defined __i386__ || defined(__x86_64__)<br>
&gt; &gt;=C2=A0 #include &lt;sys/io.h&gt;<br>
&gt; &gt; @@ -45,6 +46,10 @@ static struct tcase_t {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static void setup(void)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ioperm() is restricted under kerne=
l lockdown. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_lockdown_enabled() || tst_sec=
ureboot_enabled() &gt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(T=
CONF, &quot;Kernel is locked down, skip this test&quot;);<br>
&gt; &gt;<br>
&gt; <br>
&gt; The ioperm02 is an error test for ioperm(), it doesn&#39;t matter with=
out the<br>
&gt; lockdown/secure-boot status. Better to remove this from setup().<br>
&gt; <br>
&gt; iopl02 as well.<br>
<br>
Actually I think that this is correct, since there is no imposed order<br>
on the checks in kernel, so we may not get the errors we expect to get.<br>
<br>
<br>
What we are actually missing are tests that iopl() and ioperm() does<br>
fail with EPERM when either of lockdown or secureboot are enabled.<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">I remember they(ioperm02, iopl02) works=C2=A0well with secure-boot =
enabled/disabled.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">(I did that test when reviewing Erico&#39;s tst_lockdown.c patch)=C2=A0<=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Okay, but I agree tha=
t it&#39;s safer to add this check because it may change in the newer kerne=
l someday.</div></div></div><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Feel free to add:</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:l=
iwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div><br></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,=
<br></div><div>Li Wang<br></div></div></div></div>

--0000000000003c315005b3bd24f1--


--===============0793752506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0793752506==--

