Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFD43242
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 04:51:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D15963EAE21
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 04:51:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C8CE63EA6D9
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 04:51:51 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0CF416010F0
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 04:51:52 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id r7so6752267ual.2
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 19:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaVpi48RCOTPkKTvURtVlIF+ce6crXW3K66Oz+7bHuM=;
 b=Gq/T5h6gH+jjhkYkLYmk3f87YQGsV/QQQGxSx4p7yZ0ewfnVKmoKNzXdReHvZR0Q6g
 zSj7dOhmiPc+N2AwdXndVedD5JMSDtuwX/FCGAjBsnlO7pHI+U6v7yZqMdU8FA3+7Zln
 uF36zDGcYzAwhFtMB98HNIH+JUXWjWBxGWCo3afzzc85L3CX4gxEahOSjEYBDoeOwcN+
 V3wswz2YE6/z74+zWwQwZn9bk+AB5CDkUTV4bpqEy3kmZ1KsXC/TMMyeoKPdIj0ursrZ
 tK7c4edqk5KLdpOEMkSBl8MHoOsWsR1cc2Mrv4mk0Zxzsq9zuen/xU9U7Sdt30iUsTBD
 yLxg==
X-Gm-Message-State: APjAAAVlhB85C9lSZGhNRugqUpAIBKQwqPE4Mljhhtq4aaN4bzWjrYup
 nQFHlhqO2+mgiRJHFUOLn3vvL7HoKRDOa7wjlKoDw6bqoVDxUw==
X-Google-Smtp-Source: APXvYqx5LHvCyOUnG3kCjp0mQ5bpwZk9K9Hc1SXZDky7P6VSRrlJ2b65KmxDW4C0j1E6Pp9kNFL95Q7APeajguIDtms=
X-Received: by 2002:a9f:2e0e:: with SMTP id t14mr3507020uaj.119.1560394308224; 
 Wed, 12 Jun 2019 19:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190608054550.13744-1-liwang@redhat.com>
 <20190612154855.GA4223@rei>
In-Reply-To: <20190612154855.GA4223@rei>
From: Li Wang <liwang@redhat.com>
Date: Thu, 13 Jun 2019 10:51:36 +0800
Message-ID: <CAEemH2cmBAG1chpYLxN49EYuG9sAehPcgUgHPSa2cxNaEPZW3w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH RFC 1/3] lib: adding tst_on_arch function in
	library
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
Content-Type: multipart/mixed; boundary="===============0835313917=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0835313917==
Content-Type: multipart/alternative; boundary="00000000000073c870058b2b9c6b"

--00000000000073c870058b2b9c6b
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 12, 2019 at 11:49 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Testcases for specified arch should be limited on that only being
> supported
> > platform to run, we now create a function tst_on_arch to achieve this new
> > feature in LTP library.  All you need to run a test on the expected arch
> is
> > to set the '.arch' string in the 'struct tst_test' to choose the required
> > arch list. e.g. '.arch = "x86_64, i386"'.
>
> There is no point in adding the coma between the architectures, i.e.
> this should be just .arch = "x86_64 i386".
>

Agree.


