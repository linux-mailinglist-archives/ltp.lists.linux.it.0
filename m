Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C417317E
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:00:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 025843C6AD7
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:00:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 18C4D3C2353
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:00:45 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3B4A26021D5
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582873242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=agHnXyIsNijPZRLdaNKQ+pKp+F031R7CfzaioyYxC1g=;
 b=Tx7ZfdUF4yUP/8NtVfZ2Wd4OQyNoj6G0mdz+LQBtCuFFI5zuU86gBGQPX2k6ea0RMI6eXV
 5AZ6gT3vZfzlPN6PqSCOnxCzKEgQYe8J4jWv7QV16xZ2rGQ/T67vk53KOJ6qfq673EQ3rW
 5+Y3gN56XtlZizkhk0CK0XOq1SC1uZs=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-YCUrSPH_NzanYU3s27hPIg-1; Fri, 28 Feb 2020 02:00:37 -0500
X-MC-Unique: YCUrSPH_NzanYU3s27hPIg-1
Received: by mail-oi1-f198.google.com with SMTP id n4so1039320oih.12
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 23:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=glK4E9PuUJQ/0zhiyefW1sazslZ795M11jJmKSWrwNY=;
 b=Dfgi/qjpWaX4VrmFTCyzA8wQoXf7cfjNjwqg3DlBat4+4YB1jkzidR+E0LB/tOuJ2k
 d+p9fmnIkqsk3sBknGzj2zgF2URD2qAYLj6H1SvJE7EUwyaDEgVTZMnchStrdTPg7hUi
 GQA4XpZwKuZKQQehnKrfnwRpuvSj00hUFURY8qOGl0NXhLk7E+mn7UZGoqakl8ZtcRub
 SH3kr3JggACatkwRcxu5Vkrz6YoP/7lhDVZpcJG7HdreAmDYawEFNMrXGVrTzjvg9sMK
 8DAmnBgpwa6XqOSdFFHglJrHjwWNUcQvkjCqdS86VZZ1CjHIhOkfFkRi+4ttlehesFqG
 t61A==
X-Gm-Message-State: APjAAAUExX2HQfKFOd/zOgEkC0dMMUjD3QnsajeS1ix77uDzk2Hm93+Q
 jTztMQzT1tUUYL5O3Xg4S4gKLgXQj/6B89THDGu1j2R6yRwpKptU0FJODVPKOugR/NHaMcnZvOM
 ccPZnUEmU1TpJfcwO9NS2rm6bWEU=
X-Received: by 2002:a9d:4e8a:: with SMTP id v10mr2326274otk.17.1582873236480; 
 Thu, 27 Feb 2020 23:00:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiR6C4TsqHUlozFzqFVzo9v4EWsJQ19UOKPAJwFBz5BNiq21Lel1SGWJWn69+PIMxz+arIFUd0OXq+7b5RhFY=
X-Received: by 2002:a9d:4e8a:: with SMTP id v10mr2326248otk.17.1582873236064; 
 Thu, 27 Feb 2020 23:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-2-pvorel@suse.cz>
In-Reply-To: <20200227163922.317-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 Feb 2020 15:00:24 +0800
Message-ID: <CAEemH2fTYf91KP6_Kf343taLmoGeTuOvNJWVr1qf5C-02+CZpQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] lib: Check also flags for tst_res()
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
Content-Type: multipart/mixed; boundary="===============1762730741=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1762730741==
Content-Type: multipart/alternative; boundary="000000000000f5e496059f9d6495"

--000000000000f5e496059f9d6495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Thanks for your work on this!

On Fri, Feb 28, 2020 at 12:39 AM Petr Vorel <pvorel@suse.cz> wrote:

