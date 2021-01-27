Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A07305394
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:54:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC0663C5D1C
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:54:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 121A13C040C
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:54:13 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.223])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 352611A00E2D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:54:10 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:58269.560315079
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-ea3021319d33483ba7b2b4a518923438
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 810292800A6;
 Wed, 27 Jan 2021 14:54:08 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id ea3021319d33483ba7b2b4a518923438 for
 liwang@redhat.com; Wed Jan 27 14:54:09 2021
X-Transaction-ID: ea3021319d33483ba7b2b4a518923438
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 14:54:07 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Li Wang" <liwang@redhat.com>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
X-Priority: 3
X-GUID: DA698A18-268B-49CA-9E83-55EEB4CC9AA4
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012714540739834212@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1248350321=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1248350321==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart827227460734_=----"

This is a multi-part message in MIME format.

------=_001_NextPart827227460734_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTGksIA0KSGF2ZSBhIHF1ZXN0aW9uIGFib3V0IHVzaW5nIG1hY3JvIFNBRkVfUkVBRF9NRU1J
TkZPIGdldCBNZW1BdmFpbGFibGUgdmFsdWUsDQpTb21lIG9sZCBrZXJuZWxzIG1heWJlIG5vdCBw
cml2b2RlICJNZW1BdmFpbGFibGUiIGZpZWxkLCB3aGljaCB3aWxsIGJyb2tlbi4NCg0KIA0KRnJv
bTogTGkgV2FuZw0KRGF0ZTogMjAyMS0wMS0yNyAxMjoyNw0KVG86IFhpbnBlbmcgTGl1DQpDQzog
TFRQIExpc3QNClN1YmplY3Q6IFJlOiBbTFRQXSBbUEFUQ0ggMS8yXSBzeXNjYWxscy9pb2N0bDog
aW9jdGxfc2cwMS5jOiBpb2N0bF9zZzAxIGludm9rZWQgb29tLWtpbGxlcg0KSGkgWGlucGVuZywN
Cg0KT24gV2VkLCBKYW4gMjcsIDIwMjEgYXQgMTE6MjggQU0gWGlucGVuZyBMaXUgPGxpdXhwMTFA
Y2hpbmF0ZWxlY29tLmNuPiB3cm90ZToNCktlcm5lbCB2ZXJzaW9uIGlzIDUuNC44MSssdGhlIGF2
YWlsYWJsZSBSQU0gaXMgbGVzcyB0aGFuIGZyZWUsYXMgZm9sbG93Og0KW3Jvb3RAbGl1eHAgbXl3
b3JrXSMgaGVhZCAvcHJvYy9tZW1pbmZvDQpNZW1Ub3RhbDogICAgICAgMTk4MTAxNzQ0IGtCDQpN
ZW1GcmVlOiAgICAgICAgMTg5MzAzMTQ4IGtCDQpNZW1BdmFpbGFibGU6ICAgMTg4NTY2NzMyIGtC
DQoNClNvIHVzZSBhdmFpbGFibGUgUkFNIHRvIGF2b2lkIE9PTSBraWxsZXIuDQoNClNpZ25lZC1v
ZmYtYnk6IFhpbnBlbmcgTGl1IDxsaXV4cDExQGNoaW5hdGVsZWNvbS5jbj4NCi0tLQ0KIGxpYi90
c3RfbWVtdXRpbHMuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9saWIvdHN0X21lbXV0aWxzLmMgYi9saWIvdHN0X21lbXV0aWxzLmMNCmluZGV4IGRkMDlkYjQu
LjIxZGY5YTggMTAwNjQ0DQotLS0gYS9saWIvdHN0X21lbXV0aWxzLmMNCisrKyBiL2xpYi90c3Rf
bWVtdXRpbHMuYw0KQEAgLTEwLDE0ICsxMCwzMyBAQA0KDQogI2RlZmluZSBUU1RfTk9fREVGQVVM
VF9NQUlODQogI2luY2x1ZGUgInRzdF90ZXN0LmgiDQorI2luY2x1ZGUgInRzdF9zYWZlX3N0ZGlv
LmgiDQoNCiAjZGVmaW5lIEJMT0NLU0laRSAoMTYgKiAxMDI0ICogMTAyNCkNCg0KK3N0YXRpYyB1
bnNpZ25lZCBsb25nIGdldF9hdmFpbGFibGVfcmFtKHZvaWQpDQorew0KKyAgICAgICBjaGFyIGJ1
Zls2MF07IC8qIGFjdHVhbCBsaW5lcyB3ZSBleHBlY3QgYXJlIH4zMCBjaGFycyBvciBsZXNzICov
DQorICAgICAgIHVuc2lnbmVkIGxvbmcgYXZhaWxhYmxlX2tiID0gMDsNCisgICAgICAgRklMRSAq
ZnA7DQorDQorICAgICAgIGZwID0gU0FGRV9GT1BFTigiL3Byb2MvbWVtaW5mbyIsInIiKTsNCisg
ICAgICAgd2hpbGUgKGZnZXRzKGJ1Ziwgc2l6ZW9mKGJ1ZiksIGZwKSkgew0KKyAgICAgICAgICAg
ICAgIGlmIChzc2NhbmYoYnVmLCAiTWVtQXZhaWxhYmxlOiAlbHUgJSpzXG4iLCAmYXZhaWxhYmxl
X2tiKSA9PSAxKXsNCisgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgICAg
ICAgIH0NCisgICAgICAgfQ0KKyAgICAgICBTQUZFX0ZDTE9TRShmcCk7DQorDQorICAgICAgIHJl
dHVybiAxMDI0ICogYXZhaWxhYmxlX2tiOw0KK30NCisNCiB2b2lkIHRzdF9wb2xsdXRlX21lbW9y
eShzaXplX3QgbWF4c2l6ZSwgaW50IGZpbGxjaGFyKQ0KIHsNCiAgICAgICAgc2l6ZV90IGksIG1h
cF9jb3VudCA9IDAsIHNhZmV0eSA9IDAsIGJsb2Nrc2l6ZSA9IEJMT0NLU0laRTsNCiAgICAgICAg
dm9pZCAqKm1hcF9ibG9ja3M7DQogICAgICAgIHN0cnVjdCBzeXNpbmZvIGluZm87DQorICAgICAg
IHVuc2lnbmVkIGxvbmcgYXZhaWxhYmxlX3JhbSA9IGdldF9hdmFpbGFibGVfcmFtKCk7DQoNCkxU
UCBwcm92aWRlcyBTQUZFX1JFQURfTUVNSU5GTygpIG1hY3JvIHRvIGJlIHVzZWQgaW4gL3Byb2Mv
bWVtaW5mbyByZWFkaW5nLg0KU2VlOiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9q
ZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL21lbS9zd2FwcGluZy9zd2FwcGlu
ZzAxLmMjTDg1DQoNCiANCg0KICAgICAgICBTQUZFX1NZU0lORk8oJmluZm8pOw0KICAgICAgICBz
YWZldHkgPSBNQVgoNDA5NiAqIFNBRkVfU1lTQ09ORihfU0NfUEFHRVNJWkUpLCAxMjggKiAxMDI0
ICogMTAyNCk7DQpAQCAtMjYsMTUgKzQ1LDE5IEBAIHZvaWQgdHN0X3BvbGx1dGVfbWVtb3J5KHNp
emVfdCBtYXhzaXplLCBpbnQgZmlsbGNoYXIpDQogICAgICAgIGlmIChpbmZvLmZyZWVzd2FwID4g
c2FmZXR5KQ0KICAgICAgICAgICAgICAgIHNhZmV0eSA9IDA7DQoNCisgICAgICAgLyoiTWVtQXZh
aWxhYmxlIiBmaWVsZCBtYXliZSBub3QgZXhpc3QsIG9yIGZyZWVyYW0gbGVzcyB0aGFuIGF2YWls
YWJsZV9yYW0qLw0KKyAgICAgICBpZihhdmFpbGFibGVfcmFtID09IDAgfHwgaW5mby5mcmVlcmFt
IDwgYXZhaWxhYmxlX3JhbSkNCisgICAgICAgICAgICAgICBhdmFpbGFibGVfcmFtID0gaW5mby5m
cmVlcmFtOw0KKw0KICAgICAgICAvKiBOb3QgZW5vdWdoIGZyZWUgbWVtb3J5IHRvIGF2b2lkIGlu
dm9raW5nIE9PTSBraWxsZXIgKi8NCi0gICAgICAgaWYgKGluZm8uZnJlZXJhbSA8PSBzYWZldHkp
DQorICAgICAgIGlmIChhdmFpbGFibGVfcmFtIDw9IHNhZmV0eSkNCiAgICAgICAgICAgICAgICBy
ZXR1cm47DQoNCiAgICAgICAgaWYgKCFtYXhzaXplKQ0KICAgICAgICAgICAgICAgIG1heHNpemUg
PSBTSVpFX01BWDsNCg0KLSAgICAgICBpZiAoaW5mby5mcmVlcmFtIC0gc2FmZXR5IDwgbWF4c2l6
ZSAvIGluZm8ubWVtX3VuaXQpDQotICAgICAgICAgICAgICAgbWF4c2l6ZSA9IChpbmZvLmZyZWVy
YW0gLSBzYWZldHkpICogaW5mby5tZW1fdW5pdDsNCisgICAgICAgaWYgKGF2YWlsYWJsZV9yYW0g
LSBzYWZldHkgPCBtYXhzaXplIC8gaW5mby5tZW1fdW5pdCkNCisgICAgICAgICAgICAgICBtYXhz
aXplID0gKGF2YWlsYWJsZV9yYW0gLSBzYWZldHkpICogaW5mby5tZW1fdW5pdDsNCg0KICAgICAg
ICBibG9ja3NpemUgPSBNSU4obWF4c2l6ZSwgYmxvY2tzaXplKTsNCiAgICAgICAgbWFwX2NvdW50
ID0gbWF4c2l6ZSAvIGJsb2Nrc2l6ZTsNCi0tIA0KMS44LjMuMQ0KDQoNCi0tIA0KTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwDQoNCg0KDQotLSAN
ClJlZ2FyZHMsDQpMaSBXYW5nDQo=

