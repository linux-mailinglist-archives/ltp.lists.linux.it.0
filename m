Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48110305242
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 06:43:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C43CF3C5E93
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 06:43:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CD37B3C246D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 06:42:54 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.220])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9206860091F
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 06:42:49 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:43949.184541145
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-72f1b7b886394f5bb898d72727e4805d
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 643EA280072;
 Wed, 27 Jan 2021 13:42:43 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 72f1b7b886394f5bb898d72727e4805d for
 liwang@redhat.com; Wed Jan 27 13:42:46 2021
X-Transaction-ID: 72f1b7b886394f5bb898d72727e4805d
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 13:42:41 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Li Wang" <liwang@redhat.com>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
X-Priority: 3
X-GUID: 4BF625B2-FAC5-49FD-9049-E81975BD6768
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202101271342412253283@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1166295157=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1166295157==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart106338751431_=----"

This is a multi-part message in MIME format.

------=_001_NextPart106338751431_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

b2vvvIx0aGFua3MgZm9yIHlvdXIgZGlyZWN0aW9uISANCiANCkZyb206IExpIFdhbmcNCkRhdGU6
IDIwMjEtMDEtMjcgMTI6MjcNClRvOiBYaW5wZW5nIExpdQ0KQ0M6IExUUCBMaXN0DQpTdWJqZWN0
OiBSZTogW0xUUF0gW1BBVENIIDEvMl0gc3lzY2FsbHMvaW9jdGw6IGlvY3RsX3NnMDEuYzogaW9j
dGxfc2cwMSBpbnZva2VkIG9vbS1raWxsZXINCkhpIFhpbnBlbmcsDQoNCk9uIFdlZCwgSmFuIDI3
LCAyMDIxIGF0IDExOjI4IEFNIFhpbnBlbmcgTGl1IDxsaXV4cDExQGNoaW5hdGVsZWNvbS5jbj4g
d3JvdGU6DQpLZXJuZWwgdmVyc2lvbiBpcyA1LjQuODErLHRoZSBhdmFpbGFibGUgUkFNIGlzIGxl
c3MgdGhhbiBmcmVlLGFzIGZvbGxvdzoNCltyb290QGxpdXhwIG15d29ya10jIGhlYWQgL3Byb2Mv
bWVtaW5mbw0KTWVtVG90YWw6ICAgICAgIDE5ODEwMTc0NCBrQg0KTWVtRnJlZTogICAgICAgIDE4
OTMwMzE0OCBrQg0KTWVtQXZhaWxhYmxlOiAgIDE4ODU2NjczMiBrQg0KDQpTbyB1c2UgYXZhaWxh
YmxlIFJBTSB0byBhdm9pZCBPT00ga2lsbGVyLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaW5wZW5nIExp
dSA8bGl1eHAxMUBjaGluYXRlbGVjb20uY24+DQotLS0NCiBsaWIvdHN0X21lbXV0aWxzLmMgfCAy
OSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvbGliL3RzdF9tZW11dGls
cy5jIGIvbGliL3RzdF9tZW11dGlscy5jDQppbmRleCBkZDA5ZGI0Li4yMWRmOWE4IDEwMDY0NA0K
LS0tIGEvbGliL3RzdF9tZW11dGlscy5jDQorKysgYi9saWIvdHN0X21lbXV0aWxzLmMNCkBAIC0x
MCwxNCArMTAsMzMgQEANCg0KICNkZWZpbmUgVFNUX05PX0RFRkFVTFRfTUFJTg0KICNpbmNsdWRl
ICJ0c3RfdGVzdC5oIg0KKyNpbmNsdWRlICJ0c3Rfc2FmZV9zdGRpby5oIg0KDQogI2RlZmluZSBC
TE9DS1NJWkUgKDE2ICogMTAyNCAqIDEwMjQpDQoNCitzdGF0aWMgdW5zaWduZWQgbG9uZyBnZXRf
YXZhaWxhYmxlX3JhbSh2b2lkKQ0KK3sNCisgICAgICAgY2hhciBidWZbNjBdOyAvKiBhY3R1YWwg
bGluZXMgd2UgZXhwZWN0IGFyZSB+MzAgY2hhcnMgb3IgbGVzcyAqLw0KKyAgICAgICB1bnNpZ25l
ZCBsb25nIGF2YWlsYWJsZV9rYiA9IDA7DQorICAgICAgIEZJTEUgKmZwOw0KKw0KKyAgICAgICBm
cCA9IFNBRkVfRk9QRU4oIi9wcm9jL21lbWluZm8iLCJyIik7DQorICAgICAgIHdoaWxlIChmZ2V0
cyhidWYsIHNpemVvZihidWYpLCBmcCkpIHsNCisgICAgICAgICAgICAgICBpZiAoc3NjYW5mKGJ1
ZiwgIk1lbUF2YWlsYWJsZTogJWx1ICUqc1xuIiwgJmF2YWlsYWJsZV9rYikgPT0gMSl7DQorICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCisgICAgICAgICAgICAgICB9DQorICAgICAgIH0N
CisgICAgICAgU0FGRV9GQ0xPU0UoZnApOw0KKw0KKyAgICAgICByZXR1cm4gMTAyNCAqIGF2YWls
YWJsZV9rYjsNCit9DQorDQogdm9pZCB0c3RfcG9sbHV0ZV9tZW1vcnkoc2l6ZV90IG1heHNpemUs
IGludCBmaWxsY2hhcikNCiB7DQogICAgICAgIHNpemVfdCBpLCBtYXBfY291bnQgPSAwLCBzYWZl
dHkgPSAwLCBibG9ja3NpemUgPSBCTE9DS1NJWkU7DQogICAgICAgIHZvaWQgKiptYXBfYmxvY2tz
Ow0KICAgICAgICBzdHJ1Y3Qgc3lzaW5mbyBpbmZvOw0KKyAgICAgICB1bnNpZ25lZCBsb25nIGF2
YWlsYWJsZV9yYW0gPSBnZXRfYXZhaWxhYmxlX3JhbSgpOw0KDQpMVFAgcHJvdmlkZXMgU0FGRV9S
RUFEX01FTUlORk8oKSBtYWNybyB0byBiZSB1c2VkIGluIC9wcm9jL21lbWluZm8gcmVhZGluZy4N
ClNlZTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0
ZXIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc3dhcHBpbmcvc3dhcHBpbmcwMS5jI0w4NQ0KDQogDQoN
CiAgICAgICAgU0FGRV9TWVNJTkZPKCZpbmZvKTsNCiAgICAgICAgc2FmZXR5ID0gTUFYKDQwOTYg
KiBTQUZFX1NZU0NPTkYoX1NDX1BBR0VTSVpFKSwgMTI4ICogMTAyNCAqIDEwMjQpOw0KQEAgLTI2
LDE1ICs0NSwxOSBAQCB2b2lkIHRzdF9wb2xsdXRlX21lbW9yeShzaXplX3QgbWF4c2l6ZSwgaW50
IGZpbGxjaGFyKQ0KICAgICAgICBpZiAoaW5mby5mcmVlc3dhcCA+IHNhZmV0eSkNCiAgICAgICAg
ICAgICAgICBzYWZldHkgPSAwOw0KDQorICAgICAgIC8qIk1lbUF2YWlsYWJsZSIgZmllbGQgbWF5
YmUgbm90IGV4aXN0LCBvciBmcmVlcmFtIGxlc3MgdGhhbiBhdmFpbGFibGVfcmFtKi8NCisgICAg
ICAgaWYoYXZhaWxhYmxlX3JhbSA9PSAwIHx8IGluZm8uZnJlZXJhbSA8IGF2YWlsYWJsZV9yYW0p
DQorICAgICAgICAgICAgICAgYXZhaWxhYmxlX3JhbSA9IGluZm8uZnJlZXJhbTsNCisNCiAgICAg
ICAgLyogTm90IGVub3VnaCBmcmVlIG1lbW9yeSB0byBhdm9pZCBpbnZva2luZyBPT00ga2lsbGVy
ICovDQotICAgICAgIGlmIChpbmZvLmZyZWVyYW0gPD0gc2FmZXR5KQ0KKyAgICAgICBpZiAoYXZh
aWxhYmxlX3JhbSA8PSBzYWZldHkpDQogICAgICAgICAgICAgICAgcmV0dXJuOw0KDQogICAgICAg
IGlmICghbWF4c2l6ZSkNCiAgICAgICAgICAgICAgICBtYXhzaXplID0gU0laRV9NQVg7DQoNCi0g
ICAgICAgaWYgKGluZm8uZnJlZXJhbSAtIHNhZmV0eSA8IG1heHNpemUgLyBpbmZvLm1lbV91bml0
KQ0KLSAgICAgICAgICAgICAgIG1heHNpemUgPSAoaW5mby5mcmVlcmFtIC0gc2FmZXR5KSAqIGlu
Zm8ubWVtX3VuaXQ7DQorICAgICAgIGlmIChhdmFpbGFibGVfcmFtIC0gc2FmZXR5IDwgbWF4c2l6
ZSAvIGluZm8ubWVtX3VuaXQpDQorICAgICAgICAgICAgICAgbWF4c2l6ZSA9IChhdmFpbGFibGVf
cmFtIC0gc2FmZXR5KSAqIGluZm8ubWVtX3VuaXQ7DQoNCiAgICAgICAgYmxvY2tzaXplID0gTUlO
KG1heHNpemUsIGJsb2Nrc2l6ZSk7DQogICAgICAgIG1hcF9jb3VudCA9IG1heHNpemUgLyBibG9j
a3NpemU7DQotLSANCjEuOC4zLjENCg0KDQotLSANCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cA0KDQoNCg0KLS0gDQpSZWdhcmRzLA0KTGkgV2Fu
Zw0K

