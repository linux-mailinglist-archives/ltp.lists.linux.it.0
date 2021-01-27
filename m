Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DC305A0D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:41:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B277E3C5E9D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 12:41:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EA7643C00DD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:41:47 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.223])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5BCC0140099D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 12:41:43 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:9877.1488392689
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-99cfe018e9f049c09749c93eba60de50
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AE41E280090;
 Wed, 27 Jan 2021 19:41:39 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 99cfe018e9f049c09749c93eba60de50 for mdoucha@suse.cz; 
 Wed Jan 27 19:41:42 2021
X-Transaction-ID: 99cfe018e9f049c09749c93eba60de50
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 19:41:37 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: mdoucha <mdoucha@suse.cz>, 
	"Cyril Hrubis" <chrubis@suse.cz>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>, 
 <2021012718043566596022@chinatelecom.cn>, 
 <29f6bd4d-bb20-6558-8e23-a29cadc19860@suse.cz>
X-Priority: 3
X-GUID: 6235FFC2-3DBA-47C3-8273-FDD907B42D34
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012719413722937529@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
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
Content-Type: multipart/mixed; boundary="===============1705277781=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1705277781==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart505825131688_=----"

This is a multi-part message in MIME format.

------=_001_NextPart505825131688_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

c2FmZXR5ID0gTUFYKDQwOTYgKiBTQUZFX1NZU0NPTkYoX1NDX1BBR0VTSVpFKSwgMTI4ICogMTAy
NCAqIDEwMjQpOw0Kbm93IHNhZmV0eSBtYXJnaW4gaXMgMTI4TUIsbm90IDY0TUIuIFJpZ2h0Pw0K
IA0KDQpGcm9tOiBNYXJ0aW4gRG91Y2hhDQpEYXRlOiAyMDIxLTAxLTI3IDE5OjI4DQpUbzogbGl1
eHAxMUBjaGluYXRlbGVjb20uY247IEN5cmlsIEhydWJpcw0KQ0M6IGx0cA0KU3ViamVjdDogUmU6
IFtMVFBdIFtQQVRDSCAxLzJdIHN5c2NhbGxzL2lvY3RsOiBpb2N0bF9zZzAxLmM6IGlvY3RsX3Nn
MDEgaW52b2tlZCBvb20ta2lsbGVyDQpPbiAyNy4gMDEuIDIxIDExOjA0LCBsaXV4cDExQGNoaW5h
dGVsZWNvbS5jbiB3cm90ZToNCj4gW3Jvb3RAdGVzdC1lbnYtbm0wNS1jb21wdXRlLTE0ZTVlNzJl
Mzggfl0jIGNhdCAgL3Byb2Mvc3lzL3ZtL21pbl9mcmVlX2tieXRlcw0KPiA5MDExMg0KIA0KWWVw
LCB0aGVyZSBpdCBpcy4gbWluX2ZyZWVfa2J5dGVzIGlzIDkwTUIgYnV0IHdlIG9ubHkgbGVhdmUg
NjRNQiBzYWZldHkNCm1hcmdpbi4gSSdsbCBwcmVwYXJlIGEgcGF0Y2ggdGhhdCdsbCBpbmNyZWFz
ZSBzYWZldHkgbWFyZ2luIHRvDQoyKm1pbl9mcmVlX2tieXRlcyBpZiBuZWVkZWQuDQogDQotLSAN
Ck1hcnRpbiBEb3VjaGEgICBtZG91Y2hhQHN1c2UuY3oNClFBIEVuZ2luZWVyIGZvciBTb2Z0d2Fy
ZSBNYWludGVuYW5jZQ0KU1VTRSBMSU5VWCwgcy5yLm8uDQpDT1JTTyBJSWENCktyaXppa292YSAx
NDgvMzQNCjE4NiAwMCBQcmFndWUgOA0KQ3plY2ggUmVwdWJsaWMNCg==

------=_001_NextPart505825131688_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font=
-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</s=
tyle></head><body>=0A<div><span></span></div><blockquote style=3D"margin-T=
op: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><d=
iv>safety =3D MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);</=
div><div>now safety margin is 128MB,not <span style=3D"line-height: 1.5; b=
ackground-color: transparent;">64MB. Right?</span></div><div>&nbsp;</div><=
div><br></div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;pad=
ding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8p=
x; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; =
PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"m=
ailto:mdoucha@suse.cz">Martin Doucha</a></div><div><b>Date:</b>&nbsp;2021-=
01-27&nbsp;19:28</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@china=
telecom.cn">liuxp11@chinatelecom.cn</a>; <a href=3D"mailto:chrubis@suse.cz=
">Cyril Hrubis</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp@lists.l=
inux.it">ltp</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [PATCH 1/2] sysc=
alls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div></div></div><=
div><div>On 27. 01. 21 11:04, liuxp11@chinatelecom.cn wrote:</div>=0A<div>=
&gt; [root@test-env-nm05-compute-14e5e72e38 ~]# cat &nbsp;/proc/sys/vm/min=
_free_kbytes</div>=0A<div>&gt; 90112</div>=0A<div>&nbsp;</div>=0A<div>Yep,=
 there it is. min_free_kbytes is 90MB but we only leave 64MB safety</div>=
=0A<div>margin. I'll prepare a patch that'll increase safety margin to</di=
v>=0A<div>2*min_free_kbytes if needed.</div>=0A<div>&nbsp;</div>=0A<div>--=
 </div>=0A<div>Martin Doucha&nbsp;&nbsp; mdoucha@suse.cz</div>=0A<div>QA E=
ngineer for Software Maintenance</div>=0A<div>SUSE LINUX, s.r.o.</div>=0A<=
div>CORSO IIa</div>=0A<div>Krizikova 148/34</div>=0A<div>186 00 Prague 8</=
div>=0A<div>Czech Republic</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart505825131688_=------


--===============1705277781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1705277781==--

