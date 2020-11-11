Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946F2AF133
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 13:48:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2313F3C5361
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 13:48:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5CD9E3C2650
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 13:48:13 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B67821A00FE3
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 13:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HrB61pRxsRdAn3R8DujZF7Hp5S7O1b42BB9XW8yTCEA=;
 b=aKzu37eKfKMlElR0tgDeex5SpzRRE2BsJ2H7uF45R2RKtnqOfq4G4twt4qT5OrUhFy/0va
 v8HVsPaakK6f8TBNEk2PWhp6hhDGtRBcydM8RHXs9g1EH5sdyiD9xIrOcWDdAMWt1RLL2H
 Epkq8NWzAEUBR07Xv2Sdn/QB/OCSEsU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-OlZaD2WnNiGRKDNugvb4yA-1; Wed, 11 Nov 2020 07:48:08 -0500
X-MC-Unique: OlZaD2WnNiGRKDNugvb4yA-1
Received: by mail-yb1-f200.google.com with SMTP id k7so2256910ybm.13
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 04:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HrB61pRxsRdAn3R8DujZF7Hp5S7O1b42BB9XW8yTCEA=;
 b=aHX2JA67pnWeX3Iobeqyny8SJi2PcK37sQ8ckm3MIiXkvJYgxZjXgfo5Y/YTb/k7rW
 42FRdiMVY2DLP3udAeEscJ7MmVHii8E5VGKJvTWBKAKhUDwsIe+856b6vmzCeD4Y2Gnm
 Nid6ono70BERbXrnEayiRFJ1HeCvzuRqd/OJyATeRF2CgWjqFqcG/mzwFFlqdYAML8jr
 xd7aIx5wkIZ/LXTDDBW5xnHQ3OBzlULR/xk0vu/Ws1hU9ZFr0jL+Q4KsKN4K+0YU/kY1
 GKauIJPeBP9/MDlribv+pywisdlBCXIcXOoqAYsdOG5nk3GnssIiw2yGhLD7sf4ipz+k
 w+Eg==
X-Gm-Message-State: AOAM530zso5D7gRYqQzUh0cnyIt8i8HWHtLJCCoatIGbKdq5YmFiKTCt
 QSmwLqJYDi8zROOWkl2FmZcl/fBAu6ELs0pPwsG8tU1Yt1liAtycvIpPsdZaPqv+I1qSSBCkrRe
 8Heo0Fezydm/cJpmGCuZxp3qUsXY=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr34066731ybe.403.1605098887785; 
 Wed, 11 Nov 2020 04:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi6XVtc8XHKGiaOOjNUVg4sSIbJPeZN4Zvt9OIIaUxNN/rrsLkg9/E9iNxgYZA/UjGifMjMwt75PO1yTHzkHs=
X-Received: by 2002:a25:c7c6:: with SMTP id
 w189mr34066712ybe.403.1605098887584; 
 Wed, 11 Nov 2020 04:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20201110120923.21759-1-pvorel@suse.cz>
 <20201111093934.GA5870@yuki.lan>
 <CAEemH2cyoSpQhTH5S=EWWoD7DaLz6WKFFadLFHMxkW8LHYM5CA@mail.gmail.com>
 <20201111095553.GA8524@pevik>
 <CAEemH2c4qTU1f99MBXTyVgvX-L=LNRneRJvmctkF9YiQ68u_-Q@mail.gmail.com>
 <20201111114843.GA14760@pevik>
In-Reply-To: <20201111114843.GA14760@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Nov 2020 20:47:56 +0800
Message-ID: <CAEemH2dbUQQr0s10tdTDYLZtx8TR=AYpXGxHjVD_jOYEWhSt8Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] m4: Remove workaround for old pkg-config
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
Content-Type: multipart/mixed; boundary="===============0330230569=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0330230569==
Content-Type: multipart/alternative; boundary="00000000000006422905b3d4352a"

