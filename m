Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEB160E47
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:17:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFF5D3C25AE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:17:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 272F43C25BF
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:17:15 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 75B9C200DEE
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581931032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2cZkZZlpKLna8IuG1ycGm4r265b3XSqfe0LpT1oRaXk=;
 b=L5PZxjLc1njeGjk1IeELwyNhZhDsqv5MZao/qWWGAGlRkNn+4a+JLChQaFY7Ip+s6I9zgq
 l+JUyekwg/E09V2xOhSJUaO/ZKQI/SjoRUvlxUs2biD5qwYJ007bA3V1FaDjqV6UkV4afh
 lWdX5T5FC7VDptbSpL181yaLrlkgzG4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-UBKWV2IDMCKqUi3nD9015A-1; Mon, 17 Feb 2020 04:17:04 -0500
Received: by mail-oi1-f200.google.com with SMTP id 10so7925483oir.11
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 01:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kYuMDiVZ4/DHc4baOaDKm4VniOUkJ7o9Hx96PGu+zY=;
 b=hTeg0m4QYlIyHesisuoAPNYKJpuZNWjyV2NwD8M42wRgf1MeA+LqcpqGO6j61lUvLy
 xhWLo8qAza801jJYE4+jfgZrfohMsiE/FfwMUBaGwnF9KfoeWY3q/3eOLfAEGqvGP/cp
 BZpnsMLeWeWEiDhBB0kUDTPL2A1KOpqBRj4mJ9YU1vaqPa+Cz6l/qgf27Fmrva6nXFc0
 KngqPgkqDH8c3xRBzPmuWtn7RwUkbCDs/W0COhxuURjl9FAIQ4JJr/RC7tSVzlASBlg+
 ik/GNoaS/hM4Kyy/Lg3mxAWQJsBCvBTb/r46QmaxaLOvM7zZXZeEhXpT9OuCP24gb7CR
 KTQg==
X-Gm-Message-State: APjAAAVDzqcwMQ/JXw2TjjvtzCPD+R7SDPhUvHbOnbSdupZUsfV1HAlu
 T5rZwQPDUj5iakWBJjRex3BTAlQ1Tifzc+98eUBWvCrbMVs9fI4GOYY3C3F7SMCtDzPyTa/vTMh
 dqi6hOY8QS5Q2n9H1BXO0KmotT6g=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr12235781otq.17.1581931023484; 
 Mon, 17 Feb 2020 01:17:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPqgCA4ZCtr41hD7GsZwe/U+7Rqtwat//RZ8x9faro1SsexdWaU7C1PRXntsSyKa7Ls6V/3ko6McKDE0te4h4=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr12235768otq.17.1581931023190; 
 Mon, 17 Feb 2020 01:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20200217084622.11199-1-pvorel@suse.cz>
 <20200217084622.11199-5-pvorel@suse.cz>
In-Reply-To: <20200217084622.11199-5-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 17:16:51 +0800
Message-ID: <CAEemH2cGsXkgkfrFN2XW9ByWqNnknR+-9yCv6T+hqAp13PjVyQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: UBKWV2IDMCKqUi3nD9015A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 4/4] syscalls/fsmount01: Add test for fsmount
 series API
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1470037663=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1470037663==
Content-Type: multipart/alternative; boundary="000000000000b25f2b059ec20467"

--000000000000b25f2b059ec20467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Thanks for the quick response to the patch improvement.

On Mon, Feb 17, 2020 at 4:47 PM Petr Vorel <pvorel@suse.cz> wrote:

> From: Zorro Lang <zlang@redhat.com>
>
> Add basic tests tests for new mount API from kernel v5.2.
> Testing mount and umount filesystems with fsopen(), fsconfig(),
> fsmount() and move_mount().
>
> NOTE: most of the syscalls numbers were added in previous commits
> (c2f27f6e9b, 01e4dc2222, 87a2612857).
>

87a2612857 is invalid?


