Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED16D30D7A
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 13:47:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 787723EA313
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 13:47:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3A3B23EA19D
 for <ltp@lists.linux.it>; Fri, 31 May 2019 13:47:40 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 35A05600997
 for <ltp@lists.linux.it>; Fri, 31 May 2019 13:47:39 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id y6so6511156vsb.0
 for <ltp@lists.linux.it>; Fri, 31 May 2019 04:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TF2jJC3NCkoFn34So0KvL9PeFOpHveRXpovmJo4dJU=;
 b=ECYtATe0S2aCBclRkdMV3OTBs41EZldNcIx7J0mF7vGd5P7NZaVvxvbkdPVh8/u1ZR
 aEDIuzOTm1mdVNkiwweoJ7mV50LuOSBet0uG9VlXnAXus3EpCbOLLdM5koxV9VysPcmm
 jUrHLx5itYAtcWZkaVTYSetBNkAQ9kcGzxNY/EdUC9lZ+RRHsDhRdnNsRCG3Oowh5IOy
 eN7PpoTilWX52k2JyZnuZFbsUx52q9KapN3ZvRnW1VJcvczS8JekcjtHxd6fjLzNKsY+
 OApoOF54baWmLc13dZMgOQzPE8xQg/DcTSABY36Pymv8A33hpYC9CTH0GWF0MdBml5eS
 XHzw==
X-Gm-Message-State: APjAAAUgAbaTdMfpq2ZholgyTFdPqeL5gocj08s9rlkwrO3s0kD+delE
 tAdztvMmHI5D+sVK/e3zOYHP6l+1TSZvjTZuPqZxAA==
X-Google-Smtp-Source: APXvYqzUlKm1xG7NZ2e4vPnvutE+zXOtUTPsXF6sOGQ2KcOWdPGKq875mJEar5NBdDbE/oyE8o/PQoXQQ9GBvhmX3xE=
X-Received: by 2002:a67:ed83:: with SMTP id d3mr4690606vsp.58.1559303256249;
 Fri, 31 May 2019 04:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190531110122.GA8819@rei.lan>
In-Reply-To: <20190531110122.GA8819@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 19:47:24 +0800
Message-ID: <CAEemH2eU+xcrDuW5UV=VCWhmHqrtOTE3HV=1Dr8cU8FWsBfLnw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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
Content-Type: multipart/mixed; boundary="===============0910351552=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0910351552==
Content-Type: multipart/alternative; boundary="000000000000afb983058a2d945b"

--000000000000afb983058a2d945b
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 7:01 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > The patch as follows:
> > commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
> >
> > Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
> > ---
> >  .../syscalls/copy_file_range/copy_file_range02.c   | 33
> +++++++++++++++-------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git
> a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> > index 07c0207..9e6356c 100644
> > --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> > +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> > @@ -54,19 +54,32 @@ static void verify_copy_file_range(unsigned int n)
> >       TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> >                               0, CONTSIZE, tc->flags));
> >
> > -     if (TST_RET == -1) {
> > -             if (tc->exp_err == TST_ERR) {
> > +     if (TST_RET != -1) {
> > +             tst_res(TFAIL,
> > +                     "copy_file_range returned wrong value: %ld",
> TST_RET);
> > +             return;
> > +     }
> > +
> > +     if (tc->exp_err == TST_ERR) {
> > +             tst_res(TPASS | TTERRNO,
> > +                     "copy_file_range failed as expected");
> > +     } else {
> > +             /* copy_file_range() returned EISDIR when copyed contents
> to
> > +              * directory on new kernels, but on old kernels, it
> returned
> > +              * EBADF.
> > +              *
> > +              * the patch as follws:
> > +              * commit 11cbfb10775a ("vfs: deny copy_file_range() for
> non regular files")
> > +              */
> > +             if (tc->exp_err == EISDIR && TST_ERR == EBADF) {
> >                       tst_res(TPASS | TTERRNO,
> > -                                     "copy_file_range failed as
> expected");
>
> If nothing else this should be guarded by kernel version check because
> if new kernel starts to return EBADFD again, that would be regression.
>
> So we should check the kernel version in test setup and set a flag that
> would be checked here as well.
>

This is a good suggestion. Another point I can come up is, if an LTS Linux
distribution backports that commit 11cbfb10775a to their old kernel as
regression fix, then this flag will make no sense.

So, to strict we maybe need to regards the EISDIR as the only one legal
errno(copying content to dir) when  kernel >= 4.10(includes commit
11cbfb10775a).


>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000afb983058a2d945b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 31, 2019 at 7:01 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; The patch as follows:<br>
&gt; commit 11cbfb10775a (&quot;vfs: deny copy_file_range() for non regular=
 files&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Jinhui huang &lt;<a href=3D"mailto:huangjh.jy@cn.fujits=
u.com" target=3D"_blank">huangjh.jy@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range02.c=C2=A0 =C2=A0| 3=
3 +++++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 23 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range=
02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
&gt; index 07c0207..9e6356c 100644<br>
&gt; --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br=
>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br=
>
&gt; @@ -54,19 +54,32 @@ static void verify_copy_file_range(unsigned int n)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;=
copy_to_fd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, CONTSIZE, tc-&gt;flags));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =
=3D=3D TST_ERR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =3D=3D TST_ERR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS | TTERR=
NO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range failed as expected&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* copy_file_range() =
returned EISDIR when copyed contents to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * directory on new k=
ernels, but on old kernels, it returned<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * EBADF.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the patch as follw=
s:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * commit 11cbfb10775=
a (&quot;vfs: deny copy_file_range() for non regular files&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =
=3D=3D EISDIR &amp;&amp; TST_ERR =3D=3D EBADF) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tst_res(TPASS | TTERRNO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copy_f=
ile_range failed as expected&quot;);<br>
<br>
If nothing else this should be guarded by kernel version check because<br>
if new kernel starts to return EBADFD again, that would be regression.<br>
<br>
So we should check the kernel version in test setup and set a flag that<br>
would be checked here as well.<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">This is a good suggestion. A=
nother point I can come up is, if an LTS Linux distribution backports that =
commit 11cbfb10775a to their old kernel as regression fix, then this flag w=
ill make no sense.</div></div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
So, to strict we maybe need to regards the EISDIR as the only one legal err=
no(copying content to dir) when=C2=A0 kernel &gt;=3D 4.10(includes commit 1=
1cbfb10775a).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000afb983058a2d945b--

--===============0910351552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0910351552==--
