Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B5FBE4B
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 04:25:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 122493C22B0
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 04:25:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7E70E3C1CFD
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 04:25:07 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B91442011EE
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 04:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573701902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KRBn0A16Z9lVrQk1Jscg+U415GkhvwwN9YXBMIlZs3s=;
 b=JZ/uDKBvXGt4dXoPxZGS5cQenEczk+aAAmXzIYqa+qykNPhVCmVduQqKAa/gFB1RRyRNBL
 TE8mFJfNcj1a9iT5/Oq/MqVTVux1tCEzFzLU7OY6q3aF6E015NkIohK1REyjBWkWt0AbYO
 F78zzD4pAONh3zkSqeMrb5LFb/ntRBM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-FpMBGVjeOMK9zDArAVoeUQ-1; Wed, 13 Nov 2019 22:24:58 -0500
Received: by mail-oi1-f200.google.com with SMTP id w20so2355409oie.17
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 19:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbQ2NA3fOmJCg7zNCR8SHXGm7hqSFLSqcme2rxxHEwQ=;
 b=d4BAz2tQSl04zZLfx3v9dxr3x8x6mOfEPcie99pOBkv0zXwBbp74XjCZSnZFYzRMvP
 8fP0m2NhwRDS/mDTLZNtS2DZ/LM00sHmtXZ7crG4oPD5ZrNDHpm3SsOqPWPVD1hJnLdw
 pLz76r6y8a+mLMJGF6WuXfOnjmVzd7J+/l/UVpSJkqYWa10khRFcJytEpyowEIvOkNl2
 pIlg0211mWLmYElCmVYZ9bFiAt7mIH0JBjiu4EmudjzFEvPJmeNWaQwmYU5FzN6MkOZd
 src6qejM06wRXtOemxV/rjikEMpHKFnbWBmWQIdMOgL3R7r2US8D8EyKWPcNWYzaC2F9
 zWtw==
X-Gm-Message-State: APjAAAWGusFuTLGRhdU+T/HNu9VUZq6sTkB7vOuUs+5tz94amssQQPe4
 ZbOoekwjEAdIuaY3YoVN9PKMJ2cgzHq0kqEdeMUj3gWHKImM0ebBHclvMaMS0BhsF2B9dQikFmb
 4lNcV7E4aIbVmWX5k3s2A3nRKSCE=
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr5226554ota.26.1573701897991; 
 Wed, 13 Nov 2019 19:24:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqycTrC28PiVHWP7OL1Jdtm/boKYu/JG/LQkQ2GETPHzKk7PUPOO1H31/+jU6MyGmee2Yg2TTZjwnkdFaUieHKQ=
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr5226538ota.26.1573701897688; 
 Wed, 13 Nov 2019 19:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20191113104149.42407-1-lkml@jv-coder.de>
In-Reply-To: <20191113104149.42407-1-lkml@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 14 Nov 2019 11:24:46 +0800
Message-ID: <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
X-MC-Unique: FpMBGVjeOMK9zDArAVoeUQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Content-Type: multipart/mixed; boundary="===============1236287386=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1236287386==
Content-Type: multipart/alternative; boundary="000000000000983c80059746060d"

--000000000000983c80059746060d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 6:42 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> The usage of AC_ARG_WITH was wrong. This resulted in unexpected
> configuration.
> E.g --without-bash set with_bash=3Dyes and --with-nume set with_numa=3Dno=
.
> This is fixed by using "$withval" in the action-if-given. Also all
> AC_ARG_WITH
> are unified now (all use alos action-if-not-given)
>
> The "default=3D" help text did not make sense for same options.
> e.g. for --with expect was "default=3Dyes", but it defaults to no.
> The "default=3D" strings are dropped, because defaultness is indicated by
> either "--with-<option>" or "--without-<option>" as done by other project=
s,
> that use autoconf.
>
> Defining AC_ARG_WITH within an if to express dependencies does not work.
> ./configure --with-realtime-testsuite set with_realtime_testsuite=3Dyes,
> even if with_bash=3Dno or with_python=3Dno. The check is removed complete=
ly.
>

I think this patch makes sense. It follows the AC_ARG_WITH official usage,
and make use of the shell variable 'withval' is also a wise choice.

Just a few queries below:


>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  configure.ac | 46 ++++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 62c5a0bb4..4b7c6d57c 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -108,8 +108,9 @@ AC_CHECK_FUNCS([ \
>  # Expect
>  AC_ARG_WITH([bash],
>    [AC_HELP_STRING([--with-bash],
> -    [have the Bourne Again SHell interpreter (default=3Dno)])],
> -  [with_bash=3Dyes],
> +    [have the Bourne Again Shell interpreter])],
> +  [with_bash=3D$withval],
> +  [with_bash=3Dno]
>  )
>  if test "x$with_bash" =3D xyes; then
>      AC_SUBST([WITH_BASH],["yes"])
> @@ -119,8 +120,8 @@ fi
>
>  AC_ARG_WITH([expect],
>    [AC_HELP_STRING([--with-expect],
> -    [have the Tcl/expect library (default=3Dyes)])],
> -  [with_expect=3Dyes],
> +    [have the Tcl/expect library])],
> +  [with_expect=3D$withval],
>    [with_expect=3Dno]
>

From the original intention, it likely to set yes as the default, so maybe
the [action-if-not-given] should as  [with_expect=3Dyes]?


>  )
>  if test "x$with_expect" =3D xyes; then
> @@ -132,16 +133,16 @@ fi
>  # Numa
>  AC_ARG_WITH([numa],
>    AC_HELP_STRING([--without-numa],
> -    [without numa support (default=3Dno)]),
> -  [with_numa=3Dno],
> +    [without numa support]),
> +  [with_numa=3D$withval],
>    [with_numa=3Dyes]
>  )
>
>  # Perl
>  AC_ARG_WITH([perl],
>    [AC_HELP_STRING([--with-perl],
> -    [have a perl interpreter (default=3Dyes)])],
> -  [with_perl=3Dyes],
> +    [have a perl interpreter])],
> +  [with_perl=3D$withval],
>    [with_perl=3Dno]
>

[with_perl=3Dyes] ?


>  )
>  if test "x$with_perl" =3D xyes; then
> @@ -153,8 +154,8 @@ fi
>  # Python
>  AC_ARG_WITH([python],
>    [AC_HELP_STRING([--with-python],
> -    [have a python interpreter (default=3Dyes)])],
> -  [with_python=3Dyes],
> +    [have a python interpreter])],
> +  [with_python=3D$withval],
>    [with_python=3Dno]
>

[with_python=3Dyes] ?


>  )
>  if test "x$with_python" =3D xyes; then
> @@ -166,8 +167,8 @@ fi
>  # TI RPC
>  AC_ARG_WITH([tirpc],
>    AC_HELP_STRING([--without-tirpc],
> -    [without libtirpc support (default=3Dno)]),
> -  [with_tirpc=3Dno],
> +    [without libtirpc support]),
> +  [with_tirpc=3D$withval],
>    [with_tirpc=3Dyes]
>  )
>  # END tools knobs
> @@ -176,8 +177,9 @@ AC_ARG_WITH([tirpc],
>
>  AC_ARG_WITH([open-posix-testsuite],
>    [AC_HELP_STRING([--with-open-posix-testsuite],
> -    [compile and install the open posix testsuite (default=3Dno)])],
> -  [with_open_posix_testsuite=3D$withval]
> +    [compile and install the open posix testsuite])],
> +  [with_open_posix_testsuite=3D$withval],
> +  [with_open_posix_testsuite=3Dno]
>  )
>  if test "x$with_open_posix_testsuite" =3D xyes; then
>      AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],["yes"])
> @@ -185,14 +187,14 @@ else
>      AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],["no"])
>  fi
>
> -# testcases/realtime requires bash and python.
> -if test "x$with_bash" =3D xyes && test "x$with_python" =3D xyes; then
> -    AC_ARG_WITH([realtime-testsuite],
> -      [AC_HELP_STRING([--with-realtime-testsuite],
> -        [compile and install the realtime testsuite (default=3Dno)])],
> -      [with_realtime_testsuite=3Dyes]
> -    )
> -fi
> +# TODO: testcases/realtime requires bash and python.
>

Why remove the judgment of bash/python here?


> +AC_ARG_WITH([realtime-testsuite],
> +  [AC_HELP_STRING([--with-realtime-testsuite],
> +    [compile and install the realtime testsuite])],
> +  [with_realtime_testsuite=3D$withval],
> +  [with_realtime_testsuite=3Dno]
> +)
> +
>  if test "x$with_realtime_testsuite" =3D xyes; then
>      AC_SUBST([WITH_REALTIME_TESTSUITE],["yes"])
>      # Run configure on testcases/realtime as well.
> --
> 2.20.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000983c80059746060d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 13, 2019 at 6:42 PM Joerg Vehlow &lt;<a=
 href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Joerg Vehlow &lt;<a=
 href=3D"mailto:joerg.vehlow@aox-tech.de" target=3D"_blank">joerg.vehlow@ao=
