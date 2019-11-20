Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B831035A7
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 08:54:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DC5E3C1CFD
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 08:54:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 836293C1824
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 08:54:09 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0E5C81A01136
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 08:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574236447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DvtLHtYnh2Bmx7UeWA1fEWr0v7AS6eZJRirlsADqRe0=;
 b=KqxyNbida+KWMv4ldbtUUIpJ5kcn58DePjEr/fCtz7AIwZu+mLl9h13fOpIcnlQ1W8z22U
 jCZXoodQ2VHOkfoMbkb1N4oXthIjyBuUnE4K8P8XYpcKnvW5HBp6CrmzJeR7OYEzwRbuDb
 oaa9srxA6+dlhJjxhrHfQhnVxszBxg8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-9CThMEtKMdWTy2tVymnGeg-1; Wed, 20 Nov 2019 02:54:05 -0500
Received: by mail-ot1-f69.google.com with SMTP id b110so5333115otc.15
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 23:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTXtiCL7RzUwGwiE2yrXxeiDy7mmHlT5ixKGVFmGJwk=;
 b=KN8PYCtQ0Jemy6kgu/dh3dQMEtVkN9qKpIDCMtGNXJGrkEJYhrS90ZDbzf4YxTjux2
 UqfnznFh27iI7jtuz4RicxiuV4oVYDWsv+uSzQaa44UAtucFL9M2IbTN5daPVmk/XRmE
 6ua7xto3NuSF3iqYlpi2fRaOFjGKfDwswZUWEbroXesFcJ7h4Y1ZCOzS5iBn1mUreoUz
 1h0aaBdXIVFTSXF2KmygCPYId6D9HohS8nUJ0Yj+iRgSqivNZW9kYhcPY3L5Jm1J38xq
 WKLIjvNM6+c8vLsYXta2D71llbBG8gdjxqaf3qRbdOcN6IxlO2cl5tY0LxXmKv7e/qrF
 8JjA==
X-Gm-Message-State: APjAAAW2vJy4HU8eqqm/klCmQ548VOChu302LZMHtGd3MYbzZm8ZbG5o
 s7EPqjFS5lRmvi62GB7ZpAim/ZWXDF2gbu0Fx8adiDTS2jSqItGKwzo8LCV5QV/J4FdR7Q1Qu0C
 Igy0ogfgQ8BVZ0UokbuipP0Mr4lY=
X-Received: by 2002:aca:ad03:: with SMTP id w3mr1555536oie.96.1574236444893;
 Tue, 19 Nov 2019 23:54:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzN8jXS21YJeaMhu88I5ATyYb2y6/C2ImotSOZmTeAzO4GypjoudNWY41A3AWyS/8jr/a2Rjrg45B4Hr8J6unI=
X-Received: by 2002:aca:ad03:: with SMTP id w3mr1555526oie.96.1574236444655;
 Tue, 19 Nov 2019 23:54:04 -0800 (PST)
MIME-Version: 1.0
References: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
 <CAEemH2fiyODj=FedbVK8xtrgz1T3JWO5dBiSUbA1L24XOx2yqA@mail.gmail.com>
 <2022379807.13117932.1574232698559.JavaMail.zimbra@redhat.com>
In-Reply-To: <2022379807.13117932.1574232698559.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Nov 2019 15:53:53 +0800
Message-ID: <CAEemH2d7Mx_Y-vCa6YohULnbzE6H6Y6q7KrXGOjGEqJdkvnq_w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: 9CThMEtKMdWTy2tVymnGeg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: don't pass NULL to strcmp in safe_mount
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
Content-Type: multipart/mixed; boundary="===============1885175262=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1885175262==
Content-Type: multipart/alternative; boundary="000000000000139fd40597c27c74"

--000000000000139fd40597c27c74
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 2:51 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Tue, Nov 19, 2019 at 6:29 PM Jan Stancek <jstancek@redhat.com> wrote=
:
> >
> > > Rachel reports, that pivot_root01 crashes on latest LTP:
> > >   Thread 3.1 "pivot_root01" received signal SIGSEGV, Segmentation
> fault.
> > >   0x00000000004062c4 in safe_mount (file=3Dfile@entry=3D0x413017
> > > "pivot_root01.c"
> > >   733             if (strcmp(filesystemtype, "ntfs")) {
> > >
> > > Don't pass NULL ptr to strcmp. Also fix return in unreachable path,
> > > to suppress warning about returning uninitialized 'rval'.
> > >
> >
> > Good catch.
> >
> > And shouldn't we give a "correct" fs_type in pivot_root01.c too?
> Otherwise,
> > the test would be failed on an invalid mounted operation I guess.
>
> Per man-page, it should be ignored.
>

Ok, then this patch looks good.

Reviewed-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000139fd40597c27c74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 20, 2019 at 2:51 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
----- Original Message -----<br>
&gt; On Tue, Nov 19, 2019 at 6:29 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Rachel reports, that pivot_root01 crashes on latest LTP:<br>
&gt; &gt;=C2=A0 =C2=A0Thread 3.1 &quot;pivot_root01&quot; received signal S=
IGSEGV, Segmentation fault.<br>
&gt; &gt;=C2=A0 =C2=A00x00000000004062c4 in safe_mount (file=3Dfile@entry=
=3D0x413017<br>
&gt; &gt; &quot;pivot_root01.c&quot;<br>
&gt; &gt;=C2=A0 =C2=A0733=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (strcmp(filesystemtype, &quot;ntfs&quot;)) {<br>
&gt; &gt;<br>
&gt; &gt; Don&#39;t pass NULL ptr to strcmp. Also fix return in unreachable=
 path,<br>
&gt; &gt; to suppress warning about returning uninitialized &#39;rval&#39;.=
<br>
&gt; &gt;<br>
&gt; <br>
&gt; Good catch.<br>
&gt; <br>
&gt; And shouldn&#39;t we give a &quot;correct&quot; fs_type in pivot_root0=
1.c too? Otherwise,<br>
&gt; the test would be failed on an invalid mounted operation I guess.<br>
<br>
Per man-page, it should be ignored.<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Ok, then this patch looks go=
od.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li=
 Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@red=
hat.com</a>&gt;</div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000139fd40597c27c74--


--===============1885175262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1885175262==--

