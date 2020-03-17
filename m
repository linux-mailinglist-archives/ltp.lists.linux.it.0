Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EEA187C13
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:32:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54D4D3C55CA
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:32:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BE60F3C0BA3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:32:31 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id EAFFA140186B
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584437549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jUxLvEA4166uFVwPBRHAnhavQ+h3H5nff6qjNO9/KpM=;
 b=Ep4pR+R0jHVhKaSU2iZqK0edJoi1Y3cQaNGzV52nn3rVLmZAOuZS9kwL2PNrSQ+RYO5Ld4
 T1amw5sRTOu9WAJq6Q9RFhaIzByM5ltwWUJURraNC8rn1yUB8QFAWuBmgs0VADvlQDxezT
 Igb7JJsgZkmrz2sC6pCdHiOgbugLSiY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-KPdT8OuFNEuTOmr7EaZUNQ-1; Tue, 17 Mar 2020 05:32:27 -0400
X-MC-Unique: KPdT8OuFNEuTOmr7EaZUNQ-1
Received: by mail-oi1-f199.google.com with SMTP id t12so12764929oih.4
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 02:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRGw3kr/RgaQJseJznAPVFWCiNtEHf5z6aJEj0CMzuk=;
 b=qtMMFiWK2Jfg07wFCst8JgaXdU7iTtf4m/vHCbFB18NB8APcILE7D3NtmEXLSQHxyD
 WkPBZ1X3s/HptBiSqytNHJkOLvYGPSwLDSI8xStA65hWwN1Q2j4twPINhiMdeGBl29IY
 O4/Hu8yk2vi+Kh+GJu3o0rFaCru4c4wrJ21iqrCobJLN3xCbDXN+8t0PJ8mwLT7ci/pD
 aOgxP902cVp6PvErEJnXRwP6gEd6HluhsuJVCwxrJJF8JcKnKjQZVJP2G534NT+AfiFV
 Rd4843QiFWSdv97DovjHodk79KJwd4XuAhHS6/Wj1mAjvdD+G18CoHcmxX5DkPGrbFvD
 qw1Q==
X-Gm-Message-State: ANhLgQ096vlH6zvRxIKccKqeeM+kZkcNOw7uCu2ATWEuOY4B/Ti9wS5e
 Jv3krYdPLcDSvwuz8FzjP1vVJZz5zTZMKMFop3c9wEhf0YFGQWWvZ2ilISGxkCWvV0Pa8cITWDt
 Q6yBoVMsjHuwFkMe8Ez7nfYDcfC8=
X-Received: by 2002:aca:f591:: with SMTP id t139mr2600989oih.153.1584437546311; 
 Tue, 17 Mar 2020 02:32:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvYLJXF9hTvy2/3fhLLn+TLgV7VNWfi7prtbyGItfbF1aXdoLw+M/43nuD70/5aDB+RgWHcHYZaWujYVcgXHJM=
X-Received: by 2002:aca:f591:: with SMTP id t139mr2600980oih.153.1584437546138; 
 Tue, 17 Mar 2020 02:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
 <0b85e10e-480f-f91a-0ce2-dc3a51cd2319@cn.fujitsu.com>
In-Reply-To: <0b85e10e-480f-f91a-0ce2-dc3a51cd2319@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 17:32:14 +0800
Message-ID: <CAEemH2d7gEm+a91QbUVB2gccRf=dZaG_R1Uc7v_TQEVD7Q+StA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Fix compilation issues
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
Cc: Zou Wei <zou_wei@huawei.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0526682904=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0526682904==
Content-Type: multipart/alternative; boundary="0000000000001b574205a1099d68"

--0000000000001b574205a1099d68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 5:08 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Zou
>
>
> > Fix compilation issues:
> > 1. Add the '-lpthread -lrt -lm' config into LDFLAGS
> See ltp/openposix/build[1] documention, as below:
>
> ----------------------------
> If you need to pass in any header locations, preprocessor definitions, et=
c,
>    set the value via CFLAGS.
> - If you need to pass in any libraries for linking, set the value via
> LDLIBS.
> - If you need to pass any other values to the linker, set the value via
> LDFLAGS.
> ----------------------------
>
> I guess we should use LDLIBS.
>

Xu is right, I misread these two words(LDLIBS vs LDFLAGS) during my
reviewing.

--=20
Regards,
Li Wang

--0000000000001b574205a1099d68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 5:08 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Zou=
<br>
<br>
<br>
&gt; Fix compilation issues:<br>
&gt; 1. Add the &#39;-lpthread -lrt -lm&#39; config into LDFLAGS<br>
See ltp/openposix/build[1] documention, as below:<br>
<br>
----------------------------<br>
If you need to pass in any header locations, preprocessor definitions, etc,=
<br>
=C2=A0 =C2=A0set the value via CFLAGS.<br>
- If you need to pass in any libraries for linking, set the value via <br>
LDLIBS.<br>
- If you need to pass any other values to the linker, set the value via <br=
>
LDFLAGS.<br>
----------------------------<br>
<br>
I guess we should use LDLIBS.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Xu is right, I misread these =
two words(LDLIBS vs LDFLAGS) during my reviewing.</div></div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001b574205a1099d68--


--===============0526682904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0526682904==--

