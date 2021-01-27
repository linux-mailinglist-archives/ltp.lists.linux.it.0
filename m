Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967930531D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:21:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B5203C5E97
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:21:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3E52E3C0232
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:21:11 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 273D0140042E
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:21:09 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:62902.2145011658
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-a3aa72d6a8d14b6a968f15c92c9f4ad2
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id CD7862800F0;
 Wed, 27 Jan 2021 14:20:30 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id a3aa72d6a8d14b6a968f15c92c9f4ad2 for
 liuxp11@chinatelecom.cn; Wed Jan 27 14:20:45 2021
X-Transaction-ID: a3aa72d6a8d14b6a968f15c92c9f4ad2
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 14:20:28 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: liuxp11 <liuxp11@chinatelecom.cn>, 
	ltp <ltp@lists.linux.it>
References: <1611580694-4000-1-git-send-email-liuxp11@chinatelecom.cn>
X-Priority: 3
X-GUID: F463A905-72FA-442E-8037-6A5B3B4662F7
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202101271420280317517@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE, MIME_BASE64_TEXT,
 SPF_HELO_PASS,SPF_PASS,T_FROMNAME_EQUALS_TO autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
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
Content-Type: multipart/mixed; boundary="===============1905716787=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1905716787==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart020361568643_=----"

This is a multi-part message in MIME format.

------=_001_NextPart020361568643_=----
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

