Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FA109879
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 06:22:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D88E23C220C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 06:22:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0D8CF3C131B
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 06:22:08 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4A0BE600804
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 06:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574745725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDqbFxQlKH50Jl5AUSh7FmvkAbpfYZebWncGFLsXYCM=;
 b=GLtj2V7rH8YuJ1HtTQy0yyVbmPqEwbMiEVCyqlPzenOft3iyvR4iK6hxTtkV7Ya5DFHeoo
 YYzwdjZqqA4Wh3+7ggUtu8hQ1zN7oW5YhepdeTPb5izkgVQRvsbZuu6EhWPmQB+gsgqKnk
 B/L8WzuS/t20z2DL3RHVdMQKHK9c9g8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Q3ECF_oXPZuIoGVMefwyww-1; Tue, 26 Nov 2019 00:22:02 -0500
Received: by mail-oi1-f199.google.com with SMTP id k145so8812001oih.12
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 21:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDqbFxQlKH50Jl5AUSh7FmvkAbpfYZebWncGFLsXYCM=;
 b=Y59W5oKarG/5VEE1VK+9tvaPDpNgzXvBJQF4lmTMDhwdqAXaCGiqnfHBoAdI9MplQZ
 0C5KHJ+8yCxp6Vp77cwSNp/NeX5gCnm8ndkUxBagB/q7IwM2VDVnL9x39rInzhaTx3/y
 YT2puYmH9zBO+QI2lke1sejLAlL0O4d3BKTaMQWvs064ssCAL2PAMxU9LOjJvTnjfom+
 GwNJB8BBlEfsaq/hJr3x92IeKvjuAF63T2PMY9OzFJ4fkEpmK1QfXgTM57zRt8uxF7m1
 fIAUvmelcgGUKCcy3crfnEV672O6U+5zqxXCpaMSvCeAOXuFZfinLeSmbQj2qbyUOHBr
 B1XQ==
X-Gm-Message-State: APjAAAUoLzeRhaTKtTqTSgB0VNzokg1XWPOVZUCwM6TQuYfueK8vqJyE
 wIe67Ve2+Sx4g0WEa5/9rj9rNYDXolOlZHVo+DeVhoTaHRImr+UquQolQ49FzekmCKe2H+PrphZ
 VRrk9plCCEp4lwg/XMfugKRoGRmg=
X-Received: by 2002:aca:782:: with SMTP id 124mr1972687oih.47.1574745721436;
 Mon, 25 Nov 2019 21:22:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPhtCjG/4FfLfmifRBEfzRIZgFQiJkPnvSWc/N6cya8R887YuvtFFbW9OtKUcMx5vwHUPtUAVaCYh4o0WSfL0=
X-Received: by 2002:aca:782:: with SMTP id 124mr1972670oih.47.1574745721144;
 Mon, 25 Nov 2019 21:22:01 -0800 (PST)
MIME-Version: 1.0
References: <cki.0F29252F52.BT1NZETF9R@redhat.com>
In-Reply-To: <cki.0F29252F52.BT1NZETF9R@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Tue, 26 Nov 2019 13:21:50 +0800
Message-ID: <CAEemH2cu9zXQqqvs+jTsO_JTx-wH6YTyZgfE3oaiRRUkU5S2yg@mail.gmail.com>
To: CKI Project <cki-project@redhat.com>
X-MC-Unique: Q3ECF_oXPZuIoGVMefwyww-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
	=?utf-8?q?=2E13-6b6ca63=2Ecki_=28stable-queue-tree=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Christine Flood <chf@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1767461836=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1767461836==
Content-Type: multipart/alternative; boundary="000000000000522b220598390f0d"

--000000000000522b220598390f0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2019 at 5:41 AM CKI Project <cki-project@redhat.com> wrote:

>
> Hello,
>
> We ran automated tests on a recent commit from this kernel tree:
>
>        Kernel repo: git://
> git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
>             Commit: 6b6ca63a8174 - net/mlx5: Update the list of the PCI
> supported devices
>
> The results of these automated tests are provided below.
>
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>              Tests: FAILED
>
> All kernel binaries, config files, and logs are available for download
> here:
>
>   https://artifacts.cki-project.org/pipelines/307695
>
> One or more kernel tests failed:
>
>     ppc64le:
>      =E2=9D=8C LTP
>

