Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB53C141B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:18:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D75B63C7930
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 15:18:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8568F3C149E
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:17:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8112C200E06
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 15:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625750276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YaP7ax2Xk77imNE2RpTWnkd+ZZ4pzRdMLixV5jkZtyo=;
 b=WEV3NHOuaBfXKtnM46u+K6G71ca8TF4B6oOqbYv7IDIrYReViwdQXHQmwwIQCfHoPF+9Tu
 8w0XEQLs59A5/HXJrgXdQTqXRY2qmRrT39nqptI8VfEjJHM9423w9x8NccjFZbXKXFhDZY
 O7OiY1YdftuWfADzIlIscSXSQ0kwGzY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-KuSyUGPHNgGDbOAsOe9-EA-1; Thu, 08 Jul 2021 09:17:54 -0400
X-MC-Unique: KuSyUGPHNgGDbOAsOe9-EA-1
Received: by mail-yb1-f198.google.com with SMTP id
 l16-20020a25cc100000b0290558245b7eabso6903238ybf.10
 for <ltp@lists.linux.it>; Thu, 08 Jul 2021 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaP7ax2Xk77imNE2RpTWnkd+ZZ4pzRdMLixV5jkZtyo=;
 b=mPAKLN+iSE/tCyP84T+gKKFnHQGUOgMVw1qBwmnvkC5EGJs9FpYqQQNhNsqxX2nEgM
 tKU+6BSJp5DmrA465Mku0AlWy7Ljqn01tM+BOjNPwzmAbPYSjkQWuKdu1R59V/pkODt1
 otd3/2ARdUacrHgawder7uBLgl+EqH8rmOzntEFSypmYMPeuimT0cg1uGM1XJTkJJ8Nb
 1szPf+xGVP6SXC7xTQw9KJtZC30GQwABmKbl0vNq1yU6qw2+I9tS5R5wVuhqUxacVRpd
 kJMSKKJ+dK23MtRm4h/7EcpqgIH88JQsgNSKNWBWap2rybV7+Af3mnrxA0xgIa2KFzXb
 n6Kg==
X-Gm-Message-State: AOAM532JScq5YrXBG/bnWmd6r2CsKKmEfxJccV9p4u/F9ew+NhrwFC4a
 zO8pT/hoeQnHv2uPYrZYbfV3zf1wDC4Nm5Er+Ak5E68VCpeReurpCihQDfkeWOeBB+LKSoyvTCN
 o8r4CpmppkojpdeJscF7Uz/1UGaw=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr687286ybc.86.1625750273749;
 Thu, 08 Jul 2021 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd+8n+E8f7oRbt7XtAu1Kt/4w0usvLplezCMf+BlfiDJw6UOTitpCbovjDMkl73ItJbYca97c9z5q6WWxE9B0=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr687265ybc.86.1625750273585;
 Thu, 08 Jul 2021 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210708080720.18997-1-xieziyao@huawei.com>
 <CAEemH2cTBd45n9F5Db+Xc3ZE0R8GyLVa1AVsgbEPYFB+2hVV5Q@mail.gmail.com>
 <16e18b1d-93c7-9885-9485-c2d08c17c02d@huawei.com> <YOboa9GY1eL+HR99@yuki>
In-Reply-To: <YOboa9GY1eL+HR99@yuki>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 21:17:41 +0800
Message-ID: <CAEemH2c7jk0C7DGkbeb_99ysCzQr-5bn1NDb0y9LXHdR56vqOQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH] gethostid: Rewrite with newlib and use/test
 sethostid
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
Content-Type: multipart/mixed; boundary="===============0609402067=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0609402067==
Content-Type: multipart/alternative; boundary="0000000000008d0e7405c69c7bcf"

--0000000000008d0e7405c69c7bcf
Content-Type: text/plain; charset="UTF-8"

Hi Cyril, Ziyao,

Thanks for catching the failure, I have posted a new patch fixing that.
And sorry for my negligence in code pushing.

On Thu, Jul 8, 2021 at 8:24 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > I made some refine and pushed, thanks!
> > Thanks for your review. Besides, I noticed the CI fails to be compiled
> > on Apine. The difference appears to be caused by the underlying libc
> > implementation: glibc and Alpine's musl-libc.
> >
> > Is there anything that needs to be modified for this patch? Or simply
> > ignore it in the CI script.
>
> This has to be fixed, the whole point of the CI is to catch build
> failures on different libc/compiler combinations.
>
> Looking at musl the sethostid() is not implemented at all, so I guess
> that the correct solution here would be adding a configure check for
> sethostid() and skip the whole test if it's not available.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

-- 
Regards,
Li Wang

--0000000000008d0e7405c69c7bcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Cyril, Ziyao,</div></div><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Thanks for catching the fail=
ure, I have posted a new patch fixing that.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">And sorry for my negligence in code pushing.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Jul 8, 2021 at 8:24 PM Cyril Hrubis &lt;<a href=3D"mailto:chrub=
is@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi!<br>
&gt; &gt; I made some refine and pushed, thanks!<br>
&gt; Thanks for your review. Besides, I noticed the CI fails to be compiled=
 <br>
&gt; on Apine. The difference appears to be caused by the underlying libc <=
br>
&gt; implementation: glibc and Alpine&#39;s musl-libc.<br>
&gt; <br>
&gt; Is there anything that needs to be modified for this patch? Or simply =
<br>
&gt; ignore it in the CI script.<br>
<br>
This has to be fixed, the whole point of the CI is to catch build<br>
failures on different libc/compiler combinations.<br>
<br>
Looking at musl the sethostid() is not implemented at all, so I guess<br>
that the correct solution here would be adding a configure check for<br>
sethostid() and skip the whole test if it&#39;s not available.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000008d0e7405c69c7bcf--


--===============0609402067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0609402067==--

