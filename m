Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2AAD88CF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 08:57:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 449A93C2371
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 08:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E2E513C18B5
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 08:57:18 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 58DAF600C2A
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 08:57:16 +0200 (CEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 58A7FC08EC0F
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 06:57:15 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id x125so13202055oig.7
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 23:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jEMaALyr9/ZWUwiLYOcjVN0CwGkqWLIkCZC/1RPTInc=;
 b=T6PrCo2cW4+k4WxRupGHYf8UzevxIy7NyCiem89n72r85DtgM4an3ootpRXJU38Klo
 OC/qV9lSeMkgCUCxQeQnSTWQ11GobA8Kj66ntFhqsrWGtrHDq25UBtRxMAHohyPaYyCv
 Eyfw3R6cqsXa9tjmXRx7/3CyDx6VYQYhkosjIlCiEI2bH+s/2fh+sUdgafxXpHQs4AiI
 wWoXB28Wiq7Z0nr6ElZQC/ZJNiM1Ll9c2aVVNO8W2VPwGQ6p/x5rVCTdHcADF8MXRMzH
 7Ac378Ylsmfp8uWw8cA5qFgDPSkOat4sO1FYWm1oTNseIxDpStG+PRHCQfCM1+/FX5y+
 R0hw==
X-Gm-Message-State: APjAAAVoohVo1ZadMx0PLPOb4bQK7PYkUCDFk9HtqMCKV9rcZIbv/5IY
 LR7cHALFKOPwlf8pTdWfqliRlQz9vLUkGXBZg6gSRVrF/SDH+1vqhQhCvEcpnl72454/EZS0zVm
 cMLH2lwQGKuGV0NYFEQWKmbwLioQ=
X-Received: by 2002:aca:d508:: with SMTP id m8mr2032584oig.144.1571209034811; 
 Tue, 15 Oct 2019 23:57:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkkHz4YnCW6oKLX1KLty/pzDII5cdam9mAGCF70/4zXYH4W8Wpd9xOv2e/wLvfoRU+UQnnaXX98juz8zladgU=
X-Received: by 2002:aca:d508:: with SMTP id m8mr2032575oig.144.1571209034496; 
 Tue, 15 Oct 2019 23:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191015101534.17691-1-liwang@redhat.com>
 <87sgnuw48s.fsf@rpws.prws.suse.cz>
In-Reply-To: <87sgnuw48s.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Oct 2019 14:57:03 +0800
Message-ID: <CAEemH2dfHM7ExwYwdc-_oEw9_DftgfRw3mn2pnAEf1CKxyyn2A@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] include: undefine _LINUX_TYPES_H if including
 sys/capability.h
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============0521996368=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0521996368==
Content-Type: multipart/alternative; boundary="0000000000005e9b610595019c3d"

--0000000000005e9b610595019c3d
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe <rpalethorpe@suse.de> wrote:

...
> >  #ifdef HAVE_SYS_CAPABILITY_H
> >  # include <sys/capability.h>
> > +# undef _LINUX_TYPES_H
>
> My concern here is if linux/types.h has already been included. Then this
> could cause a redefinition error if it is included again.
>

Hmm, it looks tricky to solve this, because I didn't find a macro to show
version in libcap files.

Another method I can think of is to build a small program to check if that
libcap version is newer or not during the configure phase. If yes, then
export a new macro HAVE_NEWER_LIBCAP to be used in /lapi/capability.h.

The following patch has been verified on both rhel6 and rhel8, any comments?
[I'm not familiar with m4 syntax, just copy from other places]

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 3c2ee7937..3607179b5 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -10,7 +10,9 @@

 #ifdef HAVE_SYS_CAPABILITY_H
 # include <sys/capability.h>
-# undef _LINUX_TYPES_H
+# ifndef HAVE_NEWER_LIBCAP
+#  undef _LINUX_TYPES_H
+# endif
 #endif

 #ifndef CAP_NET_RAW
diff --git a/m4/ltp-cap.m4 b/m4/ltp-cap.m4
index 02d3cac8c..8b1546401 100644
--- a/m4/ltp-cap.m4
+++ b/m4/ltp-cap.m4
@@ -14,4 +14,20 @@ if test "x$cap_libs" != x; then
        AC_DEFINE(HAVE_LIBCAP)
 fi
 AC_SUBST(CAP_LIBS,$cap_libs)
+
+AH_TEMPLATE(HAVE_NEWER_LIBCAP,
+[Define to 1 if you have newer libcap-2 installed.])
+AC_COMPILE_IFELSE([AC_LANG_SOURCE([
+#include <sys/capability.h>
+#include <linux/types.h>
+int main(void) {
+       __u16 a;
+       __u32 b;
+       return 0;
+}])],[has_newer_libcap="yes"])
+
+if test "x$has_newer_libcap" = xyes; then
+       AC_DEFINE(HAVE_NEWER_LIBCAP)
+fi
 ])
