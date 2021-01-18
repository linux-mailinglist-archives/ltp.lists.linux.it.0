Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631C2F984F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 04:35:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 839A93C2965
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 04:35:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4AB0F3C2965
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 04:35:01 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 827CE1000348
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 04:34:56 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:15975.414594558
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-1ee4c8a4e585427c96fbcb9b03bc94e7
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 07E1D2800A6;
 Mon, 18 Jan 2021 11:34:46 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 1ee4c8a4e585427c96fbcb9b03bc94e7 for
 jstancek@redhat.com; Mon Jan 18 11:34:53 2021
X-Transaction-ID: 1ee4c8a4e585427c96fbcb9b03bc94e7
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Mon, 18 Jan 2021 11:34:45 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Jan Stancek" <jstancek@redhat.com>
References: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <95241263.33332311.1610722445185.JavaMail.zimbra@redhat.com>
X-Priority: 3
X-GUID: 40E1B042-5D66-4BDA-8635-792F448CF3F9
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202101181134453606602@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0317318343=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============0317318343==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart086864350458_=----"

This is a multi-part message in MIME format.

------=_001_NextPart086864350458_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

dGhhbmtzIGZvciBnb29kIHF1ZXN0aW9uLg0KDQppIGNoZWNrIHRoZSBzb3VyY2UgbGludXgtc291
cmNlLTUuOC4wLGluIGZpbGVzZWN1cml0eS9zbWFjay9zbWFja19sc20uYzpzbWFja19nZXRwcm9j
YXR0cg0KZGlyZWN0bHkgcmV0dXJuIC1FSU5WQUwuDQoNCnN0YXRpYyBpbnQgc21hY2tfZ2V0cHJv
Y2F0dHIoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjaGFyICpuYW1lLCBjaGFyICoqdmFsdWUpDQp7
DQogICAgICAgIHN0cnVjdCBzbWFja19rbm93biAqc2twID0gc21rX29mX3Rhc2tfc3RydWN0KHAp
Ow0KICAgICAgICBjaGFyICpjcDsNCiAgICAgICAgaW50IHNsZW47DQoNCiAgICAgICAgaWYgKHN0
cmNtcChuYW1lLCAiY3VycmVudCIpICE9IDAgJiYgc3RyY21wKG5hbWUsICJjb250ZXh0IikgIT0g
MCkNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCg0KICAgICAgICBjcCA9IGtzdHJk
dXAoc2twLT5zbWtfa25vd24sIEdGUF9LRVJORUwpOw0KICAgICAgICBpZiAoY3AgPT0gTlVMTCkN
CiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCg0KICAgICAgICBzbGVuID0gc3RybGVu
KGNwKTsNCiAgICAgICAgKnZhbHVlID0gY3A7DQogICAgICAgIHJldHVybiBzbGVuOw0KfQ0KDQoN
CiANCkZyb206IEphbiBTdGFuY2VrDQpEYXRlOiAyMDIxLTAxLTE1IDIyOjU0DQpUbzogWGlucGVu
ZyBMaXUNCkNDOiBsdHANClN1YmplY3Q6IFJlOiBbTFRQXSBbUEFUQ0hdIGZzL3Byb2MwMS5jOmFk
ZCBrbm93biBpc3N1ZXMNCiANCi0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0NCj4gVGVzdCBp
biB1YnVudHUyMC4xMCx0aGVyZSBhcmUgc2V2ZXJhbCBmYWlsdXJlIHRlc3RzLg0KPiANCj4gcHJv
YzAxICAgICAgMSAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6DQo+IC9wcm9j
L3NlbGYvdGFzay82MTU5NS9hdHRyL3NtYWNrL2N1cnJlbnQ6IGVycm5vPUVJTlZBTCgyMik6IElu
dmFsaWQgYXJndW1lbnQNCj4gcHJvYzAxICAgICAgMiAgVEZBSUwgIDogIHByb2MwMS5jOjM5Njog
cmVhZCBmYWlsZWQ6DQo+IC9wcm9jL3NlbGYvdGFzay82MTU5NS9hdHRyL2FwcGFybW9yL3ByZXY6
IGVycm5vPUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQNCj4gcHJvYzAxICAgICAgMyAgVEZB
SUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6DQo+IC9wcm9jL3NlbGYvdGFzay82MTU5
NS9hdHRyL2FwcGFybW9yL2V4ZWM6IGVycm5vPUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQN
Cj4gcHJvYzAxICAgICAgNCAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6DQo+
IC9wcm9jL3NlbGYvYXR0ci9zbWFjay9jdXJyZW50OiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlk
IGFyZ3VtZW50DQo+IHByb2MwMSAgICAgIDUgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6IHJlYWQg
ZmFpbGVkOg0KPiAvcHJvYy9zZWxmL2F0dHIvYXBwYXJtb3IvcHJldjogZXJybm89RUlOVkFMKDIy
KTogSW52YWxpZCBhcmd1bWVudA0KPiBwcm9jMDEgICAgICA2ICBURkFJTCAgOiAgcHJvYzAxLmM6
Mzk2OiByZWFkIGZhaWxlZDoNCj4gL3Byb2Mvc2VsZi9hdHRyL2FwcGFybW9yL2V4ZWM6IGVycm5v
PUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQNCiANCkknbSBPSyB3aXRoIGlnbm9yaW5nIGl0
LCBidXQgY29tbWl0IGxvZyBjb3VsZCBleHBsYWluIG1vcmUgd2h5IHdlIGdldCBFSU5WQUwNCm9u
IHJlYWQgaGVyZS4NCiANCg==