x-tech.de</a>&gt;<br>
<br>
The usage of AC_ARG_WITH was wrong. This resulted in unexpected configurati=
on.<br>
E.g --without-bash set with_bash=3Dyes and --with-nume set with_numa=3Dno.<=
br>
This is fixed by using &quot;$withval&quot; in the action-if-given. Also al=
l AC_ARG_WITH<br>
are unified now (all use alos action-if-not-given)<br>
<br>
The &quot;default=3D&quot; help text did not make sense for same options.<b=
r>
e.g. for --with expect was &quot;default=3Dyes&quot;, but it defaults to no=
.<br>
The &quot;default=3D&quot; strings are dropped, because defaultness is indi=
cated by<br>
either &quot;--with-&lt;option&gt;&quot; or &quot;--without-&lt;option&gt;&=
quot; as done by other projects,<br>
that use autoconf.<br>
<br>
Defining AC_ARG_WITH within an if to express dependencies does not work.<br=
>
./configure --with-realtime-testsuite set with_realtime_testsuite=3Dyes,<br=
>
even if with_bash=3Dno or with_python=3Dno. The check is removed completely=
.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">I think this patch makes sense. It follows the=C2=A0<span=
 class=3D"gmail_default"></span>AC_ARG_WITH official usage, and make use=C2=
=A0of the shell variable &#39;withval&#39; is also a wise choice.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Just a few queries below:</div></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox-tech.de"=
 target=3D"_blank">joerg.vehlow@aox-tech.de</a>&gt;<br>
---<br>
=C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a> | 46 ++++++++++++++++++++++++----------------------<br>
=C2=A01 file changed, 24 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
index 62c5a0bb4..4b7c6d57c 100644<br>
--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
@@ -108,8 +108,9 @@ AC_CHECK_FUNCS([ \<br>
=C2=A0# Expect<br>
=C2=A0AC_ARG_WITH([bash],<br>
=C2=A0 =C2=A0[AC_HELP_STRING([--with-bash],<br>
-=C2=A0 =C2=A0 [have the Bourne Again SHell interpreter (default=3Dno)])],<=
br>
-=C2=A0 [with_bash=3Dyes],<br>
+=C2=A0 =C2=A0 [have the Bourne Again Shell interpreter])],<br>
+=C2=A0 [with_bash=3D$withval],<br>
+=C2=A0 [with_bash=3Dno]<br>
=C2=A0)<br>
=C2=A0if test &quot;x$with_bash&quot; =3D xyes; then<br>
=C2=A0 =C2=A0 =C2=A0AC_SUBST([WITH_BASH],[&quot;yes&quot;])<br>
@@ -119,8 +120,8 @@ fi<br>
<br>
=C2=A0AC_ARG_WITH([expect],<br>
=C2=A0 =C2=A0[AC_HELP_STRING([--with-expect],<br>
-=C2=A0 =C2=A0 [have the Tcl/expect library (default=3Dyes)])],<br>
-=C2=A0 [with_expect=3Dyes],<br>
+=C2=A0 =C2=A0 [have the Tcl/expect library])],<br>
+=C2=A0 [with_expect=3D$withval],<br>
=C2=A0 <span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=
=A0[with_expect=3Dno]<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"">From the original intention, it likely to set yes as=
 the default, so maybe the=C2=A0[action-if-not-given] should as=C2=A0<span =
