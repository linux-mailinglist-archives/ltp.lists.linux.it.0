Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB430DBE
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:03:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64DD039029C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:03:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1EA153EA02A
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:03:36 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2246F200226
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:03:35 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id x196so1433194vkd.9
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m74Yi/kotlGkI7ynJSQ90h/a0uX8WkfJsKoCEFL5Ifo=;
 b=M8hsj9kwCnaFxvga1F6h2COk2Quj5DTRgjghk6V5DSeXBzTmvdt0nRIxmCA9I6k7P0
 2L+YcZgH/ayXIS+Z2yc3OexquUR0lwyXr8Rej6cWh2PMKTSa3tBBYsEjIrEBLbNnd/X5
 SeYJTNCo5pKpMyaNCkvGmQsedjb3ozEMmWPOAWA4Oggk2QPDYpyniASS0LZMDCRmp/rj
 A8pF6t7/SbPg47uqNd+MxKal9eKG6ArSEpleT8cXWToGw0WUZW2/0cjpKFb/0W3WTX2J
 UM4vmeJjQnvplwGWQUYVQygCQ+eHUtsSS9eDpX4CkLaSZuRDuvoDrOZsTmCK6WMTu/jO
 T2Zw==
X-Gm-Message-State: APjAAAXYURTYGlqsN9S1162uZ7z+l1rbUom/8fFxj9v0xnNsYzcd5gnp
 tY3ZyklbcbHHR7vSXyrjlkSkEAJ+qEUMTD05ah7SnQ==
X-Google-Smtp-Source: APXvYqwEzWb320r5+SHL0+7OQFCxEYUxYfCtSraiDBBfydyJt1OyKTlgwkYADb1gM+UHcIG5DcqWzMzrbSAThk94FsI=
X-Received: by 2002:a1f:3ad1:: with SMTP id h200mr3827200vka.24.1559304212932; 
 Fri, 31 May 2019 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
In-Reply-To: <5CF0FEB5.4030700@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 20:03:21 +0800
Message-ID: <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1933526263=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1933526263==
Content-Type: multipart/alternative; boundary="000000000000b59cf8058a2dcdf6"

--000000000000b59cf8058a2dcdf6
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 6:15 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> On 2019/05/31 16:44, Jinhui huang wrote:
> > On new kernels, copy_file_range() returned EISDIR when copyed contents
> > to directory, but on old kernels, it returned EBADF, we should accept
> > EBADF to be compatible with new and old kernels.
> >
> > The patch as follows:
> > commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
> Hi,
>
> From description of commit, I wonder if we can add more tests for some
> non regular files(e.g. block, pipe)?
>

I have no objection on this. But, is there really make sense to test some
more non regular files which not being mentioned by Linux Manual Page?

The copy_file_range02 test errors are all extract from manual page, I
commented that in Christian's first patch version. And I don't think it's
necessary to test undefined behavior in syscall using, because how do we
know what error return is the expected?

I just want to increase coverage and fix all similar issues as you did. :-)
>
> Best Regards,
> Xiao Yang
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
> > -             } else {
> > -                     tst_res(TFAIL | TTERRNO,
> > -                             "copy_file_range failed unexpectedly;
> expected %s, but got",
> > -                             tst_strerrno(tc->exp_err));
> > +                             "copy_file_range failed as expected");
> >                       return;
> >               }
> > -     } else {
> > -             tst_res(TFAIL,
> > -                     "copy_file_range returned wrong value: %ld",
> TST_RET);
> > +
> > +             tst_res(TFAIL | TTERRNO,
> > +                     "copy_file_range failed unexpectedly; expected %s,
> but got",
> > +                     tst_strerrno(tc->exp_err));
> >       }
> >  }
> >
>
>
>
>

-- 
Regards,
Li Wang

--000000000000b59cf8058a2dcdf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 31, 2019 at 6:15 PM Xiao Yang &lt;<a hr=
ef=3D"mailto:yangx.jy@cn.fujitsu.com" target=3D"_blank">yangx.jy@cn.fujitsu=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 2019/05/31 16:44, Jinhui huang wrote:<br>
&gt; On new kernels, copy_file_range() returned EISDIR when copyed contents=
<br>
&gt; to directory, but on old kernels, it returned EBADF, we should accept<=
br>
&gt; EBADF to be compatible with new and old kernels.<br>
&gt;<br>
&gt; The patch as follows:<br>
&gt; commit 11cbfb10775a (&quot;vfs: deny copy_file_range() for non regular=
 files&quot;)<br>
Hi,<br>
<br>
From description of commit, I wonder if we can add more tests for some<br>
non regular files(e.g. block, pipe)?<br></blockquote><div><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I have no objection on this=
. But, is there really make sense to test some more non regular files which=
 not being mentioned by Linux Manual Page?</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">The copy_file_range02 test errors are all extract from ma=
nual page, I commented that in=C2=A0Christian&#39;s first patch version. An=
d I don&#39;t think it&#39;s necessary to test undefined behavior in syscal=
l using, because how do we know what error return is the expected?</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
I just want to increase coverage and fix all similar issues as you did. :-)=
<br>
<br>
Best Regards,<br>
Xiao Yang<br>
&gt; Signed-off-by: Jinhui huang &lt;<a href=3D"mailto:huangjh.jy@cn.fujits=
u.com" target=3D"_blank">huangjh.jy@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range02.c=C2=A0 =C2=A0| 3=
3 +++++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 23 insertions(+), 10 deletions(-)<br>
&gt;<br>
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
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL | TTERRNO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copy_file_range failed unexpectedl=
y; expected %s, but got&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strerrno(tc-&gt;exp_err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copy_file_range failed as expected=
&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTERR=
NO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range failed unexpectedly; expected %s, but got&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_strerrno(tc-&gt;exp_err));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_1781087082608906626gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b59cf8058a2dcdf6--

--===============1933526263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1933526263==--
