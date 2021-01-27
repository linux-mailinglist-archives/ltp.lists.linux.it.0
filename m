Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D102E305A4B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:50:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F22B3C5E9D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:50:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D64F83C00DD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:50:13 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.219])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9E4E31400E66
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:50:11 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:59133.91289450
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-5f77ae58af5c498daf2e968acebe016a
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 04F92280083;
 Wed, 27 Jan 2021 19:50:07 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 5f77ae58af5c498daf2e968acebe016a for mdoucha@suse.cz; 
 Wed Jan 27 19:50:09 2021
X-Transaction-ID: 5f77ae58af5c498daf2e968acebe016a
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 19:50:02 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: mdoucha <mdoucha@suse.cz>, 
	"Cyril Hrubis" <chrubis@suse.cz>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>, 
 <2021012718043566596022@chinatelecom.cn>, 
 <29f6bd4d-bb20-6558-8e23-a29cadc19860@suse.cz>, 
 <2021012719413722937529@chinatelecom.cn>, 
 <3b9e2152-95ed-ee2a-6b30-180255330188@suse.cz>
X-Priority: 3
X-GUID: AD106274-39B4-411E-A6B6-2F8E960C2026
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012719500196319832@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0843772672=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============0843772672==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart176605140636_=----"

This is a multi-part message in MIME format.

------=_001_NextPart176605140636_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

