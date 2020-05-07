Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 786761C8416
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 10:00:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 015CE3C731F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 10:00:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 79C523C7248
 for <ltp@lists.linux.it>; Thu,  7 May 2020 09:59:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A7DD51401823
 for <ltp@lists.linux.it>; Thu,  7 May 2020 09:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588838395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J527IPD+cUBKK2NOKmXhnB5aPoZJGzEh7br3u1tprMI=;
 b=H98SFJauYPM3c4aTPVO4Hbj+wmP24jjwZGhjmkLgaT30Kws5slpXBynSxnjRTxG7YcNO4A
 lGYi5mufbZ0MRPlwQe5TZ7Y5CDN7IEmh2cTu/Jl7sQG7Im9cz43rgqf2qn5rxE1HTzk0FZ
 BD3eKmwcsyzx+NitVGSqZFZ/OTwhKGI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-0In_gan9Ok-Ei459Ed3nDA-1; Thu, 07 May 2020 03:59:50 -0400
X-MC-Unique: 0In_gan9Ok-Ei459Ed3nDA-1
Received: by mail-lf1-f72.google.com with SMTP id u28so1283729lfm.1
 for <ltp@lists.linux.it>; Thu, 07 May 2020 00:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pOK0mcTSiP72vNht14DRXIokHys+5QNDd8bPTuWRz5E=;
 b=lZ/5BHqsIOHr30TaJnpILFf9VcFt6z9sa0hUPSgB7DuE1Z/+PbMUZih7zXKyqZ7ynK
 ZHJQv5QAe76iVXnHzoXm6MhIQ8wwAJjYwMSnZuOdld5SgYw/siHjpJy/MrTA8HEUzc/3
 fQL1rFWYYuLpVope5Jy8tnbSIf8kp3RvOCqTCLoUOoCxMZUyAQhPqB8nMfX7l+/aC+P9
 kgNtENvL5P7N3iKqTlL+I0QYG9IkHyK0aBHKpukzDfeZZriKfGgvlrXbFhBJVSWWinXx
 ++m6MUdjiaXkzTOnfUMqEzoJ3lByI3HZgIwByD1BoFdCIaaKER+J3I2OKFtmgSwOXmOt
 8rmg==
X-Gm-Message-State: AGi0PuaxgoT2g/bciLBkiTFP/n4W/TJx+4LC4DLBKXzmnTAyfU/0bevj
 ViUcuHuxYVSyoF1XiM5bngedBT0f+gahU3pjFjs+4JxUAoDYltk79syo3YQ89VqhaHbN2ehw4h9
 kaEHO7JSV5f2NF/seUglxJo7csgs=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr7472610ljg.222.1588838388997; 
 Thu, 07 May 2020 00:59:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLZlW6WM6a0+Ccy4i5Q0JJQfdTj27L0RMQXAmYfE8ikiwO7ehpZOONUopeR1WkVC2awW1B/UwbporX+Cc5c2SM=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr7472530ljg.222.1588838387749; 
 Thu, 07 May 2020 00:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200506170407.5562-1-rpalethorpe@suse.com>
 <20200506171921.GA1214@dell5510>
In-Reply-To: <20200506171921.GA1214@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 7 May 2020 15:59:36 +0800
Message-ID: <CAEemH2eQ9Dd4CewEvPxfZx-1R69QS990iodR1_EsbYBVX8TmyA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Correct struct member sizes and add to CVE
 runtest file
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1953594196=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1953594196==
Content-Type: multipart/alternative; boundary="000000000000b5620c05a50a43fd"

--000000000000b5620c05a50a43fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2020 at 1:19 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Richard,
>
> > Also remove min_kver because it is arbitrary. We know this test works o=
n
> much
> > older kernels, but it will probably hit bugs that have been fixed for a
> long
> > time.
>
> Thanks!
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Waiting for reactions to .min_kver removal.
>

Removing .min_kver =3D "4.10" is fine by me, it works on rhel6/7/8 from my
test. The test failure seems related to the unfix kernel problem.

nit: I might separate runtest change into it's own commit.
>

Also to add #define CAN_MTU     (sizeof(struct can_frame)).


> Kind regards,
> Petr
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000b5620c05a50a43fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, May 7, 2020 at 1:19 AM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Richard,<br=
>
<br>
&gt; Also remove min_kver because it is arbitrary. We know this test works =
on much<br>
&gt; older kernels, but it will probably hit bugs that have been fixed for =
a long<br>
&gt; time.<br>
<br>
Thanks!<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
<br>
Waiting for reactions to .min_kver removal.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Removing .min_k=
ver =3D &quot;4.10&quot; is fine by me, it works on rhel6/7/8 from my test.=
 The test failure seems related to the unfix kernel problem.</div></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
nit: I might separate runtest change into it&#39;s own commit.<br></blockqu=
ote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">A=
lso to add #define CAN_MTU=C2=A0 =C2=A0 =C2=A0(sizeof(struct can_frame)).</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000b5620c05a50a43fd--


--===============1953594196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1953594196==--

