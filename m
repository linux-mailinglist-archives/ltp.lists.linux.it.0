Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584B2512DF
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:17:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55AED3C5681
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:17:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BAD7C3C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:17:52 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 403B81A00E6C
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598339870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mKjAHQ0Zs7BBh/QE7uUMrudfbcxZtsNFmp3z3qzmUnM=;
 b=RpRZMrIOmOhPi5f6Yq7b3yvzAKUmhLh+xu/KMjmO6s7jaWXyK30JWV3kbSFXSRmDGAyiLc
 aINZ8WO0sT7ft1ZcXI3UjYNWTRN0bEYX+x30cTMOm6JvQidhAI7kZ59KT6rZUf3gcjd0hv
 55TpcKOekU/6CJtJpKHW1Hr+3o7DrnQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-lyJndFsrNOmRUa9J7KFgZw-1; Tue, 25 Aug 2020 03:17:45 -0400
X-MC-Unique: lyJndFsrNOmRUa9J7KFgZw-1
Received: by mail-yb1-f199.google.com with SMTP id o8so13781180ybg.16
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 00:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKjAHQ0Zs7BBh/QE7uUMrudfbcxZtsNFmp3z3qzmUnM=;
 b=QoG+UwssvrnrJWUIpZAtY79BK+snpHhIHWFPyMGrxJEHLGWG0nRpp7uUI5UXm+SBHG
 J6wpap9PVpNvsK1JGzIu6BjvwL9OLQoSmTYwa+iVaWhF7rheuWfkJ1lvSUm2uE7UV9XX
 bsVavozuPje5OFsjerzGzhTzq15rDaV6unYQekXwTwwRdul8jQtTobHWP1roIDpV4M7h
 SZb1z6d6+cl2lWn2DsHzeXTPpVb45fxmNv1e5VZEA+fYP/i4XplH4gCyce1ExAdoHKxw
 2M2j9WevVBM134SP+xSfIL5xK6kNa0+T5ffJQXr1TD/3VnIWxWDEwg5nC99XE9VgJle4
 +Mxw==
X-Gm-Message-State: AOAM533nwk+wXw9YmwHU0qd51eGrGuInwPE1137bH6owzbDK9JDgmy4C
 KyJ/zkI7Cy8l7zMn3mxBvz++Ysz6VzNckPtv0GwkCsCU0q2wbigYKcyAr8pOr1WH4vsFC/c5kW/
 X0+6AfcsllDE+0aZazxevGpr2vqo=
X-Received: by 2002:a25:414:: with SMTP id 20mr12631449ybe.97.1598339865102;
 Tue, 25 Aug 2020 00:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnQn6/295bBvYcwPDwDJ9P1+B6SnC2hpvxoVOP8T71CZW8lp+64Wlzw+iBxg4YDF25vPISeiHqvrC2tSAF3Go=
X-Received: by 2002:a25:414:: with SMTP id 20mr12631432ybe.97.1598339864873;
 Tue, 25 Aug 2020 00:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 Aug 2020 15:17:33 +0800
Message-ID: <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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
Content-Type: multipart/mixed; boundary="===============1618291184=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1618291184==
Content-Type: multipart/alternative; boundary="000000000000e060b705adae7f06"

--000000000000e060b705adae7f06
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 25, 2020 at 3:14 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> I have this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error on
> centos7.
> It is more friendly for centos7 user and more meaningful. centos6 is
> outdated
> and we should drop it.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index e8e3189af..3c5ff99b7 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -44,7 +44,7 @@ matrix:
>            compiler: clang
>
>          - os: linux
> -          env: DISTRO=centos:6 TREE=out
> +          env: DISTRO=centos:7 TREE=out
>            compiler: gcc
>
>          - os: linux
> --
> 2.23.0
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000e060b705adae7f06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 3:14 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I have=
 this idea when I meet ALG_SET_AEAD_ASSOCLEN undefined error on centos7.<br=
>
It is more friendly for centos7 user and more meaningful. centos6 is outdat=
ed<br>
and we should drop it.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div=
><span class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang =
&lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></=
div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.travis.yml | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/.travis.yml b/.travis.yml<br>
index e8e3189af..3c5ff99b7 100644<br>
--- a/.travis.yml<br>
+++ b/.travis.yml<br>
@@ -44,7 +44,7 @@ matrix:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler: clang<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- os: linux<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env: DISTRO=3Dcentos:6 TREE=3Dout<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env: DISTRO=3Dcentos:7 TREE=3Dout<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compiler: gcc<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- os: linux<br>
-- <br>
2.23.0<br>
<br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e060b705adae7f06--


--===============1618291184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1618291184==--