------=_001_NextPart106338751431_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210127133733536300 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div>ok=EF=BC=8Cthanks f=
or your direction!&nbsp;<span></span></div>=0A<blockquote style=3D"margin-=
Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><=
div>&nbsp;</div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;p=
adding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: =
8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef=
; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D=
"mailto:liwang@redhat.com">Li Wang</a></div><div><b>Date:</b>&nbsp;2021-01=
-27&nbsp;12:27</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chinate=
lecom.cn">Xinpeng Liu</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp@=
lists.linux.it">LTP List</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [PAT=
CH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div><=
/div></div><div><div class=3D"FoxDiv20210127133733536300"><div dir=3D"ltr"=
><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">H=
i Xinpeng,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Jan 27, 2021 at 11:28 AM Xinpeng Liu &lt;<a href=
=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Kernel versio=
n is 5.4.81+,the available RAM is less than free,as follow:<br>=0A[root@li=
uxp mywork]# head /proc/meminfo<br>=0AMemTotal:&nbsp; &nbsp; &nbsp; &nbsp;=
198101744 kB<br>=0AMemFree:&nbsp; &nbsp; &nbsp; &nbsp; 189303148 kB<br>=0A=
MemAvailable:&nbsp; &nbsp;188566732 kB<br>=0A<br>=0ASo use available RAM t=
o avoid OOM killer.<br>=0A<br>=0ASigned-off-by: Xinpeng Liu &lt;<a href=3D=
"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@chinatelecom.cn=
</a>&gt;<br>=0A---<br>=0A&nbsp;lib/tst_memutils.c | 29 +++++++++++++++++++=
+++++++---<br>=0A&nbsp;1 file changed, 26 insertions(+), 3 deletions(-)<br=
>=0A<br>=0Adiff --git a/lib/tst_memutils.c b/lib/tst_memutils.c<br>=0Ainde=
x dd09db4..21df9a8 100644<br>=0A--- a/lib/tst_memutils.c<br>=0A+++ b/lib/t=
st_memutils.c<br>=0A@@ -10,14 +10,33 @@<br>=0A<br>=0A&nbsp;#define TST_NO_=
DEFAULT_MAIN<br>=0A&nbsp;#include "tst_test.h"<br>=0A+#include "tst_safe_s=
tdio.h"<br>=0A<br>=0A&nbsp;#define BLOCKSIZE (16 * 1024 * 1024)<br>=0A<br>=
=0A+static unsigned long get_available_ram(void)<br>=0A+{<br>=0A+&nbsp; &n=
bsp; &nbsp; &nbsp;char buf[60]; /* actual lines we expect are ~30 chars or=
 less */<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;unsigned long available_kb =3D =
0;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;FILE *fp;<br>=0A+<br>=0A+&nbsp; &nbsp=
; &nbsp; &nbsp;fp =3D SAFE_FOPEN("/proc/meminfo","r");<br>=0A+&nbsp; &nbsp=
; &nbsp; &nbsp;while (fgets(buf, sizeof(buf), fp)) {<br>=0A+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (sscanf(buf, "MemAvailable: %l=
u %*s\n", &amp;available_kb) =3D=3D 1){<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>=0A+&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>=0A+&nbsp; &nbsp; =
&nbsp; &nbsp;}<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;SAFE_FCLOSE(fp);<br>=0A+<=
br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;return 1024 * available_kb;<br>=0A+}<br>=
=0A+<br>=0A&nbsp;void tst_pollute_memory(size_t maxsize, int fillchar)<br>=
=0A&nbsp;{<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; size_t i, map_count =3D 0, sa=
fety =3D 0, blocksize =3D BLOCKSIZE;<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; voi=
d **map_blocks;<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; struct sysinfo info;<br>=
=0A+&nbsp; &nbsp; &nbsp; &nbsp;unsigned long available_ram =3D get_availab=
le_ram();<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">LTP provides SAFE_READ_MEMINFO() macro to be us=
ed in /proc/meminfo reading.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">See: <a href=3D"https://github.com/linux-test-project/ltp/b=
lob/master/testcases/kernel/mem/swapping/swapping01.c#L85">https://github.=
com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapp=
ing01.c#L85</a></div><br></div><div>&nbsp;</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">=0A<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; SAFE_SYSINF=
O(&amp;info);<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; safety =3D MAX(4096 * SAFE=
_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);<br>=0A@@ -26,15 +45,19 @@ void=
 tst_pollute_memory(size_t maxsize, int fillchar)<br>=0A&nbsp; &nbsp; &nbs=
p; &nbsp; if (info.freeswap &gt; safety)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; safety =3D 0;<br>=0A<br>=0A+&nbsp; &nbsp; &nb=
sp; &nbsp;/*"MemAvailable" field maybe not exist, or freeram less than ava=
ilable_ram*/<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if(available_ram =3D=3D 0 |=
| info.freeram &lt; available_ram)<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;available_ram =3D info.freeram;<br>=0A+<br>=0A&nbsp=
; &nbsp; &nbsp; &nbsp; /* Not enough free memory to avoid invoking OOM kil=
ler */<br>=0A-&nbsp; &nbsp; &nbsp; &nbsp;if (info.freeram &lt;=3D safety)<=
br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if (available_ram &lt;=3D safety)<br>=0A=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>=0A<br>=
=0A&nbsp; &nbsp; &nbsp; &nbsp; if (!maxsize)<br>=0A&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; maxsize =3D SIZE_MAX;<br>=0A<br>=0A-&nbsp=
; &nbsp; &nbsp; &nbsp;if (info.freeram - safety &lt; maxsize / info.mem_un=
it)<br>=0A-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxsize =
=3D (info.freeram - safety) * info.mem_unit;<br>=0A+&nbsp; &nbsp; &nbsp; &=
nbsp;if (available_ram - safety &lt; maxsize / info.mem_unit)<br>=0A+&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxsize =3D (available_r=
am - safety) * info.mem_unit;<br>=0A<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; blo=
cksize =3D MIN(maxsize, blocksize);<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; map_=
count =3D maxsize / blocksize;<br>=0A-- <br>=0A1.8.3.1<br>=0A<br>=0A<br>=
=0A-- <br>=0AMailing list info: <a href=3D"https://lists.linux.it/listinfo=
/ltp" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/listinfo=
/ltp</a><br>=0A<br>=0A</blockquote></div><br clear=3D"all"><div><br></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Re=
gards,<br></div><div>Li Wang<br></div></div></div></div>=0A</div></div></b=
lockquote>=0A</body></html>
------=_001_NextPart106338751431_=------


--===============1166295157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1166295157==--

