Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22158F2AC
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:21:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3B9D3EACC2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:21:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1E2213EAC9C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:21:47 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 70B04600F42
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:21:48 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id x194so2948964vke.0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 02:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9smMGkoTqzgEXMqPvd5kF8P2KQFkuP1eo+R448bCEvE=;
 b=qGrDkPoiOxBVT2yhQ/m3pWaR0L0bMqLqLHZKMkRaQDV8VTTg27H4D2SNaK4HI4qPm7
 IrpPLjceFXHWq49ercjYEWQaAeRv9QabGdWUXFGAeimF33l3RD9hN+9v8S3hntdAsTk9
 qROP7ECw3hbRi8//m3HPaI46Unv8x7qMPr60uZz7yzus+zU+s07Er37wNysaKF+YVwm1
 x4Zkmexu7dRUH9RzMBkW5UIWgD05Xa22WITOyK97HaAsq7P5/dl8L/so2cPdpIdrKMl7
 T2Jnbii2gNk4FyTAHqC7HKzsJsj0q3xVxTyg5Oea2oMuyZWGu99tXsbq3fIgEJy32VQT
 JvJA==
X-Gm-Message-State: APjAAAU4+C/EPIv2elPhulg15U9baYt4rm7jgdEVwo1c9DBhKYv04lnI
 ajgIOcFNaXbDlKvoA4fqaFchKyPrz5h4GkSowIdkRA==
X-Google-Smtp-Source: APXvYqybm4lUoeUadN+2AQpKQEqcZKDh68athVtWmI7aKgPvwQyxtNZwUUlC5A9AClvgEnZuyuwyXkmmGCxLSV/FGGU=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr34896244vks.72.1556616105061; 
 Tue, 30 Apr 2019 02:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
 <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
 <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 17:21:34 +0800
Message-ID: <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
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
Content-Type: multipart/mixed; boundary="===============0294061284=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0294061284==
Content-Type: multipart/alternative; boundary="000000000000fe95800587bbede5"

--000000000000fe95800587bbede5
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 5:08 PM Murphy Zhou <xzhou@redhat.com> wrote:

> ...
> > > > > +       if (fs_type == TST_OVERLAYFS_MAGIC && errno == EINVAL) {
> > > > > +               tst_resm(TCONF, "Swapfile on overlayfs not
> > > implemeted");
> > > > > +                       return;
> > > > > +       }
> > > > >
> > > >
> > > > The code looks correct.
> > > >
> > > > But it already has a test skipping for BTRFS, is there any
> possibility to
> > > > combine these filesystems check together?
> > >
> > > Good idea~  Sending V2.
> > >
> >
> > One more comment.
> >
> > I just noticed that it also has an FS skipping list in setup(), do u
> think
> > can we move BTRFS and OVERLAYFS to there?
>
> Great! That makes perfect sense. Also I'm thinking a few other tweaks
> needed:
>
>   NFS now actually support swapfiles. Let's remove it from skip list;
>

But AFAIK someone still run LTP on old distro/kernel, so we can't guarantee
the test works fine in that situation. So, my opinion is to reserve the
NFS, or do you have a better way to make test more flexible?


>   Skip all swapon/swapoff tests on TMPFS BTRFS OVERLAYFS;
>   Add CIFS_MAGIC, then skip on it too;
>   Remove existing BTRFS return value tweaks.
>

Agree.

-- 
Regards,
Li Wang

--000000000000fe95800587bbede5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 30, 2019 at 5:08 PM Murphy Zhou &lt;<a =
href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defau=
lt" style=3D"font-size:small">...</span><br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_type =3D=3D TST_OVER=
LAYFS_MAGIC &amp;&amp; errno =3D=3D EINVAL) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tst_resm(TCONF, &quot;Swapfile on overlayfs not<br>
&gt; &gt; implemeted&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The code looks correct.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But it already has a test skipping for BTRFS, is there any p=
ossibility to<br>
&gt; &gt; &gt; combine these filesystems check together?<br>
&gt; &gt;<br>
&gt; &gt; Good idea~=C2=A0 Sending V2.<br>
&gt; &gt;<br>
&gt; <br>
&gt; One more comment.<br>
&gt; <br>
&gt; I just noticed that it also has an FS skipping list in setup(), do u t=
hink<br>
&gt; can we move BTRFS and OVERLAYFS to there?<br>
<br>
Great! That makes perfect sense. Also I&#39;m thinking a few other tweaks<b=
r>
needed:<br>
<br>
=C2=A0 NFS now actually support swapfiles. Let&#39;s remove it from skip li=
st;<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">But AFAIK someone still run LTP on old distro/kernel, =
so we can&#39;t guarantee the test works fine in that situation. So, my opi=
nion is to reserve the NFS, or do you have a better way to make test more f=
lexible?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
=C2=A0 Skip all swapon/swapoff tests on TMPFS BTRFS OVERLAYFS;<br>
=C2=A0 Add CIFS_MAGIC, then skip on it too;<br>
=C2=A0 Remove existing BTRFS return value tweaks.<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Agree.</d=
iv></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--000000000000fe95800587bbede5--

--===============0294061284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0294061284==--
