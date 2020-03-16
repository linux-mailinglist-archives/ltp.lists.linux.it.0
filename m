Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2111186116
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 01:59:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBCBE3C579D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 01:59:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CDA273C07CF
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 01:59:50 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id ECB4C1000498
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 01:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584320388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwiV9KJ/3Z+mCxr4PahAtqNi7wRsYq93nXTBA1Ko2As=;
 b=Jj2dKYxLbirV2SagR0u2TLNsDFjr1h/1n9/1/R2LjvwGVzSwE34OngbyGF5doIPx+q4ICz
 biWhT1QNEkZn8/eN9n4Z/M/J0Lkn/b4sxslbPjAUATtdHG6D4O5VSZTzfWeOziZLLv/l0l
 RklFVBjLT7ZarvUPw/0AScM9w5VgtdA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ZqglgyeDOeybOZQH2kr2lw-1; Sun, 15 Mar 2020 20:59:43 -0400
X-MC-Unique: ZqglgyeDOeybOZQH2kr2lw-1
Received: by mail-oi1-f197.google.com with SMTP id c4so9859605oiy.0
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 17:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=434+dFSnv1Zkt+xTl14eLrdwbLJAnzw+LyfUHMN88xc=;
 b=P7Eq0KyHfWLFVOmNwSvHHx/nWVDfzzVtLoVDRZ1xKdNkTlQkQzE0e2G13y3j8DXeSu
 YSrgZlomaoUJHh9PwrKENrPzA2nGnITYhOyGnxstG79n2lpHwHwZ54A6il5kdRumo8rO
 7iF75iEYnSpeqgflQ6xeEvRvOkrvuHIKsdI8J6vZwOQy9ebNZ4GCYry3Cx2cMKHxCMtO
 vzFE1Wv7SpKpAmbjcf4Fltsc6itRAd6ewjgSJhXiT/cxCWn/s4gkj8JLd683Ja+w05mQ
 PTcgIdQn0nbxIjzV5tMXzlDmgVKUv7aUli1fNGNLibWuZ+xEWpOrzSvTO4x9VJBB2C37
 NU0w==
X-Gm-Message-State: ANhLgQ0tnqK6uMGNNyQ5XVp+tHVP7LK+e3P66yYYJAPVAlS1HTvIMhut
 H2HkhHuw5zne+Ypv3/5pXeIcialGOyiIv+Qo44Gi08XGzazW+Hxt1TAduvhAYUrIZdeWQSkS9Fh
 /okyJSkqL7xzIg7TQU0gbYghY534=
X-Received: by 2002:aca:3008:: with SMTP id w8mr14963109oiw.96.1584320382516; 
 Sun, 15 Mar 2020 17:59:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vviQ7stbxDM35Kano6i2GtouzoxZ/dCuMNT4jhON3ZcCQgeZ6pTjBRdACGOIWrMKrOwFJzjpSDLtoZL0TFqlOk=
X-Received: by 2002:aca:3008:: with SMTP id w8mr14963101oiw.96.1584320382152; 
 Sun, 15 Mar 2020 17:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAEX+82K_6yO1pB9utLg3TPheG91+oO-ode7kmMUPoLLe7aszxA@mail.gmail.com>
 <CAEemH2c6hkXMBsSQEm5MMhZoEieR0-OUwJ-ASLB9VFnG6Z-a8g@mail.gmail.com>
 <CAEX+82+X=V_Z4nhBqpu5MyPJxhbEEdRgz84t8iDxo-5WanGghA@mail.gmail.com>
In-Reply-To: <CAEX+82+X=V_Z4nhBqpu5MyPJxhbEEdRgz84t8iDxo-5WanGghA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 16 Mar 2020 08:59:31 +0800
Message-ID: <CAEemH2ef0iSM45VDfHBFbwRxxqJUeDBpcC9GgKYBs=z-0+6j2A@mail.gmail.com>
To: Javier Romero <xavinux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Contribution to the LTP.
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
Content-Type: multipart/mixed; boundary="===============2068864193=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2068864193==
Content-Type: multipart/alternative; boundary="00000000000096d4bf05a0ee5587"

--00000000000096d4bf05a0ee5587
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2020 at 8:20 PM Javier Romero <xavinux@gmail.com> wrote:

> Hi Li,
>
> Thank you for your answer.
>
> Will read those links you suggested.
>
> BTW I have a Raspberry PI 3 to start working on testing, it could be
> useful to test the Linux Kernel and subsystems on ARM processor?
>

I think the answer is yes, enjoy~

--=20
Regards,
Li Wang

--00000000000096d4bf05a0ee5587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Mar 15, 2020 at 8:20 PM Javier Romero &lt;<=
a href=3D"mailto:xavinux@gmail.com">xavinux@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div=
><div dir=3D"auto">Hi Li,</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Thank you for your answer.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Will read those links you suggested.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">BTW I have a Raspberry PI 3 to start working on testing, =
it could be useful to test the Linux Kernel and subsystems on ARM processor=
?</div></div></div></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I think the answer is yes, enjoy~</div></di=
v></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--00000000000096d4bf05a0ee5587--


--===============2068864193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2068864193==--

