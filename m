Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0139A33E97C
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:03:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CBE33C60CF
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 07:03:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AE9D93C2D07
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:03:14 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CC3E61A0117B
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 07:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615960991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y71CAy/utmpmvczIJMLihHK2w3D4KbbmXwizv+ECdO8=;
 b=YtutZMVmqXWQdwOwWfGUwCAIqgu5q/iYlUTsfXAfumGfigqB7Kl2DwsMpogD00IrmNQkZm
 TKQxWA/En8eh9rHIcMQbpyyUMxqE0U/PHB332kme9BNZ3/TJk071SiCMj77kO+sVaZ6qoa
 295IBEompW+70FUx+1ZzE7bCmjfTLGQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-f7yjqw5DN5-F_bQ92cdVxg-1; Wed, 17 Mar 2021 02:03:08 -0400
X-MC-Unique: f7yjqw5DN5-F_bQ92cdVxg-1
Received: by mail-yb1-f197.google.com with SMTP id o9so43680918yba.18
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 23:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y71CAy/utmpmvczIJMLihHK2w3D4KbbmXwizv+ECdO8=;
 b=VR6PucYcT/O0wB0Nfzv7A3UAZ1p8pk9gH8Vi4xwHpzNPoOL/U7xfutdgKcbv1VOMlB
 YAnKn6RiS497CGh4jpoJOeJU/dPWtn1GpHAXajLqaVbqopP9M6wFw/nUAgg3Jz71Ep58
 dY6itLRC4eFj23ajfcTFBOtmRZRIsYEXztfOak5mldvmdiwryR4u8a8UmbuBOJ8HFpKn
 TFLX/T2f/hBbhRt3gBrsUhFJEv0HjIQ7vAyYBfzy/ZDGtaLl5G3GS4+OOWDkltfpdKMM
 d87tC5V5533J7zxg4OTa4FI/CXpTMNLjOVWKt+Z1AxvEDfJlUar09D6aB/W0UeRnaZNO
 Q80g==
X-Gm-Message-State: AOAM530dCi6yT4BK9Py/Z3J3KlaMHa/kVnv0WKXoesB/HkpZYcsQjGMu
 EK6kKHoRMGhhgJAZj0Mu21siyJf+cy+BOiGvgycegE+oXrxY0g3xNkkiAkFLQr0Yespysx1BMNs
 6OgP6sM6tMJSYWo4ceHtAgLJPorQ=
X-Received: by 2002:a25:874c:: with SMTP id e12mr2523388ybn.403.1615960988504; 
 Tue, 16 Mar 2021 23:03:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmbSKvl6M7LtswfDiZPSSCiSaqxpzNWti0x+J3T3Uc7f3gOJCMkADEXP2vcqLR3EuUA/b7fMIC86ssg64tzxM=
X-Received: by 2002:a25:874c:: with SMTP id e12mr2523372ybn.403.1615960988184; 
 Tue, 16 Mar 2021 23:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210316130036.1838169-1-lkml@jv-coder.de>
In-Reply-To: <20210316130036.1838169-1-lkml@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 14:02:56 +0800
Message-ID: <CAEemH2dxiFi_6VUOpyaufkOecE8TCi-m8bVT=xY9GREzOfKW-A@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix: Remove hardcoded /tmp
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1334630889=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1334630889==
Content-Type: multipart/alternative; boundary="000000000000ac0aea05bdb53c3d"

--000000000000ac0aea05bdb53c3d
Content-Type: text/plain; charset="UTF-8"

Joerg Vehlow <lkml@jv-coder.de> wrote:

...
>
>  int main(void)
>  {
> -       char tmpfname[256];
> +       char tmpfname[PATH_MAX];
>  #define BUF_SIZE 1024
>         char buf[BUF_SIZE];
>         struct timespec processing_completion_ts = {0, 10000000};
> @@ -46,8 +47,7 @@ int main(void)
>         if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
>                 return PTS_UNSUPPORTED;
>
> -       snprintf(tmpfname, sizeof(tmpfname), "/tmp/pts_aio_cancel_1_1_%d",
> -                getpid());
> +       LTP_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_1_1");
>

It'd be great if a passing string end with the suffix "_", be used to
clearly distinguish the PID number.

Something like:
    LTP_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_1_1_");

This comment applies to all of the changing files in this patch, or we can
modify it in the macro prototype.

-- 
Regards,
Li Wang

--000000000000ac0aea05bdb53c3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Joerg Vehlow &lt;<a href=3D"mailto:lkml@jv-coder.de">lk=
ml@jv-coder.de</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
=C2=A0int main(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmpfname[256];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmpfname[PATH_MAX];<br>
=C2=A0#define BUF_SIZE 1024<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[BUF_SIZE];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec processing_completion_ts =3D {0=
, 10000000};<br>
@@ -46,8 +47,7 @@ int main(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysconf(_SC_ASYNCHRONOUS_IO) &lt; 200112L)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTS_UNSUPPOR=
TED;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tmpfname, sizeof(tmpfname), &quot;/tmp=
/pts_aio_cancel_1_1_%d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getpid());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>LTP_GET_TMP_FILENAME(tmpfname, &quot;<span class=3D"gmail_d=
efault" style=3D"font-size:small"></span>pts_aio_cancel_1_1&quot;);<br></bl=
ockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">It&#39;d be great if a=C2=A0passing string end=C2=A0with the suffix &qu=
ot;_&quot;, be used to clearly distinguish the PID number.</div></div><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Somet=
hing like:</div></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">=C2=A0 =C2=A0 <span class=3D"gmail_default"></span>LTP_GET_TMP_FILEN=
AME(tmpfname, &quot;pts_aio_cancel_1_1_&quot;);</div></div><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">This comment app=
lies to all of the changing files in this patch, or we can modify it in the=
 macro prototype.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000ac0aea05bdb53c3d--


--===============1334630889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1334630889==--

