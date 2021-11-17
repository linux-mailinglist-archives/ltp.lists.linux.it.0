Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF0454738
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 14:28:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5EE53C880B
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 14:28:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 81E133C79C6
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 14:28:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B499F601016
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 14:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637155726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6zsRKoKazIlqeh1sGgnALSGcm19uGEoPin490ONLTb0=;
 b=OZyOOb4pOHY2NaeqUnfFZ9f9Bbq6pedPoCIAn2GFqbAN9QgJjyUbZ4UIqLVzzybmV+GMWL
 LfeRDP8Sez81nIslVx8QeVnin3pmdwI4BGppzrIws2NUgxJrGReFvxncztfv2iv9406/6l
 q8g/zvjK5Qlo8+IJy+YHjW7BswC3Rcc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-goB14UIyM9q87AjjuS7tgQ-1; Wed, 17 Nov 2021 08:28:43 -0500
X-MC-Unique: goB14UIyM9q87AjjuS7tgQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 t24-20020a252d18000000b005c225ae9e16so3967917ybt.15
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 05:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6zsRKoKazIlqeh1sGgnALSGcm19uGEoPin490ONLTb0=;
 b=z11rusu7e+3UUwDlreluOzQCA6seR/0Ku3uxZuPttMWt+TQNkdZwrJBpqBysVq805Q
 xBSwFfauPoOMyQfZ+h6yA38aUvnMpgJFkN0kCdWA/sW9b2/d6pJLVCP56UI9VREMbrVM
 sZNCyC08j+xKS5Vfjrp7Bg9Eaz+s4q7FAh35tFAD7npoLArEGRI5juA1yVistgjQVyRi
 DnS4DDwEgTTrYF1xv/FvTPxCW3tt0rM93msw5GBAAkwfDK6rxTM9GmOpZAeKRmzsXPcZ
 nGP+X/KYM8nwZRL9DMd9KwZPJcyzq2PxzyEAZqfpfo1etkFjOkHjYwQnL8CTaPb61RQp
 y+vQ==
X-Gm-Message-State: AOAM530LD1jO4ISbZTuiEowvrBtHzgDtBV3y7zU69Cbnl2AJubSqB1tL
 vYMhJhzmKlA6wzbl/zA5ItcWuWGXx2vSHP3JiTDal9NIH1Buwo2N6MWmmkxJ0Xtx07VFgevzRTv
 4/s8//lK2QlXlAm+kzs1RZjIjQgA=
X-Received: by 2002:a25:e704:: with SMTP id e4mr17372819ybh.490.1637155723002; 
 Wed, 17 Nov 2021 05:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsvTPDh8InAChYYssxHxBVEobBadT9z9DMDPIbUMB4vkWC66nXrvwtoVNsLM2UbDyiIy0SGDUBAGWAYjKZZio=
X-Received: by 2002:a25:e704:: with SMTP id e4mr17372788ybh.490.1637155722770; 
 Wed, 17 Nov 2021 05:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20211117070708.2174932-1-liwang@redhat.com>
 <20211117070708.2174932-3-liwang@redhat.com>
 <87v90r9idn.fsf@suse.de>
In-Reply-To: <87v90r9idn.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Nov 2021 21:28:30 +0800
Message-ID: <CAEemH2cXOBqOObhWAoqeS4Xk5MVXyFMfmS79pxqfXJbd+TW8Qg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] max_map_count: replace ifdefs by tst_arch
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
Content-Type: multipart/mixed; boundary="===============1392927382=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1392927382==
Content-Type: multipart/alternative; boundary="0000000000004c53ee05d0fc0554"

--0000000000004c53ee05d0fc0554
Content-Type: text/plain; charset="UTF-8"

Hi Richard,



> > +     case TST_IA64:
> > +             /* On ia64, the vdso is not a proper mapping */
> > +             if (!strcmp(buf, "[vdso]"))
> > +                     return true;
> > +             break;
> > +     case TST_ARM:
> > +             /* Skip it when run it in aarch64 */
>
> This should not be possible. If TST_ARM is set then how can we be on
> aarch64? We also have TST_AARCH64.
>

Not exactly, I was thinking like this before, but as Cyril point that there
is
a possible 32bit ARM binary runs on 64bit aarch64 kernel.

https://lists.linux.it/pipermail/ltp/2021-November/025925.html


-- 
Regards,
Li Wang

--0000000000004c53ee05d0fc0554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Hi Richard,</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0case TST_IA64:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* On ia64, the vdso =
is not a proper mapping */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(buf, &quo=
t;[vdso]&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case TST_ARM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip it when run i=
t in aarch64 */<br>
<br>
This should not be possible. If TST_ARM is set then how can we be on<br>
aarch64? We also have TST_AARCH64.<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">Not exactly,=C2=A0I was =
thinking=C2=A0like=C2=A0this before, but as Cyril point that there is</div>=
<div class=3D"gmail_default" style=3D"font-size:small">a possible 32bit ARM=
 binary runs on 64bit=C2=A0aarch64 kernel.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small"><a href=3D"https://lists.linux.it/pipermail/ltp/2021-Nove=
mber/025925.html">https://lists.linux.it/pipermail/ltp/2021-November/025925=
.html</a></div><br></div></div><div><br></div>-- <br><div dir=3D"ltr"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004c53ee05d0fc0554--


--===============1392927382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1392927382==--