------=_001_NextPart827227460734_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210127144917122140 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></span>Hi Li,=
&nbsp;</div><div>Have a question about using macro&nbsp;<span style=3D"fon=
t-size: small; line-height: 19.5px; background-color: transparent;">SAFE_R=
EAD_MEMINFO get&nbsp;</span><span style=3D"line-height: 1.5; background-co=
lor: transparent;">MemAvailable value,</span></div><div>Some old kernels m=
aybe not privode "<span style=3D"line-height: 1.5; background-color: trans=
parent;">MemAvailable</span><span style=3D"line-height: 1.5; background-co=
lor: transparent;">" field, which will broken.</span></div><div><span styl=
e=3D"line-height: 1.5; background-color: transparent;"><br></span></div>=
=0A<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: =
0.5em; margin-Right: inherit"><div>&nbsp;</div><div style=3D"border:none;b=
order-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PAD=
DING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COL=
OR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><d=
iv><b>From:</b>&nbsp;<a href=3D"mailto:liwang@redhat.com">Li Wang</a></div=
><div><b>Date:</b>&nbsp;2021-01-27&nbsp;12:27</div><div><b>To:</b>&nbsp;<a=
 href=3D"mailto:liuxp11@chinatelecom.cn">Xinpeng Liu</a></div><div><b>CC:<=