YXZhaWxhYmxlIG1lbW9yeSBjYW4gYXZvaWQgdG8gb29tLWtpbGxlci4NCg0KI21hbiBmcmVlDQph
dmFpbGFibGUNCiAgICAgICAgICAgICAgRXN0aW1hdGlvbiBvZiBob3cgbXVjaCBtZW1vcnkgaXMg
YXZhaWxhYmxlIGZvciBzdGFydGluZyBuZXcgYXBwbGljYXRpb25zLCB3aXRob3V0IHN3YXBwaW5n
LiBVbmxpa2UgdGhlIGRhdGEgcHJvdmlkZWQgYnkgIHRoZSAgY2FjaGUgIG9yDQogICAgICAgICAg
ICAgIGZyZWUgIGZpZWxkcywgIHRoaXMgIGZpZWxkICB0YWtlcyBpbnRvIGFjY291bnQgcGFnZSBj
YWNoZSBhbmQgYWxzbyB0aGF0IG5vdCBhbGwgcmVjbGFpbWFibGUgbWVtb3J5IHNsYWJzIHdpbGwg
YmUgcmVjbGFpbWVkIGR1ZSB0byBpdGVtcw0KICAgICAgICAgICAgICBiZWluZyBpbiB1c2UgKE1l
bUF2YWlsYWJsZSBpbiAvcHJvYy9tZW1pbmZvLCBhdmFpbGFibGUgb24ga2VybmVscyAzLjE0LCBl
bXVsYXRlZCBvbiBrZXJuZWxzIDIuNi4yNyssIG90aGVyd2lzZSB0aGUgc2FtZSBhcyBmcmVlKQ0K
DQoNCltyb290QGJvZ29uIGx0cF0jIGNhdCBteS5kaWZmDQpjb21taXQgZWIyODE3NmEzMzUxYzY4
NTQ2MjBhYWE4MjQ4YmYxN2VkZWEyMTBhZQ0KQXV0aG9yOiBYaW5wZW5nIExpdSA8bGl1eHAxMUBj
aGluYXRlbGVjb20uY24+DQpEYXRlOiAgIE1vbiBKYW4gMjUgMjA6NTg6MjAgMjAyMSArMDgwMA0K
DQogICAgc3lzY2FsbHMvaW9jdGw6IGlvY3RsX3NnMDEuYzogaW9jdGxfc2cwMSBpbnZva2VkIG9v
bS1raWxsZXINCg0KICAgIEtlcm5lbCB2ZXJzaW9uIGlzIDUuNC44MSssdGhlIGF2YWlsYWJsZSBS
QU0gaXMgbGVzcyB0aGFuIGZyZWUsYXMgZm9sbG93Og0KICAgIFtyb290QGxpdXhwIG15d29ya10j
IGhlYWQgL3Byb2MvbWVtaW5mbw0KICAgIE1lbVRvdGFsOiAgICAgICAxOTgxMDE3NDQga0INCiAg
ICBNZW1GcmVlOiAgICAgICAgMTg5MzAzMTQ4IGtCDQogICAgTWVtQXZhaWxhYmxlOiAgIDE4ODU2
NjczMiBrQg0KDQogICAgU28gdXNlIGF2YWlsYWJsZSBSQU0gdG8gYXZvaWQgT09NIGtpbGxlci4N
Cg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X21lbXV0aWxzLmggYi9pbmNsdWRlL3RzdF9tZW11
dGlscy5oDQppbmRleCA5MWRhZDA3Li4zZmQ3MGIyIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS90c3Rf
bWVtdXRpbHMuaA0KKysrIGIvaW5jbHVkZS90c3RfbWVtdXRpbHMuaA0KQEAgLTYsNiArNiw4IEBA
DQogI2lmbmRlZiBUU1RfTUVNVVRJTFNfSF9fDQogI2RlZmluZSBUU1RfTUVNVVRJTFNfSF9fDQoN
Cit1bnNpZ25lZCBsb25nIHRzdF9nZXRfbWVtX2F2YWlsYWJsZSh2b2lkKTsNCisNCiAvKg0KICAq
IEZpbGwgdXAgdG8gbWF4c2l6ZSBwaHlzaWNhbCBtZW1vcnkgd2l0aCBmaWxsY2hhciwgdGhlbiBm
cmVlIGl0IGZvciByZXVzZS4NCiAgKiBJZiBtYXhzaXplIGlzIHplcm8sIGZpbGwgYXMgbXVjaCBt
ZW1vcnkgYXMgcG9zc2libGUuIFRoaXMgZnVuY3Rpb24gaXMNCmRpZmYgLS1naXQgYS9saWIvdHN0
X21lbXV0aWxzLmMgYi9saWIvdHN0X21lbXV0aWxzLmMNCmluZGV4IGRkMDlkYjQuLjk0MDhiMzcg
MTAwNjQ0DQotLS0gYS9saWIvdHN0X21lbXV0aWxzLmMNCisrKyBiL2xpYi90c3RfbWVtdXRpbHMu
Yw0KQEAgLTEzLDExICsxMywyMSBAQA0KDQogI2RlZmluZSBCTE9DS1NJWkUgKDE2ICogMTAyNCAq
IDEwMjQpDQoNCit1bnNpZ25lZCBsb25nIHRzdF9nZXRfbWVtX2F2YWlsYWJsZSh2b2lkKQ0KK3sN
CisgICAgICAgdW5zaWduZWQgbG9uZyBhdmFpbGFibGVfa2IgPSAwOw0KKw0KKyAgICAgICBGSUxF
X0xJTkVTX1NDQU5GKCIvcHJvYy9tZW1pbmZvIiwgIk1lbUF2YWlsYWJsZTogJWx1IiwgJmF2YWls
YWJsZV9rYik7DQorDQorICAgICAgIHJldHVybiBhdmFpbGFibGVfa2I7DQorfQ0KKw0KIHZvaWQg
dHN0X3BvbGx1dGVfbWVtb3J5KHNpemVfdCBtYXhzaXplLCBpbnQgZmlsbGNoYXIpDQogew0KICAg
ICAgICBzaXplX3QgaSwgbWFwX2NvdW50ID0gMCwgc2FmZXR5ID0gMCwgYmxvY2tzaXplID0gQkxP
Q0tTSVpFOw0KICAgICAgICB2b2lkICoqbWFwX2Jsb2NrczsNCiAgICAgICAgc3RydWN0IHN5c2lu
Zm8gaW5mbzsNCisgICAgICAgdW5zaWduZWQgbG9uZyBhdmFpbGFibGVfcmFtOw0KDQogICAgICAg
IFNBRkVfU1lTSU5GTygmaW5mbyk7DQogICAgICAgIHNhZmV0eSA9IE1BWCg0MDk2ICogU0FGRV9T
WVNDT05GKF9TQ19QQUdFU0laRSksIDEyOCAqIDEwMjQgKiAxMDI0KTsNCkBAIC0yNiwxNSArMzYs
MjIgQEAgdm9pZCB0c3RfcG9sbHV0ZV9tZW1vcnkoc2l6ZV90IG1heHNpemUsIGludCBmaWxsY2hh
cikNCiAgICAgICAgaWYgKGluZm8uZnJlZXN3YXAgPiBzYWZldHkpDQogICAgICAgICAgICAgICAg
c2FmZXR5ID0gMDsNCg0KKyAgICAgICBhdmFpbGFibGVfcmFtID0gMTAyNCAqIHRzdF9nZXRfbWVt
X2F2YWlsYWJsZSgpOw0KKyAgICAgICBhdmFpbGFibGVfcmFtIC89IGluZm8ubWVtX3VuaXQ7DQor
DQorICAgICAgIC8qIk1lbUF2YWlsYWJsZSIgZmllbGQgbWF5YmUgbm90IGV4aXN0LCBvciBmcmVl
cmFtIGxlc3MgdGhhbiBhdmFpbGFibGVfcmFtKi8NCisgICAgICAgaWYoYXZhaWxhYmxlX3JhbSA9
PSAwIHx8IGluZm8uZnJlZXJhbSA8IGF2YWlsYWJsZV9yYW0pDQorICAgICAgICAgICAgICAgYXZh
aWxhYmxlX3JhbSA9IGluZm8uZnJlZXJhbTsNCisNCiAgICAgICAgLyogTm90IGVub3VnaCBmcmVl
IG1lbW9yeSB0byBhdm9pZCBpbnZva2luZyBPT00ga2lsbGVyICovDQotICAgICAgIGlmIChpbmZv
LmZyZWVyYW0gPD0gc2FmZXR5KQ0KKyAgICAgICBpZiAoYXZhaWxhYmxlX3JhbSA8PSBzYWZldHkp
DQogICAgICAgICAgICAgICAgcmV0dXJuOw0KDQogICAgICAgIGlmICghbWF4c2l6ZSkNCiAgICAg
ICAgICAgICAgICBtYXhzaXplID0gU0laRV9NQVg7DQoNCi0gICAgICAgaWYgKGluZm8uZnJlZXJh
bSAtIHNhZmV0eSA8IG1heHNpemUgLyBpbmZvLm1lbV91bml0KQ0KLSAgICAgICAgICAgICAgIG1h
eHNpemUgPSAoaW5mby5mcmVlcmFtIC0gc2FmZXR5KSAqIGluZm8ubWVtX3VuaXQ7DQorICAgICAg
IGlmIChhdmFpbGFibGVfcmFtIC0gc2FmZXR5IDwgbWF4c2l6ZSAvIGluZm8ubWVtX3VuaXQpDQor
ICAgICAgICAgICAgICAgbWF4c2l6ZSA9IChhdmFpbGFibGVfcmFtIC0gc2FmZXR5KSAqIGluZm8u
bWVtX3VuaXQ7DQoNCiAgICAgICAgYmxvY2tzaXplID0gTUlOKG1heHNpemUsIGJsb2Nrc2l6ZSk7
DQogICAgICAgIG1hcF9jb3VudCA9IG1heHNpemUgLyBibG9ja3NpemU7DQoNCg0KDQpGcm9tOiBN
YXJ0aW4gRG91Y2hhDQpEYXRlOiAyMDIxLTAxLTI3IDE5OjQ2DQpUbzogbGl1eHAxMUBjaGluYXRl
bGVjb20uY247IEN5cmlsIEhydWJpcw0KQ0M6IGx0cA0KU3ViamVjdDogUmU6IFtMVFBdIFtQQVRD
SCAxLzJdIHN5c2NhbGxzL2lvY3RsOiBpb2N0bF9zZzAxLmM6IGlvY3RsX3NnMDEgaW52b2tlZCBv
b20ta2lsbGVyDQpPbiAyNy4gMDEuIDIxIDEyOjQxLCBsaXV4cDExQGNoaW5hdGVsZWNvbS5jbiB3
cm90ZToNCj4gICAgIHNhZmV0eSA9IE1BWCg0MDk2ICogU0FGRV9TWVNDT05GKF9TQ19QQUdFU0la
RSksIDEyOCAqIDEwMjQgKiAxMDI0KTsNCj4gICAgIG5vdyBzYWZldHkgbWFyZ2luIGlzIDEyOE1C
LG5vdCA2NE1CLiBSaWdodD8NCiANClllcywgcmlnaHQsIHNvcnJ5Lg0KIA0KLS0gDQpNYXJ0aW4g
RG91Y2hhICAgbWRvdWNoYUBzdXNlLmN6DQpRQSBFbmdpbmVlciBmb3IgU29mdHdhcmUgTWFpbnRl
bmFuY2UNClNVU0UgTElOVVgsIHMuci5vLg0KQ09SU08gSUlhDQpLcml6aWtvdmEgMTQ4LzM0DQox
ODYgMDAgUHJhZ3VlIDgNCkN6ZWNoIFJlcHVibGljDQo=