> Signed-off-by: Zorro Lang <zlang@redhat.com>
> Acked-by: Li Wang <liwang@redhat.com>
> [ pvorel: rebased, cleanup autotools and other small fixes ]
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  include/lapi/syscalls/powerpc64.in            |  4 +
>  runtest/syscalls                              |  2 +
>  testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
>  testcases/kernel/syscalls/fsmount/Makefile    |  8 ++
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 95 +++++++++++++++++++
>  5 files changed, 110 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c
>
> diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/
> powerpc64.in
> index 2c1f105c1..beb0e6812 100644
> --- a/include/lapi/syscalls/powerpc64.in
> +++ b/include/lapi/syscalls/powerpc64.in
> @@ -371,3 +371,7 @@ pidfd_open 434
>  pkey_mprotect 386
>  pkey_alloc 384
>  pkey_free 385
> +move_mount 429
> +fsopen 430
> +fsconfig 431
> +fsmount 432
>

As Viresh and I commented in the previous email this four syscalls-number
should be deleted from the patch.

Besides that, the patchset looks good to me.
    Acked-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--000000000000b25f2b059ec20467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Thanks for the quick response=C2=A0to the patch improvement.<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Feb 17, 2020 at 4:47 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.=
cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Zorro Lang &lt;<a href=3D"mailto:=
zlang@redhat.com" target=3D"_blank">zlang@redhat.com</a>&gt;<br>
<br>
Add basic tests tests for new mount API from kernel v5.2.<br>
Testing mount and umount filesystems with fsopen(), fsconfig(),<br>
fsmount() and move_mount().<br>
<br>
NOTE: most of the syscalls numbers were added in previous commits<br>
(c2f27f6e9b, 01e4dc2222, 87a2612857).<br></blockquote><div><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">87a2612857 is invalid?</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Signed-off-by: Zorro Lang &lt;<a href=3D"mailto:zlang@redhat.com" target=3D=
"_blank">zlang@redhat.com</a>&gt;<br>
Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank=
">liwang@redhat.com</a>&gt;<br>
[ pvorel: rebased, cleanup autotools and other small fixes ]<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"noreferr=
er" target=3D"_blank">powerpc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0testcases/kernel/syscalls/fsmount/.gitignore=C2=A0 |=C2=A0 1 +<br>
=C2=A0testcases/kernel/syscalls/fsmount/Makefile=C2=A0 =C2=A0 |=C2=A0 8 ++<=
br>
=C2=A0testcases/kernel/syscalls/fsmount/fsmount01.c | 95 ++++++++++++++++++=
+<br>
=C2=A05 files changed, 110 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsmount/Makefile<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c<br>
<br>
diff --git a/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"n=
oreferrer" target=3D"_blank">powerpc64.in</a> b/include/lapi/syscalls/<a hr=
ef=3D"http://powerpc64.in" rel=3D"noreferrer" target=3D"_blank">powerpc64.i=
n</a><br>
index 2c1f105c1..beb0e6812 100644<br>
--- a/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"noreferr=
er" target=3D"_blank">powerpc64.in</a><br>
+++ b/include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"noreferr=
er" target=3D"_blank">powerpc64.in</a><br>
@@ -371,3 +371,7 @@ pidfd_open 434<br>
=C2=A0pkey_mprotect 386<br>
=C2=A0pkey_alloc 384<br>
=C2=A0pkey_free 385<br>
+move_mount 429<br>
+fsopen 430<br>
+fsconfig 431<br>
+fsmount 432<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">As Viresh and I commented in the previous email thi=
s four syscalls-number should be deleted from the patch.</div><div class=3D=
"gmail_default"><br></div><div class=3D"gmail_default">Besides that, the pa=
tchset looks good to me.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 =C2=A0 Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redh=
at.com" target=3D"_blank">liwang@redhat.com</a>&gt;</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--000000000000b25f2b059ec20467--


--===============1470037663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1470037663==--

