Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B3165B2C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:10:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D5473C2244
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:10:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B3E163C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:10:05 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8DCC2601F7D
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582193403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UeMt+s9wUYYxNqYXJYBooTXJnaCxq7+vSfqqPoydNvw=;
 b=D5guUCuShFl6F++gt4+KAOEC4NaI/hCr+IKr6opCbe6Z6nomggO1jg4XcCns4Mv5ft+tzp
 0K2ho8UsSGognCrkBN829h4Oei5WDmx6KZmiGjgkZUhjez4AzY8AzYItkqWe4oxqyu9R56
 6CTmJ0LQcRdP+lSnvh73CgYPSEe2oqY=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-EWY7FHaEOViwWSZ4UMnsTQ-1; Thu, 20 Feb 2020 05:10:00 -0500
Received: by mail-oi1-f200.google.com with SMTP id k206so3708611oia.22
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 02:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaJrwTHjpDWxTyJUShXav8ik7KfqHtFa201XE2NsnfE=;
 b=hNnV8pSrpavqEGWhwY0cdnrAwZ/tuSxPLJFXqtk4deXQ1ijN4MT53vfT1uwqz6yeTS
 sLQ/fU6WRFpAe5BjoSO+xP8b3i59QlF9eLicAVx2e0hg6nIJAluzCUEonZGVggmOWUhp
 aMZ177+oN1gZZc4YL6IhKalerDNjVvJBtOUm3Fg/6oK20H1znzrfN9QEIJA4W38cAhTt
 AHFY94NVcrnwOmxiDYftTngRUoAIL53wzSzIUMobyLBMmTHtWdYyHWKlCcFRBju+pMVj
 yQDgNd9C0QdytwJRTMv//wv2I9sSDBAc3WEdAdxAZWJrwv7bI70oZQal+H6lKP1jx+7l
 qy2w==
X-Gm-Message-State: APjAAAWfrq2DYsTYJRNcv/cV2VSMsazGf+y5SDyioM7IUj93FYL9IYOQ
 M/ieHfh6TGWiIvXlcaO9O4wMmkOb50nt0RCjyg84n2PAXbV8K9r1Jh07s2q/iO2oHNxzWw6XCaA
 gIh4fQXrjmmySKoRo2mDafo4L7gE=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr23101119otq.264.1582193399307; 
 Thu, 20 Feb 2020 02:09:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqznH5Vbu5VGyTHNz3wsaxB/O5vdcN6ZxehVKEYH2vrtUZBuBMQwXSyMIJuaXb8gQzBIz1fmUB56QtQGYL4uG0M=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr23101106otq.264.1582193399062; 
 Thu, 20 Feb 2020 02:09:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <6ac7573e8ea5ab6f0ab9256b73802126d72b5156.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2f6gudJjZ1HAsVFVKkuR3FUyBVHf1JQDHeQMdavQqc+2A@mail.gmail.com>
 <20200220055024.fgh2uxje6yanrshh@vireshk-i7>
In-Reply-To: <20200220055024.fgh2uxje6yanrshh@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 18:09:47 +0800
Message-ID: <CAEemH2ft=SJQzoY9yHYUpLyYXGpciWOowHM=yn-PO1cHo5=bUQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: EWY7FHaEOViwWSZ4UMnsTQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 05/10] syscalls/fsconfig: New tests
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
Cc: Vikas.Kumar2@arm.com, dhowells <dhowells@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1887039123=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1887039123==
Content-Type: multipart/alternative; boundary="000000000000847609059eff1b5d"

--000000000000847609059eff1b5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 1:50 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 20-02-20, 13:41, Li Wang wrote:
> > > +       TEST(fsconfig(fd, FSCONFIG_SET_PATH, "foo", tst_device->dev,
> > > AT_FDCWD));
> > > +       if (TST_RET =3D=3D -1) {
> > > +               if (TST_ERR =3D=3D EOPNOTSUPP) {
> > > +                       tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH
> not
> > > supported");
>
> On my ARM setup, I always hit this path for few of the syscalls :(
>
> > > +               } else {
> > > +                       tst_res(TFAIL | TERRNO, "fsconfig() failed");
> > >
> >
> > The test reports an EINVAL error when testing fsconfig() with
> > 'FSCONFIG_SET_PATH' on XFS. I'm now trying to look close to this issue.
> >
> > kernel: 5.6.0-rc2+ x86_64
> >
> > tst_test.c:1278: INFO: Testing on xfs
> > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts=3D'' extra opt=
s=3D''
> > tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
> > fsconfig01.c:46: FAIL: fsconfig() failed: EINVAL (22)
>
> Both "foo" and tst_device->dev may be wrong here unfortunately. Same
> for few other commands like: _PATH, _PATH_EMPTY, _FD..
>

If the parameter '_key' is replaced by 'ro' or 'rw', then the test always
gets passed, the same behavior occurred in fspick01 too.

I'm not sure if the usage is correct for fsconfig(), it'd be great if FS
guys could give advice.

--=20
Regards,
Li Wang

--000000000000847609059eff1b5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Feb 20, 2020 at 1:50 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 20-02-20, 13:41, Li Wang wrote:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_SET_PATH, =
&quot;foo&quot;, tst_device-&gt;dev,<br>
&gt; &gt; AT_FDCWD));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_E=
RR =3D=3D EOPNOTSUPP) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;fsconfig(): FSCONFIG_SET_PATH not<=
br>
&gt; &gt; supported&quot;);<br>
<br>
On my ARM setup, I always hit this path for few of the syscalls :(<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TERRNO, &quot;fsconfig() failed&quot;);=
<br>
&gt; &gt;<br>
&gt; <br>
&gt; The test reports an EINVAL error when testing fsconfig() with<br>
&gt; &#39;FSCONFIG_SET_PATH&#39; on XFS. I&#39;m now trying to look close t=
o this issue.<br>
&gt; <br>
&gt; kernel: 5.6.0-rc2+ x86_64<br>
&gt; <br>
&gt; tst_test.c:1278: INFO: Testing on xfs<br>
&gt; tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts=3D&#39;&#39; =
extra opts=3D&#39;&#39;<br>
&gt; tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s<br>
&gt; fsconfig01.c:46: FAIL: fsconfig() failed: EINVAL (22)<br>
<br>
Both &quot;foo&quot; and tst_device-&gt;dev may be wrong here unfortunately=
. Same<br>
for few other commands like: _PATH, _PATH_EMPTY, _FD..<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">If t=
he parameter &#39;_key&#39; is replaced by &#39;ro&#39; or &#39;rw&#39;, th=
en the test always gets passed, the same behavior occurred in fspick01 too.=
</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m=
 not sure if the usage is correct for fsconfig(), it&#39;d be great if FS g=
uys could give advice.</div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000847609059eff1b5d--


--===============1887039123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1887039123==--

