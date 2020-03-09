Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4717DCDD
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 11:01:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F243A3C6117
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 11:01:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AE6D93C60EA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 11:01:22 +0100 (CET)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F27BD6002C3
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 11:01:21 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id b72so1033603pfb.11
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hQUVS4fKhdoUYmzeXSnUSmxMLSzxC4WddCvQY/Ep748=;
 b=gMHtu2Y54XzMWE+1nOFebPYbYeHdqKioPo5QozuGq0/EYDwhjaF7noABdXo/pLhlRe
 aSRAAol9/I2rcu5tHiCq/w7RlcCkvWRTDHQCdghJFiTgLsty+xCBgk0yMcNpt/PpvAk2
 47Kf4hh2uP/AU2SaMDF/0115JveJPeTqNUxz0KGMoVG8XiZPmlh5rNFNR/46WGBsms7G
 C3N4UehJ5qP0GZCB2TvmApSnLXX04XabYVbACqbCA7wtXeBpC9XEmGmmhbfsIjwJWN5j
 AUeG2c3ONxl0tc8f+6jt4HMz0l10hurnd4EilLsHwicfQeAUvQiccVRgsOM/DpywmAFs
 42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hQUVS4fKhdoUYmzeXSnUSmxMLSzxC4WddCvQY/Ep748=;
 b=jHYOGY3jejtfc1zK6p6p/1JYRQuh4dbGRMRcxyEjDaNdj5dA4u4537Uu5jrc7QvyGT
 6+DJ66k9einugBOG1kxCKGJxWXCaMPtcpS7gsAnARpa/PixoHSoTmrh6OikaFvLHbGLR
 sPMXy0FfZrIkZz4pBFUvTKv5nUcH7n5ALrFnf7a6dJBLUESAV47KqBl2GBC7H5v7CiOI
 xVc46mkXuKX/yy3jzanE+Gh5BnBgQ0nukJjz7CeDSIbqx5KaFUtplkrDSIh4goI9JUnH
 ivtRA6HfnEioZJlGJmry1NZtLSPJuvizC/HhpF45gqfa24MU74f6x1b+lQPuksLNymO6
 3ngg==
X-Gm-Message-State: ANhLgQ0nvxhOdfW6igYR1CEeE0uTXOpZMb3OnEg2vAtbrl90TWxskONj
 ONstWFpGRuUXSBG6NJrrrMqISz4kLUpPlH180UY0cshV
X-Google-Smtp-Source: ADFU+vsDO3BGAag0zRLYpE5E3FxcUMNNhmZiiGSM72lQDcwKWPaZW/ooEaQCh1JUkk8eETkviq+VI6pyw+USGd8nbkM=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr15195793pgr.409.1583748080177; 
 Mon, 09 Mar 2020 03:01:20 -0700 (PDT)
MIME-Version: 1.0
From: Cixi Geng <gengcixi@gmail.com>
Date: Mon, 9 Mar 2020 18:00:44 +0800
Message-ID: <CAF12kFtx6wqUhN4z5uHHW51trstgMsSzRbQHU44rGrVO3-v5AA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=E2=9D=8C_FAIL=3A_mkdtemp_failed_for_EACCES_when?=
	=?utf-8?q?_setresuid_nobody?=
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
Content-Type: multipart/mixed; boundary="===============0868610317=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0868610317==
Content-Type: multipart/alternative; boundary="000000000000bb960105a0691525"

--000000000000bb960105a0691525
Content-Type: text/plain; charset="UTF-8"

Hello everyone:

While testing some syscalls tests on our device,based on debian
rootfs, I got an error on many tests (running as "root" user).

Here is one of log:

<<<test_start>>>
tag=fchown03 stime=1478195083
cmdline="fchown03"
contacts=""
analysis=exit
<<<test_output>>>
fchown03    1  TBROK  :  tst_tmpdir.c:264: tst_tmpdir:
mkdtemp(/tmp/ltp-cawz3S2QlX/fchNeMx77) failed: errno=EACCES(13):
Permission denied
fchown03    2  TBROK  :  tst_tmpdir.c:264: Remaining cases broken
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=2 corefile=no
cutime=0 cstime=1
<<<test_end>>>
After I trace the kerenel syscalls, found it do a setresuid operate,
set uid to nobody.