--00000000000006422905b3d4352a
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Wed, Nov 11, 2020 at 7:48 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > On Wed, Nov 11, 2020 at 5:56 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > > Hi,
>
> > > > On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis <chrubis@suse.cz>
> wrote:
>
> > > > > Hi!
> > > > > Looks good to me, let's apply this unless anybody complains.
>
>
> > > > Hold on, please.
>
> > > > Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIRPC_* in
> all
> > > > respective Makefiles? Otherwise, it will fail like the Travis CI job
> I
> > > > guess.
>
> > > Correct, currently would fail without it.
> > > https://travis-ci.org/github/pevik/ltp/builds/742685737
>
> > > I'll send v2 where I implement this.
>
>
> > Thanks, I modified base on your patch, test result FYI
> >
> https://github.com/wangli5665/ltp/commit/dad10021771101e7fdd416af894be7484fcb7a52
> > https://travis-ci.org/github/wangli5665/ltp/builds/742909686
> You implemented it, thank you. Please push it after Travis finishes.


Pushed, and thanks for the explanation.

>
> Just an explanation, why I introduced TIRPC_{CFLAGS,LIBS}: there was
> Sun-RPC
> implementation in glibc, which I wanted to test. Thus variable name without
> "LIB" to say, that it could be also glibc.
>
> But Sun-RPC is broken, was deprecated and my patchset which removes it from
> glibc was accepted and released in glibc 2.32. Thus I'm going to send patch
> which reverts the commit 60b20c428060b20c428 ("rpc: Enable and fix build
> basic
> RPC tests with glibc SunRPC").
>
> My long term goal: fix and cleanup RPC tests (some are failing also with
> libtirpc), move these tests to libtirpc sources (they needs to be cleaned.
> And
> also I'd prefer to not put there whole LTP library, but just needed
> subset).
>
> Kind regards,
> Petr
>
>

-- 
Regards,
Li Wang

--00000000000006422905b3d4352a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 11, 2020 at 7:48 PM Petr Vorel &lt;<a href=3D"m=
ailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; On Wed, Nov 11, 2020 at 5:56 PM Petr Vorel &lt;<a href=3D"mailto:pvore=
l@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br>
<br>
&gt; &gt; Hi,<br>
<br>
&gt; &gt; &gt; On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis &lt;<a href=3D"=
mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br=
>
<br>
&gt; &gt; &gt; &gt; Hi!<br>
&gt; &gt; &gt; &gt; Looks good to me, let&#39;s apply this unless anybody c=
omplains.<br>
<br>
<br>
&gt; &gt; &gt; Hold on, please.<br>
<br>
&gt; &gt; &gt; Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIR=
PC_* in all<br>
&gt; &gt; &gt; respective Makefiles? Otherwise, it will fail like the Travi=
s CI job I<br>
&gt; &gt; &gt; guess.<br>
<br>
&gt; &gt; Correct, currently would fail without it.<br>
&gt; &gt; <a href=3D"https://travis-ci.org/github/pevik/ltp/builds/74268573=
7" rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/=
ltp/builds/742685737</a><br>
<br>
&gt; &gt; I&#39;ll send v2 where I implement this.<br>
<br>
<br>
&gt; Thanks, I modified base on your patch, test result FYI<br>
&gt; <a href=3D"https://github.com/wangli5665/ltp/commit/dad10021771101e7fd=
d416af894be7484fcb7a52" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/wangli5665/ltp/commit/dad10021771101e7fdd416af894be7484fcb7a52</a><br>
&gt; <a href=3D"https://travis-ci.org/github/wangli5665/ltp/builds/74290968=
6" rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/github/wangli=
5665/ltp/builds/742909686</a><br>
You implemented it, thank you. Please push it after Travis finishes.=C2=A0<=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Pushed, and thanks for the explanation.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Just an explanation, why I introduced TIRPC_{CFLAGS,LIBS}: there was Sun-RP=
C<br>
implementation in glibc, which I wanted to test. Thus variable name without=
<br>
&quot;LIB&quot; to say, that it could be also glibc.<br>
<br>
But Sun-RPC is broken, was deprecated and my patchset which removes it from=
<br>
glibc was accepted and released in glibc 2.32. Thus I&#39;m going to send p=
atch<br>
which reverts the commit 60b20c428060b20c428 (&quot;rpc: Enable and fix bui=
ld basic<br>
RPC tests with glibc SunRPC&quot;).<br>
<br>
My long term goal: fix and cleanup RPC tests (some are failing also with<br=
>
libtirpc), move these tests to libtirpc sources (they needs to be cleaned. =
And<br>
also I&#39;d prefer to not put there whole LTP library, but just needed sub=
set).<br>
<br>
Kind regards,<br>
Petr<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000006422905b3d4352a--


--===============0330230569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0330230569==--

