Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 903371B78AD
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F01453C2D79
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9BBFA3C293E
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 07:43:15 +0200 (CEST)
Received: from mail.rt-rk.com (mx2.rt-rk.com [89.216.37.149])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 46F59200C88
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 07:43:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2982F1A0569;
 Thu, 23 Apr 2020 07:43:12 +0200 (CEST)
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id E79721A2161; Thu, 23 Apr 2020 07:43:09 +0200 (CEST)
in-reply-to: <20200422152841.13432-4-fbozuta1@gmail.com>
to: "Filip Bozuta" <fbozuta1@gmail.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <68c8-5ea12b00-1-40efc680@15495192>
X-Forward: 127.0.0.1
date: Thu, 23 Apr 2020 07:43:09 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 24 Apr 2020 16:59:06 +0200
Subject: Re: [LTP] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFUQ0ggMy8z?=
 =?utf-8?q?=5D=3F=3D=3D=3Futf-8=3Fq=3F_testcases/kernel/syscalls/ioctl=3A_?=
 =?utf-8?q?Add_test_for_RTC_ioctls_used_to_turn_on/off_RTC_interrupts?=
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
Cc: laurent@vivier.eu, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0612677649=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0612677649==
content-type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-26824-1587620589.929385-0------"

------=_=-_OpenGroupware_org_NGMime-26824-1587620589.929385-0------
content-type: text/plain; charset=utf-8
content-length: 3011
content-transfer-encoding: quoted-printable


I thinks these lines:

+static int interrupt=5Frequests[] =3D {
+=C2=A0=C2=A0 =C2=A0RTC=5FAIE=5FON, RTC=5FPIE=5FON, RTC=5FUIE=5FON,
+=C2=A0=C2=A0 =C2=A0RTC=5FWIE=5FON, RTC=5FAIE=5FOFF, RTC=5FPIE=5FOFF,
+=C2=A0=C2=A0 =C2=A0RTC=5FUIE=5FOFF, RTC=5FWIE=5FOFF};
+static char requests=5Ftext[][15] =3D {
+=C2=A0=C2=A0 =C2=A0"RTC=5FAIE=5FON", "RTC=5FPIE=5FON", "RTC=5FUIE=5FON=
",
+=C2=A0=C2=A0 =C2=A0"RTC=5FWIE=5FON", "RTC=5FAIE=5FOFF", "RTC=5FPIE=5FO=
FF",
+=C2=A0=C2=A0 =C2=A0"RTC=5FUIE=5FOFF", "RTC=5FWIE=5FOFF"};

would look much clearer as:

static int interrupt=5Frequests[] =3D {
=C2=A0=C2=A0=C2=A0=C2=A0RTC=5FAIE=5FON,=C2=A0 RTC=5FPIE=5FON,=C2=A0 RTC=
=5FUIE=5FON,=C2=A0 RTC=5FWIE=5FON,
=C2=A0=C2=A0=C2=A0=C2=A0RTC=5FAIE=5FOFF, RTC=5FPIE=5FOFF, RTC=5FUIE=5FO=
FF, RTC=5FWIE=5FOFF};
static char requests=5Ftext[][15] =3D {
=C2=A0=C2=A0=C2=A0=C2=A0"RTC=5FAIE=5FON",=C2=A0 "RTC=5FPIE=5FON",=C2=A0=
 "RTC=5FUIE=5FON",=C2=A0 "RTC=5FWIE=5FON",
=C2=A0=C2=A0=C2=A0 "RTC=5FAIE=5FOFF", "RTC=5FPIE=5FOFF", "RTC=5FUIE=5FO=
FF", "RTC=5FWIE=5FOFF"};

Thanks, Aleksandar

P. S. (my email client doesn't handle tabs well (converts them to space=
s) - ofcourse, you keep tabs, I em not suggesting replacing them with s=
pace)


