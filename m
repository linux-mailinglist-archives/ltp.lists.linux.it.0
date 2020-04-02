Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AA19C004
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:17:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 274D33C3004
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:17:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 449723C14B2
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:17:10 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0083A1A014BC
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:17:09 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id c12so1225891plz.2
 for <ltp@lists.linux.it>; Thu, 02 Apr 2020 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBS5+OPgWaNor3OhM5Y4DzuvkIQYGaQxeqCX8pYLDE0=;
 b=BwDWfQlfoF8PwZrpYMuYLxAGo/cavxJL5hB2KloC9AVUQfsaiHMyl0z6/fKpv1viww
 sS3g0pnSHSqm0ULPKMATBCeQhJTtP7Dikf7KUdCUAk9/w6EQJpToSx+c/Fsat2UsoX1B
 CcP7mZ76keEMHE4KjcHaBJAFNFv4iswPwFjtCDutbuAMLqdvWcrE7AdMEoKRUrv8o6mE
 eepsB1IsdmLWFWi7PIew9x8bQNPa6Uk773FSlPAZC5KRIq1ni9WiYeJjZNgC2aBrkOWt
 t5EKX/+OehkAL2GHSfP+eHCHWdeAHh08YWKi4A9228njVhB57Hh+aSUyQTteEQd/alBn
 WWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBS5+OPgWaNor3OhM5Y4DzuvkIQYGaQxeqCX8pYLDE0=;
 b=ga4ITnHE6FAQGENAlD7ZBr4gJcFJjtzNuJgF8uaQaBITnaJScE1nBfOQRgv6wPuAWX
 qlWzVi7ZIonat4z3bRafJg+meQc3yZx+AsqC3n5Ttix8q78z10Y4/WwJxJ0IbX8a4iqV
 5tfn1qLaElCX4ftCD/5Ir8G17qHOWK3PkiRFUNHFpa6IWq90j9DXRB3vIyTn/F+lR0lc
 Y8aBVxaInOuy3vluPIQmNYykSU8vQDGt/lKlcJLbO+v9RKCWyPJeiONHOkJ4KSOgaXFi
 WgMv72QzFIRnDd9drk4FdXq3BhW3+jaV699Lr08oNvkg8zBz9CjR3gDVyknLd4Ejtjb+
 owjQ==
X-Gm-Message-State: AGi0PuYheDIhrDzK2pZDiUvufCUjPciWZFAHPYep8d20mLghrg+1A4Ms
 1P0ldfawgRmsKHNW/IO4auoFAi51LA2i67BSOio=
X-Google-Smtp-Source: APiQypJZ47KbcJSibTG40whCAV85M69KXHiDdIuxTZPG0wX8b+pJzE/Tz0rd1zydIHXtkpBa3portJ6q1P1wb2/Lk8s=
X-Received: by 2002:a17:902:7788:: with SMTP id o8mr2585374pll.9.1585826228464; 
 Thu, 02 Apr 2020 04:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
In-Reply-To: <20200402093127.GA28452@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Thu, 2 Apr 2020 19:16:32 +0800
Message-ID: <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Orson Zhai <orsonzhai@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Carlos Hernandez <ceh@ti.com>
Content-Type: multipart/mixed; boundary="===============1594579695=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1594579695==
Content-Type: multipart/alternative; boundary="00000000000005f19805a24cf16b"

--00000000000005f19805a24cf16b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
I am sorry that when I run the serialcheck on my laptop,
there always has some error as follow,which mean I cannot
verify the serialcheck on my computer for now.
Failed to ioctl(,TIOCGICOUNT,)  -- test ttyUSB0
tcgetattr() failed: Input/output error -- test ttyS0
I am trying to find available machine and then run test.

Cyril Hrubis <chrubis@suse.cz> =E4=BA=8E2020=E5=B9=B44=E6=9C=882=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:31=E5=86=99=E9=81=93=EF=BC=9A

> Hi!
> > >Indeed but it does not make sense tu run it with a different baud rate=
s,
> > >since the data are not transmitted at all.
> > The data exchanged between Tx|Rx and buffer have nothing to do with
> > baudrate?
> > I think the baudrate is control Tx|Rx send and receive date rate to|fro=
m
> > buffer.
>
> That's what I'm not sure about, the documentation says that in loopback
> mode data written to the port immediatelly appears on the receiving end,
> which would mean that the uart speed does not matter at all.
>
> Can you try a quick test? If you measure the time the test spends
> writing data in loopback mode for a different uart speeds and they do
> not differ the uart speed does not matter.
>
> > >Unfortunately it does not seem to work on my AMD based desktop at all,
> > >my guess is that the loopback bit is silently ignored by the hardware.
> > >Which means that we cannot enable the test by default in loopback mode
> > >after all
> > I will test on my laptop and feedback result today, if it does no work =
,
> we
> > should check the uart driver what different between x86 and arm64.
>
> I bet that this differs chipset by chipset and I do not think there is
> anything wrong with the uart driver per se.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--00000000000005f19805a24cf16b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div>I am sorry that when I run the serialcheck on=
 my laptop,=C2=A0</div><div>there always has some error as follow,which mea=
n I cannot</div><div>verify the serialcheck on my computer for now.=C2=A0</=
div><div>Failed to ioctl(,TIOCGICOUNT,)=C2=A0 -- test ttyUSB0<br>tcgetattr(=
) failed: Input/output error -- test ttyS0</div><div>I am trying to find av=
ailable=C2=A0machine and then run test.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Cyril Hrubis &lt;<a href=3D"ma=
ilto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; =E4=BA=8E2020=E5=B9=B44=E6=9C=
=882=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:31=E5=86=99=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt;Indeed but it does not make sense tu run it with a different baud =
rates,<br>
&gt; &gt;since the data are not transmitted at all.<br>
&gt; The data exchanged between Tx|Rx and buffer have nothing to do with<br=
>
&gt; baudrate?<br>
&gt; I think the baudrate is control Tx|Rx send and receive date rate to|fr=
om<br>
&gt; buffer.<br>
<br>
That&#39;s what I&#39;m not sure about, the documentation says that in loop=
back<br>
mode data written to the port immediatelly appears on the receiving end,<br=
>
which would mean that the uart speed does not matter at all.<br>
<br>
Can you try a quick test? If you measure the time the test spends<br>
writing data in loopback mode for a different uart speeds and they do<br>
not differ the uart speed does not matter.<br>
<br>
&gt; &gt;Unfortunately it does not seem to work on my AMD based desktop at =
all,<br>
&gt; &gt;my guess is that the loopback bit is silently ignored by the hardw=
are.<br>
&gt; &gt;Which means that we cannot enable the test by default in loopback =
mode<br>
&gt; &gt;after all<br>
&gt; I will test on my laptop and feedback result today, if it does no work=
 , we<br>
&gt; should check the uart driver what different between x86 and arm64.<br>
<br>
I bet that this differs chipset by chipset and I do not think there is<br>
anything wrong with the uart driver per se.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--00000000000005f19805a24cf16b--

--===============1594579695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1594579695==--
