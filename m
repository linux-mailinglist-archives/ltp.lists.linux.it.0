Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE812771A5
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 14:53:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C6C93C4D59
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 14:53:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B468E3C101E
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 14:53:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5F29C601286
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 14:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600952016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UoywoBU7K2JWlgSGrN1VKtnpcJrut2nZ6yvLEToRRWc=;
 b=ZY5Sjc7TdtVpwbHmGLFwHEQwaLbNaiS9Tq2jnPN+qSu3s3AImB755PXUV3l+JCsnPZHicH
 /Ie2XBfcDMUQUMjgYlizW6Iq71pz4APyKphGtb6tb2JCvYijSWmUOYQ1ESbyMY8ui6IJ/B
 mnVCBSZuB+TGDEKq30YSmRznDV3ig/4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-Qq_OnWe5Ou-44Bpq73ngNw-1; Thu, 24 Sep 2020 08:53:34 -0400
X-MC-Unique: Qq_OnWe5Ou-44Bpq73ngNw-1
Received: by mail-yb1-f198.google.com with SMTP id x10so2730394ybj.19
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UoywoBU7K2JWlgSGrN1VKtnpcJrut2nZ6yvLEToRRWc=;
 b=mhoa+vwWlxHdIFzpZGJ6/O2lXwqWIDo0hml2YHZGD+m2vuNwVUPndOFZM+AcLISl4v
 xgfM6pjKUb1wvlfbi+mCNEWOuZV3vf3+naM/NUqbeMfw/oBkAnq8iLyOvmUJFQZ8eZSG
 VEdXKkHYwdwkss3bE1CFib6z3suWv4MKwzYqTqiuUZeDVThzflJgDhIZcadMMq7ymvzK
 QJYJnQ09pUI2O4sPxW2mY8Bstp+kfNs/9sa0tys8R60datmMkb/c70SH2in5p8OqIkMp
 DEko5rome2v8tBVL4pdSMD7UzmqC47NhSZwBS2bU5ndOLl8M1CdPUo7GWVUiMl4Kyrzg
 ahQA==
X-Gm-Message-State: AOAM533L2C/lr6xniK//nySL2neqa2SCCcLUMfqLGlXE2TOqvT89OIQ3
 pjYsNwMkg7fzOszwPD3Cdk0ArC5Yt162X3fjSkQbp5dQNUnSq4io2YToaYDjJhVKnOse6+Swqe2
 TG0UcCLchiHx2t6B/Jv0BZOGGuKE=
X-Received: by 2002:a25:b792:: with SMTP id n18mr6797350ybh.286.1600952013816; 
 Thu, 24 Sep 2020 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA3ZQzhRrCGWoyw5NFN2bmUNaQgG5pVj+bqgpPFuZI5x7PxO560Erp2Jl7Oob2zD46LJuhNgLvGtboeW/l5TU=
X-Received: by 2002:a25:b792:: with SMTP id n18mr6797302ybh.286.1600952013507; 
 Thu, 24 Sep 2020 05:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200924111124.5666-1-rpalethorpe@suse.com>
In-Reply-To: <20200924111124.5666-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Sep 2020 20:53:21 +0800
Message-ID: <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_cgroup: Don't try to use V2 if V1 controllers
 are mounted
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0463717240=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0463717240==
Content-Type: multipart/alternative; boundary="0000000000001168f305b00eb0b1"

--0000000000001168f305b00eb0b1
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Thu, Sep 24, 2020 at 7:11 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> It is not possible to use a controller in V2 cgroups if it has been
> mounted as a V1 controller. So if V1 is mounted we use it regardless
> of if V2 is available.
>
> We have to include a space in tst_is_mounted so that we do not match
> cgroup2.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  lib/tst_cgroup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index ba413d874..73ddd4b82 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
>          enum tst_cgroup_ver cg_ver;
>
>          if (tst_cgroup_check("cgroup2")) {
> -                if (!tst_is_mounted("cgroup2") &&
> tst_is_mounted("cgroup"))
> +                if (tst_is_mounted("cgroup "))
>

Add a space in the suffix still not work as expected.

The reason is that tst_is_mounted("cgroup ") also get non-zero return if
system only mount cgroup_v2, which lead to choose cgroup_v1 in LTP test.

# cat /proc/mounts |grep cgroup
cgroup2 /sys/fs/cgroup cgroup2 rw,seclabel,nosuid,nodev,noexec,relatime 0 0

-- 
Regards,
Li Wang

--0000000000001168f305b00eb0b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Richard,</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 24, 2020 at 7:11 PM Richard=
 Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank">r=
palethorpe@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">It is not possible to use a controller in V2 cgroups if =
it has been<br>
mounted as a V1 controller. So if V1 is mounted we use it regardless<br>
of if V2 is available.<br>
<br>
We have to include a space in tst_is_mounted so that we do not match<br>
cgroup2.<br>
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_cgroup.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index ba413d874..73ddd4b82 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum tst_cgroup_ver cg_ver;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_check(&quot;cgroup2&quot;)=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_is_mounte=
d(&quot;cgroup2&quot;) &amp;&amp; tst_is_mounted(&quot;cgroup&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_is_mounted=
(&quot;cgroup &quot;))<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Add a space in the=C2=A0suffix still=
 not work as expected.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
e reason is that tst_is_mounted(&quot;cgroup &quot;) also get non-zero retu=
rn if system only mount cgroup_v2, which lead to choose cgroup_v1 in LTP te=
st.</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small"># cat /proc/mou=
nts |grep cgroup<br>cgroup2 /sys/fs/cgroup cgroup2 rw,seclabel,nosuid,nodev=
,noexec,relatime 0 0<br></div><div><br></div></div>-- <br><div dir=3D"ltr">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div>

--0000000000001168f305b00eb0b1--


--===============0463717240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0463717240==--