------=_001_NextPart176605140636_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font=
-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</s=
tyle></head><body>=0A<div><span></span><div>available memory can avoid to&=
nbsp;oom-killer.</div><div><br></div><div>#man free</div><div>available</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>Estimation of =
how much memory is available for starting new applications, without swappi=
ng. </b>Unlike the data provided by &nbsp;the &nbsp;cache &nbsp;or</div><d=
iv>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; free &nbsp;fields, &nb=
sp;this &nbsp;field &nbsp;takes into account page cache and also that not =
all reclaimable memory slabs will be reclaimed due to items</div><div>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; being in use (MemAvailable in=
 /proc/meminfo, available on kernels 3.14, emulated on kernels 2.6.27+, ot=
herwise the same as free)</div></div><div><br></div><div><br></div><div><d=
iv>[root@bogon ltp]# cat my.diff</div><div>commit eb28176a3351c6854620aaa8=
248bf17edea210ae</div><div>Author: Xinpeng Liu &lt;liuxp11@chinatelecom.cn=
&gt;</div><div>Date: &nbsp; Mon Jan 25 20:58:20 2021 +0800</div><div><br><=
/div><div>&nbsp; &nbsp; syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked o=
om-killer</div><div><br></div><div>&nbsp; &nbsp; Kernel version is 5.4.81+=
,the available RAM is less than free,as follow:</div><div>&nbsp; &nbsp; [r=
oot@liuxp mywork]# head /proc/meminfo</div><div>&nbsp; &nbsp; MemTotal: &n=
bsp; &nbsp; &nbsp; 198101744 kB</div><div>&nbsp; &nbsp; MemFree: &nbsp; &n=
bsp; &nbsp; &nbsp;189303148 kB</div><div>&nbsp; &nbsp; MemAvailable: &nbsp=
; 188566732 kB</div><div><br></div><div>&nbsp; &nbsp; So use available RAM=
 to avoid OOM killer.</div><div><br></div><div>diff --git a/include/tst_me=
