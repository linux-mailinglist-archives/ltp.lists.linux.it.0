Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADB333C82
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:21:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 600BB3C6554
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:21:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EF28A3C4B4F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:21:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 42374600BE6
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615378866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6rJC/TJ8sPx+xKVhgr/yRlFpQuD+YxnDU9B593UF8ag=;
 b=h2tR9VT6ReZTeXw9iIH4VeZ+VJj/MBfx9ScvK7FQRHDRRmnOmy1zripQi2YxnsPKFCYD9L
 UhGcRNAg9z4rV9dkXVS0Kdy6M6rf8Ad3hGbLwdvxLFpp9GwbETVJXZTiVgBpNR/6YtMC8T
 kh+C5mgTLdsEkmaaEA3vGDxZJfHgnE8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-Dhgb0Uu0MEu9x9LcmPIywg-1; Wed, 10 Mar 2021 07:21:03 -0500
X-MC-Unique: Dhgb0Uu0MEu9x9LcmPIywg-1
Received: by mail-yb1-f198.google.com with SMTP id 127so21003930ybc.19
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 04:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rJC/TJ8sPx+xKVhgr/yRlFpQuD+YxnDU9B593UF8ag=;
 b=TzkcFqGwTjT4e+aebbiCpxVULflhvvy1LPzpeVK3ZPI6y9puVHtuSRbUWHoQqgTqPl
 Ew7gdKrUCEQXI0QIYaGMBdr6y9nP86gPrxXghYbeo7VujjgGNBSHWEMBg5PyrDoe4Swp
 6DcFtAUYmsIthwymNL//jl1pGN8MzdDkulVAnCBz9N7KrWz7w4pdcLCUi6YBc7bbeNIF
 YqT++45lrsK4a5wj6YJ2oH2jC+D4+HbN6fs0+tXou6GwFZfIbDCTrRygkZVaQUXZhRr0
 GHbY6yA4J7H1YRc1IO2hJaYvg6JZn6lmrZ1xDI8HIEwF7yxNwiCIgUglP9gWV2puZIiu
 MzRg==
X-Gm-Message-State: AOAM531Goqsl4Vb4tKhX3WJB8cwwHjuHjkuP7Eyym8atMNO+KxhF5aVZ
 NCH5DOjeAp0OqFgSusPkfMB5UNm9nsAwOP7ndCnShW0xDuEb4gMREPvgIqSDTiM+BoH6ESzASU6
 fDZ5Gsft+ixKdKpjLvEQOLcgtaxk=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr3754850ybh.110.1615378862618; 
 Wed, 10 Mar 2021 04:21:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQS89LTioG/fm/zowGuqu5ht4dWjz/aihe0QcRmsaJqJox8S8QrDND2IOMouTdVJC/Hxr77uqvoCxmKws5QZQ=
X-Received: by 2002:a25:e7d7:: with SMTP id e206mr3754838ybh.110.1615378862490; 
 Wed, 10 Mar 2021 04:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310081048.27993-1-zhaogongyi@huawei.com>
In-Reply-To: <20210310081048.27993-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 10 Mar 2021 20:20:48 +0800
Message-ID: <CAEemH2dpSfc=fgRG1zwbBm1aLgRkbX8qECH7VPz+avBVLjmnDg@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
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
Content-Type: multipart/mixed; boundary="===============0882939222=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0882939222==
Content-Type: multipart/alternative; boundary="00000000000046de7105bd2db331"

--00000000000046de7105bd2db331
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

On Wed, Mar 10, 2021 at 4:11 PM Zhao Gongyi <zhaogongyi@huawei.com> wrote:

> Because of race condition or abnormal env, set_dev_path may be
> return 1. And when set_dev_path return 1 in tst_find_free_loopdev,
> we should return Immediately.
>

If there exists a race condition, I firstly think of the TST_RETRY_FUNC
macro
to try more times for the set_dev_path. That might help to get the function
success
in the follow-up tries.



>
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  lib/tst_device.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index c096b418b..51cf1ba7e 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -83,8 +83,13 @@ int tst_find_free_loopdev(char *path, size_t path_len)
>                 rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
>                 close(ctl_fd);
>                 if (rc >= 0) {
> -                       if (path)
> -                               set_dev_path(rc, path, path_len);
> +                       if (path)
> +                               if (!set_dev_path(rc, path, path_len)) {
> +                                       tst_resm(TINFO,
> +                                               "loop device not exist");
> +                                       return -1;
> +                               }
> +
>                         tst_resm(TINFO, "Found free device %d '%s'",
>                                 rc, path ?: "");
>                         return rc;
> --
> 2.17.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--00000000000046de7105bd2db331
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 10, 2021 at 4:11 PM Zhao Gongyi &=
lt;<a href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Because of=
 race condition or abnormal env, set_dev_path may be<br>
return 1. And when set_dev_path return 1 in tst_find_free_loopdev,<br>
we should return Immediately.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">If there exists a race condit=
ion, I firstly think of the TST_RETRY_FUNC macro</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">to try more times for the set_dev_path. T=
hat might help to get the function success</div><div class=3D"gmail_default=
" style=3D"font-size:small">in the follow-up tries.</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Zhao Gongyi &lt;<a href=3D"mailto:zhaogongyi@huawei.com" tar=
get=3D"_blank">zhaogongyi@huawei.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_device.c | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/lib/tst_device.c b/lib/tst_device.c<br>
index c096b418b..51cf1ba7e 100644<br>
--- a/lib/tst_device.c<br>
+++ b/lib/tst_device.c<br>
@@ -83,8 +83,13 @@ int tst_find_free_loopdev(char *path, size_t path_len)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D ioctl(ctl_fd=
, LOOP_CTL_GET_FREE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ctl_fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc &gt;=3D 0) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (path)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_dev_path(rc, path, path_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!set_dev_path(rc, path, path_len)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(=
TINFO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;loop device not exist&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_resm(TINFO, &quot;Found free device %d &#39;%s&#39;&quot;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc, path ?: &quot;&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return rc;<br>
--<br>
2.17.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000046de7105bd2db331--


--===============0882939222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0882939222==--

