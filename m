Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BA2AB1DF
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 08:46:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 687D43C2F6C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 08:46:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BD4D93C0354
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 08:46:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B59CD1A000A9
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 08:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604908011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2El8C0HVI291cdLcd0Xe6xcHnixwVdyvIcwHVltJglk=;
 b=PIgnlvJ8gEIIuL6GK4vD7ieK7HgjNcpCPcOgP/Sa+qdwwnbAaAEZkX3DZEY/YQ3qqMFb0f
 k+cM1IIWQmU7/zuuhUMP6VOvpQxkhBq54hGzKiFq/kHWHMgg0tYhXg3HYuV+lazLGtoiFp
 Bm3cRREigmwHHWpRduzz8OUn7CgpY/Y=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-mDDmwYczPW2hw1Wo31eSTA-1; Mon, 09 Nov 2020 02:46:33 -0500
X-MC-Unique: mDDmwYczPW2hw1Wo31eSTA-1
Received: by mail-yb1-f197.google.com with SMTP id c196so10181549ybf.0
 for <ltp@lists.linux.it>; Sun, 08 Nov 2020 23:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2El8C0HVI291cdLcd0Xe6xcHnixwVdyvIcwHVltJglk=;
 b=iJnpwHOxYv0ljtAFyzpll8k3RU3FCshMh3QJCzP+T9Vhe9yYT3l97WKoBpu+M2g46C
 4Y69wByyoMLSdukKoj/mLJ4Riv+91YYA1OTOjc6k7Z8huosHt53K9+uJTEZqrPj7AwtS
 FQPkNhbveI2pjtIV4EZygqTQxgamDoTkDMuMjjwG1BkdBLzc5bwHOh2bVVipl/zxVFX0
 G+ODrNKpSbHxYqldUYDMyQ8YVy9WK3hucAPuzlkEY1D1cXHqwzUNZFXvJSVvLBrDnwTJ
 Yx+bTfPZR/cGJt0NUmO8gmuMXlpkjWbNrfVBvYPwUOtGT8Ov+y+sNQ4VtRu3aZCYs1NL
 q9HA==
X-Gm-Message-State: AOAM5333sn8VzAlwBnwb/8/51JZ6QgDx0XFTINGLv+eXuU8RA/VofUcU
 OOoEwO4I1zFAJzFw2DOq1StEoHT0KfK8YjL7jezEJwk7GVkeisvh8AcTfvCA4uI9B0PCgPWp1s7
 iHEtfAdvRj9XIwGcDLDA79d2yQ8U=
X-Received: by 2002:a25:d9cf:: with SMTP id q198mr7054298ybg.243.1604907992418; 
 Sun, 08 Nov 2020 23:46:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/HEuVfNOvg53+tZK2TF1gDlOs0LDsLd4Bzb/NLHO7yWmEqZBAFJxb2Mern4reDtxPmEXVcA/njnT6J9EYRkQ=
X-Received: by 2002:a25:d9cf:: with SMTP id q198mr7054283ybg.243.1604907992187; 
 Sun, 08 Nov 2020 23:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20201106171707.7246-1-mdoucha@suse.cz>
In-Reply-To: <20201106171707.7246-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 9 Nov 2020 15:46:20 +0800
Message-ID: <CAEemH2cELURx1UDzuqYbxpa5-kUSOWWxHdQPV3eABXHMY22guA@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
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
Subject: Re: [LTP] [PATCH] Add tst_secureboot_enabled() helper function
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
Content-Type: multipart/mixed; boundary="===============0430800975=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0430800975==
Content-Type: multipart/alternative; boundary="000000000000c5996105b3a7c2ea"

--000000000000c5996105b3a7c2ea
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Sat, Nov 7, 2020 at 1:17 AM Martin Doucha <mdoucha@suse.cz> wrote:

