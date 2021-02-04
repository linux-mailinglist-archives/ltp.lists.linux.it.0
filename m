Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CD30F3D9
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:29:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70C063C7352
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:29:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 64A763C7130
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:29:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id DC46B14010D9
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612445373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5D2RTd/Yrn+HSp4F4tSHanYZdR5eQA0gEjIcZ8wmEI=;
 b=KVq8e46Ib0smPXR5i/z7LansINQGZanuAlwT/fOdDpIcUeu+2wpBnJEEhExlJ+ox9fuKFY
 sLBoObpvBarr5Ac1+TB+eMcndqmNuQ3V7SQtOabh6PBTkzNne6/zy0unuZWbW7lFaA6l9d
 Inyr7lmjqpGDEdX/NWmw1bBF/YUafmk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-i0PF5jgDPneO4qDHyCKpTw-1; Thu, 04 Feb 2021 08:29:31 -0500
X-MC-Unique: i0PF5jgDPneO4qDHyCKpTw-1
Received: by mail-yb1-f199.google.com with SMTP id k7so3305275ybm.13
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 05:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5D2RTd/Yrn+HSp4F4tSHanYZdR5eQA0gEjIcZ8wmEI=;
 b=jAAOeVciFEkQAxS+A29ghzS/ZQTBZqsb9WMz2V/azKrxsgQGACeqtA5d3juAin124p
 wSXxUYKp+PBrGHbctbejtrlXg2WjP1uSrR0i5YS8bpxiGSzga0AaGKyxPZ+nmdVDpKpA
 4WrDCzTjHobzt+GJ8uSyZfDXKOvrlQdxpz+DXTtDTi8ZTP+cwj+v8quM/NW604n16pMs
 j3Yc0lAzKZ3NUPcpg2CHKnJzXgAeuG51+LO03VjyIaU/pSyFU4y/NK/d9z27PXNFEa9O
 8MSBiRO/OAP0aZ8cU8RJCG0sAXvv16hW8+4I3KztIuu1a6m/mVx3dkV+ZMX2jyQ5bqbx
 FJYw==
X-Gm-Message-State: AOAM532tjhWdoOi2bdoZrbAX8iStXYXheTo/AdRFpqtsr2XBeqHkheIb
 qR2V1yPvXnO42lG/J5Yku7/TXqEH4a8bET8xVpUNqvm0Jax98Dz7QhUTiVE0CNMTfx5cOsYOpZI
 TpZFgeeot338ZaneCSh7gC1IspFw=
X-Received: by 2002:a25:b992:: with SMTP id r18mr12190260ybg.86.1612445370994; 
 Thu, 04 Feb 2021 05:29:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZXF9g+sKNigwhcdO3tz/OnuzTkmdJTuVHTnRwze8lIY6y/hH1JhYAk9SiczxF6ou4dk8pACOm636gHqfLT9w=
X-Received: by 2002:a25:b992:: with SMTP id r18mr12190222ybg.86.1612445370635; 
 Thu, 04 Feb 2021 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 21:29:18 +0800
Message-ID: <CAEemH2f_mvjt4couA++RcOf9bAMO8fnqapkgG59Qvs9Ud-2SHw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/5] tst_mallinfo.c: Add a common print helper
 for mallinfo
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
Content-Type: multipart/mixed; boundary="===============1237017848=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1237017848==
Content-Type: multipart/alternative; boundary="000000000000896bcf05ba82b12b"

--000000000000896bcf05ba82b12b
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Thanks for your work.

--- /dev/null
> +++ b/include/tst_mallinfo.h
>

Do we really need to export this function into the LTP library?
(I assumed no other tests will using this lib function anymore)

So I prefer to create a common header file as:
   ../syscalls/mallinfo/mallinfo_common.h,
and just use it locally.

If you're hoping mallopt01.c also benefits from it, only need to
build something like mallinfo_commo.o via Makefile and include
it in mallopt01.c by "../mallinfo/mallinfo_common.h".

-- 
Regards,
Li Wang

--000000000000896bcf05ba82b12b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><div =
class=3D"gmail_default" style=3D"font-size:small">Thanks for your work.</di=
v></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
--- /dev/null<br>
+++ b/include/tst_mallinfo.h<br></blockquote><div><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Do we really need to export this fu=
nction into the LTP library?</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">(I assumed no other tests will using this lib function anymor=
e)</div><div class=3D"gmail_default" style=3D"font-size:small"><br>So I pre=
fer to create a common header file as:</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">=C2=A0 =C2=A0../syscalls/mallinfo/mallinfo_common.h=
,</div><div class=3D"gmail_default" style=3D"font-size:small">and just use =
it locally.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">If you&#39;re=
 hoping mallopt01.c also benefits from it, only need to</div><div class=3D"=
gmail_default" style=3D"font-size:small">build something like mallinfo_comm=
o.o via Makefile and include</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">it in mallopt01.c by &quot;../mallinfo/mallinfo_common.h&quot=
;.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--000000000000896bcf05ba82b12b--


--===============1237017848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1237017848==--

