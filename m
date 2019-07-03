Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0DA5DD0F
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 05:37:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FDCC3C1DA1
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 05:37:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2CA2A3C1D00
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 05:37:45 +0200 (CEST)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2CB0F6002F9
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 05:37:44 +0200 (CEST)
Received: by mail-lj1-f194.google.com with SMTP id k18so728405ljc.11
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 20:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eG6vhFgQrJcSosjFXK8IbxRQiHmmA6GSH85sUgTlY9c=;
 b=ZzUfVwxjzASN2SWD03CJs0BXEBXn3xUgOjBbe1Y6GtdrCyJ1vTCajeZcWd3p3f+YWC
 WRzOeKM0TmSXGtSjoxPtw+woBzEt0CFvrUGet1pMStwk7Ss+EGBpudy+IF1wSdyMW65O
 /OVQ4dTLEgIHvKlWMGOD3TZB/erAIkOTTQau06nfXHRJX3h6u9NMZfyU6fR8CMS/WMtC
 sy6Zv/9jUEGS/AjW9tmTEyfqDqgbzy46517wgkFfUXFtTQ6iQQCxoEctzDaFX9Sq+LyQ
 jjHaM2dsvtzzx2KN0HFK1IzC0VfQkZ4UZzQXpyMGdB04+dd//M/N4BhXo60zKe3peCMG
 AK8w==
X-Gm-Message-State: APjAAAVVJA2CBA9/KQM/lPXC77Nlw69ZMY4XweKDnSf3+zL9UHT53tJq
 9ZfVwwYVIlM8SokHklMrh/1pRpwwFqz5gi4XahspEQ==
X-Google-Smtp-Source: APXvYqzLfJDH1NKLDLR4YMAndSpxMmhPObEGb6c48S+lq2sH0MwSy7QrF3luWIQ0aT0WrJMCCVyAidgu91J91FyI6OY=
X-Received: by 2002:a2e:b0c4:: with SMTP id g4mr18400149ljl.155.1562125063499; 
 Tue, 02 Jul 2019 20:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190701100343.3406-1-liwang@redhat.com>
 <2137465502.31003797.1561978896804.JavaMail.zimbra@redhat.com>
 <CAEemH2foarWKGGkV1z6RogH6wsWV__aH8K1cOvG56_yq2WBLyg@mail.gmail.com>
 <1168887917.31303999.1562083863754.JavaMail.zimbra@redhat.com>
In-Reply-To: <1168887917.31303999.1562083863754.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 3 Jul 2019 11:37:31 +0800
Message-ID: <CAEemH2fXnn6-HtttkFHW0cGe8EeLS8vedKDdFxh4uxMx6g1yaQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1061914482=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1061914482==
Content-Type: multipart/alternative; boundary="000000000000814d55058cbe95ef"

