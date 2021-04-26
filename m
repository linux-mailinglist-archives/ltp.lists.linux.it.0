Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A008936B209
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:03:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C86D23C6759
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:03:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1D263C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:03:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E0B7520097E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619434999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o6tEy9g4EEL6ArOjm4/Y4c/MB2nLvJ/+9LLfsgZY8pM=;
 b=WdZGZ5BHb+/FlG36taLY4cyvB0KEiTFaMRkLXdtj5C6dnrMkI08IlfECBgaLx0npGGCTz7
 6tsqCncOvlGE+zYqSPgFNz/WUsOMijDlRhZg+815zzlUl2e8M1CiTnnCuuUjF1LlsXS3aj
 6Q3YXSc+NOstP+AqgrhSAW8pdbKdoYg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-WKqqVVCEO2iV4sRid5NCwg-1; Mon, 26 Apr 2021 07:03:15 -0400
X-MC-Unique: WKqqVVCEO2iV4sRid5NCwg-1
Received: by mail-yb1-f197.google.com with SMTP id
 u7-20020a259b470000b02904dca50820c2so33347538ybo.11
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 04:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6tEy9g4EEL6ArOjm4/Y4c/MB2nLvJ/+9LLfsgZY8pM=;
 b=qtO/jgxwFZYrqtzjIz9P8uPWWHmxyQY7EANkBEedWUyRR1jkGGINIKgJJb9iL8ubK+
 AgtCySkBt6NoS0uqrES+xS6/XyyGfaLNjfc3HkvtRrHPsw6iL5fIEp71GhnK+3KNmWgl
 qU/3VAboRsRn9Kfy87oBvXvecXWd0H/bdATNcs2yfWtec3kMoFUqpzBkOzGi61SrDuY3
 kqhtkCSBW95rUMMcX99U8ypD/qZ7aU2TbbeZphEPqXgSYdpX4yTe7QNAvGL+/z9MFwMc
 31ScWm0kcdqGdhL/v0tHXrL45dQ9cCXCEluj9dOpdbf8FQ0g2aUArbcIwdeU//UY7Xc9
 iKnw==
X-Gm-Message-State: AOAM532ZD0HaSMQ6JKbSMQFA9ajuIiuGWnt7eM2AX7yjIsyWap3vhwWO
 tv3kfkcsptMligBDhEXZ+ORsdMtbWo025CpNvknl5p2LZkk28de0Zx7nGPFsqPDQ2Nb5zFuVXKV
 mXGt1IGPWuK8foyqLSUGw2HM8+E8=
X-Received: by 2002:a25:c0cb:: with SMTP id
 c194mr23885729ybf.252.1619434994664; 
 Mon, 26 Apr 2021 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtfhvxNmpbAErfAcokLkfYZCTFM+yFK9rZHesxlfu4UpDLZdM4Udh3CG0sq1XeLvFyLKxE78YqsJB/5Fmu4F8=
X-Received: by 2002:a25:c0cb:: with SMTP id
 c194mr23885701ybf.252.1619434994365; 
 Mon, 26 Apr 2021 04:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <YH7Z8nOX90qjsMpa@yuki>
In-Reply-To: <YH7Z8nOX90qjsMpa@yuki>
From: Li Wang <liwang@redhat.com>
Date: Mon, 26 Apr 2021 19:03:02 +0800
Message-ID: <CAEemH2cWeKBGcntjHQco39sZd0qXNxmgheunj__Y1kqxhfmyNA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,HTML_OBFUSCATE_05_10,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] runltp-ng and possible ltp-pan deprecation
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
Content-Type: multipart/mixed; boundary="===============0743519843=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0743519843==
Content-Type: multipart/alternative; boundary="00000000000093944305c0de1759"

--00000000000093944305c0de1759
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

Cyril Hrubis <chrubis@suse.cz> wrote:

>
> Hi!
> As you may have know some time ago I have started to work on runltp-ng a
> script to replace runltp and ltp-pan.
>
> The new executor is different in several key aspects, for example:
>
> - it can and is supposed to run on a different machine from the system
>   under test (although it still supports running on the same machine)
>
> - there are different backends, it can run tests locally, over ssh, or
>   start a VM with qemu
>
> - produces different output formats currently html or json
>

Very nice features. Thanks!

>
> Also there are two different options how to do that. Either we put it
> into runltp-ng directory to the LTP git root or we may as well create a
> separate repository under the linux-test-project and make it a ltp git
> submodule. Any preferencies to that?
>

I prefer the LTP git root as well.

Btw, I opened a PR for some tiny issues fixing, plz help review.
https://github.com/metan-ucw/runltp-ng/pull/28

-- 
Regards,
Li Wang

--00000000000093944305c0de1759
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cyril,<br><br><div>Cyril Hrubis &lt;<a href=3D"mailto:c=
hrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:</div><div>=
<br>&gt;<br>&gt; Hi!<br>&gt; As you may have know some time ago I have star=
ted to work on runltp-ng a<br>&gt; script to replace runltp and ltp-pan.<br=
>&gt;<br>&gt; The new executor is different in several key aspects, for exa=
mple:<br>&gt;<br>&gt; - it can and is supposed to run on a different machin=
e from the system<br>&gt; =C2=A0 under test (although it still supports run=
ning on the same machine)<br>&gt;<br>&gt; - there are different backends, i=
t can run tests locally, over ssh, or<br>&gt; =C2=A0 start a VM with qemu<b=
r>&gt;<br>&gt; - produces different output formats currently html or json<b=
r>&gt;<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Very nice features. Thanks!</div></div><div><br>&gt;<br>&gt; Also the=
re are two different options how to do that. Either we put it<br>&gt; into =
runltp-ng directory to the LTP git root or we may as well create a<br>&gt; =
separate repository under the linux-test-project and make it a ltp git<br>&=
gt; submodule. Any preferencies to that?<br>&gt;<br><br><div class=3D"gmail=
_default" style=3D"font-size:small"></div>I prefer the LTP git root as well=
.<br><br>Btw, I open<span class=3D"gmail_default" style=3D"font-size:small"=
>ed</span> a <span class=3D"gmail_default" style=3D"font-size:small">PR</sp=
an>=C2=A0for some tiny issues fixing, <span class=3D"gmail_default" style=
=3D"font-size:small">plz</span>=C2=A0<span class=3D"gmail_default" style=3D=
"font-size:small">help</span>=C2=A0<span class=3D"gmail_default" style=3D"f=
ont-size:small">review.</span></div><div><a href=3D"https://github.com/meta=
n-ucw/runltp-ng/pull/28" target=3D"_blank">https://github.com/metan-ucw/run=
ltp-ng/pull/28</a><br><br>-- <br>Regards,<br>Li Wang</div></div></div>

--00000000000093944305c0de1759--


--===============0743519843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0743519843==--