class=3D"gmail_default"></span>=C2=A0[with_expect=3Dyes]?</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0)<br>
=C2=A0if test &quot;x$with_expect&quot; =3D xyes; then<br>
@@ -132,16 +133,16 @@ fi<br>
=C2=A0# Numa<br>
=C2=A0AC_ARG_WITH([numa],<br>
=C2=A0 =C2=A0AC_HELP_STRING([--without-numa],<br>
-=C2=A0 =C2=A0 [without numa support (default=3Dno)]),<br>
-=C2=A0 [with_numa=3Dno],<br>
+=C2=A0 =C2=A0 [without numa support]),<br>
+=C2=A0 [with_numa=3D$withval],<br>
=C2=A0 =C2=A0[with_numa=3Dyes]<br>
=C2=A0)<br>
<br>
=C2=A0# Perl<br>
=C2=A0AC_ARG_WITH([perl],<br>
=C2=A0 =C2=A0[AC_HELP_STRING([--with-perl],<br>
-=C2=A0 =C2=A0 [have a perl interpreter (default=3Dyes)])],<br>
-=C2=A0 [with_perl=3Dyes],<br>
+=C2=A0 =C2=A0 [have a perl interpreter])],<br>
+=C2=A0 [with_perl=3D$withval],<br>
=C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-size:small"></span=
>[with_perl=3Dno]<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><span class=3D"gmail_default"></span>[wit=
h_perl=3Dyes] ?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0)<br>
=C2=A0if test &quot;x$with_perl&quot; =3D xyes; then<br>
@@ -153,8 +154,8 @@ fi<br>
=C2=A0# Python<br>
=C2=A0AC_ARG_WITH([python],<br>
=C2=A0 =C2=A0[AC_HELP_STRING([--with-python],<br>
-=C2=A0 =C2=A0 [have a python interpreter (default=3Dyes)])],<br>
-=C2=A0 [with_python=3Dyes],<br>
+=C2=A0 =C2=A0 [have a python interpreter])],<br>
+=C2=A0 [with_python=3D$withval],<br>
=C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-size:small"></span=
>[with_python=3Dno]<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small"><span class=3D"gmail_default"></span>[w=
ith_python=3Dyes] ?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0)<br>
=C2=A0if test &quot;x$with_python&quot; =3D xyes; then<br>
@@ -166,8 +167,8 @@ fi<br>
=C2=A0# TI RPC<br>
=C2=A0AC_ARG_WITH([tirpc],<br>
=C2=A0 =C2=A0AC_HELP_STRING([--without-tirpc],<br>
-=C2=A0 =C2=A0 [without libtirpc support (default=3Dno)]),<br>
-=C2=A0 [with_tirpc=3Dno],<br>
+=C2=A0 =C2=A0 [without libtirpc support]),<br>
+=C2=A0 [with_tirpc=3D$withval],<br>
=C2=A0 =C2=A0[with_tirpc=3Dyes]<br>
=C2=A0)<br>
=C2=A0# END tools knobs<br>
@@ -176,8 +177,9 @@ AC_ARG_WITH([tirpc],<br>
<br>
=C2=A0AC_ARG_WITH([open-posix-testsuite],<br>
=C2=A0 =C2=A0[AC_HELP_STRING([--with-open-posix-testsuite],<br>
-=C2=A0 =C2=A0 [compile and install the open posix testsuite (default=3Dno)=
])],<br>
-=C2=A0 [with_open_posix_testsuite=3D$withval]<br>
+=C2=A0 =C2=A0 [compile and install the open posix testsuite])],<br>
+=C2=A0 [with_open_posix_testsuite=3D$withval],<br>
+=C2=A0 [with_open_posix_testsuite=3Dno]<br>
=C2=A0)<br>
=C2=A0if test &quot;x$with_open_posix_testsuite&quot; =3D xyes; then<br>
=C2=A0 =C2=A0 =C2=A0AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],[&quot;yes&quot;])=
<br>
@@ -185,14 +187,14 @@ else<br>
=C2=A0 =C2=A0 =C2=A0AC_SUBST([WITH_OPEN_POSIX_TESTSUITE],[&quot;no&quot;])<=
br>
=C2=A0fi<br>
<br>
-# testcases/realtime requires bash and python.<br>
-if test &quot;x$with_bash&quot; =3D xyes &amp;&amp; test &quot;x$with_pyth=
on&quot; =3D xyes; then<br>
-=C2=A0 =C2=A0 AC_ARG_WITH([realtime-testsuite],<br>
-=C2=A0 =C2=A0 =C2=A0 [AC_HELP_STRING([--with-realtime-testsuite],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [compile and install the realtime testsuite (d=
efault=3Dno)])],<br>
-=C2=A0 =C2=A0 =C2=A0 [with_realtime_testsuite=3Dyes]<br>
-=C2=A0 =C2=A0 )<br>
-fi<br>
+# TODO: testcases/realtime requires bash and python.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Why r=
emove the judgment=C2=A0of bash/python here?</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+AC_ARG_WITH([realtime-testsuite],<br>
+=C2=A0 [AC_HELP_STRING([--with-realtime-testsuite],<br>
+=C2=A0 =C2=A0 [compile and install the realtime testsuite])],<br>
+=C2=A0 [with_realtime_testsuite=3D$withval],<br>
+=C2=A0 [with_realtime_testsuite=3Dno]<br>
+)<br>
+<br>
=C2=A0if test &quot;x$with_realtime_testsuite&quot; =3D xyes; then<br>
=C2=A0 =C2=A0 =C2=A0AC_SUBST([WITH_REALTIME_TESTSUITE],[&quot;yes&quot;])<b=
r>
=C2=A0 =C2=A0 =C2=A0# Run configure on testcases/realtime as well.<br>
-- <br>
2.20.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000983c80059746060d--


--===============1236287386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1236287386==--

