Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F51938AE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:36:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 139963C4AD1
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:36:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2C07D3C0823
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:36:20 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 08C45200989
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:36:20 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id o12so2010992pjs.2
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 23:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjhbQc1IrRNp3DCNpKIOiPaDZNAdJ5/RBFv6YPUWUlo=;
 b=fuIszAFm1ALRJEr+HRoHZAH5SRqegGNUtU5eB2uYGStuZ00AZfn/497hS0CB/RR6T5
 j8oUxIvzaXzrWNjHGJ4qXDLzYzlQM2vhrPvmBJelI5BJI7AlEZ2ZcxPKnM0m8qzd/H7e
 +dp5lXKG2OGAfAdUEu995u/2hpjfc8avrrDNHU4AuO0bQnOonVgvXGzfxl62LvVo4xSE
 ZYEBklkcZU95POeOZuk6M7Zww86dS/X5/WLekEh8u0NQU0xzQd641PRpvGzM0GdoBrAZ
 iVsnlrYP0dymFBcaTF8tSbOgj9FGLgudkYA5AFk7OuxK6TpGeRF/3ritji/rk+svbo5B
 FCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjhbQc1IrRNp3DCNpKIOiPaDZNAdJ5/RBFv6YPUWUlo=;
 b=FgheSlLu5TZHZJz4Pcys6g4TAqHVC5LzVbz6fTjT7iFeG3nsNMeGLLG+T7z8eStdZr
 +vbVyn6ysOpkDW6QzOqZ2Y4OtkuHDF/qaszYR87s/DE/1vuyj3vLWkcs13PKq9rGyKDT
 EHIVviMU85qP9vqI75+v5sDW6T/6BxZpLCAOpi7jW7QMOx8gYdddWaDdwetyNeh6822/
 3V8o769IkKHTpAK9baiflZ5Fs1l9807kv6aGPLUT7fejx2C7sh1I+lDA07/4aq9ednET
 gxAHskV6PF6r68eGDP8LEc8cnqP8YurqwaRtza1yFuOpFOwNbg+0F/hLdlt9vIizS4qB
 /CAA==
X-Gm-Message-State: ANhLgQ0Hv4Kyveh0uMbVE+5xfQJdm8rLHids1Fz8+/uhyLP3nnIbXwQ/
 1stVIt/j6Wp37d+i5jr+JJWebw4ZPgPApZxcUYo=
X-Google-Smtp-Source: ADFU+vvaPHfPhoGMSaSSUFCoWAjSTjbh+iOiXX2NTHE5pmCI3e/FtnMYG8C7oBvhvZVp0JToHwKeI0eeOL3HdGz6DdY=
X-Received: by 2002:a17:902:a986:: with SMTP id
 bh6mr6163643plb.100.1585204578186; 
 Wed, 25 Mar 2020 23:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200324121742.7130-1-gengcixi@gmail.com>
 <20200325102852.GD5404@yuki.lan> <20200325152821.GA21800@dell5510>
In-Reply-To: <20200325152821.GA21800@dell5510>
From: Cixi Geng <gengcixi@gmail.com>
Date: Thu, 26 Mar 2020 14:35:42 +0800
Message-ID: <CAF12kFv0P4yTVVf-pfXOai8+3urEiWug_dbnTfAXpyfOvzi2ug@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] uart: add uart testcase in kernel
 device-drivers
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
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: multipart/mixed; boundary="===============1091518888=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1091518888==
Content-Type: multipart/alternative; boundary="000000000000c77c8b05a1bc33af"

--000000000000c77c8b05a1bc33af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ALL:
Thank you very much for your guidance,
I will follow your some advises, and try to add serialcheck in next version
but I also have some questions

>We both Cyril and me mentioned that you don't need to use mktemp (+ it'd b=
e
>unnecessary dependency).
Now I knew  TST_NEEDS_TMPDIR  is make a temp direct and cd in it ,
but I need a file contains random data, this file is to used to test the
PORT,
Do you meaning I should creat a normal file use dd ,and named by myself?

>> This is problematic as well, it expects that all ports that are not
>> in-use are loopback connected. This is not true in general case, which
>> means that we cannot add the test to the kernel_misc runtest file as it
>> is because it will fail on most of the systems out there.
>Oh, I didn't realize this obvious thing.
>> We will have to figure out how to pass which ports are interconnected to
>> the test somehow, because that is something that only the user who set
>> up the machine knows.
>Maybe expect user sets it in some variable before running the test? e.g.:
we can decide  which PORT can be test,  But just like Cyril said, we don't
know the machines is run int loopback mode or  HW flow control  mode,
So can I put the testcase tags into two file in the runtest, one is used to
test
loopback mode, and the other is test for   HW flow control  ?
runtest/uart-loopback
runtest/uart-HWflow

