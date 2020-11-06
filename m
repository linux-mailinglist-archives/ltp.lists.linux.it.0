Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A512A9412
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:22:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 979363C3214
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:22:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 347F53C239E
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:22:13 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 930931A0153E
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:22:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604658131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLmBpNV7ltoevuQzZ6EMZR9Vk7hU9SVh62JeGxI6mho=;
 b=Mtk6Rh7RbTCXQ0HSzK+bjBxGoGpotxYKyklkqDUTCZg36OPy2qOWd96MYSqPKzfowdd42q
 4FErCFV1fFkdwqtYtg+aDO7U5mj3NwrRteVizl6BwV8X3EavsoDzV/Ll+TJvIafx0l/y7c
 Buqa3wXzduZT/vHKSFvizDbJO/1PUc4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-bRZnFtFWMK-zDKCmwqseDw-1; Fri, 06 Nov 2020 05:22:06 -0500
X-MC-Unique: bRZnFtFWMK-zDKCmwqseDw-1
Received: by mail-yb1-f198.google.com with SMTP id p63so1075012ybc.7
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 02:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLmBpNV7ltoevuQzZ6EMZR9Vk7hU9SVh62JeGxI6mho=;
 b=AwIP2q0AaLcSbI86rwGaWVzeYC1AAlyn4g7vWXhaZ00D2CsHL+wR+auiz6D9DHzMVs
 3uUhZvZ6n3ommm+iLXiMJqDLhNsoW2eje88oJnt8K/FPzkU+d0h37VDvESy9mTiZdWda
 022xMM91JN8wt4ruzRIrV4mHIEqtU7GYAho5MKpf4KYAvXKR3m+B850BAEnZr/X9XAZS
 NOKSkxJa9gTI2amRX+mnfrEguFdj79dwNrOMxne+3+kkXBGfot+FsA9yRyxVlCjnSYs4
 lNBrTE8gAZBvKvtrHaIGQC7d9DD7r2tGxrlKGbO4CkDGiWEYOEYPcojy54x/pU4H0FK4
 knLw==
X-Gm-Message-State: AOAM531UeT/9PWV+pSosy+7z73f0sINf54NLm7X/sNw5ZsuRZYCY+n9X
 2Ip42l5rHyEqFFV6MFHOUcpyayhbBpXNYjo5tuDxXQUeRurMU65+H0RUwRhbecq0u9CtowjHCYU
 lYyDczr2LOmKvXeTD0huUxqrqheY=
X-Received: by 2002:a25:7243:: with SMTP id n64mr240309ybc.86.1604658126442;
 Fri, 06 Nov 2020 02:22:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqGBvlfGxZW7r6WuQPPAG2EW+dhTRSdlrY3od4mb+74/G3Nkre59iqD3s2rCkIy/gP5CT3WZ/64u60xBZnqeE=
X-Received: by 2002:a25:7243:: with SMTP id n64mr240282ybc.86.1604658126122;
 Fri, 06 Nov 2020 02:22:06 -0800 (PST)
MIME-Version: 1.0
References: <20201103161052.13260-1-chrubis@suse.cz>
 <20201103161052.13260-3-chrubis@suse.cz>
In-Reply-To: <20201103161052.13260-3-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 6 Nov 2020 18:21:54 +0800
Message-ID: <CAEemH2dUmmFx8cEhqMP6CLpRwszeBD=kMM4i3xpBKYSV+S2d8Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH v4 2/2] lib/tst_kconfig: Make use of boolean
 expression eval
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0276264559=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0276264559==
Content-Type: multipart/alternative; boundary="00000000000098069205b36d95cf"

--00000000000098069205b36d95cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2020 at 12:10 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Now each string in the kconfig[] array in tst_test structure is an
> boolean expression which is evaluated. All expressions has to be true in
> order for the test to continue.
>
> This also makes the parser for the kernel config a bit more robust as it
> was pointed out that there may have been cases where it could be mislead
> by hand edited config files.
>
> + Update the docs.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Pengfei Xu <pengfei.xu@intel.com>
>

For series:
Reviewed-by: Li Wang <liwang@redhat.com>

> diff --git a/lib/newlib_tests/test_kconfig.c
> b/lib/newlib_tests/test_kconfig.c
> index d9c662fc5..1f659b95a 100644
> --- a/lib/newlib_tests/test_kconfig.c
> +++ b/lib/newlib_tests/test_kconfig.c
> @@ -14,6 +14,8 @@ static const char *kconfigs[] =3D {
>         "CONFIG_MMU",
>         "CONFIG_EXT4_FS=3Dm",
>         "CONFIG_PGTABLE_LEVELS=3D4",
> +       "CONFIG_MMU & CONFIG_EXT4_FS=3Dm",
> +       "CONFIG_EXT4_FS=3Dm | CONFIG_MMU",
>         NULL
>  };
>


