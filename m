Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB93B6F18
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 10:12:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1346C3C8D7C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 10:12:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A02093C1A2B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:12:24 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 919E31A001FC
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624954342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ImTRW153CP11UMr4zGvHq2k52eXo5AhINX19c/L6aJg=;
 b=KhbDFn/3hn3y38bUvlVUY4DtLX8bVdSQxuaKcaGIn1KflUJlfBSdh3qa9mhMjRL20wsbjY
 DWjYHI2Dw36yV404zjloDrfpy2GIMlKHwUwnEjRGQZwWOksuA/FQd0H7fZvhEX4YaEckng
 MW7JcNy3VhPLmJxf0Maq0iqjZGwRejk=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-KBnAeBJFN26NzlQRejmelg-1; Tue, 29 Jun 2021 04:12:18 -0400
X-MC-Unique: KBnAeBJFN26NzlQRejmelg-1
Received: by mail-ot1-f72.google.com with SMTP id
 e16-20020a0568302010b02903feaaa5cf10so14918012otp.8
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImTRW153CP11UMr4zGvHq2k52eXo5AhINX19c/L6aJg=;
 b=qIWAIij3BAaNSPfyI+Gk/zlDg7d08gRngvQ0ByaPolajg7BG2IsqYD09XNxkYMCiJx
 yFfIXbIfnkQFFVixef5kQob607peVBn7D1mEBjumyFsU/9PV/PmFSMMzbzlY+YJsHr3G
 2tuJGTFb/vNXN/KptwPY2XRcccnKB+X0RYLlrmc8t8Q+k+CW4RnHrqJriCjzY/EtO573
 09u4J1KpCeFoJMIMFGC4WhTDnGjGuw+KdYGW4/HA5qPZHFkYpC6NYLVObbEsJQgoVdfP
 RpemNsU67QG2xHMmPZMEtFCcoCdQp0rRiOf5zkHM224B659Y4GgFg/nRWvJ5AGlP8TqU
 SSUw==
X-Gm-Message-State: AOAM530l4h5Q0Xm1T5iG6FECLMEQjd1mr2XgaEodmr+PsallAWn1eFiF
 ci0+f+By6F5zDacZCj97ccSQONeKQzye6UYz/AUc7LrS34Fp8UTXlcBI7X0IeRERE9mzHsvYQTV
 E4d1mj9YhDp4ATltGrm8a6A9iWXc=
X-Received: by 2002:a05:6830:33e3:: with SMTP id
 i3mr3436252otu.47.1624954337400; 
 Tue, 29 Jun 2021 01:12:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygVV/em7OSIVtbFKSImCFkFFLjh+ZFKmwMsjAI2zMOsGIGhPlMtwn39jC4RQIv7SlqGwvzF+NhFEiH27LyJBg=
X-Received: by 2002:a05:6830:33e3:: with SMTP id
 i3mr3436232otu.47.1624954337048; 
 Tue, 29 Jun 2021 01:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210629065836.20932-1-pvorel@suse.cz> <YNrFdXeCRXUko2Ua@pevik>
In-Reply-To: <YNrFdXeCRXUko2Ua@pevik>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Jun 2021 10:12:00 +0200
Message-ID: <CAASaF6wVbZ8GT549y3RXiTrXi3mwtFVK=-=RWtyJOK+1TasJCg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: Anton Smorodskyi <asmorodskyi@suse.com>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0255938210=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0255938210==
Content-Type: multipart/alternative; boundary="00000000000009535005c5e32a29"

--00000000000009535005c5e32a29
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 9:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > Lockdown requires signed modules, otherwise tests fails with EPERM.
> > TCONF until we solve signing modules in LTP build.
>

Acked-by: Jan Stancek <jstancek@redhat.com>


> BTW up now only 4 tests are using tst_lockdown_enabled() check, but maybe
> it's a
> time to add flag .skip_on_lockdown, as docparse would benefit from it.
>

I guess we'll find more over time.


>
> Kind regards,
> Petr
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--00000000000009535005c5e32a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 9:02 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; Lockdown requires signed modules, otherwise tests fails with EPERM.<br=
>
&gt; TCONF until we solve signing modules in LTP build.<br></blockquote><di=
v><br></div><div><div style=3D"font-family:monospace" class=3D"gmail_defaul=
t">Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com">jstance=
k@redhat.com</a>&gt;<br></div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
BTW up now only 4 tests are using tst_lockdown_enabled() check, but maybe i=
t&#39;s a<br>
time to add flag .skip_on_lockdown, as docparse would benefit from it.<br><=
/blockquote><div><br></div><div><div style=3D"font-family:monospace" class=
=3D"gmail_default">I guess we&#39;ll find more over time.<br></div></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div></div>

--00000000000009535005c5e32a29--


--===============0255938210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0255938210==--

