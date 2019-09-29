Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B482C13BC
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 09:14:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05F513C2145
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 09:13:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5378C3C0FE7
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 09:13:53 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id CBE7E200AEC
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 09:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569741229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7GCH540ykkQThxKGk0XTwegeP13BDAM947hxIPi1l4=;
 b=Q2WTMq7LNXVPZDHYcQkODBNUT8LmmhherxGhMrY1pnHDlacdfRdD2UMIXAPle7N6Lf+LkI
 3HBdqH4PWZ/E0+I32gbg3d8y6PaFmeB+vY6l1jd7yzOl+ac2xojF4C0IsLKvxIn4hbcXSE
 +GAufE54aM8bOz4qM5DF0E2ohyGMfEo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-fyzNoJinPD6x7EfTETElTg-1; Sun, 29 Sep 2019 03:13:47 -0400
Received: by mail-oi1-f199.google.com with SMTP id 19so5170881oii.2
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 00:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaQe+0F2IbArs/bIya4+cNfA0uZWsoCwYzwqZQzl2uM=;
 b=jrD36sb8XR3uB9XvAGuFAWKw02mwHGvKB5LGDRVBpjLvQjbr+xuVkB/k0q7jiQMMDU
 8+qRZV5NQXcjycD6kn9ei1yIZi1E8cQ/hQ+W1PHsPYJgM9L6+OwCyBTKqnhPR0r/zQwJ
 Zu5QtFhc5U9oUMTjRCGpMBj3sl5T2UDRuZSQ8YS7sufl+VlS51uHWWeXhb4F6f830DD8
 1LxxCks2IuDI7izgIQQeM4R+JYY1eB3AN9daLT7/FA0RhfSBXj9PCJy1tIXX8jykfgKU
 grth1oUHNjVUdAgFNR6/nZxlglTNt4maRN2dHiCcj3lBJP8UC1fr9+BYJFOp3gSaU+l7
 SO8A==
X-Gm-Message-State: APjAAAXPrs8Nx5v/FYLfoh+jnYqKdaTpLxCJG0jlcDN+I2xICNRF9MXC
 oF/1ZbDOyp+jFPj7DOU/r4q0B7tHxkmZZUnWj97ZUIL6nzT5D/BhHtddyJr8u25/otuwvT3uPre
 s1Qjn/7CQuVD+dJda348EB6Sh8k4=
X-Received: by 2002:a9d:7a55:: with SMTP id z21mr9063643otm.26.1569741226789; 
 Sun, 29 Sep 2019 00:13:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvIK3fmFjjlMH5zABg2gx/X9k7cAZUxEOLUt9gpE53PNc22GkkO2zVPA3mYXFB6bl1edthRAjbdZlH/S5mX4U=
X-Received: by 2002:a9d:7a55:: with SMTP id z21mr9063629otm.26.1569741226503; 
 Sun, 29 Sep 2019 00:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190927034635.28521-1-pengfei.xu@intel.com>
 <CAEemH2dGOcpSmD=BkvQZW=JTtbpkoUSN+tqffkDu+jV=vJsUqA@mail.gmail.com>
 <20190929063455.ympb34kmlmrgxbl2@xpf-desktop>
In-Reply-To: <20190929063455.ympb34kmlmrgxbl2@xpf-desktop>
From: Li Wang <liwang@redhat.com>
Date: Sun, 29 Sep 2019 15:13:35 +0800
Message-ID: <CAEemH2dG-7vsULkUuJSDu8-e-z7abRpBJ88ARPuEqOwM4bt=tA@mail.gmail.com>
To: Pengfei Xu <pengfei.xu@intel.com>
X-MC-Unique: fyzNoJinPD6x7EfTETElTg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] umip_basic_test.c: update umip basic test for new
 kernel v5.4
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2041895637=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2041895637==
Content-Type: multipart/alternative; boundary="0000000000003217490593abdc0d"

