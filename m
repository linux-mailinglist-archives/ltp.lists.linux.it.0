Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9A2F2CEF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 11:34:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E74653C2A27
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 11:34:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 86D5E3C02FA
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 11:34:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 20D3F1000352
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 11:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610447673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYGrTwNYm7nSQTsUEQX6YC7mcWlaZbHlEogfwzgCVNc=;
 b=cwHidBZjCnQWnBFRDseQ57J9ATXREquU9VJK1Ch+jHlO6g4GfRs2ZlKeXK4+x+ZuGgUsKx
 VD5fVXJCa1ILLehP6mmzIu5L4rgP/GDgoHDeUGjFrY+CkGUqBWLucLiH9U1+qG+/HsB+yh
 qIiNjVp+0534OMKqAiYZGnHZlziKuJk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-7xSEjDB0PdyFXhJ7Nz60iQ-1; Tue, 12 Jan 2021 05:34:30 -0500
X-MC-Unique: 7xSEjDB0PdyFXhJ7Nz60iQ-1
Received: by mail-yb1-f197.google.com with SMTP id b123so2008193ybh.17
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 02:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYGrTwNYm7nSQTsUEQX6YC7mcWlaZbHlEogfwzgCVNc=;
 b=nzTnb/h2PzN3wfHocjnKm/p9YH5uLjpyR10bqgSRLuejuClbq3IkRmsPp4a1Iu4f+g
 y5hN5a7TyJT+58Cot/fAqP4Qr5mRqYMDYs7F1GYpm9jJUf8kfY4RZJuDXZa7bYHvmlO5
 qPOo124cSpc/HfHPBIaEH09G1wAlo7w0L9GMClgqKtLPDgJo8fBGbJCJZMmUR2bbbLDA
 WV/S9giRqYUvvQmyzr+TgwTXCbl5O31ElCrRZY77S0avQSNJ7SnoMLGcDTIusbqV3zPR
 IGR2/YN64MEMCXJoTicS3mRmOjkZPchcsx2wz4DM3eWb0SuGW6tjoGqR3iIyoh+E34Vo
 Fj0g==
X-Gm-Message-State: AOAM530Y1eqwGg7YklNBAtU294pNB11ndgIxYWGn3mjWu713QSeXy0Uy
 NzVWfDGhUsyHKfsoYo2uVcety/PGWMctgCRp6gh+kS0gwSNTPDkFZhlIfSp51GWjZ1TRgg7v8Rn
 4AyEjJgLAhXHSfUvxjWdOHqZPXo0=
X-Received: by 2002:a25:cc92:: with SMTP id l140mr5955893ybf.252.1610447669556; 
 Tue, 12 Jan 2021 02:34:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw33ngO8r5Pz5L0I13V6n5IXYKcUF2B2OPctyDWcwqLQdiXlEb+OPvI1R5cl6hUOl76ed/t2R94qRPnj54U49g=
X-Received: by 2002:a25:cc92:: with SMTP id l140mr5955872ybf.252.1610447669297; 
 Tue, 12 Jan 2021 02:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20210111123626.28932-1-pvorel@suse.cz>
In-Reply-To: <20210111123626.28932-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Jan 2021 18:34:17 +0800
Message-ID: <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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
Content-Type: multipart/mixed; boundary="===============1681541593=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1681541593==
Content-Type: multipart/alternative; boundary="0000000000004219c305b8b19141"

--0000000000004219c305b8b19141
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 11, 2021 at 8:36 PM Petr Vorel <pvorel@suse.cz> wrote:

> Using pkg-config is less error prone during cross compilation.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> if you agree with this, I'll replace (probably after release) ACL_LIBS,
> CAP_LIBS, CRYPTO_LIBS, SELINUX_LIBS (to follow libmnl and libtirpc).
>
+1


>
> libaio and libnuma does not support pkg-config.
>
> Tested: https://travis-ci.org/github/pevik/ltp/builds/753925166
>
> [...]


