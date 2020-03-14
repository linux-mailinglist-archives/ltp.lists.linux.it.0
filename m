Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F518551C
	for <lists+linux-ltp@lfdr.de>; Sat, 14 Mar 2020 09:02:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2507B3C581F
	for <lists+linux-ltp@lfdr.de>; Sat, 14 Mar 2020 09:02:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E14BB3C0EBE
 for <ltp@lists.linux.it>; Sat, 14 Mar 2020 09:02:09 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 62C6A1002865
 for <ltp@lists.linux.it>; Sat, 14 Mar 2020 09:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584172926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbz0R6AYeGtcC3acsJeeCS9V45hQrZ8cUPhggsgKEkY=;
 b=MbxQkNfhhHVgbTLA7dZSvlH9a7/tLFuT5gYFi8gZ/LXzEuegh0BoPJ7Wx3ViAD8SQFHmgG
 IEiUwQb+RtcUYHDhBoI6YWa6rcNQolnFE56bPsxrnk4+QlbB6OsCcsqBaGjpQEEGm766+I
 4eqe2orbjGAlY5jduch7SlH82J5AFCs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-UoPwzRCGMv2qw0zABDRjqA-1; Sat, 14 Mar 2020 04:01:58 -0400
X-MC-Unique: UoPwzRCGMv2qw0zABDRjqA-1
Received: by mail-ot1-f69.google.com with SMTP id x89so403351otb.12
 for <ltp@lists.linux.it>; Sat, 14 Mar 2020 01:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPyT9DD0K0eVa1hXvIMWmn/vqLvxtUWPrUgTg+tv9pQ=;
 b=d0GkJn87ckwPK2YR0k8vtqhFjA5WRar67gPUIZzQ4tWyWxDBUQ3IjRGoNtwojMOWsC
 gKZva6wE27XB8cHY2hns8RH9RD6TkDknrAKheJluySSsqw1pEXHy5Vvn8X653VavMxK3
 he96QIO5RbktXuaWscdP87MYD9YS2joCFnlq2mVQgIprkckd8lgT/9eujWI5gr/mFVwV
 xeDJYiriQmqwfdkXAtneui1x4wDoCyMhsG6/BiSdCWDHChpzLDM08cbC1LK5n0i+OUdt
 aQYXao9FPL8og0Wp7AtaEYz9h3XRzosxGLvMNt2CYlhWTnLI3uQwaka3pD/10sZi6Ie+
 9EHA==
X-Gm-Message-State: ANhLgQ1c73OfZf6g3R3Wfm0D+P5cWZqF2NW8mtl1LUcCCpJ5yCooTuWH
 bwfP/4ZqwsCRXyj8ZjfpI5G3FsyuSD/PfIQF0zE/av5oUe93vk2hiHGkDU6ktflT9i0KwGnl81K
 yssp3u0vrPwQFdNQhWITuF4b/AeQ=
X-Received: by 2002:a9d:138:: with SMTP id 53mr14569821otu.67.1584172917508;
 Sat, 14 Mar 2020 01:01:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtINLCu+s66rushzZNN4Wy2nPGrq3QCwAXWY1sUh8XrubjbDFgTwA5jGL061VUsC5PETF0jqCt4AP39QcL9CbU=
X-Received: by 2002:a9d:138:: with SMTP id 53mr14569791otu.67.1584172917133;
 Sat, 14 Mar 2020 01:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200313141458.GB21248@dell5510>
In-Reply-To: <20200313141458.GB21248@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Sat, 14 Mar 2020 16:01:45 +0800
Message-ID: <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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
Content-Type: multipart/mixed; boundary="===============0630914087=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0630914087==
Content-Type: multipart/alternative; boundary="000000000000fd2b0705a0cbff54"

--000000000000fd2b0705a0cbff54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

This is a good topic, thanks for kicking off this initiative!

On Fri, Mar 13, 2020 at 10:15 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> I'm sorry, I've raised this question in the past, but it got lost.
> I remember we talked about 2.6 something.
>

Yes, the past discussion is still valuable to us. see:
http://lists.linux.it/pipermail/ltp/2019-May/011990.html


> It'd be good to state publicly the oldest kernel and glibc (or even other
> libc
> versions) we support.  This would allow us to remove some legacy code or
> force
> support for legacy code.
>

Maybe we could also state the oldest GCC version too? Though I haven't seen
any conflict or supporting issue from my side, it helps avoid some
potential error in cross-compilation I guess.

    i.e.  kernel-3.10.0 / glibc-2.17 / gcc-4.8.0


>
> This shouldn't require test to be functional (e.g. for some cases like
> module
> drivers it could be hard), but LTP to be compiled and when
> difficult/impossible
> to achieve this functionality, it could resulted in TCONF (skipped test).
>
+1


>
> I created github issue for this [1], where I put link to this thread, so =
we
> don't loose it again.
>
> Kind regards,
> Petr
>
> [1] https://github.com/linux-test-project/ltp/issues/657
>
>

--=20
Regards,
Li Wang

--000000000000fd2b0705a0cbff54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">This is a good=C2=A0topic, thanks for kicking off this initiative!=C2=A0=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Mar 13, 2020 at 10:15 PM Petr Vorel &lt;<a href=3D"mailto:pvo=
rel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I&#39;m sorry, I&#39;ve raised this question in the past, but it got lost.<=
br>
I remember we talked about 2.6 something.<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Yes, the past dis=
cussion is still valuable to us. see:</div></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><a href=3D"http://lists.linux.it/pipermail/ltp=
/2019-May/011990.html" target=3D"_blank">http://lists.linux.it/pipermail/lt=
p/2019-May/011990.html</a></div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
It&#39;d be good to state publicly the oldest kernel and glibc (or even oth=
er libc<br>
versions) we support.=C2=A0 This would allow us to remove some legacy code =
or force<br>
support for legacy code.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Maybe we could also state the=C2=
=A0oldest GCC version too? Though I haven&#39;t seen any conflict=C2=A0or s=
upporting issue=C2=A0from my side, it helps avoid some potential=C2=A0error=
 in cross-compilation I guess.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">=C2=A0 =C2=A0 i.e.=C2=A0 kernel-<span style=3D"color:rgb(0,0,0);white=
-space:pre-wrap">3.10.0 / glibc-2.17 / gcc-4.8.0</span></div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This shouldn&#39;t require test to be functional (e.g. for some cases like =
module<br>
drivers it could be hard), but LTP to be compiled and when difficult/imposs=
ible<br>
to achieve this functionality, it could resulted in TCONF (skipped test).<b=
r></blockquote><div><span class=3D"gmail_default" style=3D"font-size:small"=
>+1</span></div><div><span class=3D"gmail_default" style=3D"font-size:small=
"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I created github issue for this [1], where I put link to this thread, so we=
<br>
don&#39;t loose it again.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
[1] <a href=3D"https://github.com/linux-test-project/ltp/issues/657" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/is=
sues/657</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000fd2b0705a0cbff54--


--===============0630914087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0630914087==--