I tried with more complicated configurations for test parsing, most works
as expected but except the below one with parentheses ():

    "CONFIG_DEFAULT_HOSTNAME=3D\"(none)\"",

That's because the parentheses are the element of expression and used
to distinguish tokens, I=E2=80=98m not sure whether we can change it as a g=
eneral
character to fix this problem, if no, we might need to comment on this in
the documentation.

--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -16,6 +16,11 @@ static const char *kconfigs[] =3D {
        "CONFIG_PGTABLE_LEVELS=3D4",
        "CONFIG_MMU & CONFIG_EXT4_FS=3Dm",
        "CONFIG_EXT4_FS=3Dm | CONFIG_MMU",
+       "CONFIG_DEFAULT_HOSTNAME=3D\"(none)\"",
+       "CONFIG_LOCALVERSION=3D\"\" | CONFIG_MODULE_SIG_HASH=3D\"sha256\"",
+       "CONFIG_OUTPUT_FORMAT=3D\"elf64-x86-64\"",
+       "CONFIG_ARCH_DEFCONFIG=3D\"arch/x86/configs/x86_64_defconfig\"",
+       "CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000",
        NULL
 };


--=20
Regards,
Li Wang

--00000000000098069205b36d95cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 4, 2020 at 12:10 AM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Now each string in the kcon=
fig[] array in tst_test structure is an<br>
boolean expression which is evaluated. All expressions has to be true in<br=
>
order for the test to continue.<br>
<br>
This also makes the parser for the kernel config a bit more robust as it<br=
>
was pointed out that there may have been cases where it could be mislead<br=
>
by hand edited config files.<br>
<br>
+ Update the docs.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
CC: Pengfei Xu &lt;<a href=3D"mailto:pengfei.xu@intel.com" target=3D"_blank=
">pengfei.xu@intel.com</a>&gt;<br></blockquote><div><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">For series:</div><div class=3D"gm=
ail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"=
mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><div class=3D"gmai=
l_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfi=
g.c<br>
index d9c662fc5..1f659b95a 100644<br>
--- a/lib/newlib_tests/test_kconfig.c<br>
+++ b/lib/newlib_tests/test_kconfig.c<br>
@@ -14,6 +14,8 @@ static const char *kconfigs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_MMU&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_EXT4_FS=3Dm&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_PGTABLE_LEVELS=3D4&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_MMU &amp; CONFIG_EXT4_FS=3Dm&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_EXT4_FS=3Dm | CONFIG_MMU&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>
=C2=A0};<br></blockquote><div><br></div><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">I tried with more complicated confi=
gurations for test parsing, most works</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">as expected but except the below one with parenthes=
es ():</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small"><span class=3D"gma=
il_default">=C2=A0 =C2=A0=C2=A0</span>&quot;CONFIG_DEFAULT_HOSTNAME=3D\&quo=
t;(none)\&quot;&quot;,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
at&#39;s because the parentheses are the element of expression and used</di=
v><div class=3D"gmail_default" style=3D"font-size:small">to distinguish tok=
ens, I=E2=80=98m not sure whether we can change it as a general</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">character to fix this prob=
lem, if no, we might need to comment=C2=A0on this in=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small">the documentation.</div></div>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
--- a/lib/newlib_tests/test_kconfig.c</div>+++ b/lib/newlib_tests/test_kcon=
fig.c<br>@@ -16,6 +16,11 @@ static const char *kconfigs[] =3D {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_PGTABLE_LEVELS=3D4&quot;,<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;CONFIG_MMU &amp; CONFIG_EXT4_FS=3Dm&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_EXT4_FS=3Dm | CONFIG_MMU&quot;,<br>+ =
=C2=A0 =C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-size:small"=
></span> &quot;CONFIG_DEFAULT_HOSTNAME=3D\&quot;(none)\&quot;&quot;,<br>+ =
=C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_LOCALVERSION=3D\&quot;\&quot; | CONFIG_MO=
DULE_SIG_HASH=3D\&quot;sha256\&quot;&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 &quot=
;CONFIG_OUTPUT_FORMAT=3D\&quot;elf64-x86-64\&quot;&quot;,<br>+ =C2=A0 =C2=
=A0 =C2=A0 &quot;CONFIG_ARCH_DEFCONFIG=3D\&quot;arch/x86/configs/x86_64_def=
config\&quot;&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 &quot;CONFIG_ILLEGAL_POINTER=
_VALUE=3D0xdead000000000000&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL<br>=
=C2=A0};<br><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--00000000000098069205b36d95cf--


--===============0276264559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0276264559==--

