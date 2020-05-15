Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D091D474F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:45:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A78EB3C53C3
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:45:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F2BBB3C129F
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:45:40 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9A81B1A017A6
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589528737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQO4TDtOwFqPuzMOdp5rBL/0PDJSoQFPMdGA7DpSPLE=;
 b=M9OxXvLzIyWzqbI6aV9YrevPVq7hT3ba5qvgn8fAiPpAuriZ+w6nXsCRgHryBXIKLDcNdB
 UqM5IIE3OR+CN/LDh0FRJeYLg0ujcwX7pA3dPWuMUF6XysigQyUd7B2HNb3OifTeVFjj+2
 2uF2WquPU/a4v3I8M+ms0bFF8q5Y56w=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-k9ZcBhidPPmc-snYAlgKGw-1; Fri, 15 May 2020 03:45:35 -0400
X-MC-Unique: k9ZcBhidPPmc-snYAlgKGw-1
Received: by mail-lf1-f70.google.com with SMTP id e15so562004lfq.5
 for <ltp@lists.linux.it>; Fri, 15 May 2020 00:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQO4TDtOwFqPuzMOdp5rBL/0PDJSoQFPMdGA7DpSPLE=;
 b=CZZsV531W3uOPi6uBtzRCwdWq3AUddQgAZFBX2aYrhrKvPPbfqszNs7pBwOKTe33gn
 bvvA4nfjDeE4WCIfcp7ULzY8COTpmWDzAl3X7mQzAG77nX7e5XGmJmZ2AJTeh972n6Si
 8m78Ou93wDv3WtNzh8IT4RTm7o+obI+ZbZ/RQ6/QH1qvGg6M0ti91iDQRnBKjoWHyP4b
 /ImccYFzO4DuKHBI3BVvXrWbtHjcfMx0QFmmM3Gg0vszXZzRgr0PLQqRIUEgQdk88w7E
 zx4nQSkzivPCwGleMeTW12MybRBsxkIJgxiH1rqpJVD0pYFZfVGUvretopWwqfnkYa/o
 2VXg==
X-Gm-Message-State: AOAM532Kq3O+zBxorNp1Sdmy0HHdh0DC6HDPlpwGYHPx9UtHfDl8ba6H
 gxkEBIMAQ6Yok8AQE0Uwwnt9XcYOIL1+jJ+g0bTzgioyH9QHyfFQGyMC8Dbes/ruRja4yTGvHX5
 Kr3crgRAEJMra4SZZREer3EZxqaA=
X-Received: by 2002:a19:70d:: with SMTP id 13mr1500630lfh.60.1589528733868;
 Fri, 15 May 2020 00:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5B8uQ1KgG7eHmyokM2A55AKMXd/Ro1GfSPYW6UBQ0NUB4CSGHFoUDCHOC3KglE2bH8zl1pvqlGpsNhlgqvNs=
X-Received: by 2002:a19:70d:: with SMTP id 13mr1500621lfh.60.1589528733666;
 Fri, 15 May 2020 00:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200514184904.4537-1-pvorel@suse.cz>
 <20200514184904.4537-3-pvorel@suse.cz>
 <20200514193441.GA11518@dell5510>
In-Reply-To: <20200514193441.GA11518@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 May 2020 15:45:21 +0800
Message-ID: <CAEemH2etn2mSJbV=a=xpVMnUOjKdKrp0C5Cch2JYtbZ2pDkRyw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] INSTALL: Document 32bit and cross-compilation
 setup
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
Content-Type: multipart/mixed; boundary="===============2143806044=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2143806044==
Content-Type: multipart/alternative; boundary="00000000000087ef8305a5aaffc9"

--00000000000087ef8305a5aaffc9
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Fri, May 15, 2020 at 3:34 AM Petr Vorel <pvorel@suse.cz> wrote:

> ...
>
> > +32 bit build on 64 bit machine
> > +------------------------------
> > +You need to set CFLAGS=-m32 LDFLAGS=-m32 and PKG_CONFIG_LIBDIR
> > +
> > +* RPM based distributions (openSUSE, Fedora, etc.)
> > +PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig CFLAGS=-m32 LDFLAGS=-m32
> ./configure
> > +
> > +* Debian / Ubuntu and derivates
> > +PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32
> LDFLAGS=-m32 ./configure
>

I occationally build 32bit LTP on my RHEL8(x86_64) platform
via: CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" ./configure, it works for
me awalys.

May I ask why we need the PKG_CONFIG_LIBDIR?


>
> I guess, we should set this variable in 32 bit build in travis CI (we have
> only 1
> job, which uses Debian). It's not failing now, because it's not a minimal
> build.
> Therefore we should have minimal 32 bit build (easiest way is to use
> openSUSE or
> Fedora/CentOS as they don't install libtirpc 32bit).
>

Good suggestion! I think at least for CentOS/RHEL has no problem with this.

-- 
Regards,
Li Wang

--00000000000087ef8305a5aaffc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, May 15, 2020 at 3:34 AM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_d=
efault" style=3D"font-size:small">...</span><br>
<br>
&gt; +32 bit build on 64 bit machine<br>
&gt; +------------------------------<br>
&gt; +You need to set CFLAGS=3D-m32 LDFLAGS=3D-m32 and PKG_CONFIG_LIBDIR<br=
>
&gt; +<br>
&gt; +* RPM based distributions (openSUSE, Fedora, etc.)<br>
&gt; +PKG_CONFIG_LIBDIR=3D/usr/lib/pkgconfig CFLAGS=3D-m32 LDFLAGS=3D-m32 .=
/configure<br>
&gt; +<br>
&gt; +* Debian / Ubuntu and derivates<br>
&gt; +PKG_CONFIG_LIBDIR=3D/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=3D-m32 L=
DFLAGS=3D-m32 <span class=3D"gmail_default" style=3D"font-size:small"></spa=
n>./configure<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I occationally build 32bit LTP on my RHEL8(x8=
6_64) platform via:=C2=A0CFLAGS=3D&quot;-m32&quot; CXXFLAGS=3D&quot;-m32&qu=
ot; LDFLAGS=3D&quot;-m32&quot;=C2=A0<span class=3D"gmail_default"></span>./=
configure, it works for me awalys.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">May I ask why we need the=C2=A0PKG_CONFIG_LIBDIR?</div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I guess, we should set this variable in 32 bit build in travis CI (we have =
only 1<br>
job, which uses Debian). It&#39;s not failing now, because it&#39;s not a m=
inimal build.<br>
Therefore we should have minimal 32 bit build (easiest way is to use openSU=
SE or<br>
Fedora/CentOS as they don&#39;t install libtirpc 32bit).<br></blockquote><d=
iv><br></div><div class=3D"gmail_default" style=3D"font-size:small">Good su=
ggestion! I think at least for CentOS/RHEL has no problem with this.</div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000087ef8305a5aaffc9--


--===============2143806044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2143806044==--

