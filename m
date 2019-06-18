Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1963497E4
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 06:03:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82ACC3EB06D
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 06:03:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E903E3EA3C0
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 06:03:43 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 751B81A00805
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 06:03:35 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id s4so4487694uad.7
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 21:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeXLIGanDMcoByCC3dLzoRJov38Zyh0Z1Clxtqqmjr8=;
 b=pPOp8BgUb4LCoCxcllKMb8n0Bg/3WP8jN4l0662dLrsdVXvkzf2qXujd1Crg/1b1Ji
 anuhY69nWbb5i+nMx/hRVOV916V2WoKkmWphoSQigSYkdQxf0qJBXVddavVobDR1w7gs
 5g+Xq+yIlEi+v4pUjDJfs2EMwaLd2RVGMWJbxrRLCaBYTfU/EhJPD3cNEW14yc4+VzZS
 JuPaeMvCI2zFcPGf1X+BjtjJ4qxP/7nXqdHKdzS9GJlGuZyiaV+6YRP8LQ58mDLwK8Nv
 Gv4wcmWP5QNF3Kzyz13oje1zfnH37+FE0jn3sg0CrjFlKOISZAt6KfyzhmBHLGhfS1PY
 QyxQ==
X-Gm-Message-State: APjAAAVmjY5FOIGRQEQWy6oJEDSYPK5z1B6cj1JJxMr7kNqjin4eYWgm
 9TvkMEISbND/zt7dyyvM34RFzQ8Nzv0hcHEmHn2DUrPAugw=
X-Google-Smtp-Source: APXvYqymjUkU6MFOsIOKsmo4upzTYHPpIjzqjJkUY3b6ONL01hTd0eixKQY+A9/RgrnKdP10iCn55MS9bIV2Z01mgUE=
X-Received: by 2002:a67:ed83:: with SMTP id d3mr32313036vsp.58.1560830614100; 
 Mon, 17 Jun 2019 21:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190615042048.29839-3-liwang@redhat.com>
 <1243296203.28755912.1560807853881.JavaMail.zimbra@redhat.com>
In-Reply-To: <1243296203.28755912.1560807853881.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Jun 2019 12:03:23 +0800
Message-ID: <CAEemH2eCPtc6GrtAVHiHKbOeSMDgPunkBxg8YxaNOKYXLpT7yw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 3/3] testcase: get rid of compiling errors
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
Content-Type: multipart/mixed; boundary="===============0295161203=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0295161203==
Content-Type: multipart/alternative; boundary="0000000000004ef77d058b913259"

--0000000000004ef77d058b913259
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 5:44 AM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  configure.ac             | 1 +
> >  testcases/cve/meltdown.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/configure.ac b/configure.ac
> > index 5ecc92781..521f56541 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -58,6 +58,7 @@ AC_CHECK_HEADERS([ \
> >      sys/shm.h \
> >      sys/ustat.h \
> >      sys/xattr.h \
> > +    emmintrin.h \
> >  ])
> >
> >  AC_CHECK_FUNCS([ \
> > diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
> > index 72c9ec907..bc649b893 100644
> > --- a/testcases/cve/meltdown.c
> > +++ b/testcases/cve/meltdown.c
> > @@ -29,6 +29,7 @@
> >  #include <ctype.h>
> >  #include <sys/utsname.h>
> >
> > +#ifdef HAVE_EMMINTRIN_H
> >  #include <emmintrin.h>
> >
> >  #include "libtsc.h"
> > @@ -387,3 +388,7 @@ static struct tst_test test = {
> >       .cleanup = cleanup,
> >       .min_kver = "2.6.32"
> >  };
> > +
> > +#else /* HAVE_EMMINTRIN_H */
> > +     TST_TEST_TCONF("<emmintrin.h> is not supported");
> > +#endif
>
> This seems more complicated to me than original - extra autoconf check,
> extra ifdef.
>

Indeed.
I choose meltdown.c as a demo randomly, this patch is to solve the
compiling error after removing ifdef __arch__ from code. So, as you can see
the tst_test.arch is not perfect, but it could be used for some general
situations.


> I can see how tst_on_arch() would be useful. Test is valid on all arches,
> but needs different input/constants/code/etc.
>

That's the original reason I exported it in patch v1.

Cyril and I have discussed this part, we think tst_on_arch() is not cleaner
than ifdefs, so it's not suggested to use it directly in a test case.


>
> What is the motivation for tst_test.arch? Is it to have some annotation in
> tst_test struct?
>

The first motivation is to save LTP user from arch ifdefs, moves the
information from code to tst_test metadata, but seems that it can not be
completely replaced because of the specific assembly inline. So I still
hope to find a better way for that, even not go with this tst_test.arch.

-- 
Regards,
Li Wang

--0000000000004ef77d058b913259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 5:44 AM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
----- Original Message -----<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<=
br>
&gt;=C2=A0 testcases/cve/meltdown.c | 5 +++++<br>
&gt;=C2=A0 2 files changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; index 5ecc92781..521f56541 100644<br>
&gt; --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; @@ -58,6 +58,7 @@ AC_CHECK_HEADERS([ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sys/shm.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sys/ustat.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sys/xattr.h \<br>
&gt; +=C2=A0 =C2=A0 emmintrin.h \<br>
&gt;=C2=A0 ])<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 AC_CHECK_FUNCS([ \<br>
&gt; diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c<br>
&gt; index 72c9ec907..bc649b893 100644<br>
&gt; --- a/testcases/cve/meltdown.c<br>
&gt; +++ b/testcases/cve/meltdown.c<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 #include &lt;ctype.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/utsname.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#ifdef HAVE_EMMINTRIN_H<br>
&gt;=C2=A0 #include &lt;emmintrin.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;libtsc.h&quot;<br>
&gt; @@ -387,3 +388,7 @@ static struct tst_test test =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;2.6.32&quot;<br>
&gt;=C2=A0 };<br>
&gt; +<br>
&gt; +#else /* HAVE_EMMINTRIN_H */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TST_TEST_TCONF(&quot;&lt;emmintrin.h&gt; is not s=
upported&quot;);<br>
&gt; +#endif<br>
<br>
This seems more complicated to me than original - extra autoconf check, ext=
ra ifdef.<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Indeed.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I choose meltdown.c as a demo randomly, this patch is to solv=
e the compiling error after removing ifdef __arch__ from code. So, as you c=
an see the tst_test.arch is not perfect, but it could be used for some gene=
ral situations.<br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I can see how tst_on_arch() would be useful. Test is valid on all arches,<b=
r>
but needs different input/constants/code/etc.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">That&#39;s th=
e original reason I exported it in patch v1.</div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Cyril and I have discussed thi=
s part, we think tst_on_arch() is not cleaner than ifdefs, so it&#39;s not =
suggested to use it directly in a test case.</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
What is the motivation for tst_test.arch? Is it to have some annotation in =
tst_test struct?<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">The first motivation is to save LTP user=
=C2=A0from arch ifdefs, moves the information from code to tst_test metadat=
a, but seems that it can not be completely replaced=C2=A0because of the spe=
cific assembly inline. So I still hope to find a better way for that, even =
not go with this tst_test.arch.</div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"m_8=
83723045289643623gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><=
div>Li Wang<br></div></div></div></div>

--0000000000004ef77d058b913259--

--===============0295161203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0295161203==--
