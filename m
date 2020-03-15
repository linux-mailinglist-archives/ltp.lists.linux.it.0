Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FECB185AC3
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 07:27:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21453C5769
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 07:27:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 90C7B3C05ED
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 07:27:48 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 25BB81A0115B
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 07:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584253665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avxnL5wH3wtpZcCAehBhexHV95SoQTDvXL6uBwvEuKo=;
 b=jU4n5vFPNvaNV8q2iACf7bPs9Ys9kVqQkA9DJTsuCgljPbKfW1gUYBkP4sof+pNxioHVyH
 521d0+duT+l3ZHd29AbKZ0xSx1bWHhU4y6TLoOWXvUGth2FKIEjplGIoRnsEbqYZUxM+hy
 g0zkY5/CvYF2o2kV5Tf/c9JsyBhaAv4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-4VU2HFO-NmqLClfAiXnEng-1; Sun, 15 Mar 2020 02:27:40 -0400
X-MC-Unique: 4VU2HFO-NmqLClfAiXnEng-1
Received: by mail-ot1-f70.google.com with SMTP id 60so9179035otp.16
 for <ltp@lists.linux.it>; Sat, 14 Mar 2020 23:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKAn8OuSYelGMWDkURA3gR5wPQ3q38+i0ZuD8z/eFuc=;
 b=aU57PShpED1H5LzsMHhY9VJWkDc9sL3HqhboqzqnOTxnJ6wc43llUcX1+Xm4vwZ3mV
 ybJblDdzIpI6xfAMLayVSImtCyN/iv6hx3PgVP/LP2KexrBUqKwwG/fG1Bac1FSFjScW
 CXs/D2sU6IiJsCjkDJzz86lckOwYuKavX8wvHdNh8I/EuYlqs7A5LrebnuDXcwivEAgA
 hINHB0JxU7dAf3GdzgQ1gkpbzxVn3t+IrCKD37w92c7ie8RtEAdgk0hde6ReJn6HuTBf
 3g56mX9jcbb36I/Q27muAc81KAsiRd6zttnLWpzcBbmwuMgNVQ4atYOOT0D6Z0Mcsdea
 /CKg==
X-Gm-Message-State: ANhLgQ3NVvZeZ3igf1pl+VsUNiOqBq+2YrlvBs7v9uTd0PTEg0l+3juo
 fPVyAe1w/nkNLe1rPigQSFOUeLT5Tlgf8vL+lV6qAaAhLrHVK4SGoyuFb38zbVylnY2PpG6u7Wm
 iblaAds/LKJhwU11VZ6q4lUWQD8A=
X-Received: by 2002:aca:af93:: with SMTP id
 y141mr12618867oie.144.1584253659808; 
 Sat, 14 Mar 2020 23:27:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsQgS9L3NPLZmeiyq5s/GAseD7dqXCu+scnlxJL9/s6ca4NBoEH+LhL1DdzW7YFhpoT2XnH7m+O/5uvbxs+TCU=
X-Received: by 2002:aca:af93:: with SMTP id
 y141mr12618861oie.144.1584253659543; 
 Sat, 14 Mar 2020 23:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAEX+82K_6yO1pB9utLg3TPheG91+oO-ode7kmMUPoLLe7aszxA@mail.gmail.com>
In-Reply-To: <CAEX+82K_6yO1pB9utLg3TPheG91+oO-ode7kmMUPoLLe7aszxA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 15 Mar 2020 14:27:28 +0800
Message-ID: <CAEemH2c6hkXMBsSQEm5MMhZoEieR0-OUwJ-ASLB9VFnG6Z-a8g@mail.gmail.com>
To: Javier Romero <xavinux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Contribution to the LTP.
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
Content-Type: multipart/mixed; boundary="===============1393674720=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1393674720==
Content-Type: multipart/alternative; boundary="0000000000009c991b05a0deccc3"

--0000000000009c991b05a0deccc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Of course yes, LTP[1] is an open-source project. Everyone who interested is
welcomed.

As you said you're a cloud engineer, so feel free to start LTP testing on
your Linux product and find/report/fix the problem.
https://github.com/linux-test-project/ltp/blob/master/README.md

Also, this is the LTP testcase writing guidelines FYI:
https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guid=
elines.txt

Any technical issues about LTP are suggested to discuss here(LTP-ML:
ltp@lists.linux.it).

[1] LTP provides tools and testsuites to verify the Linux kernel and
related subsystems.


On Sun, Mar 15, 2020 at 7:54 AM Javier Romero <xavinux@gmail.com> wrote:

> Hi,
>
> My name is Javier, work as a cloud engineer and have been working as a
> Linux sysadmin for the last 10 years.
>
> Would like to know if I can be useful for the Linux Test Proyect and
> contribute as a tester.
>
> Thanks for your kind attention and sorry for the inconvenience.
>
> Best Regards
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--0000000000009c991b05a0deccc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><font color=3D"#000000">Hi=C2=A0Javier,</font></div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><font color=3D"#000000"><br><=
/font></div><div class=3D"gmail_default" style=3D"font-size:small"><font co=
lor=3D"#000000">Of course yes, LTP[1] is an open-source project. Everyone w=
ho interested=C2=A0is welcomed.</font></div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><font color=3D"#000000"><br></font></div><div class=
=3D"gmail_default" style=3D"font-size:small"><font color=3D"#000000">As you=
 said you&#39;re a cloud engineer, so feel free to start LTP testing on you=
r Linux product and find/report/fix the problem.</font></div><div class=3D"=
gmail_default" style=3D"font-size:small"><font color=3D"#000000"><a href=3D=
"https://github.com/linux-test-project/ltp/blob/master/README.md">https://g=
ithub.com/linux-test-project/ltp/blob/master/README.md</a><br></font></div>=
<div class=3D"gmail_default" style=3D"font-size:small"><font color=3D"#0000=
00"><br></font></div><div class=3D"gmail_default" style=3D"font-size:small"=
><font color=3D"#000000">Also, this is the LTP testcase=C2=A0writing guidel=
ines FYI:</font></div><div class=3D"gmail_default" style=3D"font-size:small=
"><font color=3D"#000000"><a href=3D"https://github.com/linux-test-project/=
ltp/blob/master/doc/test-writing-guidelines.txt">https://github.com/linux-t=
est-project/ltp/blob/master/doc/test-writing-guidelines.txt</a><br></font><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><font color=3D"=
#000000"><br></font></div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><font color=3D"#000000">Any technical issues about LTP are suggested =
to discuss here(LTP-ML: <a href=3D"mailto:ltp@lists.linux.it">ltp@lists.lin=
ux.it</a>).</font></div><div class=3D"gmail_default" style=3D""><font color=
=3D"#000000"><br></font></div></div><div class=3D"gmail_default" style=3D""=
><font color=3D"#000000">[1]=C2=A0<span style=3D"background-color:rgb(250,2=
51,252);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,H=
elvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;">LTP provides tools and testsuites to verify the Linux kernel and r=
elated subsystems</span>.</font></div><div><br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 15, 2020 at 7:54=
 AM Javier Romero &lt;<a href=3D"mailto:xavinux@gmail.com">xavinux@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">My name is Javier, work as a cloud engineer and have been =
working as a Linux sysadmin for the last 1<span class=3D"gmail_default" sty=
le=3D"font-size:small"></span>0 years.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Would like to know if I can be useful for the Linux Test Pro=
yect and contribute as a tester.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for your kind attention and sorry for the inconvenience.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Best Regards</div></div>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000009c991b05a0deccc3--


--===============1393674720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1393674720==--

