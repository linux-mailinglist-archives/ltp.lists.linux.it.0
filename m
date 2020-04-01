Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFF19AB24
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 13:57:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B6663C3086
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 13:57:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AFD433C3026
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 13:57:40 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0A09014019D9
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 13:57:40 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id x1so9525292plm.4
 for <ltp@lists.linux.it>; Wed, 01 Apr 2020 04:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00QBYlwJfT8z4ipqyKNNXxY/wuR3wYlpL2D9K9zY+FQ=;
 b=JxKYB4M05N1XI+Bv0JyyEq3W3iRrQz5JYB7vJUVFfOKNDCA45dUXXTF8xKYvCwlZht
 SpqxP4ZZrCry9x+Vn1FAF39/uJ/su0Hsj8PmRST7cRDb6w9FitOzsLaoHJYzFW1vYbme
 C4a/6+7pwXSljG15W0JghGD90P8nyCUu9rNPS7OJqolJVJ+sskG5bFcRY+TSIRUJ4FaL
 r3306mihZ0SIpJfeDMaUcfg6qnrWK2FHCSft+nYV2RbdfkCx/ecSUw5KrIBqfVZFmmaO
 GmNdbUmbNL39QoCUFxGsebVYZ1C6VDcywO9aauDEz7atDxMpnnjbkLbk+09btsVNU/No
 Jbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00QBYlwJfT8z4ipqyKNNXxY/wuR3wYlpL2D9K9zY+FQ=;
 b=WFVKRZ9otGjVmuJAouU7hRZG+y7pPj7IChudORnLtBe0O2Hj4qoRnNZycxnFTaTp60
 7EZ2aSH6fFoxnWukxMQ0445v7EGAh+eDBFrAVOXcxUItZvGLLM2pMHop+u6lfYCVLPhK
 jiq7v4tuVc1qDn7c77vNziXCZ7LAZpLp0fVXz/ecthxGELpjaDLE7hMTO5NEVKUGXbuy
 3P17RJqUJxtWP6YVwogH8R90l66lvfxsMgbW9VhxeS4/aaX+1dsOW8no7jxEtPpeYHwo
 sVwjUcc7QNinxPhZ7zd9n/rpSl4SPGRv6OlMgGvKcsmRQ5OgtbthcEF7knF6K1imNtTq
 rPug==
X-Gm-Message-State: AGi0PubLD9I+YC9rVVEjk5MCpqB7DhPY+iNML1RR2ExCogN+FenylPOG
 obcAikTWiuX9+OX34oRkHp+xI1WoeE+yFK1P9Nw=
X-Google-Smtp-Source: APiQypLHvmA8gg6V1PMKRy+k6FNeV0c1b0qLr5W7OEUEMJFQKr4z03bLB4VgsHcaVkCI/ILPGG2FMmiDFzMd+xwatlM=
X-Received: by 2002:a17:90a:25c6:: with SMTP id
 k64mr4374886pje.9.1585742258492; 
 Wed, 01 Apr 2020 04:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
In-Reply-To: <20200331180816.GE2900@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 1 Apr 2020 19:57:02 +0800
Message-ID: <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0574170612=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0574170612==
Content-Type: multipart/alternative; boundary="00000000000005d92005a2396446"

--00000000000005d92005a2396446
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>If I understand this properly if we set a bit in the modem control
>register we will test mostly the circuits between CPU and UART
>controller which is better than nothing, but we are not really testing
>if the port speed was set correctly since the data are just being copied
>between registers in the UART controller, so it does not make sense to
>change the speed in this mode. Or am I mistaken?

>Also it does not seem to work for me and I've tried with both serial
>ports on my desktop PC as well as with USB-to-Serial dongle. I can set
>the bit just fine but loopback does not work.

In the loopback mode , the data will be transferred in buffer ,and back to
CPU
by FIFO way.
I understand the test flow is CPU->uart Tx-> buffer file->uart Rx->CPU,
so it does make sense to the uart driver .
 BTW=EF=BC=8C I found the latest seriacheck git is
https://github.com/nsekhar/serialcheck.git
and I test on my arm64 machine of sprdtream. and it does works.
the test log I had send in another patch
https://patchwork.ozlabs.org/patch/1264553/


Cyril Hrubis <chrubis@suse.cz> =E4=BA=8E2020=E5=B9=B44=E6=9C=881=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=882:08=E5=86=99=E9=81=93=EF=BC=9A

