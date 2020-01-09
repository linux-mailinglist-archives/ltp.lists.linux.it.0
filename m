Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADE13596A
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:41:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82FE03C2498
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:41:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AF02D3C1115
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:41:35 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D67821A00923
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578573692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6L2UinJ3A6uLOYWe3K9Z7pmrcI6pK0Nqi1Ru//NA5I8=;
 b=Axm5vPz6BBPo3g1stCNJ6mMxXX6e6BxZu+QEsNNTf3Aew1q4rgJGCBGksVuDZwi1AxR2+7
 11tCfZhQu9GHJ6GzsguTbj3ZpOOwVCoiet16CKLh8pI0MqBrkry5vtr3/E+259jclUnK+w
 HXpI2njPyHbVPn5EQ1oqd6bF9EwEfvE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-7Clz9nV6NOCMbUiXkWvMPg-1; Thu, 09 Jan 2020 07:41:31 -0500
Received: by mail-ot1-f70.google.com with SMTP id v14so3602490otf.12
 for <ltp@lists.linux.it>; Thu, 09 Jan 2020 04:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6L2UinJ3A6uLOYWe3K9Z7pmrcI6pK0Nqi1Ru//NA5I8=;
 b=thiSmdqoWBm6XHMaSOOGPaJbxWTPIIeYZNTS0ADGe97Tbfn+7EqIt5py/k2b4Lv9gO
 iaNylYQHTHUKWsPBXOVZu1hy95K3tYDzF/FD+PEFTkb5o/oOIGUCAbP4DXI2AZvoOv2b
 mW7BgX/4X3KIIKuqsF5uktUoAzDaV3Vvs9wScNPrX0fXcMZiLrn3xvTmm1GtZNy1UnDy
 rcCy4TiQ/ISV7JsN+faV3NsVpSKoQ9rU0BU9VmW32H6MvuAOhJu3bovFDbFiGFaMU2H7
 uNMfOycj1DfUHuKrUETSj+6YTg/aTHLjg9W65uWn8gETdz7Ulf6UdKKLw6+mIEPEjWcX
 vNhQ==
X-Gm-Message-State: APjAAAUoA12Sn3+QR37GR7Y7aLrEu6WVC+Vi7zi3DHUcW5+dn9grrtPs
 geRAkvgor+uNHD68XL11/RCbcte2+Q8QrmCakWKBntkbzAwYho0oKpZwF20UxLlwJ8T8FcybQ+h
 oCc+CvAbV3Gnh9quKo1E1b6tIODU=
X-Received: by 2002:a9d:7:: with SMTP id 7mr7790985ota.26.1578573690738;
 Thu, 09 Jan 2020 04:41:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6LK93aPllbHucxO3wilKv48kdSrF2tRHZf6ilFWlw87hszmuyov/xMujzkD5fUVYIk6CTxuaUnnwaChAiQ+k=
X-Received: by 2002:a9d:7:: with SMTP id 7mr7790975ota.26.1578573690551; Thu,
 09 Jan 2020 04:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109095239.GB31981@rei.lan>
In-Reply-To: <20200109095239.GB31981@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 Jan 2020 20:41:19 +0800
Message-ID: <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: 7Clz9nV6NOCMbUiXkWvMPg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
Content-Type: multipart/mixed; boundary="===============1980794803=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1980794803==
Content-Type: multipart/alternative; boundary="00000000000013d8f5059bb454da"

--00000000000013d8f5059bb454da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 5:52 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > +#define _GNU_SOURCE
> >  #include <unistd.h>
> > +#include <sys/syscall.h>
>
> Defining _GNU_SOURCE anywhere but at the top of the test source is
> meaningless. It has to be defined before we include any libc headers
> otherwise it's ignored.
>

I got the point. And yes, that means the definition should be removed from
the tst_device.h header file.


