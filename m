Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0E16416
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 14:57:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 323ED3EA373
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 14:57:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7BFED3EA16D
 for <ltp@lists.linux.it>; Tue,  7 May 2019 14:57:15 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D11E06023CE
 for <ltp@lists.linux.it>; Tue,  7 May 2019 14:57:13 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id s4so6112094vsl.2
 for <ltp@lists.linux.it>; Tue, 07 May 2019 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6HVDi9Oxxz7KLzwtEGZKOmYkmdsBYIqeqChz58ttY4=;
 b=Wb23gJY4l7XxIX+iPjv9ZZpKMstrHAg21OSUq4a4CVERi2xOUaL8hA5SQ9ezxx/QhF
 /QkwhSTVaY0DeA1wV9RERJuKElgbZn1d+gnD5zimNQswNuI+5P+lTEeE9scoCnSkqpCF
 CfC6hE58pzvLi0uP8hsGzHWHMLyUt1oMVWl4xPMwI53CZQvL5KI26O9VA+J8XYuIp53e
 rCCq7ElPC9XGnivld3Ylric6hJd9Y6vEyKlZd6mJ7rI4b1XR2jCOsgzUlRBXBNbdQwdw
 0FVnez3EW/adQQs1rPCfJhoKS/Fq3PtvM55zJYL3Ss+rWFgtz+uXJ8rqNUhKs5H6Qkii
 Nm+A==
X-Gm-Message-State: APjAAAXhKq1ot4dqIK/CJSW+hy5jQAEItxPiu3UIlsawlqM0E9Afmz2N
 dKtAAsLF/TTi7LHckKEoG68sX3/qcE/8dB+W5D2Sy41jvX6gfA==
X-Google-Smtp-Source: APXvYqxALtiQblhF+/ZU3Aikrt2Pq9f8hal4XNsj6+gCeKW5RaK3ziHhrVMh9bsxj8nVBJ7TQddnbUjIUXUeSetiLo8=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr16709894vso.130.1557233832502; 
 Tue, 07 May 2019 05:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190507113809.25890-1-camann@suse.com>
 <31080929-c700-812b-ccca-71cd35c676b4@suse.com>
In-Reply-To: <31080929-c700-812b-ccca-71cd35c676b4@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 May 2019 20:57:00 +0800
Message-ID: <CAEemH2fYbkoDYBF-JOxGiixJ_ZYSoUVT2weV++W5+SCnvM3fhg@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] crypto/af_alg02: fixed read() being stuck
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
Content-Type: multipart/mixed; boundary="===============1617863321=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1617863321==
Content-Type: multipart/alternative; boundary="0000000000006b425d05884bc1db"

--0000000000006b425d05884bc1db
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Tue, May 7, 2019 at 7:41 PM Christian Amann <camann@suse.com> wrote:

> @ Li Wang
>
> Okay, I think I understand it now. It looks much cleaner when done like
> you suggested. Thanks!
>

Thanks for your update, you could try add these additional info in patch
note  via `git note add` next time.
  # man git-notes