/b>&nbsp;<a href=3D"mailto:ltp@lists.linux.it">LTP List</a></div><div><b>S=
ubject:</b>&nbsp;Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl=
_sg01 invoked oom-killer</div></div></div><div><div class=3D"FoxDiv2021012=
7144917122140"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Hi Xinpeng,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 11=
:28 AM Xinpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@=
chinatelecom.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Kernel version is 5.4.81+,the available RAM is less than =
free,as follow:<br>=0A[root@liuxp mywork]# head /proc/meminfo<br>=0AMemTot=
al:&nbsp; &nbsp; &nbsp; &nbsp;198101744 kB<br>=0AMemFree:&nbsp; &nbsp; &nb=
sp; &nbsp; 189303148 kB<br>=0AMemAvailable:&nbsp; &nbsp;188566732 kB<br>=
=0A<br>=0ASo use available RAM to avoid OOM killer.<br>=0A<br>=0ASigned-of=
f-by: Xinpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D=
"_blank">liuxp11@chinatelecom.cn</a>&gt;<br>=0A---<br>=0A&nbsp;lib/tst_mem=
utils.c | 29 ++++++++++++++++++++++++++---<br>=0A&nbsp;1 file changed, 26 =
insertions(+), 3 deletions(-)<br>=0A<br>=0Adiff --git a/lib/tst_memutils.c=
 b/lib/tst_memutils.c<br>=0Aindex dd09db4..21df9a8 100644<br>=0A--- a/lib/=
