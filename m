Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D0A30561C
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:49:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E423C5E98
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:49:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5E8E43C0194
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:49:45 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0592F200B65
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:49:42 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:36708.401442939
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-9679eee6b17d4f01a554060f00a3dada
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 1F6E82800A7;
 Wed, 27 Jan 2021 16:49:37 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 9679eee6b17d4f01a554060f00a3dada for
 liwang@redhat.com; Wed Jan 27 16:49:40 2021
X-Transaction-ID: 9679eee6b17d4f01a554060f00a3dada
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 16:49:22 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Li Wang" <liwang@redhat.com>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>, 
 <2021012714540739834212@chinatelecom.cn>, 
 <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
X-Priority: 3
X-GUID: 81F07EC7-C517-42CB-81C9-3FC7A0BF2CA4
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012716492236006117@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
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
Content-Type: multipart/mixed; boundary="===============1531690321=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1531690321==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart158480771027_=----"

This is a multi-part message in MIME format.

------=_001_NextPart158480771027_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SW4gdGhpcyB0ZXN0Y2FzZSx3ZSBmaXJzdCBjaGVjayBNZW1BdmFpbGFibGUuIElmIE1lbUF2YWls
YWJsZSBkb2Vzbid0IGV4aXN0LHRoZW4gdXNlIGluZm8uZnJlZXJhbS4NCk1heWJlIG5vdCBvdGhl
ciBjYXNlcyBuZWVkIGRvIHRoZXNlLg0KDQogRnJvbTogTGkgV2FuZw0KRGF0ZTogMjAyMS0wMS0y
NyAxNTo1OA0KVG86IGxpdXhwMTFAY2hpbmF0ZWxlY29tLmNuDQpDQzogbHRwDQpTdWJqZWN0OiBS
ZTogUmU6IFtMVFBdIFtQQVRDSCAxLzJdIHN5c2NhbGxzL2lvY3RsOiBpb2N0bF9zZzAxLmM6IGlv
Y3RsX3NnMDEgaW52b2tlZCBvb20ta2lsbGVyDQpIaSBYaW5wZW5nLA0KDQpJIHNlbnQgdG8geW91
IHRoZSBjYXNlIHN3YXBwaW5nMDEgc29sdmluZyB0aGlzKHZpYSBGSUxFX0xJTkVTX1NDQU5GKSBh
bHJlYWR5LCBmZWVsIGZyZWUgdG8gdGFrZSBhbiByZWZlcmVuY2U6DQpodHRwczovL2dpdGh1Yi5j
b20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL21l
bS9zd2FwcGluZy9zd2FwcGluZzAxLmMjTDg1DQoNCk9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDI6
NTQgUE0gbGl1eHAxMUBjaGluYXRlbGVjb20uY24gPGxpdXhwMTFAY2hpbmF0ZWxlY29tLmNuPiB3
cm90ZToNCkhpIExpLCANCkhhdmUgYSBxdWVzdGlvbiBhYm91dCB1c2luZyBtYWNybyBTQUZFX1JF
QURfTUVNSU5GTyBnZXQgTWVtQXZhaWxhYmxlIHZhbHVlLA0KU29tZSBvbGQga2VybmVscyBtYXli
ZSBub3QgcHJpdm9kZSAiTWVtQXZhaWxhYmxlIiBmaWVsZCwgd2hpY2ggd2lsbCBicm9rZW4uDQoN
CiANCkZyb206IExpIFdhbmcNCkRhdGU6IDIwMjEtMDEtMjcgMTI6MjcNClRvOiBYaW5wZW5nIExp
dQ0KQ0M6IExUUCBMaXN0DQpTdWJqZWN0OiBSZTogW0xUUF0gW1BBVENIIDEvMl0gc3lzY2FsbHMv
aW9jdGw6IGlvY3RsX3NnMDEuYzogaW9jdGxfc2cwMSBpbnZva2VkIG9vbS1raWxsZXINCkhpIFhp
bnBlbmcsDQoNCk9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDExOjI4IEFNIFhpbnBlbmcgTGl1IDxs
aXV4cDExQGNoaW5hdGVsZWNvbS5jbj4gd3JvdGU6DQpLZXJuZWwgdmVyc2lvbiBpcyA1LjQuODEr
LHRoZSBhdmFpbGFibGUgUkFNIGlzIGxlc3MgdGhhbiBmcmVlLGFzIGZvbGxvdzoNCltyb290QGxp
dXhwIG15d29ya10jIGhlYWQgL3Byb2MvbWVtaW5mbw0KTWVtVG90YWw6ICAgICAgIDE5ODEwMTc0
NCBrQg0KTWVtRnJlZTogICAgICAgIDE4OTMwMzE0OCBrQg0KTWVtQXZhaWxhYmxlOiAgIDE4ODU2
NjczMiBrQg0KDQpTbyB1c2UgYXZhaWxhYmxlIFJBTSB0byBhdm9pZCBPT00ga2lsbGVyLg0KDQpT
aWduZWQtb2ZmLWJ5OiBYaW5wZW5nIExpdSA8bGl1eHAxMUBjaGluYXRlbGVjb20uY24+DQotLS0N
CiBsaWIvdHN0X21lbXV0aWxzLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvbGliL3RzdF9tZW11dGlscy5jIGIvbGliL3RzdF9tZW11dGlscy5jDQppbmRleCBk
ZDA5ZGI0Li4yMWRmOWE4IDEwMDY0NA0KLS0tIGEvbGliL3RzdF9tZW11dGlscy5jDQorKysgYi9s
aWIvdHN0X21lbXV0aWxzLmMNCkBAIC0xMCwxNCArMTAsMzMgQEANCg0KICNkZWZpbmUgVFNUX05P
X0RFRkFVTFRfTUFJTg0KICNpbmNsdWRlICJ0c3RfdGVzdC5oIg0KKyNpbmNsdWRlICJ0c3Rfc2Fm
ZV9zdGRpby5oIg0KDQogI2RlZmluZSBCTE9DS1NJWkUgKDE2ICogMTAyNCAqIDEwMjQpDQoNCitz
dGF0aWMgdW5zaWduZWQgbG9uZyBnZXRfYXZhaWxhYmxlX3JhbSh2b2lkKQ0KK3sNCisgICAgICAg
Y2hhciBidWZbNjBdOyAvKiBhY3R1YWwgbGluZXMgd2UgZXhwZWN0IGFyZSB+MzAgY2hhcnMgb3Ig
bGVzcyAqLw0KKyAgICAgICB1bnNpZ25lZCBsb25nIGF2YWlsYWJsZV9rYiA9IDA7DQorICAgICAg
IEZJTEUgKmZwOw0KKw0KKyAgICAgICBmcCA9IFNBRkVfRk9QRU4oIi9wcm9jL21lbWluZm8iLCJy
Iik7DQorICAgICAgIHdoaWxlIChmZ2V0cyhidWYsIHNpemVvZihidWYpLCBmcCkpIHsNCisgICAg
ICAgICAgICAgICBpZiAoc3NjYW5mKGJ1ZiwgIk1lbUF2YWlsYWJsZTogJWx1ICUqc1xuIiwgJmF2
YWlsYWJsZV9rYikgPT0gMSl7DQorICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCisgICAg
ICAgICAgICAgICB9DQorICAgICAgIH0NCisgICAgICAgU0FGRV9GQ0xPU0UoZnApOw0KKw0KKyAg
ICAgICByZXR1cm4gMTAyNCAqIGF2YWlsYWJsZV9rYjsNCit9DQorDQogdm9pZCB0c3RfcG9sbHV0
ZV9tZW1vcnkoc2l6ZV90IG1heHNpemUsIGludCBmaWxsY2hhcikNCiB7DQogICAgICAgIHNpemVf
dCBpLCBtYXBfY291bnQgPSAwLCBzYWZldHkgPSAwLCBibG9ja3NpemUgPSBCTE9DS1NJWkU7DQog
ICAgICAgIHZvaWQgKiptYXBfYmxvY2tzOw0KICAgICAgICBzdHJ1Y3Qgc3lzaW5mbyBpbmZvOw0K
KyAgICAgICB1bnNpZ25lZCBsb25nIGF2YWlsYWJsZV9yYW0gPSBnZXRfYXZhaWxhYmxlX3JhbSgp
Ow0KDQpMVFAgcHJvdmlkZXMgU0FGRV9SRUFEX01FTUlORk8oKSBtYWNybyB0byBiZSB1c2VkIGlu
IC9wcm9jL21lbWluZm8gcmVhZGluZy4NClNlZTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc3dhcHBpbmcv
c3dhcHBpbmcwMS5jI0w4NQ0KDQogDQoNCiAgICAgICAgU0FGRV9TWVNJTkZPKCZpbmZvKTsNCiAg
ICAgICAgc2FmZXR5ID0gTUFYKDQwOTYgKiBTQUZFX1NZU0NPTkYoX1NDX1BBR0VTSVpFKSwgMTI4
ICogMTAyNCAqIDEwMjQpOw0KQEAgLTI2LDE1ICs0NSwxOSBAQCB2b2lkIHRzdF9wb2xsdXRlX21l
bW9yeShzaXplX3QgbWF4c2l6ZSwgaW50IGZpbGxjaGFyKQ0KICAgICAgICBpZiAoaW5mby5mcmVl
c3dhcCA+IHNhZmV0eSkNCiAgICAgICAgICAgICAgICBzYWZldHkgPSAwOw0KDQorICAgICAgIC8q
Ik1lbUF2YWlsYWJsZSIgZmllbGQgbWF5YmUgbm90IGV4aXN0LCBvciBmcmVlcmFtIGxlc3MgdGhh
biBhdmFpbGFibGVfcmFtKi8NCisgICAgICAgaWYoYXZhaWxhYmxlX3JhbSA9PSAwIHx8IGluZm8u
ZnJlZXJhbSA8IGF2YWlsYWJsZV9yYW0pDQorICAgICAgICAgICAgICAgYXZhaWxhYmxlX3JhbSA9
IGluZm8uZnJlZXJhbTsNCisNCiAgICAgICAgLyogTm90IGVub3VnaCBmcmVlIG1lbW9yeSB0byBh
dm9pZCBpbnZva2luZyBPT00ga2lsbGVyICovDQotICAgICAgIGlmIChpbmZvLmZyZWVyYW0gPD0g
c2FmZXR5KQ0KKyAgICAgICBpZiAoYXZhaWxhYmxlX3JhbSA8PSBzYWZldHkpDQogICAgICAgICAg
ICAgICAgcmV0dXJuOw0KDQogICAgICAgIGlmICghbWF4c2l6ZSkNCiAgICAgICAgICAgICAgICBt
YXhzaXplID0gU0laRV9NQVg7DQoNCi0gICAgICAgaWYgKGluZm8uZnJlZXJhbSAtIHNhZmV0eSA8
IG1heHNpemUgLyBpbmZvLm1lbV91bml0KQ0KLSAgICAgICAgICAgICAgIG1heHNpemUgPSAoaW5m
by5mcmVlcmFtIC0gc2FmZXR5KSAqIGluZm8ubWVtX3VuaXQ7DQorICAgICAgIGlmIChhdmFpbGFi
bGVfcmFtIC0gc2FmZXR5IDwgbWF4c2l6ZSAvIGluZm8ubWVtX3VuaXQpDQorICAgICAgICAgICAg
ICAgbWF4c2l6ZSA9IChhdmFpbGFibGVfcmFtIC0gc2FmZXR5KSAqIGluZm8ubWVtX3VuaXQ7DQoN
CiAgICAgICAgYmxvY2tzaXplID0gTUlOKG1heHNpemUsIGJsb2Nrc2l6ZSk7DQogICAgICAgIG1h
cF9jb3VudCA9IG1heHNpemUgLyBibG9ja3NpemU7DQotLSANCjEuOC4zLjENCg0KDQotLSANCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cA0KDQoN
Cg0KLS0gDQpSZWdhcmRzLA0KTGkgV2FuZw0KDQoNCi0tIA0KUmVnYXJkcywNCkxpIFdhbmcNCg==

