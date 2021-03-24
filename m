Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2A347492
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:27:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAE5F3C9495
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:27:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 176923C94A2
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:27:07 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.220])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2E7FC1A01068
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:27:04 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:46013.1485671434
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-677f4347c4384dad941489a62dbc09aa
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id D1598280097;
 Wed, 24 Mar 2021 17:27:03 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 677f4347c4384dad941489a62dbc09aa for
 liwang@redhat.com; Wed Mar 24 17:27:05 2021
X-Transaction-ID: 677f4347c4384dad941489a62dbc09aa
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 24 Mar 2021 17:26:59 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Li Wang" <liwang@redhat.com>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>, 
 <2021012718043566596022@chinatelecom.cn>, 
 <CAEemH2dA0T1F3wsdwtG2hsfDUUJsY8gFeTLTHyGz+pu034gH4g@mail.gmail.com>, 
 <202103051352110688245@chinatelecom.cn>, 
 <CAEemH2cW9djj3sN8j9Xj_A5iNB9DLhYYkK=nu8ypaOtiYMnLyw@mail.gmail.com>
X-Priority: 3
X-GUID: CFFDE2A8-F09D-465C-BB79-5C4C500135B0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202103241726592002447@chinatelecom.cn>
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
Content-Type: multipart/mixed; boundary="===============0743489834=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============0743489834==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart380552283478_=----"

This is a multi-part message in MIME format.

