Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA32D219C07
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:23:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81CEE3C5404
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:23:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 877793C0133
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 11:23:03 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7FA656013D5
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 11:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594286581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IFxPBsjF95q2YmN+4AIKRdoKd2JXorArThr+z3THYBc=;
 b=DgqIxbTMrn1GKgk1IW/p4L0yk/TMtwzl1vG3PiVS9i9zg59MCnGKXvZHHeqa++imvzyMz2
 AS48Zrzow+Ibmpq00YpPZDImjH3kpYwJnBXdVSboxZjc5mR7isJF2/6tIbjr7598PCuSBL
 KWDLtNioEkmfpDxjucNiVO2zU7S58IQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-hL15tG7mP_OZSBN-8RXcvg-1; Thu, 09 Jul 2020 05:22:57 -0400
X-MC-Unique: hL15tG7mP_OZSBN-8RXcvg-1
Received: by mail-lf1-f70.google.com with SMTP id i22so1790752lfj.5
 for <ltp@lists.linux.it>; Thu, 09 Jul 2020 02:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFxPBsjF95q2YmN+4AIKRdoKd2JXorArThr+z3THYBc=;
 b=nzBwUy1/0NCLeMoJWfPzp91JDULycmIaOVGU/cnI605a2xLJhfFA0ZKawT1K1KPJVR
 iVpLqj2G4tWtvG7ObHoXqdNtJ6m9eSmGAI6VYMWCNrB0WGoRxqPpzMhlgLKOdmrZsrJ9
 FYpy4aNXM1E5TOWhnakdzI+PCyr2zj7DGi8uQNaWtLxb2UY6EcwZWGlDS6nAibffv6Lv
 Szw9WIzc9Jp3CsMgsUyLin8JswujdPtuNSBe62bnqsZJlB6zO0IbgCF6O5Xjl9dSK+h2
 Z970K3hHWvsj0/9GHavAnCQf5r83gvM2mUfjN6pqiIRvh3dTG87vjEfXw1GT7NbmYKgr
 e3Vw==
X-Gm-Message-State: AOAM532uVHGy68+3DryCW5k4w7GLx5pH2terqpZXqdzABLda2GG9zcve
 y6qa7ywXGHFtyBKs7mdFPnKMeATdmwC4XVSA43my7r05LbBFQh7/4i9QS5luTOAk4CZf2cK5be5
 jPY+oK72uaHkNpGSgeKr1rhTPOas=
X-Received: by 2002:a05:6512:31d5:: with SMTP id
 j21mr28249382lfe.83.1594286575083; 
 Thu, 09 Jul 2020 02:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2QfmOEzcR8o24oPnch/UQYn32Dgk2ygNCHecRYvS+lgF+OOV+J0EEc5kHV0vOyQ0vuQfCAEsIVPLZwp6GNc0=
X-Received: by 2002:a05:6512:31d5:: with SMTP id
 j21mr28249378lfe.83.1594286574883; 
 Thu, 09 Jul 2020 02:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
In-Reply-To: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Jul 2020 17:22:42 +0800
Message-ID: <CAEemH2fY4di1VzpTnD5t_ZvTdoXF+=kdNa69qQk_hi2iF+fOnw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runltp: let each test acquire/release device
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
Content-Type: multipart/mixed; boundary="===============0323737364=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0323737364==
Content-Type: multipart/alternative; boundary="000000000000f76bb305a9fec44e"

--000000000000f76bb305a9fec44e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 9, 2020 at 3:50 PM Jan Stancek <jstancek@redhat.com> wrote:

> Problem with runltp creating and using single loop device for all tests
> is that if one test fails/gets stuck or fails to umount loop device
> for any reason, then all subsequent tests also fail, because
> they try to use mounted device.
>
> Don't force same loop device on all tests (unless it is chosen via
> env. variable DEVICE) and let LTP library try to acquire and release
> first usable loop device for each test.
>
> Fixes #703
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runltp | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/runltp b/runltp
> index ec0811834862..94e290d6dbb9 100755
> --- a/runltp
> +++ b/runltp
> @@ -963,17 +963,7 @@ create_block()
>
>  set_block_device()
>  {
> -    if [ -z "$DEVICE" ]; then
> -        create_block
>

This is the only place to use create_block function, if we don't need it
anymore why not removing the function definition together?



> -        if [ $? -ne 0 ]; then
> -            echo "no block device was specified on commandline."
> -            echo "Block device could not be created using loopback device"
> -            echo "Tests which require block device are disabled."
> -            echo "You can specify it with option -b"
> -       else
> -            export LTP_DEV=$DEVICE
> -        fi
> -    else
> +    if [ -n "$DEVICE" ]; then
>          export LTP_DEV=$DEVICE
>      fi
>  }
> --
> 2.18.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000f76bb305a9fec44e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 9, 2020 at 3:50 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Problem with runltp c=
reating and using single loop device for all tests<br>
is that if one test fails/gets stuck or fails to umount loop device<br>
for any reason, then all subsequent tests also fail, because<br>
they try to use mounted device.<br>
<br>
Don&#39;t force same loop device on all tests (unless it is chosen via<br>
env. variable DEVICE) and let LTP library try to acquire and release<br>
first usable loop device for each test.<br>
<br>
Fixes #703<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0runltp | 12 +-----------<br>
=C2=A01 file changed, 1 insertion(+), 11 deletions(-)<br>
<br>
diff --git a/runltp b/runltp<br>
index ec0811834862..94e290d6dbb9 100755<br>
--- a/runltp<br>
+++ b/runltp<br>
@@ -963,17 +963,7 @@ create_block()<br>
<br>
=C2=A0set_block_device()<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if [ -z &quot;$DEVICE&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_block<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">This is the only =
place to use create_block function, if we don&#39;t need it anymore why not=
 removing the function definition=C2=A0together?</div></div><div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;no block device was s=
pecified on commandline.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Block device could no=
t be created using loopback device&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Tests which require b=
lock device are disabled.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;You can specify it wi=
th option -b&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LTP_DEV=3D$DEVICE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 if [ -n &quot;$DEVICE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export LTP_DEV=3D$DEVICE<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
-- <br>
2.18.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000f76bb305a9fec44e--


--===============0323737364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0323737364==--

