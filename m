Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 353CF1B38F7
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 09:29:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BF593C298E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 09:29:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 68F743C295A
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 09:29:24 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0F5F01000A21
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 09:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587540561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXRlBzBFEE9vW6JkYpsrx+m/3RP3sj3hdiEWjpRaeQE=;
 b=D8coaSdzdWM5ymHRbk0ddBVjhadRwCRfQqxaNDa/YA9np4cKvjbTusA4cnpDEM8NMt21o9
 +/jPCCeyS0ik/xubTF7cdbut9sgdbjNC6KZ1LPZXl7mmqz2WhZOGjKk/kubmDdkm+Zw6ta
 t5XbVJQTmpdlwsuTAA2LDoaNckC+eko=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-lTJXQwRzMLek8S5OHnul9Q-1; Wed, 22 Apr 2020 03:29:18 -0400
X-MC-Unique: lTJXQwRzMLek8S5OHnul9Q-1
Received: by mail-lf1-f69.google.com with SMTP id h18so586588lfm.0
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 00:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4OcwntLk9fQen72RR66EIY8a0m+oHH7W43r8/du/eqY=;
 b=bzzrTZI1Pi4TJqpZGF/w4NjrzkMknMj3xxlcLW1AqonfiznT5vp65xadp0L9DMeEIm
 bESqocPA3+oDn3u8gA/TpbWcUMgHzxSbY0fS82Pa2m62CmAyLd4J4+vw/kfs4AOfLmhG
 aJbmXU3NOOW0zceHfV5JPGu0m667buAVrhuryPLS/J+n/Gk/4fRz3VYScuwKlSdc43Ym
 JPXCyEvKyW2FmY98KkRjzPTX1RkulcbHNkBkRHwfh70XUbFkbIlCwqulfWG84WGIqb4U
 ws+ecoJWpDfLztyR9RZdcKrVic5nfeAGgYePoz6GPrdg7RjkpKimxs9YDOL4rVr1nn2U
 WUMQ==
X-Gm-Message-State: AGi0Pualsw4maNDA+Zv0KXMw7UGuvKsZi3dbEA/9cA0s5ZoPcZHDTiIA
 WQQhuvUp0S4JcBdQOzvnv3HQAngIKaJP/OJ4ASjz96x41HnN8GXlSAMoUxQN+rb49e3Eg7gvyV4
 07GFxP6NvXzdTrpmFqS9CX++wvLk=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr16008948lfm.147.1587540556807; 
 Wed, 22 Apr 2020 00:29:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypIQv2Y9UuDXyQkNRfeJNguwt62SESLcI5Adl30AFm3h1DyjPHPS0+ilCgOi9Xkk6jQUDZ0rLZQfi2A9VDLMc2o=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr16008937lfm.147.1587540556555; 
 Wed, 22 Apr 2020 00:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
In-Reply-To: <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 15:29:04 +0800
Message-ID: <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============0229936081=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0229936081==
Content-Type: multipart/alternative; boundary="000000000000f0c21305a3dc16f7"

--000000000000f0c21305a3dc16f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

...
> >
> > # ./pipe2_03
> > tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> > pipe2_03.c:48: PASS: Each write(2) uses a separate packet
> > pipe2_03.c:61: PASS: Each read(2) reads a separate packet
> > pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple
> packet
> > pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded by
> > read, expect 1 got 1%A
> Even I use one fork and exit(0), I don't meet this problem. Or, I miss
> something?
>

I think I got the point.

In your test code for pipe2(), you didn't use pipe in the correct way. Even
that we define the fds[2] as a global variable, there still have a new copy
for fds[2] in the child process, we should close one of the pipes in child
and parent to make the connection is built correspondingly, then that will
work normally for us.

I suggest redesigning some of the test structs. What do you think?

Fyi:
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sysc=
alls/pipe/pipe02.c

--=20
Regards,
Li Wang

--000000000000f0c21305a3dc16f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr"><span class=3D"gmail_default" style=3D"font-size:=
small">Y</span>ang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" t=
arget=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div =
dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">.=
..</span><br>
&gt; <br>
&gt; # ./pipe2_03<br>
&gt; tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>
&gt; pipe2_03.c:48: PASS: Each write(2) uses a separate packet<br>
&gt; pipe2_03.c:61: PASS: Each read(2) reads a separate packet<br>
&gt; pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple p=
acket<br>
&gt; pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded by <=
br>
&gt; read, expect 1 got 1%A<br>
Even I use one fork and exit(0), I don&#39;t meet this problem. Or, I miss =
<br>
something?<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">I think I got the point.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">In your test code for pipe2(), you didn&=
#39;t use pipe in the correct way. Even that we define the fds[2] as a glob=
al=C2=A0variable, there still have a new copy for fds[2] in the child proce=
ss, we should close one of the pipes in child and parent to make the connec=
tion is built correspondingly, then that will work normally for us.</div></=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I suggest redesigning some=
 of the test structs. What do you think?=C2=A0</div><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Fyi:=C2=A0<a href=3D"ht=
tps://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscal=
ls/pipe/pipe02.c">https://github.com/linux-test-project/ltp/blob/master/tes=
tcases/kernel/syscalls/pipe/pipe02.c</a></div></div><div><br></div></div>--=
 <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--000000000000f0c21305a3dc16f7--


--===============0229936081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0229936081==--

