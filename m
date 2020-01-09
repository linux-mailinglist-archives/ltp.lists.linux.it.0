Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03C135998
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:56:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 338D43C24D2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:56:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E99FA3C2393
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:56:49 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 372E360081D
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578574607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TUFxo7iBrMRduiMcPrCi9SHvLsghEbkkraoP+LMVets=;
 b=JuoC8AcIYr9wILD6nripntbkDOB08NjPR6b491wXfFN2WS2nP9a4IE7lHSYRmATGkPZfHt
 VqyRcpP5ZUXripsknr7prs7qDWRS+g18uUlNJgTq7yWYbvRBbYF4xcTDvsgVrjF69CCCnU
 qdjruK9CnOH0Jjz6Ah+vw3wFKAILSbI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-vrplELY6NWG3dWtnaASXZg-1; Thu, 09 Jan 2020 07:56:42 -0500
Received: by mail-ot1-f72.google.com with SMTP id d16so3608454otq.19
 for <ltp@lists.linux.it>; Thu, 09 Jan 2020 04:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j4geWxK2XxGmrJ2GEV8Wwcm0EyihBMfxlpPvSTUqnYg=;
 b=fKnOy9yRBuqrOvhktom3WCGRH7arJvwObj4XV+UdEuhvCajoY/Nc/qyrFs62VW1OxA
 yXlJUbgE/bydmriYfMNEBwjwYaIbIDawEe4AMq/bjfXRKd9VIQwnFTVMqJ9jDFIiZU4U
 uPow/n4mdoKjggt77nDt2/NaOF8/mFt6+LggYvNYaH+fozyf1HWk4hfat68n2E9UCrd5
 CJCDb+JndshOUSfFCkDG5GM041PKrhWGpsPucmvAnTmhkUPJU8MIvVLEuhS/1aqUttzJ
 1W05RU3f18NUfGRX7XbKlCoFuCpm+s7RInKh6N/JIeDS0pi0XpSGo8zCrStSp0ylaOyM
 NlNw==
X-Gm-Message-State: APjAAAUAKco+YZYkHZL9XqA9KVR/B6iCwpTrnI9LJkhgADUsPBrnSpq+
 OnJVZaW6ydLMoXsrrPbccDS9DT4QkS6Wgmuqw554YHHSkbsawYKdZ4qxQRZYcR3GoT1kaILwg4D
 9ZJdhOwvgELIhdZCCBy6sXu8znJ0=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr2772236oie.144.1578574601340; 
 Thu, 09 Jan 2020 04:56:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVZzd0Qwrb6wF1zmwWeYpWmos8C25/4gR9cDRzcCW1PfCXrpimmkq7M5f3MCPHt8hoR3Sh8E+3OiZzaRBr3Qg=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr2772213oie.144.1578574601110; 
 Thu, 09 Jan 2020 04:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109095239.GB31981@rei.lan>
 <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
 <20200109124927.GA22952@rei.lan>
In-Reply-To: <20200109124927.GA22952@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Jan 2020 20:56:29 +0800
Message-ID: <CAEemH2dBSgBvVHf_rRbeKgwoPqsSQoafqo0LPx8qmH9=KMAn_A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: vrplELY6NWG3dWtnaASXZg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
Content-Type: multipart/mixed; boundary="===============0789162304=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0789162304==
Content-Type: multipart/alternative; boundary="00000000000059e308059bb48afb"

--00000000000059e308059bb48afb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 8:49 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > > diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > > index 2af040840..f5d7ca8ac 100644
> > > > --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > > +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > > @@ -20,6 +20,7 @@
> > > >   *   None
> > > >   */
> > > >
> > > > +#define _GNU_SOURCE
> > > >  #define _XOPEN_SOURCE 600
> > > >  #include <fcntl.h>
> > >
> > > Why do we need the _GNU_SOURCE here? We switched to a syscall() in th=
e
> > > header, hence we do not need the syncfs() prototype anymore.
> > >
> > >
> > But shouldn't we define the _GNU_SOURCE for syscall()?  Otherwise,
> > the _XOPEN_SOURCE 600 definitions will take effect and makes the compil=
er
> > print new errors[1].
> >
> > Here I fee a little confused, or do we need to delete the _XOPEN_SOURCE
> > definition directly for the test posix_fadvise01.c?
>
> Sigh, looks like the _XOPEN_SOURCE 600 disables syscall() definition
> from being exposed, which is otherwise exposed by default.
>
> Also it looks like things works fine for me when I remove the
> _XOPEN_SOURCE 600.
>
> So I guess that we should try to remove the _XOPEN_SOURCE from the
> posix_fadvise() tests and try to compile the code on old enough
> distribution. If that works we should do it that way.
>

Ok, I will have a try (remove the _XOPEN_SOURCE) to build it on more
distros. If works fine will send patch v2.

--=20
Regards,
Li Wang

--00000000000059e308059bb48afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 8:49 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; &gt; diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise=
01.c<br>
&gt; &gt; b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
&gt; &gt; &gt; index 2af040840..f5d7ca8ac 100644<br>
&gt; &gt; &gt; --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br=
>
&gt; &gt; &gt; +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br=
>
&gt; &gt; &gt; @@ -20,6 +20,7 @@<br>
&gt; &gt; &gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0None<br>
&gt; &gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +#define _GNU_SOURCE<br>
&gt; &gt; &gt;=C2=A0 #define _XOPEN_SOURCE 600<br>
&gt; &gt; &gt;=C2=A0 #include &lt;fcntl.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; Why do we need the _GNU_SOURCE here? We switched to a syscall() i=
n the<br>
&gt; &gt; header, hence we do not need the syncfs() prototype anymore.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; But shouldn&#39;t we define the _GNU_SOURCE for syscall()?=C2=A0 Other=
wise,<br>
&gt; the _XOPEN_SOURCE 600 definitions will take effect and makes the compi=
ler<br>
&gt; print new errors[1].<br>
&gt; <br>
&gt; Here I fee a little confused, or do we need to delete the _XOPEN_SOURC=
E<br>
&gt; definition directly for the test posix_fadvise01.c?<br>
<br>
Sigh, looks like the _XOPEN_SOURCE 600 disables syscall() definition<br>
from being exposed, which is otherwise exposed by default.<br>
<br>
Also it looks like things works fine for me when I remove the<br>
_XOPEN_SOURCE 600.<br>
<br>
So I guess that we should try to remove the _XOPEN_SOURCE from the<br>
posix_fadvise() tests and try to compile the code on old enough<br>
distribution. If that works we should do it that way.<br></blockquote><div>=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Ok, I will=
 have a try (remove the _XOPEN_SOURCE) to build it on more distros. If work=
s fine will send patch v2.</div></div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--00000000000059e308059bb48afb--


--===============0789162304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0789162304==--

