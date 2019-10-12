Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F97FD4D9D
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 08:35:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02F613C234F
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 08:35:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2A2613C220B
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 08:35:30 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B1A4260150C
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 08:33:46 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DBB4C05168C
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 06:35:28 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id l7so5941309otf.1
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 23:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+Vu5633mJc5E1W2jjJHKbhiE2eV2zSLl+dlPQOL+Nk=;
 b=jcTLtiWkX2wFbCCVmS7Vd+37XlhByW0lfKLsuDk+OZasm8GzFj4U5WrqmwLuCGZMm7
 EwrlvzBPvDTl+fLC//IT5gZNKfyaG/cb+rzJdXjlotl7DOF7fkXORNPvYg6nq4lf8TrX
 OqQlE0BLGQH5sPNh8OzS817Usyuh2F3u+hfTwSN9o5jXHwO+P8ZKKsLWWXte5VLdAewA
 qCJwKuSSijkgGZ3GQijMcOyloRZIy65w1L89jDtyZp178/zcZImbrDK7HX/QcUPWeEGe
 HyMwGFr0XZQl7nHvbjrvbyW0WZnY2jRRpg7cehTmlYKTz91NwrtFcfHFuAQmTCtrntA6
 DyYQ==
X-Gm-Message-State: APjAAAUOop0d6u5CowlRxLv4Ajxa4EaURQyVNGv9Oyuu8SDjPO+Inxbi
 1oULA1V5AFdUP3/uElaU5s+Z38P7yrld7Fr7dJzyCaUgKPKGQYiE+HgHAlOXqOhjNH0cBSetNUX
 gCxa5DgeLDwVHAHjb1k4bzzEgRuw=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr11476716otp.17.1570862127608; 
 Fri, 11 Oct 2019 23:35:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2ucmpaMX3JMRoAtK0yB2k/N8XrH4r4bd43BxMGCMLRZdgGaxnk5J8Hje36SZs3ka2cVyoUC/uIgISWaNTbp0=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr11476711otp.17.1570862127405; 
 Fri, 11 Oct 2019 23:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
In-Reply-To: <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 12 Oct 2019 14:35:16 +0800
Message-ID: <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
Content-Type: multipart/mixed; boundary="===============1695874786=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1695874786==
Content-Type: multipart/alternative; boundary="000000000000187ba60594b0d747"

--000000000000187ba60594b0d747
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 12, 2019 at 2:17 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Hi Jan,
> >
> > On Fri, Oct 11, 2019 at 4:24 PM Li Wang <liwang@redhat.com> wrote:
> >
> > >
> > >
> > > On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek <jstancek@redhat.com>
> wrote:
> > >
> > >> read_all is currently retrying only for short time period and it's
> > >> retrying to queue for same worker. If that worker is busy, it easily
> > >> hits timeout.
> > >>
> > >> For example 'kernel_page_tables' on aarch64 can take long time to
> > >> open/read:
> > >>   # time dd if=/sys/kernel/debug/kernel_page_tables of=/dev/null
> count=1
> > >> bs=1024
> > >>   1+0 records in
> > >>   1+0 records out
> > >>   1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s
> > >>
> > >>   real    0m13.066s
> > >>   user    0m0.000s
> > >>   sys     0m13.059s
> > >>
> > >> Rather than retrying to queue for specific worker, pick any that can
> > >> accept
> > >> the work and keep trying until we succeed or hit test timeout.
> > >>
> > >
> > RFC:
> >
> > Base on your patch, I'm thinking to achieve a new macro TST_INFILOOP_FUNC
> > which can repeat the @FUNC infinitely. Do you feel it satisfies your
> > requirements to some degree or meaningful to LTP?
>
> I'm OK with concept. I'd like more some variation of *RETRY* for name.
> Comments below.
>

Thanks, what about naming: TST_INFI_RETRY_FUNC?

And do you mind use it to replace your function work_push_retry()? I know
it may be not smarter than work_push_retry() but it looks tiny for code.

