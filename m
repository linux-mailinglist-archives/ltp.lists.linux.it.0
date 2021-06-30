Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B69593B7F05
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:30:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87A6D3C6C51
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:30:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7A763C2310
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:30:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83AD6200C1C
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625041819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSsELy6bht/t1+DL8NNz8UAqO2tqDXvbLBc6VlfUvdI=;
 b=acjul1q+Qj78Tyfwbd18YlDeU9MI2eiEFzCdPg3/uT4xbDqUPwrqXDt/04jAmoUHt+2ZIT
 vXhgU9MYbbS5CXCq3w1roIVCIWGO6eOSGrFkARIPBOYlAJiqA+xRIwdVDVT6f8jr+xH2eP
 h6loQFx1h5OXBtRSpcm4fnO4VmOEVRo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-ddENswBAM1m6IHZ9fo9Cow-1; Wed, 30 Jun 2021 04:30:16 -0400
X-MC-Unique: ddENswBAM1m6IHZ9fo9Cow-1
Received: by mail-yb1-f199.google.com with SMTP id
 q10-20020a056902150ab02905592911c932so2871953ybu.15
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 01:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eSsELy6bht/t1+DL8NNz8UAqO2tqDXvbLBc6VlfUvdI=;
 b=p3OMFtq5kvDxBoufMyoyCeCaLwGverRysC2E8e7TJUhsyWI80V+jHbJEn+vWIlPeJS
 ty/5IFH7e6/tNQEkI1WmNh6iOWktw3D8zgOyGvpRY0tACWDZJSrrtbyPon3kMEqWuIaW
 YcR05KkPGzSxR0pwocqbX2/AgCZme3fSKU3axAlgGW+EB4Lzxlz9DqcjHV8+9/nAakhk
 5paII0G97oqKw87DB7jqTGnbe0PSt/c0dKLLOXKyBL1j41kh9rIYx+VSzwohR0jMyFHp
 32dyVrLLFUCk6GwhW7L8QEOhzEfxz3z/BZK99I//HI8JUxpUdFWAHW/xLIms7FTnFZgr
 z/Vg==
X-Gm-Message-State: AOAM533S8ul4JwCHYMOf9PDqLXQQvWZEaDT+ppFAhdLkwFErZmyo9e2r
 NiPEZhe4pt4QnZYI5kNBSkbS08f5PYNB899CaFOTGrtXC+EnLXY+rJXjdxzWcTAPrWHZJexOKYs
 NqBb9UD/tOr9SxxssofgKBcs+VOU=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr17155215ybi.366.1625041815659; 
 Wed, 30 Jun 2021 01:30:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFxlUwJrXgEs3jrxm3M3FbC171li266c6MWGwSZfn7/gB71fzrKaMoqjWOoTBJHA8+hDCCcz7Q8JWI8Qj+BXA=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr17155207ybi.366.1625041815506; 
 Wed, 30 Jun 2021 01:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210628115740.5da3dbfda1c263f95d66c77a@uniontech.com>
 <CAEemH2cMAEuf_Qx-UE8LFX_1zB6N=p=RzJUXr2+tLAFLHuqg9A@mail.gmail.com>
 <1292921202.339978.1625040966427.JavaMail.xmail@bj-wm-cp-8>
In-Reply-To: <1292921202.339978.1625040966427.JavaMail.xmail@bj-wm-cp-8>
From: Li Wang <liwang@redhat.com>
Date: Wed, 30 Jun 2021 16:30:03 +0800
Message-ID: <CAEemH2fQNwP3eRsUMmsHiZfad48ZLvsLPNMWfNS=8xTeWi_Q0g@mail.gmail.com>
To: =?UTF-8?B?6Iuf5rWp?= <gouhao@uniontech.com>
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
Subject: Re: [LTP] 
	=?utf-8?q?=5BPATCH=5D_fix_cpuhotplug04_check_last_cpu_erro?=
	=?utf-8?q?r=E3=80=90Suspected_phishing_email=2C_please_pay_attenti?=
	=?utf-8?q?on_to_password_security=E3=80=91?=
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
Cc: weidong <weidong@uniontech.com>, jiaofenfang <jiaofenfang@uniontech.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1429289282=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1429289282==
Content-Type: multipart/alternative; boundary="00000000000028a15e05c5f7881a"

--00000000000028a15e05c5f7881a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hao,

On Wed, Jun 30, 2021 at 4:16 PM =E8=8B=9F=E6=B5=A9 <gouhao@uniontech.com> w=
rote:

>
>
> Hi LiWang:
>
>
> you are right.
>
>
> I asked the CPU manufacturers and tried several kernel, which should be
> the problem of the kernel.
>
>
> I don't understand the code right.
>
>
> Thank you very much.
>

You're welcome, and no one can always right,
just like Petr said: we are all learning.

--=20
Regards,
Li Wang

--00000000000028a15e05c5f7881a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Hao,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jun 30, 2021 at 4:16 PM =E8=8B=9F=E6=B5=
=A9 &lt;<a href=3D"mailto:gouhao@uniontech.com" target=3D"_blank">gouhao@un=
iontech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><p style=3D"margin:0px"><br></p><p style=3D"margin:0px"><br></p>=
<p style=3D"margin:0px">Hi LiWang:<br></p><p style=3D"margin:0px"><br></p><=
p style=3D"margin:0px">you are right.=C2=A0</p><p style=3D"margin:0px"><br>=
</p><p style=3D"margin:0px">I asked the CPU manufacturers and tried several=
 kernel, which should be the problem of the kernel.=C2=A0</p><p style=3D"ma=
rgin:0px"><br></p><p style=3D"margin:0px">I don&#39;t understand the code r=
ight.<br></p><p style=3D"margin:0px"><br></p><p style=3D"margin:0px">Thank =
you very much.</p></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">You&#39;re welcome, and no one can always ri=
ght,</div><div class=3D"gmail_default" style=3D"font-size:small">just like =
Petr said: we are all learning.</div></div></div><div><br></div>-- <br><div=
 dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--00000000000028a15e05c5f7881a--


--===============1429289282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1429289282==--

