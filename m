Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA63CB2F3
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 09:06:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 907743C71AA
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 09:06:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCB5A3C32D7
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 09:06:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E5B021A0042C
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 09:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626419189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7o01J5slJykzXsyGY7vDstF1VkAEEROadbCExz9JsG8=;
 b=VoUhkfTvHkVOKpkSPEauj3czB08wdtnf9U5xunpcnQIhxgOw/9iJAaVnU2mwnQ8awxCZZc
 DDr5Oew/YylJc4w9jLJGCCY3/1pzSGnfyPoHZK6TOFhgtOHzwdSGw5T14I8lDjIGMYyDne
 k4hqs1FrS1FdYbbJ5LN+V5ALPZlHtA4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-t5UQRV1iPEyysNrB63-jPw-1; Fri, 16 Jul 2021 03:06:26 -0400
X-MC-Unique: t5UQRV1iPEyysNrB63-jPw-1
Received: by mail-yb1-f197.google.com with SMTP id
 z64-20020a257e430000b0290550b1931c8dso11310805ybc.4
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 00:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7o01J5slJykzXsyGY7vDstF1VkAEEROadbCExz9JsG8=;
 b=NpwPjRSd3QowyHHEnLqy8jw7b8/KVYy9Gi37aAR809aCVfu57hvNR0e4vXEPsuWb3i
 qd4Z+fT7yfGqMNdHF+YPEb8u77nIgR27bqdwwf+KkENf4mODYnDBZeePmrpDZjIEv+3t
 fGFBxK5S9X2brdJrJ3pbJWr/23bhOCDWvtLKuyRSLS4qLAt6BEgTLC5ahnCAWlJKDxO6
 xZ4n5f1fSYLf2A9LbrVhPznQRFX1bsi3jUdZo4HRc6ZvcNEJeBUGX7dcoyG6ixx3MWNR
 pNjTLO4YD09eaN499QU7uAJfXy+Z3S/jT0abc0XONDVBHEskjv3J3MKjOyUdim0KA+QA
 idrw==
X-Gm-Message-State: AOAM530S0/KI9/QZtLshWunSbFcEkyTMNNSrGA8XaE1uZNbG/Ad04M9Z
 N/ocvjdxQMnN+gvFSsETf77IR03kwkysIA5F8jRrtW7+tzldVtUGSowOzC39ZIyYbZrOkoth9Vp
 PrAozXb/Zwz26Tjo+3Mi158Kqfo4=
X-Received: by 2002:a25:1455:: with SMTP id 82mr10718915ybu.403.1626419185821; 
 Fri, 16 Jul 2021 00:06:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8VCRJZ+9bdGEqZd5LsJ0EzTeSLaHU58wIaso7mW6qIPMFvH6VckzzqFxI8s4TerlIKzTOpjnDkEdmM1+HtmY=
X-Received: by 2002:a25:1455:: with SMTP id 82mr10718896ybu.403.1626419185615; 
 Fri, 16 Jul 2021 00:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
In-Reply-To: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Jul 2021 15:06:13 +0800
Message-ID: <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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
Content-Type: multipart/mixed; boundary="===============0971857181=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0971857181==
Content-Type: multipart/alternative; boundary="000000000000d097cd05c73839bc"

--000000000000d097cd05c73839bc
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Thu, Jul 15, 2021 at 6:29 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> musl doesn't return ESRCH for pthread_kill() if thread id is not found.
>
> POSIX only recommends to return ESRCH, and also says that pthread_kill()
> produces undefined behavior if tid lifetime has ended [1].
>
> [1]: https://man7.org/linux/man-pages/man3/pthread_kill.3.html
>
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
>  testcases/kernel/crypto/af_alg02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/crypto/af_alg02.c
> b/testcases/kernel/crypto/af_alg02.c
> index 31d30777c..0f5793c16 100644
> --- a/testcases/kernel/crypto/af_alg02.c
> +++ b/testcases/kernel/crypto/af_alg02.c
> @@ -60,7 +60,7 @@ static void run(void)
>
>         TST_CHECKPOINT_WAIT(0);
>
> -       while (pthread_kill(thr, 0) != ESRCH) {
> +       while (pthread_tryjoin_np(thr, NULL) == EBUSY) {
>

I'm not sure if safe enough to use because it is nonstandard GNU extensions
and the "_np" means nonportable.

Maybe another workaround is to define a volatile flag 'thread_complete',
initialize it to '0' when thread_B starts and reset to '1' while exit, and
just
do a value check in the while loop of thread_A should acquire thread_B
status.
Is this way a bit better?

-- 
Regards,
Li Wang

--000000000000d097cd05c73839bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Alexey,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 15, 2021 at 6:29 PM Alexey Kodane=
v &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-s=
w.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">musl doesn&#39;t return ESRCH for pthread_kill() if thread id is not f=
ound.<br>
<br>
POSIX only recommends to return ESRCH, and also says that pthread_kill()<br=
>
produces undefined behavior if tid lifetime has ended [1].<br>
<br>
[1]: <a href=3D"https://man7.org/linux/man-pages/man3/pthread_kill.3.html" =
rel=3D"noreferrer" target=3D"_blank">https://man7.org/linux/man-pages/man3/=
pthread_kill.3.html</a><br>
<br>
Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw=
.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/crypto/af_alg02.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/a=
f_alg02.c<br>
index 31d30777c..0f5793c16 100644<br>
--- a/testcases/kernel/crypto/af_alg02.c<br>
+++ b/testcases/kernel/crypto/af_alg02.c<br>
@@ -60,7 +60,7 @@ static void run(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_CHECKPOINT_WAIT(0);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (pthread_kill(thr, 0) !=3D ESRCH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (pthread_tryjoin_np(thr, NULL) =3D=3D EBU=
SY) {<br></blockquote><div><br></div>I&#39;m not sure if<span class=3D"gmai=
l_default" style=3D"font-size:small"> </span>safe<span class=3D"gmail_defau=
lt" style=3D"font-size:small"> enough</span> to use because it is nonstanda=
rd GNU extensions<br>and the &quot;_np&quot; means nonportable.</div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><div class=3D"gma=
il_default" style=3D"font-size:small">Maybe another workaround is to define=
 a volatile=C2=A0flag &#39;thread_complete&#39;,=C2=A0</div><div class=3D"g=
mail_default" style=3D"font-size:small">initialize it to &#39;0&#39; when t=
hread_B starts and reset to &#39;1&#39; while exit, and just</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">do a value check in the while=
 loop of thread_A should acquire=C2=A0thread_B status.</div><div class=3D"g=
mail_default" style=3D"font-size:small">Is this way a bit better?=C2=A0</di=
v></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--000000000000d097cd05c73839bc--


--===============0971857181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0971857181==--

