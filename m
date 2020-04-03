Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56619CE5B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 03:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF54C3C3004
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 03:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3EF623C2FEA
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 03:51:35 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 476002009E0
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 03:51:34 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id r14so2682982pfl.12
 for <ltp@lists.linux.it>; Thu, 02 Apr 2020 18:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7UsNJDDLmLUmxtacMdKW9STIzMseV3oJUOMnlwvBBqs=;
 b=nNcr7Tynorf2VEFf1Qp2dPrNnocc/aAhmbDR+JDtTaynfMhibaTY9Yq2C9BoyQOgr4
 RD8h87Jc17gHFB/MVUzD6++vaBkZLk+4aXtUwxkAmVfbbcwCr+GuAH4Ml5pTEAHzIS5O
 HwsKXBslWIQ2d0PM+EefsGbn62A8ign930bj12k4AUMlT8fAMfto4g7VXobsDrWTpL2S
 muLg/mMwNAejoO8KvbhIz6h8w561FUmoUt6ZLp+v4lYXQbA/nwxpqz6nSyq9ngE2oDcR
 2l6krfMP4ZTC0v6SK5nKmGhqzleaVahl+HhR3WADDEKbGx0ygirugIG+AwntZbRwgxIP
 PAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7UsNJDDLmLUmxtacMdKW9STIzMseV3oJUOMnlwvBBqs=;
 b=H1W4TAruJtbo+7lDQ5q1jYsFlzAgEEXG2J+9kYP8Sdp8tXvjD5EcRJ+ityLwS1isep
 MVhb2hlMgoN5mPBd+86JBmcrahBtSPoUXDSQIDqsRCqw7YUaDYitaeCSjeGka3qbJtg1
 /ogTYFhBvW4JNkPYcj6dZ8uVYdGGQUSmXm5XSQ0cG10LNGfC9rtQfBbES9fApgs6Xv9v
 jgRelcQTeoVKs8pUQjD9u9ikS9qjTkjhJEIf+x1lSOFXHvQ0gjT/ofkW5H81nRNiTu4V
 nfTdYumoYp8aHjh/PKxovquBJFdg3gpwCjkR+IiSezaMVlN1cNgjXvvl6rM0KfRENVkM
 WHWA==
X-Gm-Message-State: AGi0Pua1VkUlJpobriy9pbUpNA9RHhNHzvtpWPEl9tY3xqPlDNb4vcTo
 gKcFELn99GXjUch0UrDqnp8XouAwP2LGO7mX1+k=
X-Google-Smtp-Source: APiQypIAJy6+pvshjQ4nhmiAbfa9UkEqZtNdBA5xaB9+CJs66NNkMzds+kxlfBIadB5lU4V30WcGLOmI93dtvCaHOhw=
X-Received: by 2002:a62:75c1:: with SMTP id q184mr5914026pfc.269.1585878692734; 
 Thu, 02 Apr 2020 18:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
 <20200402112309.GA5732@yuki.lan>
In-Reply-To: <20200402112309.GA5732@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 3 Apr 2020 09:50:56 +0800
Message-ID: <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1187834540=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1187834540==
Content-Type: multipart/alternative; boundary="000000000000232de005a25928ae"

--000000000000232de005a25928ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril:
Here is my test result, in this test we can make sure that the baudrate is
needed in test.
the test hope help you

