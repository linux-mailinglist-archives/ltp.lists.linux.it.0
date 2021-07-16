Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3E3CB7BB
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:13:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AF643C7344
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:13:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B9A03C71FD
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:13:05 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6FDBB1401264
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626441183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWvQIE5UWgacfeMPErqOvSDzAoly9BUgEBGTlRj530U=;
 b=FiOBwL29t48zbhmKWT/s6QDQmI3cwp+c04TDjdx1hMxXgGwrzgdeUzwM7t5eqdo2Tz464V
 485f0EVimEuXCLtPDVjX9SSfnXcsqKQ1+7K0zeoaBVQVWiaKcl9VQrZaY0KiuE4Atl9nAF
 LCQnXdNHG1x4hamMkcCRAx61Nxwsca0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-n1A8HdVPM3OSglIBp96Zfg-1; Fri, 16 Jul 2021 09:13:01 -0400
X-MC-Unique: n1A8HdVPM3OSglIBp96Zfg-1
Received: by mail-yb1-f197.google.com with SMTP id
 k32-20020a25b2a00000b0290557cf3415f8so12592104ybj.1
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 06:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWvQIE5UWgacfeMPErqOvSDzAoly9BUgEBGTlRj530U=;
 b=E+bSDqY2Ric14rxxSeebFrRA1gTXvqtR4U9tM8VNS0IE9kY1dn6d03zCf3ubugRS1O
 DtYZDgJ1qNSM16SHWOqx0cnkDhssBmgS1uh86JMfk5Xb1lKGT7JFQAl/JUco1vJdNUU2
 HRdixhuCJDOZhTKPJFPRgrpz4S2RiV41tb3H6Tmjrhm3068Th2F6qkiaQrqSAR2o1O2V
 44XTas81sPtzScjzo4vtSrHyBmDE+15/uqIVFHyTa7vpkE3SS4k+I0jPEKNpODEjO5+/
 6Y4Kkkb6nPAB2RQjN+U8UGewEnRA/O0NQJPxdWh0Ks8ffZ4jLq+5+qf1Ee60FV9vef+4
 xH9g==
X-Gm-Message-State: AOAM532NB7OeaQ40blEdOBsE3+9V3f5vVNh0elXEtZkJZofdYR1bWqmY
 mIrVswe+CZ3TjqtV2hgUI5Sw4doNWH1dI4hyLScqiztW1XZK496o2uxMr6mMoRPYjUZiHq6HjqC
 s6g6ZfztxsznFNThfnpuiVb3OF4s=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr13037959yba.243.1626441180675; 
 Fri, 16 Jul 2021 06:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkplw3IixOz8+aJdBAws3HOuAY8VyxbPU1SUJSA4xujTYp/FQ+N2SP/uyuoj2QlLbahhnzBbI7lqOHKBiwfdg=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr13037926yba.243.1626441180398; 
 Fri, 16 Jul 2021 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
 <6e1a3663-59ea-5286-5c36-558b077184aa@bell-sw.com>
In-Reply-To: <6e1a3663-59ea-5286-5c36-558b077184aa@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Jul 2021 21:12:48 +0800
Message-ID: <CAEemH2fdJ_N2PpdCvH8M06U-ov9G0g-tcCdCDV2wZTVWCwCR2g@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Content-Type: multipart/mixed; boundary="===============1528278978=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1528278978==
Content-Type: multipart/alternative; boundary="000000000000ce5bb105c73d588d"

--000000000000ce5bb105c73d588d
Content-Type: text/plain; charset="UTF-8"

Alexey Kodanev <aleksei.kodanev@bell-sw.com> wrote:


>
> > Maybe another workaround is to define a volatile flag 'thread_complete',
> > initialize it to '0' when thread_B starts and reset to '1' while exit,
> and just
> > do a value check in the while loop of thread_A should acquire thread_B
> status.
> > Is this way a bit better?
>
> OK, why not, so something like this:
>
> diff --git a/testcases/kernel/crypto/af_alg02.c
> b/testcases/kernel/crypto/af_alg02.c
> index 0f5793c16..1fe0f3bf0 100644
> --- a/testcases/kernel/crypto/af_alg02.c
> +++ b/testcases/kernel/crypto/af_alg02.c
> @@ -18,11 +18,13 @@
>  #include "tst_test.h"
>  #include "tst_af_alg.h"
>  #include "tst_safe_pthread.h"
> +#include "tst_atomic.h"
>  #include <pthread.h>
>  #include <errno.h>
>
>  #define SALSA20_IV_SIZE       8
>  #define SALSA20_MIN_KEY_SIZE  16
> +static int completed;
>
>  static void *verify_encrypt(void *arg)
>  {
> @@ -48,6 +50,8 @@ static void *verify_encrypt(void *arg)
>                 tst_res(TPASS, "Successfully \"encrypted\" an empty
> message");
>         else
>                 tst_res(TFAIL, "read() didn't return 0");
> +
> +       tst_atomic_store(1, &completed);
>         return arg;
>  }
>
> @@ -60,7 +64,7 @@ static void run(void)
>
>         TST_CHECKPOINT_WAIT(0);
>
> -       while (pthread_tryjoin_np(thr, NULL) == EBUSY) {
> +       while (!tst_atomic_load(&completed)) {
>

+1
The atomic method is quite awesome!
-- 
Regards,
Li Wang

--000000000000ce5bb105c73d588d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.=
com">aleksei.kodanev@bell-sw.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"> <br>
&gt; Maybe another workaround is to define a volatile=C2=A0flag &#39;thread=
_complete&#39;,=C2=A0<br>
&gt; initialize it to &#39;0&#39; when thread_B starts and reset to &#39;1&=
#39; while exit, and just<br>
&gt; do a value check in the while loop of thread_A should acquire=C2=A0thr=
ead_B status.<br>
&gt; Is this way a bit better? <br>
<br>
OK, why not, so something like this:<br>
<br>
diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/a=
f_alg02.c<br>
index 0f5793c16..1fe0f3bf0 100644<br>
--- a/testcases/kernel/crypto/af_alg02.c<br>
+++ b/testcases/kernel/crypto/af_alg02.c<br>
@@ -18,11 +18,13 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_af_alg.h&quot;<br>
=C2=A0#include &quot;tst_safe_pthread.h&quot;<br>
+#include &quot;tst_atomic.h&quot;<br>
=C2=A0#include &lt;pthread.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
<br>
=C2=A0#define SALSA20_IV_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
=C2=A0#define SALSA20_MIN_KEY_SIZE=C2=A0 16<br>
+static int completed;<br>
<br>
=C2=A0static void *verify_encrypt(void *arg)<br>
=C2=A0{<br>
@@ -48,6 +50,8 @@ static void *verify_encrypt(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quo=
t;Successfully \&quot;encrypted\&quot; an empty message&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;read() didn&#39;t return 0&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_atomic_store(1, &amp;completed);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return arg;<br>
=C2=A0}<br>
<br>
@@ -60,7 +64,7 @@ static void run(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_CHECKPOINT_WAIT(0);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (pthread_tryjoin_np(thr, NULL) =3D=3D EBU=
SY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!tst_atomic_load(&amp;completed)) {<br><=
/blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">+1</div><div class=3D"gmail_default" style=3D"font-size:small">The a=
tomic method is quite awesome!</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000ce5bb105c73d588d--


--===============1528278978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1528278978==--

