Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69730E53
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:46:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F012390284
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:46:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6FF183EA13F
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:46:32 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 197901001271
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:46:27 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id f20so2132554ual.0
 for <ltp@lists.linux.it>; Fri, 31 May 2019 05:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtpK+4zqTjjvZOLEOSUXjOnNSig2At3iZ1Cc3kRV5iw=;
 b=njxtEuh/JTy0sfZOTooTEVrU1JH8y3C4HGbkY+2PVRqbGEV97PD2LcMI5NH1PlUZJQ
 U56mH1aK0Mk2ALfi83Gbn9GIv/5OO16SE6THrkvs6in+Shvamx4sgnl7wDM8LnjRJalU
 oCsJuSBNmssAhHpZ3o4QsPvlWd4T8cvUqGDmZirqn1ZPMMBjJPyV3bexlNhCMQc2n5Px
 TBJ4HlxC0UkVbyjAdD9fyrMnkLa0wNdloDd2GK4Nseimv20KuB1jgvmPHx+rSqwtgQ+N
 GZtaTb8hQr8wlP5EXDLfGG87AiwzioG+zazbpzR97AidG8PDXLeDIAxCgT606UMtlF6i
 2F+Q==
X-Gm-Message-State: APjAAAUEHnEESw+is6vMVlj1GDKv1TYKHOkUwzzn7HM+lB66Rk4EdSOg
 LX8Z+FsO1KSkGz8T0aS8pzedn+c9VqqleLMhmYtG42bNiznQwA==
X-Google-Smtp-Source: APXvYqw+FTMahYAZHda/USGUOK2er3jggltBbxIAmLwuL5ZuevzPhM+Cw1/ownOW6SPNCv2R324rUV786S8YJQcYjUY=
X-Received: by 2002:ab0:985:: with SMTP id x5mr2455993uag.89.1559306789456;
 Fri, 31 May 2019 05:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
 <20190531122630.GA12608@rei.lan>
In-Reply-To: <20190531122630.GA12608@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 20:46:16 +0800
Message-ID: <CAEemH2cFvnOxhk3v8FEZyEX9rH_9nSL1fuVXk0oQGtTJkwOkYw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0232725667=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0232725667==
Content-Type: multipart/alternative; boundary="000000000000482ce2058a2e6738"

--000000000000482ce2058a2e6738
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 8:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > I have no objection on this. But, is there really make sense to test some
> > more non regular files which not being mentioned by Linux Manual Page?
> >
> > The copy_file_range02 test errors are all extract from manual page, I
> > commented that in Christian's first patch version. And I don't think it's
> > necessary to test undefined behavior in syscall using, because how do we
> > know what error return is the expected?
>
> That's not undefined that's undocummented at best. The kernel code for
> vfs_copy_file_range does:
>
>         if (S_ISDIR(inode_in->i_mode) || S_ISDIR(inode_out->i_mode))
>                 return -EISDIR;
>         if (!S_ISREG(inode_in->i_mode) || !S_ISREG(inode_out->i_mode))
>                 return -EINVAL;
>
> Which means that directories are treated as special here and all other file
> descriptors that are not regular files are supposed to fail with EINVAL.
>

Yeah, Indeed true.


> So as far as I can tell it makes sense to pass a pipe fd for example and
> check
> for EINVAL. And we should do that both for in_fd and out_fd as well.
>

Sounds reasonable. Thanks for the explanation.

-- 
Regards,
Li Wang

--000000000000482ce2058a2e6738
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 31, 2019 at 8:26 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; I have no objection on this. But, is there really make sense to test s=
ome<br>
&gt; more non regular files which not being mentioned by Linux Manual Page?=
<br>
&gt; <br>
&gt; The copy_file_range02 test errors are all extract from manual page, I<=
br>
&gt; commented that in Christian&#39;s first patch version. And I don&#39;t=
 think it&#39;s<br>
&gt; necessary to test undefined behavior in syscall using, because how do =
we<br>
&gt; know what error return is the expected?<br>
<br>
That&#39;s not undefined that&#39;s undocummented at best. The kernel code =
for<br>
vfs_copy_file_range does:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (S_ISDIR(inode_in-&gt;i_mode) || S_ISDIR(ino=
de_out-&gt;i_mode))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EISDIR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!S_ISREG(inode_in-&gt;i_mode) || !S_ISREG(i=
node_out-&gt;i_mode))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
<br>
Which means that directories are treated as special here and all other file=
<br>
descriptors that are not regular files are supposed to fail with EINVAL.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Yeah, Indeed true. </div></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
So as far as I can tell it makes sense to pass a pipe fd for example and ch=
eck<br>
for EINVAL. And we should do that both for in_fd and out_fd as well.<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Sounds reasonable. Thanks for the explanation.</div></div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000482ce2058a2e6738--

--===============0232725667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0232725667==--
