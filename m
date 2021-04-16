Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F5361A4A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:01:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 645BC3C6F7F
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 09:01:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F94F3C1A9C
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:01:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F01D100127A
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 09:01:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618556493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Sknkvfed2h7dOdI9GHb+lAwjITIEwl0qmLS9lb6+U0=;
 b=Tqh09O+uV5+9Cyy7Uo0NnzNyzxOeROgfzx/O+8tv0zAdk7sfMNs/tnZNyjIJAhuu6smaLp
 plr8kTXMSuGT+8LSOa32usJeghgSGyXuM1+uvJT6Ifl2nJyTxSbTkXANCDvQB+ggGbGWhJ
 vcJVr8z9dxCJ4SZmjFjeeS/ahnyjBu4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Ola69dRAN4eAEDllsq7f0Q-1; Fri, 16 Apr 2021 03:01:31 -0400
X-MC-Unique: Ola69dRAN4eAEDllsq7f0Q-1
Received: by mail-yb1-f200.google.com with SMTP id v194so5199252ybv.5
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 00:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Sknkvfed2h7dOdI9GHb+lAwjITIEwl0qmLS9lb6+U0=;
 b=AY1GJe4XHI9orB1H3apY8sif6U0+YVhkBcRxzI+6JW0TSC/z8XnHQFEhD7aLsFmtpE
 6j0I9C/luUUI5UJ4OhDYQPKMinC4SRJvEfNO8fa6c2rkKU55nokNWEwBRIH5XSie/azA
 RhCjcJhTN9YkurSFsb9Jh55hfRKZzPlLNfxQ5C0dsOsodeb9W5eTfDtUC0XypM4MReNm
 zpYu4f33lnxI9FyNEOAGCham03L+SZCiec2o7/t3Lm8DZSKC0IkVZh5ejmIxqyHhLu//
 IhxQo+6HHyKtkeevCPOJRo9LezL/mmFzZ6MfF5kv1511A6Vh+g00JNGLZfPQFelTiTd8
 wwpg==
X-Gm-Message-State: AOAM530jLv+2///vzzvFXJtFrg4+dxC79X7uKp3ZtHjjVscy6HRpS6h0
 jJTBhLrsmBbSY1mxBip/Yr5PQK5qCncuUHWeEi+uwGc6C8PnsevzZYa313HIykArGjJv1ZN8rtR
 3LXC0Uf8Ls8dChRIl/AXtkUaDraY=
X-Received: by 2002:a25:c0cb:: with SMTP id c194mr9761516ybf.252.1618556490541; 
 Fri, 16 Apr 2021 00:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRsHVL3gtiUJaKM0Y1buS/8wmmjiMKshTxUgpyHoWtYS2S5BODz+/O8Y3OcnXwSLKU9idKN9aqMUCyGd4J/PQ=
X-Received: by 2002:a25:c0cb:: with SMTP id c194mr9761501ybf.252.1618556490383; 
 Fri, 16 Apr 2021 00:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-3-rpalethorpe@suse.com>
In-Reply-To: <20210412145506.26894-3-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 15:01:18 +0800
Message-ID: <CAEemH2ejA9kY2P4HsYEds3g9AjzFQ4mDRuWiF2176istdOMtaA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [PATCH v3 2/7] API: Add macro for the container_of trick
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
Content-Type: multipart/mixed; boundary="===============1151083382=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1151083382==
Content-Type: multipart/alternative; boundary="000000000000a8a57e05c0118c46"

--000000000000a8a57e05c0118c46
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe <rpalethorpe@suse.com> wrote:

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>


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
> +       const typeof( ((type *)0)->member ) *__mptr = (ptr); \
> +       (type *)( (char *)__mptr - offsetof(type,member) );  \
> +})
>

I'd suggest defining it as uppercase 'TST_CONTAINER_OF(...)' to respect
other macro's naming policy in tst_common.h.

-- 
Regards,
Li Wang

--000000000000a8a57e05c0118c46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=
=3D"_blank">rpalethorpe@suse.com</a>&gt; wrote:<br></div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Richa=
rd Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank"=
>rpalethorpe@suse.com</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:=
liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
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
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const typeof( ((type *)0)-&gt;member ) *__mptr =
=3D (ptr); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(type *)( (char *)__mptr - offsetof(type,member=
) );=C2=A0 \<br>
+})<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;d suggest defining it as=C2=A0uppercase &#39;TST=
_CONTAINER_OF(...)&#39; to respect</div><div class=3D"gmail_default" style=
=3D"font-size:small">other macro&#39;s naming policy in tst_common.h.</div>=
</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a8a57e05c0118c46--


--===============1151083382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1151083382==--

