Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CC5CA13
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 09:54:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06AA83C1D5E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 09:54:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1106D3C1D50
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 09:54:06 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 41BBA600063
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 09:54:05 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id j26so10621010vsn.10
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 00:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3mGW1nD9dp11ZeMwhO5+WGmxM4FabVrUez8IIHFkKI=;
 b=WNXvAjbhJbxDj98ti+QXe/xKfwl2a2w22Q4HW3kfceaCy7c3NG8VWmHhhIah4pdXB0
 H4ye2hE6FFkdGld1H54DzjH74t/iXvOn93e6EiaJqdwfdSdAEKIR+Y7FJkE3hMZDdb0W
 yVGtE2BzoYOKR+zy1qoWGi5bFdXV7ucQqCWdBVrMUkrjUwte0Szl5wpK3GsTPFuGNuLR
 V3yYGFPrdrAlmTKY1xCntgPKIxQ3FjhWiDBMr8bMSkRFnnOXcTQ16jNqzKuJjwzwSgYB
 TC+W6Ur9eBpD74T2hl4AqnRlWo3S8yN+jmKDHBrdkZLqSlKAB558F6FBXd9evzGK1cxJ
 1YgA==
X-Gm-Message-State: APjAAAVD49KQUblvUDJwSTgbcR0EkEUif10YhFFgZo43sGPGGwA0W8+6
 i4c8wQJQggVKlHVULxntXch2edzkjgey1i4L2eLruw==
X-Google-Smtp-Source: APXvYqxThJZjOv5m88PNXfIO8g9x6ORP0US2FWoSTHaYB3ffwRGJU6rPYlgRCqwbRf6ZPyLoCwcY6tw4bNGS5MbsdEM=
X-Received: by 2002:a67:e24e:: with SMTP id w14mr16538452vse.124.1562054044103; 
 Tue, 02 Jul 2019 00:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190701100343.3406-1-liwang@redhat.com>
 <2137465502.31003797.1561978896804.JavaMail.zimbra@redhat.com>
In-Reply-To: <2137465502.31003797.1561978896804.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Jul 2019 15:53:53 +0800
Message-ID: <CAEemH2foarWKGGkV1z6RogH6wsWV__aH8K1cOvG56_yq2WBLyg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lib: add tst_no_corefile to avoid corefile
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
Content-Type: multipart/mixed; boundary="===============2100132350=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2100132350==
Content-Type: multipart/alternative; boundary="0000000000006b5022058cae0cbe"

--0000000000006b5022058cae0cbe
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 1, 2019 at 7:01 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Jan Stancek <jstancek@redhat.com>
> > ---
> >  include/tst_safe_macros.h                        | 16 ++++++++++++++++
> >  testcases/kernel/security/umip/umip_basic_test.c |  2 ++
> >  testcases/kernel/syscalls/ipc/shmat/shmat01.c    | 16 +++-------------
> >  3 files changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> > index 53a888c80..110e2984f 100644
> > --- a/include/tst_safe_macros.h
> > +++ b/include/tst_safe_macros.h
> > @@ -394,6 +394,22 @@ static inline int safe_setrlimit(const char *file,
> const
> > int lineno,
> >  #define SAFE_SETRLIMIT(resource, rlim) \
> >       safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
> >
> > +/*
> > + * Crash is expected, avoid dumping corefile.
> > + * 1 is a special value, that disables core-to-pipe.
> > + * At the same time it is small enough value for
> > + * core-to-file, so it skips creating cores as well.
> > + */
> > +static inline void tst_no_corefile(void)
> > +{
> > +       struct rlimit r;
> > +
> > +       r.rlim_cur = 1;
> > +       r.rlim_max = 1;
> > +       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
> > +       tst_res(TINFO, "Avoid dumping corefile in following test");
>
> I'm fine with helper func. Maybe I'd print also current pid.
> It could be little spammy if there are many children, but we could
> address that later (if needed) with a parameter to control verbosity.
>

To add a parameter (int verbose) sounds good to me.

Btw, should we add some note/comment in the
document(test-writing-guidelines.txt)? I take a rough look but not sure
which line is the best position for that.

-- 
Regards,
Li Wang

--0000000000006b5022058cae0cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 1, 2019 at 7:01 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; Cc: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_=
blank">jstancek@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/tst_safe_macros.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++++++<br>
&gt;=C2=A0 testcases/kernel/security/umip/umip_basic_test.c |=C2=A0 2 ++<br=
>
&gt;=C2=A0 testcases/kernel/syscalls/ipc/shmat/shmat01.c=C2=A0 =C2=A0 | 16 =
+++-------------<br>
&gt;=C2=A0 3 files changed, 21 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h<br>
&gt; index 53a888c80..110e2984f 100644<br>
&gt; --- a/include/tst_safe_macros.h<br>
&gt; +++ b/include/tst_safe_macros.h<br>
&gt; @@ -394,6 +394,22 @@ static inline int safe_setrlimit(const char *file=
, const<br>
&gt; int lineno,<br>
&gt;=C2=A0 #define SAFE_SETRLIMIT(resource, rlim) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_setrlimit(__FILE__, __LINE__, (resource=
), (rlim))<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Crash is expected, avoid dumping corefile.<br>
&gt; + * 1 is a special value, that disables core-to-pipe.<br>
&gt; + * At the same time it is small enough value for<br>
&gt; + * core-to-file, so it skips creating cores as well.<br>
&gt; + */<br>
&gt; +static inline void tst_no_corefile(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rlimit r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_cur =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_max =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETRLIMIT(RLIMIT_CORE, &amp;r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Avoid dumping corefil=
e in following test&quot;);<br>
<br>
I&#39;m fine with helper func. Maybe I&#39;d print also current pid.<br>
It could be little spammy if there are many children, but we could<br>
address that later (if needed) with a parameter to control verbosity.<br></=
blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">To add a parameter (int verbose) sounds good to me.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Btw, should we add some note/comment in =
the document(test-writing-guidelines.txt)? I take a rough look but not sure=
 which line is the best position for that.</div></div><div><br></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<=
br></div><div>Li Wang<br></div></div></div></div>

--0000000000006b5022058cae0cbe--

--===============2100132350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2100132350==--