> Allowed types: TCONF | TFAIL | TINFO | TPASS | TWARN
> i.e. TBROK is forbidden.
>
> Suggested-by: Li Wang <liwang@redhat.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> TPASS =3D=3D 0, that's why TTYPE_RESULT(ttype) ?: TCONF
>
> Kind regards,
> Petr
>
>  include/tst_common.h | 3 +++
>  include/tst_test.h   | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/tst_common.h b/include/tst_common.h
> index d37e38487..54a8428fd 100644
> --- a/include/tst_common.h
> +++ b/include/tst_common.h
> @@ -77,4 +77,7 @@
>  #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
>         do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)
>
> +#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
> +       TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition)
>

To be honest, this looks verbose and confusing a little. I'm thinking can
we just add a prefix TST_ to the kernel macro and use it directly?

e.g

#define TST_BUILD_BUG_ON(condition) \
        do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)



> +
>  #endif /* TST_COMMON_H__ */
> diff --git a/include/tst_test.h b/include/tst_test.h
> index 1026a422a..8508c2e38 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -47,7 +47,11 @@ void tst_res_(const char *file, const int lineno, int
> ttype,
>                __attribute__ ((format (printf, 4, 5)));
>
>  #define tst_res(ttype, arg_fmt, ...) \
> -       tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__)
> +       ({
>       \
> +
>  TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(!((TTYPE_RESULT(ttype) ?:
> TCONF) & \
> +                       (TCONF | TFAIL | TINFO | TPASS | TWARN)));
>                       \
> +               tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt),
> ##__VA_ARGS__);\
> +       })
>
>  void tst_resm_hexd_(const char *file, const int lineno, int ttype,
>         const void *buf, size_t size, const char *arg_fmt, ...)
> --
> 2.25.1
>
>

--=20
Regards,
Li Wang

--000000000000f5e496059f9d6495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Thanks for your work on this!</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 12:39 AM Petr=
 Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allowed types: T=
CONF | TFAIL | TINFO | TPASS | TWARN<br>
i.e. TBROK is forbidden.<br>
<br>
Suggested-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_b=
lank">liwang@redhat.com</a>&gt;<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
TPASS =3D=3D 0, that&#39;s why TTYPE_RESULT(ttype) ?: TCONF<br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0include/tst_common.h | 3 +++<br>
=C2=A0include/tst_test.h=C2=A0 =C2=A0| 6 +++++-<br>
=C2=A02 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/tst_common.h b/include/tst_common.h<br>
index d37e38487..54a8428fd 100644<br>
--- a/include/tst_common.h<br>
+++ b/include/tst_common.h<br>
@@ -77,4 +77,7 @@<br>
=C2=A0#define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do { ((void)sizeof(char[1 - 2 * !!(condition)])=
); } while (0)<br>
<br>
+#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition)<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">To be honest, this looks verbose and confusing a little. I&#3=
9;m thinking can we just add a prefix TST_ to the kernel macro and use it d=
irectly?=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">e.g</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div>#define TST=
_BUILD_BUG_ON(condition) \<br>=09<span class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>do { ((void)sizeof(char[1 =
- 2 * !!(condition)])); } while (0)<br><div class=3D"gmail_default" style=
=3D"font-size:small"></div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
=C2=A0#endif /* TST_COMMON_H__ */<br>
diff --git a/include/tst_test.h b/include/tst_test.h<br>
index 1026a422a..8508c2e38 100644<br>
--- a/include/tst_test.h<br>
+++ b/include/tst_test.h<br>
@@ -47,7 +47,11 @@ void tst_res_(const char *file, const int lineno, int tt=
ype,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__attribute__ ((form=
at (printf, 4, 5)));<br>
<br>
=C2=A0#define tst_res(ttype, arg_fmt, ...) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt)=
, ##__VA_ARGS__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RES_SUPPORTS_TC=
ONF_TFAIL_TINFO_TPASS_TWARN(!((TTYPE_RESULT(ttype) ?: TCONF) &amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(TCONF | TFAIL | TINFO | TPASS | TWARN)));=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res_(__FILE__, =
__LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
<br>
=C2=A0void tst_resm_hexd_(const char *file, const int lineno, int ttype,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *buf, size_t size, const char *arg_f=
mt, ...)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000f5e496059f9d6495--


--===============1762730741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1762730741==--

