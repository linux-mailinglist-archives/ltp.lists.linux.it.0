Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7D2C4E0B
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 05:33:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF1E83C5E34
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 05:33:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E32F43C2246
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 05:33:22 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 54F5B10006B6
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 05:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606365199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxuw/93QpVLfj7Z4RNt77ueoz11UXxAHnFswQjv7GLM=;
 b=EuDDrk/WhPcV1mo6x5d43frj2z9wC4z1Vca2go7Y50ZvZJE0Z3c4YXKyRnGK8ZKmol57hv
 w/lC7zS9CyNWx1C+ZGjdzdXh6/BBi0RJmqSau2/u+3nUsqRB3XyBR1kF+nDHqsMuM6M0cd
 UkevT/CB2MNmEAfwgq+JfCpXylRCljQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-CJyTGtGSPX6c0rau3S9BfA-1; Wed, 25 Nov 2020 23:33:15 -0500
X-MC-Unique: CJyTGtGSPX6c0rau3S9BfA-1
Received: by mail-yb1-f197.google.com with SMTP id u37so1238319ybi.15
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 20:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxuw/93QpVLfj7Z4RNt77ueoz11UXxAHnFswQjv7GLM=;
 b=Z49WoMMo8kxu3PZx8pcKYOZM6lFHvwzqfFp0BPx39UrkFlE84gaUdRt56O+uPgblsT
 zdOm0Fy0pBxN/Joa6svoY51bNWxmbWlie3+oxtwyhjeMQMSU1gID6uSAgSvIoQecnbf9
 zZEeYPLy2kN91rediVHyHOdx/KJ+drgij2A1YZYlLa11wcX+IUPDBOkmR1z/q5eOcjnh
 +0mOn+zxytlh0RRgNz67T8bMbOBGBmnYIDd3dWfHokUN3bM0QyssNHTFzksgtMmyusfw
 vb78khtmapOUDVjFyKsJ4GT4s9A6BeVhMU6Nk3tbsvJ2r4vDqkS2ywq73yv5yyo/lCCH
 MB4g==
X-Gm-Message-State: AOAM530sl/p3wbVSjKrdgSnFoMhMkXquzsx99x7XUk3FzhvcIugLAgoU
 fIBSGEi5idTzfd4+7UDsmlRDD4U/4i1xOZ/zEDcrxsI4FiZlOZk85Lt2iRxBDvB9LkrWpSdcf4v
 M7OU9ch3oyk8o83mZyPDt42LytRg=
X-Received: by 2002:a25:da90:: with SMTP id n138mr1380569ybf.366.1606365195270; 
 Wed, 25 Nov 2020 20:33:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwU3ctUL3S9TVNgskjA5yz9UQc2xF8K9S6K/a3oyR6KueA+l5Na8SAJ+CGUROBLf2rHFFe58d2Ql1JX2PN7Qx4=
X-Received: by 2002:a25:da90:: with SMTP id n138mr1380554ybf.366.1606365195086; 
 Wed, 25 Nov 2020 20:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Nov 2020 12:33:03 +0800
Message-ID: <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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
Content-Type: multipart/mixed; boundary="===============1384990008=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1384990008==
Content-Type: multipart/alternative; boundary="000000000000d544e105b4fb0aeb"

--000000000000d544e105b4fb0aeb
Content-Type: text/plain; charset="UTF-8"

Hi Xiao,

The patch itself looks good, but I remember we were planning to
drop support for the old distro e.g CentOS6.

The previous discussion here:
http://lists.linux.it/pipermail/ltp/2020-March/016164.html

On Thu, Nov 26, 2020 at 9:49 AM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> From travis-ci, compiling name_to_handle_at/open_by_handle_at tests
> failed on centos6 due to undefined AT_EMPTY_PATH and MAX_HANDLE_SZ.
>
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>  include/lapi/fcntl.h             | 4 ++++
>  include/lapi/name_to_handle_at.h | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
> index 576a18daf..d6665915f 100644
> --- a/include/lapi/fcntl.h
> +++ b/include/lapi/fcntl.h
> @@ -136,4 +136,8 @@
>  # define SPLICE_F_NONBLOCK 2
>  #endif
>
> +#ifndef MAX_HANDLE_SZ
> +# define MAX_HANDLE_SZ 128
> +#endif
> +
>  #endif /* __LAPI_FCNTL_H__ */
> diff --git a/include/lapi/name_to_handle_at.h
> b/include/lapi/name_to_handle_at.h
> index c0759c463..3484133d1 100644
> --- a/include/lapi/name_to_handle_at.h
> +++ b/include/lapi/name_to_handle_at.h
> @@ -10,6 +10,7 @@
>  #include <sys/syscall.h>
>  #include "config.h"
>  #include "lapi/syscalls.h"
> +#include "lapi/fcntl.h"
>  #include "tst_buffers.h"
>  #include "tst_test.h"
>
> --
> 2.25.1
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

--000000000000d544e105b4fb0aeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xiao,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
e patch itself looks good, but I remember we were planning to drop=C2=A0sup=
port for the old distro e.g CentOS6.=C2=A0</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">The previous discussion here:</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><a href=3D"http://lists.linux.it/pipermail=
/ltp/2020-March/016164.html">http://lists.linux.it/pipermail/ltp/2020-March=
/016164.html</a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Nov 26, 2020 at 9:49 AM Xiao Yang &lt;<a =
href=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From travis-=
ci, compiling name_to_handle_at/open_by_handle_at tests<br>
failed on centos6 due to undefined AT_EMPTY_PATH and MAX_HANDLE_SZ.<br>
<br>
Signed-off-by: Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" tar=
get=3D"_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0include/lapi/fcntl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 4 ++++<br>
=C2=A0include/lapi/name_to_handle_at.h | 1 +<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h<br>
index 576a18daf..d6665915f 100644<br>
--- a/include/lapi/fcntl.h<br>
+++ b/include/lapi/fcntl.h<br>
@@ -136,4 +136,8 @@<br>
=C2=A0# define SPLICE_F_NONBLOCK 2<br>
=C2=A0#endif<br>
<br>
+#ifndef MAX_HANDLE_SZ<br>
+# define MAX_HANDLE_SZ 128<br>
+#endif<br>
+<br>
=C2=A0#endif /* __LAPI_FCNTL_H__ */<br>
diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle=
_at.h<br>
index c0759c463..3484133d1 100644<br>
--- a/include/lapi/name_to_handle_at.h<br>
+++ b/include/lapi/name_to_handle_at.h<br>
@@ -10,6 +10,7 @@<br>
=C2=A0#include &lt;sys/syscall.h&gt;<br>
=C2=A0#include &quot;config.h&quot;<br>
=C2=A0#include &quot;lapi/syscalls.h&quot;<br>
+#include &quot;lapi/fcntl.h&quot;<br>
=C2=A0#include &quot;tst_buffers.h&quot;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
<br>
-- <br>
2.25.1<br>
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

--000000000000d544e105b4fb0aeb--


--===============1384990008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1384990008==--

