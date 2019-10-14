Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6749D5B67
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 08:31:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 789A23C2278
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 08:31:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7196A3C14EE
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 08:31:32 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC196200BA4
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 08:31:29 +0200 (CEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0058A8553B
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 06:31:27 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id x125so9364572oig.7
 for <ltp@lists.linux.it>; Sun, 13 Oct 2019 23:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NbCogG/0Lxvs96BrG5A1BQkO4Dw7ljpmgZaSEpXKkOM=;
 b=cDGbGohnVoB6tQbSqHp/LtJqrjhGnZRxfS5rvInTJMLUIKjkAPL1KvSa6ckDKhuKs4
 /rBc2mKmbAI9Y2G9IX9163RZLjD2ANSAkxRLuoT8qQCbxmnGCU1xLAvfCD3EchXj812i
 dD6F8fkPMdwdUtKNKC0zAlgciQFItlpKdDDeZH8zMqoiLV6Fluu3h3c0i9xuIM9c4d0Y
 7KHLj5VJ5x7h4x4gbJxQVp+vtrO0+2sqODV+fr8Py6nsloXOOlbchrpqP9aJHBJ8ItOY
 /vkbnqFZv41Nx7E06UpliBnpwpdNYo5OEYMElPPvHTF7sYIIg2Nhq+lwt2ti3rgUae3l
 fKDw==
X-Gm-Message-State: APjAAAVkQYq1x30KVJSG5MVUHZ7Ei5Hx4wfXLUBie8VIoAkBJ5kGtRWq
 ZkDtnIOuuAWiB7WgjVw6vk+axenrFsgBD0yDGdxAV5puaR13a60+fN+fgLUrbn4RrZZnQ9RKD2n
 q+TAZYWeXgXCFu+gaCnP/EcUnFXo=
X-Received: by 2002:a54:480a:: with SMTP id j10mr22153255oij.138.1571034686505; 
 Sun, 13 Oct 2019 23:31:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPi9xHUu82oKwR3+U318Bf+uIFFMIrZtgN3zntuiVRdA+7zTSG1nZHE3OMDqd4gZEfOY6fnMOXjbcHQpJNChU=
X-Received: by 2002:a54:480a:: with SMTP id j10mr22153234oij.138.1571034686136; 
 Sun, 13 Oct 2019 23:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
 <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
 <1445930938.5951899.1570861051806.JavaMail.zimbra@redhat.com>
 <CAEemH2f2_5wNfNB=a-+=E+KevFOVvjCQ0sjBEG-eS27dwQxarw@mail.gmail.com>
 <23965038.5952515.1570862960195.JavaMail.zimbra@redhat.com>
 <CAEemH2cuxbW55Y_mv9t0u7PEJyQVr9dgtZVFrDYKLi51MSsLmg@mail.gmail.com>
 <1498901254.5980601.1570953247355.JavaMail.zimbra@redhat.com>
In-Reply-To: <1498901254.5980601.1570953247355.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 14 Oct 2019 14:31:14 +0800
Message-ID: <CAEemH2cCi5y9PPKnynF5DMwV4Wiyx1jYCvqpTTa-duBNH1CbFw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1010060903=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1010060903==
Content-Type: multipart/alternative; boundary="00000000000065c0570594d9049d"

--00000000000065c0570594d9049d
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 13, 2019 at 3:54 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Sat, Oct 12, 2019 at 2:49 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > > ...
> > > > > > Base on your patch, I'm thinking to achieve a new macro
> > > TST_INFILOOP_FUNC
> > > > > > which can repeat the @FUNC infinitely. Do you feel it satisfies
> your
> > > > > > requirements to some degree or meaningful to LTP?
> > > > >
> > > > > I'm OK with concept. I'd like more some variation of *RETRY* for
> name.
> > > > > Comments below.
> > > > >
> > > >
> > > > Thanks, what about naming: TST_INFI_RETRY_FUNC?
> > >
> > > Or just keep TST_RETRY_FUNC and add parameter to it?
> > >
> >
> > Sounds better, we could add parameter @INFI to control the retry as a
> knob.
> >
> > /* @INFI - 1: retry infinitely, 0: retry in limit times */
> >
> > #define TST_RETRY_FUNC(FUNC, ERET, INFI) \
> >         TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, 1, INFI)
>
> Other option is we use directly TST_RETRY_FN_EXP_BACKOFF.
>

I'm ok for either. I will have a try when I get a chance since mkswap01.sh
sometimes timed out in the one-second retrying.


>
> >
> >
> > > >
> > > > And do you mind use it to replace your function work_push_retry()? I
> know
> > > > it may be not smarter than work_push_retry() but it looks tiny for
> code.
> > >
> > > It may need some wrapper, because work_push_retry() may be passing
> > > different
> > > argument to function on each retry, which was one of reasons for the
> patch.
> > >
> >
> > I was not meaning to hack the work_push_retry() function, I mean to
> change
> > your patch as below after we improve the TST_RETRY_FUNC.
>
> Why not? Wouldn't we get better performance if we don't wait on specific
> worker
> to complete?
>
Well, right! You can merge this patch as it is.

-- 
Regards,
Li Wang

--00000000000065c0570594d9049d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Oct 13, 2019 at 3:54 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; On Sat, Oct 12, 2019 at 2:49 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; ...<br>
&gt; &gt; &gt; &gt; &gt; Base on your patch, I&#39;m thinking to achieve a =
new macro<br>
&gt; &gt; TST_INFILOOP_FUNC<br>
&gt; &gt; &gt; &gt; &gt; which can repeat the @FUNC infinitely. Do you feel=
 it satisfies your<br>
&gt; &gt; &gt; &gt; &gt; requirements to some degree or meaningful to LTP?<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m OK with concept. I&#39;d like more some variati=
on of *RETRY* for name.<br>
&gt; &gt; &gt; &gt; Comments below.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks, what about naming: TST_INFI_RETRY_FUNC?<br>
&gt; &gt;<br>
&gt; &gt; Or just keep TST_RETRY_FUNC and add parameter to it?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Sounds better, we could add parameter @INFI to control the retry as a =
knob.<br>
&gt; <br>
&gt; /* @INFI - 1: retry infinitely, 0: retry in limit times */<br>
&gt; <br>
&gt; #define TST_RETRY_FUNC(FUNC, ERET, INFI) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, =
1, INFI)<br>
<br>
Other option is we use directly TST_RETRY_FN_EXP_BACKOFF.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;m ok for either. I will have a try when I get a chance since=C2=A0mksw=
ap01.sh sometimes timed out in the one-second retrying.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And do you mind use it to replace your function work_push_re=
try()? I know<br>
&gt; &gt; &gt; it may be not smarter than work_push_retry() but it looks ti=
ny for code.<br>
&gt; &gt;<br>
&gt; &gt; It may need some wrapper, because work_push_retry() may be passin=
g<br>
&gt; &gt; different<br>
&gt; &gt; argument to function on each retry, which was one of reasons for =
the patch.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I was not meaning to hack the work_push_retry() function, I mean to ch=
ange<br>
&gt; your patch as below after we improve the TST_RETRY_FUNC.<br>
<br>
Why not? Wouldn&#39;t we get better performance if we don&#39;t wait on spe=
cific worker<br>
to complete?<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Well, righ=
t!  You can merge this patch as it is.=C2=A0</div></div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000065c0570594d9049d--

--===============1010060903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1010060903==--
