Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AA2F9E42
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 12:36:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E804B3C3158
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 12:36:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F28873C2329
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 12:36:05 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 39AE760081A
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 12:36:01 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:1427.1812926251
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-1c15e22893e04de1929230951ca1ff8f
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 8E1422800A5;
 Mon, 18 Jan 2021 19:35:51 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 1c15e22893e04de1929230951ca1ff8f for
 jstancek@redhat.com; Mon Jan 18 19:35:58 2021
X-Transaction-ID: 1c15e22893e04de1929230951ca1ff8f
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Mon, 18 Jan 2021 19:35:51 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Jan Stancek" <jstancek@redhat.com>
References: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <95241263.33332311.1610722445185.JavaMail.zimbra@redhat.com>, 
 <202101181134453606602@chinatelecom.cn>, 
 <830441383.33482781.1610967897529.JavaMail.zimbra@redhat.com>
X-Priority: 3
X-GUID: E3077AD1-539B-4C5F-9C0A-C247D72A2BD3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021011819355121464612@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/proc01.c:add known issues
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
Content-Type: multipart/mixed; boundary="===============1254349541=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1254349541==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart108035331252_=----"

This is a multi-part message in MIME format.

------=_001_NextPart108035331252_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

UmlnaHQsIHNtYWNrIGlzIGRpc2FibGVkIGluIG15IHN5c3RlbSwgYW5kIGVuYWJsZWQgYXBwYW1v
ci4NCg0Kc3RhdGljIGludCBhcHBhcm1vcl9nZXRwcm9jYXR0cihzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRhc2ssIGNoYXIgKm5hbWUsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIg
Kip2YWx1ZSkNCnsNCiAgICAgICAgaW50IGVycm9yID0gLUVOT0VOVDsNCiAgICAgICAgLyogcmVs
ZWFzZWQgYmVsb3cgKi8NCiAgICAgICAgY29uc3Qgc3RydWN0IGNyZWQgKmNyZWQgPSBnZXRfdGFz
a19jcmVkKHRhc2spOw0KICAgICAgICBzdHJ1Y3QgYWFfdGFza19jdHggKmN0eCA9IHRhc2tfY3R4
KGN1cnJlbnQpOw0KICAgICAgICBzdHJ1Y3QgYWFfbGFiZWwgKmxhYmVsID0gTlVMTDsNCiAgICAg
ICAgYm9vbCBuZXdsaW5lID0gdHJ1ZTsNCg0KICAgICAgICBpZiAoc3RyY21wKG5hbWUsICJjdXJy
ZW50IikgPT0gMCkNCiAgICAgICAgICAgICAgICBsYWJlbCA9IGFhX2dldF9uZXdlc3RfbGFiZWwo
Y3JlZF9sYWJlbChjcmVkKSk7DQogICAgICAgIGVsc2UgaWYgKHN0cmNtcChuYW1lLCAicHJldiIp
ID09IDAgICYmIGN0eC0+cHJldmlvdXMpICAgLy9IRVJFIGN0eC0+cHJldmlvdXMgPT0gTlVMTCB0
aGVuIHJldHVybiAtRUlOVkFMOw0KICAgICAgICAgICAgICAgIGxhYmVsID0gYWFfZ2V0X25ld2Vz
dF9sYWJlbChjdHgtPnByZXZpb3VzKTsNCiAgICAgICAgZWxzZSBpZiAoc3RyY21wKG5hbWUsICJl
eGVjIikgPT0gMCAmJiBjdHgtPm9uZXhlYykgICAgLy9IRVJFIGN0eC0+b25leGVjID09IE5VTEwg
dGhlbiByZXR1cm4gLUVJTlZBTDsNCiAgICAgICAgICAgICAgICBsYWJlbCA9IGFhX2dldF9uZXdl
c3RfbGFiZWwoY3R4LT5vbmV4ZWMpOw0KICAgICAgICBlbHNlIGlmIChzdHJjbXAobmFtZSwgImNv
bnRleHQiKSA9PSAwKSB7DQogICAgICAgICAgICAgICAgbGFiZWwgPSBhYV9nZXRfbmV3ZXN0X2xh
YmVsKGNyZWRfbGFiZWwoY3JlZCkpOw0KICAgICAgICAgICAgICAgIG5ld2xpbmUgPSBmYWxzZTsN
CiAgICAgICAgfSBlbHNlDQogICAgICAgICAgICAgICAgZXJyb3IgPSAtRUlOVkFMOw0KDQogICAg
ICAgIGlmIChsYWJlbCkNCiAgICAgICAgICAgICAgICBlcnJvciA9IGFhX2dldHByb2NhdHRyKGxh
YmVsLCB2YWx1ZSwgbmV3bGluZSk7DQoNCiAgICAgICAgYWFfcHV0X2xhYmVsKGxhYmVsKTsNCiAg
ICAgICAgcHV0X2NyZWQoY3JlZCk7DQoNCiAgICAgICAgcmV0dXJuIGVycm9yOw0KfQ0KDQp0aGFu
a3MgZm9yIHlvdXIgZGlyZWN0aW9uLg0KDQogDQpGcm9tOiBKYW4gU3RhbmNlaw0KRGF0ZTogMjAy
MS0wMS0xOCAxOTowNA0KVG86IGxpdXhwMTENCkNDOiBsdHA7IGxrbWwNClN1YmplY3Q6IFJlOiBb
TFRQXSBbUEFUQ0hdIGZzL3Byb2MwMS5jOmFkZCBrbm93biBpc3N1ZXMNCg0KDQoNCnRoYW5rcyBm
b3IgZ29vZCBxdWVzdGlvbi4NCg0KaSBjaGVjayB0aGUgc291cmNlIGxpbnV4LXNvdXJjZS01Ljgu
MCxpbiBmaWxlc2VjdXJpdHkvc21hY2svc21hY2tfbHNtLmM6c21hY2tfZ2V0cHJvY2F0dHINCmRp
cmVjdGx5IHJldHVybiAtRUlOVkFMLg0KDQpzdGF0aWMgaW50IHNtYWNrX2dldHByb2NhdHRyKHN0
cnVjdCB0YXNrX3N0cnVjdCAqcCwgY2hhciAqbmFtZSwgY2hhciAqKnZhbHVlKQ0Kew0KICAgICAg
ICBzdHJ1Y3Qgc21hY2tfa25vd24gKnNrcCA9IHNta19vZl90YXNrX3N0cnVjdChwKTsNCiAgICAg
ICAgY2hhciAqY3A7DQogICAgICAgIGludCBzbGVuOw0KDQogICAgICAgIGlmIChzdHJjbXAobmFt
ZSwgImN1cnJlbnQiKSAhPSAwICYmIHN0cmNtcChuYW1lLCAiY29udGV4dCIpICE9IDApDQogICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNClRoYXQgZG9lc24ndCBsb29rIGNvcnJlY3Qs
IHN0cmNtcCB3aGVuIHJlYWRpbmcgImN1cnJlbnQiIHJldHVybnMgMCwgc28geW91IGNvbmRpdGlv
biBhYm92ZQ0Kc2hvdWxkbid0IGJlIGhpdC4NCg0KSSdtIGd1ZXNzaW5nIHlvdSBkb24ndCBoYXZl
IHNtYWNrIGVuYWJsZWQsIGFuZCBFSU5WQUwgaXMgdGhlIGRlZmF1bHQgTFNNIHJldCB2YWx1ZQ0K
aW4gc3VjaCBjYXNlOg0KDQpMU01fSE9PSyhpbnQsIC1FSU5WQUwsIGdldHByb2NhdHRyLCBzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnAsIGNoYXIgKm5hbWUsDQogICAgICAgICBjaGFyICoqdmFsdWUpDQoN
CmludCBzZWN1cml0eV9nZXRwcm9jYXR0cihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IGNo
YXIgKmxzbSwgY2hhciAqbmFtZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hh
ciAqKnZhbHVlKQ0Kew0KICAgICAgICBzdHJ1Y3Qgc2VjdXJpdHlfaG9va19saXN0ICpocDsNCg0K
ICAgICAgICBobGlzdF9mb3JfZWFjaF9lbnRyeShocCwgJnNlY3VyaXR5X2hvb2tfaGVhZHMuZ2V0
cHJvY2F0dHIsIGxpc3QpIHsNCiAgICAgICAgICAgICAgICBpZiAobHNtICE9IE5VTEwgJiYgc3Ry
Y21wKGxzbSwgaHAtPmxzbSkpDQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCiAg
ICAgICAgICAgICAgICByZXR1cm4gaHAtPmhvb2suZ2V0cHJvY2F0dHIocCwgbmFtZSwgdmFsdWUp
Ow0KICAgICAgICB9DQogICAgICAgIHJldHVybiBMU01fUkVUX0RFRkFVTFQoZ2V0cHJvY2F0dHIp
Ow0KfQ0KDQoNCiAgICAgICAgY3AgPSBrc3RyZHVwKHNrcC0+c21rX2tub3duLCBHRlBfS0VSTkVM
KTsNCiAgICAgICAgaWYgKGNwID09IE5VTEwpDQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07DQoNCiAgICAgICAgc2xlbiA9IHN0cmxlbihjcCk7DQogICAgICAgICp2YWx1ZSA9IGNwOw0K
ICAgICAgICByZXR1cm4gc2xlbjsNCn0NCg0KDQpGcm9tOkphbiBTdGFuY2VrDQpEYXRlOiAyMDIx
LTAxLTE1IDIyOjU0DQpUbzpYaW5wZW5nIExpdQ0KQ0M6bHRwDQpTdWJqZWN0OiBSZTogW0xUUF0g
W1BBVENIXSBmcy9wcm9jMDEuYzphZGQga25vd24gaXNzdWVzDQotLS0tLSBPcmlnaW5hbCBNZXNz
YWdlIC0tLS0tDQo+IFRlc3QgaW4gdWJ1bnR1MjAuMTAsdGhlcmUgYXJlIHNldmVyYWwgZmFpbHVy
ZSB0ZXN0cy4NCj4gDQo+IHByb2MwMSAgICAgIDEgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6IHJl
YWQgZmFpbGVkOg0KPiAvcHJvYy9zZWxmL3Rhc2svNjE1OTUvYXR0ci9zbWFjay9jdXJyZW50OiBl
cnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQo+IHByb2MwMSAgICAgIDIgIFRGQUlM
ICA6ICBwcm9jMDEuYzozOTY6IHJlYWQgZmFpbGVkOg0KPiAvcHJvYy9zZWxmL3Rhc2svNjE1OTUv
YXR0ci9hcHBhcm1vci9wcmV2OiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQo+
IHByb2MwMSAgICAgIDMgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6IHJlYWQgZmFpbGVkOg0KPiAv
cHJvYy9zZWxmL3Rhc2svNjE1OTUvYXR0ci9hcHBhcm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIp
OiBJbnZhbGlkIGFyZ3VtZW50DQo+IHByb2MwMSAgICAgIDQgIFRGQUlMICA6ICBwcm9jMDEuYzoz
OTY6IHJlYWQgZmFpbGVkOg0KPiAvcHJvYy9zZWxmL2F0dHIvc21hY2svY3VycmVudDogZXJybm89
RUlOVkFMKDIyKTogSW52YWxpZCBhcmd1bWVudA0KPiBwcm9jMDEgICAgICA1ICBURkFJTCAgOiAg
cHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDoNCj4gL3Byb2Mvc2VsZi9hdHRyL2FwcGFybW9yL3By
ZXY6IGVycm5vPUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQNCj4gcHJvYzAxICAgICAgNiAg
VEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6DQo+IC9wcm9jL3NlbGYvYXR0ci9h
cHBhcm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQpJJ20gT0sg
d2l0aCBpZ25vcmluZyBpdCwgYnV0IGNvbW1pdCBsb2cgY291bGQgZXhwbGFpbiBtb3JlIHdoeSB3
ZSBnZXQgRUlOVkFMDQpvbiByZWFkIGhlcmUuDQoNCg==