--0000000000003217490593abdc0d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Pengfei,

Pengfei Xu <pengfei.xu@intel.com> wrote:

...
> >
> > My concern is that if an LTS distro backports the patch(commit
> e86c2c8b93),
> > then it will break this hardcode kernel-version comparing.
> >
> >
>   Ok, let's wait to confirm umip patch merged into Linux kernel main line=
,
>   and then merge the patch into LTP. :)
>

Sorry, I'm not talking merge time. I mean we have to consider more kernel
distros(RHEL, SLES, Ubuntu) when writing/amending LTP test.

Imagine that, if RHEL8(kernel base on v4.18) backports the kernel
patch(x86/umip: Add emulation (spoofing) for UMIP covered instructions in
64-bit processes) and what will happen after applying your patch in
this umip_basic_test.c test? It will fail since that kernel version is less
than 5.4. We probably need to find a way to solve this issue.

>
> > > +               #endif
> > > +       }
> > > +
> > >         if (WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGSEGV) {
> > > -               tst_res(TPASS, "Got SIGSEGV");
> > > +               tst_res(TPASS, "Got SIGSEGV\n\n");
> > >
> >
> > Why we need two '\n' here?
> >
>   Because it could help to split umip cases in LTP, there are 5 umip case=
s
>   in LTP tests, and we could check each umip case easily in LTP log,
>

It is unnecessary because each test shows TINFO before testing.
  e.g  "umip_basic_test.c:41: INFO: TEST sgdt, sgdt result save at
[0x7fff930bda8e]"

--=20
Regards,
Li Wang

--0000000000003217490593abdc0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Pengfei,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr"><span class=3D"gmail_default"></span>Pengfei=
 Xu &lt;<a href=3D"mailto:pengfei.xu@intel.com" target=3D"_blank">pengfei.x=
u@intel.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"g=
mail_default" style=3D"font-size:small">...</span><br>
&gt; <br>
&gt; My concern is that if an LTS distro backports the patch(commit e86c2c8=
b93),<br>
&gt; then it will break this hardcode kernel-version comparing.<br>
&gt; <br>
&gt; <br>
=C2=A0 Ok, let&#39;s wait to confirm umip patch merged into Linux kernel ma=
in line,<br>
=C2=A0 and then merge the patch into LTP. :)<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"">Sorry, I&#39;m not talking me=
rge time. I mean we have to consider more kernel distros(RHEL, SLES, Ubuntu=
) when writing/amending LTP test.=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D""><br></div><div class=3D"gmail_default" style=3D"">Imagine that, i=
f RHEL8(kernel base on v4.18) backports the kernel patch(x86/umip: Add emul=
ation (spoofing) for UMIP covered instructions in 64-bit processes) and wha=
t will happen after applying your patch in this=C2=A0umip_basic_test.c test=
? It will fail since that kernel version is less than 5.4. We probably need=
 to find a way to solve this issue.</div></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WIFSIGNALED(status) &amp;&am=
p; WTERMSIG(status) =3D=3D SIGSEGV) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(T=
PASS, &quot;Got SIGSEGV&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(T=
PASS, &quot;Got SIGSEGV\n\n&quot;);<br>
&gt; &gt;<br>
&gt; <br>
&gt; Why we need two &#39;\n&#39; here?<br>
&gt; <br>
=C2=A0 Because it could help to split umip cases in LTP, there are 5 umip c=
ases<br>
=C2=A0 in LTP tests, and we could check each umip case easily in LTP log,<b=
r></blockquote><div><br></div></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">It is unnecessary because each test shows TINFO before test=
ing.</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 e.g=
=C2=A0 &quot;umip_basic_test.c:41: INFO: TEST sgdt, sgdt result save at [0x=
7fff930bda8e]&quot;</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_=
-181870375662943215gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--0000000000003217490593abdc0d--


--===============2041895637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2041895637==--