c29ycnksDQp1bnNpZ25lZCBsb25nIGF2YWlsYWJsZV9yYW0gPSBTQUZFX1JFQURfTUVNSU5GTygi
TWVtQXZhaWxhYmxlOiIpOyANCi0tLT51bnNpZ25lZCBsb25nIGF2YWlsYWJsZV9yYW0gPSAxMDI0
ICogU0FGRV9SRUFEX01FTUlORk8oIk1lbUF2YWlsYWJsZToiKTsgDQpGcm9tOiBYaW5wZW5nIExp
dQ0KRGF0ZTogMjAyMS0wMS0yNSAyMToxOA0KVG86IGx0cA0KQ0M6IFhpbnBlbmcgTGl1DQpTdWJq
ZWN0OiBbUEFUQ0ggdjIgMS8yXSBzeXNjYWxscy9pb2N0bDogaW9jdGxfc2cwMS5jOiBpb2N0bF9z
ZzAxIGludm9rZWQgb29tLWtpbGxlcg0KS2VybmVsIHZlcnNpb24gaXMgNS40LjgxKyx0aGUgYXZh
aWxhYmxlIFJBTSBpcyBsZXNzIHRoYW4gZnJlZSxhcyBmb2xsb3c6DQpbcm9vdEBsaXV4cCBteXdv
cmtdIyBoZWFkIC9wcm9jL21lbWluZm8NCk1lbVRvdGFsOiAgICAgICAxOTgxMDE3NDQga0INCk1l
bUZyZWU6ICAgICAgICAxODkzMDMxNDgga0INCk1lbUF2YWlsYWJsZTogICAxODg1NjY3MzIga0IN
CiANClNvIHVzZSBhdmFpbGFibGUgUkFNIHRvIGF2b2lkIE9PTSBraWxsZXIuDQotLS0NCmxpYi90
c3RfbWVtdXRpbHMuYyB8IDExICsrKysrKysrLS0tDQoxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KIA0KZGlmZiAtLWdpdCBhL2xpYi90c3RfbWVtdXRpbHMu
YyBiL2xpYi90c3RfbWVtdXRpbHMuYw0KaW5kZXggZGQwOWRiNC4uODU5NjAwNSAxMDA2NDQNCi0t
LSBhL2xpYi90c3RfbWVtdXRpbHMuYw0KKysrIGIvbGliL3RzdF9tZW11dGlscy5jDQpAQCAtMTgs
NiArMTgsNyBAQCB2b2lkIHRzdF9wb2xsdXRlX21lbW9yeShzaXplX3QgbWF4c2l6ZSwgaW50IGZp
bGxjaGFyKQ0Kc2l6ZV90IGksIG1hcF9jb3VudCA9IDAsIHNhZmV0eSA9IDAsIGJsb2Nrc2l6ZSA9
IEJMT0NLU0laRTsNCnZvaWQgKiptYXBfYmxvY2tzOw0Kc3RydWN0IHN5c2luZm8gaW5mbzsNCisg
dW5zaWduZWQgbG9uZyBhdmFpbGFibGVfcmFtID0gU0FGRV9SRUFEX01FTUlORk8oIk1lbUF2YWls
YWJsZToiKTsNClNBRkVfU1lTSU5GTygmaW5mbyk7DQpzYWZldHkgPSBNQVgoNDA5NiAqIFNBRkVf
U1lTQ09ORihfU0NfUEFHRVNJWkUpLCAxMjggKiAxMDI0ICogMTAyNCk7DQpAQCAtMjYsMTUgKzI3
LDE5IEBAIHZvaWQgdHN0X3BvbGx1dGVfbWVtb3J5KHNpemVfdCBtYXhzaXplLCBpbnQgZmlsbGNo
YXIpDQppZiAoaW5mby5mcmVlc3dhcCA+IHNhZmV0eSkNCnNhZmV0eSA9IDA7DQorIC8qIk1lbUF2
YWlsYWJsZSIgZmllbGQgbWF5YmUgbm90IGV4aXN0LCBvciBmcmVlcmFtIGxlc3MgdGhhbiBhdmFp
bGFibGVfcmFtKi8NCisgaWYoYXZhaWxhYmxlX3JhbSA9PSAwIHx8IGluZm8uZnJlZXJhbSA8IGF2
YWlsYWJsZV9yYW0pDQorIGF2YWlsYWJsZV9yYW0gPSBpbmZvLmZyZWVyYW07DQorDQovKiBOb3Qg
ZW5vdWdoIGZyZWUgbWVtb3J5IHRvIGF2b2lkIGludm9raW5nIE9PTSBraWxsZXIgKi8NCi0gaWYg
KGluZm8uZnJlZXJhbSA8PSBzYWZldHkpDQorIGlmIChhdmFpbGFibGVfcmFtIDw9IHNhZmV0eSkN
CnJldHVybjsNCmlmICghbWF4c2l6ZSkNCm1heHNpemUgPSBTSVpFX01BWDsNCi0gaWYgKGluZm8u
ZnJlZXJhbSAtIHNhZmV0eSA8IG1heHNpemUgLyBpbmZvLm1lbV91bml0KQ0KLSBtYXhzaXplID0g
KGluZm8uZnJlZXJhbSAtIHNhZmV0eSkgKiBpbmZvLm1lbV91bml0Ow0KKyBpZiAoYXZhaWxhYmxl
X3JhbSAtIHNhZmV0eSA8IG1heHNpemUgLyBpbmZvLm1lbV91bml0KQ0KKyBtYXhzaXplID0gKGF2
YWlsYWJsZV9yYW0gLSBzYWZldHkpICogaW5mby5tZW1fdW5pdDsNCmJsb2Nrc2l6ZSA9IE1JTiht
YXhzaXplLCBibG9ja3NpemUpOw0KbWFwX2NvdW50ID0gbWF4c2l6ZSAvIGJsb2Nrc2l6ZTsNCi0t
IA0KMS44LjMuMQ0KIA0K

