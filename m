Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A71B78B1
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E25E3C2920
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 417F53C293C
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 08:01:04 +0200 (CEST)
Received: from mail.rt-rk.com (mx2.rt-rk.com [89.216.37.149])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 69FD51000D4D
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 08:01:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A0C0B1A2263;
 Thu, 23 Apr 2020 08:01:03 +0200 (CEST)
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id 739B21A223F; Thu, 23 Apr 2020 08:01:01 +0200 (CEST)
in-reply-to: <20200422152841.13432-3-fbozuta1@gmail.com>
to: "Filip Bozuta" <fbozuta1@gmail.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <1037-5ea12f00-b-69f42580@222291961>
X-Forward: 127.0.0.1
date: Thu, 23 Apr 2020 08:01:01 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 24 Apr 2020 16:59:06 +0200
Subject: Re: [LTP] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFUQ0ggMi8z?=
 =?utf-8?q?=5D=3F=3D=3D=3Futf-8=3Fq=3F_testcases/kernel/syscalls/ioctl=3A_?=
 =?utf-8?q?_Add_test_for_RTC_ioctls_used_to_read_and_set_RTC_alarm_time?=
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
Content-Type: multipart/mixed; boundary="===============0889483738=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0889483738==
content-type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-4151-1587621661.446767-5------"

------=_=-_OpenGroupware_org_NGMime-4151-1587621661.446767-5------
content-type: text/plain; charset=utf-8
content-length: 1368
content-transfer-encoding: quoted-printable


Similar to the situation in patch 1, you wrote:

+=C2=A0=C2=A0 =C2=A0struct rtc=5Ftime rtc=5Fset=5Falarm =3D {13, 35, 12=
};

In my opinion, this way of setting structure should be avoided.

Thanks,
Aleksandar

-------- Original Message --------
Subject: [LTP] [PATCH 2/3] testcases/kernel/syscalls/ioctl: Add test fo=
r RTC ioctls used to read and set RTC alarm time
Date: Wednesday, April 22, 2020 17:28 CEST
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
CC: pvorel@suse.cz, Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu
References: <20200422152841.13432-1-fbozuta1@gmail.com>


=C2=A0
This patch tests functionalities of following ioctls:

RTC=5FALM=5FREAD, RTC=5FALM=5FSET - Getting/Setting alarm time

Read and set the alarm time, for RTCs that support alarms.
The alarm interrupt must be separately enabled or disabled
using the RTC=5FAIE=5FON, RTC=5FAIE=5FOFF requests. The third ioctl's
argument is a pointer to a rtc=5Ftime structure. Only the tm=5Fsec,
tm=5Fmin, and tm=5Fhour fields of this structure are used.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
runtest/syscalls | 1 +
testcases/kernel/syscalls/ioctl/.gitignore | 1 +
testcases/kernel/syscalls/ioctl/ioctl=5Frtc02.c | 107 +++++++++++++++++=
+
3 files changed, 109 insertions(+)
create mode 100644 testcases/kernel/syscalls/ioctl/ioctl=5Frtc02.c
=C2=A0


=C2=A0

------=_=-_OpenGroupware_org_NGMime-4151-1587621661.446767-5------
content-type: text/html; charset=utf-8
content-length: 1747
content-transfer-encoding: quoted-printable

<html>Similar to the situation in patch 1, you wrote:<br /><br />+&nbsp=
;&nbsp; &nbsp;struct rtc=5Ftime rtc=5Fset=5Falarm =3D {13, 35, 12};<br =
/><br />In my opinion, this way of setting structure should be avoided.=
<br /><br />Thanks,<br />Aleksandar<br /><br />-------- Original Messag=
e --------<br />Subject: [LTP] [PATCH 2/3] testcases/kernel/syscalls/io=
ctl: Add test for RTC ioctls used to read and set RTC alarm time<br />D=
ate: Wednesday, April 22, 2020 17:28 CEST<br />From: Filip Bozuta &lt;f=
bozuta1@gmail.com&gt;<br />To: ltp@lists.linux.it<br />CC: pvorel@suse.=
cz, Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu<br />References: &=
lt;20200422152841.13432-1-fbozuta1@gmail.com&gt;<br /><br /><br />&nbsp=
;<blockquote type=3D"cite" cite=3D"20200422152841.13432-3-fbozuta1@gmai=
l.com"><br />This patch tests functionalities of following ioctls:<br /=
><br />RTC=5FALM=5FREAD, RTC=5FALM=5FSET - Getting/Setting alarm time<b=
r /><br />Read and set the alarm time, for RTCs that support alarms.<br=
 />The alarm interrupt must be separately enabled or disabled<br />usin=
g the RTC=5FAIE=5FON, RTC=5FAIE=5FOFF requests. The third ioctl&#39;s<b=
r />argument is a pointer to a rtc=5Ftime structure. Only the tm=5Fsec,=
<br />tm=5Fmin, and tm=5Fhour fields of this structure are used.<br /><=
br />Signed-off-by: Filip Bozuta &lt;Filip.Bozuta@rt-rk.com&gt;<br />--=
-<br />runtest/syscalls | 1 +<br />testcases/kernel/syscalls/ioctl/.git=
ignore | 1 +<br />testcases/kernel/syscalls/ioctl/ioctl=5Frtc02.c | 107=
 ++++++++++++++++++<br />3 files changed, 109 insertions(+)<br />create=
 mode 100644 testcases/kernel/syscalls/ioctl/ioctl=5Frtc02.c<br />&nbsp=
;</blockquote><br /><br /><br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-4151-1587621661.446767-5--------


--===============0889483738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0889483738==--