------=_001_NextPart108035331252_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210118190950008898 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></span>Right,=
 smack is disabled in my system, and&nbsp;<span style=3D"line-height: 1.5;=
 background-color: transparent;">enabled&nbsp;</span><span style=3D"line-h=
eight: 1.5; background-color: transparent;">appamor.</span></div><div><br>=
</div><div><div>static int apparmor_getprocattr(struct task_struct *task, =
char *name,</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; char **value)<=
/div><div>{</div><div>&nbsp; &nbsp; &nbsp; &nbsp; int error =3D -ENOENT;</=
div><div>&nbsp; &nbsp; &nbsp; &nbsp; /* released below */</div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; const struct cred *cred =3D get_task_cred(task);</di=
v><div>&nbsp; &nbsp; &nbsp; &nbsp; struct aa_task_ctx *ctx =3D task_ctx(cu=
rrent);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; struct aa_label *label =3D N=
ULL;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; bool newline =3D true;</div><di=
v><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(name, "current") =
=3D=3D 0)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; label =3D aa_get_newest_label(cred_label(cred));</div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; else if (strcmp(name, "prev") =3D=3D 0 &nbsp;&amp;&amp; ctx=
-&gt;previous) &nbsp; //HERE&nbsp;<span style=3D"line-height: 1.5; backgro=
und-color: transparent;">ctx-&gt;previous =3D=3D NULL then return&nbsp;</s=
pan><span style=3D"line-height: 1.5; background-color: transparent;">-EINV=
AL;</span></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; label =3D aa_get_newest_label(ctx-&gt;previous);</div><div>&nbsp; &nbsp=
; &nbsp; &nbsp; else if (strcmp(name, "exec") =3D=3D 0 &amp;&amp; ctx-&gt;=
onexec) &nbsp;<span style=3D"line-height: 1.5; background-color: transpare=
nt;">&nbsp; //HERE&nbsp;</span><span style=3D"line-height: 1.5; background=
-color: transparent;">ctx-&gt;</span>onexec<span style=3D"line-height: 1.5=
; background-color: transparent;">&nbsp;=3D=3D NULL then return&nbsp;</spa=
n><span style=3D"line-height: 1.5; background-color: transparent;">-EINVAL=
;</span></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 label =3D aa_get_newest_label(ctx-&gt;onexec);</div><div>&nbsp; &nbsp; &n=
bsp; &nbsp; else if (strcmp(name, "context") =3D=3D 0) {</div><div>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; label =3D aa_get_newest_l=
abel(cred_label(cred));</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; newline =3D false;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; }=
 else</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; er=
