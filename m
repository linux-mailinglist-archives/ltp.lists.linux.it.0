Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A332A19B9ED
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 03:31:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F25F3C3093
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 03:31:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9D9623C3068
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 03:31:27 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7C5E26010B0
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 03:31:26 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id c138so984025pfc.0
 for <ltp@lists.linux.it>; Wed, 01 Apr 2020 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfyRhRdcIWcWGztTb3ennkIBfXzqKpg9UeuPd2U7hIg=;
 b=d0XeNiJGwpmIM7rJO2Qwgct3aoXxBwWA9+lYNrxk3sMQzleS/he13F0BOYbq7Ub/A+
 6rOhBWotf5nsCvHQ5nEzLMtrIVG/weuESwXENaAQZPfpubSyx73e0+CXbLTi5tPzKrUk
 BXLJz+NJp10HZwGAtei6H1V1g9Hrys4uTD2oA5o+LOFqs9DhexOFxDc6uNT1Wr0KhSCF
 4WLdd/uQtC6hvJopqROYOqvoTi3n28VQul76s0pqd+nwrlrEU9A2yaG3UhEjL3vVM5yp
 jTh6NcS0Nr7iOdm5TffAp877MQ22IpOBfqMECQF/JvVX5aLdrGZdKphG0J72Krgb7JTv
 L1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfyRhRdcIWcWGztTb3ennkIBfXzqKpg9UeuPd2U7hIg=;
 b=gBrsmyu9pXLytuhBWaFJC86/5bQAYhjfD3ABSisSkJVfjYfVTJEXnkIYZcDwFa9s1u
 bKVdGsi+AxTprL2HMt1zBd0HGpChIzWdpwt1BD+xj1jATsziAXwkBwGhfVOBzBpRuR6H
 2o9F6Bl+FDNhI/Iz6gDHCs5WrEK5H3ZfxK+lIzxIrOm1OWP9clwpzMvHQrXQfWXnUf09
 Hp3y8/pgkhe8AJz/DX6luAOZ6/7u3/Vp/POdHbDutw+A25Mk4C2IOx5Meui6hDThY2iX
 8bkvbQz1intD+x/CpQC7dGTVtym82gT3WSvbpFNkoK7JEX1W6P2ep/UIUAC+bJ/SQjCs
 jAsw==
X-Gm-Message-State: AGi0PuYfyCVZOC1upfdwuc0Osn7aRkfK1DgD1TSGVMyEk0Y7wYXp9tj7
 pv8X215S6A8zRHS47GCZEsFNOGHsSQO4WJTxiPc=
X-Google-Smtp-Source: APiQypKq4hgRms/NmD3JxIw+POZTEYBIV+VviqgoB3lhAaxvQWtIPuef0fcjtCNZSFrNmASAjnekSdp/Vzgeu1igmyI=
X-Received: by 2002:aa7:9f11:: with SMTP id g17mr695849pfr.224.1585791085005; 
 Wed, 01 Apr 2020 18:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
In-Reply-To: <20200401131220.GA3627@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Thu, 2 Apr 2020 09:30:48 +0800
Message-ID: <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it,
 Carlos Hernandez <ceh@ti.com>
Content-Type: multipart/mixed; boundary="===============0591278382=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0591278382==
Content-Type: multipart/alternative; boundary="0000000000004f520d05a244c25a"

--0000000000004f520d05a244c25a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Indeed but it does not make sense tu run it with a different baud rates,
>since the data are not transmitted at all.
The data exchanged between Tx|Rx and buffer have nothing to do with
baudrate?
I think the baudrate is control Tx|Rx send and receive date rate to|from
buffer.
>Unfortunately it does not seem to work on my AMD based desktop at all,
>my guess is that the loopback bit is silently ignored by the hardware.
>Which means that we cannot enable the test by default in loopback mode
>after all
I will test on my laptop and feedback result today, if it does no work , we
should
check the uart driver what different between x86 and arm64.

Cyril Hrubis <chrubis@suse.cz> =E4=BA=8E2020=E5=B9=B44=E6=9C=881=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=889:12=E5=86=99=E9=81=93=EF=BC=9A

