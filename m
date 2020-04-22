Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 306EF1B3C64
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:05:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E09DF3C297A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 12:05:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BD4E73C2963
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:05:27 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 01C341A00EFF
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 12:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A63xHJwE3SocJvXoOCawXnsOzfBUMlZ60ThhY9XuO1g=;
 b=iyinmZGbzFj7Rn/bcTsyQaF4C/q+4s8GVxUED560RxOvjIBf9zyAJgxt0eh1okGQkeDB3/
 +AuIUBdGToJWaNqvszxvv4JJZPtIGiYJwi4hyCNtdgazSVj322zMolxTwXiJZKy8bd0tCj
 x0v11XERx5QnDYj+uyybWHFAIJvVO9g=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-LySsirw2NnmiyuBQAVAC3A-1; Wed, 22 Apr 2020 06:05:21 -0400
X-MC-Unique: LySsirw2NnmiyuBQAVAC3A-1
Received: by mail-lj1-f197.google.com with SMTP id e19so258034ljb.3
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 03:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A63xHJwE3SocJvXoOCawXnsOzfBUMlZ60ThhY9XuO1g=;
 b=f3Y5xAbe3KHGrZzNO7FwI+5N686q0lgMzJ43mcYU/w/Lbqg1j9dAvnHjvJ2W6fu/ai
 T+m0ahUTPaKJAo3Wd/ym+Uc2XmElskgdCJq8pXJmt3xOzuQzR5VaMlug4GHXFwV3fsP8
 BtoTM5pRQ6I4s+u8OErKgS3o1UZwuPSfebPx7a47GMBsEB7d850uxUV38XSt3waEofTF
 e762l+AcWUgk9XcBXaB+U7W9tyjSLwCPo9aJ83VFACH0h+ae+NHSK6auOwBAPaOqHHL4
 Ur2sF2AQKqUD5nZb2eH1cwQCGgDeW70RptmOY1zAq6hm8vmNpIxhJmume9Usndrpx5Qv
 ITBg==
X-Gm-Message-State: AGi0PuZGFeoJk6soK3coFUqqBAoBxjfVbDKxQwloEcxYOm+bqRGWgkIP
 q0VYuWzUifPrKPphgofI3ahpRQ3RvhQ4g6wl8lXN0MsZovbozn9thvxSPCzkSeg0y66M6R1dj0O
 kYZBH7F30vjddo4TTUgpHcnGMeao=
X-Received: by 2002:a19:ee11:: with SMTP id g17mr16413326lfb.42.1587549919278; 
 Wed, 22 Apr 2020 03:05:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypI0m8f9Rk7TIaezrfyJ625Rlvq7F/a4w7UibTFufheD30Q7lqYfyapgZ992WkfrDtCgcFp3snyGZBdFJ0EgOsE=
X-Received: by 2002:a19:ee11:: with SMTP id g17mr16413310lfb.42.1587549919057; 
 Wed, 22 Apr 2020 03:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
 <be1c1761-c518-f3ee-ef19-b4f45d36df80@cn.fujitsu.com>
 <CAEemH2dj8vdicU76ewAAECgrEmVaEGN5uMZ4EmnzUa1v+Ez9Ng@mail.gmail.com>
 <53bb4ba1-0e68-4abb-39fd-9e661ed38754@cn.fujitsu.com>
 <1f29b873-b256-b475-87c5-83378017aa39@cn.fujitsu.com>
 <20f5e406-f430-79ba-f911-015247e73d0d@cn.fujitsu.com>
In-Reply-To: <20f5e406-f430-79ba-f911-015247e73d0d@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Apr 2020 18:05:06 +0800
Message-ID: <CAEemH2d6ObRfR12xvfpmE9KtTakobzvt6_md=Xrmd_rbKB7oAA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0174338231=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0174338231==
Content-Type: multipart/alternative; boundary="000000000000fd321105a3de443f"

--000000000000fd321105a3de443f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 5:31 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> >>> I think I got the point.
> >>>
> >>> In your test code for pipe2(), you didn't use pipe in the correct
> >>> way. Even that we define the fds[2] as a global variable, there still
> >>> have a new copy for fds[2] in the child process, we should close one
> >>> of the pipes in child and parent to make the connection is built
> >>> correspondingly, then that will work normally for us.
> >>>
> >>> I suggest redesigning some of the test structs. What do you think?
> >> Yes.
> >>>
> >>> Fyi:
> >>>
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sy=
scalls/pipe/pipe02.c
> >
> > BTW, pipe02.c can use SAFE_PIPE macro and remove  UCLINUX ifdef.
> >>>
> >> In principle, we should use the following format
> >> step1      pipe(fds);
> >> step2      SAFE_FORK();
> >>        child process
> >> step3         close one fd and do something
> >>        parent process
> >> step4         close another fd and do something
> >>
> >> Also, we should not do write opeartion in step 1~2, otherwise child
> >> process will inherit data.
> modify this case ,url as below:
>
> https://github.com/xuyang0410/ltp/commit/6e701803b39123b5abf74bd292c36fee=
73b54065
>
> How about it=EF=BC=9F
>

I leave comment in your patch in github. Thanks for the quick fix, the rest
LGTM.

Can you rebase the code on the latest master and format V4 patch to ML?

--=20
Regards,
Li Wang

--000000000000fd321105a3de443f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 22, 2020 at 5:31 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt;&gt;&gt; I think I got the point.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In your test code for pipe2(), you didn&#39;t use pipe in the =
correct <br>
&gt;&gt;&gt; way. Even that we define the fds[2] as a global=C2=A0variable,=
 there still <br>
&gt;&gt;&gt; have a new copy for fds[2] in the child process, we should clo=
se one <br>
&gt;&gt;&gt; of the pipes in child and parent to make the connection is bui=
lt <br>
&gt;&gt;&gt; correspondingly, then that will work normally for us.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I suggest redesigning some of the test structs. What do you th=
ink?<br>
&gt;&gt; Yes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Fyi: <br>
&gt;&gt;&gt; <a href=3D"https://github.com/linux-test-project/ltp/blob/mast=
er/testcases/kernel/syscalls/pipe/pipe02.c" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/linux-test-project/ltp/blob/master/testcases/kerne=
l/syscalls/pipe/pipe02.c</a> <br>
&gt; <br>
&gt; BTW, pipe02.c can use SAFE_PIPE macro and remove=C2=A0 UCLINUX ifdef.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt; In principle, we should use the following format<br>
&gt;&gt; step1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipe(fds);<br>
&gt;&gt; step2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SAFE_FORK();<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 child process<br>
&gt;&gt; step3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close one fd=
 and do something<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent process<br>
&gt;&gt; step4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close anothe=
r fd and do something<br>
&gt;&gt;<br>
&gt;&gt; Also, we should not do write opeartion in step 1~2, otherwise chil=
d <br>
&gt;&gt; process will inherit data.<br>
modify this case ,url as below:<br>
<a href=3D"https://github.com/xuyang0410/ltp/commit/6e701803b39123b5abf74bd=
292c36fee73b54065" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xuyang0410/ltp/commit/6e701803b39123b5abf74bd292c36fee73b54065</a><br>
<br>
How about it=EF=BC=9F<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">I leave comment=C2=A0in your patch in=
=C2=A0github. Thanks for the quick fix, the rest LGTM.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Can you rebase the code on the latest master =
and format V4 patch to ML?</div></div></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div></div>

--000000000000fd321105a3de443f--


--===============0174338231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0174338231==--

