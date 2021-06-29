Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DC3B70C5
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:32:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0397D3C6CC0
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B7803C1CC3
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:32:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4D6B5200AE5
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:32:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624962748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WazY5ls3qJSa9mhBAlhgoPq0ggcD3QzgqqwEgy65lfA=;
 b=UWPaZU7UGlJemCiNeFRGOWv4sL6OcRTWbQrN5wKkGNa17NkDky0ldP0phGA/Dci2wrsP0m
 CIVRcz3rus5H87qIVdqeFeee2jLx33J+V50N3NB/q3WXqRyFj8ouIz+9+iLviSXkkI5JAD
 KHr4N2GR89+V9B5JrR31GbS9+3eDmI4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-JKMsNjIpPBqKGR1jiQkhBw-1; Tue, 29 Jun 2021 06:32:22 -0400
X-MC-Unique: JKMsNjIpPBqKGR1jiQkhBw-1
Received: by mail-yb1-f197.google.com with SMTP id
 g3-20020a256b030000b0290551bbd99700so20415052ybc.6
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WazY5ls3qJSa9mhBAlhgoPq0ggcD3QzgqqwEgy65lfA=;
 b=ieHJ316ipqwtNZcSOhqd0Dsu2jvRvFRGgLMle/QasQs4sz3IWW5mKQexdiWdVQyaVT
 pvqRNV9tcI009uNwaA2CxmOD67lVEphOE/pJP52wlugF/Iz0zhUcn9ApS2Lq1t5DeDzm
 DoN2Jnfx+3TCQhiVuvRP2cKdNLqn8qTiTdD8f4bsH5QyKZqVgxEIm2LhGMDMzLeQvLzZ
 4/exFqWUUpfESB/+uOpIi4X8hWu4/YDGMJpCAVSXcZ6PueVG5lkmnti+S6YHNlbBH7+E
 Ik8VanI6ddmUI/AP9QKdTI9Yu6L/KbKkT2XSgtwn0hBDpVW+gwuT7G/4hv1/1i2MSZ9x
 WlJA==
X-Gm-Message-State: AOAM530hgsyieV4RFL1+Sk6UbVIv7onijgvnwiKk2FjL3Kev3HaWKhVO
 +1lwDJe1BwdnfJB0xWM9R73SRJPe3jFZwpD2ur6lvzvZvVnwdNthwftBq01dQggAm8Oad5MG/wH
 gJyNzyIFfMA3RPZVYMSNnrwS3KGE=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr37321811ybc.252.1624962742429; 
 Tue, 29 Jun 2021 03:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWTt1yUZGeQbZBbgYhOpzinEUKy4QKHMKJ4liSkvXrxr6jrm3ERyJX9aZWThjSytUX0Z/+j/q7mJns/tDc6dE=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr37321793ybc.252.1624962742295; 
 Tue, 29 Jun 2021 03:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210629065836.20932-1-pvorel@suse.cz> <YNrFdXeCRXUko2Ua@pevik>
In-Reply-To: <YNrFdXeCRXUko2Ua@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Jun 2021 18:32:10 +0800
Message-ID: <CAEemH2dTEC9QNhs4JZtiR33U9m=nyfQOiZ2u=DrMrXkVvcrRDw@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH 1/1] delete_module0{1,
 3}: Skip when kernel is locked down
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
Cc: Anton Smorodskyi <asmorodskyi@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1265877585=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1265877585==
Content-Type: multipart/alternative; boundary="0000000000000734b805c5e51fa8"

--0000000000000734b805c5e51fa8
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 3:02 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > Lockdown requires signed modules, otherwise tests fails with EPERM.
> > TCONF until we solve signing modules in LTP build.
> BTW up now only 4 tests are using tst_lockdown_enabled() check, but maybe
> it's a
> time to add flag .skip_on_lockdown, as docparse would benefit from it.
>

Make sense!

Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000000734b805c5e51fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 3:02 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; Lockdown requires signed modules, otherwise tests fails with EPERM.<br=
>
&gt; TCONF until we solve signing modules in LTP build.<br>
BTW up now only 4 tests are using tst_lockdown_enabled() check, but maybe i=
t&#39;s a<br>
time to add flag .skip_on_lockdown, as docparse would benefit from it.<br><=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Make sense!</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Acked-=
by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&=
gt;</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--0000000000000734b805c5e51fa8--


--===============1265877585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1265877585==--