> Hi!
> > > Thank you porting the serialcheck.c into LTP
> > > I am sorry to find the serialcheck have not LOOPBACK mode support
> > > the LOOPBACK mode is a better test than HW flow , because most
> machine's
> > > uart have not connect the Rx & TX
> > > in LOOPBACK mode. we test the uart port directly, So we can test one
> uart
> > > port Rx and Tx functions at the same time .
> > > here is the diff  serialcheck with loopback patch
> > > So I'd prefer use loopback mode test the uart in case.
> > > $ diff serialcheck.c serialcheck-with-loopback.c
> >
> > Thanks for the hint, I had no idea that subset serial port hardware has
> > a loopback test that could be enabled in modem control register which i=
s
> > meant for testing. I will have a closer look tomorrow.
>
> If I understand this properly if we set a bit in the modem control
> register we will test mostly the circuits between CPU and UART
> controller which is better than nothing, but we are not really testing
> if the port speed was set correctly since the data are just being copied
> between registers in the UART controller, so it does not make sense to
> change the speed in this mode. Or am I mistaken?
>
> Also it does not seem to work for me and I've tried with both serial
> ports on my desktop PC as well as with USB-to-Serial dongle. I can set
> the bit just fine but loopback does not work.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--00000000000005d92005a2396446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>&gt;If I understand this properly if w=
e set a bit in the modem control<br>&gt;register we will test mostly the ci=
rcuits between CPU and UART<br>&gt;controller which is better than nothing,=
 but we are not really testing<br>&gt;if the port speed was set correctly s=
ince the data are just being copied<br>&gt;between registers in the UART co=
ntroller, so it does not make sense to<br>&gt;change the speed in this mode=
. Or am I mistaken?<br><br>&gt;Also it does not seem to work for me and I&#=
39;ve tried with both serial<br>&gt;ports on my desktop PC as well as with =
USB-to-Serial dongle. I can set<br>&gt;the bit just fine but loopback does =
not work.=C2=A0</div><div>=C2=A0<br></div><div>In the loopback mode , the d=
ata will be transferred in buffer ,and back to CPU=C2=A0</div><div>by FIFO =
way.=C2=A0=C2=A0</div><div>I understand the test flow is CPU-&gt;uart Tx-&g=
t; buffer file-&gt;uart Rx-&gt;CPU,</div><div>so it does make sense to the =
uart driver .</div><div>=C2=A0BTW=EF=BC=8C=C2=A0I found the latest seriache=
ck git is=C2=A0<a href=3D"https://github.com/nsekhar/serialcheck.git">https=
://github.com/nsekhar/serialcheck.git</a></div><div>and I test on my arm64 =
machine of sprdtream. and it does works.</div><div>the test log I had send =
in another patch</div><div><a href=3D"https://patchwork.ozlabs.org/patch/12=
64553/">https://patchwork.ozlabs.org/patch/1264553/</a>=C2=A0</div><div>=C2=
=A0<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@su=
se.cz</a>&gt; =E4=BA=8E2020=E5=B9=B44=E6=9C=881=E6=97=A5=E5=91=A8=E4=B8=89 =
=E4=B8=8A=E5=8D=882:08=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Thank you porting the serialcheck.c into LTP<br>
&gt; &gt; I am sorry to find the serialcheck have not LOOPBACK mode support=
<br>
&gt; &gt; the LOOPBACK mode is a better test than HW flow , because most ma=
chine&#39;s<br>
&gt; &gt; uart have not connect the Rx &amp; TX<br>
&gt; &gt; in LOOPBACK mode. we test the uart port directly, So we can test =
one uart<br>
&gt; &gt; port Rx and Tx functions at the same time .<br>
&gt; &gt; here is the diff=C2=A0 serialcheck with loopback patch<br>
&gt; &gt; So I&#39;d prefer use loopback mode test the uart in case.<br>
&gt; &gt; $ diff serialcheck.c serialcheck-with-loopback.c<br>
&gt; <br>
&gt; Thanks for the hint, I had no idea that subset serial port hardware ha=
s<br>
&gt; a loopback test that could be enabled in modem control register which =
is<br>
&gt; meant for testing. I will have a closer look tomorrow.<br>
<br>
If I understand this properly if we set a bit in the modem control<br>
register we will test mostly the circuits between CPU and UART<br>
controller which is better than nothing, but we are not really testing<br>
if the port speed was set correctly since the data are just being copied<br=
>
between registers in the UART controller, so it does not make sense to<br>
change the speed in this mode. Or am I mistaken?<br>
<br>
Also it does not seem to work for me and I&#39;ve tried with both serial<br=
>
ports on my desktop PC as well as with USB-to-Serial dongle. I can set<br>
the bit just fine but loopback does not work.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--00000000000005d92005a2396446--

--===============0574170612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0574170612==--
