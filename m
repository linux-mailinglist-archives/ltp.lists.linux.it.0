Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4F131FB8
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 07:13:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D70E73C238D
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 07:13:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 851933C2245
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 07:13:31 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 45DB01A0123B
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 07:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578377608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mh9XkbBF33SG1OLLzHCX1s1he5+OuKZNGFhlUHoPAnw=;
 b=Z3znM45pIu0aDhtElM4WllScjyQUlV1KG5P9LXt1eIHNJ1D1q18ibsBe3poW3wZ2TVx6FN
 uGwLRWv02juA6nVVtYD20scprjSOwaE+1Kqq0U+iovjgVvkikBZ0of7qS70yO2qz7Fp2dD
 gXbfktJ4qhI4fEjHenEPRA+6QeDcywQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Obap_g2yNwqig6X_U7-f7w-1; Tue, 07 Jan 2020 01:13:26 -0500
Received: by mail-ot1-f69.google.com with SMTP id r19so25343783otd.23
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 22:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4Qbj7ofJZIPMlAozQjeoUGwgz2rvvJJ0ysZO84xMxY=;
 b=hElG+IhLcFAvIeHTDII4nh/d+GDjdvZA3ugYEBQHte1JC1UjhS5cQs5Koph6MEUwwt
 M/E3WfL6pdel7XY6nmi9aNxenByEG9aKHxVpYg0XdHTt0iFgbMXHst9oA0Mh/5Dp5dh1
 PgBi/2NoTiAbDWRrX1ChqJXU+4HHDVR27DhcJaL428mfujaewmZI6vOvKbHC0hJmzPVK
 l/mvHTe7iADOUthVff6oFYEjNX3lG0ytOjR6aOce8bX1ddKmNbioTr9UI8t4s5T/Jvd1
 eHGoUzu+u8XABv3OBkSTvHkHLV+wb+dn78dqytgspWAZQCFO86Wdpf+o3s1/SZjacOJs
 sikQ==
X-Gm-Message-State: APjAAAXR6v5FqZ39tDnVjrBHzhNmJDxAZCQG7AUGESDE79uLn5hsLbf3
 dkFW4TGiSgD0YTCYarNjs0cakRvG42qO1rbw1V/6blQjpeljlux4YyU6nf4Bt8DZYvVf01e5bnq
 SCycb1aoPJnFHmui9+lJKcBttDJA=
X-Received: by 2002:aca:1913:: with SMTP id l19mr6196493oii.47.1578377605829; 
 Mon, 06 Jan 2020 22:13:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1rM8nx03JrNwWcPuD/qU9KkdJCzAs6r5YHPy2QgFa9HLvEUPwx+bHRBK6+iSvnu3PdGcxb8czd8zjhwR+jBI=
X-Received: by 2002:aca:1913:: with SMTP id l19mr6196485oii.47.1578377605495; 
 Mon, 06 Jan 2020 22:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20200102015236.7400-1-liwang@redhat.com>
 <20200102125759.GE32710@rei.lan>
 <CAEemH2fdY_pPjNCEFmcd_zsye4HAciPuhF+Fiyde9WmBci=+Lg@mail.gmail.com>
 <20200106100540.GA25027@rei.lan>
In-Reply-To: <20200106100540.GA25027@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 7 Jan 2020 14:13:14 +0800
Message-ID: <CAEemH2fbHPJSqFgQ2C5YLAmoctiAj_wvp27N+U-zc0omJWTCdw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: Obap_g2yNwqig6X_U7-f7w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1327142149=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1327142149==
Content-Type: multipart/alternative; boundary="0000000000007f5541059b86ac55"

--0000000000007f5541059b86ac55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Mon, Jan 6, 2020 at 6:06 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > > To avoid FS deferred IO metadata/cache interferes test result, so w=
e
> > > > do sync simply before the tst_dev_bytes_written invocation.
> > >
> > > Can we do fsync() on the fd instead of full sync()? That should be
> > > slightly faster.
> > >
> >
> > Probably you miss the previous discussed [1], we use sync() here becaus=
e
> we
> > do want to make sure all FS metadata/cache being written back before th=
e
> > testing since there is no obtainable file descriptor 'fd' for the ext4
> > deferred IO (e.g. initialize the journal and inode tables).
>
> Ah, right, we measure I/O to the whole device, so we would have to sync
> the device in question. Then syncfs() on the fd we got should work
> right? And it should avoid syncing unrelated filesystems as well.
>

Good point, I double read the fsync() and syncfs() manual page. It looks
like syncfs() is not the same as the previous function, it synchronizes the
file system containing file referred to by the open file descriptor fd, I
mixed them before, to be honest.

--=20
Regards,
Li Wang

--0000000000007f5541059b86ac55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Cyril,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 6:06 PM Cyril Hrub=
is &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; &gt; To avoid FS deferred IO metadata/cache interferes test resul=
t, so we<br>
&gt; &gt; &gt; do sync simply before the tst_dev_bytes_written invocation.<=
br>
&gt; &gt;<br>
&gt; &gt; Can we do fsync() on the fd instead of full sync()? That should b=
e<br>
&gt; &gt; slightly faster.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Probably you miss the previous discussed [1], we use sync() here becau=
se we<br>
&gt; do want to make sure all FS metadata/cache being written back before t=
he<br>
&gt; testing since there is no obtainable file descriptor &#39;fd&#39; for =
the ext4<br>
&gt; deferred IO (e.g. initialize the journal and inode tables).<br>
<br>
Ah, right, we measure I/O to the whole device, so we would have to sync<br>
the device in question. Then syncfs() on the fd we got should work<br>
right? And it should avoid syncing unrelated filesystems as well.<br>
</blockquote><div>=C2=A0</div></div>Good point, I double read the fsync() a=
nd syncfs() manual page. It looks like syncfs() is not the same as the prev=
ious function, it synchronizes the file system containing file referred to =
by the open file descriptor fd<span class=3D"gmail_default" style=3D"font-s=
ize:small">,</span> I mixed them <span class=3D"gmail_default" style=3D"fon=
t-size:small">before</span><span class=3D"gmail_default" style=3D"font-size=
:small">,=C2=A0</span>to be honest.<div><div><br></div><div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div></div></div>

--0000000000007f5541059b86ac55--


--===============1327142149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1327142149==--

