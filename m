Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449B3970A8
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:52:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB5983C8015
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:52:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F2AD3C222C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:52:42 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 59B21600096
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622541160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1ujLu30kBtafrF6Gdxw8p/1sWQeaEmUMwqhvfPUpqw=;
 b=UexfrSj5TAFO21C2hKYBOjV+FVeRvm9/yde38c4FvkW2nt8bvACWxh9qwYIy96U2dzQlXx
 2C/LMq8CPoQ6rMl5LiClZ/wBmRQ6FsCEP7I0+KKoUpHlQ2ENBdDwyBj1reWa7K2xxI8lSf
 9QZaiJNh/ryL9zLG4yuNBEs44SozTNU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-nM26oHsJMtq3xQfuISV-Qw-1; Tue, 01 Jun 2021 05:52:35 -0400
X-MC-Unique: nM26oHsJMtq3xQfuISV-Qw-1
Received: by mail-oo1-f69.google.com with SMTP id
 o1-20020a4adb610000b029020660e40b70so7244417ood.22
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 02:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1ujLu30kBtafrF6Gdxw8p/1sWQeaEmUMwqhvfPUpqw=;
 b=Yvl3sJuw/7qTdcV50Z7IiwtoFbKWo3keQ+gltP4RpkeeKjWhNdeqUEFfsrl3PsYHTV
 ESFx/71My/b5w6r7aQ6zJO6dxTRhYVVfXUGk3o+MuTlmSEsqCcvdgaYEjwrhiUqZMv6D
 m9BbU3oow3nqqMZ93ArrvgNU8muhLgX/hs6L+JacvNi8wx72MfeNxHoFOANi5vIXfwof
 4S02tz4xkWfpyUz6MIAjMnf0KPjGumyD/bmbjiHIfpLKmjtSPfZAey8sI92/voJBYK1e
 Z3S136D5iB6cv8lI+/BBtn9Hx4IcF7KbU6eAKueqTnTDtbFbtj/ilI1OYnEnR/+B5ajz
 3oYA==
X-Gm-Message-State: AOAM533aIZ42d0y1Z69SJBMSz+8VUGEWj4Oj/vR7z+F7pp6BLo0EIWvK
 fwHuj9ECOeon3+IfoHtDxd0fXAPa+kKFQzP5aeFs2yd2RQ4ZtdPXGL/jQ/ZoMBNJH+kjvAGCUQt
 6ol8xgZgbUdNjHL1AwzOSaJ/Orx8=
X-Received: by 2002:a05:6808:1308:: with SMTP id
 y8mr17799722oiv.45.1622541155125; 
 Tue, 01 Jun 2021 02:52:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjY/cJj3t2QyTjp8ET2Hs00rVDSWbX0mH+cKRJKJ7IHGIpj0xSwnRt5IeObp7ePMwpXPTp/CN4qBJl2FxzS5c=
X-Received: by 2002:a05:6808:1308:: with SMTP id
 y8mr17799702oiv.45.1622541154887; 
 Tue, 01 Jun 2021 02:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210531165052.8731-1-pvorel@suse.cz>
In-Reply-To: <20210531165052.8731-1-pvorel@suse.cz>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 1 Jun 2021 11:52:18 +0200
Message-ID: <CAASaF6zQt38sSkA7PDNZL53J7gbOXTCgC54Xbwb6qe=7-_wpWg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] CI: Move from Travis to GitHub Actions
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: multipart/mixed; boundary="===============2008501529=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2008501529==
Content-Type: multipart/alternative; boundary="0000000000002bc28805c3b14dbb"

