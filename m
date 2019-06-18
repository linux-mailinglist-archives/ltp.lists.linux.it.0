Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D501497A4
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 04:53:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04CCA3EB070
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 04:53:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D9AA3EAE38
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 04:53:54 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B3698600576
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 04:53:54 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id o19so2495372vkb.6
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 19:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYcQZ6S3x9Demj77avWy0ufmxFPTV6QDkPasg3VeanQ=;
 b=HOrcqRRMSKuJgyleluj6c0UTUBobkqOiXdDBf90ZNzzbaJfy3WBgPTOzhKDVwugT1a
 HQB7YI/l6oR8Q42e5SjC+pu44EbIMQmn0m5OGMKHFaCIlicWeYcJaPRMICNv85FPp4nS
 esLN0gxJLTEN4aP/wR2hhDu76riOQahOotBgsQgSvYyeDSBWelDec8dSblUVGGqPpgbq
 Rl+rgNMbuQyl8a7xTtw3OZnSZuEdk/G7spRzjeUgIVZhdJlaFon+0IfKHj/hNCxZN5lV
 5OeEalUVJSZomYu+zEorLsU++0AAUFWxfv0cFZsniq/FwOyTxEwV/Lu3kbrrj51f8LK9
 Xp8A==
X-Gm-Message-State: APjAAAV5xfX2OVwm7BCoeNpioBxdM5qy0Pnpwh4yG5OypgOb7KKhe7Vb
 TOJUXDLTYmBUv+9ru0dgSsdq3zTPkAAkSgHYYSyxSg==
X-Google-Smtp-Source: APXvYqzvB3XAyyUK1JIBMI/4M8tGdKOWNHtOjf/8dsI7cYVzB4IvD8z8a6Quxr5bPsuM7fImiakMLlPa0J8OsnpAMF0=
X-Received: by 2002:ac5:c2d2:: with SMTP id i18mr886893vkk.36.1560826430682;
 Mon, 17 Jun 2019 19:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190617214619.GB19347@x230>
In-Reply-To: <20190617214619.GB19347@x230>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Jun 2019 10:53:39 +0800
Message-ID: <CAEemH2fOWyn2oUdzw5QAWazwLHiXjUAVHxYzqA8A4rm72AjWwA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
	structure
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0714505287=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0714505287==
Content-Type: multipart/alternative; boundary="000000000000f51425058b9038b5"

--000000000000f51425058b9038b5
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 5:46 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > Testcases for specified arch should be limited on that only being
> supported
> > platform to run, we now create a function tst_on_arch to achieve this new
> > feature in LTP library.  All you need to run a test on the expected arch
> is
> > to set the '.arch' string in the 'struct tst_test' to choose the required
> > arch list. e.g. '.arch = "x86_64 i386"'.
>
> > Signed-off-by: Li Wang <liwang@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> LGTM. FYI there is also HOST_CPU variable (since 00ff2c348f),
> but that does not help your patch.
>
> > ---
> >  doc/test-writing-guidelines.txt | 26 ++++++++++
> >  include/tst_arch.h              | 16 ++++++
> >  include/tst_test.h              |  7 ++-
> >  lib/tst_arch.c                  | 92 +++++++++++++++++++++++++++++++++
> >  4 files changed, 140 insertions(+), 1 deletion(-)
> >  create mode 100644 include/tst_arch.h
> >  create mode 100644 lib/tst_arch.c
>
> > diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> > index f1912dc12..b4fba0190 100644
> > --- a/doc/test-writing-guidelines.txt
> > +++ b/doc/test-writing-guidelines.txt
> > @@ -1668,6 +1668,32 @@ sturct tst_test test = {
> >  };
> >
> -------------------------------------------------------------------------------
>
> > +2.2.30 Testing on specified architecture
>                      ^ maybe specific?
>

Agree.

-- 
Regards,
Li Wang

--000000000000f51425058b9038b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 5:46 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; Testcases for specified arch should be limited on that only being supp=
orted<br>
&gt; platform to run, we now create a function tst_on_arch to achieve this =
new<br>
&gt; feature in LTP library.=C2=A0 All you need to run a test on the expect=
ed arch is<br>
&gt; to set the &#39;.arch&#39; string in the &#39;struct tst_test&#39; to =
choose the required<br>
&gt; arch list. e.g. &#39;.arch =3D &quot;x86_64 i386&quot;&#39;.<br>
<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
<br>
LGTM. FYI there is also HOST_CPU variable (since 00ff2c348f),<br>
but that does not help your patch.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 doc/test-writing-guidelines.txt | 26 ++++++++++<br>
&gt;=C2=A0 include/tst_arch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 ++++++<br>
&gt;=C2=A0 include/tst_test.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 ++-<br>
&gt;=C2=A0 lib/tst_arch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 92 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 140 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 include/tst_arch.h<br>
&gt;=C2=A0 create mode 100644 lib/tst_arch.c<br>
<br>
&gt; diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidel=
ines.txt<br>
&gt; index f1912dc12..b4fba0190 100644<br>
&gt; --- a/doc/test-writing-guidelines.txt<br>
&gt; +++ b/doc/test-writing-guidelines.txt<br>
&gt; @@ -1668,6 +1668,32 @@ sturct tst_test test =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 ----------------------------------------------------------------=
---------------<br>
<br>
&gt; +2.2.30 Testing on specified architecture<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^ maybe specific?<br></blockquote><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Agree.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--000000000000f51425058b9038b5--

--===============0714505287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0714505287==--
