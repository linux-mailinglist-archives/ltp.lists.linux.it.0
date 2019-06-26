Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9C562ED
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 09:10:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE55F3C1047
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 09:10:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F40B63C0596
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 09:10:35 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 758471000D39
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 09:10:30 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id v18so378612uad.12
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 00:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEQbT0HFliB03LP29Z52pv1KcMGubI8vNxAC/upSwnM=;
 b=KkqT1uKrN75HG9toFiz/7FQnnf23k1w9R80lAdb1Ixu8UV5tCVtwXMjHVlyLdJOshV
 B/mk4XhGjMY5itz7FYrkKeUbpeMnMnqN7mmndKxFbJIhu2FriyZ2/wD7Oh5ErZ4LE1OP
 nN+Lz1JukCbG3keXDn0wasCG/pd+8fccnk8xzXrQTHi69OXgDocJR6iS/tkmsLdBiGXn
 OMva1h6mAWIkkOM7zdYppO2jeMwvOH3v1Ea/eE2HjT0ZCkrFArXISlpYCgsu1DY6BXS6
 Jszyz0GScB3lEc73mGAwuggS35iGcqyO0Up6Fu99a4VmUDtq0MDsW20hGw+Trsk8MaR6
 eEYg==
X-Gm-Message-State: APjAAAWA9gNZiwZWDzuNLJVrzjBOOaKJn7mLUZDIxdiylJXmPMdxly7y
 YPiY65fPDjazzxyYbk6YkiyruYLI8swjLKjYQyokmw==
X-Google-Smtp-Source: APXvYqxPrgm7O+oiqk2zXABFUrbUxbYnQw9vPwSzL1lUGObkpz3XIKaqpDufGcuaHZyPIAvZPnW60eaWtUuzMXY8iHU=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr1649289ual.89.1561533033571;
 Wed, 26 Jun 2019 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <64e3837429239829860f1df5d8145c12078a799f.1561451809.git.jstancek@redhat.com>
In-Reply-To: <64e3837429239829860f1df5d8145c12078a799f.1561451809.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 26 Jun 2019 15:10:22 +0800
Message-ID: <CAEemH2cGg7U7QGU_mjNCqF=8xX1Ht-zQO25zCheLL2Y7pvHMFA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: make save_restore '?' prefix ignore also
 errors from open/read
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
Content-Type: multipart/mixed; boundary="===============0627809003=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0627809003==
Content-Type: multipart/alternative; boundary="000000000000c58cfe058c34bdbc"

--000000000000c58cfe058c34bdbc
Content-Type: text/plain; charset="UTF-8"

The patch makes sense to me.

On Tue, Jun 25, 2019 at 5:02 PM Jan Stancek <jstancek@redhat.com> wrote:

> Prefix '?' was meant to silently ignore non-existing paths.
> However there are some /proc files which exist, but trigger
> error only after open/read:
>   # ls -la /proc/sys/vm/nr_hugepages
>   -rw-r--r--. 1 root root 0 Jun 25 04:17 /proc/sys/vm/nr_hugepages
>   # cat /proc/sys/vm/nr_hugepages
>   cat: /proc/sys/vm/nr_hugepages: Operation not supported
>
> This leads to unavoidable TBROK. Extend '?' flag to cover also open/read.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  doc/test-writing-guidelines.txt | 9 +++++----
>  lib/tst_sys_conf.c              | 6 ++++++
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index c6d4e001d72b..d0b7417f2cc8 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1515,10 +1515,11 @@ and restored at the end of the test. Only first
> line of a specified
>  file is saved and restored.
>
>  Pathnames can be optionally prefixed to specify how strictly (during
> -'store') are handled files that don't exist:
> -  (no prefix) - test ends with TCONF
> -  '?'         - test prints info message and continues
> -  '!'         - test ends with TBROK
> +'store') are handled errors:
> +  (no prefix) - test ends with TCONF, if file doesn't exist
> +  '?'         - test prints info message and continues,
> +                if file doesn't exist or open/read fails
> +  '!'         - test ends with TBROK, if file doesn't exist
>
>  'restore' is always strict and will TWARN if it encounters any error.
>
> diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c
> index e767856ec148..bbe469936c99 100644
> --- a/lib/tst_sys_conf.c
> +++ b/lib/tst_sys_conf.c
> @@ -66,6 +66,9 @@ int tst_sys_conf_save(const char *path)
>
>         fp = fopen(path, "r");
>         if (fp == NULL) {
> +               if (flag == '?')
> +                       return 1;
> +
>                 tst_brk(TBROK | TERRNO, "Failed to open FILE '%s' for
> reading",
>                         path);
>                 return 1;
> @@ -75,6 +78,9 @@ int tst_sys_conf_save(const char *path)
>         fclose(fp);
>
>         if (ret == NULL) {
> +               if (flag == '?')
> +                       return 1;
> +
>                 tst_brk(TBROK | TERRNO, "Failed to read anything from
> '%s'",
>                         path);
>         }
> --
> 1.8.3.1
>
>

-- 
Regards,
Li Wang

--000000000000c58cfe058c34bdbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">The patch makes sense to me.</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 25, 2019 at 5:02 PM Jan S=
tancek &lt;<a href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Prefix=
 &#39;?&#39; was meant to silently ignore non-existing paths.<br>
However there are some /proc files which exist, but trigger<br>
error only after open/read:<br>
=C2=A0 # ls -la /proc/sys/vm/nr_hugepages<br>
=C2=A0 -rw-r--r--. 1 root root 0 Jun 25 04:17 /proc/sys/vm/nr_hugepages<br>
=C2=A0 # cat /proc/sys/vm/nr_hugepages<br>
=C2=A0 cat: /proc/sys/vm/nr_hugepages: Operation not supported<br>
<br>
This leads to unavoidable TBROK. Extend &#39;?&#39; flag to cover also open=
/read.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0doc/test-writing-guidelines.txt | 9 +++++----<br>
=C2=A0lib/tst_sys_conf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
6 ++++++<br>
=C2=A02 files changed, 11 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.=
txt<br>
index c6d4e001d72b..d0b7417f2cc8 100644<br>
--- a/doc/test-writing-guidelines.txt<br>
+++ b/doc/test-writing-guidelines.txt<br>
@@ -1515,10 +1515,11 @@ and restored at the end of the test. Only first lin=
e of a specified<br>
=C2=A0file is saved and restored.<br>
<br>
=C2=A0Pathnames can be optionally prefixed to specify how strictly (during<=
br>
-&#39;store&#39;) are handled files that don&#39;t exist:<br>
-=C2=A0 (no prefix) - test ends with TCONF<br>
-=C2=A0 &#39;?&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- test prints info mes=
sage and continues<br>
-=C2=A0 &#39;!&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- test ends with TBROK=
<br>
+&#39;store&#39;) are handled errors:<br>
+=C2=A0 (no prefix) - test ends with TCONF, if file doesn&#39;t exist<br>
+=C2=A0 &#39;?&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- test prints info mes=
sage and continues,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file doesn&#39;=
t exist or open/read fails<br>
+=C2=A0 &#39;!&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- test ends with TBROK=
, if file doesn&#39;t exist<br>
<br>
=C2=A0&#39;restore&#39; is always strict and will TWARN if it encounters an=
y error.<br>
<br>
diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c<br>
index e767856ec148..bbe469936c99 100644<br>
--- a/lib/tst_sys_conf.c<br>
+++ b/lib/tst_sys_conf.c<br>
@@ -66,6 +66,9 @@ int tst_sys_conf_save(const char *path)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D fopen(path, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flag =3D=3D &#3=
9;?&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TER=
RNO, &quot;Failed to open FILE &#39;%s&#39; for reading&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
@@ -75,6 +78,9 @@ int tst_sys_conf_save(const char *path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flag =3D=3D &#3=
9;?&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 1;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TER=
RNO, &quot;Failed to read anything from &#39;%s&#39;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000c58cfe058c34bdbc--

--===============0627809003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0627809003==--