--000000000000814d55058cbe95ef
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 12:11 AM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Mon, Jul 1, 2019 at 7:01 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > >
> > >
> > > ----- Original Message -----
> > > > Signed-off-by: Li Wang <liwang@redhat.com>
> > > > Cc: Jan Stancek <jstancek@redhat.com>
> > > > ---
> > > >  include/tst_safe_macros.h                        | 16
> ++++++++++++++++
> > > >  testcases/kernel/security/umip/umip_basic_test.c |  2 ++
> > > >  testcases/kernel/syscalls/ipc/shmat/shmat01.c    | 16
> +++-------------
> > > >  3 files changed, 21 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> > > > index 53a888c80..110e2984f 100644
> > > > --- a/include/tst_safe_macros.h
> > > > +++ b/include/tst_safe_macros.h
> > > > @@ -394,6 +394,22 @@ static inline int safe_setrlimit(const char
> *file,
> > > const
> > > > int lineno,
> > > >  #define SAFE_SETRLIMIT(resource, rlim) \
> > > >       safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
> > > >
> > > > +/*
> > > > + * Crash is expected, avoid dumping corefile.
> > > > + * 1 is a special value, that disables core-to-pipe.
> > > > + * At the same time it is small enough value for
> > > > + * core-to-file, so it skips creating cores as well.
> > > > + */
> > > > +static inline void tst_no_corefile(void)
> > > > +{
> > > > +       struct rlimit r;
> > > > +
> > > > +       r.rlim_cur = 1;
> > > > +       r.rlim_max = 1;
> > > > +       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
> > > > +       tst_res(TINFO, "Avoid dumping corefile in following test");
> > >
> > > I'm fine with helper func. Maybe I'd print also current pid.
> > > It could be little spammy if there are many children, but we could
> > > address that later (if needed) with a parameter to control verbosity.
> > >
> >
> > To add a parameter (int verbose) sounds good to me.
> >
> > Btw, should we add some note/comment in the
> > document(test-writing-guidelines.txt)? I take a rough look but not sure
> > which line is the best position for that.
>
> How about we extend "2.2.10 Signal handlers" to "2.2.10 Signals and signal
> handlers"
> and put a note there?


Good point.

Since that core file dumping is(sometimes) a response for signal SIGSEGV in
process, we purpose to change that behavior and avoid to generate a dump
that related to this topic.

-- 
Regards,
Li Wang

--000000000000814d55058cbe95ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 3, 2019 at 12:11 AM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Mon, Jul 1, 2019 at 7:01 PM Jan Stancek &lt;<a href=3D"mailto:jstan=
cek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ----- Original Message -----<br>
&gt; &gt; &gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.c=
om" target=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" t=
arget=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 include/tst_safe_macros.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++++=
++<br>
&gt; &gt; &gt;=C2=A0 testcases/kernel/security/umip/umip_basic_test.c |=C2=
=A0 2 ++<br>
&gt; &gt; &gt;=C2=A0 testcases/kernel/syscalls/ipc/shmat/shmat01.c=C2=A0 =
=C2=A0 | 16 +++-------------<br>
&gt; &gt; &gt;=C2=A0 3 files changed, 21 insertions(+), 13 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/include/tst_safe_macros.h b/include/tst_safe_ma=
cros.h<br>
&gt; &gt; &gt; index 53a888c80..110e2984f 100644<br>
&gt; &gt; &gt; --- a/include/tst_safe_macros.h<br>
&gt; &gt; &gt; +++ b/include/tst_safe_macros.h<br>
&gt; &gt; &gt; @@ -394,6 +394,22 @@ static inline int safe_setrlimit(const =
char *file,<br>
&gt; &gt; const<br>
&gt; &gt; &gt; int lineno,<br>
&gt; &gt; &gt;=C2=A0 #define SAFE_SETRLIMIT(resource, rlim) \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_setrlimit(__FILE__, __LINE__,=
 (resource), (rlim))<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * Crash is expected, avoid dumping corefile.<br>
&gt; &gt; &gt; + * 1 is a special value, that disables core-to-pipe.<br>
&gt; &gt; &gt; + * At the same time it is small enough value for<br>
&gt; &gt; &gt; + * core-to-file, so it skips creating cores as well.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +static inline void tst_no_corefile(void)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rlimit r;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_cur =3D 1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.rlim_max =3D 1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SETRLIMIT(RLIMIT_CORE, &amp=
;r);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Avoid dumpi=
ng corefile in following test&quot;);<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m fine with helper func. Maybe I&#39;d print also current p=
id.<br>
&gt; &gt; It could be little spammy if there are many children, but we coul=
d<br>
&gt; &gt; address that later (if needed) with a parameter to control verbos=
ity.<br>
&gt; &gt;<br>
&gt; <br>
&gt; To add a parameter (int verbose) sounds good to me.<br>
&gt; <br>
&gt; Btw, should we add some note/comment in the<br>
&gt; document(test-writing-guidelines.txt)? I take a rough look but not sur=
e<br>
&gt; which line is the best position for that.<br>
<br>
How about we extend &quot;2.2.10 Signal handlers&quot; to &quot;2.2.10 Sign=
als and signal handlers&quot;<br>
and put a note there?</blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Good point.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div>Since that core file dumping is(so=
metimes) a response for signal SIGSEGV in process, we purpose to change tha=
t behavior and avoid to generate a dump that <span class=3D"gmail_default" =
style=3D"font-size:small">related</span>=C2=A0to this topic.</div></div><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000814d55058cbe95ef--

--===============1061914482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1061914482==--
