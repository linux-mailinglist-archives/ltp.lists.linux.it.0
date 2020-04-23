Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 292061B78AE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E69E73C2A4B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 16:59:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8A7773C293E
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 07:57:30 +0200 (CEST)
Received: from mail.rt-rk.com (mx2.rt-rk.com [89.216.37.149])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 19C1C600A99
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 07:57:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 80D2B1A003B;
 Thu, 23 Apr 2020 07:57:28 +0200 (CEST)
Received: by mail.rt-rk.com (Postfix, from userid 492)
 id 306821A1DD8; Thu, 23 Apr 2020 07:57:22 +0200 (CEST)
in-reply-to: <20200422152841.13432-2-fbozuta1@gmail.com>
to: "Filip Bozuta" <fbozuta1@gmail.com>
from: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
message-id: <c56-5ea12e80-9-92f1fc0@105057790>
X-Forward: 127.0.0.1
date: Thu, 23 Apr 2020 07:57:22 +0200
MIME-Version: 1.0
User-Agent: SOGoMail 2.3.10
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 24 Apr 2020 16:59:06 +0200
Subject: Re: [LTP] 
 =?utf-8?b?Pz09P3V0Zi04P3E/ID89PT91dGYtOD9xPyBbUEFUQ0ggMS8z?=
 =?utf-8?q?=5D=3F=3D=3D=3Futf-8=3Fq=3F_testcases/kernel/syscalls/ioctl=3A_?=
 =?utf-8?q?_Add_test_for_RTC_ioctls_used_to_read_and_set_RTC_time?=
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
Content-Type: multipart/mixed; boundary="===============0870876454=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0870876454==
content-type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-3158-1587621442.175964-4------"

------=_=-_OpenGroupware_org_NGMime-3158-1587621442.175964-4------
content-type: text/plain; charset=utf-8
content-length: 1825
content-transfer-encoding: quoted-printable


Hi, Filip.

This is a very unclear way to set the structure elements:

+=C2=A0=C2=A0 =C2=A0struct rtc=5Ftime rtc=5Fset=5Ftime =3D {0, 15, 13, =
26, 8, 119, 0, 0, 0};

Simple setting structure elements separately would be much better.

Also, why do you use such numbers: 15, 13,...? Is it just a random choi=
ce?

Thanks,
Aleksandar

-------- Original Message --------
Subject: [LTP] [PATCH 1/3] testcases/kernel/syscalls/ioctl: Add test fo=
r RTC ioctls used to read and set RTC time
Date: Wednesday, April 22, 2020 17:28 CEST
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
CC: pvorel@suse.cz, Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu
References: <20200422152841.13432-1-fbozuta1@gmail.com>


=C2=A0
This patch tests functionalities of following ioctls:

RTC=5FRD=5FTIME - Getting RTC time

Returns this RTC's time in the following structure:

struct rtc=5Ftime {
int tm=5Fsec;
int tm=5Fmin;
int tm=5Fhour;
int tm=5Fmday;
int tm=5Fmon;
int tm=5Fyear;
int tm=5Fwday; /* unused */
int tm=5Fyday; /* unused */
int tm=5Fisdst; /* unused */
};

The fields in this structure have the same meaning and
ranges as the tm structure described in gmtime man page.
A pointer to this structure should be passed as the third
ioctl argument.

RTC=5FSET=5FTIME - Setting RTC time

Sets this RTC's time to the time specified by the rtc=5Ftime
structure pointed to by the third ioctl argument. To set the
RTC's time the process must be privileged (i.e., have the
CAP=5FSYS=5FTIME capability).

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
runtest/syscalls | 2 +
testcases/kernel/syscalls/ioctl/.gitignore | 1 +
testcases/kernel/syscalls/ioctl/ioctl=5Frtc01.c | 112 +++++++++++++++++=
+
3 files changed, 115 insertions(+)
create mode 100644 testcases/kernel/syscalls/ioctl/ioctl=5Frtc01.c
=C2=A0


=C2=A0

------=_=-_OpenGroupware_org_NGMime-3158-1587621442.175964-4------
content-type: text/html; charset=utf-8
content-length: 2353
content-transfer-encoding: quoted-printable

<html>Hi, Filip.<br /><br />This is a very unclear way to set the struc=
ture elements:<br /><br />+&nbsp;&nbsp; &nbsp;struct rtc=5Ftime rtc=5Fs=
et=5Ftime =3D {0, 15, 13, 26, 8, 119, 0, 0, 0};<br /><br />Simple setti=
ng structure elements separately would be much better.<br /><br />Also,=
 why do you use such numbers: 15, 13,...? Is it just a random choice?<b=
r /><br />Thanks,<br />Aleksandar<br /><br />-------- Original Message =
--------<br />Subject: [LTP] [PATCH 1/3] testcases/kernel/syscalls/ioct=
l: Add test for RTC ioctls used to read and set RTC time<br />Date: Wed=
nesday, April 22, 2020 17:28 CEST<br />From: Filip Bozuta &lt;fbozuta1@=
gmail.com&gt;<br />To: ltp@lists.linux.it<br />CC: pvorel@suse.cz, Alek=
sandar.Markovic@rt-rk.com, laurent@vivier.eu<br />References: &lt;20200=
422152841.13432-1-fbozuta1@gmail.com&gt;<br /><br /><br />&nbsp;<blockq=
uote type=3D"cite" cite=3D"20200422152841.13432-2-fbozuta1@gmail.com"><=
br />This patch tests functionalities of following ioctls:<br /><br />R=
TC=5FRD=5FTIME - Getting RTC time<br /><br />Returns this RTC&#39;s tim=
e in the following structure:<br /><br />struct rtc=5Ftime {<br />int t=
m=5Fsec;<br />int tm=5Fmin;<br />int tm=5Fhour;<br />int tm=5Fmday;<br =
/>int tm=5Fmon;<br />int tm=5Fyear;<br />int tm=5Fwday; /* unused */<br=
 />int tm=5Fyday; /* unused */<br />int tm=5Fisdst; /* unused */<br />}=
;<br /><br />The fields in this structure have the same meaning and<br =
/>ranges as the tm structure described in gmtime man page.<br />A point=
er to this structure should be passed as the third<br />ioctl argument.=
<br /><br />RTC=5FSET=5FTIME - Setting RTC time<br /><br />Sets this RT=
C&#39;s time to the time specified by the rtc=5Ftime<br />structure poi=
nted to by the third ioctl argument. To set the<br />RTC&#39;s time the=
 process must be privileged (i.e., have the<br />CAP=5FSYS=5FTIME capab=
ility).<br /><br />Signed-off-by: Filip Bozuta &lt;Filip.Bozuta@rt-rk.c=
om&gt;<br />---<br />runtest/syscalls | 2 +<br />testcases/kernel/sysca=
lls/ioctl/.gitignore | 1 +<br />testcases/kernel/syscalls/ioctl/ioctl=5F=
rtc01.c | 112 ++++++++++++++++++<br />3 files changed, 115 insertions(+=
)<br />create mode 100644 testcases/kernel/syscalls/ioctl/ioctl=5Frtc01=
.c<br />&nbsp;</blockquote><br /><br /><br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-3158-1587621442.175964-4--------


--===============0870876454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0870876454==--