-------- Original Message --------
Subject: [LTP] [PATCH 3/3] testcases/kernel/syscalls/ioctl: Add test fo=
r RTC ioctls used to turn on/off RTC interrupts
Date: Wednesday, April 22, 2020 17:28 CEST
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
CC: pvorel@suse.cz, Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu
References: <20200422152841.13432-1-fbozuta1@gmail.com>


=C2=A0
This patch tests functionalities of following ioctls:

RTC=5FAIE=5FON, RTC=5FAIE=5FOFF - Alarm interrupt enabling on/off

Enable or disable the alarm interrupt, for RTCs that support
alarms. The third ioctl's argument is ignored.

RTC=5FUIE=5FON, RTC=5FUIE=5FOFF - Update interrupt enabling on/off

Enable or disable the interrupt on every clock update, for
RTCs that support this once-per-second interrupt. The third
ioctl's argument is ignored.

RTC=5FPIE=5FON, RTC=5FPIE=5FOFF - Periodic interrupt enabling on/off

Enable or disable the periodic interrupt, for RTCs that sup=E2=80=90
port these periodic interrupts. The third ioctl's argument
is ignored. Only a privileged process (i.e., one having the
CAP=5FSYS=5FRESOURCE capability) can enable the periodic interrupt
if the frequency is currently set above the value specified in
/proc/sys/dev/rtc/max-user-freq.

RTC=5FWIE=5FON, RTC=5FWIE=5FOFF - Watchdog interrupt enabling on/off

Enable or disable the Watchdog interrupt, for RTCs that sup-
port this Watchdog interrupt. The third ioctl's argument is
ignored.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
runtest/syscalls | 1 +
testcases/kernel/syscalls/ioctl/.gitignore | 1 +
testcases/kernel/syscalls/ioctl/ioctl=5Frtc03.c | 88 ++++++++++++++++++=
+
3 files changed, 90 insertions(+)
create mode 100644 testcases/kernel/syscalls/ioctl/ioctl=5Frtc03.c
=C2=A0


=C2=A0

------=_=-_OpenGroupware_org_NGMime-26824-1587620589.929385-0------
content-type: text/html; charset=utf-8
content-length: 3799
content-transfer-encoding: quoted-printable

<html>I thinks these lines:<br /><br />+static int interrupt=5Frequests=
[] =3D {<br />+&nbsp;&nbsp; &nbsp;RTC=5FAIE=5FON, RTC=5FPIE=5FON, RTC=5F=
UIE=5FON,<br />+&nbsp;&nbsp; &nbsp;RTC=5FWIE=5FON, RTC=5FAIE=5FOFF, RTC=
=5FPIE=5FOFF,<br />+&nbsp;&nbsp; &nbsp;RTC=5FUIE=5FOFF, RTC=5FWIE=5FOFF=
};<br />+static char requests=5Ftext[][15] =3D {<br />+&nbsp;&nbsp; &nb=
sp;&quot;RTC=5FAIE=5FON&quot;, &quot;RTC=5FPIE=5FON&quot;, &quot;RTC=5F=
UIE=5FON&quot;,<br />+&nbsp;&nbsp; &nbsp;&quot;RTC=5FWIE=5FON&quot;, &q=
uot;RTC=5FAIE=5FOFF&quot;, &quot;RTC=5FPIE=5FOFF&quot;,<br />+&nbsp;&nb=
sp; &nbsp;&quot;RTC=5FUIE=5FOFF&quot;, &quot;RTC=5FWIE=5FOFF&quot;};<br=
 /><br />would look much clearer as:<br /><br />static int interrupt=5F=