------=_001_NextPart380552283478_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTGkgV2FuZywNCkkgdGhpbmsgeW91ciBwYXRjaCBpcyBnb29kLg0KMS5Db21taXRMaW1pdCBp
cyB0aGUgbWVtb3J5IHRoYXQgY2FuIGJlIGFsbG9jYXRlZCBieSBhcHBsaWNhdGlvbi4NCjIuaW9j
dGxfc2cwMSBpbiBzZXJ2ZXJhbCBtYWNoaW5lcyB3aXRoIHlvdXIgcGF0Y2gsdGhlIHJlc3VsdCBp
cyBwYXNzZWQuDQoNClRoYW5rcyENCiAgICANCkZyb206IExpIFdhbmcNCkRhdGU6IDIwMjEtMDMt
MDUgMTc6MDINClRvOiBsaXV4cDExQGNoaW5hdGVsZWNvbS5jbg0KQ0M6IEN5cmlsIEhydWJpczsg
bHRwOyBtZG91Y2hhDQpTdWJqZWN0OiBSZTogUmU6IFtMVFBdIFtQQVRDSCAxLzJdIHN5c2NhbGxz
L2lvY3RsOiBpb2N0bF9zZzAxLmM6IGlvY3RsX3NnMDEgaW52b2tlZCBvb20ta2lsbGVyDQpIaSBY
aW5wZW5nLA0KDQpPbiBGcmksIE1hciA1LCAyMDIxIGF0IDE6NTIgUE0gbGl1eHAxMUBjaGluYXRl
bGVjb20uY24gPGxpdXhwMTFAY2hpbmF0ZWxlY29tLmNuPiB3cm90ZToNCi0tLSBhL2xpYi90c3Rf
bWVtdXRpbHMuYw0KKysrIGIvbGliL3RzdF9tZW11dGlscy5jDQpAQCAtMzYsNiArMzYsMTMgQEAg
dm9pZCB0c3RfcG9sbHV0ZV9tZW1vcnkoc2l6ZV90IG1heHNpemUsIGludCBmaWxsY2hhcikNCiAg
ICAgICAgaWYgKGluZm8uZnJlZXJhbSAtIHNhZmV0eSA8IG1heHNpemUgLyBpbmZvLm1lbV91bml0
KQ0KICAgICAgICAgICAgICAgIG1heHNpemUgPSAoaW5mby5mcmVlcmFtIC0gc2FmZXR5KSAqIGlu
Zm8ubWVtX3VuaXQ7DQoNCiA9PT5UaGFua3MsYnV0IHRoZSBtYXhzaXplIG9yaWdpbmFsIGNvZGUg
bmVlZCB0byBiZSBkZWxldGVkLFJpZ2h0Pw0KDQpObywgdGhlIG1heHNpemUgY29kZSBpcyBhbHNv
IHVzZWZ1bCwgaXQgbmVlZHMgdG8gZGVmaW5lIHRoZSB2YWx1ZSBpbg0KbW9zdCBjb21tb24gc2l0
dWF0aW9ucyhpLmUuIENvbW1pdExpbWl0ID4gTWVtQXZhaWxhYmxlKS4NCg0KQnV0IEknbSBzdGls
bCBoZXNpdGF0aW5nIHRvIHVzZSBDb21pdExpbWl0IGFzIHRoZSB0aHJlc2hvbGQgZm9yICdtYXhz
aXplJy4NCkJlY2F1c2UgYWNjb3JkaW5nIHRvIHRoZSBMaW51eCBkb2N1bWVudCwgaXQgc2F5cyB0
aGF0IG9ubHkgdGFrZSBlZmZvcnQNCndoZW4gb3ZlcmNvbW1pdF9tZW1vcnkgaXMgc2V0dGluZyB0
byAyLiBCdXQgb3VyIHRlc3Qgc3lzdGVtIGFsbCBzZXQgMA0KYnkgZGVmYXVsdC4NCg0KICAgIlRo
aXMgbGltaXQgaXMgb25seSBhZGhlcmVkIHRvIGlmIHN0cmljdCBvdmVyY29tbWl0IGFjY291bnRp
bmcgaXMgZW5hYmxlZA0KICAgIChtb2RlIDIgaW4gJ3ZtLm92ZXJjb21taXRfbWVtb3J5JykuIg0K
ICAgIHNlZTogaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL0Rv
Y3VtZW50YXRpb24vZmlsZXN5c3RlbXMvcHJvYy5yc3QNCg0KU2VlbXMgdG8gdXNlIENvbW1pdExp
bWl0IGxvb2tzIGEgYml0IHN0cmljdCBhbmQgc3RyYW5nZSB0byB0ZXN0Lg0KDQpBbmQgSSBldmVu
IHRoaW5rIHRoZSB3YXkgdG8gdXNlIE1lbUF2YWlsYWJsZSBpcyBhY2NlcHRhYmxlIGlmDQpNZW1G
cmVlID4gTWVtQXZhaWxhYmxlLCBqdXN0IGxpa2Ugd2hhdCB5b3UgZGlkIGluIHlvdXIgbGFzdCBw
YXRjaC4NCg0KSSdtIHN0aWxsIG5vdCB2ZXJ5IHN1cmUgc28gZmFyfg0KKEJ1dCBvbmUgdGhpbmcg
SSBjYW4gY29uZmlybSB0aGF0IE1lbUF2YWlsYWJsZSA8IE1lbUZyZWUgaXMgY29ycmVjdCBiZWhh
dmlvciBzb21ldGltZXMpDQoNCiANCg0KKyAgICAgICAvKg0KKyAgICAgICAgKiBUbyByZXNwZWN0
IENvbW1pdExpbWl0IHRvIHByZXZlbnQgdGVzdCBpbnZva2luZyBPT00ga2lsbGVyLA0KKyAgICAg
ICAgKiB0aGlzIG1heSBhcHBlYXIgb24gc3lzdGVtIHdpdGggYSBzbWFsbGVyIHN3YXAtZGlzayAo
b3IgZGlzYWJsZWQpLg0KKyAgICAgICAgKi8NCisgICAgICAgaWYgKFNBRkVfUkVBRF9NRU1JTkZP
KCJDb21taXRMaW1pdDoiKSA8IFNBRkVfUkVBRF9NRU1JTkZPKCJNZW1BdmFpbGFibGU6IikpDQor
ICAgICAgICAgICAgICAgbWF4c2l6ZSA9IFNBRkVfUkVBRF9NRU1JTkZPKCJDb21taXRMaW1pdDoi
KSAqIDEwMjQgLSAoc2FmZXR5ICogaW5mby5tZW1fdW5pdCk7DQorDQogICAgICAgIGJsb2Nrc2l6
ZSA9IE1JTihtYXhzaXplLCBibG9ja3NpemUpOw0KICAgICAgICBtYXBfY291bnQgPSBtYXhzaXpl
IC8gYmxvY2tzaXplOw0KICAgICAgICBtYXBfYmxvY2tzID0gU0FGRV9NQUxMT0MobWFwX2NvdW50
ICogc2l6ZW9mKHZvaWQgKikpOw0KIA0KDQotLSANClJlZ2FyZHMsDQpMaSBXYW5nDQo=