Petr Vorel <pvorel@suse.cz> =E4=BA=8E2020=E5=B9=B43=E6=9C=8825=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8811:28=E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> > This is problematic as well, it expects that all ports that are not
> > in-use are loopback connected. This is not true in general case, which
> > means that we cannot add the test to the kernel_misc runtest file as it
> > is because it will fail on most of the systems out there.
> Oh, I didn't realize this obvious thing.
>
> > We will have to figure out how to pass which ports are interconnected t=
o
> > the test somehow, because that is something that only the user who set
> > up the machine knows.
> Maybe expect user sets it in some variable before running the test? e.g.:
>
> if [ -n "$UART_INTERCONNECTED_PORTS" ]; then
>     tst_brk TCONF "set space separated interconnected ports in
> \$UART_INTERCONNECTED_PORTS"
> fi
>
> Kind regards,
> Petr
>

--000000000000c77c8b05a1bc33af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ALL:<div>Thank you very much for your guidance,=C2=A0</=
div><div>I will follow your some advises, and try to add serialcheck in nex=
t version</div><div>but I also have some questions</div><div><br></div><div=
>&gt;We both Cyril and me mentioned that you don&#39;t need to use mktemp (=
+ it&#39;d be<br>&gt;unnecessary dependency).=C2=A0=C2=A0<br><div>Now I kne=
w=C2=A0

<span style=3D"color:rgb(80,0,80)">TST_NEEDS_TMPDIR</span>=C2=A0 is make a =
temp direct and cd in it ,=C2=A0</div><div>but I need a file contains rando=
m data, this file is to used to test the PORT,</div><div>Do you meaning I s=
hould creat a normal file use dd ,and named by myself?</div><div>=C2=A0=C2=
=A0</div></div><div><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&=
gt;&gt; This is problematic as well, it expects that all ports that are not=
<br>&gt;&gt; in-use are loopback connected. This is not true in general cas=
e, which<br>&gt;&gt; means that we cannot add the test to the kernel_misc r=
untest file as it<br>&gt;&gt; is because it will fail on most of the system=
s out there.<br></span>&gt;Oh, I didn&#39;t realize this obvious thing.<spa=
n class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br>&gt;&gt; We will have=
 to figure out how to pass which ports are interconnected to<br>&gt;&gt; th=
e test somehow, because that is something that only the user who set<br>&gt=
;&gt; up the machine knows.<br></span>&gt;Maybe expect user sets it in some=
 variable before running the test? e.g.:=C2=A0</div><div>we can=C2=A0decide=
=C2=A0

which PORT can be test,=C2=A0 But just like Cyril said, we don&#39;t<br></d=
iv><div>know the machines is run int loopback mode or

=C2=A0HW flow control=C2=A0=C2=A0mode,=C2=A0</div><div>So can I put the tes=
tcase tags into two file in the runtest, one is used to test</div><div>loop=
back mode, and the other is test for=C2=A0

=C2=A0HW flow control=C2=A0=C2=A0?</div><div>runtest/uart-loopback</div><di=
v>runtest/uart-HWflow</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz"=
>pvorel@suse.cz</a>&gt; =E4=BA=8E2020=E5=B9=B43=E6=9C=8825=E6=97=A5=E5=91=
=A8=E4=B8=89 =E4=B8=8B=E5=8D=8811:28=E5=86=99=E9=81=93=EF=BC=9A<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; This is problematic as well, it expects that all ports that are not<br=
>
&gt; in-use are loopback connected. This is not true in general case, which=
<br>
&gt; means that we cannot add the test to the kernel_misc runtest file as i=
t<br>
&gt; is because it will fail on most of the systems out there.<br>
Oh, I didn&#39;t realize this obvious thing.<br>
<br>
&gt; We will have to figure out how to pass which ports are interconnected =
to<br>
&gt; the test somehow, because that is something that only the user who set=
<br>
&gt; up the machine knows.<br>
Maybe expect user sets it in some variable before running the test? e.g.:<b=
r>
<br>
if [ -n &quot;$UART_INTERCONNECTED_PORTS&quot; ]; then<br>
=C2=A0 =C2=A0 tst_brk TCONF &quot;set space separated interconnected ports =
in \$UART_INTERCONNECTED_PORTS&quot;<br>
fi<br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div>

--000000000000c77c8b05a1bc33af--

--===============1091518888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1091518888==--
