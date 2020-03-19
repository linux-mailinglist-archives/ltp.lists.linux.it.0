Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5C18BA64
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:07:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07B7C3C5462
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:07:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E437C3C5453
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:07:50 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 72CB21001848
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:07:49 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id f8so1173325plt.10
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZYxKcawC5TCthL2A/oto1WsG3D3TPf+T6TXpGoWeZA=;
 b=K9DZQBt9jTEn1i/lsRP5HUEArezjyU1ZBXUVfg2BBpwwN5nSgd+UbIn9hVAuOWkAfn
 nBVHV2yf0CB8pTwqZIzRPah+Nw4j9l2ZynTXmrpDpTfMZoSCCw+cZTfOkL63S2HSgsO4
 KtuRAO1Tc8rIpu3ZyXtG68RN6eZz+Nwi/M7cEDoRdHr4I1RyJagYAI0eCqbT4q0jbDST
 8vF1dkhrbBwyhh5tGQtSB/eZLgWPow/Dr5+RVtNpdDX0x0LlkhxeF4NHoYWoYQF4vRIT
 gaWG6hclg0tIQdqQtarla02MDyCDmS3PEUjotyWgB/XgLfaVXquMthINiGj9xbOIp5K1
 G9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZYxKcawC5TCthL2A/oto1WsG3D3TPf+T6TXpGoWeZA=;
 b=rifo3GAkeCjrYukDZQ1UAbvhO2+bY75+Ty5oReh1gc62i/xfJJ1H3zvXTo3PCMRlRg
 4tFoTZxybsAkKrhPBNErzCIB2kmQDwI1U/vJDeFfE/fyENSIb8xiSvKbCA8pLNgNQdTG
 b4zPBbCRMm6m6uowvzbTFBWm9Fm4BFkxUdR3Pnc7shLjX3axErqxb2HIA/P4273poRZz
 YmOy+nQZTZ0ysOUzYs4n4glr948Lh0gEPpZIB4+tOeDhvFHDGzzn+slRO/Jr5LuOP2rV
 YZ2+VfQYyuGkrOqhArFHAX+8PP/8H+1iEZ72HdcTBfTUtmVcKdRyv8sd+lN86RPUsCuh
 kITA==
X-Gm-Message-State: ANhLgQ0eh2w/EBwvZ47S3RKP+Y3VaG4aY+up/f1NER+dKJKBnAZmsGdQ
 l4Bk+TTMQ5zzpxqUL7oHsX+KFuZdiiJ1afa0nHo=
X-Google-Smtp-Source: ADFU+vsBNYVO4fYGp0RjANOm6A/PPyXfazgf18EAADFMHkmIQhzto1fO5qjQ63C9Q9Hk+GeyejePrG5F//bHnVkhAoI=
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr4040725plk.150.1584630467806; 
 Thu, 19 Mar 2020 08:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFsKiR8XFW2WhMuNs7VYEGh8Sj=oaQHC05uc689vAcmarA@mail.gmail.com>
 <20200319102842.GA440@dell5510>
In-Reply-To: <20200319102842.GA440@dell5510>
From: Cixi Geng <gengcixi@gmail.com>
Date: Thu, 19 Mar 2020 23:07:11 +0800
Message-ID: <CAF12kFubCde66C+JUt9+m49FqXgupoN-vZphuO2vFsWtTO_j0g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] uart: add uart testcase in kernel device-driver
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
Cc: orsonzhai@gmail.com, ceh@ti.com, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1389239151=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1389239151==
Content-Type: multipart/alternative; boundary="00000000000022496f05a1368859"

--00000000000022496f05a1368859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr:
Thank you for taking the trouble to help me. I do appreciate it.
Sorry about the so many mistakes,
I will fix the code in next vesion.

Thanks again for you help!

Petr Vorel <pvorel@suse.cz> =E4=BA=8E2020=E5=B9=B43=E6=9C=8819=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:28=E5=86=99=E9=81=93=EF=BC=9A

