Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 502466B7DF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:09:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E98F3C1D1E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 10:09:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6E9653C1D00
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:09:06 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8D7D410008F8
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 10:09:00 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id g11so9302067uak.0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNfeAN+yRYrenSEq2+QDGjSlGnoiPst36VfAzlJKFXk=;
 b=szeTa0g10Upfziv+dJiWfeav51dYELarwuH2xncyRgmvSU9DGhskEaeA6Gaq8L3GWe
 9H7bWncl/a8Hog56iYUiDqOWTewQCx+vBMEokuXTJdhOEhIaYMDTd4+m96wfaTorjFnD
 tMsL4nGDj6+Uv003iAX4BWkmFB/0/Rduqr1IPkNwM/W2aYux/ZJ/QQYYLsQ/TnIvadPG
 o3nqyz30mhQ2TXv2AgqcbYIaKJmYpXtV3/39QtJQ1X7qNE3mMOk77mcgJOuAsiiy5TI/
 yriliHDi/CmJz+bBBS7/tw4yxfODtfY0GHup4TXEuLAuO892d4XWnfzKUHb010FuiooN
 Jw0w==
X-Gm-Message-State: APjAAAUukwjLfeTVg7xnJvvKMK0DVud5PwuaA0lF+N6+/e7QHGeqPZG2
 IXvUZ673c6feArH2PPraEjCOp6nsm9RbQpr3HKrQoA==
X-Google-Smtp-Source: APXvYqwi7ouZRH4qEog3e4gTX9H1Ahstfsz8C9032ITS2ALmwb3UcBGNYqneTZCnGPZW34NSQtSyiBoB1RJEraWGQKI=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr23093960uaq.106.1563350944514; 
 Wed, 17 Jul 2019 01:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190701081917.32051-1-liwang@redhat.com>
 <20190701081917.32051-2-liwang@redhat.com>
 <20190709142426.GA6920@rei.lan>
In-Reply-To: <20190709142426.GA6920@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Jul 2019 16:08:53 +0800
Message-ID: <CAEemH2fA6Xxhqbb7pJ1G3ChFbtzOueNpfzqP3EDnx9kq6LMpDQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] pkey: add test for memory protection keys
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
Content-Type: multipart/mixed; boundary="===============0381380095=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0381380095==
Content-Type: multipart/alternative; boundary="000000000000b51a5c058ddc017a"

--000000000000b51a5c058ddc017a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 10:24 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Looks good, some minor comments below.
>

Thanks! Pushed with the following changes:

1. add .needs_tmpdir = 1 in test struct
2. remove SAFE_MKDIR/SAFE_MOUNT from setup()
3. remove cleanup() function
4. take use of tst_no_corefile()
5. adjust the status content printing
6. adjust the code indent for switch case

-- 
Regards,
Li Wang

--000000000000b51a5c058ddc017a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jul 9, 2019 at 10:24 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Looks good, some minor comments below.<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Thanks! Pushed with =
the following changes:</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">1.=
 add .needs_tmpdir =3D 1 in test struct</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">2. remove=C2=A0<span class=3D"gmail_default"></spa=
n>SAFE_MKDIR/SAFE_MOUNT from setup()</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">3. remove cleanup() function</div><div class=3D"gmail=
_default" style=3D"font-size:small">4. take use of tst_no_corefile()</div><=
div class=3D"gmail_default" style=3D"font-size:small">5. adjust the status =
content printing</div><div class=3D"gmail_default" style=3D"font-size:small=
">6. adjust the code indent for switch case</div></div></div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b51a5c058ddc017a--

--===============0381380095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0381380095==--
