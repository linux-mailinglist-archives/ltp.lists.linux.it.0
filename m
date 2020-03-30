Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671A19744B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 08:14:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D2AE3C3143
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 08:14:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 43F993C3137
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 08:14:01 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id DE00A6007B4
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 08:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585548839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUfJUOK+gf3Js76DjuWg7rylyRANVXFcWY90FgfhI9E=;
 b=bbXf05HfVLf7yfbYH/9852wRBHdk2e9wV0ivxoxklvn7j+pX3b8n/RdW3GKEMivxphwNXn
 zMPp5k2NvUa0E7Nmdn79t8u+jhuQsjwQujKkza1WWgFvLb8SkpWu1t17+XrCBpYMLEQtQX
 P0AagrfoJP9bK9sWxV+xY9lNK2vFXEs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-YtxXm0MMO06AUQyx7eBgMQ-1; Mon, 30 Mar 2020 02:13:56 -0400
X-MC-Unique: YtxXm0MMO06AUQyx7eBgMQ-1
Received: by mail-lf1-f72.google.com with SMTP id b24so7087059lff.12
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 23:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XzgcuczZ0YBe2JG2VjkM4PJJ8/im4huuZEjibcaanT4=;
 b=mJ51QVCxTAPAltWl1mpwA8Aj3XkiSsI3qVp+yFQ4hVWcQa3/DzVm4xMDo7TqugScc4
 elG2rgp5ah+zCkvc4HUwkHY72Br/JFzf6ZgIbKdK1vlN4rYKXFTulJOPWJShCSHZcztf
 eQr2e5GTl9sCJiy+7nCu/93R3jb8nSiuSBrFjvYzItP3C/jAkDlAGghm07UWswoGhY9j
 9yVYb8hi8mIH31R+YCqNiVyPfQ0x4jtIOA8kf+4b3cusiAmNn6tCMY15nS74qGAVundE
 tBuv46jH05Oea2H1tM6JiJMJI31KEs3DloFOC1kpug7YELEBHVTJMfi8NTilfUOn2kjg
 IDYA==
X-Gm-Message-State: AGi0PuaRgR1usvha7x4pkr/mpsc/RbrkeHMizrz2EX2SWAlQhdHmdaZZ
 FOGYPVLKwyo51/5aXP998w2AJx965NVN+7T7uK74lA7//2NV9uR1NGYxkNpsI16PGDXwXxpWwPt
 ZZV8DPRPkXMXroweqEl1XrJDjnGA=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6062107ljc.217.1585548835198; 
 Sun, 29 Mar 2020 23:13:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypICso++rlFkOMg+KQgU7AQPvaFioePah/XIrwQ0eInbNF0Yc/knv7BFx08RyRVhGdeveW8zyq7vPM/m/Vz0TM0=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr6062095ljc.217.1585548834981; 
 Sun, 29 Mar 2020 23:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-2-pvorel@suse.cz>
In-Reply-To: <20200327213924.18816-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Mar 2020 14:13:43 +0800
Message-ID: <CAEemH2c2Rq9x53fr2-KRaLpJ55xbuwVO96YWzJXAEdgcx2vvCQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/6] lib: Implement .needs_cmds
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
Content-Type: multipart/mixed; boundary="===============0503768032=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0503768032==
Content-Type: multipart/alternative; boundary="000000000000155d0f05a20c5bae"

--000000000000155d0f05a20c5bae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2020 at 5:39 AM Petr Vorel <pvorel@suse.cz> wrote:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New commit.
>
>  doc/test-writing-guidelines.txt | 15 +++++++++++++++
>  include/tst_test.h              |  3 +++
>  lib/tst_test.c                  | 11 +++++++++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index 32c9e87df..f7206f1bf 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -2023,6 +2023,21 @@ struct tst_test test =3D {
>  };
>
>  ------------------------------------------------------------------------=
-------
>
> +2.2.35 Checking for required binaries
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>

Maybe better to talk commands but not binaries, since not all of the
commands are binary, there is possible python, perl or shell executable
file need check too. Isn't it?

--=20
Regards,
Li Wang

--000000000000155d0f05a20c5bae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Mar 28, 2020 at 5:39 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by=
: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel=
@suse.cz</a>&gt;<br>
---<br>
New commit.<br>
<br>
=C2=A0doc/test-writing-guidelines.txt | 15 +++++++++++++++<br>
=C2=A0include/tst_test.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 +++<br>
=C2=A0lib/tst_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 11 +++++++++++<br>
=C2=A03 files changed, 29 insertions(+)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index 32c9e87df..f7206f1bf 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -2023,6 +2023,21 @@ struct tst_test test =3D {<br>
=C2=A0};<br>
=C2=A0---------------------------------------------------------------------=
----------<br>
<br>
+2.2.35 Checking for required binaries<br>
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">Maybe better to talk=
 commands but not binaries, since not all of the commands are binary, there=
 is possible python, perl or shell executable file need check too. Isn&#39;=
t it?</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000155d0f05a20c5bae--


--===============0503768032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0503768032==--