> Hi Cixi,
>
> > Porting UART test from ltp-ddt back to ltp. only test 115200 UART_RATE.
> Thanks for your effort. There are several problems with this test, I'll
> try to
> address them all.
>
> > [TODO] support more rate, and add test HWFLOW function test.
> Could this be in v2?
>
> > diff --git a/runtest/kernel_ddt b/runtest/kernel_ddt
> > new file mode 100644
> > index 000000000..30e9a0269
> > --- /dev/null
> > +++ b/runtest/kernel_ddt
> > @@ -0,0 +1 @@
> > +uart serialcheck.sh
> I wonder if there needs to be in it's own runtest file.
> Maybe yes, but I'd propose more meaningful name (serial, uart).
> What is ddt anyway?
>
> > diff --git a/testcases/kernel/device-drivers/Makefile
> > b/testcases/kernel/device-drivers/Makefile
> > index 55e0d25a0..a214f211b 100644
> > --- a/testcases/kernel/device-drivers/Makefile
> > +++ b/testcases/kernel/device-drivers/Makefile
> > @@ -27,6 +27,7 @@ SUBDIRS :=3D acpi \
> >     rtc \
> >     tbio \
> >     uaccess \
> > +   uart \
> >     zram
>
> >  include $(top_srcdir)/include/mk/generic_trunk_target.mk
> > diff --git a/testcases/kernel/device-drivers/uart/Makefile
> > b/testcases/kernel/device-drivers/uart/Makefile
> > new file mode 100644
> > index 000000000..0d73f6635
> > --- /dev/null
> > +++ b/testcases/kernel/device-drivers/uart/Makefile
> > @@ -0,0 +1,22 @@
> > +# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved=
.
> > +#
> > +# This program is free software; you can redistribute it and/or
> > +# modify it under the terms of the GNU General Public License as
> > +# published by the Free Software Foundation; either version 2 of
> > +# the License, or (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it would be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program; if not, write the Free Software Foundation,
> > +# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> Please next time instead of verbose GPL text ^ use just:
> # SPDX-License-Identifier: GPL-2.0-or-later
>
> > +
> > +top_srcdir ?=3D ../../../..
> > +include $(top_srcdir)/include/mk/testcases.mk
> > +
> > +INSTALL_TARGETS :=3D *.sh
> > +
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/device-drivers/uart/serialcheck.sh
> > b/testcases/kernel/device-drivers/uart/serialcheck.sh
> > new file mode 100755
> > index 000000000..f4cf13e02
> > --- /dev/null
> > +++ b/testcases/kernel/device-drivers/uart/serialcheck.sh
> > @@ -0,0 +1,111 @@
> > +#!/bin/sh
> >
> +########################################################################=
#######
> > +#
> > +# Copyright (C) 2015 Texas Instruments Incorporated -
> http://www.ti.com/
> > +# Copyright (C) 2019, Unisoc Communications Inc.
> > +#
> > +# This program is free software; you can redistribute it and/or
> > +# modify it under the terms of the GNU General Public License as
> > +# published by the Free Software Foundation version 2.
> > +#
> > +# This program is distributed "as is" WITHOUT ANY WARRANTY of any
> > +# kind, whether express or implied; without even the implied warranty
> > +# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> >
> +########################################################################=
#######
> And here ^:
> # SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +# @desc Test UART ports using git://
> > git.breakpoint.cc/bigeasy/serialcheck.git
> It looks your mailer wraps lines, that's unusable for applying.
> Could you use git format-patch and git send-email for generating patches
> and
> sending them?
>
> > +
> > +#### Functions definitions ####
> Please avoid these useless comments.
>
> > +usage()
> > +{
> > +    echo "usage: ./${0##*/} [-r UART_RATE] [-l LOOPS] [-x to enable HW
> > flow control]"
> Also here is wrapped.
>
> But you're supposed to use TST_OPTS TST_PARSE_ARGS and TST_USAGE from The
> API
>
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23=
3-optional-command-line-parameters
>
> > +    exit 1
> > +}
> > +
> > +# Default values
> > +: ${UART_RATE:=3D115200}
> > +: ${UART_LOOPS:=3D5}
> > +: ${UART_HWFLOW:=3D0}
> Even this is a valid syntax, please use more convinient:
> UART_RATE=3D"${UART_RATE:=3D115200}"
>
> > +
> > +PORTS_TO_TEST=3D();
> > +UART_PORTS=3D();
> > +ARRAY=3D(`find /sys/class/tty/*/uartclk`);
> Arrays are bashisms (bash specific), we don't allow them in LTP, as we
> require
> POSIX shell syntax, which is portable (some systems doesn't have bash, bu=
t
> dash
> or other shell e.g. toybox or busybox on Android. I guess you target
> embedded
> system with this test):
>
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#13=
2-shell-coding-style
>
> Most of the time arrays can be replaced by string separated by space.
> If you need these devices, in /sys/class/tty/*/uartclk, it could be done
> like:
> ports=3D$(for i in /sys/class/tty/*/uartclk ; do echo $i | cut -d '/' -f =
5;
> done)
>
> > +
> > +check_requirements()
> > +{
> > + which serialcheck
>
>
> > + ret=3D$?
> > + if [ $ret -eq 0 ];then
> > + tst_res TINFO "serialcheck command is in system,continue to test"
> > + else
> > + tst_brk TCONF "test failed for lack of requirement,returned is $ret"
> > + fi
> > +
> Useless blank line here.
> > +}
> TINFO is not much useful, I'd avoid that. And check_requirements should b=
e
> a setup function, not called directly in do_test:
> TST_SETUP=3Dcheck_requirements
>
> But given that whole function just check serialcheck, whole function
> should be
> replaced just by:
>
> TST_NEEDS_CMDS=3D"serialcheck"
>
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23=
2-library-environment-variables-for-shell
>
> BTW serialcheck source isn't probably packaged in distros
> https://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/tree/serialcheck.c
> Maybe we could just adapt it to LTP and include it as well (if we conside=
r
> whole
> testing useful).
>
> > +
> > +create_test_file()
> > +{
> > +    temp_test_file=3D`mktemp`
> I guess you need to use TST_NEEDS_TMPDIR=3D1
> and then just any file in it. Or use $$ (e.g. file.$$) if you want to hav=
e
> concurrency, but we usually don't care).
> > +    dd if=3D/dev/urandom of=3D$temp_test_file count=3D1 bs=3D$((UART_R=
ATE / 2))
> You also need to add dd to TST_NEEDS_CMDS.
>
> > +}
> > +
> > +get_uart_ports()
> > +{
> > +for i in ${ARRAY[@]}; do
> > +    PORT=3D/dev/`echo $i | cut -d'/' -f 5`
> Well, you use cut yourself, so why that complicated code with arrays?
>
> > +    # Activate port in case it will be initialized only when startup
> > +    echo "DDT TESTING" > $PORT 2>/dev/null
> > +    if [ `cat $i` -ne 0 ]; then
> > +        UART_PORTS=3D("${UART_PORTS[@]}" "$PORT")
> > +    fi
> > +done
> > +}
> > +
> > +filter_out_used_ports()
> > +{
> > + which lsof
> > + ret=3D$?
> > + if [ $ret -eq 0 ];then
> > + tst_res TINFO "lsof command exist, filter out used ports";
> > + else
> > + tst_brk TCONF "test failed for lack of requirement,returned is $ret"
> > + fi
> Again whole block is useless, just add lsof into TST_NEEDS_CMDS.
>
> > +
> > +    for i in ${UART_PORTS[@]}; do
> > +        lsof | grep $i &> /dev/null ||
> > PORTS_TO_TEST=3D("${PORTS_TO_TEST[@]}" $i)
> > +    done
> > +}
> > +
> > +run_serial_test()
> > +{
> > + create_test_file
> create_test_file should be just 2 lines of code in setup function.
>
> > +    for i in ${PORTS_TO_TEST[@]}; do
> Array =3D> bashism :(.
>
> > +        if [ $UART_HWFLOW -eq 0 ]; then
> > +            { sleep 1; serialcheck -b $UART_RATE -d $i -f
> $temp_test_file
> > -l $UART_LOOPS -m t -k; }&
> Again line wrapped :(
>
> > +            PID=3D$!
> > +            serialcheck -b $UART_RATE -d $i -f $temp_test_file -l
> Hm, why do you run 2 instances?
>
> > $UART_LOOPS -m r -k || { kill -- -$PID 2>/dev/null; tst_res TFAIL "TEST
> > FAILED"; }
> Using complicated code in { } isn't much readable. I'd put it into:
> if ! $UART_LOOPS -m r -k; then
>         kill ...
> fi
>
> > +        else
> > +            { sleep 1; serialcheck -b $UART_RATE -d $i -f
> $temp_test_file
> > -l $UART_LOOPS -m t -h; } &
> > +            PID=3D$!
> > +            serialcheck -b $UART_RATE -d $i -f $temp_test_file -l
> > $UART_LOOPS -m r -h || { kill -- -$PID 2>/dev/null; tst_res TFAIL "TEST
> > FAILED"; }
>
> This can be written better to not repeat much yourself.
> Whole if and else block is the same exept -h and -k parameter are
> different.
> Why not put this extra parameter into variable?
> Why sleep added into {} block?
>
> > +        fi
> > +    done
> > +    rm $temp_test_file
> > + tst_res TPASS "uart test passed"
> > +}
> > +
> > +
> > +TST_TESTFUNC=3Ddo_test
> > +. tst_test.sh
> We usually put this at the beginning of the test.
> Please see some tests as examples (testcases/commands/df/df01.sh,
> testcases/commands/mkfs/mkfs01.sh, testcases/commands/lsmod/lsmod01.sh,
> ...)
>
> > +
> > +do_test()
> > +{
> > + check_requirements
>
> > + get_uart_ports
> > + filter_out_used_ports
> > + run_serial_test
> > +}
> > +
> > +tst_run
>
> Kind regards,
> Petr
>

--00000000000022496f05a1368859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Petr:<br><div><span style=3D"color:rgb(51,51,51);font-f=
amily:&quot;Microsoft YaHei&quot;;font-size:16px">Thank you for taking the =
trouble to help me. I do appreciate it.</span></div><div><font color=3D"#33=
3333" face=3D"Microsoft YaHei"><span style=3D"font-size:16px">Sorry about t=
he so many mistakes,</span></font></div><div><span style=3D"color:rgb(51,51=
,51);font-family:&quot;Microsoft YaHei&quot;;font-size:16px">I will fix the=
 code in next vesion.=C2=A0</span></div><div><br>Thanks again for you help!=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</=
a>&gt; =E4=BA=8E2020=E5=B9=B43=E6=9C=8819=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=
=8B=E5=8D=886:28=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Cixi,<br>
<br>
&gt; Porting UART test from ltp-ddt back to ltp. only test 115200 UART_RATE=
.<br>
Thanks for your effort. There are several problems with this test, I&#39;ll=
 try to<br>
address them all.<br>
<br>
&gt; [TODO] support more rate, and add test HWFLOW function test.<br>
Could this be in v2?<br>
<br>
&gt; diff --git a/runtest/kernel_ddt b/runtest/kernel_ddt<br>
&gt; new file mode 100644<br>
&gt; index 000000000..30e9a0269<br>
&gt; --- /dev/null<br>
&gt; +++ b/runtest/kernel_ddt<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +uart serialcheck.sh<br>
I wonder if there needs to be in it&#39;s own runtest file.<br>
Maybe yes, but I&#39;d propose more meaningful name (serial, uart).<br>
What is ddt anyway?<br>
<br>
&gt; diff --git a/testcases/kernel/device-drivers/Makefile<br>
&gt; b/testcases/kernel/device-drivers/Makefile<br>
&gt; index 55e0d25a0..a214f211b 100644<br>
&gt; --- a/testcases/kernel/device-drivers/Makefile<br>
&gt; +++ b/testcases/kernel/device-drivers/Makefile<br>
&gt; @@ -27,6 +27,7 @@ SUBDIRS :=3D acpi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0rtc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0tbio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0uaccess \<br>
&gt; +=C2=A0 =C2=A0uart \<br>
&gt;=C2=A0 =C2=A0 =C2=A0zram<br>
<br>
&gt;=C2=A0 include $(top_srcdir)/include/mk/<a href=3D"http://generic_trunk=
_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_trunk_target.mk</a=
><br>
&gt; diff --git a/testcases/kernel/device-drivers/uart/Makefile<br>
&gt; b/testcases/kernel/device-drivers/uart/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 000000000..0d73f6635<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/device-drivers/uart/Makefile<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserve=
d.<br>
&gt; +#<br>
&gt; +# This program is free software; you can redistribute it and/or<br>
&gt; +# modify it under the terms of the GNU General Public License as<br>
&gt; +# published by the Free Software Foundation; either version 2 of<br>
&gt; +# the License, or (at your option) any later version.<br>
&gt; +#<br>
&gt; +# This program is distributed in the hope that it would be useful,<br=
>
&gt; +# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<=
br>
&gt; +# GNU General Public License for more details.<br>
&gt; +#<br>
&gt; +# You should have received a copy of the GNU General Public License<b=
r>
&gt; +# along with this program; if not, write the Free Software Foundation=
,<br>
&gt; +# Inc.,=C2=A0 51 Franklin St, Fifth Floor, Boston, MA=C2=A0 02110-130=
1=C2=A0 USA<br>
Please next time instead of verbose GPL text ^ use just:<br>
# SPDX-License-Identifier: GPL-2.0-or-later<br>
<br>
&gt; +<br>
&gt; +top_srcdir ?=3D ../../../..<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
&gt; +<br>
&gt; +INSTALL_TARGETS :=3D *.sh<br>
&gt; +<br>
&gt; +include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
&gt; diff --git a/testcases/kernel/device-drivers/uart/serialcheck.sh<br>
&gt; b/testcases/kernel/device-drivers/uart/serialcheck.sh<br>
&gt; new file mode 100755<br>
&gt; index 000000000..f4cf13e02<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/device-drivers/uart/serialcheck.sh<br>
&gt; @@ -0,0 +1,111 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#####################################################################=
##########<br>
&gt; +#<br>
&gt; +# Copyright (C) 2015 Texas Instruments Incorporated - <a href=3D"http=
://www.ti.com/" rel=3D"noreferrer" target=3D"_blank">http://www.ti.com/</a>=
<br>
&gt; +# Copyright (C) 2019, Unisoc Communications Inc.<br>
&gt; +#<br>
&gt; +# This program is free software; you can redistribute it and/or<br>
&gt; +# modify it under the terms of the GNU General Public License as<br>
&gt; +# published by the Free Software Foundation version 2.<br>
&gt; +#<br>
&gt; +# This program is distributed &quot;as is&quot; WITHOUT ANY WARRANTY =
of any<br>
&gt; +# kind, whether express or implied; without even the implied warranty=
<br>
&gt; +# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See t=
he<br>
&gt; +# GNU General Public License for more details.<br>
&gt; +#<br>
&gt; +#####################################################################=
##########<br>
And here ^:<br>
# SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +<br>
&gt; +# @desc Test UART ports using git://<br>
&gt; <a href=3D"http://git.breakpoint.cc/bigeasy/serialcheck.git" rel=3D"no=
referrer" target=3D"_blank">git.breakpoint.cc/bigeasy/serialcheck.git</a><b=
r>
It looks your mailer wraps lines, that&#39;s unusable for applying.<br>
Could you use git format-patch and git send-email for generating patches an=
d<br>
sending them?<br>
<br>
&gt; +<br>
&gt; +#### Functions definitions ####<br>
Please avoid these useless comments.<br>
<br>
&gt; +usage()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 echo &quot;usage: ./${0##*/} [-r UART_RATE] [-l LOOPS] =
[-x to enable HW<br>
&gt; flow control]&quot;<br>
Also here is wrapped.<br>
<br>
But you&#39;re supposed to use TST_OPTS TST_PARSE_ARGS and TST_USAGE from T=
he API<br>
<a href=3D"https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guid=
elines#233-optional-command-line-parameters" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelin=
es#233-optional-command-line-parameters</a><br>
<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +}<br>
&gt; +<br>
&gt; +# Default values<br>
&gt; +: ${UART_RATE:=3D115200}<br>
&gt; +: ${UART_LOOPS:=3D5}<br>
&gt; +: ${UART_HWFLOW:=3D0}<br>
Even this is a valid syntax, please use more convinient:<br>
UART_RATE=3D&quot;${UART_RATE:=3D115200}&quot;<br>
<br>
&gt; +<br>
&gt; +PORTS_TO_TEST=3D();<br>
&gt; +UART_PORTS=3D();<br>
&gt; +ARRAY=3D(`find /sys/class/tty/*/uartclk`);<br>
Arrays are bashisms (bash specific), we don&#39;t allow them in LTP, as we =
require<br>
POSIX shell syntax, which is portable (some systems doesn&#39;t have bash, =
but dash<br>
or other shell e.g. toybox or busybox on Android. I guess you target embedd=
ed<br>
system with this test):<br>
<a href=3D"https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guid=
elines#132-shell-coding-style" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-c=
oding-style</a><br>
<br>
Most of the time arrays can be replaced by string separated by space.<br>
If you need these devices, in /sys/class/tty/*/uartclk, it could be done li=
ke:<br>
ports=3D$(for i in /sys/class/tty/*/uartclk ; do echo $i | cut -d &#39;/&#3=
9; -f 5; done)<br>
<br>
&gt; +<br>
&gt; +check_requirements()<br>
&gt; +{<br>
&gt; + which serialcheck<br>
<br>
<br>
&gt; + ret=3D$?<br>
&gt; + if [ $ret -eq 0 ];then<br>
&gt; + tst_res TINFO &quot;serialcheck command is in system,continue to tes=
t&quot;<br>
&gt; + else<br>
&gt; + tst_brk TCONF &quot;test failed for lack of requirement,returned is =
$ret&quot;<br>
&gt; + fi<br>
&gt; +<br>
Useless blank line here.<br>
&gt; +}<br>
TINFO is not much useful, I&#39;d avoid that. And check_requirements should=
 be a setup function, not called directly in do_test:<br>
TST_SETUP=3Dcheck_requirements<br>
<br>
But given that whole function just check serialcheck, whole function should=
 be<br>
replaced just by:<br>
<br>
TST_NEEDS_CMDS=3D&quot;serialcheck&quot;<br>
<a href=3D"https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guid=
elines#232-library-environment-variables-for-shell" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/linux-test-project/ltp/wiki/Test-Writing-G=
uidelines#232-library-environment-variables-for-shell</a><br>
<br>
BTW serialcheck source isn&#39;t probably packaged in distros<br>
<a href=3D"https://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/tree/seri=
alcheck.c" rel=3D"noreferrer" target=3D"_blank">https://git.breakpoint.cc/c=
git/bigeasy/serialcheck.git/tree/serialcheck.c</a><br>
Maybe we could just adapt it to LTP and include it as well (if we consider =
whole<br>
testing useful).<br>
<br>
&gt; +<br>
&gt; +create_test_file()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 temp_test_file=3D`mktemp`<br>
I guess you need to use TST_NEEDS_TMPDIR=3D1<br>
and then just any file in it. Or use $$ (e.g. file.$$) if you want to have<=
br>
concurrency, but we usually don&#39;t care).<br>
&gt; +=C2=A0 =C2=A0 dd if=3D/dev/urandom of=3D$temp_test_file count=3D1 bs=
=3D$((UART_RATE / 2))<br>
You also need to add dd to TST_NEEDS_CMDS.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +get_uart_ports()<br>
&gt; +{<br>
&gt; +for i in ${ARRAY[@]}; do<br>
&gt; +=C2=A0 =C2=A0 PORT=3D/dev/`echo $i | cut -d&#39;/&#39; -f 5`<br>
Well, you use cut yourself, so why that complicated code with arrays?<br>
<br>
&gt; +=C2=A0 =C2=A0 # Activate port in case it will be initialized only whe=
n startup<br>
&gt; +=C2=A0 =C2=A0 echo &quot;DDT TESTING&quot; &gt; $PORT 2&gt;/dev/null<=
br>
&gt; +=C2=A0 =C2=A0 if [ `cat $i` -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 UART_PORTS=3D(&quot;${UART_PORTS[@]}&quot=
; &quot;$PORT&quot;)<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +done<br>
&gt; +}<br>
&gt; +<br>
&gt; +filter_out_used_ports()<br>
&gt; +{<br>
&gt; + which lsof<br>
&gt; + ret=3D$?<br>
&gt; + if [ $ret -eq 0 ];then<br>
&gt; + tst_res TINFO &quot;lsof command exist, filter out used ports&quot;;=
<br>
&gt; + else<br>
&gt; + tst_brk TCONF &quot;test failed for lack of requirement,returned is =
$ret&quot;<br>
&gt; + fi<br>
Again whole block is useless, just add lsof into TST_NEEDS_CMDS.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for i in ${UART_PORTS[@]}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsof | grep $i &amp;&gt; /dev/null ||<br>
&gt; PORTS_TO_TEST=3D(&quot;${PORTS_TO_TEST[@]}&quot; $i)<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +}<br>
&gt; +<br>
&gt; +run_serial_test()<br>
&gt; +{<br>
&gt; + create_test_file<br>
create_test_file should be just 2 lines of code in setup function.<br>
<br>
&gt; +=C2=A0 =C2=A0 for i in ${PORTS_TO_TEST[@]}; do<br>
Array =3D&gt; bashism :(.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $UART_HWFLOW -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { sleep 1; serialcheck -b $=
UART_RATE -d $i -f $temp_test_file<br>
&gt; -l $UART_LOOPS -m t -k; }&amp;<br>
Again line wrapped :(<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PID=3D$!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serialcheck -b $UART_RATE -=
d $i -f $temp_test_file -l<br>
Hm, why do you run 2 instances?<br>
<br>
&gt; $UART_LOOPS -m r -k || { kill -- -$PID 2&gt;/dev/null; tst_res TFAIL &=
quot;TEST<br>
&gt; FAILED&quot;; }<br>
Using complicated code in { } isn&#39;t much readable. I&#39;d put it into:=
<br>
if ! $UART_LOOPS -m r -k; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kill ...<br>
fi<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { sleep 1; serialcheck -b $=
UART_RATE -d $i -f $temp_test_file<br>
&gt; -l $UART_LOOPS -m t -h; } &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PID=3D$!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serialcheck -b $UART_RATE -=
d $i -f $temp_test_file -l<br>
&gt; $UART_LOOPS -m r -h || { kill -- -$PID 2&gt;/dev/null; tst_res TFAIL &=
quot;TEST<br>
&gt; FAILED&quot;; }<br>
<br>
This can be written better to not repeat much yourself.<br>
Whole if and else block is the same exept -h and -k parameter are different=
.<br>
Why not put this extra parameter into variable?<br>
Why sleep added into {} block?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 rm $temp_test_file<br>
&gt; + tst_res TPASS &quot;uart test passed&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +TST_TESTFUNC=3Ddo_test<br>
&gt; +. tst_test.sh<br>
We usually put this at the beginning of the test.<br>
Please see some tests as examples (testcases/commands/df/df01.sh,<br>
testcases/commands/mkfs/mkfs01.sh, testcases/commands/lsmod/lsmod01.sh, ...=
)<br>
<br>
&gt; +<br>
&gt; +do_test()<br>
&gt; +{<br>
&gt; + check_requirements<br>
<br>
&gt; + get_uart_ports<br>
&gt; + filter_out_used_ports<br>
&gt; + run_serial_test<br>
&gt; +}<br>
&gt; +<br>
&gt; +tst_run<br>
<br>
Kind regards,<br>
Petr<br>
</blockquote></div>

--00000000000022496f05a1368859--

--===============1389239151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1389239151==--