tst_memutils.c<br>=0A+++ b/lib/tst_memutils.c<br>=0A@@ -10,14 +10,33 @@<br=
>=0A<br>=0A&nbsp;#define TST_NO_DEFAULT_MAIN<br>=0A&nbsp;#include "tst_tes=
t.h"<br>=0A+#include "tst_safe_stdio.h"<br>=0A<br>=0A&nbsp;#define BLOCKSI=
ZE (16 * 1024 * 1024)<br>=0A<br>=0A+static unsigned long get_available_ram=
(void)<br>=0A+{<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;char buf[60]; /* actual =
lines we expect are ~30 chars or less */<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp=
;unsigned long available_kb =3D 0;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;FILE =
*fp;<br>=0A+<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;fp =3D SAFE_FOPEN("/proc/me=
minfo","r");<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;while (fgets(buf, sizeof(bu=
f), fp)) {<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i=
f (sscanf(buf, "MemAvailable: %lu %*s\n", &amp;available_kb) =3D=3D 1){<br=
>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;break;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;}<br>=0A+&nbsp; &nbsp; &nbsp;=
 &nbsp;SAFE_FCLOSE(fp);<br>=0A+<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;return 1=
024 * available_kb;<br>=0A+}<br>=0A+<br>=0A&nbsp;void tst_pollute_memory(s=
ize_t maxsize, int fillchar)<br>=0A&nbsp;{<br>=0A&nbsp; &nbsp; &nbsp; &nbs=
p; size_t i, map_count =3D 0, safety =3D 0, blocksize =3D BLOCKSIZE;<br>=
=0A&nbsp; &nbsp; &nbsp; &nbsp; void **map_blocks;<br>=0A&nbsp; &nbsp; &nbs=
p; &nbsp; struct sysinfo info;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;unsigned =
long available_ram =3D get_available_ram();<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">LTP provides =
SAFE_READ_MEMINFO() macro to be used in /proc/meminfo reading.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">See: <a href=3D"https://g=
ithub.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping=
/swapping01.c#L85">https://github.com/linux-test-project/ltp/blob/master/t=
estcases/kernel/mem/swapping/swapping01.c#L85</a></div><br></div><div>&nbs=
p;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">=0A<br>=0A&nbsp=
; &nbsp; &nbsp; &nbsp; SAFE_SYSINFO(&amp;info);<br>=0A&nbsp; &nbsp; &nbsp;=
 &nbsp; safety =3D MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 102=
4);<br>=0A@@ -26,15 +45,19 @@ void tst_pollute_memory(size_t maxsize, int =
fillchar)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; if (info.freeswap &gt; safety)=
<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; safety =3D =
0;<br>=0A<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;/*"MemAvailable" field maybe n=
ot exist, or freeram less than available_ram*/<br>=0A+&nbsp; &nbsp; &nbsp;=
 &nbsp;if(available_ram =3D=3D 0 || info.freeram &lt; available_ram)<br>=
=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;available_ram =
=3D info.freeram;<br>=0A+<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; /* Not enough =
free memory to avoid invoking OOM killer */<br>=0A-&nbsp; &nbsp; &nbsp; &n=
bsp;if (info.freeram &lt;=3D safety)<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if =
(available_ram &lt;=3D safety)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; return;<br>=0A<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; if (!m=
axsize)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; maxs=
ize =3D SIZE_MAX;<br>=0A<br>=0A-&nbsp; &nbsp; &nbsp; &nbsp;if (info.freera=
m - safety &lt; maxsize / info.mem_unit)<br>=0A-&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;maxsize =3D (info.freeram - safety) * info.me=
m_unit;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if (available_ram - safety &lt; =
maxsize / info.mem_unit)<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;maxsize =3D (available_ram - safety) * info.mem_unit;<br>=0A<=
br>=0A&nbsp; &nbsp; &nbsp; &nbsp; blocksize =3D MIN(maxsize, blocksize);<b=
r>=0A&nbsp; &nbsp; &nbsp; &nbsp; map_count =3D maxsize / blocksize;<br>=0A=
-- <br>=0A1.8.3.1<br>=0A<br>=0A<br>=0A-- <br>=0AMailing list info: <a href=
=3D"https://lists.linux.it/listinfo/ltp" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.linux.it/listinfo/ltp</a><br>=0A<br>=0A</blockquote></di=
v><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>=0A</div></div></blockquote>=0A</body></html>
------=_001_NextPart827227460734_=------


--===============1248350321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1248350321==--