------=_001_NextPart380552283478_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210324172018095240 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></span></div>=
<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5=
em; margin-Right: inherit"><div>Hi Li Wang,</div><div>I think your patch i=
s good.</div><div><span style=3D"font-size: small; line-height: 19.5px; ba=
ckground-color: transparent;">1.CommitLimit is the memory that can be allo=
cated by application.</span></div><div><span style=3D"font-size: small; li=
ne-height: 19.5px; background-color: transparent;">2.ioctl_sg01 in servera=
l machines with your patch,the result is passed.</span></div><div><span st=
yle=3D"font-size: small; line-height: 19.5px; background-color: transparen=
t;"><br></span></div><div><span style=3D"font-size: small; line-height: 19=
.5px; background-color: transparent;">Thanks!</span></div><div><span style=
=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nbsp; &nbsp=
;&nbsp;</span></div><div style=3D"border:none;border-top:solid #B5C4DF 1.0=
pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LE=
FT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #ef=
efef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a hre=
f=3D"mailto:liwang@redhat.com">Li Wang</a></div><div><b>Date:</b>&nbsp;202=
1-03-05&nbsp;17:02</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chi=
natelecom.cn">liuxp11@chinatelecom.cn</a></div><div><b>CC:</b>&nbsp;<a hre=
f=3D"mailto:chrubis@suse.cz">Cyril Hrubis</a>; <a href=3D"mailto:ltp@lists=
.linux.it">ltp</a>; <a href=3D"mailto:mdoucha@suse.cz">mdoucha</a></div><d=
iv><b>Subject:</b>&nbsp;Re: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg=
01.c: ioctl_sg01 invoked oom-killer</div></div></div><div><div class=3D"Fo=
xDiv20210324172018095240"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"=
gmail_default" style=3D"font-size:small">Hi Xinpeng,</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 5, =
2021 at 1:52 PM <a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blan=
k">liuxp11@chinatelecom.cn</a> &lt;<a href=3D"mailto:liuxp11@chinatelecom.=
cn" target=3D"_blank">liuxp11@chinatelecom.cn</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div>=0A<div><span></span><=
div class=3D"gmail_quote"><span class=3D"gmail_default">--- a/lib/tst_memu=
tils.c<br>+++ b/lib/tst_memutils.c<br>@@ -36,6 +36,13 @@ void tst_pollute_=
memory(size_t maxsize, int fillchar)<br><strike>&nbsp; &nbsp; &nbsp; &nbsp=
; if (info.freeram - safety &lt; maxsize / info.mem_unit)<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; maxsize =3D (info.freeram - saf=
ety) * info.mem_unit;</strike><br><br></span></div><div class=3D"gmail_quo=
te"><span class=3D"gmail_default">&nbsp;=3D=3D&gt;Thanks,but the maxsize o=
riginal code need to be deleted,Right?<br></span></div></div></div></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">No, the maxsize code is also useful, it needs to define the value i=
n</div><div class=3D"gmail_default" style=3D"font-size:small">most common =
situations(i.e. CommitLimit &gt;&nbsp;MemAvailable).</div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">But I'm still hesita=
ting to use ComitLimit&nbsp;as the&nbsp;threshold for 'maxsize'.</div><div=
 class=3D"gmail_default" style=3D"font-size:small">Because according to th=
e Linux document, it says that only take effort</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">when overcommit_memory is setting to 2. =
But our test system all set 0</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">by default.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><span class=3D"gmail_default" style=3D"font-size:s=
mall">&nbsp; &nbsp;</span>"This limit is only adhered to if strict overcom=
mit accounting is enabled</div><div><span class=3D"gmail_default" style=3D=
"font-size:small">&nbsp; &nbsp; </span>(mode 2 in 'vm.overcommit_memory').=
"<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">&nb=
sp; &nbsp; see:<a href=3D"https://github.com/torvalds/linux/blob/master/Do=
cumentation/filesystems/proc.rst" target=3D"_blank"> https://github.com/to=
rvalds/linux/blob/master/Documentation/filesystems/proc.rst</a></div></div=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Seems to use CommitLimit looks a bit strict and strange to test.</div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">And I =
even think the way to use MemAvailable is acceptable if</div><div class=3D=
"gmail_default" style=3D"font-size:small">MemFree &gt; MemAvailable, just =
like what you did in your last patch.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I'm still not very sure so far~</div><div class=3D"gmail_default" style=
=3D"font-size:small">(But one thing I can confirm that MemAvailable &lt; M=
emFree is correct behavior sometimes)</div><br></div><div>&nbsp;</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div><div><div class=3D"gma=
il_quote"><span class=3D"gmail_default"><br></span></div><div class=3D"gma=
il_quote"><span class=3D"gmail_default">+ &nbsp; &nbsp; &nbsp; /*<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp;* To respect CommitLimit to prevent test invoking =
OOM killer,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;* this may appear on system wi=
th a smaller swap-disk (or disabled).<br>+ &nbsp; &nbsp; &nbsp; &nbsp;*/<b=
r>+ &nbsp; &nbsp; &nbsp; if (SAFE_READ_MEMINFO("CommitLimit:") &lt; SAFE_R=
EAD_MEMINFO("MemAvailable:"))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; maxsize =3D SAFE_READ_MEMINFO("CommitLimit:") * 1024 - (safety *=
 info.mem_unit);<br>+<br>&nbsp; &nbsp; &nbsp; &nbsp; blocksize =3D MIN(max=
size, blocksize);<br>&nbsp; &nbsp; &nbsp; &nbsp; map_count =3D maxsize / b=
locksize;<br>&nbsp; &nbsp; &nbsp; &nbsp; map_blocks =3D SAFE_MALLOC(map_co=
unt * sizeof(void *));</span></div></div></div></blockquote><div>&nbsp;</d=
iv></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>=0A</div></div></blo=
ckquote>=0A</body></html>
------=_001_NextPart380552283478_=------


--===============0743489834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0743489834==--

