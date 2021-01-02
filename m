Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD82E86D8
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Jan 2021 10:23:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 869A03C54E3
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Jan 2021 10:23:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AAD6D3C29EF
 for <ltp@lists.linux.it>; Sat,  2 Jan 2021 10:23:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 165ED1400BDC
 for <ltp@lists.linux.it>; Sat,  2 Jan 2021 10:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609579436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPYA2kDft0ERhcN+C7GL4pwbL5qAY1quq6PhuzR5k2Q=;
 b=biSOUDD1FkH2dXl4xBL6gDDyU3OXiNlhJhWwS/NEAlB916xvtTBofxPLLErqdz8m5ER3ID
 4cUUeCeOLGOuw0uKlzdLiGSF3p860bGjPbnuWsL4AB4dm4b97GZIowzHbaPH7c2bEXddao
 JeDXmG7srKYSrKIK2U1ICyoTxUtJSJ4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-CYTxCAQEPtqn1_2BWpNTWw-1; Sat, 02 Jan 2021 04:23:54 -0500
X-MC-Unique: CYTxCAQEPtqn1_2BWpNTWw-1
Received: by mail-yb1-f200.google.com with SMTP id e68so41016894yba.7
 for <ltp@lists.linux.it>; Sat, 02 Jan 2021 01:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPYA2kDft0ERhcN+C7GL4pwbL5qAY1quq6PhuzR5k2Q=;
 b=NprKV3nWvb9mVChmMxkg8CaZ8Sw9YFZUbfjPKp9tAC7U0012QWBs73I2Z66vJ18IHH
 okWu6GRQzMBO8+G59T4QpciMJAM2sBWCwj9lMO7nJ4NIcib5a55q9/Nfh2ouT72xWzN+
 8ePFr7HyvAafaS231Fi6LzPQBNK+IAIZzGd/Lvz4/9sjF3tTJ46SdNnp5GHeMFKl4ybB
 XmVCgb5l9jkIVgg58vIHWXIgbyfi0ll29p9mmTfZOUcsuG7oDVZhEZXR/Fu4m+6JY5/2
 hFUbIy51iJ4oehPGRB48/hcUJlN0/J0MZqBRbwyrHOnRSZbBtKRL3ZYQIAXC0FWlQqMY
 PG8Q==
X-Gm-Message-State: AOAM533KLcBUbI137VJGkXMxSiQaS4aW2WZ1dZJcX2f0nKv0PTJfPkOL
 eUFX/Z9Go6hX2t9seSR/rwwgYTFLayPJ/GPEwuKgZmO30DP2B5OIQnT0YXhPi+Y3jjRWIhpjrrY
 uB7JolDCdOiD5a08sqTYefnTC7Ng=
X-Received: by 2002:a25:6902:: with SMTP id e2mr93333691ybc.97.1609579434154; 
 Sat, 02 Jan 2021 01:23:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyW9d04PKjg4dudvwAFOi1ye6bSH89jT5qoQlvZPiY2d2nObP+400FaihzTBQKgCUg5rnee7JRQOyiOjPfA8xE=
X-Received: by 2002:a25:6902:: with SMTP id e2mr93333678ybc.97.1609579433957; 
 Sat, 02 Jan 2021 01:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-4-rpalethorpe@suse.com>
In-Reply-To: <20201216100121.16683-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 2 Jan 2021 17:23:42 +0800
Message-ID: <CAEemH2cLkNbczZ7n-wvyxfAiVtM6+vyjUpV84_Rx3wuN+tonwg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/5] CGroup API tests
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
Content-Type: multipart/mixed; boundary="===============0995211612=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0995211612==
Content-Type: multipart/alternative; boundary="0000000000006640a305b7e76ae1"

--0000000000006640a305b7e76ae1
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe via ltp <ltp@lists.linux.it> wrote:

Rewrite of existing test and new test for the CGroups API.
> ...
> --- a/lib/newlib_tests/test21.c
> +++ b/lib/newlib_tests/test21.c
> @@ -11,8 +11,6 @@
>  #include "tst_test.h"
>  #include "tst_cgroup.h"
>
> -#define PATH_CGROUP1 "/mnt/liwang1"
> -#define PATH_CGROUP2 "/mnt/liwang2"
>  #define MEMSIZE 1024 * 1024
>
>  static void do_test(void)
> @@ -21,19 +19,16 @@ static void do_test(void)
>
>         switch (pid) {
>         case 0:
> -               tst_cgroup_move_current(PATH_CGROUP1);
> -               tst_cgroup_mem_set_maxbytes(PATH_CGROUP1, MEMSIZE);
> -               tst_cgroup_mem_set_maxswap(PATH_CGROUP1, MEMSIZE);
> -
> -               tst_cgroup_move_current(PATH_CGROUP2);
> -
> +               tst_cgroup_move_current(TST_CGROUP_MEMORY);
> +               tst_cgroup_mem_set_maxbytes(MEMSIZE);
> +               tst_cgroup_mem_set_maxswap(MEMSIZE);
>

We'd better set a different value(maybe MEMSIZE/2) for the child's
CGROUP_MEMORY because test21 is designed to verify there is
no race condition when multithread using the same controller. In
other words, we need to avoid that iteration become a NOP.



>         break;
>         default:
> -               tst_cgroup_move_current(PATH_TMP_CG_CST);
> +               tst_cgroup_move_current(TST_CGROUP_CPUSET);
>
> -               tst_cgroup_move_current(PATH_TMP_CG_MEM);
> -               tst_cgroup_mem_set_maxbytes(PATH_TMP_CG_MEM, MEMSIZE);
> -               tst_cgroup_mem_set_maxswap(PATH_TMP_CG_MEM, MEMSIZE);
> +               tst_cgroup_move_current(TST_CGROUP_MEMORY);
> +               tst_cgroup_mem_set_maxbytes(MEMSIZE);
> +               tst_cgroup_mem_set_maxswap(MEMSIZE);
>         break;
>         }
>
> @@ -42,20 +37,11 @@ static void do_test(void)
>
>  static void setup(void)
>  {
> -       tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_MEM);
> -       tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1);
> -
> -       tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
> -       tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP2);
> +       tst_cgroup_require(TST_CGROUP_MEMORY, NULL);
>

The test requires _CPUSET too:
    tst_cgroup_require(TST_CGROUP_CPUSET, NULL);

 }
>
>  static void cleanup(void)
>  {
> -       tst_cgroup_umount(PATH_TMP_CG_MEM);
> -       tst_cgroup_umount(PATH_CGROUP1);
> -
> -       tst_cgroup_umount(PATH_TMP_CG_CST);
> -       tst_cgroup_umount(PATH_CGROUP2);
>  }
>

-- 
Regards,
Li Wang

--0000000000006640a305b7e76ae1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Richard Palethorpe via ltp &lt;<a href=3D"mailto:ltp@li=
sts.linux.it" target=3D"_blank">ltp@lists.linux.it</a>&gt; wrote:<br></div>=
<div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Rewrite of existing test and new test for the CGroup=
s API.<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
--- a/lib/newlib_tests/test21.c<br>
+++ b/lib/newlib_tests/test21.c<br>
@@ -11,8 +11,6 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_cgroup.h&quot;<br>
<br>
-#define PATH_CGROUP1 &quot;/mnt/liwang1&quot;<br>
-#define PATH_CGROUP2 &quot;/mnt/liwang2&quot;<br>
=C2=A0#define MEMSIZE 1024 * 1024<br>
<br>
=C2=A0static void do_test(void)<br>
@@ -21,19 +19,16 @@ static void do_test(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pid) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(PATH_CGROUP1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxbytes(PATH_CGROUP1, MEMSIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxswap(PATH_CGROUP1, MEMSIZE);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(PATH_CGROUP2);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(TST_<span class=3D"gmail_default" style=3D"font-size:small"></span>CGR=
OUP_MEMORY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxbytes(MEMSIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxswap(MEMSIZE);<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">We&#39;d better set a different value(may=
be MEMSIZE/2) for=C2=A0<span class=3D"gmail_default">the child&#39;s</span>=
</div><div class=3D"gmail_default" style=3D"font-size:small">CGROUP_MEMORY =
because test21 is designed to verify there is</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">no race condition when multithread using the=
 same controller. In</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">other words, we need to avoid that iteration become a NOP.</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(PATH_TMP_CG_CST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(TST_CGROUP_CPUSET);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(PATH_TMP_CG_MEM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxbytes(PATH_TMP_CG_MEM, MEMSIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxswap(PATH_TMP_CG_MEM, MEMSIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_move_cur=
rent(TST_CGROUP_MEMORY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxbytes(MEMSIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mem_set_=
maxswap(MEMSIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -42,20 +37,11 @@ static void do_test(void)<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_TMP_CG_=
MEM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount(TST_CGROUP_MEMCG, PATH_CGROUP1=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG=
_CST);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_CGROUP=
2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_require(TST_CGROUP_MEMORY, NULL);<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">The test requires _CPUSET too:</div></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_cgroup_require(T=
ST_CGROUP_CPUSET, NULL);</div></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void cleanup(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_umount(PATH_TMP_CG_MEM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_umount(PATH_CGROUP1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_umount(PATH_TMP_CG_CST);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_umount(PATH_CGROUP2);<br>
=C2=A0}<br></blockquote><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--0000000000006640a305b7e76ae1--


--===============0995211612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0995211612==--

