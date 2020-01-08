Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6B133F94
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:46:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B47D33C246C
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:46:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B29303C241B
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:46:20 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3CABB1001382
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578480378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cyMCK/LkQjDOHhjs9D1pKxcCDRlXSuCNQpLc31i97oM=;
 b=GOFGtNe6jFw1a15svd9TC0+yV/lc07FWNwzQ5BmiKErN0uuvSNVHdPQ9aljiXcVY6kD6QG
 yrJmxJ8XLKfm8u486wZfQ+tuZQuTqSfM+aRD36lmGLLs0WmtPmiKa/i1i/A0yb8lfjMGEE
 QhMx5OqiN/z/m3SBy3HufkvUWvaaHrY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-xT1vmTqiO_GpaZR6qozCaA-1; Wed, 08 Jan 2020 05:46:14 -0500
Received: by mail-oi1-f197.google.com with SMTP id d9so1424320oij.4
 for <ltp@lists.linux.it>; Wed, 08 Jan 2020 02:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XcuVqj1KJ8aCAOKEtoitmpSr8IIeg7u/S8TxJzlpf2I=;
 b=ZW+oswKW5oo2CYGQt7dqqaLeBtal9phnVMiPXIVkw19OuspPbzMqOpnC5XtbZPGIL+
 0LMuuXq5RorYduAEt1Vy7WQDQYC9wbRC2al+lJKxM3ymtiqE/ni9jogleHGbKpT0+q7X
 CnFW1Fy7RxOfanFRZruos7Ir4DkU4DScGQVKfSLpGn/uTQ7jUpDWChWmL4UvGkKg7yq5
 dztSW1ftdi9tMNL/qOw4UrMB3ti8dLHAUWLSyjZhwV7/yqbZ563+tjCJ4xMgCyYgGwNa
 rRZZuSiO9tkR2JiVdtd17gnHZ2+gGtuiksfk93ShIy7/sgKhVGLpAcliOLGO697cW9Tf
 LeQQ==
X-Gm-Message-State: APjAAAUicNXNEORySS8GGaYrmQCFoeX+loscKh2AYnWmjpOK7lZpfL8Z
 Yyd/r1gkBX3CU0PWaWRxT/iZrjk67qGiLm049TsQcOpi0DhntZqZ8w/sOm20+y5JLUUbGU1CSlg
 8QKQwSrG1JobFq/o7aVXOabsR+Sk=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr3770065otr.67.1578480373790; 
 Wed, 08 Jan 2020 02:46:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCEnppIxQmtpvP6JJ9ncva3uIVQ16qdyRdzVanxOJbvTlG7QJgq/Wu0IFwifUwuqg3DPsPoDa+BrlSg269nuc=
X-Received: by 2002:a05:6830:1e99:: with SMTP id
 n25mr3770040otr.67.1578480373325; 
 Wed, 08 Jan 2020 02:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
In-Reply-To: <20200107101119.GA22967@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 8 Jan 2020 18:46:01 +0800
Message-ID: <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: xT1vmTqiO_GpaZR6qozCaA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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
Content-Type: multipart/mixed; boundary="===============1735473631=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1735473631==
Content-Type: multipart/alternative; boundary="000000000000effc10059b9e9947"

--000000000000effc10059b9e9947
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2020 at 6:11 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> >  This function reads test block device stat file
> (/sys/block/<device>/stat) and
> > -returns the bytes written since the last invocation of this function.
> > +returns the bytes written since the last invocation of this function.
> To avoid
> > +FS deferred IO metadata/cache interferes the result, we suggest doing
> "syncfs"
>                                  |   interfecence    |
>

Thanks.

>
> > +before the tst_dev_bytes_written first invocation. And an inline
> function named
> > +tst_dev_sync is created for that intention.
>
> Other than this it looks good to me, thanks for doing this, acked.
>

Pushed.

--=20
Regards,
Li Wang

--000000000000effc10059b9e9947
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 7, 2020 at 6:11 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt;=C2=A0 This function reads test block device stat file (/sys/block/&lt;=
device&gt;/stat) and<br>
&gt; -returns the bytes written since the last invocation of this function.=
<br>
&gt; +returns the bytes written since the last invocation of this function.=
 To avoid<br>
&gt; +FS deferred IO metadata/cache interferes the result, we suggest doing=
 &quot;syncfs&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0interfecence=C2=
=A0 =C2=A0 |<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Thanks.</div><div class=3D"gmail_default" style=3D"=
font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +before the tst_dev_bytes_written first invocation. And an inline func=
tion named<br>
&gt; +tst_dev_sync is created for that intention.<br>
<br>
Other than this it looks good to me, thanks for doing this, acked.<br></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Pushed.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--000000000000effc10059b9e9947--


--===============1735473631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1735473631==--

