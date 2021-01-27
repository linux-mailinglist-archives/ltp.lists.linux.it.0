Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17248305B65
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:30:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6BF13C79E7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:30:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A69303C4FAE
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:30:42 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.220])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D76EB60095A
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:30:41 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:34860.585725817
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-ab3f6df9b6cb4f0688a3460d1520f2be
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D0561280090;
 Wed, 27 Jan 2021 20:30:39 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id ab3f6df9b6cb4f0688a3460d1520f2be for chrubis@suse.cz; 
 Wed Jan 27 20:30:40 2021
X-Transaction-ID: ab3f6df9b6cb4f0688a3460d1520f2be
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 20:30:38 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Cyril Hrubis" <chrubis@suse.cz>
References: <20210127115606.28985-1-mdoucha@suse.cz>, 
 <YBFWrJoS1tVmWGFx@yuki.lan>, 
 <2021012720143348660139@chinatelecom.cn>, 
 <YBFcc/lc+KkC49Gq@yuki.lan>
X-Priority: 3
X-GUID: 4FEFE4E3-41F7-4F67-AE01-94B768F0DD78
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012720303822264041@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix tst_pollute_memory() safety margin for huge
 systems
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
Content-Type: multipart/mixed; boundary="===============1056365829=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1056365829==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart852112462581_=----"

This is a multi-part message in MIME format.

------=_001_NextPart852112462581_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T0ssSSBhbHNvIHdhbm5hIGtub3cgaG93IHRvIGZpeCBpdC4NClRoYW5rcyENCiANCkZyb206IEN5
cmlsIEhydWJpcw0KRGF0ZTogMjAyMS0wMS0yNyAyMDoyOA0KVG86IGxpdXhwMTFAY2hpbmF0ZWxl
Y29tLmNuDQpDQzogbWRvdWNoYTsgbHRwDQpTdWJqZWN0OiBSZTogUmU6IFtMVFBdIFtQQVRDSF0g
Rml4IHRzdF9wb2xsdXRlX21lbW9yeSgpIHNhZmV0eSBtYXJnaW4gZm9yIGh1Z2Ugc3lzdGVtcw0K
SGkhDQo+IEFjY29yZGluZyBteSB0ZXN0LG1hbGxvYyBhbW91bnQgZ3JlYXRlciB0aGFuIGF2YWls
YWJsZSBtZW1vcnksdGhlbiBpbnZva2UgdGhlIG9vbS1raWxsZXIuDQogDQpIb3dldmVyIHRoYXQg
ZG9lcyBub3QgbWVhbiB0aGF0IGFsbG9jYXRpbmcgTWVtQXZhaWxhYmxlIG9yIHNsaWdodGx5IGxl
c3MNCnRoYW4gTWVtQXZhaWxhYmxlIGlzIHNhZmUuIEluIGZhY3QgaXQncyBub3QsIGF0IGxlYXN0
IHRoYXQgSSd2ZSBiZWVuDQp0b2xkIGJlIGtlcm5lbCBkZXZlbG9wZXJzLiBJIHdpbGwgdHJ5IHRv
IGZpZ3VyZSBvdXQgc29tZXRoaW5nIHNhZmUNCmVub3VnaCB3aXRoIHRoZWlyIGhlbHAuDQogDQot
LSANCkN5cmlsIEhydWJpcw0KY2hydWJpc0BzdXNlLmN6DQo=

------=_001_NextPart852112462581_=----
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }p { margin-top: 0px; margin-botto=
m: 0px; }body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color:=
 rgb(0, 0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></spa=
n></div><div><span><div style=3D"margin: 10px;"><p class=3D"MsoNormal" sty=
le=3D"font-family: =E7=AD=89=E7=BA=BF; font-size: 10.5pt; line-height: nor=
mal; margin: 0cm; text-align: justify;">OK,I also wanna know how to fix it=
.</p><p class=3D"MsoNormal" style=3D"font-family: =E7=AD=89=E7=BA=BF; font=
-size: 10.5pt; line-height: normal; margin: 0cm; text-align: justify;">Tha=
nks!</p></div></span></div>=0A<blockquote style=3D"margin-Top: 0px; margin=
-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><div>&nbsp;</div>=
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm=
 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: =
12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM=
: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:chrubis@=
suse.cz">Cyril Hrubis</a></div><div><b>Date:</b>&nbsp;2021-01-27&nbsp;20:2=
8</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chinatelecom.cn">liu=
xp11@chinatelecom.cn</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:mdouc=
ha@suse.cz">mdoucha</a>; <a href=3D"mailto:ltp@lists.linux.it">ltp</a></di=
v><div><b>Subject:</b>&nbsp;Re: Re: [LTP] [PATCH] Fix tst_pollute_memory()=
 safety margin for huge systems</div></div></div><div><div>Hi!</div>=0A<di=
v>&gt; According my test,malloc amount greater than available memory,then =
invoke the oom-killer.</div>=0A<div>&nbsp;</div>=0A<div>However that does =
not mean that allocating MemAvailable or slightly less</div>=0A<div>than M=
emAvailable is safe. In fact it's not, at least that I've been</div>=0A<di=
v>told be kernel developers. I will try to figure out something safe</div>=
=0A<div>enough with their help.</div>=0A<div>&nbsp;</div>=0A<div>-- </div>=
=0A<div>Cyril Hrubis</div>=0A<div>chrubis@suse.cz</div>=0A</div></blockquo=
te>=0A</body></html>
------=_001_NextPart852112462581_=------


--===============1056365829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1056365829==--