tag=3Ddio30 stime=3D1574695439
cmdline=3D"diotest6 -b 65536 -n 100 -i 100 -o 1024000"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
diotest06    1  TPASS  :  Read with Direct IO, Write without
diotest06    2  TFAIL  :  diotest6.c:150: readv failed, ret =3D 1269760:
errno=3DENOTTY(25): Inappropriate ioctl for device
diotest06    3  TFAIL  :  diotest6.c:215: Write Direct-child 83 failed
diotest06    1  TPASS  :  Read with Direct IO, Write without
...
diotest06 2 TFAIL : diotest6.c:334: Write with Direct IO, Read without
diotest06    1  TPASS  :  Read with Direct IO, Write without
diotest06    2  TFAIL  :  diotest6.c:334: Write with Direct IO, Read withou=
t
diotest06    1  TPASS  :  Read with Direct IO, Write without
diotest06    2  TFAIL  :  diotest6.c:334: Write with Direct IO, Read withou=
t
diotest06    3  TPASS  :  Read, Write with Direct IO
diotest06 0 TINFO : 1/3 testblocks failed

--=20
Regards,
Li Wang

--000000000000522b220598390f0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 26, 2019 at 5:41 AM CKI Project &lt;<a =
href=3D"mailto:cki-project@redhat.com">cki-project@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Hello,<br>
<br>
We ran automated tests on a recent commit from this kernel tree:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel repo: git://<a href=3D"http://git.kernel.=
org/pub/scm/linux/kernel/git/stable/stable-queue.git" rel=3D"noreferrer" ta=
rget=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue=
.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Commit: 6b6ca63a8174 - net/mlx5: =
Update the list of the PCI supported devices<br>
<br>
The results of these automated tests are provided below.<br>
<br>
=C2=A0 =C2=A0 Overall result: FAILED (see details below)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Merge: OK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Compile: OK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Tests: FAILED<br>
<br>
All kernel binaries, config files, and logs are available for download here=
:<br>
<br>
=C2=A0 <a href=3D"https://artifacts.cki-project.org/pipelines/307695" rel=
=3D"noreferrer" target=3D"_blank">https://artifacts.cki-project.org/pipelin=
es/307695</a><br>
<br>
One or more kernel tests failed:<br>
<br>
=C2=A0 =C2=A0 ppc64le:<br>
=C2=A0 =C2=A0 =C2=A0=E2=9D=8C LTP<br></blockquote><div><br></div><div>tag=
=3Ddio30 stime=3D1574695439<br>cmdline=3D&quot;diotest6 -b 65536 -n 100 -i =
100 -o 1024000&quot;<br>contacts=3D&quot;&quot;<br>analysis=3Dexit<br>&lt;&=
lt;&lt;test_output&gt;&gt;&gt;<br>diotest06 =C2=A0 =C2=A01 =C2=A0TPASS =C2=
=A0: =C2=A0Read with Direct IO, Write without<br>diotest06 =C2=A0 =C2=A02 =
=C2=A0TFAIL =C2=A0: =C2=A0diotest6.c:150: readv failed, ret =3D 1269760: er=
rno=3DENOTTY(25): Inappropriate ioctl for device<br>diotest06 =C2=A0 =C2=A0=
3 =C2=A0TFAIL =C2=A0: =C2=A0diotest6.c:215: Write Direct-child 83 failed <b=
r>diotest06 =C2=A0 =C2=A01 =C2=A0TPASS =C2=A0: =C2=A0Read with Direct IO, W=
rite without<div class=3D"gmail_default" style=3D"font-size:small">...</div=
>diotest06 2 TFAIL : diotest6.c:334: Write with Direct IO, Read without<br>=
diotest06 =C2=A0 =C2=A01 =C2=A0TPASS =C2=A0: =C2=A0Read with Direct IO, Wri=
te without<br>diotest06 =C2=A0 =C2=A02 =C2=A0TFAIL =C2=A0: =C2=A0diotest6.c=
:334: Write with Direct IO, Read without<br>diotest06 =C2=A0 =C2=A01 =C2=A0=
TPASS =C2=A0: =C2=A0Read with Direct IO, Write without<br>diotest06 =C2=A0 =
=C2=A02 =C2=A0TFAIL =C2=A0: =C2=A0diotest6.c:334: Write with Direct IO, Rea=
d without<br>diotest06 =C2=A0 =C2=A03 =C2=A0TPASS =C2=A0: =C2=A0Read, Write=
 with Direct IO <br>diotest06 0 TINFO : 1/3 testblocks failed<br></div><div=
>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><div><div dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div><=
/div></div>

--000000000000522b220598390f0d--


--===============1767461836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1767461836==--

