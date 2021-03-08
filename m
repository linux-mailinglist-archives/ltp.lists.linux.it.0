Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7F33097E
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:39:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDA163C4CC4
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 09:39:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CB4273C300C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:39:49 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 545CA600803
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 09:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615192788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8el3WyFeh8MY9AZ7On7Xgq7C059a/dSWwW54TayEbE=;
 b=WAQuktU83Vk1IA4SeNyrvJkHwir/0BB0Pn2HlLmljmEDtvKB8Lq4mByJH+HywrinUUH4LL
 valBfNZLLr/vZtoFzfJ6c9pViPwsBvp5J4CYY13qa9xI8HEq5C6pw9mIS5llzkJKq3kF3e
 4ZEgyW3z+jeL1hsHYsx8ADANFL3FUPc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-3sd4xTnCO0e4W9awjXQL1w-1; Mon, 08 Mar 2021 03:39:45 -0500
X-MC-Unique: 3sd4xTnCO0e4W9awjXQL1w-1
Received: by mail-yb1-f198.google.com with SMTP id 6so12078873ybq.7
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 00:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8el3WyFeh8MY9AZ7On7Xgq7C059a/dSWwW54TayEbE=;
 b=A+IiFG0DrvS1quptk7iffp6KhXeh5euaYgJmWpiwwwJCPSwjRX2aH7cm/MZMYl0RUt
 VOYa6BG3bptSZZY84Lt4UaI1xBC1Klzyai8PovDNRcTzZIUn0YAcFav20Wo2Q254VFYF
 Xym+jMB1aOJi0nOOVYL0B1jQdbRki4/ygc/Uol1gPH4NHGCrtcna6ZY0P3Aoevbm5Wot
 CZCz41C/b8wy6yzOabdeMT3A4GVAjKtoJmTK/C3j3ICgDzNQh80rR5q4zX8d+HnBaB/C
 LOTOjZH5zC4EWYQPXkEME3snjiwUGazfdcqZFJneewQW+lFF0SdR9JwtGb0lbjL+i1wx
 7dVA==
X-Gm-Message-State: AOAM530aCRNycXzZWIJQx5FNrFXntfZCG2fnct+N/ctZhV7vtJYgsjPV
 u0LOwHbQ5uNNq/75aLfuRTvPeIFLB8/VKmKW7eBJu2jGHufRzSMCGO07ogyktDv1eY5rNjzKUhF
 drDEPameDC2YJ2EG8+dOazRMxT4E=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32130576ybb.286.1615192785050; 
 Mon, 08 Mar 2021 00:39:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIjZv3wyOmjTEuek+BXVzjO2ZMCiyxmpmOKqe7FNg9s+0MDEH07qL5Fdt6QmyL3SOmVX1Ox32Jpl0Dv0lzYT4=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32130565ybb.286.1615192784883; 
 Mon, 08 Mar 2021 00:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20210302152510.15116-1-rpalethorpe@suse.com>
 <20210302152510.15116-3-rpalethorpe@suse.com>
In-Reply-To: <20210302152510.15116-3-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 16:39:33 +0800
Message-ID: <CAEemH2f0Q8fLLEaExHwB5Pm+yKyqnSiAGPXr6WpM=weMSvfa1Q@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 2/7] API: Add macro for the container_of
 trick
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
Content-Type: multipart/mixed; boundary="===============0875216830=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0875216830==
Content-Type: multipart/alternative; boundary="0000000000002fe3d905bd026040"

--0000000000002fe3d905bd026040
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 11:28 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  include/tst_common.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/tst_common.h b/include/tst_common.h
> index fd7a900d4..317925d1d 100644
> --- a/include/tst_common.h
> +++ b/include/tst_common.h
> @@ -83,4 +83,9 @@
>  #define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
>         TST_BUILD_BUG_ON(condition)
>
> +#define tst_container_of(ptr, type, member) ({              \
>

What about using uppercase here?  i.e  TST_CONTAINER_OF(...)



> +       const typeof( ((type *)0)->member ) *__mptr = (ptr); \
> +       (type *)( (char *)__mptr - offsetof(type,member) );  \
> +})
> +
>  #endif /* TST_COMMON_H__ */
> --
> 2.30.0
>
>

-- 
Regards,
Li Wang

--0000000000002fe3d905bd026040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 11:28 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank">rpalethorpe@s=
use.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@=
suse.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
---<br>
=C2=A0include/tst_common.h | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/include/tst_common.h b/include/tst_common.h<br>
index fd7a900d4..317925d1d 100644<br>
--- a/include/tst_common.h<br>
+++ b/include/tst_common.h<br>
@@ -83,4 +83,9 @@<br>
=C2=A0#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_BUILD_BUG_ON(condition)<br>
<br>
+#define tst_container_of(ptr, type, member) ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">What about using=C2=A0uppercase here=
?=C2=A0 i.e=C2=A0 TST_CONTAINER_OF(...)</div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const typeof( ((type *)0)-&gt;member ) *__mptr =
=3D (ptr); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(type *)( (char *)__mptr - offsetof(type,member=
) );=C2=A0 \<br>
+})<br>
+<br>
=C2=A0#endif /* TST_COMMON_H__ */<br>
-- <br>
2.30.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000002fe3d905bd026040--


--===============0875216830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0875216830==--