requests[] =3D {<br />&nbsp;&nbsp;&nbsp;&nbsp;RTC=5FAIE=5FON,&nbsp; RTC=
=5FPIE=5FON,&nbsp; RTC=5FUIE=5FON,&nbsp; RTC=5FWIE=5FON,<br />&nbsp;&nb=
sp;&nbsp;&nbsp;RTC=5FAIE=5FOFF, RTC=5FPIE=5FOFF, RTC=5FUIE=5FOFF, RTC=5F=
WIE=5FOFF};<br />static char requests=5Ftext[][15] =3D {<br />&nbsp;&nb=
sp;&nbsp;&nbsp;&quot;RTC=5FAIE=5FON&quot;,&nbsp; &quot;RTC=5FPIE=5FON&q=
uot;,&nbsp; &quot;RTC=5FUIE=5FON&quot;,&nbsp; &quot;RTC=5FWIE=5FON&quot=
;,<br />&nbsp;&nbsp;&nbsp; &quot;RTC=5FAIE=5FOFF&quot;, &quot;RTC=5FPIE=
=5FOFF&quot;, &quot;RTC=5FUIE=5FOFF&quot;, &quot;RTC=5FWIE=5FOFF&quot;}=
;<br /><br />Thanks, Aleksandar<br /><br />P. S. (my email client doesn=
&#39;t handle tabs well (converts them to spaces) - ofcourse, you keep =
tabs, I em not suggesting replacing them with space)<br /><br /><br />-=
------- Original Message --------<br />Subject: [LTP] [PATCH 3/3] testc=
ases/kernel/syscalls/ioctl: Add test for RTC ioctls used to turn on/off=
 RTC interrupts<br />Date: Wednesday, April 22, 2020 17:28 CEST<br />Fr=
om: Filip Bozuta &lt;fbozuta1@gmail.com&gt;<br />To: ltp@lists.linux.it=
<br />CC: pvorel@suse.cz, Aleksandar.Markovic@rt-rk.com, laurent@vivier=
.eu<br />References: &lt;20200422152841.13432-1-fbozuta1@gmail.com&gt;<=
br /><br /><br />&nbsp;<blockquote type=3D"cite" cite=3D"20200422152841=
.13432-4-fbozuta1@gmail.com"><br />This patch tests functionalities of =
following ioctls:<br /><br />RTC=5FAIE=5FON, RTC=5FAIE=5FOFF - Alarm in=
terrupt enabling on/off<br /><br />Enable or disable the alarm interrup=
t, for RTCs that support<br />alarms. The third ioctl&#39;s argument is=
 ignored.<br /><br />RTC=5FUIE=5FON, RTC=5FUIE=5FOFF - Update interrupt=
 enabling on/off<br /><br />Enable or disable the interrupt on every cl=
ock update, for<br />RTCs that support this once-per-second interrupt. =
The third<br />ioctl&#39;s argument is ignored.<br /><br />RTC=5FPIE=5F=
ON, RTC=5FPIE=5FOFF - Periodic interrupt enabling on/off<br /><br />Ena=
ble or disable the periodic interrupt, for RTCs that sup=E2=80=90<br />=
port these periodic interrupts. The third ioctl&#39;s argument<br />is =
ignored. Only a privileged process (i.e., one having the<br />CAP=5FSYS=
=5FRESOURCE capability) can enable the periodic interrupt<br />if the f=
requency is currently set above the value specified in<br />/proc/sys/d=
ev/rtc/max-user-freq.<br /><br />RTC=5FWIE=5FON, RTC=5FWIE=5FOFF - Watc=
hdog interrupt enabling on/off<br /><br />Enable or disable the Watchdo=
g interrupt, for RTCs that sup-<br />port this Watchdog interrupt. The =
third ioctl&#39;s argument is<br />ignored.<br /><br />Signed-off-by: F=
ilip Bozuta &lt;Filip.Bozuta@rt-rk.com&gt;<br />---<br />runtest/syscal=
ls | 1 +<br />testcases/kernel/syscalls/ioctl/.gitignore | 1 +<br />tes=
tcases/kernel/syscalls/ioctl/ioctl=5Frtc03.c | 88 +++++++++++++++++++<b=
r />3 files changed, 90 insertions(+)<br />create mode 100644 testcases=
/kernel/syscalls/ioctl/ioctl=5Frtc03.c<br />&nbsp;</blockquote><br /><b=
r /><br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-26824-1587620589.929385-0--------


--===============0612677649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0612677649==--

