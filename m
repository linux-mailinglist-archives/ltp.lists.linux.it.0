Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D16501B2379
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:59:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E2593C29B9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:59:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 29A753C29A3
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:59:26 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4A5CC2002DF
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587463164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikeOK6VoKp2v7YveZDc8KVK1TGuepyqql0NFSQW66Tk=;
 b=eVFjsY5nQTK6x+TeZ3ioWsnxRSA5YotXN3YsvfIti3wSeFFd+5l1T1BtZbnz2GckUtKijX
 BQS7rDfYQYfNbIABQKMD+71G7jkkZo3+JqMbiy7Bcg9WYQF4WnXQCM16QzgmLz1Nx03kVy
 HoK832smYjHwPqfWYK6eA123Ae4zUh0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-mmFr9nOHONqXnBhvDCVkvA-1; Tue, 21 Apr 2020 05:59:13 -0400
X-MC-Unique: mmFr9nOHONqXnBhvDCVkvA-1
Received: by mail-lf1-f71.google.com with SMTP id v7so5570683lfq.11
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 02:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0GJkOxVc+6xpU9VIEIkY4hdQfeL/b2Ip/reP9F2AGk=;
 b=UEAXC2wuGtCaCMRj3vRskkWpU8ypkLo21hUkQwR0dTgHSfm/7h+TGAFvNmvJJQLpIP
 sDxOKlJZkCcVbl82E5f3fdx1iyF3yJdU6WU2dmcvheQH1sFEExdRWQ2Y5/Dg3o7iXdmW
 2AsfjzngHUw5pYIYIxPgJSVqGSyNXX80eAti4ec5LBd61DLQuSzZ8xw948CO/cKz5sv5
 DozdjXaWIwXsc7/IlJnX/ylk1Dx9nRuTKC39ktMJiM5aUPLx6FkNYncWiMXRZOf1rGvl
 SS+rbxm052vAHkNUuoRtCfm5Ch1YteS3WADZD9XAW2Tn2+MwRTVs01n8ymExRoVrskjZ
 hanA==
X-Gm-Message-State: AGi0PuZtXXZVI4isdWIZbMJ7/Uhwre8AJhSSvaulMMT0LPdtq5qQk7Rc
 +x1B94sFla+L/NRCcBDp+7GwSxnqSlSY3B7408gM7LZI+yspc1y3UnkTsEBrewZby81gQ7+iLVH
 RbqPL7xKC7Ge/r7fXk9A2Yrbs4gU=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr11953302ljj.120.1587463151423; 
 Tue, 21 Apr 2020 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypISynJgb96ONe03SgdGiHdiiOX2FeaQrM7Cy637Riz6bhhQN5LQG/i8+DbAviOCCW9775HqDsfwXLTqmm8Pk2Q=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr11953296ljj.120.1587463151234; 
 Tue, 21 Apr 2020 02:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eN1gJ8p2EWts4qj=tDaV0QUoHrNX36cqkPM0xf92KDuw@mail.gmail.com>
 <324c7f62-a57f-b950-7178-5ba05ac6616b@cn.fujitsu.com>
In-Reply-To: <324c7f62-a57f-b950-7178-5ba05ac6616b@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Apr 2020 17:59:00 +0800
Message-ID: <CAEemH2cetwZ7bsdVxoogMzRBUZRWetOEAwU2aZN=v5y6NX8a=w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] syscalls/pipe2_02: Add new test for pipe2
 O_CLOEXEC flag
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
Content-Type: multipart/mixed; boundary="===============1677703625=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1677703625==
Content-Type: multipart/alternative; boundary="000000000000394a2205a3ca1121"

--000000000000394a2205a3ca1121
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

...
> >     +static void verify_pipe2(void)
> >     +{
> >     +       int pid, status;
> >     +       char buf[20];
> >     +
> >     +       SAFE_PIPE2(fds, O_CLOEXEC);
> >     +       sprintf(buf, "%d", fds[1]);
> >     +       pid =3D SAFE_FORK();
> >     +       if (pid =3D=3D 0) {
> >     +               if (execlp(TESTBIN, TESTBIN, buf, NULL))
> >     +                       exit(2);
> >
> >
> > Do we really need the if() condition and exit(2)? AFAIK, the exec()
> > family of functions replaces the current process image with a new
> > process and returns zero if succeeded.
>   If failed, it will return -1. So we can catch 2(exit code) in the
> following code, but SAFE_EXECLP is also ok.
>

Since we have do check the status of children via WIFEXITED(status), so
even failed with -1, that also should be caught. Anyway, SAFE_EXECLP()
should work for us.

--=20
Regards,
Li Wang

--000000000000394a2205a3ca1121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">Yang =
Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fuj=
itsu.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l_default" style=3D"font-size:small">...</span><br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void verify_pipe2(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid, status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[20];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_CLOEX=
EC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf, &quot;%d&q=
uot;, fds[1]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (execlp(TESTBIN, TESTBIN, buf, NULL))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(2);<br>
&gt; <br>
&gt; <br>
&gt; Do we really need the if() condition and exit(2)? AFAIK, the exec() <b=
r>
&gt; family of functions replaces the current process image with a new <br>
&gt; process and returns zero if succeeded.<br>
=C2=A0 If failed, it will return -1. So we can catch 2(exit code) in the <b=
r>
following code, but <span class=3D"gmail_default" style=3D"font-size:small"=
></span>SAFE_EXECLP is also ok.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Since we have do check the =
status of children via WIFEXITED(status), so even=C2=A0failed with -1, that=
 also should be caught. Anyway, SAFE_EXECLP() should work for us.</div></di=
v><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--000000000000394a2205a3ca1121--


--===============1677703625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1677703625==--

