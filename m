Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7298E101EE9
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 09:59:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31AFC3C22A1
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 09:59:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A03603C1CEE
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 09:59:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0DFF32011D5
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 09:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574153981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Abb9moj7Fg6c4XwZoHtMP/oLf1gmdZlSDJYeGQo+6ss=;
 b=gZA6lVBA+DbdIY4VNY0kSvOaJoqfQTRP0UjOj50QXzjsPkU7tan8EstE1cUKjjpXkjgSUg
 Err+OLp3LedkismywGcf5sW/l7z0cg+k9OiNmXtORp6W6Yqvo+1wlO1i0tyXfxillvTA+t
 bwF2HfO0UHvpSOG+4zb1RxPd2RODolI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-femgNMEIOLqu328e1I7L2w-1; Tue, 19 Nov 2019 03:59:37 -0500
Received: by mail-oi1-f199.google.com with SMTP id x15so10214565oif.19
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 00:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcbiU/hHktvp0BiZ2bd36Bf/lqtKJMu4jnuJHEGRn58=;
 b=Vmx9n3wGX35OiuKZhxsUvNT8FvhO3t3hAuCTMMHbwe0DTbqrnimPqkECdi4v7YbeMl
 zOPdDuXhVA5de/VpigA64edGYgU3W4GQSSHBduZexb1tK8k7My7xY+jRlBcDpytf3Jfz
 KiYTNIUnRceWOSS0gnytIEFyDNvHYl/F+3fKDIMpz57ohehn56GsfjF9kC1fqvwh8Poz
 bNxWgh43ZAQkmQPifa2yWQ/vAAUOoHq52yxa2UBBi+kbeixAlvYBeavtEnqUMP/GcniS
 Kp35zJt1Gl0U7d9wd0cJYPOGR9v3VJjAm5vkTC1BVd8QdjSmElLku2RGfgJ5yNQ/xySW
 xT5A==
X-Gm-Message-State: APjAAAVjVG2ba86TUw5gcStohohK9DoeO3nUjy+OTILCClWBem4TVJfO
 usvMWQO44UGC/sqkygof4/mbTns5y6Hr7Zx7AEaMdD20lmXf3Eoq98YuypX//FTsFvxARaYWXN3
 Jn32CjVKbKBARv/HpXb3y9Gc0F/g=
X-Received: by 2002:aca:adc1:: with SMTP id w184mr2977548oie.138.1574153976467; 
 Tue, 19 Nov 2019 00:59:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNGNerjXmj701+NvCVRTT5V0vCSLyB64rybICAl6oRQTyKV5CdWBC76upmZp53CYBFbdiJ0gSIt62549JuAdQ=
X-Received: by 2002:aca:adc1:: with SMTP id w184mr2977526oie.138.1574153976156; 
 Tue, 19 Nov 2019 00:59:36 -0800 (PST)
MIME-Version: 1.0
References: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
 <CAEemH2eu8HcQ90+BxUL0Hu+No6P5je4xC3oqVSU_ZnwMXEG=7Q@mail.gmail.com>
 <1824199572.12930798.1574151212869.JavaMail.zimbra@redhat.com>
In-Reply-To: <1824199572.12930798.1574151212869.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 19 Nov 2019 16:59:25 +0800
Message-ID: <CAEemH2dp_O-Y2k3xTQbeJ9MS100QQg2hHCcrRgYsZVFhT0kZDw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: femgNMEIOLqu328e1I7L2w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fallocate05: increase FALLOCATE_SIZE
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
Content-Type: multipart/mixed; boundary="===============1827239016=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1827239016==
Content-Type: multipart/alternative; boundary="00000000000092353e0597af487e"

--00000000000092353e0597af487e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 19, 2019 at 4:13 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Another patch I was thinking is to enhance the tst_fill_fs routine, whi=
ch
> > as Eric suggested, makes more reliably to get to a full filesystem.
> > Something like what xfstest does to cut the trial write size in half an=
d
> > try again until the size is less than the filesystem block size.
> >
> > Comments?
>
> fallocate05 seems to be the only test using it, but in general I think we
>

Thanks, I will format a patch.


> can do that too. Assuming this alone would be reliable, is there any
> advantage of running test with small FALLOCATE_SIZE?
>

