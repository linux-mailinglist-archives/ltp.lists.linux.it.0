Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4D184AB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 07:00:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 368013EABCF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 07:00:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0E8ED3EA028
 for <ltp@lists.linux.it>; Thu,  9 May 2019 07:00:02 +0200 (CEST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5EAB91A0195B
 for <ltp@lists.linux.it>; Thu,  9 May 2019 06:59:59 +0200 (CEST)
Received: by mail-vk1-f176.google.com with SMTP id s80so275640vke.6
 for <ltp@lists.linux.it>; Wed, 08 May 2019 21:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r2Dv8woA0bU/DEUtFvE68x06CTgndEBixqQnLPZ7Czc=;
 b=E/NxI8wyMgKgdVyxzOb4xhk7rkmucxyDKKVPU135QC8EYi0mVIK7tKq0QX1HgqxmkR
 4+7VvaoQzfF6mdzkaEjaqVjrPmLLm67fXTVSmkiAnf7fSp9c6wNRmDCRFCFJYNrLYNrL
 hzsVFUsNR5EEXMF328f4aOIGIBKPWX1S1dftMXZI6OEO7Y+IOPlRrd+QxvGMNMRMoBRc
 TdrUpoFM2xIYcehQk1BE+vrR8JJu4oHjrdKDVWoWDl8B6KZ3jNpdflZGu6WDMWzJ0PgH
 gqJnpVyw1M8FosD29tspRRXHqiIhp0LbVlcFf4E2q1G0UXLpKEfwcs7bw2PdNXUObkZa
 0M7g==
X-Gm-Message-State: APjAAAX3X+XI3Ll8S4JcHAvkP+zMZQXf1BIgWorREyqXll0HILVPMls9
 Fl/4OIMIKD559tWTpKZPUefHZ4QGutg3RKOPtkgLOIrb/b0=
X-Google-Smtp-Source: APXvYqxBh1mkw3WF8OQu+L4ImYA5qw212S254KzEUlk1MiweHnTUHVlzsDcZJ5tmEExzORSVmcUTGQ0hDJlGtPhBV4w=
X-Received: by 2002:a1f:28d7:: with SMTP id o206mr575421vko.36.1557377998253; 
 Wed, 08 May 2019 21:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190508071636.13804-1-camann@suse.com>
In-Reply-To: <20190508071636.13804-1-camann@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 May 2019 12:59:46 +0800
Message-ID: <CAEemH2cSz+JTxy6mT7H0JYj+RsBbgAuFL-q7RY775n9oJQAwoQ@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] crypto/af_alg02: fixed read() being stuck
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
Content-Type: multipart/mixed; boundary="===============2010711681=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2010711681==
Content-Type: multipart/alternative; boundary="0000000000005e1c4205886d5214"

--0000000000005e1c4205886d5214
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 3:16 PM Christian Amann <camann@suse.com> wrote:

> On kernels < 4.14 (missing commit 2d97591ef43d) reading from
> the request socket does not return and the testcase does not
> finish.
>
> This fix moves the logic to a child thread in order for the
> parent to handle the timeout and report a message to the user.
>
> Signed-off-by: Christian Amann <camann@suse.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>

---
>
> Notes:
>     Hi Li,
>
>     > We could set LTP_ATTRIBUTE_UNUSED at the behind of unused parameter
> to get
>     > rid of compiling warning
>
>     Thats very useful but I couldn't find it anywhere in the documentation.
>     IMHO it should be put in there, because I stumbled upon this problem
>     a couple of times.
>

This is just a definition for variable attribute which supports by GNU
compiler, I'm not sure if we should add it to LTP documents.

$ grep LTP_ATTRIBUTE_UNUSED . -r
tst_common.h:25:#define LTP_ATTRIBUTE_UNUSED __attribute__((unused))