I did test on my self C code, make that nobody did have no exec
permission to mkdtemp. other normal user successed.

So I pizzled that how to fix this error. need someone help me.

--000000000000bb960105a0691525
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"4">Hello everyone:</font><div><pre style=3D"=
white-space:pre-wrap;color:rgb(0,0,0)"><font size=3D"4">While testing some =
syscalls tests on our device,based on debian rootfs, I got an error on many=
 tests (running as &quot;root&quot; user).</font></pre><pre style=3D"white-=
space:pre-wrap;color:rgb(0,0,0)"><font size=3D"4">Here is one of log:</font=
></pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><font size=3D"1=
"><span style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=
=E9=9B=85=E9=BB=91,sans-serif;white-space:normal">&lt;&lt;&lt;test_start&gt=
;&gt;&gt;</span><br style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=
=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal"><span style=
=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91,sans-serif;white-space:normal">tag=3Dfchown03 stime=3D1478195083</sp=
an><br style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=
=E9=9B=85=E9=BB=91,sans-serif;white-space:normal"><span style=3D"font-famil=
y:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-ser=
if;white-space:normal">cmdline=3D&quot;fchown03&quot;</span><br style=3D"fo=
nt-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,=
sans-serif;white-space:normal"><span style=3D"font-family:&quot;Microsoft Y=
aHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:norm=
al">contacts=3D&quot;&quot;</span><br style=3D"font-family:&quot;Microsoft =
YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:nor=
mal"><span style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal">analysis=3Dexit</span>=
<br style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,sans-serif;white-space:normal"><span style=3D"font-family:&=
quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;=
white-space:normal">&lt;&lt;&lt;test_output&gt;&gt;&gt;</span><br style=3D"=
font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=
=91,sans-serif;white-space:normal"><span style=3D"font-family:&quot;Microso=
ft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:=
normal">fchown03=C2=A0=C2=A0=C2=A0 1=C2=A0 TBROK=C2=A0 :=C2=A0 tst_tmpdir.c=
:264: tst_tmpdir: mkdtemp(/tmp/ltp-cawz3S2QlX/fchNeMx77) failed: errno=3DEA=
CCES(13): Permission denied</span><br style=3D"font-family:&quot;Microsoft =
YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:nor=
mal"><span style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal">fchown03=C2=A0=C2=A0=
=C2=A0 2=C2=A0 TBROK=C2=A0 :=C2=A0 tst_tmpdir.c:264: Remaining cases broken=
</span><br style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal"><span style=3D"font-fa=
mily:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-=
serif;white-space:normal">&lt;&lt;&lt;execution_status&gt;&gt;&gt;</span><b=
r style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91,sans-serif;white-space:normal"><span style=3D"font-family:&quo=
t;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;whi=
te-space:normal">initiation_status=3D&quot;ok&quot;</span><br style=3D"font=
-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sa=
ns-serif;white-space:normal"><span style=3D"font-family:&quot;Microsoft YaH=
ei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal=
">duration=3D0 termination_type=3Dexited termination_id=3D2 corefile=3Dno</=
span><br style=3D"font-family:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=
=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal"><span style=3D"font-fa=
mily:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-=
serif;white-space:normal">cutime=3D0 cstime=3D1</span><br style=3D"font-fam=
ily:&quot;Microsoft YaHei&quot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-s=
erif;white-space:normal"><span style=3D"font-family:&quot;Microsoft YaHei&q=
uot;,=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif;white-space:normal">&l=
t;&lt;&lt;test_end&gt;&gt;&gt;</span></font>
<font size=3D"4">
After I trace the kerenel syscalls, found it do a setresuid operate, set ui=
d to nobody.</font></pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0=
)"><font size=3D"4">I did test on my self C code, make that nobody did have=
 no exec permission to mkdtemp. other normal user successed. </font></pre><=
pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><font size=3D"4">So I p=
izzled that how to fix this error. need someone help me.</font></pre><pre s=
tyle=3D"white-space:pre-wrap;color:rgb(0,0,0)"><font size=3D"4"><br></font>=
</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"></pre></div></di=
v>

--000000000000bb960105a0691525--

--===============0868610317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0868610317==--