> Also check for SecureBoot status in tst_lockdown_enabled() if the lockdown
> sysfile is not available/readable
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  configure.ac            |  1 +
>  include/mk/config.mk.in |  4 ++--
>  include/tst_lockdown.h  |  1 +
>  lib/tst_lockdown.c      | 44 +++++++++++++++++++++++++++++++++++++++++
>  m4/ltp-libefivar.m4     |  9 +++++++++
>  5 files changed, 57 insertions(+), 2 deletions(-)
>  create mode 100644 m4/ltp-libefivar.m4
>
> diff --git a/configure.ac b/configure.ac
> index 03e4e09c9..d9ca5ad38 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -296,6 +296,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
>  LTP_CHECK_CC_WARN_OLDSTYLE
>  LTP_CHECK_CLONE_SUPPORTS_7_ARGS
>  LTP_CHECK_CRYPTO
> +LTP_CHECK_EFIVAR
>  LTP_CHECK_FORTIFY_SOURCE
>  LTP_CHECK_KERNEL_DEVEL
>  LTP_CHECK_KEYUTILS_SUPPORT
> diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
> index 427608a17..cffd11245 100644
> --- a/include/mk/config.mk.in
> +++ b/include/mk/config.mk.in
> @@ -56,8 +56,8 @@ libdir                        := @libdir@
>  mandir                 := @mandir@
>
>  CPPFLAGS               := @CPPFLAGS@
> -CFLAGS                 := @CFLAGS@
> -LDLIBS                 := @LIBS@
> +CFLAGS                 := @CFLAGS@ @EFIVAR_CFLAGS@
> +LDLIBS                 := @LIBS@ @EFIVAR_LIBS@
>  LDFLAGS                        := @LDFLAGS@
>
>  DEBUG_CFLAGS           ?= -g
> diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
> index 78eaeccea..172a7daf5 100644
> --- a/include/tst_lockdown.h
> +++ b/include/tst_lockdown.h
> @@ -5,6 +5,7 @@
>
>  #define PATH_LOCKDOWN  "/sys/kernel/security/lockdown"
>
> +int tst_secureboot_enabled(void);
>  int tst_lockdown_enabled(void);
>
>  #endif /* TST_LOCKDOWN_H */
> diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
> index e7c19813c..47a112b4b 100644
> --- a/lib/tst_lockdown.c
> +++ b/lib/tst_lockdown.c
> @@ -2,21 +2,65 @@
>
>  #define TST_NO_DEFAULT_MAIN
>
> +#include "config.h"
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <sys/mount.h>
>
> +#ifdef HAVE_EFIVAR
> +#include <efivar.h>
> +#endif /* HAVE_EFIVAR */
> +
>  #include "tst_test.h"
>  #include "tst_safe_macros.h"
>  #include "tst_safe_stdio.h"
>  #include "tst_lockdown.h"
>
> +int tst_secureboot_enabled(void)
> +{
> +#ifdef HAVE_EFIVAR
> +       int ret, status = 0;
> +       uint8_t *data = NULL;
> +       size_t size = 0;
> +       uint32_t attrs = 0;
> +
>

Maybe we need call efi_variables_supported() to make sure if the UEFI
variable facility is supported?


> +       efi_error_clear();
> +       ret = efi_get_variable(EFI_GLOBAL_GUID, "SecureBoot", &data, &size,
> +               &attrs);
> +
> +       if (ret) {
> +               char *fn, *func, *msg;
> +               int ln, err, i = 0;
> +
> +               while (efi_error_get(i++, &fn, &func, &ln, &msg, &err) > 0)
> +                       tst_res(TINFO, "Efivar error: %s", msg);
> +
> +               efi_error_clear();
> +       } else if (data) {
> +               status = *data;
> +               tst_res(TINFO, "SecureBoot: %s", status ? "on" : "off");
> +       }
> +
> +       if (data)
> +               free(data);
> +
> +       return status;
> +#else /* HAVE_EFIVAR */
> +       tst_res(TINFO, "%s(): LTP was built without efivar support",
> __func__);
> +       return -1;
> +#endif /* HAVE_EFIVAR */
> +}
> +
>  int tst_lockdown_enabled(void)
>  {
>         char line[BUFSIZ];
>         FILE *file;
>
>         if (access(PATH_LOCKDOWN, F_OK) != 0) {
> +               /* SecureBoot enabled means integrity lockdown */
> +               if (tst_secureboot_enabled() > 0)
> +                       return 1;
> +
>                 tst_res(TINFO, "Unable to determine system lockdown
> state");
>                 return 0;
>         }
> diff --git a/m4/ltp-libefivar.m4 b/m4/ltp-libefivar.m4
> new file mode 100644
> index 000000000..0a2750701
> --- /dev/null
> +++ b/m4/ltp-libefivar.m4
> @@ -0,0 +1,9 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
> +
> +AC_DEFUN([LTP_CHECK_EFIVAR], [
> +       dnl efivar library and headers
> +       PKG_CHECK_MODULES([EFIVAR], [efivar], [
> +               AC_DEFINE([HAVE_EFIVAR], [1], [Define to 1 if you have
> libefivar library and headers])
> +       ], [have_efivar=no])
> +])
> --
> 2.28.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000c5996105b3a7c2ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Martin,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Nov 7, 2020 at 1:17 AM Martin Doucha =
&lt;<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Also check for Secure=
Boot status in tst_lockdown_enabled() if the lockdown<br>
sysfile is not available/readable<br>
<br>
Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
---<br>
=C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0include/mk/<a href=3D"http://config.mk.in" rel=3D"noreferrer" target=
=3D"_blank">config.mk.in</a> |=C2=A0 4 ++--<br>
=C2=A0include/tst_lockdown.h=C2=A0 |=C2=A0 1 +<br>
=C2=A0lib/tst_lockdown.c=C2=A0 =C2=A0 =C2=A0 | 44 +++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0m4/ltp-libefivar.m4=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++++<br>
=C2=A05 files changed, 57 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 m4/ltp-libefivar.m4<br>
<br>
diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
index 03e4e09c9..d9ca5ad38 100644<br>
--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
@@ -296,6 +296,7 @@ LTP_CHECK_CAPABILITY_SUPPORT<br>
=C2=A0LTP_CHECK_CC_WARN_OLDSTYLE<br>
=C2=A0LTP_CHECK_CLONE_SUPPORTS_7_ARGS<br>
=C2=A0LTP_CHECK_CRYPTO<br>
+LTP_CHECK_EFIVAR<br>
=C2=A0LTP_CHECK_FORTIFY_SOURCE<br>
=C2=A0LTP_CHECK_KERNEL_DEVEL<br>
=C2=A0LTP_CHECK_KEYUTILS_SUPPORT<br>
diff --git a/include/mk/<a href=3D"http://config.mk.in" rel=3D"noreferrer" =
target=3D"_blank">config.mk.in</a> b/include/mk/<a href=3D"http://config.mk=
.in" rel=3D"noreferrer" target=3D"_blank">config.mk.in</a><br>
index 427608a17..cffd11245 100644<br>
--- a/include/mk/<a href=3D"http://config.mk.in" rel=3D"noreferrer" target=
=3D"_blank">config.mk.in</a><br>
+++ b/include/mk/<a href=3D"http://config.mk.in" rel=3D"noreferrer" target=
=3D"_blank">config.mk.in</a><br>
@@ -56,8 +56,8 @@ libdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D @libdir@<br>
=C2=A0mandir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
=3D @mandir@<br>
<br>
=C2=A0CPPFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D @=
CPPFLAGS@<br>
-CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D @=
CFLAGS@<br>
-LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D @=
LIBS@<br>
+CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D @=
CFLAGS@ @EFIVAR_CFLAGS@<br>
+LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D @=
LIBS@ @EFIVAR_LIBS@<br>
=C2=A0LDFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 :=3D @LDFLAGS@<br>
<br>
=C2=A0DEBUG_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D -g<br>
diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h<br>
index 78eaeccea..172a7daf5 100644<br>
--- a/include/tst_lockdown.h<br>
+++ b/include/tst_lockdown.h<br>
@@ -5,6 +5,7 @@<br>
<br>
=C2=A0#define PATH_LOCKDOWN=C2=A0 &quot;/sys/kernel/security/lockdown&quot;=
<br>
<br>
+int tst_secureboot_enabled(void);<br>
=C2=A0int tst_lockdown_enabled(void);<br>
<br>
=C2=A0#endif /* TST_LOCKDOWN_H */<br>
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c<br>
index e7c19813c..47a112b4b 100644<br>
--- a/lib/tst_lockdown.c<br>
+++ b/lib/tst_lockdown.c<br>
@@ -2,21 +2,65 @@<br>
<br>
=C2=A0#define TST_NO_DEFAULT_MAIN<br>
<br>
+#include &quot;config.h&quot;<br>
=C2=A0#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
<br>
+#ifdef HAVE_EFIVAR<br>
+#include &lt;efivar.h&gt;<br>
+#endif /* HAVE_EFIVAR */<br>
+<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_safe_macros.h&quot;<br>
=C2=A0#include &quot;tst_safe_stdio.h&quot;<br>
=C2=A0#include &quot;tst_lockdown.h&quot;<br>
<br>
+int tst_secureboot_enabled(void)<br>
+{<br>
+#ifdef HAVE_EFIVAR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, status =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *data =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t attrs =3D 0;<br>
+<br></blockquote><div><br></div><span class=3D"gmail_default" style=3D"fon=
t-size:small">Maybe</span>=C2=A0we need <span class=3D"gmail_default" style=
=3D"font-size:small">call </span>efi_variables_supported() <span class=3D"g=
mail_default" style=3D"font-size:small">to make sure</span>=C2=A0if the UEF=
I</div><div class=3D"gmail_quote">variable facility is supported<span class=
=3D"gmail_default">?</span></div><div class=3D"gmail_quote"><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0efi_error_clear();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D efi_get_variable(EFI_GLOBAL_GUID, &quot=
;SecureBoot&quot;, &amp;data, &amp;size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;attrs);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *fn, *func, *m=
sg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ln, err, i =3D =
0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (efi_error_ge=
t(i++, &amp;fn, &amp;func, &amp;ln, &amp;msg, &amp;err) &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO, &quot;Efivar error: %s&quot;, msg);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_error_clear();<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D *data;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;SecureBoot: %s&quot;, status ? &quot;on&quot; : &quot;off&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(data);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
+#else /* HAVE_EFIVAR */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;%s(): LTP was built withou=
t efivar support&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+#endif /* HAVE_EFIVAR */<br>
+}<br>
+<br>
=C2=A0int tst_lockdown_enabled(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char line[BUFSIZ];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *file;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(PATH_LOCKDOWN, F_OK) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* SecureBoot enabl=
ed means integrity lockdown */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_secureboot_=
enabled() &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quo=
t;Unable to determine system lockdown state&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/m4/ltp-libefivar.m4 b/m4/ltp-libefivar.m4<br>
new file mode 100644<br>
index 000000000..0a2750701<br>
--- /dev/null<br>
+++ b/m4/ltp-libefivar.m4<br>
@@ -0,0 +1,9 @@<br>
+dnl SPDX-License-Identifier: GPL-2.0-or-later<br>
+dnl Copyright (c) 2020 SUSE LLC &lt;<a href=3D"mailto:mdoucha@suse.cz" tar=
get=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
+<br>
+AC_DEFUN([LTP_CHECK_EFIVAR], [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl efivar library and headers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES([EFIVAR], [efivar], [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_EFI=
VAR], [1], [Define to 1 if you have libefivar library and headers])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0], [have_efivar=3Dno])<br>
+])<br>
-- <br>
2.28.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000c5996105b3a7c2ea--


--===============0430800975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0430800975==--