ror =3D -EINVAL;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; if (=
label)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e=
rror =3D aa_getprocattr(label, value, newline);</div><div><br></div><div>&=
nbsp; &nbsp; &nbsp; &nbsp; aa_put_label(label);</div><div>&nbsp; &nbsp; &n=
bsp; &nbsp; put_cred(cred);</div><div><br></div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; return error;</div><div>}</div></div><div><br></div><div>thanks for=
 your direction.</div><div><br></div>=0A<blockquote style=3D"margin-Top: 0=
px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><div>&n=
bsp;</div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding=
:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; F=
ONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADD=
ING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailt=
o:jstancek@redhat.com">Jan Stancek</a></div><div><b>Date:</b>&nbsp;2021-01=
-18&nbsp;19:04</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chinate=
lecom.cn">liuxp11</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp@list=
s.linux.it">ltp</a>; <a href=3D"mailto:lkml@jv-coder.de">lkml</a></div><di=
v><b>Subject:</b>&nbsp;Re: [LTP] [PATCH] fs/proc01.c:add known issues</div=
></div></div><div><div class=3D"FoxDiv20210118190950008898"><div style=3D"=
font-family: times new roman, new york, times, serif; font-size: 12pt; col=
or: #000000"><div><br></div><hr id=3D"zwchr"><blockquote style=3D"border-l=
eft-width: 2px; border-left-style: solid; border-left-color: rgb(16, 16, 2=
55); margin-left: 0.5em; padding-left: 5px; color: rgb(0, 0, 0); font-weig=
ht: normal; font-style: normal; text-decoration: none; font-family: Helvet=
ica, Arial, sans-serif; font-size: 12pt; margin-top: 0px; margin-bottom: 0=
px;"><div>thanks for good question.</div><div><br></div><div>i check the s=
ource linux-source-5.8.0,in filesecurity/smack/smack_lsm.c:<span style=3D"=
line-height: 1.5; background-color: transparent;">smack_getprocattr</span>=
</div><div>directly return&nbsp;<b style=3D"line-height: 1.5; background-c=
olor: transparent;">-EINVAL.</b></div><div><br></div><div><div>static int =
smack_getprocattr(struct task_struct *p, char *name, char **value)</div><d=
iv>{</div><div>&nbsp; &nbsp; &nbsp; &nbsp; struct smack_known *skp =3D smk=
_of_task_struct(p);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; char *cp;</div><=
div>&nbsp; &nbsp; &nbsp; &nbsp; int slen;</div><div><br></div><div><b>&nbs=
p; &nbsp; &nbsp; &nbsp; if (strcmp(name, "current") !=3D 0 &amp;&amp; strc=
mp(name, "context") !=3D 0)</b></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</b></div></div></blockquote><di=
v><br></div><div>That doesn't look correct, strcmp when reading "current" =
returns 0, so you condition above<br></div><div>shouldn't be hit.<br></div=
><div><br></div><div>I'm guessing you don't have smack enabled, and EINVAL=
 is the default LSM ret value<br></div><div>in such case:<br></div><div><b=
r></div><div><strong>LSM_HOOK(int, -EINVAL, getprocattr, struct task_struc=
t *p, char *name,</strong><br><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; char **value)</strong></div><div><br></div><div>int security_=
getprocattr(struct task_struct *p, const char *lsm, char *name,<br>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char **value)<br>{<br>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct security_hook_list *hp;<br><br>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hlist_for_each_entry(hp, &amp;security_hook_=
heads.getprocattr, list) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lsm !=3D NULL &amp;&amp=
; strcmp(lsm, hp-&gt;lsm))<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; continue;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return hp-&gt;hook.getp=
rocattr(p, name, value);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>return LSM_RET_DEFAUL=
T(getprocattr);</strong><br>}</div><div><br></div><blockquote style=3D"bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(16, =
16, 255); margin-left: 0.5em; padding-left: 5px; color: rgb(0, 0, 0); font=
-weight: normal; font-style: normal; text-decoration: none; font-family: H=
elvetica, Arial, sans-serif; font-size: 12pt; margin-top: 0px; margin-bott=
om: 0px;"><div><br></div><div><div>&nbsp; &nbsp; &nbsp; &nbsp; cp =3D kstr=
dup(skp-&gt;smk_known, GFP_KERNEL);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
if (cp =3D=3D NULL)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; return -ENOMEM;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; slen =3D strlen(cp);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; *value =
=3D cp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; return slen;</div><div>}</di=
v></div><div><br></div><div><br></div><blockquote style=3D"margin-Top: 0px=
; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><div styl=
e=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"=
><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT=
-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PA=
DDING-TOP: 8px"><div><b>From:</b><a href=3D"mailto:jstancek@redhat.com" ta=
rget=3D"_blank">Jan Stancek</a><br data-mce-bogus=3D"1"></div><div><b>Date=
:</b>&nbsp;2021-01-15&nbsp;22:54</div><div><b>To:</b><a href=3D"mailto:liu=
xp11@chinatelecom.cn" target=3D"_blank">Xinpeng Liu</a><br data-mce-bogus=
=3D"1"></div><div><b>CC:</b><a href=3D"mailto:ltp@lists.linux.it" target=
=3D"_blank">ltp</a><br data-mce-bogus=3D"1"></div><div><b>Subject:</b>&nbs=
p;Re: [LTP] [PATCH] fs/proc01.c:add known issues</div></div></div><div><di=
v>----- Original Message -----</div><div>&gt; Test in ubuntu20.10,there ar=
e several failure tests.</div><div>&gt; </div><div>&gt; proc01&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:<=
/div><div>&gt; /proc/self/task/61595/attr/smack/current: errno=3DEINVAL(22=
): Invalid argument</div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&=
nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div><div>&gt; /proc/=
self/task/61595/attr/apparmor/prev: errno=3DEINVAL(22): Invalid argument</=
div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; TFAIL&nbsp; :&n=
bsp; proc01.c:396: read failed:</div><div>&gt; /proc/self/task/61595/attr/=
apparmor/exec: errno=3DEINVAL(22): Invalid argument</div><div>&gt; proc01&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: re=
ad failed:</div><div>&gt; /proc/self/attr/smack/current: errno=3DEINVAL(22=
): Invalid argument</div><div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&=
nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div><div>&gt; /proc/=
self/attr/apparmor/prev: errno=3DEINVAL(22): Invalid argument</div><div>&g=
t; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp; TFAIL&nbsp; :&nbsp; proc01=
.c:396: read failed:</div><div>&gt; /proc/self/attr/apparmor/exec: errno=
=3DEINVAL(22): Invalid argument</div><div>I'm OK with ignoring it, but com=
mit log could explain more why we get EINVAL</div><div>on read here.</div>=
</div></blockquote></blockquote><div><br></div></div></div></div></blockqu=
ote>=0A</body></html>
------=_001_NextPart108035331252_=------


--===============1254349541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1254349541==--

