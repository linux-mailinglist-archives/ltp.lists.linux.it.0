Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF8189555
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 06:26:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8B453C5518
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 06:26:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 319B33C550E
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 06:26:24 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 39AFC1000F33
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 06:26:23 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id 23so13281955pfj.1
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 22:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UaRSu7NndajlTBkiIeH5yopTGnWnzeiJ5lGfBUMW9Lo=;
 b=qT+txYbGuaQisUHINfPAqrUp6SV8W5aAK9S8zfm1G67QGwVygBd/p1By//CzInKg4n
 HlJjl4WN+0XFNrhMCuXJMgSIZvv+ehAjc+eWYOsChlwWCEGTmYVvOEcl/9O7jYlkclfn
 GCsL5N5ArhnjWrmzEMrNVPoO8MbT+Ipdm10ZxY3SUL2AC3FxEkFvK1ZdkFSUhTCElSyE
 lOU2cOx4ZyxjZMevy/02jb2sWARJRNSVKpc1F8JOA41ntPhmT4Gn20JdckBqCxJREkC7
 nucQmkHKGcx6a2QX2JA2uk7o7aAgVXBaTTHfp6MAebiXwQCTRvBW+1rBKghK06dok8jq
 RbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UaRSu7NndajlTBkiIeH5yopTGnWnzeiJ5lGfBUMW9Lo=;
 b=V/L92FRFgiiCJqx7+qD5x7xDuXOncXkpm0xZ6CDOsbRwhJNQaeiEAHGppfHLEoTzvR
 COmqHaBR+zRXdZAfpon5kBRh9z46bJaponqyoFetR7/9xh7xaYmwE8KWBKngtwsqDHXA
 ILzQVSjYMxCmqQdKj5bgZ++gKjrOXAbrnm86QKgiPeUrLTz6xtwRJQURobviS/MbDnvp
 AqwKWlwCr/L/cLN/B2BXoM9b5pnPvFzaDpGDcVYL8sJm9ApXzZ+4gHHSJ1j9PI5xHPHF
 q+Sisdgh/FMBU/pgMx44+cODn2+kszqxsXsTl48TjsYQEyxSRaFTJP30eP+dVq3f5rIp
 hvxA==
X-Gm-Message-State: ANhLgQ3aU7szxA2iE3gYG3kb59dhwuGiBB7C+Yp1Dijym3LMVKVxiHll
 msTbKNcFmaGD/EdIhPRYL8SJOb9k51G0TWqfwR0=
X-Google-Smtp-Source: ADFU+vtX+T8IB2dKEZ4QKwYh2vsBVSq8O0+zGDVCzJ84J3sN37QS7BQKY9FAOxPVr4nlf0G+SWHJHgt2r7sLBWEbFGs=
X-Received: by 2002:a65:4cc1:: with SMTP id n1mr2683937pgt.94.1584509181265;
 Tue, 17 Mar 2020 22:26:21 -0700 (PDT)
MIME-Version: 1.0
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 18 Mar 2020 13:25:45 +0800
Message-ID: <CAF12kFv5dEAGmcQLziDjDzsYWmQ3J6tcqW6GK_oB7YDsaBbc-A@mail.gmail.com>
To: orsonzhai@gmail.com, ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] uart: add uart testcase in kernel device-driver
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
Cc: ceh@ti.com
Content-Type: multipart/mixed; boundary="===============0162061403=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0162061403==
Content-Type: multipart/alternative; boundary="000000000000e48ab605a11a4a5b"

--000000000000e48ab605a11a4a5b
Content-Type: text/plain; charset="UTF-8"

Porting UART test from ltp-ddt back to ltp. only test 115200 UART_RATE.

[TODO] support more rate, and add test HWFLOW function test.

