Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDD5FFBA
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jul 2019 05:26:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 811093C1C7A
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jul 2019 05:26:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3EF4C3C0732
 for <ltp@lists.linux.it>; Fri,  5 Jul 2019 05:26:44 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7437D200B0D
 for <ltp@lists.linux.it>; Fri,  5 Jul 2019 05:26:42 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id h28so2986305vsl.12
 for <ltp@lists.linux.it>; Thu, 04 Jul 2019 20:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJYj6sPn4wPQSk7CfaM2XcT8x4DsUa4dmvccVO4wdNU=;
 b=RfdrML1bgllszRz9Yp5nvQGzbJJ56YKoojF3sT7zD+0eSuAhakArEBvNgihMd6bINz
 W4ldi6GHNTE/hPSg3QiR7TOzacQ0PYhSOYwiojTpnj2F1tigCj1JFUXMPDjOFt8cFuAD
 6xJebiAihN4Iz3JvXxsCTh+R+WOX/bF1DyI5+KK7YlcgYfRrUeSypL2qv5X1ui43m0hI
 7alF1RG+kOk2BUzLBo91gAuUcBGD3CS7lkvKGEt512/VRrgAqwpT8SdLhsVcsav6XZO+
 vQUCvPxNzNhzbQ6wxV28UPFvbidzYo3+v05W+JRDsK+gdQOJHPY7DAJh8lbF2hjB+tg8
 EiIg==
X-Gm-Message-State: APjAAAWJ3PBcxxohmrXUAAnUpAUfab9jTPic+kqZ89UtGhMnEd+T3ko3
 WJVeehb6kuL67hzWgFOBE+12Hqmx1FoSrH0ki7nW4Q==
X-Google-Smtp-Source: APXvYqxIF9LF6nLmzbkzJmdC6q7WiT7picLuj6duS+XdiT8YOFQP+WGjM3JqpkNJjM2e63DDxbpf8sRw5ROvRhstjBA=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr812939vsq.179.1562297201343;
 Thu, 04 Jul 2019 20:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190703072417.24091-1-liwang@redhat.com>
 <2030850327.31633394.1562227719657.JavaMail.zimbra@redhat.com>
In-Reply-To: <2030850327.31633394.1562227719657.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Jul 2019 11:26:29 +0800
Message-ID: <CAEemH2dca-3dTXZyng+i060OnC4LoJjy=z9RLzCMUFs9=2K1qA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: add tst_no_corefile to avoid corefile
 dumping
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
Content-Type: multipart/mixed; boundary="===============1398309631=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1398309631==
Content-Type: multipart/alternative; boundary="000000000000b85a5b058ce6a9fa"

--000000000000b85a5b058ce6a9fa
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 4, 2019 at 4:08 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> I'd rephrase it to:
>
>    If a crash (e.g. triggered by signal SIGSEGV) is expected in testing,
> you
>    can avoid creation of core files by calling tst_no_corefile() function.
>    This takes effect for process (and its children) which invoked it,
> unless
>    they subsequently modify RLIMIT_CORE.
>
>    Note that LTP library will reap any processes that test didn't reap
> itself,
>    and report any non-zero exit code as failure.
>

This looks better, I missed the effect to its children before.

> > +static inline void tst_no_corefile(int verbose)
> > +{
> > +       struct rlimit r;
> > +
> > +       r.rlim_cur = 1;
> > +       r.rlim_max = 1;
> > +       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
>
> SAFE_SETRLIMIT is fine if needs_root = 1. But if test runs as unprivileged
> user
> and RLIMIT_CORE is already 0, unprivileged user won't be able to increase
> it,
> so we get TBROK here.
>
You are right. The SAFE_SETRLIMIT is not good for that achievement. I will
make use of the original type and do error handle with TWARN slightly. And
then I think we probably need to move it out form tst_safe_mcro.h.

-- 
Regards,
Li Wang

--000000000000b85a5b058ce6a9fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 4, 2019 at 4:08 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I&#39;d rephrase it to:<br>
<br>
=C2=A0 =C2=A0If a crash (e.g. triggered by signal SIGSEGV) is expected in t=
esting, you<br>
=C2=A0 =C2=A0can avoid creation of core files by calling tst_no_corefile() =
function.<br>
=C2=A0 =C2=A0This takes effect for process (and its children) which invoked=
 it, unless<br>
=C2=A0 =C2=A0they subsequently modify RLIMIT_CORE.<br>
<br>
=C2=A0 =C2=A0Note that LTP library will reap any processes that test didn&#=
39;t reap itself,<br>
=C2=A0 =C2=A0and report any non-zero exit code as failure.<br></blockquote>=
<div><br></div><div class=3D"gmail_default" style=3D"font-size:small">This =
looks better, I missed the effect to its children before.</div><div class=
=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; +static inline void tst_no_corefile(int verbose)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rlimit r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_cur =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_max =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETRLIMIT(RLIMIT_CORE, &amp;r);<br>
<br>
SAFE_SETRLIMIT is fine if needs_root =3D 1. But if test runs as unprivilege=
d user<br>
and RLIMIT_CORE is already 0, unprivileged user won&#39;t be able to increa=
se it,<br>
so we get TBROK here.<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div class=3D"gmail_default" style=3D"font-size:small">You are right. =
The SAFE_SETRLIMIT=C2=A0is not good for that achievement. I will make use o=
f the original type and do error handle with TWARN slightly. And then I thi=
nk we probably need to move it out form tst_safe_mcro.h.</div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b85a5b058ce6a9fa--

--===============1398309631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1398309631==--