-- 
Regards,
Li Wang

--0000000000005e9b610595019c3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.de"=
>rpalethorpe@suse.de</a>&gt; wrote:<br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" st=
yle=3D"font-size:small">...</span><br>
&gt;=C2=A0 #ifdef HAVE_SYS_CAPABILITY_H<br>
&gt;=C2=A0 # include &lt;sys/capability.h&gt;<br>
&gt; +# undef _LINUX_TYPES_H<br>
<br>
My concern here is if linux/types.h has already been included. Then this<br=
>
could cause a redefinition error if it is included again.<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">H=
mm, it looks tricky to solve this, because I didn&#39;t find a macro to sho=
w version in libcap files.</div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">Another method I can think of is to build a smal=
l program to check if that libcap version is newer or not during the config=
ure phase. If yes, then export a new macro=C2=A0HAVE_NEWER_LIBCAP to be use=
d in /lapi/capability.h.</div></div></div><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">The following patch has been veri=
fied on both rhel6 and rhel8, any comments?</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">[I&#39;m not familiar with m4 syntax, just cop=
y from other places]</div><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">diff --git a/include/lapi/capability.h b/include/lapi/capab=
ility.h</div>index 3c2ee7937..3607179b5 100644<br>--- a/include/lapi/capabi=
lity.h<br>+++ b/include/lapi/capability.h<br>@@ -10,7 +10,9 @@<br>=C2=A0<br=
>=C2=A0#ifdef HAVE_SYS_CAPABILITY_H<br>=C2=A0# include &lt;sys/capability.h=
&gt;<br>-# undef _LINUX_TYPES_H<br>+# ifndef HAVE_NEWER_LIBCAP<br>+# =C2=A0=
undef _LINUX_TYPES_H<br>+# endif<br>=C2=A0#endif<br>=C2=A0<br>=C2=A0#ifndef=
 CAP_NET_RAW<br>diff --git a/m4/ltp-cap.m4 b/m4/ltp-cap.m4<br>index 02d3cac=
8c..8b1546401 100644<br>--- a/m4/ltp-cap.m4<br>+++ b/m4/ltp-cap.m4<br>@@ -1=
4,4 +14,20 @@ if test &quot;x$cap_libs&quot; !=3D x; then<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 AC_DEFINE(HAVE_LIBCAP)<br>=C2=A0fi<br>=C2=A0AC_SUBST(CAP_LIBS=
,$cap_libs)<br>+<br>+AH_TEMPLATE(HAVE_NEWER_LIBCAP,<br>+[Define to 1 if you=
 have newer libcap-2 installed.])<br>+AC_COMPILE_IFELSE([AC_LANG_SOURCE([<b=
r>+#include &lt;sys/capability.h&gt;<br>+#include &lt;linux/types.h&gt;<br>=
+int main(void) {<br>+ =C2=A0 =C2=A0 =C2=A0 __u16 a;<br>+ =C2=A0 =C2=A0 =C2=
=A0 __u32 b;<br>+ =C2=A0 =C2=A0 =C2=A0 return 0;<br>+}])],[has_newer_libcap=
=3D&quot;yes&quot;])<br>+<br>+if test &quot;x$has_newer_libcap&quot; =3D xy=
es; then<br>+ =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_NEWER_LIBCAP)<br>+fi<br>=
=C2=A0])<br><div class=3D"gmail_default" style=3D"font-size:small"></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005e9b610595019c3d--

--===============0521996368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0521996368==--