1. test ttyUSB0 in loopback use the same baudrate of Rx and Tx , test pass
with 5loop
root@Y50:/home/gcx/project/serialcheck# serialcheck  -b 115200 -d
/dev/ttyUSB0 -f binary -l 5 -m r -k
Needed 64 reads 0 writes loops 5 / 5
Failed to ioctl(,TIOCGICOUNT,)
gcx@Y50:~/project/serialcheck$ serialcheck -b 115200 -d /dev/ttyUSB0 -f
binary -m t -l 5 -k
Needed 0 reads 1 writes loops 5 / 5
Failed to ioctl(,TIOCGICOUNT,)
2. test ttyUSB0 in loopback use different baudrate ,Error at the fist loop
root@Y50:/home/gcx/project/serialcheck# serialcheck  -b 115200 -d
/dev/ttyUSB0 -f binary -l 5 -m r -k &
[1] 20764
gcx@Y50:~/project/serialcheck$ serialcheck -b 115200 -d /dev/ttyUSB0 -f
binary -m t -l 5 -k
Needed 0 reads 1 writes loops 5 / 5
Failed to ioctl(,TIOCGICOUNT,)
Needed 64 reads 0 writes Oh oh, inconsistency at pos 502 (0x1f6).

Original sample:
000001c0: 91 95 eb b6 82 e9 2a e6  16 5a da a3 c2 51 c4 c9
......*..Z...Q..
000001d0: c5 51 e1 b7 c9 76 67 d5  09 57 80 77 eb bf 6d d7
.Q...vg..W.w..m.
000001e0: 08 a6 7b fd 52 1b 12 8e  f2 50 c1 b7 a7 52 35 39
..{.R....P...R59
000001f0: 54 d4 50 96 49 55 35 30  33 52 80 89 8e a9 1e a2
T.P.IU503R......
00000200: 2c a5 0d 1a 26 f6 ea 77  a4 4a b9 69 34 17 cc bc
,...&..w.J.i4...
00000210: e2 6e 0c f9 e1 11 39 9f  fd ce 94 9e 19 30 f4 1c
.n....9......0..

Received sample:
000001c0: 91 95 eb b6 82 e9 2a e6  16 5a da a3 c2 51 c4 c9
......*..Z...Q..
000001d0: c5 51 e1 b7 c9 76 67 d5  09 57 80 77 eb bf 6d d7
.Q...vg..W.w..m.
000001e0: 08 a6 7b fd 52 1b 12 8e  f2 50 c1 b7 a7 52 35 39
..{.R....P...R59
000001f0: 54 d4 50 96 49 55 06 9a  92 01 89 8e a9 1e a2 2c
T.P.IU.........,
00000200: a5 0d 1a 26 f6 ea 77 a4  4a b9 69 34 17 cc bc e2
...&..w.J.i4....
00000210: 6e 0c f9 e1 11 39 9f fd  ce 94 9e 19 30 f4 1c 74
n....9......0..t
loops 1 / 5



Cyril Hrubis <chrubis@suse.cz> =E4=BA=8E2020=E5=B9=B44=E6=9C=882=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:22=E5=86=99=E9=81=93=EF=BC=9A

> Hi!
> > I am sorry that when I run the serialcheck on my laptop,
> > there always has some error as follow,which mean I cannot
> > verify the serialcheck on my computer for now.
> > Failed to ioctl(,TIOCGICOUNT,)  -- test ttyUSB0
>
> This one can be ignored, that just means that the counters are not
> implemented and the statistics are not printed at the test end.
>
> > tcgetattr() failed: Input/output error -- test ttyS0
> > I am trying to find available machine and then run test.
>
> That looks like there is no UART to begin with.
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>

--000000000000232de005a25928ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cyril:<div>Here is my test result, in this test we can =
make sure that the baudrate is needed in test.=C2=A0</div><div>the test hop=
e help you</div><div><br></div><div>1. test ttyUSB0 in loopback use the sam=
e baudrate of Rx and Tx , test pass with 5loop</div><div>root@Y50:/home/gcx=
/project/serialcheck# serialcheck =C2=A0-b 115200 -d /dev/ttyUSB0 -f binary=
 -l 5 -m r -k<br>Needed 64 reads 0 writes loops 5 / 5<br>Failed to ioctl(,T=
IOCGICOUNT,)<br></div><div>gcx@Y50:~/project/serialcheck$ serialcheck -b 11=
5200 -d /dev/ttyUSB0 -f binary -m t -l 5 -k<br>Needed 0 reads 1 writes loop=
s 5 / 5<br>Failed to ioctl(,TIOCGICOUNT,)<br></div><div>2. test ttyUSB0 in =
loopback use different baudrate ,Error=C2=A0at the fist loop</div><div>root=
@Y50:/home/gcx/project/serialcheck# serialcheck =C2=A0-b 115200 -d /dev/tty=
USB0 -f binary -l 5 -m r -k &amp;</div><div>[1] 20764</div><div>gcx@Y50:~/p=
roject/serialcheck$ serialcheck -b 115200 -d /dev/ttyUSB0 -f binary -m t -l=
 5 -k<br>Needed 0 reads 1 writes loops 5 / 5<br>Failed to ioctl(,TIOCGICOUN=
T,)<br>Needed 64 reads 0 writes Oh oh, inconsistency at pos 502 (0x1f6).<br=
><br>Original sample:<br>000001c0: 91 95 eb b6 82 e9 2a e6 =C2=A016 5a da a=
3 c2 51 c4 c9 =C2=A0 ......*..Z...Q..<br>000001d0: c5 51 e1 b7 c9 76 67 d5 =
=C2=A009 57 80 77 eb bf 6d d7 =C2=A0 .Q...vg..W.w..m.<br>000001e0: 08 a6 7b=
 fd 52 1b 12 8e =C2=A0f2 50 c1 b7 a7 52 35 39 =C2=A0 ..{.R....P...R59<br>00=
0001f0: 54 d4 50 96 49 55 35 30 =C2=A033 52 80 89 8e a9 1e a2 =C2=A0 T.P.IU=
503R......<br>00000200: 2c a5 0d 1a 26 f6 ea 77 =C2=A0a4 4a b9 69 34 17 cc =
bc =C2=A0 ,...&amp;..w.J.i4...<br>00000210: e2 6e 0c f9 e1 11 39 9f =C2=A0f=
d ce 94 9e 19 30 f4 1c =C2=A0 .n....9......0..<br><br>Received sample:<br>0=
00001c0: 91 95 eb b6 82 e9 2a e6 =C2=A016 5a da a3 c2 51 c4 c9 =C2=A0 .....=
.*..Z...Q..<br>000001d0: c5 51 e1 b7 c9 76 67 d5 =C2=A009 57 80 77 eb bf 6d=
 d7 =C2=A0 .Q...vg..W.w..m.<br>000001e0: 08 a6 7b fd 52 1b 12 8e =C2=A0f2 5=
0 c1 b7 a7 52 35 39 =C2=A0 ..{.R....P...R59<br>000001f0: 54 d4 50 96 49 55 =
06 9a =C2=A092 01 89 8e a9 1e a2 2c =C2=A0 T.P.IU.........,<br>00000200: a5=
 0d 1a 26 f6 ea 77 a4 =C2=A04a b9 69 34 17 cc bc e2 =C2=A0 ...&amp;..w.J.i4=
....<br>00000210: 6e 0c f9 e1 11 39 9f fd =C2=A0ce 94 9e 19 30 f4 1c 74 =C2=
=A0 n....9......0..t<br>loops 1 / 5<br></div><div><br></div><div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt;=
 =E4=BA=8E2020=E5=B9=B44=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=
=8D=887:22=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi!<br>
&gt; I am sorry that when I run the serialcheck on my laptop,<br>
&gt; there always has some error as follow,which mean I cannot<br>
&gt; verify the serialcheck on my computer for now.<br>
&gt; Failed to ioctl(,TIOCGICOUNT,)=C2=A0 -- test ttyUSB0<br>
<br>
This one can be ignored, that just means that the counters are not<br>
implemented and the statistics are not printed at the test end.<br>
<br>
&gt; tcgetattr() failed: Input/output error -- test ttyS0<br>
&gt; I am trying to find available machine and then run test.<br>
<br>
That looks like there is no UART to begin with.<br>
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
</blockquote></div>

--000000000000232de005a25928ae--

--===============1187834540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1187834540==--