> ...
> > +#define TST_INFILOOP_FUNC(FUNC, ERET) \
> > +       TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, -1)
> > +
> >  #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)        \
> > -({     int tst_delay_ = 1;                                             \
> > +({     int tst_delay_ = 1, tst_max_delay_ = MAX_DELAY;                 \
> > +       if (MAX_DELAY < 0)                                              \
> > +                tst_max_delay_ *= MAX_DELAY;                           \
>
> Shouldn't this be just times (-1). For -5 you get 25 as max sleep time.
>

Agree.

>
> >         for (;;) {                                                      \
> >                 typeof(FUNC) tst_ret_ = FUNC;                           \
> >                 if (tst_ret_ == ERET)                                   \
> >                         break;                                          \
> > -               if (tst_delay_ < MAX_DELAY * 1000000) {                 \
> > -                       usleep(tst_delay_);                             \
> > +               usleep(tst_delay_);                                     \
> > +               if (tst_delay_ < tst_max_delay_ * 1000000) {            \
> >                         tst_delay_ *= 2;                                \
> >                 } else {                                                \
> > -                       tst_brk(TBROK, #FUNC" timed out");              \
> > +                        if (MAX_DELAY > 0)                             \
>
> pastebin has this condition backwards, but here it looks ok

Sorry for the typo in pastebin.

-- 
Regards,
Li Wang

--000000000000187ba60594b0d747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Oct 12, 2019 at 2:17 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Hi Jan,<br>
&gt; <br>
&gt; On Fri, Oct 11, 2019 at 4:24 PM Li Wang &lt;<a href=3D"mailto:liwang@r=
edhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek &lt;<a href=3D"mailto=
:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt;&gt; read_all is currently retrying only for short time period and=
 it&#39;s<br>
&gt; &gt;&gt; retrying to queue for same worker. If that worker is busy, it=
 easily<br>
&gt; &gt;&gt; hits timeout.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For example &#39;kernel_page_tables&#39; on aarch64 can take =
long time to<br>
&gt; &gt;&gt; open/read:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0# time dd if=3D/sys/kernel/debug/kernel_page_tabl=
es of=3D/dev/null count=3D1<br>
&gt; &gt;&gt; bs=3D1024<br>
&gt; &gt;&gt;=C2=A0 =C2=A01+0 records in<br>
&gt; &gt;&gt;=C2=A0 =C2=A01+0 records out<br>
&gt; &gt;&gt;=C2=A0 =C2=A01024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0=
.1 kB/s<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0real=C2=A0 =C2=A0 0m13.066s<br>
&gt; &gt;&gt;=C2=A0 =C2=A0user=C2=A0 =C2=A0 0m0.000s<br>
&gt; &gt;&gt;=C2=A0 =C2=A0sys=C2=A0 =C2=A0 =C2=A00m13.059s<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Rather than retrying to queue for specific worker, pick any t=
hat can<br>
&gt; &gt;&gt; accept<br>
&gt; &gt;&gt; the work and keep trying until we succeed or hit test timeout=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; RFC:<br>
&gt; <br>
&gt; Base on your patch, I&#39;m thinking to achieve a new macro TST_INFILO=
OP_FUNC<br>
&gt; which can repeat the @FUNC infinitely. Do you feel it satisfies your<b=
r>
&gt; requirements to some degree or meaningful to LTP?<br>
<br>
I&#39;m OK with concept. I&#39;d like more some variation of *RETRY* for na=
me.<br>
Comments below.<br></blockquote><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Thanks, what about naming: TST_INFI_RETRY_FUNC?<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"">And do you mind use it to replace your f=
unction work_push_retry()? I know it may be not smarter than work_push_retr=
y() but it looks tiny for code.</div><div class=3D"gmail_default" style=3D"=
font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +#define TST_INFILOOP_FUNC(FUNC, ERET) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, -1)<b=
r>
&gt; +<br>
&gt;=C2=A0 #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -({=C2=A0 =C2=A0 =C2=A0int tst_delay_ =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +({=C2=A0 =C2=A0 =C2=A0int tst_delay_ =3D 1, tst_max_delay_ =3D MAX_DE=
LAY;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (MAX_DELAY &lt; 0)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_max_delay=
_ *=3D MAX_DELAY;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
Shouldn&#39;t this be just times (-1). For -5 you get 25 as max sleep time.=
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Agree.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(FU=
NC) tst_ret_ =3D FUNC;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_r=
et_ =3D=3D ERET)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_delay_=
 &lt; MAX_DELAY * 1000000) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0usleep(tst_delay_);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(tst_del=
ay_);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_delay_=
 &lt; tst_max_delay_ * 1000000) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tst_delay_ *=3D 2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tst_brk(TBROK, #FUNC&quot; timed out&quot;);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (MAX_DELAY &gt; 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
pastebin has this condition backwards, but here it looks ok</blockquote><di=
v><span class=3D"gmail_default" style=3D"font-size:small"></span></div><div=
><span class=3D"gmail_default" style=3D"font-size:small">Sorry for the typo=
 in pastebin.</span></div></div><div><br></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--000000000000187ba60594b0d747--

--===============1695874786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1695874786==--