> diff --git a/m4/ltp-keyutils.m4 b/m4/ltp-keyutils.m4
> deleted file mode 100644
> index 451c549f3..000000000
> --- a/m4/ltp-keyutils.m4
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -dnl SPDX-License-Identifier: GPL-2.0-or-later
> -dnl Copyright (c) 2016 Fujitsu Ltd.
> -dnl Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> -dnl Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
> -
> -AC_DEFUN([LTP_CHECK_KEYUTILS_SUPPORT], [
> -       AC_CHECK_LIB([keyutils], [add_key],
> -       [AC_DEFINE(HAVE_LIBKEYUTILS, 1, [Define to 1 if you have
> libkeyutils installed.])
> -             AC_SUBST(KEYUTILS_LIBS, "-lkeyutils")])
> -])
> diff --git a/m4/ltp-libkeyutils.m4 b/m4/ltp-libkeyutils.m4
> new file mode 100644
> index 000000000..f5d128969
> --- /dev/null
> +++ b/m4/ltp-libkeyutils.m4
> @@ -0,0 +1,8 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +
> +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
> +    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [
>

I guess the list-of-modules should be [keyutils-libs] but not [libkeyutils]?

-- 
Regards,
Li Wang

--0000000000004219c305b8b19141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jan 11, 2021 at 8:36 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Using pkg-con=
fig is less error prone during cross compilation.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
if you agree with this, I&#39;ll replace (probably after release) ACL_LIBS,=
<br>
CAP_LIBS, CRYPTO_LIBS, SELINUX_LIBS (to follow libmnl and libtirpc).<br></b=
lockquote><div><span class=3D"gmail_default" style=3D"font-size:small">+1</=
span></div><div><span class=3D"gmail_default" style=3D"font-size:small"></s=
pan>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
libaio and libnuma does not support pkg-config.<br>
<br>
Tested: <a href=3D"https://travis-ci.org/github/pevik/ltp/builds/753925166"=
 rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/lt=
p/builds/753925166</a><br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">[...]</span>=C2=A0<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/m4/ltp-keyutils.m4 b/m4/ltp-keyutils.m4<br>
deleted file mode 100644<br>
index 451c549f3..000000000<br>
--- a/m4/ltp-keyutils.m4<br>
+++ /dev/null<br>
@@ -1,10 +0,0 @@<br>
-dnl SPDX-License-Identifier: GPL-2.0-or-later<br>
-dnl Copyright (c) 2016 Fujitsu Ltd.<br>
-dnl Copyright (c) 2017 Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" ta=
rget=3D"_blank">pvorel@suse.cz</a>&gt;<br>
-dnl Author: Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" targe=
t=3D"_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
-<br>
-AC_DEFUN([LTP_CHECK_KEYUTILS_SUPPORT], [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB([keyutils], [add_key],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_DEFINE(HAVE_LIBKEYUTILS, 1, [Define to 1 if=
 you have libkeyutils installed.])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(KEYUTILS_LIBS, &q=
uot;-lkeyutils&quot;)])<br>
-])<br>
diff --git a/m4/ltp-libkeyutils.m4 b/m4/ltp-libkeyutils.m4<br>
new file mode 100644<br>
index 000000000..f5d128969<br>
--- /dev/null<br>
+++ b/m4/ltp-libkeyutils.m4<br>
@@ -0,0 +1,8 @@<br>
+dnl SPDX-License-Identifier: GPL-2.0-or-later<br>
+dnl Copyright (c) 2020 Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" ta=
rget=3D"_blank">pvorel@suse.cz</a>&gt;<br>
+<br>
+AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [<br>
+=C2=A0 =C2=A0 PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [<br></block=
quote><div><br></div>I guess the list-of-modules should be [keyutils-libs] =
but not [libkeyutils]?<div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004219c305b8b19141--


--===============1681541593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1681541593==--

