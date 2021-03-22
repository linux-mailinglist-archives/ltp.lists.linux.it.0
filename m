Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F83438A2
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 06:31:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 205F03C19D6
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 06:31:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F132F3C196F
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 06:31:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5F625100095E
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 06:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616391105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRop+VGIoH/KDSkMAk4LHSvgptX5a3pWcM61NBbSZNc=;
 b=P/siXmMa4k+9FB0yXb+xnleBrH0PwMkm6D+yuLtiFkTmmLpp+BW+vI7qo2lyxzDE/jInUW
 Y4/3mrYw4Dz4jF/DfUDqLXY0rdIV69NQ6uI6jfcCg4DmKY6inwbbRHiNmk/9SCgR7vUXsj
 h0/yR+0fpk0v2zHXw/3nhayuseJu2SM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-67XVN5QvPNypT51KTfsJfQ-1; Mon, 22 Mar 2021 01:31:42 -0400
X-MC-Unique: 67XVN5QvPNypT51KTfsJfQ-1
Received: by mail-yb1-f198.google.com with SMTP id f81so58817316yba.8
 for <ltp@lists.linux.it>; Sun, 21 Mar 2021 22:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRop+VGIoH/KDSkMAk4LHSvgptX5a3pWcM61NBbSZNc=;
 b=clspDhvEDHwLUYZ2WoZD2ANXNFmHb/i4SKNVC16TkXaRW1Vb+93l6dBEy1N0IgI8y7
 cXCV0lHioRQDVr9uaV4TE4OcP5zMk137R+5q4scWAhzYKSTkSMVe3wNlF0ksl8RKmrbW
 A3UTb6EgR8V2RGr3ycX/M70grZJpIRxnftoHyEeE/Go8hnE6X8bZmSuv4CU2IzVP5eKu
 0Htf2wDWBsHMEBXmKCqD6P6I/QOULoZGkbJ+mGiMOnXaxUtmtuCxIrHaNg1Uvr1DW2Ce
 gY0m9YoqiM4yodNSFRHzJ8WfyruszUZaF/HhbWyhcuXkUxs1ch828Y/EWn9S2VSRJwhA
 mMpQ==
X-Gm-Message-State: AOAM530RHdv7K+uP2HDc0pYINQoxjwBldr0YYd2ol+VuHTYdVcKc+bOu
 ylJFgoUDLCj2MDYskVZKf/PgT0iJjvtIjZPb0eJHkhypIyGCijQRiESQ+ycg7Tc6J1t0w+t5xtR
 25H/vUjmqYuI1CAG04ajy7vgJH/E=
X-Received: by 2002:a5b:787:: with SMTP id b7mr425977ybq.243.1616391102134;
 Sun, 21 Mar 2021 22:31:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqJAX9qa9KPD8WYmCqpGl5xBCj2Vlj1nKbWiTlOwIQoP/nC5FdALV4g25mi2ZPeWgG3nnHiLOKSG715NJBZQQ=
X-Received: by 2002:a5b:787:: with SMTP id b7mr425959ybq.243.1616391101929;
 Sun, 21 Mar 2021 22:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210322032630.21094-1-zhaogongyi@huawei.com>
In-Reply-To: <20210322032630.21094-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Mar 2021 13:31:31 +0800
Message-ID: <CAEemH2d5NFhuh6aVukJ0z4VtU6APMVLTBWGR8_2WAT6yZquRgw@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cleanup: Replace libc function with safe_macros
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
Content-Type: multipart/mixed; boundary="===============1028772069=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1028772069==
Content-Type: multipart/alternative; boundary="00000000000072ee2a05be1961cb"

--00000000000072ee2a05be1961cb
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 11:27 AM Zhao Gongyi <zhaogongyi@huawei.com> wrote:

> For those:
>         testcases/kernel/syscalls/fanotify/fanotify01.c
>         testcases/kernel/syscalls/fanotify/fanotify03.c
>         testcases/kernel/syscalls/fanotify/fanotify07.c
>
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
> v1->v2: correct compile error.
>

Pushed, thanks!


-- 
Regards,
Li Wang

--00000000000072ee2a05be1961cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 11:27 AM Zhao Gongyi &lt;<a=
 href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For those:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testcases/kernel/syscalls/fanotify/fanotify01.c=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testcases/kernel/syscalls/fanotify/fanotify03.c=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testcases/kernel/syscalls/fanotify/fanotify07.c=
<br>
<br>
Signed-off-by: Zhao Gongyi &lt;<a href=3D"mailto:zhaogongyi@huawei.com" tar=
get=3D"_blank">zhaogongyi@huawei.com</a>&gt;<br>
---<br>
v1-&gt;v2: correct compile error.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Pushed, thanks!</div><br>=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--00000000000072ee2a05be1961cb--


--===============1028772069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1028772069==--

