Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A82FC5FE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 01:42:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA2EE3C53EC
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 01:42:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4A71B3C2658
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 01:42:47 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.220])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0B6876002A1
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 01:42:43 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:54515.533524521
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-745b1df94bdc4aeabdb0dc4a34a654d8
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id E7368280084;
 Wed, 20 Jan 2021 08:42:23 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 745b1df94bdc4aeabdb0dc4a34a654d8 for pvorel@suse.cz; 
 Wed Jan 20 08:42:40 2021
X-Transaction-ID: 745b1df94bdc4aeabdb0dc4a34a654d8
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 20 Jan 2021 08:42:23 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Petr Vorel" <pvorel@suse.cz>, 
	ltp <ltp@lists.linux.it>
References: <20210119123308.24578-1-pvorel@suse.cz>
X-Priority: 3
X-GUID: 88AEC572-116A-4A2E-B0F2-F8168899C3FC
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202101200842236418021@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE, MIME_BASE64_TEXT,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] fs/proc01.c: Whitelist attr and task files
 for apparmor and smack
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: multipart/mixed; boundary="===============0936164071=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============0936164071==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart854244420364_=----"

This is a multi-part message in MIME format.

------=_001_NextPart854244420364_=----
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB5b3VyIHJld3JpdHRlbiENCiANCkZyb206IFBldHIgVm9yZWwNCkRhdGU6IDIw
MjEtMDEtMTkgMjA6MzMNClRvOiBsdHANCkNDOiBYaW5wZW5nIExpdTsgQ3lyaWwgSHJ1YmlzOyBK
b2VyZyBWZWhsb3c7IEphbiBTdGFuY2VrOyBQZXRyIFZvcmVsDQpTdWJqZWN0OiBbUEFUQ0ggdjIg
MS8xXSBmcy9wcm9jMDEuYzogV2hpdGVsaXN0IGF0dHIgYW5kIHRhc2sgZmlsZXMgZm9yIGFwcGFy
bW9yIGFuZCBzbWFjaw0KRnJvbTogWGlucGVuZyBMaXUgPGxpdXhwMTFAY2hpbmF0ZWxlY29tLmNu
Pg0KIA0KV2UgYXJlIGFscmVhZHkgd2hpdGVsaXN0aW5nIExTTSBmaWxlcyAoL3Byb2Mvc2VsZi9h
dHRyLyogYW5kDQovcHJvYy9zZWxmL3Rhc2svWzAtOV0qL2F0dHIvKikgc2luY2UgMjAwOS4gVGhh
dCdzIHByb2JhYmx5IGR1ZSB0aGUNCmRlZmF1bHQgdmFsdWUgZm9yIHtnLHN9ZXRwcm9jYXR0ciBM
U01fSE9PSyBpcyAtRUlOVkFMIHdoZW4gTFNNIG1vZHVsZQ0Kbm90IGVuYWJsZWQuDQogDQpCb3Ro
IEFwcEFybW9yIGFuZCBTTUFDSyBhbGxvdyB0byByZWFkIG9ubHkNCi9wcm9jL3NlbGYvYXR0ci9h
cHBhcm1vci9jdXJyZW50LCB0aGUgcmVzdCByZXR1cm4gRUlOVkFMLg0KIA0KV2hpbGUgcmVhZGlu
ZyAvcHJvYy9zZWxmL2F0dHIvYXBwYXJtb3IvY3VycmVudCAoZm9yIEFwcEFybW9yKSBhbmQNCi9w
cm9jL3NlbGYvYXR0ci9jdXJyZW50IChmb3IgYm90aCBBcHBBcm1vciBhbmQgU0VMaW51eCkgbW9z
dGx5IHdvcmsNCihlLmcuIHZhbHVlIGNvbnRhaW5zIHVuY29uZmluZWQpLCBpbiBzb21lIGNhc2Vz
IGl0J3Mgbm90IHdvcmtpbmcgKGUuZy4NCkFwcEFybW9yIG1vZHVsZSBsb2FkZWQsIGJ1dCBmaWxl
c3lzdGVtIGlzIG5vdCBtb3VudGVkKS4gVGh1cyBrZWVwIGl0DQphbHNvIGRpc2FibGVkLg0KIA0K
VWJ1bnR1IDIwLjEwIChBcHBBcm1vciBhbmQgU01BQ0sgZW5hYmxlZCk6DQpwcm9jMDEgICAgICAx
ICBURkFJTCAgOiAgcHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDogL3Byb2Mvc2VsZi90YXNrLzYx
NTk1L2F0dHIvc21hY2svY3VycmVudDogZXJybm89RUlOVkFMKDIyKTogSW52YWxpZCBhcmd1bWVu
dA0KcHJvYzAxICAgICAgMiAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6IC9w
cm9jL3NlbGYvdGFzay82MTU5NS9hdHRyL2FwcGFybW9yL3ByZXY6IGVycm5vPUVJTlZBTCgyMik6
IEludmFsaWQgYXJndW1lbnQNCnByb2MwMSAgICAgIDMgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6
IHJlYWQgZmFpbGVkOiAvcHJvYy9zZWxmL3Rhc2svNjE1OTUvYXR0ci9hcHBhcm1vci9leGVjOiBl
cnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQpwcm9jMDEgICAgICA0ICBURkFJTCAg
OiAgcHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDogL3Byb2Mvc2VsZi9hdHRyL3NtYWNrL2N1cnJl
bnQ6IGVycm5vPUVJTlZBTCgyMik6IEludmFsaWQgYXJndW1lbnQNCnByb2MwMSAgICAgIDUgIFRG
QUlMICA6ICBwcm9jMDEuYzozOTY6IHJlYWQgZmFpbGVkOiAvcHJvYy9zZWxmL2F0dHIvYXBwYXJt
b3IvcHJldjogZXJybm89RUlOVkFMKDIyKTogSW52YWxpZCBhcmd1bWVudA0KcHJvYzAxICAgICAg
NiAgVEZBSUwgIDogIHByb2MwMS5jOjM5NjogcmVhZCBmYWlsZWQ6IC9wcm9jL3NlbGYvYXR0ci9h
cHBhcm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQogDQpvcGVu
U1VTRSAoa2VybmVsIDUuMTAuNywgQXBwQXJtb3IgZW5hYmxlZCk6DQpwcm9jMDEgICAgICAxICBU
RkFJTCAgOiAgcHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDogL3Byb2Mvc2VsZi90YXNrLzYzNjcv
YXR0ci9hcHBhcm1vci9wcmV2OiBlcnJubz1FSU5WQUwoMjIpOiBJbnZhbGlkIGFyZ3VtZW50DQpw
cm9jMDEgICAgICAyICBURkFJTCAgOiAgcHJvYzAxLmM6Mzk2OiByZWFkIGZhaWxlZDogL3Byb2Mv
c2VsZi90YXNrLzYzNjcvYXR0ci9hcHBhcm1vci9leGVjOiBlcnJubz1FSU5WQUwoMjIpOiBJbnZh
bGlkIGFyZ3VtZW50DQpwcm9jMDEgICAgICAzICBURkFJTCAgOiAgcHJvYzAxLmM6Mzk2OiByZWFk
IGZhaWxlZDogL3Byb2Mvc2VsZi9hdHRyL2FwcGFybW9yL3ByZXY6IGVycm5vPUVJTlZBTCgyMik6
IEludmFsaWQgYXJndW1lbnQNCnByb2MwMSAgICAgIDQgIFRGQUlMICA6ICBwcm9jMDEuYzozOTY6
IHJlYWQgZmFpbGVkOiAvcHJvYy9zZWxmL2F0dHIvYXBwYXJtb3IvZXhlYzogZXJybm89RUlOVkFM
KDIyKTogSW52YWxpZCBhcmd1bWVudA0KIA0KKyBXaGlsZSBhdCBpdCwgZml4IGEgY29tcGFyaXNv
biB3YXJuaW5nLg0KIA0KUmV2aWV3ZWQtYnk6IEpvZXJnIFZlaGxvdyA8am9lcmcudmVobG93QGFv
eC10ZWNoLmRlPg0KUmV2aWV3ZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29t
Pg0KUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pg0KU2lnbmVkLW9mZi1i
eTogWGlucGVuZyBMaXUgPGxpdXhwMTFAY2hpbmF0ZWxlY29tLmNuPg0KWyBwdm9yZWw6IHJld3Jp
dHRlbiBjb21taXQgbWVzc2FnZSBdDQpTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxA
c3VzZS5jej4NCi0tLQ0KSGkgTGl1LCBKYW4sDQogDQphcyB3ZSBhZ3JlZWQgd2l0aCBDeXJpbCB0
aGF0IHRoaXMgaXMgYSB2YWxpZCBmaXgsIEkgZGFyZWQgdG8gZG8gdGhlDQppbnZlc3RpZ2F0aW9u
IGFuZCBzZW5kIHYyIHdpdGggaW1wcm92ZWQgY29tbWl0IG1lc3NhZ2UuDQogDQpLaW5kIHJlZ2Fy
ZHMsDQpQZXRyDQogDQp0ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMgfCA2ICsrKysr
LQ0KMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIA0KZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvZnMvcHJvYy9wcm9jMDEuYw0KaW5kZXggOTY4NDM2OTVjLi45NjQ0MWQxNTMgMTAwNjQ0
DQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMNCisrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEuYw0KQEAgLTYzLDcgKzYzLDcgQEAgc3RhdGljIGNoYXIg
Km9wdF9tYXhtYnl0ZXNzdHI7DQpzdGF0aWMgY2hhciAqcHJvY3BhdGggPSAiL3Byb2MiOw0Kc3Rh
dGljIGNvbnN0IGNoYXIgc2VsZnBhdGhbXSA9ICIvcHJvYy9zZWxmIjsNCnNpemVfdCBidWZmc2l6
ZSA9IDEwMjQ7DQotc3RhdGljIGxvbmcgbG9uZyBtYXhieXRlczsNCitzdGF0aWMgdW5zaWduZWQg
bG9uZyBsb25nIG1heGJ5dGVzOw0KdW5zaWduZWQgbG9uZyBsb25nIHRvdGFsX3JlYWQ7DQp1bnNp
Z25lZCBpbnQgdG90YWxfb2JqOw0KQEAgLTk3LDcgKzk3LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbWFwcGluZyBrbm93bl9pc3N1ZXNbXSA9IHsNCnsicmVhZCIsICIvcHJvYy9zZWxmL21lbSIs
IEVJT30sDQp7InJlYWQiLCAiL3Byb2Mvc2VsZi90YXNrL1swLTldKi9tZW0iLCBFSU99LA0KeyJy
ZWFkIiwgIi9wcm9jL3NlbGYvYXR0ci8qIiwgRUlOVkFMfSwNCisgeyJyZWFkIiwgIi9wcm9jL3Nl
bGYvYXR0ci9zbWFjay8qIiwgRUlOVkFMfSwNCisgeyJyZWFkIiwgIi9wcm9jL3NlbGYvYXR0ci9h
cHBhcm1vci8qIiwgRUlOVkFMfSwNCnsicmVhZCIsICIvcHJvYy9zZWxmL3Rhc2svWzAtOV0qL2F0
dHIvKiIsIEVJTlZBTH0sDQorIHsicmVhZCIsICIvcHJvYy9zZWxmL3Rhc2svWzAtOV0qL2F0dHIv
c21hY2svKiIsIEVJTlZBTH0sDQorIHsicmVhZCIsICIvcHJvYy9zZWxmL3Rhc2svWzAtOV0qL2F0
dHIvYXBwYXJtb3IvKiIsIEVJTlZBTH0sDQp7InJlYWQiLCAiL3Byb2Mvc2VsZi9ucy8qIiwgRUlO
VkFMfSwNCnsicmVhZCIsICIvcHJvYy9zZWxmL3Rhc2svWzAtOV0qL25zLyoiLCBFSU5WQUx9LA0K
eyJyZWFkIiwgIi9wcm9jL3BwYzY0L3J0YXMvZXJyb3JfbG9nIiwgRUlOVkFMfSwNCi0tIA0KMi4z
MC4wDQogDQo=