mutils.h b/include/tst_memutils.h</div><div>index 91dad07..3fd70b2 100644<=
/div><div>--- a/include/tst_memutils.h</div><div>+++ b/include/tst_memutil=
s.h</div><div>@@ -6,6 +6,8 @@</div><div>&nbsp;#ifndef TST_MEMUTILS_H__</di=
v><div>&nbsp;#define TST_MEMUTILS_H__</div><div><br></div><div>+unsigned l=
ong tst_get_mem_available(void);</div><div>+</div><div>&nbsp;/*</div><div>=
&nbsp; * Fill up to maxsize physical memory with fillchar, then free it fo=
r reuse.</div><div>&nbsp; * If maxsize is zero, fill as much memory as pos=
sible. This function is</div><div>diff --git a/lib/tst_memutils.c b/lib/ts=
t_memutils.c</div><div>index dd09db4..9408b37 100644</div><div>--- a/lib/t=
st_memutils.c</div><div>+++ b/lib/tst_memutils.c</div><div>@@ -13,11 +13,2=
1 @@</div><div><br></div><div>&nbsp;#define BLOCKSIZE (16 * 1024 * 1024)</=
div><div><br></div><div>+unsigned long tst_get_mem_available(void)</div><d=
iv>+{</div><div>+ &nbsp; &nbsp; &nbsp; unsigned long available_kb =3D 0;</=
div><div>+</div><div>+ &nbsp; &nbsp; &nbsp; FILE_LINES_SCANF("/proc/meminf=
o", "MemAvailable: %lu", &amp;available_kb);</div><div>+</div><div>+ &nbsp=
; &nbsp; &nbsp; return available_kb;</div><div>+}</div><div>+</div><div>&n=
bsp;void tst_pollute_memory(size_t maxsize, int fillchar)</div><div>&nbsp;=
{</div><div>&nbsp; &nbsp; &nbsp; &nbsp; size_t i, map_count =3D 0, safety =
=3D 0, blocksize =3D BLOCKSIZE;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; void=
 **map_blocks;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; struct sysinfo info;<=
/div><div>+ &nbsp; &nbsp; &nbsp; unsigned long available_ram;</div><div><b=
r></div><div>&nbsp; &nbsp; &nbsp; &nbsp; SAFE_SYSINFO(&amp;info);</div><di=
v>&nbsp; &nbsp; &nbsp; &nbsp; safety =3D MAX(4096 * SAFE_SYSCONF(_SC_PAGES=
IZE), 128 * 1024 * 1024);</div><div>@@ -26,15 +36,22 @@ void tst_pollute_m=
emory(size_t maxsize, int fillchar)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
if (info.freeswap &gt; safety)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; safety =3D 0;</div><div><br></div><div>+ &nbsp; &nb=
sp; &nbsp; available_ram =3D 1024 * tst_get_mem_available();</div><div>+ &=
nbsp; &nbsp; &nbsp; available_ram /=3D info.mem_unit;</div><div>+</div><di=
v>+ &nbsp; &nbsp; &nbsp; /*"MemAvailable" field maybe not exist, or freera=
m less than available_ram*/</div><div>+ &nbsp; &nbsp; &nbsp; if(available_=
ram =3D=3D 0 || info.freeram &lt; available_ram)</div><div>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; available_ram =3D info.freeram;</div><=
div>+</div><div>&nbsp; &nbsp; &nbsp; &nbsp; /* Not enough free memory to a=
void invoking OOM killer */</div><div>- &nbsp; &nbsp; &nbsp; if (info.free=
ram &lt;=3D safety)</div><div>+ &nbsp; &nbsp; &nbsp; if (available_ram &lt=
;=3D safety)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; return;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; if (!max=
size)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ma=
xsize =3D SIZE_MAX;</div><div><br></div><div>- &nbsp; &nbsp; &nbsp; if (in=
fo.freeram - safety &lt; maxsize / info.mem_unit)</div><div>- &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; maxsize =3D (info.freeram - safety) *=
 info.mem_unit;</div><div>+ &nbsp; &nbsp; &nbsp; if (available_ram - safet=
y &lt; maxsize / info.mem_unit)</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; maxsize =3D (available_ram - safety) * info.mem_unit;</=
div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; blocksize =3D MIN(maxs=
ize, blocksize);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; map_count =3D maxsi=
ze / blocksize;</div></div><div><br></div><div><br></div>=0A<div><br></div=
><blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.=
5em; margin-Right: inherit"><div style=3D"border:none;border-top:solid #B5=
C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PA=
DDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGRO=
UND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbs=
p;<a href=3D"mailto:mdoucha@suse.cz">Martin Doucha</a></div><div><b>Date:<=
/b>&nbsp;2021-01-27&nbsp;19:46</div><div><b>To:</b>&nbsp;<a href=3D"mailto=
:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a>; <a href=3D"mailto:c=
hrubis@suse.cz">Cyril Hrubis</a></div><div><b>CC:</b>&nbsp;<a href=3D"mail=
to:ltp@lists.linux.it">ltp</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [P=
ATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div=
></div></div><div><div>On 27. 01. 21 12:41, liuxp11@chinatelecom.cn wrote:=
</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp; safety =3D MAX(4096 * SAFE_SYSC=
ONF(_SC_PAGESIZE), 128 * 1024 * 1024);</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;=
&nbsp; now safety margin is 128MB,not 64MB. Right?</div>=0A<div>&nbsp;</di=
v>=0A<div>Yes, right, sorry.</div>=0A<div>&nbsp;</div>=0A<div>-- </div>=0A=
<div>Martin Doucha&nbsp;&nbsp; mdoucha@suse.cz</div>=0A<div>QA Engineer fo=
r Software Maintenance</div>=0A<div>SUSE LINUX, s.r.o.</div>=0A<div>CORSO =
IIa</div>=0A<div>Krizikova 148/34</div>=0A<div>186 00 Prague 8</div>=0A<di=
v>Czech Republic</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart176605140636_=------


--===============0843772672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0843772672==--

