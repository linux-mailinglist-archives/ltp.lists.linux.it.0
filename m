Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C52F43D0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 06:27:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6112A3C266E
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 06:27:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1A4F73C25B1
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 06:27:38 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 93D6610005CC
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 06:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610515655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cy+GPEyaqB/lCykmIUuHgCUA0wIYGFDlFcmkWwz/IlE=;
 b=LcR06xeEI6KSmyZ6XfDrk3xea25RPJDPoGUkMtJofA/3vQ9dibwdHDqtQFVhnlgoBJB0UZ
 7xDXo6R7Gey0j5xj1WN4f3INzO7UQS7OquXrou7KayaVb7+rjxOtEsSFOMLwE7i5FXWBVA
 DZZwpVApXyNlFXDbvlX9yRBLolX0dAw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-3xq17Q_SPH6YKiQrsfvdCA-1; Wed, 13 Jan 2021 00:27:30 -0500
X-MC-Unique: 3xq17Q_SPH6YKiQrsfvdCA-1
Received: by mail-yb1-f198.google.com with SMTP id h75so1205983ybg.18
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 21:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cy+GPEyaqB/lCykmIUuHgCUA0wIYGFDlFcmkWwz/IlE=;
 b=RIgmYkn215kZphAc1EkR2cOBY6RkBGQ3KV0OthKfBh1liKWOxgoTSB3zgyYMlciRAE
 tOckxC8fOtrUqOjq62LMYSpcdl1hwZTYpo59qIhLKX4RMeNl4Tvkzkg23f3fffc/G6oQ
 cH3WlQYeteVKFzhNvmNTybqD9Y7WxZ4Yit6S8NUT/muk36/5qjZScyvDqAh/uMQVFWLA
 71nFobkPuxtyuXKDOl4Xn1n7yNugBZERVfNgfXIkN1eVUrbQFDguh0Ky+2Z9MN0C33aw
 r0WUYPtKqBgPY9Ymt/U087gbA5ZfAffHaFB7I+N5NDb0EhKItIcQBLma92cvnrkN/WYh
 1nzw==
X-Gm-Message-State: AOAM532j8KqI/2QZm4Hs7ETihY07HzkmUbwiG3JfLoLRpuyDaxWoFxyf
 xt9j/LY8dgcMP0ZyPrn15e9rJWHVyQs3AdnMyFdgEjvecGtncviL1yLwX2F4o1wj4NL+HyHqr0s
 wFXHJoJ0fhSfYblHR+mDzEeU8Als=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr919433ybj.243.1610515650010; 
 Tue, 12 Jan 2021 21:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/rxLWLOqFgeIzzRmTaJgPhtniRCMtEwH7RHrhBXBpSyLnLd1bXj3NZ6MLtefyOrpy22aqsWI5PjTkwOUGAA0=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr919410ybj.243.1610515649678; 
 Tue, 12 Jan 2021 21:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20210111123626.28932-1-pvorel@suse.cz>
 <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
 <X/2E2GD/wimgo5Hi@pevik>
 <CAEemH2cmHrUGx3WXWfh6huNh-sv_GY56A+EvGVj-BiXT3WQ32A@mail.gmail.com>
 <X/4kHp818UKMRmXm@pevik> <X/4nFTgDjsO4a9VU@pevik>
In-Reply-To: <X/4nFTgDjsO4a9VU@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 13 Jan 2021 13:27:16 +0800
Message-ID: <CAEemH2d_ciwQczOAi7svMODH11_Ag4t_4DFQ_v1CiLEhkBwXUw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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
Content-Type: multipart/mixed; boundary="===============1192098820=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1192098820==
Content-Type: multipart/alternative; boundary="0000000000003467b805b8c1656a"