> Hi!
> > >If I understand this properly if we set a bit in the modem control
> > >register we will test mostly the circuits between CPU and UART
> > >controller which is better than nothing, but we are not really testing
> > >if the port speed was set correctly since the data are just being copi=
ed
> > >between registers in the UART controller, so it does not make sense to
> > >change the speed in this mode. Or am I mistaken?
> >
> > >Also it does not seem to work for me and I've tried with both serial
> > >ports on my desktop PC as well as with USB-to-Serial dongle. I can set
> > >the bit just fine but loopback does not work.
> >
> > In the loopback mode , the data will be transferred in buffer ,and back
> to
> > CPU
> > by FIFO way.
> > I understand the test flow is CPU->uart Tx-> buffer file->uart Rx->CPU,
> > so it does make sense to the uart driver .
>
> Indeed but it does not make sense tu run it with a different baud rates,
> since the data are not transmitted at all.
>
> >  BTW??? I found the latest seriacheck git is
> > https://github.com/nsekhar/serialcheck.git
> > and I test on my arm64 machine of sprdtream. and it does works.
> > the test log I had send in another patch
> > https://patchwork.ozlabs.org/patch/1264553/
>
> Unfortunately it does not seem to work on my AMD based desktop at all,
> my guess is that the loopback bit is silently ignored by the hardware.
>
> Which means that we cannot enable the test by default in loopback mode
> after all.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--0000000000004f520d05a244c25a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Indeed but it does not make sense tu run it with a dif=
ferent baud rates,<br>&gt;since the data are not transmitted at all.=C2=A0=
=C2=A0<br><div>The data exchanged between Tx|Rx and buffer have nothing to =
do with baudrate?</div><div>I think the baudrate=C2=A0is control Tx|Rx send=
 and receive date rate to|from buffer.</div><div>&gt;Unfortunately it does =
not seem to work on my AMD based desktop at all,<br>&gt;my guess is that th=
e loopback bit is silently ignored by the hardware.<br>&gt;Which means that=
 we cannot enable the test by default in loopback mode<br>&gt;after all</di=
v><div>I will test on my laptop and feedback result today, if it does no wo=
rk , we should</div><div>check the uart driver what different between x86 a=
nd arm64.=C2=A0 =C2=A0<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@=
suse.cz">chrubis@suse.cz</a>&gt; =E4=BA=8E2020=E5=B9=B44=E6=9C=881=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=889:12=E5=86=99=E9=81=93=EF=BC=9A<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt;If I understand this properly if we set a bit in the modem control=
<br>
&gt; &gt;register we will test mostly the circuits between CPU and UART<br>
&gt; &gt;controller which is better than nothing, but we are not really tes=
ting<br>
&gt; &gt;if the port speed was set correctly since the data are just being =
copied<br>
&gt; &gt;between registers in the UART controller, so it does not make sens=
e to<br>
&gt; &gt;change the speed in this mode. Or am I mistaken?<br>
&gt; <br>
&gt; &gt;Also it does not seem to work for me and I&#39;ve tried with both =
serial<br>
&gt; &gt;ports on my desktop PC as well as with USB-to-Serial dongle. I can=
 set<br>
&gt; &gt;the bit just fine but loopback does not work.<br>
&gt; <br>
&gt; In the loopback mode , the data will be transferred in buffer ,and bac=
k to<br>
&gt; CPU<br>
&gt; by FIFO way.<br>
&gt; I understand the test flow is CPU-&gt;uart Tx-&gt; buffer file-&gt;uar=
t Rx-&gt;CPU,<br>
&gt; so it does make sense to the uart driver .<br>
<br>
Indeed but it does not make sense tu run it with a different baud rates,<br=
>
since the data are not transmitted at all.<br>
<br>
&gt;=C2=A0 BTW??? I found the latest seriacheck git is<br>
&gt; <a href=3D"https://github.com/nsekhar/serialcheck.git" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/nsekhar/serialcheck.git</a><br>
&gt; and I test on my arm64 machine of sprdtream. and it does works.<br>
&gt; the test log I had send in another patch<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/patch/1264553/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.ozlabs.org/patch/1264553/</a><br>
<br>
Unfortunately it does not seem to work on my AMD based desktop at all,<br>
my guess is that the loopback bit is silently ignored by the hardware.<br>
<br>
Which means that we cannot enable the test by default in loopback mode<br>
after all.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--0000000000004f520d05a244c25a--

--===============0591278382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0591278382==--