--0000000000002bc28805c3b14dbb
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 6:51 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> Travis often false positive due "pull rate limit" issue [1],
> thus I decided to finally switch to GitHub Actions.
>
> Also using GitHub native CI allows more advanced features
> (e.g. update wiki with doc/*.txt, nightly build docparser doc).
>
> Whole thing is tested [2].
>
> I rewritten build.sh, added -r step.
> It's ugly, using commands in yaml would be more readable. But I'd prefer
> 1) not writting shell in yaml 2) have build script for local use.
>
> Please comment, test.
>

We should update docs too, but series looks OK, ACK.



>
> Kind regards,
> Petr
>
> [1] https://github.com/linux-test-project/ltp/issues/761
> [2] https://github.com/pevik/ltp/actions/runs/893331703
>
> Petr Vorel (3):
>   build.sh: Rewrite to allow running certain step
>   CI: Rename travis script directory
>   CI: Move from Travis to GitHub Actions
>
>  .github/workflows/ci.yml               | 154 +++++++++++++++++++
>  .travis.yml                            | 131 ----------------
>  build.sh                               | 198 ++++++++++++++-----------
>  {travis => ci}/alpine.sh               |   0
>  {travis => ci}/centos.sh               |   0
>  {travis => ci}/debian.cross-compile.sh |   0
>  {travis => ci}/debian.i386.sh          |   0
>  {travis => ci}/debian.minimal.sh       |   0
>  {travis => ci}/debian.sh               |   0
>  {travis => ci}/fedora.sh               |   0
>  {travis => ci}/opensuse.sh             |   0
>  {travis => ci}/tumbleweed.sh           |   0
>  {travis => ci}/ubuntu.sh               |   0
>  13 files changed, 262 insertions(+), 221 deletions(-)
>  create mode 100644 .github/workflows/ci.yml
>  delete mode 100644 .travis.yml
>  rename {travis => ci}/alpine.sh (100%)
>  rename {travis => ci}/centos.sh (100%)
>  rename {travis => ci}/debian.cross-compile.sh (100%)
>  rename {travis => ci}/debian.i386.sh (100%)
>  rename {travis => ci}/debian.minimal.sh (100%)
>  rename {travis => ci}/debian.sh (100%)
>  rename {travis => ci}/fedora.sh (100%)
>  rename {travis => ci}/opensuse.sh (100%)
>  rename {travis => ci}/tumbleweed.sh (100%)
>  rename {travis => ci}/ubuntu.sh (100%)
>
> --
> 2.31.1
>
>

--0000000000002bc28805c3b14dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 31, 2021 at 6:51 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Travis often false positive due &quot;pull rate limit&quot; issue [1],<br>
thus I decided to finally switch to GitHub Actions.<br>
<br>
Also using GitHub native CI allows more advanced features<br>
(e.g. update wiki with doc/*.txt, nightly build docparser doc).<br>
<br>
Whole thing is tested [2].<br>
<br>
I rewritten build.sh, added -r step.<br>
It&#39;s ugly, using commands in yaml would be more readable. But I&#39;d p=
refer<br>
1) not writting shell in yaml 2) have build script for local use.<br>
<br>
Please comment, test.<br></blockquote><div><br></div><div><div style=3D"fon=
t-family:monospace" class=3D"gmail_default">We should update docs too, but =
series looks OK, ACK.<br></div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://github.com/linux-test-project/ltp/issues/761" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/is=
sues/761</a><br>
[2] <a href=3D"https://github.com/pevik/ltp/actions/runs/893331703" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pevik/ltp/actions/runs/893=
331703</a><br>
<br>
Petr Vorel (3):<br>
=C2=A0 build.sh: Rewrite to allow running certain step<br>
=C2=A0 CI: Rename travis script directory<br>
=C2=A0 CI: Move from Travis to GitHub Actions<br>
<br>
=C2=A0.github/workflows/ci.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 154 +++++++++++++++++++<br>
=C2=A0.travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 131 ----------------<br>
=C2=A0build.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 198 ++++++++++++++---=
--------<br>
=C2=A0{travis =3D&gt; ci}/alpine.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/centos.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/<a href=3D"http://debian.cross-compile.sh" rel=3D=
"noreferrer" target=3D"_blank">debian.cross-compile.sh</a> |=C2=A0 =C2=A00<=
br>
=C2=A0{travis =3D&gt; ci}/<a href=3D"http://debian.i386.sh" rel=3D"noreferr=
er" target=3D"_blank">debian.i386.sh</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/<a href=3D"http://debian.minimal.sh" rel=3D"noref=
errer" target=3D"_blank">debian.minimal.sh</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/debian.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/fedora.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/opensuse.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/tumbleweed.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A00<br>
=C2=A0{travis =3D&gt; ci}/ubuntu.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A013 files changed, 262 insertions(+), 221 deletions(-)<br>
=C2=A0create mode 100644 .github/workflows/ci.yml<br>
=C2=A0delete mode 100644 .travis.yml<br>
=C2=A0rename {travis =3D&gt; ci}/alpine.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/centos.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/<a href=3D"http://debian.cross-compile.sh"=
 rel=3D"noreferrer" target=3D"_blank">debian.cross-compile.sh</a> (100%)<br=
>
=C2=A0rename {travis =3D&gt; ci}/<a href=3D"http://debian.i386.sh" rel=3D"n=
oreferrer" target=3D"_blank">debian.i386.sh</a> (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/<a href=3D"http://debian.minimal.sh" rel=
=3D"noreferrer" target=3D"_blank">debian.minimal.sh</a> (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/debian.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/fedora.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/opensuse.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/tumbleweed.sh (100%)<br>
=C2=A0rename {travis =3D&gt; ci}/ubuntu.sh (100%)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000002bc28805c3b14dbb--


--===============2008501529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2008501529==--

