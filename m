Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89849131FBE
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 07:16:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 312313C2270
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 07:16:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9B5C33C2266
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 07:16:43 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D76A360150E
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 07:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578377801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VdvJQtwMFoGxpJKOQ1NyKsLDOTJKKzzZhOgbzfmf0CA=;
 b=WNum95gANRFjdu1tA/A3absEtwjuF0j8meTuonNKzTAUfwS8hguK1Pq4KrtjyN6VMJ/sP0
 g3XbcOGWX+zVNEK/IvGikzlDk/nMaSqdsJtOejZNcoCdXH5EDIbg38ArzoSQ4H0LkQALfJ
 DVGJS6Liv6BFw9R8gdk/k+mtWmB2Gko=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-xUjBLrl0NLeV2jNDDOgOKg-1; Tue, 07 Jan 2020 01:16:39 -0500
Received: by mail-oi1-f197.google.com with SMTP id v130so21983021oif.18
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 22:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvWteEDJ6R2J2ezfMEYzsyJuqrtvnekbg555q1eaMuY=;
 b=AXkahwTQBfJcBLxY4HWF3wfs2vViUEI3UWlL5ucPmVvsJXMUbgIJec93MPxQRA7oOM
 xy/3Zzwu4Zs1I2jpSVi47uU9duDYBdRvJuQF5RyWyS1QGZfX7ZYUBjOC+bCjg7nvTrOA
 FLTKlvOOtE1CZEFyXby2zlEIo5D2jXQdaM+kMXV5i+PHpKkDYI/EvL+2+4IpDfgyQp9m
 BYiDbI4kGvxDPOJo733u67auohGOI7BXurdYTvLEUgalduw0yGpG5cahwaAlm66dOyZ/
 I0VZL+QwO/JDgWTgX5YSnuaSM4egh9dPgE1LjtfMTxAyTAUgVmTBeGNh4Zoh1WtM7cpX
 cikw==
X-Gm-Message-State: APjAAAUNLhn1Esvj3VFG+I8OPSTg+3Yy3kyXIQZ9nFzb3FXWwyMh/O6G
 pl2hCuavqSQ33RjLBOHw60xFi2RpehPwwdfeoAjVnLC9CShup+JVkFlHDil7bsJNMisH4eMvct/
 AJmEbh5PVKDAeZxyI1xBgY0pmqm4=
X-Received: by 2002:a9d:7:: with SMTP id 7mr113219534ota.26.1578377798393;
 Mon, 06 Jan 2020 22:16:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqy18Mf14x8XYeZU1SdAzJigpgnUtOCsPqR2mcvxFp6tXlHrzm90AqHTniYNVB9i8CYuUCyaxiVVjsO6dSMV85w=
X-Received: by 2002:a9d:7:: with SMTP id 7mr113219521ota.26.1578377798257;
 Mon, 06 Jan 2020 22:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20200102015236.7400-1-liwang@redhat.com>
 <20200102125759.GE32710@rei.lan>
 <CAEemH2fdY_pPjNCEFmcd_zsye4HAciPuhF+Fiyde9WmBci=+Lg@mail.gmail.com>
 <20200106100540.GA25027@rei.lan> <20200106103509.GB25027@rei.lan>
In-Reply-To: <20200106103509.GB25027@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 Jan 2020 14:16:27 +0800
Message-ID: <CAEemH2fEOJjC1wbmhTbw4baqtW=Uig1Qa94-kqwCjeRk3yW=+Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: xUjBLrl0NLeV2jNDDOgOKg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Content-Type: multipart/mixed; boundary="===============1733254500=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1733254500==
Content-Type: multipart/alternative; boundary="000000000000fcb767059b86b7c6"

--000000000000fcb767059b86b7c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2020 at 6:35 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > > > To avoid FS deferred IO metadata/cache interferes test result, so
> we
> > > > > do sync simply before the tst_dev_bytes_written invocation.
> > > >
> > > > Can we do fsync() on the fd instead of full sync()? That should be
> > > > slightly faster.
> > > >
> > >
> > > Probably you miss the previous discussed [1], we use sync() here
> because we
> > > do want to make sure all FS metadata/cache being written back before
> the
> > > testing since there is no obtainable file descriptor 'fd' for the ext=
4
> > > deferred IO (e.g. initialize the journal and inode tables).
> >
> > Ah, right, we measure I/O to the whole device, so we would have to sync
> > the device in question. Then syncfs() on the fd we got should work
> > right? And it should avoid syncing unrelated filesystems as well.
>
> It wouldn't probably harm to create an inline function in the test
> library just for a sake of documentation, something as:
>
> static inline void tst_dev_sync(int fd)
> {
>         syncfs(fd);
> }
>
>
> Then we end up calling:
>
>         tst_dev_sync(fd);
>         tst_dev_bytes_written(device);
>

Agree.

--=20
Regards,
Li Wang

--000000000000fcb767059b86b7c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 6:35 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; &gt; &gt; To avoid FS deferred IO metadata/cache interferes test =
result, so we<br>
&gt; &gt; &gt; &gt; do sync simply before the tst_dev_bytes_written invocat=
ion.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can we do fsync() on the fd instead of full sync()? That sho=
uld be<br>
&gt; &gt; &gt; slightly faster.<br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; Probably you miss the previous discussed [1], we use sync() here =
because we<br>
&gt; &gt; do want to make sure all FS metadata/cache being written back bef=
ore the<br>
&gt; &gt; testing since there is no obtainable file descriptor &#39;fd&#39;=
 for the ext4<br>
&gt; &gt; deferred IO (e.g. initialize the journal and inode tables).<br>
&gt; <br>
&gt; Ah, right, we measure I/O to the whole device, so we would have to syn=
c<br>
&gt; the device in question. Then syncfs() on the fd we got should work<br>
&gt; right? And it should avoid syncing unrelated filesystems as well.<br>
<br>
It wouldn&#39;t probably harm to create an inline function in the test<br>
library just for a sake of documentation, something as:<br>
<br>
static inline void tst_dev_sync(int fd)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 syncfs(fd);<br>
}<br>
<br>
<br>
Then we end up calling:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_dev_sync(fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_dev_bytes_written(device);<br></blockquote>=
<div><br></div></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Agree.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000fcb767059b86b7c6--


--===============1733254500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1733254500==--