------=_001_NextPart086864350458_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-fami=
ly: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A<div><span></span>thanks for good question.</div><div><br>=
</div><div>i check the source linux-source-5.8.0,in filesecurity/smack/sma=
ck_lsm.c:<span style=3D"line-height: 1.5; background-color: transparent;">=
smack_getprocattr</span></div><div>directly return&nbsp;<b style=3D"line-h=
eight: 1.5; background-color: transparent;">-EINVAL.</b></div><div><br></d=
iv><div><div>static int smack_getprocattr(struct task_struct *p, char *nam=
e, char **value)</div><div>{</div><div>&nbsp; &nbsp; &nbsp; &nbsp; struct =
smack_known *skp =3D smk_of_task_struct(p);</div><div>&nbsp; &nbsp; &nbsp;=
 &nbsp; char *cp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; int slen;</div><di=
v><br></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; if (strcmp(name, "current"=
) !=3D 0 &amp;&amp; strcmp(name, "context") !=3D 0)</b></div><div><b>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</b></di=
v></div><div><br></div><div><div>&nbsp; &nbsp; &nbsp; &nbsp; cp =3D kstrdu=
p(skp-&gt;smk_known, GFP_KERNEL);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; if=
 (cp =3D=3D NULL)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; return -ENOMEM;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &n=
bsp; slen =3D strlen(cp);</div><div>&nbsp; &nbsp; &nbsp; &nbsp; *value =3D=
 cp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; return slen;</div><div>}</div><=
/div><div><br></div>=0A<div><br></div>=0A<blockquote style=3D"margin-Top: =
0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><div>&=
nbsp;</div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;paddin=
g:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; =
FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PAD=
DING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mail=
to:jstancek@redhat.com">Jan Stancek</a></div><div><b>Date:</b>&nbsp;2021-0=
1-15&nbsp;22:54</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chinat=
elecom.cn">Xinpeng Liu</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp=
@lists.linux.it">ltp</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [PATCH] =
fs/proc01.c:add known issues</div></div></div><div><div>&nbsp;</div>=0A<di=
v>----- Original Message -----</div>=0A<div>&gt; Test in ubuntu20.10,there=
 are several failure tests.</div>=0A<div>&gt; </div>=0A<div>&gt; proc01&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read=
 failed:</div>=0A<div>&gt; /proc/self/task/61595/attr/smack/current: errno=
=3DEINVAL(22): Invalid argument</div>=0A<div>&gt; proc01&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 2&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div>=
=0A<div>&gt; /proc/self/task/61595/attr/apparmor/prev: errno=3DEINVAL(22):=
 Invalid argument</div>=0A<div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3=
&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div>=0A<div>&gt; /p=
roc/self/task/61595/attr/apparmor/exec: errno=3DEINVAL(22): Invalid argume=
nt</div>=0A<div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; TFAIL&nb=
sp; :&nbsp; proc01.c:396: read failed:</div>=0A<div>&gt; /proc/self/attr/s=
mack/current: errno=3DEINVAL(22): Invalid argument</div>=0A<div>&gt; proc0=
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: =
read failed:</div>=0A<div>&gt; /proc/self/attr/apparmor/prev: errno=3DEINV=
AL(22): Invalid argument</div>=0A<div>&gt; proc01&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 6&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:</div>=0A<div>=
&gt; /proc/self/attr/apparmor/exec: errno=3DEINVAL(22): Invalid argument</=
div>=0A<div>&nbsp;</div>=0A<div>I'm OK with ignoring it, but commit log co=
uld explain more why we get EINVAL</div>=0A<div>on read here.</div>=0A<div=
>&nbsp;</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart086864350458_=------


--===============0317318343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0317318343==--

