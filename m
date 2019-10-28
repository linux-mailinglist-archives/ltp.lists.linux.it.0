Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D2E721A
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 13:50:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D5E53C24EC
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 13:50:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8AE3D3C13E2
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 13:50:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id AF2B3600A87
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 13:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572267030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K5r9j5MP8y/qJHu5f/N1Rjsjx6xD5eZx1WGspEXZ8ZA=;
 b=jKzRMbKFZiohwEdalNGA8yuXWLt5BGzEQCnEuBIWvYGi9zJ9fexCwQJua/YdDpgtAo7aMn
 Vtv3Rqywj2037SbbllaqXTnuUrsFOO1Z3/qkxFKpcWnplNtvc/fhHNJF/WvfshKr/E0NkH
 xL2KPPjro2wZPf1fq4oc7Vwt887oWHM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Ksim5a4uPFG7yfLRUrbUxw-1; Mon, 28 Oct 2019 08:50:25 -0400
Received: by mail-oi1-f197.google.com with SMTP id t62so4678419oib.0
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 05:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxtbk2O43qr2dBwp2ymA8zIk2vc4BFTDZzVZmc8/H2Q=;
 b=mez6iIo4NzvH+2Q3JVe2mtScD0Y4oz3QFuQsnMtm1+fXpLFXWXcSBklAW2SjBCB4yV
 ok0cf2QT/8d9LRH75k3mTCknA02cTgDQnqPuQMARfSy52Ze9RIkA5C5XEoCcF6CL/sd6
 r5Eh/D0PJ0Fzv9M3ZR9mny/8r1UStRrjNpBq1I1Wvt93B6hsdHuqpXC3FOWR2now8+dc
 TJwj3LzaM6rku0JulUonR/d8jt540wMpy1fZJqo2MiVeC3HkV9vwbhl/hVTmIOHeaNfw
 3pxYSmg+BXVbbAkAoV3+X2i7xSn81Le4qtfDFlf/ZXcazqex946oTvGjKaihJ1UoeFjZ
 FvMg==
X-Gm-Message-State: APjAAAX+nR77mbRE/4dUu/Cf7+iCVJef5YTLE0WvnV2nTrXLxKlonLnm
 x3tdMi1Is8gSUdgE/Y4FvfZIayNak8d1R3ABm4AZ7/EENzcMEEZZXFcSkN52qbqO0wz9KlgHFsa
 glP4xtThuPx6vm8EQzY1L2Yr8sAw=
X-Received: by 2002:aca:7516:: with SMTP id q22mr12780544oic.144.1572267024989; 
 Mon, 28 Oct 2019 05:50:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhghv8UVKIn2jmj57MH6sXTTSIziB2Jb4MRyOVIWZ7/1p8b8fYk7iyenrotQiERWnHzSIpXUh7ZO2dthwP1bY=
X-Received: by 2002:aca:7516:: with SMTP id q22mr12780526oic.144.1572267024713; 
 Mon, 28 Oct 2019 05:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <1572255092-105929-1-git-send-email-songjian15@huawei.com>
In-Reply-To: <1572255092-105929-1-git-send-email-songjian15@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Oct 2019 20:50:12 +0800
Message-ID: <CAEemH2dHX0vry_p=RRwRGbMe2NYf_7_PB4LG5sUpDSXDFB2g1Q@mail.gmail.com>
To: Song Jian <songjian15@huawei.com>
X-MC-Unique: Ksim5a4uPFG7yfLRUrbUxw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH]kernel/mem/mtest01:Fix mtest01's options
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
Content-Type: multipart/mixed; boundary="===============1913471043=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1913471043==
Content-Type: multipart/alternative; boundary="0000000000008034030595f7f1a1"

--0000000000008034030595f7f1a1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 5:30 PM Song Jian <songjian15@huawei.com> wrote:

> Signed-off-by: Song Jian <songjian15@huawei.com>
> ---
>  testcases/kernel/mem/mtest01/mtest01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/mem/mtest01/mtest01.c
> b/testcases/kernel/mem/mtest01/mtest01.c
> index eaf1026..960a2ce 100644
> --- a/testcases/kernel/mem/mtest01/mtest01.c
> +++ b/testcases/kernel/mem/mtest01/mtest01.c
> @@ -58,7 +58,7 @@ static char *opt_chunksize, *opt_maxbytes,
> *opt_maxpercent;
>  static struct tst_option mtest_options[] =3D {
>         {"c:", &opt_chunksize,  "-c  size of chunk in bytes to malloc on
> each pass"},
>         {"b:", &opt_maxbytes,   "-b  maximum number of bytes to allocate
> before stopping"},
> -       {"p:", &opt_maxpercent, "-u  percent of total memory used at whic=
h
> the program stops"},
> +       {"p:", &opt_maxpercent, "-p  percent of total memory used at whic=
h
> the program stops"},
>

Good catch. Pushed.

>         {"w",  &dowrite,        "-w  write to the memory after
> allocating"},
>         {"v",  &verbose,        "-v  verbose"},
>         {NULL, NULL,            NULL}
> --
> 2.6.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--0000000000008034030595f7f1a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 28, 2019 at 5:30 PM Song Jian &lt;<a hr=
ef=3D"mailto:songjian15@huawei.com">songjian15@huawei.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Son=
g Jian &lt;<a href=3D"mailto:songjian15@huawei.com" target=3D"_blank">songj=
ian15@huawei.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/mem/mtest01/mtest01.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/=
mtest01/mtest01.c<br>
index eaf1026..960a2ce 100644<br>
--- a/testcases/kernel/mem/mtest01/mtest01.c<br>
+++ b/testcases/kernel/mem/mtest01/mtest01.c<br>
@@ -58,7 +58,7 @@ static char *opt_chunksize, *opt_maxbytes, *opt_maxpercen=
t;<br>
=C2=A0static struct tst_option mtest_options[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;c:&quot;, &amp;opt_chunksize,=C2=A0 &quo=
t;-c=C2=A0 size of chunk in bytes to malloc on each pass&quot;},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;b:&quot;, &amp;opt_maxbytes,=C2=A0 =C2=
=A0&quot;-b=C2=A0 maximum number of bytes to allocate before stopping&quot;=
},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;p:&quot;, &amp;opt_maxpercent, &quot;-u=
=C2=A0 percent of total memory used at which the program stops&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;p:&quot;, &amp;opt_maxpercent, &quot;-p=
=C2=A0 percent of total memory used at which the program stops&quot;},<br><=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Good catch. Pushed.</div><div class=3D"gmail_default" style=3D"font-=
size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;w&quot;,=C2=A0 &amp;dowrite,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;-w=C2=A0 write to the memory after allocating&quot;=
},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;v&quot;,=C2=A0 &amp;verbose,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;-v=C2=A0 verbose&quot;},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {NULL, NULL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL}<br>
--<br>
2.6.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000008034030595f7f1a1--


--===============1913471043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1913471043==--