>
> > For more complicated usages such as customize your test code for a
> special
> > arch, the tst_on_arch function could be invoked in the test directly.
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  doc/test-writing-guidelines.txt | 54 +++++++++++++++++++++++++
> >  include/tst_arch.h              | 16 ++++++++
> >  include/tst_test.h              |  7 +++-
> >  lib/tst_arch.c                  | 71 +++++++++++++++++++++++++++++++++
> >  4 files changed, 147 insertions(+), 1 deletion(-)
> >  create mode 100644 include/tst_arch.h
> >  create mode 100644 lib/tst_arch.c
> >
> > diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> > index f1912dc12..10442d756 100644
> > --- a/doc/test-writing-guidelines.txt
> > +++ b/doc/test-writing-guidelines.txt
> > @@ -1668,6 +1668,60 @@ sturct tst_test test = {
> >  };
> >
> -------------------------------------------------------------------------------
> >
> > +2.2.30 Testing on specified architecture
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Testcases for specified arch should be limited on that only being
> supported
> > +platform to run, we now create a function tst_on_arch to achieve this
> new
> > +feature in LTP library.  All you need to run a test on the expected
> arch is
> > +to set the '.arch' string in the 'struct tst_test' to choose the
> required
> > +arch list. e.g. '.arch = "x86_64, i386"'.
> > +
> > +[source,c]
> >
> +-------------------------------------------------------------------------------
> > +#include "tst_test.h"
> > +
> > +static void setup(void)
> > +{
> > +     ...
> > +}
> > +
> > +static struct tst_test test = {
> > +     ...
> > +     .setup = setup,
> > +     .arch = "x86_64, i386",
> > +     ...
> > +}
> >
> +-------------------------------------------------------------------------------
> > +
> > +For more complicated usages such as customize your test code for a
> special
> > +arch, the tst_on_arch function could be invoked in the test directly.
> > +
> > +[source,c]
> >
> +-------------------------------------------------------------------------------
> > +#include "tst_test.h"
> > +
> > +static void do_test(void)
> > +{
> > +     if (tst_on_arch("x86_64, i386")) {
> > +             /* code for x86_64, i386 */
> > +             ...
> > +     } else if (tst_on_arch("ppc64")) {
> > +             /* code for ppc64 */
> > +             ...
> > +     } else if (tst_on_arch("s390, s390x")) {
> > +             /* code for s390x */
> > +             ...
> > +     }
>
> What is the point of the runtime detection here?
>
> It's not like we can run s390x binary on i386, i.e. we know for which
> architecture we are compiling for at the compile time.
>

You are right. But we still have some chance to do analysis at runtime, if
you take a look at patch 2/3, e.g. to parse '/proc/<pid>/maps'
in max_map_count.c can be done at runtime detection. That's what I thought
we can export the tst_on_arch() as a global function.


>
> > +}
> > +
> > +static struct tst_test test = {
> > +     ...
> > +     .test_all = do_test,
> > +     ...
> > +}
> >
> +-------------------------------------------------------------------------------
> > +
> >
> >  2.3 Writing a testcase in shell
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > diff --git a/include/tst_arch.h b/include/tst_arch.h
> > new file mode 100644
> > index 000000000..7bf0493ce
> > --- /dev/null
> > +++ b/include/tst_arch.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + * Copyright (c) 2019 Li Wang <liwang@redhat.com>
> > + */
> > +
> > +#ifndef TST_ARCH_H__
> > +#define TST_ARCH_H__
> > +
> > +/*
> > + * Check if test platform is in the given arch list. If yes return 1,
> > + * otherwise return 0.
> > + *
> > + * @arch, NULL or vliad arch list
> > + */
> > +int tst_on_arch(const char *arch);
> > +
> > +#endif /* TST_ARCH_H__ */
> > diff --git a/include/tst_test.h b/include/tst_test.h
> > index 8bdf38482..cafcb1a89 100644
> > --- a/include/tst_test.h
> > +++ b/include/tst_test.h
> > @@ -28,6 +28,7 @@
> >  #include "tst_atomic.h"
> >  #include "tst_kvercmp.h"
> >  #include "tst_clone.h"
> > +#include "tst_arch.h"
> >  #include "tst_kernel.h"
> >  #include "tst_minmax.h"
> >  #include "tst_get_bad_addr.h"
> > @@ -114,6 +115,8 @@ struct tst_test {
> >
> >       const char *min_kver;
> >
> > +     const char *arch;
> > +
> >       /* If set the test is compiled out */
> >       const char *tconf_msg;
> >
> > @@ -253,7 +256,6 @@ const char *tst_strstatus(int status);
> >  unsigned int tst_timeout_remaining(void);
> >  void tst_set_timeout(int timeout);
> >
> > -
> >  /*
> >   * Returns path to the test temporary directory in a newly allocated
> buffer.
> >   */
> > @@ -265,6 +267,9 @@ static struct tst_test test;
> >
> >  int main(int argc, char *argv[])
> >  {
> > +     if (!tst_on_arch(test.arch))
> > +             tst_brk(TCONF, "Test needs running on %s arch!",
> test.arch);
> > +
> >       tst_run_tcases(argc, argv, &test);
> >  }
>
> This may be a bit cleaner that compiling the test out, but will not save
> us from arch specific ifdefs completely so I'm not sure it's worth the
> trouble.
>

Indeed, I also realized that after signing off this patch, we can't replace
ifdefs completely via a simple function, since it occurring in the
compiling early phase. But anyway I roll out this for comments in case we
could find an improved way to do better.


>
> > diff --git a/lib/tst_arch.c b/lib/tst_arch.c
> > new file mode 100644
> > index 000000000..a9f2775b4
> > --- /dev/null
> > +++ b/lib/tst_arch.c
> > @@ -0,0 +1,71 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + * Copyright (c) 2019 Li Wang <liwang@redhat.com>
> > + */
> > +
> > +#include <string.h>
> > +
> > +#define TST_NO_DEFAULT_MAIN
> > +#include "tst_arch.h"
> > +#include "tst_test.h"
> > +
> > +static const char *const arch_type_list[] = {
> > +     "i386",
> > +     "x86",
> > +     "x86_64",
> > +     "ia64",
> > +     "ppc",
> > +     "ppc64",
> > +     "s390",
> > +     "s390x",
> > +     "arm",
> > +     "aarch64",
> > +     "sparc",
> > +     NULL
> > +};
> > +
> > +static int is_valid_arch(const char *arch)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i = 0; arch_type_list[i]; i++) {
> > +             if (strstr(arch, arch_type_list[i]))
> > +                     return 1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +int tst_on_arch(const char *arch)
> > +{
> > +#if defined(__i386__)
> > +     char *tst_arch = "i386";
> > +#elif defined(__x86__)
> > +     char *tst_arch = "x86";
> > +#elif defined(__x86_64__)
> > +     char *tst_arch = "x86_64";
> > +#elif defined(__ia64__)
> > +     char *tst_arch = "ia64";
> > +#elif defined(__powerpc__)
> > +     char *tst_arch = "ppc";
> > +#elif defined(__powerpc64__)
> > +     char *tst_arch = "ppc64";
> > +#elif defined(__s390__)
> > +     char *tst_arch = "s390";
> > +#elif defined(__s390x__)
> > +     char *tst_arch = "s390x";
> > +#elif defined(__arm__)
> > +     char *tst_arch = "arm";
> > +#elif defined(__arch64__)
> > +     char *tst_arch = "aarch64";
> > +#elif defined(__sparc__)
> > +     char *tst_arch = "sparc";
> > +#endif
> > +
> > +     if (arch != NULL && !is_valid_arch(arch))
> > +             tst_brk(TBROK, "please set valid arches!");
> > +
> > +     if (arch == NULL || strstr(arch, tst_arch))
> > +             return 1;
>
> Isn't using strstr() completely broken here?
>
> Couple of the architecture names are prefixes of the 64bit variant, also
> validating the architecture by strstr() is kind of pointless, it will
> match any garbage that contains one of the substrings.
>

Yes, that's true.


>
> If nothing else we should strdup() the string and then loop over strtok().
>

Good suggestion!


>
> > +     return 0;
> > +}
> > --
> > 2.17.0
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>


-- 
Regards,
Li Wang

--00000000000073c870058b2b9c6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 12, 2019 at 11:49 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Testcases for specified arch should be limited on that only being supp=
orted<br>
&gt; platform to run, we now create a function tst_on_arch to achieve this =
new<br>
&gt; feature in LTP library.=C2=A0 All you need to run a test on the expect=
ed arch is<br>
&gt; to set the &#39;.arch&#39; string in the &#39;struct tst_test&#39; to =
choose the required<br>
&gt; arch list. e.g. &#39;.arch =3D &quot;x86_64, i386&quot;&#39;.<br>
<br>
There is no point in adding the coma between the architectures, i.e.<br>
this should be just .arch =3D &quot;x86_64 i386&quot;.<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Agre=
e.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; For more complicated usages such as customize your test code for a spe=
cial<br>
&gt; arch, the tst_on_arch function could be invoked in the test directly.<=
br>
&gt; <br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 doc/test-writing-guidelines.txt | 54 +++++++++++++++++++++++++<b=
r>
&gt;=C2=A0 include/tst_arch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 ++++++++<br>
&gt;=C2=A0 include/tst_test.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 +++-<br>
&gt;=C2=A0 lib/tst_arch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 71 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 147 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 include/tst_arch.h<br>
&gt;=C2=A0 create mode 100644 lib/tst_arch.c<br>
&gt; <br>
&gt; diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidel=
ines.txt<br>
&gt; index f1912dc12..10442d756 100644<br>
&gt; --- a/doc/test-writing-guidelines.txt<br>
&gt; +++ b/doc/test-writing-guidelines.txt<br>
&gt; @@ -1668,6 +1668,60 @@ sturct tst_test test =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 ----------------------------------------------------------------=
---------------<br>
&gt;=C2=A0 <br>
&gt; +2.2.30 Testing on specified architecture<br>
&gt; +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; +<br>
&gt; +Testcases for specified arch should be limited on that only being sup=
ported<br>
&gt; +platform to run, we now create a function tst_on_arch to achieve this=
 new<br>
&gt; +feature in LTP library.=C2=A0 All you need to run a test on the expec=
ted arch is<br>
&gt; +to set the &#39;.arch&#39; string in the &#39;struct tst_test&#39; to=
 choose the required<br>
&gt; +arch list. e.g. &#39;.arch =3D &quot;x86_64, i386&quot;&#39;.<br>
&gt; +<br>
&gt; +[source,c]<br>
&gt; +---------------------------------------------------------------------=
----------<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.arch =3D &quot;x86_64, i386&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +}<br>
&gt; +---------------------------------------------------------------------=
----------<br>
&gt; +<br>
&gt; +For more complicated usages such as customize your test code for a sp=
ecial<br>
&gt; +arch, the tst_on_arch function could be invoked in the test directly.=
<br>
&gt; +<br>
&gt; +[source,c]<br>
&gt; +---------------------------------------------------------------------=
----------<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +<br>
&gt; +static void do_test(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_on_arch(&quot;x86_64, i386&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code for x86_64, i=
386 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (tst_on_arch(&quot;ppc64&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code for ppc64 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (tst_on_arch(&quot;s390, s390x&quot;)) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code for s390x */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
What is the point of the runtime detection here?<br>
<br>
It&#39;s not like we can run s390x binary on i386, i.e. we know for which<b=
r>
architecture we are compiling for at the compile time.<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">You =
are right. But we still have some chance to do analysis at runtime, if you =
take a look at patch 2/3, e.g. to parse &#39;/proc/&lt;pid&gt;/maps&#39; in=
=C2=A0max_map_count.c can be done at runtime detection. That&#39;s what I t=
hought we can export the tst_on_arch() as a global function.=C2=A0</div></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_all =3D do_test,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +}<br>
&gt; +---------------------------------------------------------------------=
----------<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 2.3 Writing a testcase in shell<br>
&gt;=C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; diff --git a/include/tst_arch.h b/include/tst_arch.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7bf0493ce<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/tst_arch.h<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; + * Copyright (c) 2019 Li Wang &lt;<a href=3D"mailto:liwang@redhat.com=
" target=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef TST_ARCH_H__<br>
&gt; +#define TST_ARCH_H__<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Check if test platform is in the given arch list. If yes return 1,=
<br>
&gt; + * otherwise return 0.<br>
&gt; + *<br>
&gt; + * @arch, NULL or vliad arch list<br>
&gt; + */<br>
&gt; +int tst_on_arch(const char *arch);<br>
&gt; +<br>
&gt; +#endif /* TST_ARCH_H__ */<br>
&gt; diff --git a/include/tst_test.h b/include/tst_test.h<br>
&gt; index 8bdf38482..cafcb1a89 100644<br>
&gt; --- a/include/tst_test.h<br>
&gt; +++ b/include/tst_test.h<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 #include &quot;tst_atomic.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_kvercmp.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_clone.h&quot;<br>
&gt; +#include &quot;tst_arch.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_kernel.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_minmax.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_get_bad_addr.h&quot;<br>
&gt; @@ -114,6 +115,8 @@ struct tst_test {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *min_kver;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *arch;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If set the test is compiled out */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *tconf_msg;<br>
&gt;=C2=A0 <br>
&gt; @@ -253,7 +256,6 @@ const char *tst_strstatus(int status);<br>
&gt;=C2=A0 unsigned int tst_timeout_remaining(void);<br>
&gt;=C2=A0 void tst_set_timeout(int timeout);<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Returns path to the test temporary directory in a newly =
allocated buffer.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; @@ -265,6 +267,9 @@ static struct tst_test test;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int main(int argc, char *argv[])<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!tst_on_arch(test.arch))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;=
Test needs running on %s arch!&quot;, test.arch);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_run_tcases(argc, argv, &amp;test);<br>
&gt;=C2=A0 }<br>
<br>
This may be a bit cleaner that compiling the test out, but will not save<br=
>
us from arch specific ifdefs completely so I&#39;m not sure it&#39;s worth =
the<br>
trouble.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Indeed, I also realized that after signing off thi=
s patch, we can&#39;t replace ifdefs completely via a simple function, sinc=
e it occurring in the compiling early phase. But anyway I roll out this for=
 comments in case we could find an improved way to do better.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">=C2=A0</div></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/lib/tst_arch.c b/lib/tst_arch.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a9f2775b4<br>
&gt; --- /dev/null<br>
&gt; +++ b/lib/tst_arch.c<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; + * Copyright (c) 2019 Li Wang &lt;<a href=3D"mailto:liwang@redhat.com=
" target=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +<br>
&gt; +#define TST_NO_DEFAULT_MAIN<br>
&gt; +#include &quot;tst_arch.h&quot;<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +<br>
&gt; +static const char *const arch_type_list[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;i386&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;x86&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;x86_64&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;ia64&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;ppc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;ppc64&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;s390&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;s390x&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;arm&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;aarch64&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sparc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int is_valid_arch(const char *arch)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; arch_type_list[i]; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(arch, arch=
_type_list[i]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int tst_on_arch(const char *arch)<br>
&gt; +{<br>
&gt; +#if defined(__i386__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;i386&quot;;<br>
&gt; +#elif defined(__x86__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;x86&quot;;<br>
&gt; +#elif defined(__x86_64__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;x86_64&quot;;<br>
&gt; +#elif defined(__ia64__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;ia64&quot;;<br>
&gt; +#elif defined(__powerpc__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;ppc&quot;;<br>
&gt; +#elif defined(__powerpc64__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;ppc64&quot;;<br>
&gt; +#elif defined(__s390__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;s390&quot;;<br>
&gt; +#elif defined(__s390x__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;s390x&quot;;<br>
&gt; +#elif defined(__arm__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;arm&quot;;<br>
&gt; +#elif defined(__arch64__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;aarch64&quot;;<br>
&gt; +#elif defined(__sparc__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *tst_arch =3D &quot;sparc&quot;;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (arch !=3D NULL &amp;&amp; !is_valid_arch(arch=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
please set valid arches!&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (arch =3D=3D NULL || strstr(arch, tst_arch))<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
<br>
Isn&#39;t using strstr() completely broken here?<br>
<br>
Couple of the architecture names are prefixes of the 64bit variant, also<br=
>
validating the architecture by strstr() is kind of pointless, it will<br>
match any garbage that contains one of the substrings.<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes,=
 that&#39;s true.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
If nothing else we should strdup() the string and then loop over strtok().<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Good suggestion!</div></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; -- <br>
&gt; 2.17.0<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=
=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><b=
r>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000073c870058b2b9c6b--

--===============0835313917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0835313917==--