------=_001_NextPart158480771027_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210127164424508753 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></span>In thi=
s testcase,we first check&nbsp;<span style=3D"line-height: 1.5; background=
-color: transparent;">MemAvailable. If&nbsp;</span><span style=3D"line-hei=
ght: 1.5; background-color: transparent;">MemAvailable doesn't exist,then =
use&nbsp;</span><span style=3D"line-height: 1.5; background-color: transpa=
rent;">info.freeram.</span></div><div>Maybe not other cases need do these.=
</div><div><br></div><blockquote style=3D"margin-Top: 0px; margin-Bottom: =
0px; margin-Left: 0.5em; margin-Right: inherit"><div style=3D"border:none;=
border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PA=
DDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;CO=
LOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><=
div><b>&nbsp;From:</b>&nbsp;<a href=3D"mailto:liwang@redhat.com">Li Wang</=
a></div><div><b>Date:</b>&nbsp;2021-01-27&nbsp;15:58</div><div><b>To:</b>&=
nbsp;<a href=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a=
></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp@lists.linux.it">ltp</a><=
/div><div><b>Subject:</b>&nbsp;Re: Re: [LTP] [PATCH 1/2] syscalls/ioctl: i=
octl_sg01.c: ioctl_sg01 invoked oom-killer</div></div></div><div><div clas=
s=3D"FoxDiv20210127164424508753"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Hi Xinpeng,</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"">I sent to you the case swapping01 solving this(via FILE_LINES_SCANF)=
 already, feel free to take an reference:</div><div class=3D"gmail_default=
