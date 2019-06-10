Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3E3ADA8
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 05:33:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 664393EAE03
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 05:33:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8B1FA3EADCE
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 05:33:22 +0200 (CEST)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 718D5600967
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 05:33:20 +0200 (CEST)
Received: by mail-vk1-f195.google.com with SMTP id p24so1381720vki.5
 for <ltp@lists.linux.it>; Sun, 09 Jun 2019 20:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/3tYFGm9p3LaJlgHqh4DAel/YUOLcVHISuQYxf7Eiw=;
 b=iUjscR2ouyEv8nTFgOmIkOVspnM3MTCMN1HDOlVfniCqoe/U++jJjGiATXZP9vDmty
 AVRT8ddEYQ5hb4efhUS025hLpd+Cq7vkcd7Np9YGHBP429mihyGLwVj5Wu01nqP9kmUG
 tCP27jWw5jILYuFBnblyFH5SLbyO6RUEwIBWRPKgs8RBwP/yuWIGipI41UyZCXyZMCq5
 PXhOPRJ7c4WUBA5aNVkc5FCSP742crZlCrbdRVvjSsZ7kxAI4cKBXKzZgYkmi4vmZb5b
 I125Nn8gPTexjK6/LUOllleJqIOUobbLK1Sm38Gnx7XQyZfpmsJLMJX2vMX67dLZopTd
 2ctw==
X-Gm-Message-State: APjAAAU4BPhVC2tg4ftK0/CbHQnz4bn48nNBka2AUdNqx9Ee1vyoKhYI
 PjN2njlEVgI75N4c2nNz4qrqdARxBWPqyhoq8Py4mQ==
X-Google-Smtp-Source: APXvYqzXkUiMB7Or3tHZC13c7m9Ae4+diw8vSeRqhcGh+1NrDm3tmfYjfQSabWptgN2o8F6c8a6hRqOLSvqfgjyHFJQ=
X-Received: by 2002:a1f:e645:: with SMTP id d66mr5479828vkh.72.1560137599060; 
 Sun, 09 Jun 2019 20:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <1551962651-22261-1-git-send-email-sumit.garg@linaro.org>
 <20190327144826.GA30619@rei>
 <CAFA6WYPxhVSub1SQyAk_51=NB0=yhjBfWPKdXoAjJB_TP0Za1Q@mail.gmail.com>
In-Reply-To: <CAFA6WYPxhVSub1SQyAk_51=NB0=yhjBfWPKdXoAjJB_TP0Za1Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Jun 2019 11:33:08 +0800
Message-ID: <CAEemH2fHYLuCpBAiyNz8cmzyT0rTJcAF56Lj1W8g0nN9Tv-Afw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3] syscalls/sync_file_range: add partial file
	sync test-cases
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
Content-Type: multipart/mixed; boundary="===============0911438228=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0911438228==
Content-Type: multipart/alternative; boundary="00000000000064ac09058aefd72f"

--00000000000064ac09058aefd72f
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 12:57 PM Sumit Garg <sumit.garg@linaro.org> wrote:

> On Wed, 27 Mar 2019 at 20:18, Cyril Hrubis <chrubis@suse.cz> wrote:
> >
> > Hi!
> > Sorry for the long delay.
> >
> > This is altmost perfect, the only problem is that the third test fails
> > on vfat. As far as I can tell the reason is that vfat does not support
> > sparse files, hence seeking to the middle of file and writing there also
> > schedulles I/O to write zeros from the start of the file to the offset
> > we started writing to.
> >
>
> Hmm, I see.
>
> > Following ugly patch solves the problem:
> >
> > diff --git
> a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > index 334ea5e88..774524c2f 100644
> > --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > @@ -45,6 +45,12 @@ static void verify_sync_file_range(struct testcase
> *tc)
> >
> >         fd = SAFE_OPEN(tc->fname, O_RDWR|O_CREAT, MODE);
> >
> > +       if (!strcmp(tst_device->fs_type, "vfat")) {
> > +               tst_res(TINFO, "Pre-filling file");
> > +               tst_fill_fd(fd, 0, tc->write_off, 1);
> > +               fsync(fd);
> > +       }
> > +
> >         lseek(fd, tc->write_off, SEEK_SET);
> >
> >
> > So either we limit the tests so that the sync region does not overlap
> with the
> > possible hole at the start of the file and loose some test coverage.
> >
> > Or we can add a function to the test library that would return
> true/false if
> > sparse files are supported for a given FS.
> >
>
> My initial thought behind this test-case was to run sync over a range
> which is partially written. The other partial region not being written
> could either be a hole or already synced data. So pre-fill file in
> case of vfat looks sane option, but how about if we add pre-fill as
> part of setup? Something like:
>

