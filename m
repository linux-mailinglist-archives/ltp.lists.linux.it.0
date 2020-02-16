Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636816021F
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 06:52:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7629E3C251E
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 06:52:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DB42F3C1D32
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 06:52:02 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B0B411400DF4
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 06:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581832320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=USd4zuzG++Oh22lTMZ4GlZ7sKcLN8lMCTeHhMPktbRE=;
 b=DEQTOjEJB6nXsCpo+F/V+Czxr0O6/2DZD3nRtxxuDv43TYZFqLZf2jwGrTzuC2IvAeQvGj
 J+TZ4vmmjL4n/iWgTQBuBL+oPekSowBYKVIq/0ymJS6fD/oah9+JWQO4SQ39XLVM8dkYGb
 h0qX/MMZ4X8ilrIo6mf9gQ5rihJ6TXM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Y-L7Qxo7PtG-jzBfwym6SQ-1; Sun, 16 Feb 2020 00:51:55 -0500
Received: by mail-ot1-f70.google.com with SMTP id d16so8319016otp.10
 for <ltp@lists.linux.it>; Sat, 15 Feb 2020 21:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SeCkHvmaYRaVAWZSuxMWI9Pdh0EEr81e1y3o66r/TCg=;
 b=r5g43Azs0YVHVZyLsI2RxcBfaQD3bOo8B+4HKK2oTNlrO7xgFplZyIpEFNuaU6okRE
 JjLFC6kjkaH6kCXHkv/iHDcLJLQ78G1bYEugTXMLn3NGr0chNlKN8EGiGqKOhD0a8g8N
 oAErHf0R1nQ0SWdHGY32GN6jEIflt0dpXKbLe+YkEF4Akzu8UQA3dbdsbXJg0oR7MxCl
 hg9J51/FjQCwbtwI5ZIahfcWIjtJdAU8GZslrQBjKbT1CRkkXTMMp2SUdKnQIIfx3gs8
 rhyhLM/3BOZh8NliF2x90hG7e/n1IEjkJ3o9hzBBq5FtagpOfSOHsIJs85dV4VfREZT7
 TEFw==
X-Gm-Message-State: APjAAAWm3PvVuGIGas2HnKYVYAc7IRPI5hlaHWLK7Zm0y1CrFjh1jptu
 gzuVSGpXvc333cs8AvM5zzSQR6Z375iTJLvZQWVGm/UnMamqPtEL86MPfLH34BRHeR0Tnf4/g2s
 Msy35dpMqtpM/YZJosm1Arux3LjM=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr7761570otl.118.1581832314006; 
 Sat, 15 Feb 2020 21:51:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbF17kTmVReqPMordxXIRLQrzXUeNB/hdF+denzw1/MpPVAR9RJBBJp34s+/H6aseNMtQIpDq0ZSocQdLS6dw=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr7761563otl.118.1581832313609; 
 Sat, 15 Feb 2020 21:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20200210124043.14425-1-pvorel@suse.cz>
In-Reply-To: <20200210124043.14425-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Feb 2020 13:51:42 +0800
Message-ID: <CAEemH2fvK+d3V8W=sR4YtZpwmE=jq5TmS-g1TNTu+UbW2oU8CQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: Y-L7Qxo7PtG-jzBfwym6SQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_umount: Fail immediately when errno !=
 EBUSY
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
Content-Type: multipart/mixed; boundary="===============1868875683=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1868875683==
Content-Type: multipart/alternative; boundary="00000000000025b5dc059eab09c8"

--00000000000025b5dc059eab09c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 8:41 PM Petr Vorel <pvorel@suse.cz> wrote:

> Only on EBUSY makes sense to keep trying in a loop.
> This helps to use tst_umount() in safe_umount() (next commit).
>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Reported-by: Jan Stancek <jstancek@redhat.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
>  lib/tst_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 89b9c96de..6cad9bd4d 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -363,6 +363,13 @@ int tst_umount(const char *path)
>                 if (!ret)
>                         return 0;
>
> +               if (err !=3D EBUSY) {
> +                       tst_resm(TWARN, "umount('%s') failed with %s",
> +                        path, tst_strerrno(err));
> +                       errno =3D err;
> +                       return ret;
> +               }
>

Since we have guaranteed there is no other error besides EBUSY, maybe we
could cancel the 'err =3D=3D EBUSY' in the next if() sentences.
Otherweise patch 1/3, 2/3 looks good.

if (i =3D=3D 0 && err =3D=3D EBUSY) {
    ...
}

--=20
Regards,
Li Wang

--00000000000025b5dc059eab09c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 10, 2020 at 8:41 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Only on EBUSY makes sense to ke=
ep trying in a loop.<br>
This helps to use tst_umount() in safe_umount() (next commit).<br>
<br>
Suggested-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt;<br>
Reported-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=
=3D"_blank">jstancek@redhat.com</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Acked-by: Li Wang &lt;<a href=3D"mailto:liw=
ang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=3D"g=
mail_default"></span>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0lib/tst_device.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/lib/tst_device.c b/lib/tst_device.c<br>
index 89b9c96de..6cad9bd4d 100644<br>
--- a/lib/tst_device.c<br>
+++ b/lib/tst_device.c<br>
@@ -363,6 +363,13 @@ int tst_umount(const char *path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err !=3D EBUSY)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_resm(TWARN, &quot;umount(&#39;%s&#39;) failed with %s&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 path, tst_strerrno(err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errno =3D err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><=
div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Since =
we have guaranteed=C2=A0there is no other error besides EBUSY, maybe we cou=
ld cancel the &#39;err =3D=3D EBUSY&#39; in the next=C2=A0if() sentences. O=
therweise=C2=A0patch 1/3, 2/3 looks good.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">if (i =3D=3D 0 &amp;&amp; err =3D=3D EBUSY) {<br>=C2=A0 =
=C2=A0 ...<br>=09=09}</div></div><div><br></div>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang=
<br></div></div></div></div>

--00000000000025b5dc059eab09c8--


--===============1868875683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1868875683==--