Signed-off-by: Orson Zhai <orson@gmail.com>
Signed-off-by: Cixi Geng <gengcixi@gmail.com>
Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 runtest/kernel_ddt                            |   1 +
 testcases/kernel/device-drivers/Makefile      |   1 +
 testcases/kernel/device-drivers/uart/Makefile |  22 ++++
 .../kernel/device-drivers/uart/serialcheck.sh | 111 ++++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 runtest/kernel_ddt
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100755 testcases/kernel/device-drivers/uart/serialcheck.sh

diff --git a/runtest/kernel_ddt b/runtest/kernel_ddt
new file mode 100644
index 000000000..30e9a0269
--- /dev/null
+++ b/runtest/kernel_ddt
@@ -0,0 +1 @@
+uart serialcheck.sh
diff --git a/testcases/kernel/device-drivers/Makefile
b/testcases/kernel/device-drivers/Makefile
index 55e0d25a0..a214f211b 100644
--- a/testcases/kernel/device-drivers/Makefile
+++ b/testcases/kernel/device-drivers/Makefile
@@ -27,6 +27,7 @@ SUBDIRS := acpi \
    rtc \
    tbio \
    uaccess \
+   uart \
    zram

 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/device-drivers/uart/Makefile
b/testcases/kernel/device-drivers/uart/Makefile
new file mode 100644
index 000000000..0d73f6635
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/Makefile
@@ -0,0 +1,22 @@
+# Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; either version 2 of
+# the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it would be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write the Free Software Foundation,
+# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+top_srcdir ?= ../../../..
+include $(top_srcdir)/include/mk/testcases.mk
+
+INSTALL_TARGETS := *.sh
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/device-drivers/uart/serialcheck.sh
b/testcases/kernel/device-drivers/uart/serialcheck.sh
new file mode 100755
index 000000000..f4cf13e02
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/serialcheck.sh
@@ -0,0 +1,111 @@
+#!/bin/sh
+###############################################################################
+#
+# Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+# Copyright (C) 2019, Unisoc Communications Inc.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation version 2.
+#
+# This program is distributed "as is" WITHOUT ANY WARRANTY of any
+# kind, whether express or implied; without even the implied warranty
+# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+###############################################################################
+
+# @desc Test UART ports using git://
git.breakpoint.cc/bigeasy/serialcheck.git
+
+#### Functions definitions ####
+usage()
+{
+    echo "usage: ./${0##*/} [-r UART_RATE] [-l LOOPS] [-x to enable HW
flow control]"
+    exit 1
+}
+
+# Default values
+: ${UART_RATE:=115200}
+: ${UART_LOOPS:=5}
+: ${UART_HWFLOW:=0}
+
+PORTS_TO_TEST=();
+UART_PORTS=();
+ARRAY=(`find /sys/class/tty/*/uartclk`);
+
+check_requirements()
+{
+ which serialcheck
+ ret=$?
+ if [ $ret -eq 0 ];then
+ tst_res TINFO "serialcheck command is in system,continue to test"
+ else
+ tst_brk TCONF "test failed for lack of requirement,returned is $ret"
+ fi
+
+}
+
+create_test_file()
+{
+    temp_test_file=`mktemp`
+    dd if=/dev/urandom of=$temp_test_file count=1 bs=$((UART_RATE / 2))
+}
+
+get_uart_ports()
+{
+for i in ${ARRAY[@]}; do
+    PORT=/dev/`echo $i | cut -d'/' -f 5`
+    # Activate port in case it will be initialized only when startup
+    echo "DDT TESTING" > $PORT 2>/dev/null
+    if [ `cat $i` -ne 0 ]; then
+        UART_PORTS=("${UART_PORTS[@]}" "$PORT")
+    fi
+done
+}
+
+filter_out_used_ports()
+{
+ which lsof
+ ret=$?
+ if [ $ret -eq 0 ];then
+ tst_res TINFO "lsof command exist, filter out used ports";
+ else
+ tst_brk TCONF "test failed for lack of requirement,returned is $ret"
+ fi
+
+    for i in ${UART_PORTS[@]}; do
+        lsof | grep $i &> /dev/null ||
PORTS_TO_TEST=("${PORTS_TO_TEST[@]}" $i)
+    done
+}
+
+run_serial_test()
+{
+ create_test_file
+    for i in ${PORTS_TO_TEST[@]}; do
+        if [ $UART_HWFLOW -eq 0 ]; then
+            { sleep 1; serialcheck -b $UART_RATE -d $i -f $temp_test_file
-l $UART_LOOPS -m t -k; }&
+            PID=$!
+            serialcheck -b $UART_RATE -d $i -f $temp_test_file -l
$UART_LOOPS -m r -k || { kill -- -$PID 2>/dev/null; tst_res TFAIL "TEST
FAILED"; }
+        else
+            { sleep 1; serialcheck -b $UART_RATE -d $i -f $temp_test_file
-l $UART_LOOPS -m t -h; } &
+            PID=$!
+            serialcheck -b $UART_RATE -d $i -f $temp_test_file -l
$UART_LOOPS -m r -h || { kill -- -$PID 2>/dev/null; tst_res TFAIL "TEST
FAILED"; }
+        fi
+    done
+    rm $temp_test_file
+ tst_res TPASS "uart test passed"
+}
+
+
+TST_TESTFUNC=do_test
+. tst_test.sh
+
+do_test()
+{
+ check_requirements
+ get_uart_ports
+ filter_out_used_ports
+ run_serial_test
+}
+
+tst_run
-- 
2.17.1

--000000000000e48ab605a11a4a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Porting UART test from ltp-ddt back to ltp. only test =
115200 UART_RATE.<br><br>[TODO] support more rate, and add test HWFLOW func=
tion test.<br><br>Signed-off-by: Orson Zhai &lt;<a href=3D"mailto:orson@gma=
il.com">orson@gmail.com</a>&gt;<br>Signed-off-by: Cixi Geng &lt;<a href=3D"=
mailto:gengcixi@gmail.com">gengcixi@gmail.com</a>&gt;<div>Signed-off-by: Ca=
rlos Hernandez &lt;<a href=3D"mailto:ceh@ti.com">ceh@ti.com</a>&gt;<br>---<=
br>=C2=A0runtest/kernel_ddt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>=C2=A0t=
estcases/kernel/device-drivers/Makefile =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br=
>=C2=A0testcases/kernel/device-drivers/uart/Makefile | =C2=A022 ++++<br>=C2=
=A0.../kernel/device-drivers/uart/serialcheck.sh | 111 ++++++++++++++++++<b=
r>=C2=A04 files changed, 135 insertions(+)<br>=C2=A0create mode 100644 runt=
est/kernel_ddt<br>=C2=A0create mode 100644 testcases/kernel/device-drivers/=
uart/Makefile<br>=C2=A0create mode 100755 testcases/kernel/device-drivers/u=
art/serialcheck.sh<br><br>diff --git a/runtest/kernel_ddt b/runtest/kernel_=
ddt<br>new file mode 100644<br>index 000000000..30e9a0269<br>--- /dev/null<=
br>+++ b/runtest/kernel_ddt<br>@@ -0,0 +1 @@<br>+uart serialcheck.sh<br>dif=
f --git a/testcases/kernel/device-drivers/Makefile b/testcases/kernel/devic=
e-drivers/Makefile<br>index 55e0d25a0..a214f211b 100644<br>--- a/testcases/=
kernel/device-drivers/Makefile<br>+++ b/testcases/kernel/device-drivers/Mak=
efile<br>@@ -27,6 +27,7 @@ SUBDIRS		:=3D acpi \<br>=C2=A0		 =C2=A0 rtc \<br=
>=C2=A0		 =C2=A0 tbio \<br>=C2=A0		 =C2=A0 uaccess \<br>+		 =C2=A0 uart \<b=
r>=C2=A0		 =C2=A0 zram<br>=C2=A0<br>=C2=A0include $(top_srcdir)/include/mk/=
<a href=3D"http://generic_trunk_target.mk">generic_trunk_target.mk</a><br>d=
iff --git a/testcases/kernel/device-drivers/uart/Makefile b/testcases/kerne=
l/device-drivers/uart/Makefile<br>new file mode 100644<br>index 000000000..=
0d73f6635<br>--- /dev/null<br>+++ b/testcases/kernel/device-drivers/uart/Ma=
kefile<br>@@ -0,0 +1,22 @@<br>+# Copyright (c) 2015 Oracle and/or its affil=
iates. All Rights Reserved.<br>+#<br>+# This program is free software; you =
can redistribute it and/or<br>+# modify it under the terms of the GNU Gener=
al Public License as<br>+# published by the Free Software Foundation; eithe=
r version 2 of<br>+# the License, or (at your option) any later version.<br=
>+#<br>+# This program is distributed in the hope that it would be useful,<=
br>+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>+# =
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>+# GN=
U General Public License for more details.<br>+#<br>+# You should have rece=
ived a copy of the GNU General Public License<br>+# along with this program=
; if not, write the Free Software Foundation,<br>+# Inc., =C2=A051 Franklin=
 St, Fifth Floor, Boston, MA =C2=A002110-1301 =C2=A0USA<br>+<br>+top_srcdir=
	?=3D ../../../..<br>+include $(top_srcdir)/include/mk/<a href=3D"http://te=
stcases.mk">testcases.mk</a><br>+<br>+INSTALL_TARGETS		:=3D *.sh<br>+<br>+i=
nclude $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk">g=
eneric_leaf_target.mk</a><br>diff --git a/testcases/kernel/device-drivers/u=
art/serialcheck.sh b/testcases/kernel/device-drivers/uart/serialcheck.sh<br=
>new file mode 100755<br>index 000000000..f4cf13e02<br>--- /dev/null<br>+++=
 b/testcases/kernel/device-drivers/uart/serialcheck.sh<br>@@ -0,0 +1,111 @@=
<br>+#!/bin/sh<br>+########################################################=
#######################<br>+#<br>+# Copyright (C) 2015 Texas Instruments In=
corporated - <a href=3D"http://www.ti.com/">http://www.ti.com/</a><br>+# Co=
pyright (C) 2019, Unisoc Communications Inc.<br>+#<br>+# This program is fr=
ee software; you can redistribute it and/or<br>+# modify it under the terms=
 of the GNU General Public License as<br>+# published by the Free Software =
Foundation version 2.<br>+#<br>+# This program is distributed &quot;as is&q=
uot; WITHOUT ANY WARRANTY of any<br>+# kind, whether express or implied; wi=
thout even the implied warranty<br>+# of MERCHANTABILITY or FITNESS FOR A P=
ARTICULAR PURPOSE.=C2=A0 See the<br>+# GNU General Public License for more =
details.<br>+#<br>+########################################################=
#######################<br>+<br>+# @desc Test UART ports using git://<a hre=
f=3D"http://git.breakpoint.cc/bigeasy/serialcheck.git">git.breakpoint.cc/bi=
geasy/serialcheck.git</a><br>+<br>+#### Functions definitions ####<br>+usag=
e()<br>+{<br>+ =C2=A0 =C2=A0echo &quot;usage: ./${0##*/} [-r UART_RATE] [-l=
 LOOPS] [-x to enable HW flow control]&quot;<br>+ =C2=A0 =C2=A0exit 1<br>+}=
<br>+<br>+# Default values<br>+: ${UART_RATE:=3D115200}<br>+: ${UART_LOOPS:=
=3D5}<br>+: ${UART_HWFLOW:=3D0}<br>+<br>+PORTS_TO_TEST=3D();<br>+UART_PORTS=
=3D();<br>+ARRAY=3D(`find /sys/class/tty/*/uartclk`);<br>+<br>+check_requir=
ements()<br>+{<br>+	which serialcheck<br>+	ret=3D$?<br>+	if [ $ret -eq 0 ];=
then<br>+		tst_res TINFO &quot;serialcheck command is in system,continue to=
 test&quot;<br>+	else<br>+		tst_brk TCONF &quot;test failed for lack of req=
uirement,returned is $ret&quot;<br>+	fi<br>+<br>+}<br>+<br>+create_test_fil=
e()<br>+{<br>+ =C2=A0 =C2=A0temp_test_file=3D`mktemp`<br>+ =C2=A0 =C2=A0dd =
if=3D/dev/urandom of=3D$temp_test_file count=3D1 bs=3D$((UART_RATE / 2))<br=
>+}<br>+<br>+get_uart_ports()<br>+{<br>+for i in ${ARRAY[@]}; do<br>+ =C2=
=A0 =C2=A0PORT=3D/dev/`echo $i | cut -d&#39;/&#39; -f 5`<br>+ =C2=A0 =C2=A0=
# Activate port in case it will be initialized only when startup<br>+ =C2=
=A0 =C2=A0echo &quot;DDT TESTING&quot; &gt; $PORT 2&gt;/dev/null<br>+ =C2=
=A0 =C2=A0if [ `cat $i` -ne 0 ]; then<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0UART_=
PORTS=3D(&quot;${UART_PORTS[@]}&quot; &quot;$PORT&quot;)<br>+ =C2=A0 =C2=A0=
fi<br>+done<br>+}<br>+<br>+filter_out_used_ports()<br>+{<br>+	which lsof<br=
>+	ret=3D$?<br>+	if [ $ret -eq 0 ];then<br>+		tst_res TINFO &quot;lsof comm=
and exist, filter out used ports&quot;;<br>+	else<br>+		tst_brk TCONF &quot=
;test failed for lack of requirement,returned is $ret&quot;<br>+	fi<br>+<br=
>+ =C2=A0 =C2=A0for i in ${UART_PORTS[@]}; do<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lsof | grep $i &amp;&gt; /dev/null || PORTS_TO_TEST=3D(&quot;${PORTS_TO_=
TEST[@]}&quot; $i)<br>+ =C2=A0 =C2=A0done<br>+}<br>+<br>+run_serial_test()<=
br>+{<br>+	create_test_file<br>+ =C2=A0 =C2=A0for i in ${PORTS_TO_TEST[@]};=
 do<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $UART_HWFLOW -eq 0 ]; then<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ sleep 1; serialcheck -b $UART_RA=
TE -d $i -f $temp_test_file -l $UART_LOOPS -m t -k; }&amp;<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PID=3D$!<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0serialcheck -b $UART_RATE -d $i -f $temp_test_file -l $UART_LO=
OPS -m r -k || { kill -- -$PID 2&gt;/dev/null; tst_res TFAIL &quot;TEST FAI=
LED&quot;; }<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0{ sleep 1; serialcheck -b $UART_RATE -d $i -f $temp_te=
st_file -l $UART_LOOPS -m t -h; } &amp;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PID=3D$!<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serialc=
heck -b $UART_RATE -d $i -f $temp_test_file -l $UART_LOOPS -m r -h || { kil=
l -- -$PID 2&gt;/dev/null; tst_res TFAIL &quot;TEST FAILED&quot;; }<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>+ =C2=A0 =C2=A0done<br>+ =C2=A0 =C2=A0rm $=
temp_test_file<br>+	tst_res TPASS &quot;uart test passed&quot;<br>+}<br>+<b=
r>+<br>+TST_TESTFUNC=3Ddo_test<br>+. tst_test.sh<br>+<br>+do_test()<br>+{<b=
r>+	check_requirements<br>+	get_uart_ports<br>+	filter_out_used_ports<br>+	=
run_serial_test<br>+}<br>+<br>+tst_run<br>-- <br>2.17.1<br><br></div></div>

--000000000000e48ab605a11a4a5b--

--===============0162061403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0162061403==--