Hmm, maybe no, my purpose to shrink the FALLOCATE_SIZE is just to reproduce
the problem. I thought that if the filesystem is not 'really' full, then
the fallocate() should succeed with a smaller size, only for degging.


>
> >
> > --- a/lib/tst_fill_fs.c
> > +++ b/lib/tst_fill_fs.c
> > @@ -6,6 +6,7 @@
> >  #include <errno.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > +#include <sys/statvfs.h>
> >
> >  #define TST_NO_DEFAULT_MAIN
> >  #include "tst_test.h"
> > @@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
> >         size_t len;
> >         ssize_t ret;
> >         int fd;
> > +       struct statvfs fi;
> > +       statvfs(path, &fi);
> >
> >         for (;;) {
> >                 len =3D random() % (1024 * 102400);
> > @@ -41,6 +44,12 @@ void tst_fill_fs(const char *path, int verbose)
> >                         ret =3D write(fd, buf, MIN(len, sizeof(buf)));
> >
> >                         if (ret < 0) {
> > +                               if (errno =3D=3D ENOSPC) {
> > +                                       len /=3D 2;
> > +                                       if (len >=3D fi.f_bsize)
> > +                                               continue;
> > +                               }
> > +
> >                                 SAFE_CLOSE(fd);
> >
> >                                 if (errno !=3D ENOSPC)
> >
> >
> >
> > >
> > > Increase FALLOCATE_SIZE to minimize chance of hitting sporadic
> > > failures when that happens.
> > >
> > > Thanks to Carlos Maiolino and Eric Sandeen for their comments
> > > and suggestions.
> > >
> > > Fixes #610
> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > >
> > Reviewed-by: Li Wang <liwang@redhat.com>
>
> Thanks, I pushed this patch for now.
>
>

--=20
Regards,
Li Wang

--00000000000092353e0597af487e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 4:13 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Another patch I was thinking is to enhance the tst_fill_fs routine, wh=
ich<br>
&gt; as Eric suggested, makes more reliably to get to a full filesystem.<br=
>
&gt; Something like what xfstest does to cut the trial write size in half a=
nd<br>
&gt; try again until the size is less than the filesystem block size.<br>
&gt; <br>
&gt; Comments?<br>
<br>
fallocate05 seems to be the only test using it, but in general I think we<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Thanks, I will format a patch.</div></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
can do that too. Assuming this alone would be reliable, is there any<br>
advantage of running test with small FALLOCATE_SIZE?<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Hmm, m=
aybe no, my purpose to shrink the=C2=A0FALLOCATE_SIZE is just to reproduce =
the problem. I thought that if the filesystem is not &#39;really&#39; full,=
 then the fallocate() should succeed=C2=A0with a smaller size, only for deg=
ging.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; <br>
&gt; --- a/lib/tst_fill_fs.c<br>
&gt; +++ b/lib/tst_fill_fs.c<br>
&gt; @@ -6,6 +6,7 @@<br>
&gt;=C2=A0 #include &lt;errno.h&gt;<br>
&gt;=C2=A0 #include &lt;stdio.h&gt;<br>
&gt;=C2=A0 #include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;sys/statvfs.h&gt;<br>
&gt; <br>
&gt;=C2=A0 #define TST_NO_DEFAULT_MAIN<br>
&gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
&gt; @@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct statvfs fi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0statvfs(path, &amp;fi);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D r=
andom() % (1024 * 102400);<br>
&gt; @@ -41,6 +44,12 @@ void tst_fill_fs(const char *path, int verbose)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D write(fd, buf, MIN(len, sizeof(buf)));<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D ENOSPC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len /=
=3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (l=
en &gt;=3D fi.f_bsize)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno !=3D ENOSPC)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Increase FALLOCATE_SIZE to minimize chance of hitting sporadic<br=
>
&gt; &gt; failures when that happens.<br>
&gt; &gt;<br>
&gt; &gt; Thanks to Carlos Maiolino and Eric Sandeen for their comments<br>
&gt; &gt; and suggestions.<br>
&gt; &gt;<br>
&gt; &gt; Fixes #610<br>
&gt; &gt; Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.=
com" target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
<br>
Thanks, I pushed this patch for now. <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000092353e0597af487e--


--===============1827239016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1827239016==--