> >  /*
> > diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > index 2af040840..f5d7ca8ac 100644
> > --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > @@ -20,6 +20,7 @@
> >   *   None
> >   */
> >
> > +#define _GNU_SOURCE
> >  #define _XOPEN_SOURCE 600
> >  #include <fcntl.h>
>
> Why do we need the _GNU_SOURCE here? We switched to a syscall() in the
> header, hence we do not need the syncfs() prototype anymore.
>
>
But shouldn't we define the _GNU_SOURCE for syscall()?  Otherwise,
the _XOPEN_SOURCE 600 definitions will take effect and makes the compiler
print new errors[1].

Here I fee a little confused, or do we need to delete the _XOPEN_SOURCE
definition directly for the test posix_fadvise01.c?

[1]:
gcc -Werror=3Dimplicit-function-declaration -g -O2 -fno-strict-aliasing -pi=
pe
-Wall -W -Wold-style-definition
 -I/root/ltp2/testcases/kernel/syscalls/fadvise
-I/root/ltp2/testcases/kernel/syscalls/fadvise/../utils
-I../../../../include -I../../../../include -I../../../../include/old/
-L../../../../lib  posix_fadvise01.c   -lltp -o posix_fadvise01
In file included from ../../../../include/tst_test.h:22,
                 from posix_fadvise01.c:31:
../../../../include/tst_device.h: In function =E2=80=98tst_dev_sync=E2=80=
=99:
../../../../include/tst_device.h:82:9: error: implicit declaration of
function =E2=80=98syscall=E2=80=99; did you mean =E2=80=98strcoll=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
  return syscall(__NR_syncfs, fd);
         ^~~~~~~
         strcoll

--=20
Regards,
Li Wang

--00000000000013d8f5059bb454da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 5:52 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; +#define _GNU_SOURCE<br>
&gt;=C2=A0 #include &lt;unistd.h&gt;<br>
&gt; +#include &lt;sys/syscall.h&gt;<br>
<br>
Defining _GNU_SOURCE anywhere but at the top of the test source is<br>
meaningless. It has to be defined before we include any libc headers<br>
otherwise it&#39;s ignored.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I got the point. And yes, that=
 means the definition=C2=A0should be removed=C2=A0from the tst_device.h hea=
der file.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt;=C2=A0 /*<br>
&gt; diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c b/tes=
tcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
&gt; index 2af040840..f5d7ca8ac 100644<br>
&gt; --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
&gt; +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0None<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; +#define _GNU_SOURCE<br>
&gt;=C2=A0 #define _XOPEN_SOURCE 600<br>
&gt;=C2=A0 #include &lt;fcntl.h&gt;<br>
<br>
Why do we need the _GNU_SOURCE here? We switched to a syscall() in the<br>
header, hence we do not need the syncfs() prototype anymore.<br><br></block=
quote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>But shouldn&#39;t we define the _GNU_SOURCE for syscall()?=C2=A0 Otherwise=
, the=C2=A0_XOPEN_SOURCE 600 definitions will=C2=A0take effect and makes th=
e compiler print new errors[1].</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Here I fee a little confused, or do we need to delete the=C2=A0_XOPE=
N_SOURCE definition directly for the test posix_fadvise01.c?</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">[1]:</div><div class=3D"gmail_default" =
style=3D"font-size:small">gcc -Werror=3Dimplicit-function-declaration -g -O=
2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition =C2=A0-I/root/=
ltp2/testcases/kernel/syscalls/fadvise -I/root/ltp2/testcases/kernel/syscal=
ls/fadvise/../utils -I../../../../include -I../../../../include -I../../../=
../include/old/ =C2=A0 -L../../../../lib =C2=A0posix_fadvise01.c =C2=A0 -ll=
tp -o posix_fadvise01<br>In file included from ../../../../include/tst_test=
.h:22,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fro=
m posix_fadvise01.c:31:<br>../../../../include/tst_device.h: In function =
=E2=80=98tst_dev_sync=E2=80=99:<br>../../../../include/tst_device.h:82:9: e=
rror: implicit declaration of function =E2=80=98syscall=E2=80=99; did you m=
ean =E2=80=98strcoll=E2=80=99? [-Werror=3Dimplicit-function-declaration]<br=
>=C2=A0 return syscall(__NR_syncfs, fd);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcoll</div></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"></div><div><br></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--00000000000013d8f5059bb454da--


--===============1980794803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1980794803==--