>
>     Anyway, I implemented your suggestions. I hope it's an alright patch
> now.
>     Thanks for your feedback!
>
>     Regards,
>     Christian
>
>  testcases/kernel/crypto/Makefile   |  2 ++
>  testcases/kernel/crypto/af_alg02.c | 37
> +++++++++++++++++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)
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
> index a9e820423..1c725212a 100644
> --- a/testcases/kernel/crypto/af_alg02.c
> +++ b/testcases/kernel/crypto/af_alg02.c
> @@ -7,23 +7,56 @@
>   * Regression test for commit ecaaab564978 ("crypto: salsa20 - fix
>   * blkcipher_walk API usage"), or CVE-2017-17805.  This test verifies
> that an
>   * empty message can be encrypted with Salsa20 without crashing the
> kernel.
> + *
> + * Fix for kernels < 4.14:
> + * With kernels missing commit 2d97591ef43d ("crypto: af_alg -
> consolidation
> + * of duplicate code") read() does not return in this situation. The call
> is
> + * now moved to a child thread in order to cancel it in case read() takes
> an
> + * unusual long amount of time.
>   */
>
>  #include "tst_test.h"
>  #include "tst_af_alg.h"
> +#include "tst_safe_pthread.h"
> +#include <pthread.h>
> +#include <errno.h>
>
> -static void run(void)
> +void *verify_encrypt(void *arg LTP_ATTRIBUTE_UNUSED)
>  {
>         char buf[16];
>         int reqfd = tst_alg_setup_reqfd("skcipher", "salsa20", NULL, 16);
>
> +       TST_CHECKPOINT_WAKE(0);
> +
>         /* With the bug the kernel crashed here */
>         if (read(reqfd, buf, 16) == 0)
>                 tst_res(TPASS, "Successfully \"encrypted\" an empty
> message");
>         else
> -               tst_res(TBROK, "read() didn't return 0");
> +               tst_res(TFAIL, "read() didn't return 0");
> +       return arg;
>

Since arg has been marked as unused, so here better to return NULL.

Anyway, patch V3 looks good to me.

-- 
Regards,
Li Wang

--0000000000005e1c4205886d5214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, May 8, 2019 at 3:16 PM Christian Amann &lt;<a h=
ref=3D"mailto:camann@suse.com" target=3D"_blank">camann@suse.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On kernels =
&lt; 4.14 (missing commit 2d97591ef43d) reading from<br>
the request socket does not return and the testcase does not<br>
finish.<br>
<br>
This fix moves the logic to a child thread in order for the<br>
parent to handle the timeout and report a message to the user.<br>
<br>
Signed-off-by: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" targe=
t=3D"_blank">camann@suse.com</a>&gt;<br></blockquote><div>Reviewed-by: Li W=
ang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redha=
t.com</a>&gt;<br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Notes:<br>
=C2=A0 =C2=A0 Hi Li,<br>
<br>
=C2=A0 =C2=A0 &gt; We could set LTP_ATTRIBUTE_UNUSED at the behind of unuse=
d parameter to get<br>
=C2=A0 =C2=A0 &gt; rid of compiling warning<br>
<br>
=C2=A0 =C2=A0 Thats very useful but I couldn&#39;t find it anywhere in the =
documentation.<br>
=C2=A0 =C2=A0 IMHO it should be put in there, because I stumbled upon this =
problem<br>
=C2=A0 =C2=A0 a couple of times.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default">This is just a definition for=C2=A0variable attribut=
e which supports by=C2=A0GNU compiler, I&#39;m=C2=A0not sure if we should a=
dd it to LTP documents.</div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">$ grep LTP_ATTRIBUTE_UNUSED . -r</div></div><div><d=
iv class=3D"gmail_default">tst_common.h:25:#define LTP_ATTRIBUTE_UNUSED<spa=
n style=3D"white-space:pre-wrap">		</span>__attribute__((unused))<br></div>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 Anyway, I implemented your suggestions. I hope it&#39;s an al=
right patch now.<br>
=C2=A0 =C2=A0 Thanks for your feedback!<br>
<br>
=C2=A0 =C2=A0 Regards,<br>
=C2=A0 =C2=A0 Christian<br>
<br>
=C2=A0testcases/kernel/crypto/Makefile=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0testcases/kernel/crypto/af_alg02.c | 37 +++++++++++++++++++++++++++++=
++++++--<br>
=C2=A02 files changed, 37 insertions(+), 2 deletions(-)<br>
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
index a9e820423..1c725212a 100644<br>
--- a/testcases/kernel/crypto/af_alg02.c<br>
+++ b/testcases/kernel/crypto/af_alg02.c<br>
@@ -7,23 +7,56 @@<br>
=C2=A0 * Regression test for commit ecaaab564978 (&quot;crypto: salsa20 - f=
ix<br>
=C2=A0 * blkcipher_walk API usage&quot;), or CVE-2017-17805.=C2=A0 This tes=
t verifies that an<br>
=C2=A0 * empty message can be encrypted with Salsa20 without crashing the k=
ernel.<br>
+ *<br>
+ * Fix for kernels &lt; 4.14:<br>
+ * With kernels missing commit 2d97591ef43d (&quot;crypto: af_alg - consol=
idation<br>
+ * of duplicate code&quot;) read() does not return in this situation. The =
call is<br>
+ * now moved to a child thread in order to cancel it in case read() takes =
an<br>
+ * unusual long amount of time.<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_af_alg.h&quot;<br>
+#include &quot;tst_safe_pthread.h&quot;<br>
+#include &lt;pthread.h&gt;<br>
+#include &lt;errno.h&gt;<br>
<br>
-static void run(void)<br>
+void *verify_encrypt(void *arg LTP_ATTRIBUTE_UNUSED)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[16];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int reqfd =3D tst_alg_setup_reqfd(&quot;skciphe=
r&quot;, &quot;salsa20&quot;, NULL, 16);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAKE(0);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* With the bug the kernel crashed here */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read(reqfd, buf, 16) =3D=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quo=
t;Successfully \&quot;encrypted\&quot; an empty message&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK, &quo=
t;read() didn&#39;t return 0&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;read() didn&#39;t return 0&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return arg;<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Since arg has been =
marked as unused, so here better to return NULL.</div></div><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Anyway, patch V=
3 looks good to me.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"lt=
r" class=3D"m_6104703560222033971gmail_signature"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div></div></div></div></=
div></div>

--0000000000005e1c4205886d5214--

--===============2010711681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============2010711681==--