--0000000000003467b805b8c1656a
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Wed, Jan 13, 2021 at 6:47 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> ...
> > > From what I understanding, this macro runs the pkg-config tool to check
> > > for the presence of packages against keyutils-libs and sets two
> variables:
> > > LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.
>
> > > So the list-of-modules should be the precise name(or version) of the
> > > library, am I right?
> > > See: https://autotools.io/pkgconfig/pkg_check_modules.html
>
> > Thanks for an explanation, but I'm still missing something.
> > In openSUSE:
>
> > $ pkg-config --libs --cflags libkeyutils
> > -lkeyutils
>
> > $ pkg-config --libs --cflags keyutils-libs
> > Package keyutils-libs was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `keyutils-libs.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'keyutils-libs', required by 'virtual:world', not found
>
> > That's correct, because keyutils-devel package has file:
> > /usr/lib64/pkgconfig/libkeyutils.pc
>
> > The same is for Debian, which has
> > /usr/lib/x86_64-linux-gnu/pkgconfig/libkeyutils.pc
>
> > Looking at Fedora:
> > keyutils-libs-devel [1] has /usr/lib64/pkgconfig/libkeyutils.pc.
>
> > Download and unpack the package and run:
> > $ PKG_CONFIG_LIBDIR="$PWD/usr/lib64/pkgconfig/" pkg-config --libs
> --cflags libkeyutils
> > -lkeyutils
>
> And more importantly upstream has libkeyutils.pc.in [1] (not
> keyutils-libs.pc).
>

Thanks for the detailed demo, it seems things not like what I assumed, and I
misunderstood on something about libkeyutils. Your patch looks correct, and
no need to modify it.

-- 
Regards,
Li Wang

--0000000000003467b805b8c1656a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jan 13, 2021 at 6:47 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<=
br>
<br>
...<br>
&gt; &gt; From what I understanding, this macro runs the pkg-config tool to=
 check<br>
&gt; &gt; for the presence of packages against keyutils-libs and sets two v=
ariables:<br>
&gt; &gt; LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.<br>
<br>
&gt; &gt; So the list-of-modules should be the precise name(or version) of =
the<br>
&gt; &gt; library, am I right?<br>
&gt; &gt; See: <a href=3D"https://autotools.io/pkgconfig/pkg_check_modules.=
html" rel=3D"noreferrer" target=3D"_blank">https://autotools.io/pkgconfig/p=
kg_check_modules.html</a><br>
<br>
&gt; Thanks for an explanation, but I&#39;m still missing something.<br>
&gt; In openSUSE:<br>
<br>
&gt; $ pkg-config --libs --cflags libkeyutils<br>
&gt; -lkeyutils<br>
<br>
&gt; $ pkg-config --libs --cflags keyutils-libs<br>
&gt; Package keyutils-libs was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `keyutils-libs.pc&#39;=
<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; Package &#39;keyutils-libs&#39;, required by &#39;virtual:world&#39;, =
not found<br>
<br>
&gt; That&#39;s correct, because keyutils-devel package has file:<br>
&gt; /usr/lib64/pkgconfig/libkeyutils.pc<br>
<br>
&gt; The same is for Debian, which has<br>
&gt; /usr/lib/x86_64-linux-gnu/pkgconfig/libkeyutils.pc<br>
<br>
&gt; Looking at Fedora:<br>
&gt; keyutils-libs-devel [1] has /usr/lib64/pkgconfig/libkeyutils.pc.<br>
<br>
&gt; Download and unpack the package and run:<br>
&gt; $ PKG_CONFIG_LIBDIR=3D&quot;$PWD/usr/lib64/pkgconfig/&quot; pkg-config=
 --libs --cflags libkeyutils<br>
&gt; -lkeyutils<br>
<br>
And more importantly upstream has <a href=3D"http://libkeyutils.pc.in" rel=
=3D"noreferrer" target=3D"_blank">libkeyutils.pc.in</a> [1] (not keyutils-l=
ibs.pc).<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Thanks for the detailed demo, it seems things not =
like what I assumed, and I</div><div class=3D"gmail_default" style=3D"font-=
size:small">misunderstood on something about libkeyutils. Your patch looks =
correct, and</div><div class=3D"gmail_default" style=3D"font-size:small">no=
 need to modify it.</div></div></div><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000003467b805b8c1656a--


--===============1192098820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1192098820==--