I think this is a bit better. Could u send a new patch version?


> --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -86,6 +86,12 @@ static void setup(void)
>  {
>         if (!check_sync_file_range())
>                 tst_brk(TCONF, "sync_file_range() not supported");
> +
> +       if (!strcmp(tst_device->fs_type, "vfat")) {
> +               tst_res(TINFO, "Pre-filling file");
> +               tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> +               sync();
> +       }
>  }
>
> -Sumit
>
> > --
> > Cyril Hrubis
> > chrubis@suse.cz
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--00000000000064ac09058aefd72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 28, 2019 at 12:57 PM Sumit Garg &lt;<a =
href=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 27 Mar 2=
019 at 20:18, Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi!<br>
&gt; Sorry for the long delay.<br>
&gt;<br>
&gt; This is altmost perfect, the only problem is that the third test fails=
<br>
&gt; on vfat. As far as I can tell the reason is that vfat does not support=
<br>
&gt; sparse files, hence seeking to the middle of file and writing there al=
so<br>
&gt; schedulles I/O to write zeros from the start of the file to the offset=
<br>
&gt; we started writing to.<br>
&gt;<br>
<br>
Hmm, I see.<br>
<br>
&gt; Following ugly patch solves the problem:<br>
&gt;<br>
&gt; diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range=
02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
&gt; index 334ea5e88..774524c2f 100644<br>
&gt; --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br=
>
&gt; +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br=
>
&gt; @@ -45,6 +45,12 @@ static void verify_sync_file_range(struct testcase =
*tc)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(tc-&gt;fname, O_RDWR=
|O_CREAT, MODE);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tst_device-&gt;fs_type, &quot;=
vfat&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO,=
 &quot;Pre-filling file&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fill_fd(fd=
, 0, tc-&gt;write_off, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsync(fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lseek(fd, tc-&gt;write_off, SEEK_SET)=
;<br>
&gt;<br>
&gt;<br>
&gt; So either we limit the tests so that the sync region does not overlap =
with the<br>
&gt; possible hole at the start of the file and loose some test coverage.<b=
r>
&gt;<br>
&gt; Or we can add a function to the test library that would return true/fa=
lse if<br>
&gt; sparse files are supported for a given FS.<br>
&gt;<br>
<br>
My initial thought behind this test-case was to run sync over a range<br>
which is partially written. The other partial region not being written<br>
could either be a hole or already synced data. So pre-fill file in<br>
case of vfat looks sane option, but how about if we add pre-fill as<br>
part of setup? Something like:<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I think this is a bit better=
. Could u send a new patch version?</div></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
@@ -86,6 +86,12 @@ static void setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!check_sync_file_range())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quo=
t;sync_file_range() not supported&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tst_device-&gt;fs_type, &quot;vfat&=
quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;Pre-filling file&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_fill_file(FNAME=
3, 0, TST_MB, FILE_SZ_MB);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sync();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-Sumit<br>
<br>
&gt; --<br>
&gt; Cyril Hrubis<br>
&gt; <a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</=
a><br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000064ac09058aefd72f--

--===============0911438228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0911438228==--