> Regards,
>
> Christian
>
>
> On 07/05/2019 13:38, Christian Amann wrote:
> > On kernels < 4.14 (missing commit 2d97591ef43d) reading from
> > the request socket does not return and the testcase does not
> > finish.
> >
> > This fix moves the logic to a child thread in order for the
> > parent to handle the timeout and report a message to the user.
> >
> > Signed-off-by: Christian Amann <camann@suse.com>
> > ---
> >  testcases/kernel/crypto/Makefile   |  2 ++
> >  testcases/kernel/crypto/af_alg02.c | 29 ++++++++++++++++++++++++++++-
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/testcases/kernel/crypto/Makefile
> b/testcases/kernel/crypto/Makefile
> > index 76f9308c2..6547e1cb6 100644
> > --- a/testcases/kernel/crypto/Makefile
> > +++ b/testcases/kernel/crypto/Makefile
> > @@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/testcases.mk
> >  CFLAGS                       += -D_GNU_SOURCE
> >
> >  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > +
> > +af_alg02: CFLAGS += -pthread
> > diff --git a/testcases/kernel/crypto/af_alg02.c
> b/testcases/kernel/crypto/af_alg02.c
> > index a9e820423..7f8c81b66 100644
> > --- a/testcases/kernel/crypto/af_alg02.c
> > +++ b/testcases/kernel/crypto/af_alg02.c
> > @@ -7,12 +7,20 @@
> >   * Regression test for commit ecaaab564978 ("crypto: salsa20 - fix
> >   * blkcipher_walk API usage"), or CVE-2017-17805.  This test verifies
> that an
> >   * empty message can be encrypted with Salsa20 without crashing the
> kernel.
> > + *
> > + * read() fix:
> > + * Calls read() in child thread in order to manually kill it after a
> timeout.
>

The comments should be updated too.

> > + * With kernels missing commit 2d97591ef43d ("crypto: af_alg -
> consolidation
> > + * of duplicate code") read() does not return.
> >   */
> >
> >  #include "tst_test.h"
> >  #include "tst_af_alg.h"
> > +#include "tst_safe_pthread.h"
> > +#include <pthread.h>
> > +#include <errno.h>
> >
> > -static void run(void)
> > +void *verify_encrypt(void *arg)
>

We could set LTP_ATTRIBUTE_UNUSED at the behind of unused parameter to get
rid of compiling warning:

void *verify_encrypt(void *arg LTP_ATTRIBUTE_UNUSED)

> >  {
> >       char buf[16];
>

TST_CHECKPOINT_WAKE(0);

> >       int reqfd = tst_alg_setup_reqfd("skcipher", "salsa20", NULL, 16);
> > @@ -22,8 +30,27 @@ static void run(void)
> >               tst_res(TPASS, "Successfully \"encrypted\" an empty
> message");
> >       else
> >               tst_res(TBROK, "read() didn't return 0");
>

Should use 'TFAIL' but 'TBROK' here.

See test-writing-guidelines.txt:

   406
-------------------------------------------------------------------------------
   407  void tst_res(int ttype, char *arg_fmt, ...);
   408
-------------------------------------------------------------------------------
   409
   410  Printf-like function to report test result, it's mostly used with
ttype:
   411
   412  |==============================
   413  | 'TPASS' | Test has passed.
   414  | 'TFAIL' | Test has failed.
   415  | 'TINFO' | General message.
   416  |==============================
...
   422
-------------------------------------------------------------------------------
   423  void tst_brk(int ttype, char *arg_fmt, ...);
   424
-------------------------------------------------------------------------------
   425
   426  Printf-like function to report error and exit the test, it can be
used with ttype:
   427
   428  |============================================================
   429  | 'TBROK' | Something has failed in test preparation phase.
   430  | 'TCONF' | Test is not appropriate for current configuration
   431              (syscall not implemented, unsupported arch, ...)
   432  |============================================================


> +     return arg;
> > +}
> > +
> > +static void run(void)
> > +{
> > +     pthread_t thr;
> > +
> > +     pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> > +     SAFE_PTHREAD_CREATE(&thr, NULL, verify_encrypt, NULL);
> > +
>

A checkpoint is neccessary here, because we'd better confirm the thread has
already running before check it by pthread_kill().
TST_CHECKPOINT_WAIT(0);


> > +     while (pthread_kill(thr, 0) != ESRCH) {
> > +             if (tst_timeout_remaining() <= 10) {
> > +                     pthread_cancel(thr);
> > +                     tst_brk(TBROK,
> > +                             "Timed out while reading from request
> socket.");
> > +             }
> > +             usleep(1000);
> > +     }
> >  }
> >
> >  static struct tst_test test = {
> >       .test_all = run,
> > +     .timeout = 20,
> >  };
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--0000000000006b425d05884bc1db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div class=3D"gmail_default" style=3D"font-size:small">Hi=C2=A0Christian=
,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, May 7, 2019 at 7:41 PM Christian Amann &lt;<a href=3D"mailto=
:camann@suse.com">camann@suse.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">@ Li Wang<br>
<br>
Okay, I think I understand it now. It looks much cleaner when done like<br>
you suggested. Thanks!<br></blockquote><div><br></div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Thanks for your update, you could try add=
 these additional info in patch note=C2=A0 via `git note add` next time.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 # man git-=
notes</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
<br>
Christian<br>
<br>
<br>
On 07/05/2019 13:38, Christian Amann wrote:<br>
&gt; On kernels &lt; 4.14 (missing commit 2d97591ef43d) reading from<br>
&gt; the request socket does not return and the testcase does not<br>
&gt; finish.<br>
&gt;<br>
&gt; This fix moves the logic to a child thread in order for the<br>
&gt; parent to handle the timeout and report a message to the user.<br>
&gt;<br>
&gt; Signed-off-by: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" =
target=3D"_blank">camann@suse.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 testcases/kernel/crypto/Makefile=C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 testcases/kernel/crypto/af_alg02.c | 29 ++++++++++++++++++++++++=
++++-<br>
&gt;=C2=A0 2 files changed, 30 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/testcases/kernel/crypto/Makefile b/testcases/kernel/crypt=
o/Makefile<br>
&gt; index 76f9308c2..6547e1cb6 100644<br>
&gt; --- a/testcases/kernel/crypto/Makefile<br>
&gt; +++ b/testcases/kernel/crypto/Makefile<br>
&gt; @@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/<a href=3D"http://t=
estcases.mk" rel=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt;=C2=A0 CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D -D_GNU_SOURCE<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_=
target.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><=
br>
&gt; +<br>
&gt; +af_alg02: CFLAGS +=3D -pthread<br>
&gt; diff --git a/testcases/kernel/crypto/af_alg02.c b/testcases/kernel/cry=
pto/af_alg02.c<br>
&gt; index a9e820423..7f8c81b66 100644<br>
&gt; --- a/testcases/kernel/crypto/af_alg02.c<br>
&gt; +++ b/testcases/kernel/crypto/af_alg02.c<br>
&gt; @@ -7,12 +7,20 @@<br>
&gt;=C2=A0 =C2=A0* Regression test for commit ecaaab564978 (&quot;crypto: s=
alsa20 - fix<br>
&gt;=C2=A0 =C2=A0* blkcipher_walk API usage&quot;), or CVE-2017-17805.=C2=
=A0 This test verifies that an<br>
&gt;=C2=A0 =C2=A0* empty message can be encrypted with Salsa20 without cras=
hing the kernel.<br>
&gt; + *<br>
&gt; + * read() fix:<br>
&gt; + * Calls read() in child thread in order to manually kill it after a =
timeout.<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">The comments should be updated too.</div><div class=3D=
"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; + * With kernels missing commit 2d97591ef43d (&quot;crypto: af_alg - c=
onsolidation<br>
&gt; + * of duplicate code&quot;) read() does not return.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_af_alg.h&quot;<br>
&gt; +#include &quot;tst_safe_pthread.h&quot;<br>
&gt; +#include &lt;pthread.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt;=C2=A0 <br>
&gt; -static void run(void)<br>
&gt; +<span class=3D"gmail_default" style=3D"font-size:small"></span>void *=
verify_encrypt(void *arg)<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">We could set=C2=A0<span class=3D"=
gmail_default"></span>LTP_ATTRIBUTE_UNUSED at the behind of unused paramete=
r to get rid of compiling warning:</div></div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">void *verify_encrypt(void *arg LTP_ATTRIBUTE_UNUSED)<br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[16];<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">TST_CHECKPOINT_WAKE=
(0);</div><div class=3D"gmail_default" style=3D"font-size:small"></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int reqfd =3D tst_alg_setup_reqfd(&quot;skci=
pher&quot;, &quot;salsa20&quot;, NULL, 16);<br>
&gt; @@ -22,8 +30,27 @@ static void run(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &=
quot;Successfully \&quot;encrypted\&quot; an empty message&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK, &=
quot;read() didn&#39;t return 0&quot;);<br></blockquote><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Should use &#39;TFAIL&#3=
9; but &#39;TBROK&#39; here.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">See=C2=A0test-writing-guidelines.txt:</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default"><d=
iv class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0406=C2=A0=
 --------------------------------------------------------------------------=
-----</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0407=C2=A0 void tst_res(int ttype, char *arg_fmt, ...);</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0408=C2=A0 ------=
-------------------------------------------------------------------------</=
div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0409=
=C2=A0=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0410=C2=A0 Printf-like function to report test result, it&#39;s=
 mostly used with ttype:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 =C2=A0411=C2=A0=C2=A0</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">=C2=A0 =C2=A0412=C2=A0 |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0413=C2=A0 | &=
#39;TPASS&#39; | Test has passed.</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0414=C2=A0 | &#39;TFAIL&#39; | Test has fa=
iled.</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0415=C2=A0 | &#39;TINFO&#39; | General message.</div><div class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0 =C2=A0416=C2=A0 |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div><div style=3D"font-size:small">...</div><div><div>=C2=A0 =C2=A0422=
=C2=A0 --------------------------------------------------------------------=
-----------</div><div>=C2=A0 =C2=A0423=C2=A0 void tst_brk(int ttype, char *=
arg_fmt, ...);</div><div>=C2=A0 =C2=A0424=C2=A0 ---------------------------=
----------------------------------------------------</div><div>=C2=A0 =C2=
=A0425=C2=A0=C2=A0</div><div>=C2=A0 =C2=A0426=C2=A0 Printf-like function to=
 report error and exit the test, it can be used with ttype:</div><div>=C2=
=A0 =C2=A0427=C2=A0=C2=A0</div><div>=C2=A0 =C2=A0428=C2=A0 |=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D</div><div>=C2=A0 =C2=A0429=C2=A0 | &#39;TBROK&#39; | Someth=
ing has failed in test preparation phase.</div><div>=C2=A0 =C2=A0430=C2=A0 =
| &#39;TCONF&#39; | Test is not appropriate for current configuration</div>=
<div>=C2=A0 =C2=A0431=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (sysc=
all not implemented, unsupported arch, ...)</div><div>=C2=A0 =C2=A0432=C2=
=A0 |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></div><div style=3D"font-size:sma=
ll"><br></div></div><div class=3D"gmail_default" style=3D"font-size:small">=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0return arg;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void run(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pthread_t thr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NUL=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&amp;thr, NULL, verify_encryp=
t, NULL);<br>
&gt; +<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">A checkpoint is neccessary here, because we&#39;d better =
confirm the thread has already running before check it by pthread_kill().</=
div><div class=3D"gmail_default" style=3D"font-size:small"></div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">TST_CHECKPOINT_WAIT(0);<=
/span></div><div><span class=3D"gmail_default" style=3D"font-size:small"></=
span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0while (pthread_kill(thr, 0) !=3D ESRCH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_timeout_remai=
ning() &lt;=3D 10) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pthread_cancel(thr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_brk(TBROK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Timed out while reading from reque=
st socket.&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct tst_test test =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.timeout =3D 20,<br>
&gt;=C2=A0 };<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div></div></div></div></div></div></div></div>

--0000000000006b425d05884bc1db--

--===============1617863321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1617863321==--