" style=3D""><a href=3D"https://github.com/linux-test-project/ltp/blob/mas=
ter/testcases/kernel/mem/swapping/swapping01.c#L85" style=3D"font-size:sma=
ll">https://github.com/linux-test-project/ltp/blob/master/testcases/kernel=
/mem/swapping/swapping01.c#L85</a><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 2:54 =
PM <a href=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a> =
&lt;<a href=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv>=0A<div><span></span>Hi Li,&nbsp;</div><div>Have a question about using=
 macro&nbsp;<span style=3D"font-size:small;line-height:19.5px;background-c=
olor:transparent">SAFE_READ_MEMINFO get&nbsp;</span><span style=3D"line-he=
ight:1.5;background-color:transparent">MemAvailable value,</span></div><di=
v>Some old kernels maybe not privode "<span style=3D"line-height:1.5;backg=
round-color:transparent">MemAvailable</span><span style=3D"line-height:1.5=
;background-color:transparent">" field, which will broken.</span></div><di=
v><span style=3D"line-height:1.5;background-color:transparent"><br></span>=
</div>=0A<blockquote style=3D"margin-top:0px;margin-bottom:0px;margin-left=
:0.5em;margin-right:inherit"><div>&nbsp;</div><div style=3D"border-right:n=
one;border-bottom:none;border-left:none;border-top:1pt solid rgb(181,196,2=
23);padding:3pt 0cm 0cm"><div style=3D"padding:8px;font-size:12px;font-fam=
ily:tahoma;color:rgb(0,0,0);background:rgb(239,239,239)"><div><b>From:</b>=
&nbsp;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">Li Wang</a></=
div><div><b>Date:</b>&nbsp;2021-01-27&nbsp;12:27</div><div><b>To:</b>&nbsp=
;<a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">Xinpeng Liu<=
/a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:ltp@lists.linux.it" target=
=3D"_blank">LTP List</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [PATCH 1=
/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div></div=
></div><div><div class=3D"gmail-m_3715482154841094765FoxDiv202101271449171=
22140"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" styl=
e=3D"font-size:small">Hi Xinpeng,</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 11:28 AM X=
inpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank=
">liuxp11@chinatelecom.cn</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Kernel version is 5.4.81+,the available RAM is =
less than free,as follow:<br>=0A[root@liuxp mywork]# head /proc/meminfo<br=
>=0AMemTotal:&nbsp; &nbsp; &nbsp; &nbsp;198101744 kB<br>=0AMemFree:&nbsp; =
&nbsp; &nbsp; &nbsp; 189303148 kB<br>=0AMemAvailable:&nbsp; &nbsp;18856673=
2 kB<br>=0A<br>=0ASo use available RAM to avoid OOM killer.<br>=0A<br>=0AS=
igned-off-by: Xinpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" t=
arget=3D"_blank">liuxp11@chinatelecom.cn</a>&gt;<br>=0A---<br>=0A&nbsp;lib=
/tst_memutils.c | 29 ++++++++++++++++++++++++++---<br>=0A&nbsp;1 file chan=
ged, 26 insertions(+), 3 deletions(-)<br>=0A<br>=0Adiff --git a/lib/tst_me=
mutils.c b/lib/tst_memutils.c<br>=0Aindex dd09db4..21df9a8 100644<br>=0A--=
- a/lib/tst_memutils.c<br>=0A+++ b/lib/tst_memutils.c<br>=0A@@ -10,14 +10,=
33 @@<br>=0A<br>=0A&nbsp;#define TST_NO_DEFAULT_MAIN<br>=0A&nbsp;#include =
"tst_test.h"<br>=0A+#include "tst_safe_stdio.h"<br>=0A<br>=0A&nbsp;#define=
 BLOCKSIZE (16 * 1024 * 1024)<br>=0A<br>=0A+static unsigned long get_avail=
able_ram(void)<br>=0A+{<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;char buf[60]; /*=
 actual lines we expect are ~30 chars or less */<br>=0A+&nbsp; &nbsp; &nbs=
p; &nbsp;unsigned long available_kb =3D 0;<br>=0A+&nbsp; &nbsp; &nbsp; &nb=
sp;FILE *fp;<br>=0A+<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;fp =3D SAFE_FOPEN("=
/proc/meminfo","r");<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;while (fgets(buf, s=
izeof(buf), fp)) {<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;if (sscanf(buf, "MemAvailable: %lu %*s\n", &amp;available_kb) =3D=
=3D 1){<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;break;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;}<br>=0A+&nbsp; &nb=
sp; &nbsp; &nbsp;SAFE_FCLOSE(fp);<br>=0A+<br>=0A+&nbsp; &nbsp; &nbsp; &nbs=
p;return 1024 * available_kb;<br>=0A+}<br>=0A+<br>=0A&nbsp;void tst_pollut=
e_memory(size_t maxsize, int fillchar)<br>=0A&nbsp;{<br>=0A&nbsp; &nbsp; &=
nbsp; &nbsp; size_t i, map_count =3D 0, safety =3D 0, blocksize =3D BLOCKS=
IZE;<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; void **map_blocks;<br>=0A&nbsp; &nb=
sp; &nbsp; &nbsp; struct sysinfo info;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;u=
nsigned long available_ram =3D get_available_ram();<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">LTP p=
rovides SAFE_READ_MEMINFO() macro to be used in /proc/meminfo reading.</di=
v><div class=3D"gmail_default" style=3D"font-size:small">See: <a href=3D"h=
ttps://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/=
swapping/swapping01.c#L85" target=3D"_blank">https://github.com/linux-test=
-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85</a=
></div><br></div><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">=0A<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; SAFE_SYSINFO(&amp;info);=
<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; safety =3D MAX(4096 * SAFE_SYSCONF(_SC_=
PAGESIZE), 128 * 1024 * 1024);<br>=0A@@ -26,15 +45,19 @@ void tst_pollute_=
memory(size_t maxsize, int fillchar)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; if =
(info.freeswap &gt; safety)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; safety =3D 0;<br>=0A<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;/*"=
MemAvailable" field maybe not exist, or freeram less than available_ram*/<=
br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if(available_ram =3D=3D 0 || info.freera=
m &lt; available_ram)<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;available_ram =3D info.freeram;<br>=0A+<br>=0A&nbsp; &nbsp; &nbs=
p; &nbsp; /* Not enough free memory to avoid invoking OOM killer */<br>=0A=
-&nbsp; &nbsp; &nbsp; &nbsp;if (info.freeram &lt;=3D safety)<br>=0A+&nbsp;=
 &nbsp; &nbsp; &nbsp;if (available_ram &lt;=3D safety)<br>=0A&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>=0A<br>=0A&nbsp; &nb=
sp; &nbsp; &nbsp; if (!maxsize)<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; maxsize =3D SIZE_MAX;<br>=0A<br>=0A-&nbsp; &nbsp; &nbs=
p; &nbsp;if (info.freeram - safety &lt; maxsize / info.mem_unit)<br>=0A-&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxsize =3D (info.fre=
eram - safety) * info.mem_unit;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;if (avai=
lable_ram - safety &lt; maxsize / info.mem_unit)<br>=0A+&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;maxsize =3D (available_ram - safety) =
* info.mem_unit;<br>=0A<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; blocksize =3D MI=
N(maxsize, blocksize);<br>=0A&nbsp; &nbsp; &nbsp; &nbsp; map_count =3D max=
size / blocksize;<br>=0A-- <br>=0A1.8.3.1<br>=0A<br>=0A<br>=0A-- <br>=0AMa=
iling list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"no=
referrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>=0A=
<br>=0A</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>=0A</div></div></blockquote>=0A</div></blockquote></div><br=
 clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div>=0A</div></div></blockquote>=0A</body></html>
------=_001_NextPart158480771027_=------


--===============1531690321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1531690321==--

