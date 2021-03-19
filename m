Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 638CC3414F7
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 06:41:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6A583C5FAF
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 06:41:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A038C3C2BFD
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 06:41:30 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 1B00D201037
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 06:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616132488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVdb+eTRVOyySV1iXF0xA/tYORq0wFA+umtu9sY/z8c=;
 b=W8wotxIpJsoBVrgGpZYUpatrdkwuNGxyOJ+N93HmW6smYPWIve9ZMzdG7amjSy+jHPJEHc
 0E4LDamLdfpsfVzud/XZVSLasfiDCUw3u3szqnCQgjeXePKqy584Cs0ZWvS2R+ajZNkfzf
 ADR10DSMQM2oh/NRzBBqHHFBRhdUGdU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-vwnqVsb8POeYZ4O-6h79sQ-1; Fri, 19 Mar 2021 01:41:26 -0400
X-MC-Unique: vwnqVsb8POeYZ4O-6h79sQ-1
Received: by mail-yb1-f200.google.com with SMTP id l83so4746515ybf.22
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 22:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVdb+eTRVOyySV1iXF0xA/tYORq0wFA+umtu9sY/z8c=;
 b=ipVstOOymAGwUBN9iC8rTRHcUhEgT0Pv6obSF6GU4N7OtTrw5YKEQxdt6FUnWArYNb
 66rTRNsQc4Bj3xZ8LYYH2vdqB4MuH07ZfdjKg1w5+LV2OHv2tzlN4pGbhPH/QVxOU7DE
 tIHAK/RbvExLkbFv0OOpVJP7EnS1CINsu3QcHzN+w90mRN4DIYck17DjOKdHQzqSmmqw
 kpopBw0zfcPeZzG3m0FuFs/867kijgsHTQJK4acPUaQ49bQbcxb4YUQlEGJlsIv9rqI8
 NP3x6EkGP0GbjbuLpGoLE4eWi8WoeEls54d3bDdH7Np8m5rJsR4WwQlOyO6Lv1pz3Asc
 0VHg==
X-Gm-Message-State: AOAM532CYqsOR0N0w6y72i6w4l//hMsvEAbFw9GnZdH7I57jl9lc2Ekg
 g1QRwXjBFskan3s7neTlgau6DUkoEA5ziuOT8uCKv1DZu5wET3xxgWgtqQg81jmwRSj/lSgs6Z/
 O/+1rhdrKEhFlSSB6F1AingnC0V0=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4214715ybh.86.1616132486183;
 Thu, 18 Mar 2021 22:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCV/3shFIS4BUTmOQIUdwv2c8uXtBhC3+DkCX+rZWedsGDY5BdBKM4hm1f5q5ka7Ydw9E52mdeW/R/haXSBAg=
X-Received: by 2002:a25:af05:: with SMTP id a5mr4214704ybh.86.1616132486010;
 Thu, 18 Mar 2021 22:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210318084117.5663-1-zhaogongyi@huawei.com>
In-Reply-To: <20210318084117.5663-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Mar 2021 13:41:14 +0800
Message-ID: <CAEemH2evz-Y+vMYOkTU8hFF0qaM88BE-s2UzjV2Fuo8v683=_A@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] cleanup: Replace libc functions with safe_macros
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
Content-Type: multipart/mixed; boundary="===============0427881547=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0427881547==
Content-Type: multipart/alternative; boundary="000000000000bd3a9205bddd2a93"

--000000000000bd3a9205bddd2a93
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

Zhao Gongyi <zhaogongyi@huawei.com> wrote:


> --- a/testcases/kernel/syscalls/fanotify/fanotify03.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> @@ -128,17 +128,13 @@ static void generate_events(void)
>         /*
>          * Generate sequence of events
>          */
> -       if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1)
> -               exit(1);
> -       if (write(fd, fname, 1) == -1)
> -               exit(2);
> +       fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700);
>
> -       lseek(fd, 0, SEEK_SET);
> -       if (read(fd, buf, BUF_SIZE) != -1)
> -               exit(3);
> +       SAFE_WRITE(fd, fname, 1);
>

SAFE_READ/SAFE_WRITE requires 4 arguments, but only 3 given,
it even builds fails after applying this patch. So it'd be better to compile
PASS at least locally before sending it to ML.



> --- a/testcases/kernel/syscalls/fanotify/fanotify07.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
> @@ -53,14 +53,12 @@ static void generate_events(void)
>         /*
>          * generate sequence of events
>          */
> -       if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1)
> -               exit(1);
> +       fd = SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0700);
>

FNAME --> fname


-- 
Regards,
Li Wang

--000000000000bd3a9205bddd2a93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Zhao Gongyi &lt;<a href=3D"mailto:zhaogongyi@=
huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
--- a/testcases/kernel/syscalls/fanotify/fanotify03.c<br>
+++ b/testcases/kernel/syscalls/fanotify/fanotify03.c<br>
@@ -128,17 +128,13 @@ static void generate_events(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Generate sequence of events<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fd =3D open(fname, O_RDWR | O_CREAT, 0700)=
) =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write(fd, fname, 1) =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700)=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek(fd, 0, SEEK_SET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (read(fd, buf, BUF_SIZE) !=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(fd, fname, 1);<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"">SAFE_READ/SAFE_WRITE=
 requires 4 arguments, but only 3 given,</div><div class=3D"gmail_default" =
style=3D"">it even builds fails after applying this patch. So it&#39;d be b=
etter to compile</div><div class=3D"gmail_default" style=3D"">PASS at least=
 locally before sending it to ML.<br></div></div><div><br></div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
--- a/testcases/kernel/syscalls/fanotify/fanotify07.c<br>
+++ b/testcases/kernel/syscalls/fanotify/fanotify07.c<br>
@@ -53,14 +53,12 @@ static void generate_events(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* generate sequence of events<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fd =3D open(fname, O_RDWR | O_CREAT, 0700)=
) =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(FNAME, O_RDWR | O_CREAT, 0700)=
;<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">FNAME --&gt; fname</div></div></div><br clear=3D"all"><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000bd3a9205bddd2a93--


--===============0427881547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0427881547==--

