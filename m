Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F62AED61
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 10:22:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAC6C3C2F3D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 10:22:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9B3AB3C2639
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 10:22:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8AAE5200B14
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 10:22:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mIl0oV0wOao86rk6BkZz9QIfU1buND9UjRnJ6g5uEnM=;
 b=cttkESrAru5c3m2Pnn83IWQNwfXfLmy3UqjKilbCLJrpnsALBkJaeQIGTuuVgaIaejnkVn
 5i5txD6RMlLCOtQ5C0pxaGk1MjE6UZ29zX6kFo1bzTq73cCGXt09W9bKfneQdHYd8xcX1f
 wCCGwECf9ldC4svkG6NWFH+WMpokO8c=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-eJBeEBDWP86mx9yZ6ANQqQ-1; Wed, 11 Nov 2020 04:22:21 -0500
X-MC-Unique: eJBeEBDWP86mx9yZ6ANQqQ-1
Received: by mail-yb1-f198.google.com with SMTP id n186so1776831ybg.17
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 01:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mIl0oV0wOao86rk6BkZz9QIfU1buND9UjRnJ6g5uEnM=;
 b=ogewi1KGB0u7qejRXJkx1mj0O3Km9vseNq+c8Uv+K9UGpz9NbbbmE7LRPZ5nSGPArM
 9BGBDsS0Xf/kKe4QJDNIU0+9AKJ4jZiqMDpIKFYliTIWuIsbSh46JCijVVG9Es1zSo+l
 SujK1Xk/y5vqz9Y48K5+sg/iNChK6DC/qN9n4rDxjv8R1hjvXsf6QUDj4Xgcxk6EMJy0
 2PLSWrHNzz4ln/9woAzEvqMm19sccaH0pYVXroYPCCIVgvvjLPnkOeeB2dTHivm0geLf
 DqBlg4qw1q3MF7MoFAX2yPx3/8Ff/DM1aKO5aP60IknMcPb/4qgoJ4gNLYGloETHE21J
 PnJg==
X-Gm-Message-State: AOAM531Hfa8PWZ01Kp9EivXPPgbqSzY7Liu8b5Nzpc3kDCTxDKlXGR54
 C8juNKxFGft2BOs8vS/izEHD8/hLDiUXXDAlNrIzZxGUR48HqPgVIuvi6atkbuIte+KnxtTMLh7
 MqgkrW6kLJ27ZJaVcc22WxoeC6zk=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr30909356ybj.366.1605086541174; 
 Wed, 11 Nov 2020 01:22:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpJ4AjcCqURMiVS8m+f+qskw1cPJoy9qjxaTqFiORK0cbiWYQAdnfiwswbCkGLvuwnpzNbdMOuDslfHoXvfyg=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr30909338ybj.366.1605086540909; 
 Wed, 11 Nov 2020 01:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20201110120035.20543-1-pvorel@suse.cz>
 <20201110134625.GA6482@pevik>
In-Reply-To: <20201110134625.GA6482@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Nov 2020 17:22:09 +0800
Message-ID: <CAEemH2cP8Tub5UjBcRoo2Nkwtku7KjtUYP9U9v75GHEywe=aXw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] travis: Add libefivar support
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
Content-Type: multipart/mixed; boundary="===============1659515699=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1659515699==
Content-Type: multipart/alternative; boundary="0000000000001ae9e805b3d15515"

--0000000000001ae9e805b3d15515
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 10, 2020 at 9:46 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > Travis CI:
> > https://travis-ci.org/github/pevik/ltp/builds/742684375
>
> Looks like Debian does not ship libefivar-dev for ppc64el
> https://travis-ci.org/github/pevik/ltp/jobs/742684377


From Travis CI, the CentOS8 reports miss efivar-devel package too.

Maybe fix it by the following?

--- a/travis/fedora.sh
+++ b/travis/fedora.sh
@@ -9,11 +9,11 @@ yum -y install \
        clang \
        gcc \
        findutils \
-       efivar-devel \
        libtirpc \
        libtirpc-devel \
        pkg-config \
        redhat-lsb-core

-# CentOS 8 doesn't have libmnl-devel
+# CentOS 8 doesn't have libmnl-devel and efivar-devel
 yum -y install libmnl-devel || yum -y install libmnl
+yum -y --skip-broken install efivar-devel

-- 
Regards,
Li Wang

--0000000000001ae9e805b3d15515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 10, 2020 at 9:46 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; Travis CI:<br>
&gt; <a href=3D"https://travis-ci.org/github/pevik/ltp/builds/742684375" re=
l=3D"noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/b=
uilds/742684375</a><br>
<br>
Looks like Debian does not ship libefivar-dev for ppc64el<br>
<a href=3D"https://travis-ci.org/github/pevik/ltp/jobs/742684377" rel=3D"no=
referrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/jobs/742=
684377</a></blockquote><div><br></div><span class=3D"gmail_default" style=
=3D"font-size:small">From Travis CI, t</span>he CentOS8=C2=A0<span class=3D=
"gmail_default" style=3D"font-size:small">reports </span>miss efivar-devel =
package<span class=3D"gmail_default" style=3D"font-size:small"> too</span>.=
</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><div =
class=3D"gmail_default" style=3D"font-size:small">Maybe fix it by the follo=
wing?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">--- a/travis/fedora=
.sh<br>+++ b/travis/fedora.sh<br>@@ -9,11 +9,11 @@ yum -y install \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clang \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 findutils \<br>- =C2=A0 =C2=A0 =C2=A0 efivar-de=
vel \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libtirpc \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libtirpc-devel \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg-config \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 redhat-lsb-core<br>=C2=A0<br>-# CentOS 8 doesn&#39;t h=
ave libmnl-devel<br>+# CentOS 8 doesn&#39;t have libmnl-devel and efivar-de=
vel<br>=C2=A0yum -y install libmnl-devel || yum -y install libmnl<br>+yum -=
y --skip-broken install efivar-devel<br></div><div><br></div></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br=
></div><div>Li Wang<br></div></div></div></div>

--0000000000001ae9e805b3d15515--


--===============1659515699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1659515699==--