------=_001_NextPart020361568643_=----
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dus-ascii"><style>body { line-height: 1.5; }blockquote { margin-top: 0p=
x; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-f=
amily: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</sty=
le></head><body><div>sorry,</div>=0Aunsigned long available_ram =3D SAFE_R=
EAD_MEMINFO("MemAvailable:");&nbsp;<div>---&gt;<blockquote style=3D"margin=
-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit">=
unsigned long available_ram =3D 1024 * SAFE_READ_MEMINFO("MemAvailable:");=
&nbsp;<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0=
pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-=
SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-=
BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:li=
uxp11@chinatelecom.cn">Xinpeng Liu</a></div><div><b>Date:</b>&nbsp;2021-01=
-25&nbsp;21:18</div><div><b>To:</b>&nbsp;<a href=3D"mailto:ltp@lists.linux=
.it">ltp</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:liuxp11@chinatele=
com.cn">Xinpeng Liu</a></div><div><b>Subject:</b>&nbsp;[PATCH v2 1/2] sysc=
alls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div></div></div><=
div><div>Kernel version is 5.4.81+,the available RAM is less than free,as =
follow:</div>=0A<div>[root@liuxp mywork]# head /proc/meminfo</div>=0A<div>=
MemTotal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 198101744 kB</div>=0A<div>Me=
mFree:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 189303148 kB</div>=0A<div=
>MemAvailable:&nbsp;&nbsp; 188566732 kB</div>=0A<div>&nbsp;</div>=0A<div>S=
o use available RAM to avoid OOM killer.</div>=0A<div>---</div>=0A<div> li=
b/tst_memutils.c | 11 ++++++++---</div>=0A<div> 1 file changed, 8 insertio=
ns(+), 3 deletions(-)</div>=0A<div>&nbsp;</div>=0A<div>diff --git a/lib/ts=
t_memutils.c b/lib/tst_memutils.c</div>=0A<div>index dd09db4..8596005 1006=
44</div>=0A<div>--- a/lib/tst_memutils.c</div>=0A<div>+++ b/lib/tst_memuti=
ls.c</div>=0A<div>@@ -18,6 +18,7 @@ void tst_pollute_memory(size_t maxsize=
, int fillchar)</div>=0A<div> 	size_t i, map_count =3D 0, safety =3D 0, bl=
ocksize =3D BLOCKSIZE;</div>=0A<div> 	void **map_blocks;</div>=0A<div> 	st=
ruct sysinfo info;</div>=0A<div>+	unsigned long available_ram =3D SAFE_REA=
D_MEMINFO("MemAvailable:");</div>=0A<div> </div>=0A<div> 	SAFE_SYSINFO(&am=
p;info);</div>=0A<div> 	safety =3D MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), =
128 * 1024 * 1024);</div>=0A<div>@@ -26,15 +27,19 @@ void tst_pollute_memo=
ry(size_t maxsize, int fillchar)</div>=0A<div> 	if (info.freeswap &gt; saf=
ety)</div>=0A<div> 		safety =3D 0;</div>=0A<div> </div>=0A<div>+	/*"MemAva=
ilable" field maybe not exist, or freeram less than available_ram*/</div>=
=0A<div>+	if(available_ram =3D=3D 0 || info.freeram &lt; available_ram)</d=
iv>=0A<div>+		available_ram =3D info.freeram;</div>=0A<div>+</div>=0A<div>=
 	/* Not enough free memory to avoid invoking OOM killer */</div>=0A<div>-=
	if (info.freeram &lt;=3D safety)</div>=0A<div>+	if (available_ram &lt;=3D=
 safety)</div>=0A<div> 		return;</div>=0A<div> </div>=0A<div> 	if (!maxsiz=
e)</div>=0A<div> 		maxsize =3D SIZE_MAX;</div>=0A<div> </div>=0A<div>-	if =
(info.freeram - safety &lt; maxsize / info.mem_unit)</div>=0A<div>-		maxsi=
ze =3D (info.freeram - safety) * info.mem_unit;</div>=0A<div>+	if (availab=
le_ram - safety &lt; maxsize / info.mem_unit)</div>=0A<div>+		maxsize =3D =
(available_ram - safety) * info.mem_unit;</div>=0A<div> </div>=0A<div> 	bl=
ocksize =3D MIN(maxsize, blocksize);</div>=0A<div> 	map_count =3D maxsize =
/ blocksize;</div>=0A<div>-- </div>=0A<div>1.8.3.1</div>=0A<div>&nbsp;</di=
v>=0A</div></blockquote>=0A</div></body></html>
------=_001_NextPart020361568643_=------


--===============1905716787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1905716787==--