------=_001_NextPart854244420364_=----
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dus-ascii"><style>body { line-height: 1.5; }blockquote { margin-top: 0p=
x; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-f=
amily: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</sty=
le></head><body>=0A<div><span></span>Thanks for your rewritten!</div>=0A<b=
lockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em=
; margin-Right: inherit"><div>&nbsp;</div><div style=3D"border:none;border=
-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-=
RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#0=
00000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b=
>From:</b>&nbsp;<a href=3D"mailto:pvorel@suse.cz">Petr Vorel</a></div><div=
><b>Date:</b>&nbsp;2021-01-19&nbsp;20:33</div><div><b>To:</b>&nbsp;<a href=
=3D"mailto:ltp@lists.linux.it">ltp</a></div><div><b>CC:</b>&nbsp;<a href=
=3D"mailto:liuxp11@chinatelecom.cn">Xinpeng Liu</a>; <a href=3D"mailto:chr=
ubis@suse.cz">Cyril Hrubis</a>; <a href=3D"mailto:joerg.vehlow@aox-tech.de=
">Joerg Vehlow</a>; <a href=3D"mailto:jstancek@redhat.com">Jan Stancek</a>=
; <a href=3D"mailto:pvorel@suse.cz">Petr Vorel</a></div><div><b>Subject:</=
b>&nbsp;[PATCH v2 1/1] fs/proc01.c: Whitelist attr and task files for appa=
rmor and smack</div></div></div><div><div>From: Xinpeng Liu &lt;liuxp11@ch=
inatelecom.cn&gt;</div>=0A<div>&nbsp;</div>=0A<div>We are already whitelis=
ting LSM files (/proc/self/attr/* and</div>=0A<div>/proc/self/task/[0-9]*/=
attr/*) since 2009. That's probably due the</div>=0A<div>default value for=
 {g,s}etprocattr LSM_HOOK is -EINVAL when LSM module</div>=0A<div>not enab=
led.</div>=0A<div>&nbsp;</div>=0A<div>Both AppArmor and SMACK allow to rea=
d only</div>=0A<div>/proc/self/attr/apparmor/current, the rest return EINV=
AL.</div>=0A<div>&nbsp;</div>=0A<div>While reading /proc/self/attr/apparmo=
r/current (for AppArmor) and</div>=0A<div>/proc/self/attr/current (for bot=
h AppArmor and SELinux) mostly work</div>=0A<div>(e.g. value contains unco=
nfined), in some cases it's not working (e.g.</div>=0A<div>AppArmor module=
 loaded, but filesystem is not mounted). Thus keep it</div>=0A<div>also di=
sabled.</div>=0A<div>&nbsp;</div>=0A<div>Ubuntu 20.10 (AppArmor and SMACK =
enabled):</div>=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&=
nbsp; :&nbsp; proc01.c:396: read failed: /proc/self/task/61595/attr/smack/=
current: errno=3DEINVAL(22): Invalid argument</div>=0A<div>proc01&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 2&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read faile=
d: /proc/self/task/61595/attr/apparmor/prev: errno=3DEINVAL(22): Invalid a=
rgument</div>=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; TFAIL&nb=
sp; :&nbsp; proc01.c:396: read failed: /proc/self/task/61595/attr/apparmor=
/exec: errno=3DEINVAL(22): Invalid argument</div>=0A<div>proc01&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 4&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:=
 /proc/self/attr/smack/current: errno=3DEINVAL(22): Invalid argument</div>=
=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; TFAIL&nbsp; :&nbsp; p=
roc01.c:396: read failed: /proc/self/attr/apparmor/prev: errno=3DEINVAL(22=
): Invalid argument</div>=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nb=
sp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed: /proc/self/attr/apparmo=
r/exec: errno=3DEINVAL(22): Invalid argument</div>=0A<div>&nbsp;</div>=0A<=
div>openSUSE (kernel 5.10.7, AppArmor enabled):</div>=0A<div>proc01&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read fai=
led: /proc/self/task/6367/attr/apparmor/prev: errno=3DEINVAL(22): Invalid =
argument</div>=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; TFAIL&n=
bsp; :&nbsp; proc01.c:396: read failed: /proc/self/task/6367/attr/apparmor=
/exec: errno=3DEINVAL(22): Invalid argument</div>=0A<div>proc01&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 3&nbsp; TFAIL&nbsp; :&nbsp; proc01.c:396: read failed:=
 /proc/self/attr/apparmor/prev: errno=3DEINVAL(22): Invalid argument</div>=
=0A<div>proc01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; TFAIL&nbsp; :&nbsp; p=
roc01.c:396: read failed: /proc/self/attr/apparmor/exec: errno=3DEINVAL(22=
): Invalid argument</div>=0A<div>&nbsp;</div>=0A<div>+ While at it, fix a =
comparison warning.</div>=0A<div>&nbsp;</div>=0A<div>Reviewed-by: Joerg Ve=
hlow &lt;joerg.vehlow@aox-tech.de&gt;</div>=0A<div>Reviewed-by: Jan Stance=
k &lt;jstancek@redhat.com&gt;</div>=0A<div>Reviewed-by: Petr Vorel &lt;pvo=
rel@suse.cz&gt;</div>=0A<div>Signed-off-by: Xinpeng Liu &lt;liuxp11@chinat=
elecom.cn&gt;</div>=0A<div>[ pvorel: rewritten commit message ]</div>=0A<d=
iv>Signed-off-by: Petr Vorel &lt;pvorel@suse.cz&gt;</div>=0A<div>---</div>=
=0A<div>Hi Liu, Jan,</div>=0A<div>&nbsp;</div>=0A<div>as we agreed with Cy=
ril that this is a valid fix, I dared to do the</div>=0A<div>investigation=
 and send v2 with improved commit message.</div>=0A<div>&nbsp;</div>=0A<di=
v>Kind regards,</div>=0A<div>Petr</div>=0A<div>&nbsp;</div>=0A<div> testca=
ses/kernel/fs/proc/proc01.c | 6 +++++-</div>=0A<div> 1 file changed, 5 ins=
ertions(+), 1 deletion(-)</div>=0A<div>&nbsp;</div>=0A<div>diff --git a/te=
stcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c</div>=
=0A<div>index 96843695c..96441d153 100644</div>=0A<div>--- a/testcases/ker=
nel/fs/proc/proc01.c</div>=0A<div>+++ b/testcases/kernel/fs/proc/proc01.c<=
/div>=0A<div>@@ -63,7 +63,7 @@ static char *opt_maxmbytesstr;</div>=0A<div=
> static char *procpath =3D "/proc";</div>=0A<div> static const char selfp=
ath[] =3D "/proc/self";</div>=0A<div> size_t buffsize =3D 1024;</div>=0A<d=
iv>-static long long maxbytes;</div>=0A<div>+static unsigned long long max=
bytes;</div>=0A<div> </div>=0A<div> unsigned long long total_read;</div>=
=0A<div> unsigned int total_obj;</div>=0A<div>@@ -97,7 +97,11 @@ static co=
nst struct mapping known_issues[] =3D {</div>=0A<div> 	{"read", "/proc/sel=
f/mem", EIO},</div>=0A<div> 	{"read", "/proc/self/task/[0-9]*/mem", EIO},<=
/div>=0A<div> 	{"read", "/proc/self/attr/*", EINVAL},</div>=0A<div>+	{"rea=
d", "/proc/self/attr/smack/*", EINVAL},</div>=0A<div>+	{"read", "/proc/sel=
f/attr/apparmor/*", EINVAL},</div>=0A<div> 	{"read", "/proc/self/task/[0-9=
]*/attr/*", EINVAL},</div>=0A<div>+	{"read", "/proc/self/task/[0-9]*/attr/=
smack/*", EINVAL},</div>=0A<div>+	{"read", "/proc/self/task/[0-9]*/attr/ap=
parmor/*", EINVAL},</div>=0A<div> 	{"read", "/proc/self/ns/*", EINVAL},</d=
iv>=0A<div> 	{"read", "/proc/self/task/[0-9]*/ns/*", EINVAL},</div>=0A<div=
> 	{"read", "/proc/ppc64/rtas/error_log", EINVAL},</div>=0A<div>-- </div>=
=0A<div>2.30.0</div>=0A<div>&nbsp;</div>=0A</div></blockquote>=0A</body></=
html>
------=_001_NextPart854244420364_=------


--===============0936164071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0936164071==--

