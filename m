Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B24EB3057CF
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:08:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 409E13C79D0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:08:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DA2573C01C3
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:07:58 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E3136200977
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:07:57 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:37651.752789424
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-c0a7fffc78aa40c1ae4969638f255aba
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 6B3852800FA;
 Wed, 27 Jan 2021 18:07:47 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id c0a7fffc78aa40c1ae4969638f255aba for mdoucha@suse.cz; 
 Wed Jan 27 18:07:56 2021
X-Transaction-ID: c0a7fffc78aa40c1ae4969638f255aba
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 18:07:48 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: mdoucha <mdoucha@suse.cz>, 
	"Cyril Hrubis" <chrubis@suse.cz>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>, 
 <a49e7375-e7c6-9915-da23-963a4e534e1f@suse.cz>
X-Priority: 3
X-GUID: 1A809ACE-7DFA-4269-9F16-686ADFC7723A
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012718074776349323@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0720172673=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============0720172673==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart806842437412_=----"

This is a multi-part message in MIME format.

------=_001_NextPart806842437412_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

W3Jvb3RAdGVzdC1lbnYtbm0wNS1jb21wdXRlLTE0ZTVlNzJlMzggfl0jIHcNCiAxODowNTowMCB1
cCAxNSBkYXlzLCAgMTowNiwgIDMgdXNlcnMsICBsb2FkIGF2ZXJhZ2U6IDAuMzksIDAuNDIsIDAu
NDcNCg0KIA0KRnJvbTogTWFydGluIERvdWNoYQ0KRGF0ZTogMjAyMS0wMS0yNyAxNzo1Mw0KVG86
IEN5cmlsIEhydWJpczsgWGlucGVuZyBMaXUNCkNDOiBsdHANClN1YmplY3Q6IFJlOiBbTFRQXSBb
UEFUQ0ggMS8yXSBzeXNjYWxscy9pb2N0bDogaW9jdGxfc2cwMS5jOiBpb2N0bF9zZzAxIGludm9r
ZWQgb29tLWtpbGxlcg0KT24gMjcuIDAxLiAyMSAxMDozOSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOg0K
PiBIaSENCj4+IE1lbVRvdGFsOiAgICAgICAxOTgxMDE3NDQga0INCj4+IE1lbUZyZWU6ICAgICAg
ICAxODkzMDMxNDgga0INCj4+IE1lbUF2YWlsYWJsZTogICAxODg1NjY3MzIga0INCj4gDQo+IFRo
aXMgc291bmRzIHJlYWxseSBzdHJhbmdlLCB1c3VhbGx5IE1lbUZyZWUgaXMgc21hbGxlciB0aGFu
IE1lbUF2YWlsYWJsZQ0KPiBzaW5jZSBNZW1GcmVlIGRvZXMgbm90IGluY2x1ZGUgcGFnZSBjYWNo
ZS4NCj4gDQo+IElzIHRoaXMgZnJlc2hseSBib290ZWQgc3lzdGVtPw0KPiANCj4gQ2FuIHlvdSBz
ZW5kIHRoZSB3aG9sZSBtZW1pbmZvIGhlcmUgcGxlYXNlPw0KIA0KUGxlYXNlIGFsc28gc2VuZCB0
aGUgY29udGVudHMgb2YgL3Byb2Mvc3lzL3ZtL21pbl9mcmVlX2tieXRlcy4gSSBzdXNwZWN0DQp0
aGF0IHRoYXQncyB3aGVyZSB0aGUgT09NIGlzc3VlcyBhcmUgYWN0dWFsbHkgY29taW5nIGZyb20u
DQogDQotLSANCk1hcnRpbiBEb3VjaGEgICBtZG91Y2hhQHN1c2UuY3oNClFBIEVuZ2luZWVyIGZv
ciBTb2Z0d2FyZSBNYWludGVuYW5jZQ0KU1VTRSBMSU5VWCwgcy5yLm8uDQpDT1JTTyBJSWENCkty
aXppa292YSAxNDgvMzQNCjE4NiAwMCBQcmFndWUgOA0KQ3plY2ggUmVwdWJsaWMNCg==

------=_001_NextPart806842437412_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }p { margin-top: 0px; margin-botto=
m: 0px; }body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color:=
 rgb(0, 0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></spa=
n><div>[root@test-env-nm05-compute-14e5e72e38 ~]# w</div><div>&nbsp;18:05:=
00 up <b>15 days</b>, &nbsp;1:06, &nbsp;3 users, &nbsp;load average: 0.39,=
 0.42, 0.47</div></div><div><span><div style=3D"margin: 10px;"><p class=3D=
"MsoNormal" style=3D"font-family: =E7=AD=89=E7=BA=BF; font-size: 10.5pt; l=
ine-height: normal; margin: 0cm; text-align: justify;"><br></p></div></spa=
n></div>=0A<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margi=
n-Left: 0.5em; margin-Right: inherit"><div>&nbsp;</div><div style=3D"borde=
r:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div styl=
e=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:ta=
homa;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP:=
 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:mdoucha@suse.cz">Martin Dou=
cha</a></div><div><b>Date:</b>&nbsp;2021-01-27&nbsp;17:53</div><div><b>To:=
</b>&nbsp;<a href=3D"mailto:chrubis@suse.cz">Cyril Hrubis</a>; <a href=3D"=
mailto:liuxp11@chinatelecom.cn">Xinpeng Liu</a></div><div><b>CC:</b>&nbsp;=
<a href=3D"mailto:ltp@lists.linux.it">ltp</a></div><div><b>Subject:</b>&nb=
sp;Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked =
oom-killer</div></div></div><div><div>On 27. 01. 21 10:39, Cyril Hrubis wr=
ote:</div>=0A<div>&gt; Hi!</div>=0A<div>&gt;&gt; MemTotal:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 198101744 kB</div>=0A<div>&gt;&gt; MemFree:&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 189303148 kB</div>=0A<div>&gt;&gt; MemAva=
ilable:&nbsp;&nbsp; 188566732 kB</div>=0A<div>&gt; </div>=0A<div>&gt; This=
 sounds really strange, usually MemFree is smaller than MemAvailable</div>=
=0A<div>&gt; since MemFree does not include page cache.</div>=0A<div>&gt; =
</div>=0A<div>&gt; Is this freshly booted system?</div>=0A<div>&gt; </div>=
=0A<div>&gt; Can you send the whole meminfo here please?</div>=0A<div>&nbs=
p;</div>=0A<div>Please also send the contents of /proc/sys/vm/min_free_kby=
tes. I suspect</div>=0A<div>that that's where the OOM issues are actually =
coming from.</div>=0A<div>&nbsp;</div>=0A<div>-- </div>=0A<div>Martin Douc=
ha&nbsp;&nbsp; mdoucha@suse.cz</div>=0A<div>QA Engineer for Software Maint=
enance</div>=0A<div>SUSE LINUX, s.r.o.</div>=0A<div>CORSO IIa</div>=0A<div=
>Krizikova 148/34</div>=0A<div>186 00 Prague 8</div>=0A<div>Czech Republic=
</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart806842437412_=------


--===============0720172673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0720172673==--

