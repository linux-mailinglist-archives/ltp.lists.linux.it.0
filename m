Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C53B3FED
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:04:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E76A3C6F2D
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:04:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B8CD3C1D42
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:04:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 150AE10011CE
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624611840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqTI+G/l5N+Ky0XO9X3hTwGpNInL+tcXdU4zxcWqGT0=;
 b=iZ4GUU4gEvDMzrUPe4GhQQgKjIkMeTrtVv2I14eRM1d7jrCoi6ltUq8o44ZwdJpmw+mDkj
 as3adZyEx9Z0Kfg94I6X1f1JdBMkefhiuIwEGgCRPX1tj0MFZOxGaTJun/L6jdxIS9V9he
 mRsfoviboUmGj89fImawmmFCwt0shFw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-TZSXXQtpP6qNW1SMcSoUZw-1; Fri, 25 Jun 2021 05:03:56 -0400
X-MC-Unique: TZSXXQtpP6qNW1SMcSoUZw-1
Received: by mail-yb1-f197.google.com with SMTP id
 p192-20020a2542c90000b02905576aec3795so803852yba.1
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 02:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqTI+G/l5N+Ky0XO9X3hTwGpNInL+tcXdU4zxcWqGT0=;
 b=tOLcqC9ZK53J0w85jZpgStBm5kYFuzSigt7cp8I8SuLbm++1aLWTEYeCdCliMQNgZR
 QNbGKj9RkEiwpu753DmcQlMkVj9vQU1F5YVuTN7MXzjVTBY7/tCIJ+IPNo64EFzI/G9k
 iMiNuUw9mo9eUpjJM2FpocUSZlfOmyJhg7ANy7h8c/uRaZ1etQ72mzs7OZZ7oBz7JxUd
 kMmY5IqJdgWZh/BTi/0oVUOc64tG+i8itx6O8u8jHhSXohm6trEM/hHYzRfVXU3KRcV1
 zg1hV3X/l5Z4t2bln7dxuNc1tqlNVaDddyjIXf10OsXgFA3ricVdgETp+PxuJr5BX8db
 0E1A==
X-Gm-Message-State: AOAM531V4LUnjGS0bTu1FoLYBNTCGx8P78Z6RCkoNkSjde57xBcEU5OW
 9KRr6+sUh6C62uSRt7l3dX61bTu+nWcRE1uvq5lW0CtbPYWo4PCS769RUQylxXdYJ/5AZrCR6Oj
 ZtVQXTd23KP0glwRB3Xz+lh16z9A=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr10779471yba.110.1624611836076; 
 Fri, 25 Jun 2021 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2V9xCgvTLfIdG9ziruS63YIzP2PwBSvOb5vNDrp+Lc7ES9FkLxac4bXCU6+Uuqq6i2O2Sr3Ek7/4sAvd0tds=
X-Received: by 2002:a25:3882:: with SMTP id
 f124mr10779442yba.110.1624611835729; 
 Fri, 25 Jun 2021 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1624515373-3899-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624515373-3899-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Jun 2021 17:03:43 +0800
Message-ID: <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
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
Subject: Re: [LTP] [PATCH] ipc/msgget03: Make sure we get ENOSPC error after
 creating MSGMNI message queues
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
Content-Type: multipart/mixed; boundary="===============0127600607=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0127600607==
Content-Type: multipart/alternative; boundary="0000000000005ded6905c5936bbe"

--0000000000005ded6905c5936bbe
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 2:16 PM Yang Xu <xuyang2018.jy@fujitsu.com> wrote:

> Even msgget() failed, this for loop still continues. So we can't know
> whether
> system creates actual MSGMNI message queues and then fail with ENOSPC. Fix
> this by
> reporting fail if msgget failed in setup.
>
> Also make use of TST_EXP_FAIL2 macro.
>

Do we have TST_EXP_FAIL2 macro? or do you mean TST_EXP_FAIL?
And the remaining part looks good.


> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  .../kernel/syscalls/ipc/msgget/msgget03.c     | 21 +++++++------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> index 8fa620855..da3753a19 100644
> --- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> @@ -20,22 +20,14 @@
>  #include "tst_safe_sysv_ipc.h"
>  #include "libnewipc.h"
>
> -static int maxmsgs;
> +static int maxmsgs, queue_cnt;
>  static int *queues;
>  static key_t msgkey;
>
>  static void verify_msgget(void)
>  {
> -       TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL));
> -       if (TST_RET != -1)
> -               tst_res(TFAIL, "msgget() succeeded unexpectedly");
> -
> -       if (TST_ERR == ENOSPC) {
> -               tst_res(TPASS | TTERRNO, "msgget() failed as expected");
> -       } else {
> -               tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
> -                       " expected ENOSPC");
> -       }
> +       TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL),
> ENOSPC,
> +               "msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
>  }
>
>  static void setup(void)
> @@ -52,8 +44,9 @@ static void setup(void)
>                 queues[num] = -1;
>
>                 res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
> -               if (res != -1)
> -                       queues[num] = res;
> +               if (res == -1)
> +                       tst_brk(TBROK | TERRNO, "msgget failed
> unexpectedly");
> +               queues[queue_cnt++] = res;
>         }
>
>         tst_res(TINFO, "The maximum number of message queues (%d) reached",
> @@ -67,7 +60,7 @@ static void cleanup(void)
>         if (!queues)
>                 return;
>
> -       for (num = 0; num < maxmsgs; num++) {
> +       for (num = 0; num < queue_cnt; num++) {
>                 if (queues[num] != -1)
>                         SAFE_MSGCTL(queues[num], IPC_RMID, NULL);
>         }
> --
> 2.23.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000005ded6905c5936bbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 24, 2021 at 2:16 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Even msgget(=
) failed, this for loop still continues. So we can&#39;t know whether<br>
system creates actual MSGMNI message queues and then fail with ENOSPC. Fix =
this by<br>
reporting fail if msgget failed in setup.<br>
<br>
Also make use of TST_EXP_FAIL2 macro.<br></blockquote><div><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Do we have TST_EXP_FAIL2 m=
acro? or do you mean TST_EXP_FAIL?</div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-size:=
small">And the remaining part looks good.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../kernel/syscalls/ipc/msgget/msgget03.c=C2=A0 =C2=A0 =C2=A0| 21 +++=
++++------------<br>
=C2=A01 file changed, 7 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/ke=
rnel/syscalls/ipc/msgget/msgget03.c<br>
index 8fa620855..da3753a19 100644<br>
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c<br>
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c<br>
@@ -20,22 +20,14 @@<br>
=C2=A0#include &quot;tst_safe_sysv_ipc.h&quot;<br>
=C2=A0#include &quot;libnewipc.h&quot;<br>
<br>
-static int maxmsgs;<br>
+static int maxmsgs, queue_cnt;<br>
=C2=A0static int *queues;<br>
=C2=A0static key_t msgkey;<br>
<br>
=C2=A0static void verify_msgget(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_E=
XCL));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;msgget() succeeded unexpectedly&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_ERR =3D=3D ENOSPC) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS | TTE=
RRNO, &quot;msgget() failed as expected&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO, &quot;msgget() failed unexpectedly,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; expected ENOSPC&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREA=
T | IPC_EXCL), ENOSPC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;msgget(%i, %i=
)&quot;, msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);<br>
=C2=A0}<br>
<br>
=C2=A0static void setup(void)<br>
@@ -52,8 +44,9 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queues[num] =3D -1;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D msgget(msgk=
ey + num, IPC_CREAT | IPC_EXCL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res !=3D -1)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0queues[num] =3D res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (res =3D=3D -1)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;msgget failed unexpectedly&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queues[queue_cnt++]=
 =3D res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;The maximum number of mess=
age queues (%d) reached&quot;,<br>
@@ -67,7 +60,7 @@ static void cleanup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!queues)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (num =3D 0; num &lt; maxmsgs; num++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (num =3D 0; num &lt; queue_cnt; num++) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (queues[num] !=
=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 SAFE_MSGCTL(queues[num], IPC_RMID, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.23.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000005ded6905c5936bbe--


--===============0127600607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0127600607==--

