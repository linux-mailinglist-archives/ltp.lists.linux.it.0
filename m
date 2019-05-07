Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8115ED3
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 10:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27F3D3EA39A
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 10:07:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C86D63EA046
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:07:55 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94C9B600CEF
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:07:53 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id o33so5666096uae.12
 for <ltp@lists.linux.it>; Tue, 07 May 2019 01:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEz5+7kCMziOqOohng1ePtw9wdLLUyGOjaIvy3P3cyM=;
 b=aVchiDSMp+VNJ3FE6wX93yPDV7x9JjxlvX51VpV4dzw/UL4hTDwpz4oTwDulvI1xuO
 /+6Zjp5r+Z3k3Nf4HPVobNdSKSy2/XuA8Pf31GyxlWRSueTcO9c1APVjlmDoiAYwoyjk
 WX3eXADefZov3y1T0qy9jtIwXzuDY+PkjPQsJpe/axTlqafVddL5hp1VbGmIA9pOw3yL
 zmEkrtiEfdJ9uKq9DX/1ERigEyLxlrcEdBO/ZrIXj9N+GS+j22f0FP74aphyXl3yrtkl
 dNGoheM+g65mvbtBJlOc/6ztctDEMI3FDM9YZ9Ycl5MtNvvh0CIm1qmBl06/uhBW0M6+
 W4qw==
X-Gm-Message-State: APjAAAVIlgMHwuSKAe5ZF92DMnwGziKKyOjyIfrZQwKP2Itn3HvjFqhN
 h3Yp0JLiwxPQcBjCqtKZWEVwXNhqDG/tk/VoFUNK3A==
X-Google-Smtp-Source: APXvYqxQhUfmrCdtpZ7misiQZAr4g9+hd9SfMkclH6GQ7/BK5kwpAjEq+WmErP3f9kr0oGSmfvYHr/64hg4gMW+nR6k=
X-Received: by 2002:a9f:3233:: with SMTP id x48mr15466830uad.89.1557216471858; 
 Tue, 07 May 2019 01:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190507065530.12174-1-camann@suse.com>
In-Reply-To: <20190507065530.12174-1-camann@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 May 2019 16:07:40 +0800
Message-ID: <CAEemH2e=9J_7OtSsS5wq+4YgfOm1zj=PK5cnaBk69LKtdR71ZA@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1] crypto/af_alg02: fixed read() being stuck
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0657117728=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0657117728==
Content-Type: multipart/alternative; boundary="000000000000a4e996058847b6a7"

--000000000000a4e996058847b6a7
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Tue, May 7, 2019 at 2:56 PM Christian Amann <camann@suse.com> wrote:

> On kernels < 4.14 (missing commit 2d97591ef43d) reading from
> the request socket does not return and the testcase does not
> finish.
>
> This fix moves the logic to a child thread in order for the
> parent to handle the timeout and report a message to the user.
>
> Signed-off-by: Christian Amann <camann@suse.com>
> ---
>  testcases/kernel/crypto/Makefile   |  2 ++
>  testcases/kernel/crypto/af_alg02.c | 36
> +++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/crypto/Makefile
> b/testcases/kernel/crypto/Makefile
> index 76f9308c2..6547e1cb6 100644
> --- a/testcases/kernel/crypto/Makefile
> +++ b/testcases/kernel/crypto/Makefile
> @@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/testcases.mk
>  CFLAGS                 += -D_GNU_SOURCE
>
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +
> +af_alg02: CFLAGS += -pthread
> diff --git a/testcases/kernel/crypto/af_alg02.c
> b/testcases/kernel/crypto/af_alg02.c
> index a9e820423..056511993 100644
> --- a/testcases/kernel/crypto/af_alg02.c
> +++ b/testcases/kernel/crypto/af_alg02.c
> @@ -7,12 +7,23 @@
>   * Regression test for commit ecaaab564978 ("crypto: salsa20 - fix
>   * blkcipher_walk API usage"), or CVE-2017-17805.  This test verifies
> that an
>   * empty message can be encrypted with Salsa20 without crashing the
> kernel.
> + *
> + * read() fix:
> + * Calls read() in child thread in order to manually kill it after
> timeout.
> + * With kernels missing commit 2d97591ef43d ("crypto: af_alg -
> consolidation
> + * of duplicate code") read() does not return.
>   */
>
>  #include "tst_test.h"
>  #include "tst_af_alg.h"
> +#include "tst_safe_pthread.h"
> +#include <pthread.h>
> +#include <time.h>
> +#include <errno.h>
>
> -static void run(void)
> +#define VERIFY_TIMEOUT (time(NULL) + 5)
>

It is very neccessary to take some action before process being killed in
timeout. In LTP, we have an tst_timeout_remaining() function. Have a look?

> +
> +void *verify_encrypt(void *arg)
>  {
>         char buf[16];
>         int reqfd = tst_alg_setup_reqfd("skcipher", "salsa20", NULL, 16);
> @@ -22,6 +33,29 @@ static void run(void)
>                 tst_res(TPASS, "Successfully \"encrypted\" an empty
> message");
>         else
>                 tst_res(TBROK, "read() didn't return 0");
> +       return arg;
> +}
> +
> +static void run(void)
> +{
> +       pthread_t thr;
> +       int join_ret;
> +       struct timespec read_timeout;
> +
> +       read_timeout.tv_sec  = VERIFY_TIMEOUT;
> +       read_timeout.tv_nsec = 0;
> +
> +       SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);
> +       join_ret = pthread_timedjoin_np(thr, NULL, &read_timeout);
> +
> +       if (join_ret != 0) {
> +               if (join_ret == ETIMEDOUT)
> +                       tst_brk(TBROK,
> +                               "Timed out while reading from request
> socket.");
> +               else
> +                       tst_brk(TBROK | TTERRNO,
> +                               "Error while joining child thread");
> +       }
>  }
>
>  static struct tst_test test = {
> --
> 2.16.4
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000a4e996058847b6a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Hi=C2=A0Christian,</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, May 7, 2019 at 2:56 PM Christian Amann &lt;<a href=3D"mailto:camann@su=
se.com">camann@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On kernels &lt; 4.14 (missing commit 2d97591ef43d) r=
eading from<br>
the request socket does not return and the testcase does not<br>
finish.<br>
<br>
This fix moves the logic to a child thread in order for the<br>
parent to handle the timeout and report a message to the user.<br>
<br>
Signed-off-by: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" targe=
t=3D"_blank">camann@suse.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/crypto/Makefile=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0testcases/kernel/crypto/af_alg02.c | 36 +++++++++++++++++++++++++++++=
++++++-<br>
=C2=A02 files changed, 37 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/crypto/Makefile b/testcases/kernel/crypto/Mak=
efile<br>
index 76f9308c2..6547e1cb6 100644<br>
--- a/testcases/kernel/crypto/Makefile<br>
+++ b/testcases/kernel/crypto/Makefile<br>
@@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/<a href=3D"http://testca=
ses.mk" rel=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
=C2=A0CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D -D_GNU_SOURCE<br>
<br>
=C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+<br>
+af_alg02: CFLAGS +=3D -pthread<br>
diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/crypto/a=
f_alg02.c<br>
index a9e820423..056511993 100644<br>
--- a/testcases/kernel/crypto/af_alg02.c<br>
+++ b/testcases/kernel/crypto/af_alg02.c<br>
@@ -7,12 +7,23 @@<br>
=C2=A0 * Regression test for commit ecaaab564978 (&quot;crypto: salsa20 - f=
ix<br>
=C2=A0 * blkcipher_walk API usage&quot;), or CVE-2017-17805.=C2=A0 This tes=
t verifies that an<br>
=C2=A0 * empty message can be encrypted with Salsa20 without crashing the k=
ernel.<br>
+ *<br>
+ * read() fix:<br>
+ * Calls read() in child thread in order to manually kill it after timeout=
.<br>
+ * With kernels missing commit 2d97591ef43d (&quot;crypto: af_alg - consol=
idation<br>
+ * of duplicate code&quot;) read() does not return.<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_af_alg.h&quot;<br>
+#include &quot;tst_safe_pthread.h&quot;<br>
+#include &lt;pthread.h&gt;<br>
+#include &lt;time.h&gt;<br>
+#include &lt;errno.h&gt;<br>
<br>
-static void run(void)<br>
+#define VERIFY_TIMEOUT (time(NULL) + 5)<br></blockquote><div><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">It is very neccessary t=
o take some action before process being killed in timeout. In LTP, we have =
an tst_timeout_remaining() function. Have a look?</div><div class=3D"gmail_=
default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
+void *verify_encrypt(void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[16];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int reqfd =3D tst_alg_setup_reqfd(&quot;skciphe=
r&quot;, &quot;salsa20&quot;, NULL, 16);<br>
@@ -22,6 +33,29 @@ static void run(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quo=
t;Successfully \&quot;encrypted\&quot; an empty message&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TBROK, &quo=
t;read() didn&#39;t return 0&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return arg;<br>
+}<br>
+<br>
+static void run(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_t thr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int join_ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec read_timeout;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0read_timeout.tv_sec=C2=A0 =3D VERIFY_TIMEOUT;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0read_timeout.tv_nsec =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;thr, NULL, verify_encr=
ypt, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0join_ret =3D pthread_timedjoin_np(thr, NULL, &a=
mp;read_timeout);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (join_ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (join_ret =3D=3D=
 ETIMEDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Timed out while reading from re=
quest socket.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK | TTERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error while joining child threa=
d&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
-- <br>
2.16.4<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div></div></div>

--000000000000a4e996058847b6a7--

--===============0657117728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0657117728==--
