Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6EF32E1E3
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 06:52:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64DA73C6562
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 06:52:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0FDFD3C4CEA
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 06:52:29 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 42B961A004A4
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 06:52:25 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:8140.1449630618
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-374c0213eab24f8b8e66e3f0eca69e35
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 8156728008E;
 Fri,  5 Mar 2021 13:52:18 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 374c0213eab24f8b8e66e3f0eca69e35 for
 liwang@redhat.com; Fri Mar  5 13:52:25 2021
X-Transaction-ID: 374c0213eab24f8b8e66e3f0eca69e35
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Date: Fri, 5 Mar 2021 13:52:15 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Li Wang" <liwang@redhat.com>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>, 
 <2021012718043566596022@chinatelecom.cn>, 
 <CAEemH2dA0T1F3wsdwtG2hsfDUUJsY8gFeTLTHyGz+pu034gH4g@mail.gmail.com>
X-Priority: 3
X-GUID: 25F5911C-5469-46CA-BDC0-65C1B2060EDC
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202103051352110688245@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
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
Content-Type: multipart/mixed; boundary="===============1571651059=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1571651059==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart680247663225_=----"

This is a multi-part message in MIME format.

------=_001_NextPart680247663225_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

LS0tIGEvbGliL3RzdF9tZW11dGlscy5jDQorKysgYi9saWIvdHN0X21lbXV0aWxzLmMNCkBAIC0z
Niw2ICszNiwxMyBAQCB2b2lkIHRzdF9wb2xsdXRlX21lbW9yeShzaXplX3QgbWF4c2l6ZSwgaW50
IGZpbGxjaGFyKQ0KICAgICAgICBpZiAoaW5mby5mcmVlcmFtIC0gc2FmZXR5IDwgbWF4c2l6ZSAv
IGluZm8ubWVtX3VuaXQpDQogICAgICAgICAgICAgICAgbWF4c2l6ZSA9IChpbmZvLmZyZWVyYW0g
LSBzYWZldHkpICogaW5mby5tZW1fdW5pdDsNCg0KID09PlRoYW5rcyxidXQgdGhlIG1heHNpemUg
b3JpZ2luYWwgY29kZSBuZWVkIHRvIGJlIGRlbGV0ZWQsUmlnaHQ/DQoNCisgICAgICAgLyoNCisg
ICAgICAgICogVG8gcmVzcGVjdCBDb21taXRMaW1pdCB0byBwcmV2ZW50IHRlc3QgaW52b2tpbmcg
T09NIGtpbGxlciwNCisgICAgICAgICogdGhpcyBtYXkgYXBwZWFyIG9uIHN5c3RlbSB3aXRoIGEg
c21hbGxlciBzd2FwLWRpc2sgKG9yIGRpc2FibGVkKS4NCisgICAgICAgICovDQorICAgICAgIGlm
IChTQUZFX1JFQURfTUVNSU5GTygiQ29tbWl0TGltaXQ6IikgPCBTQUZFX1JFQURfTUVNSU5GTygi
TWVtQXZhaWxhYmxlOiIpKQ0KKyAgICAgICAgICAgICAgIG1heHNpemUgPSBTQUZFX1JFQURfTUVN
SU5GTygiQ29tbWl0TGltaXQ6IikgKiAxMDI0IC0gKHNhZmV0eSAqIGluZm8ubWVtX3VuaXQpOw0K
Kw0KICAgICAgICBibG9ja3NpemUgPSBNSU4obWF4c2l6ZSwgYmxvY2tzaXplKTsNCiAgICAgICAg
bWFwX2NvdW50ID0gbWF4c2l6ZSAvIGJsb2Nrc2l6ZTsNCiAgICAgICAgbWFwX2Jsb2NrcyA9IFNB
RkVfTUFMTE9DKG1hcF9jb3VudCAqIHNpemVvZih2b2lkICopKTsNCg0KDQoNCg0KDQpUaGFua3Pv
vIENCiANCkZyb206IExpIFdhbmcNCkRhdGU6IDIwMjEtMDMtMDQgMTU6NTINClRvOiBsaXV4cDEx
QGNoaW5hdGVsZWNvbS5jbg0KQ0M6IEN5cmlsIEhydWJpczsgbHRwOyBNYXJ0aW4gRG91Y2hhDQpT
dWJqZWN0OiBSZTogW0xUUF0gW1BBVENIIDEvMl0gc3lzY2FsbHMvaW9jdGw6IGlvY3RsX3NnMDEu
YzogaW9jdGxfc2cwMSBpbnZva2VkIG9vbS1raWxsZXINCkhpIFhpbnBlbmcsDQoNCltyb290QHRl
c3QtZW52LW5tMDUtY29tcHV0ZS0xNGU1ZTcyZTM4IH5dIyBjYXQgL3Byb2MvbWVtaW5mbw0KTWVt
VG90YWw6ICAgICAgIDUyNjk5NzQyMCBrQg0KTWVtRnJlZTogICAgICAgIDUyMDIyNDkwOCBrQg0K
TWVtQXZhaWxhYmxlOiAgIDUxOTkzNjc0NCBrQg0KQnVmZmVyczogICAgICAgICAgICAgICAwIGtC
DQpDYWNoZWQ6ICAgICAgICAgIDI1MDkwMzYga0INClN3YXBDYWNoZWQ6ICAgICAgICAgICAgMCBr
Qg0KLi4uDQpTd2FwVG90YWw6ICAgICAgICAgICAgIDAga0INClN3YXBGcmVlOiAgICAgICAgICAg
ICAgMCBrQg0KLi4uDQpDb21taXRMaW1pdDogICAgMjYzNDk4NzA4IGtCDQpDb21taXR0ZWRfQVM6
ICAgMTAyNjM3NjAga0INCg0KW3Jvb3RAdGVzdC1lbnYtbm0wNS1jb21wdXRlLTE0ZTVlNzJlMzgg
fl0jIGNhdCAgL3Byb2Mvc3lzL3ZtL21pbl9mcmVlX2tieXRlcw0KOTAxMTINCg0KQWZ0ZXIgbG9v
a2luZyBiYWNrIG9uIHRoaXMgcHJvYmxlbSwgSSBwcmVmZXIgdG8gdGhpbmsgdGhlIHJlYXNvbnMg
d2VyZSBjYXVzZWQgYnkgbG93ZXIgQ29tbWl0TGltaXQuDQoNCiAgICBDb21taXRMaW1pdDogICAg
MjYzNDk4NzA4IGtCIDwgTWVtQXZhaWxhYmxlOiAgIDUxOTkzNjc0NCBrQg0KDQpJZiB5b3UgdHJ5
IHRvIGVuYWJsZSBhbGwgc3dhcC1kaXNrIG9yIHJlc2V0IHRvIGEgaGlnaCByYXRpbyBpbiBvdmVy
Y29tbWl0X3JhdGlvDQp0byBtYWtlIGl0IGxhcmdlciB0aGFuIE1lbUF2YWlsYWJsZSwgcHJvYmFi
bHkgbm8gT09NIG9jY3VycyBhbnltb3JlLg0KDQpCdHcsIEkgYWxzbyBvYnNlcnZlZCB0aGF0IGlv
Y3RsX3NnMDEgYWxtb3N0IGJlaW5nIGtpbGxlZCBieSBPT00NCmV2ZXJ5IHRpbWUgb24gYW4gYWFy
Y2g2NCB3aXRoIGxpdHRsZSBzd2FwIHNwYWNlLCBidXQgaWYgSSBhZGQgbW9yZQ0Kc3dhcCBvciBz
ZXQgYSBoaWdoIHZhbHVlIG9mIG92ZXJjb21taXRfcmF0aW8sIHRoZSBwcm9ibGVtIGlzIGdvbmUu
DQooSSBtYW51YWxseSB0cmllZCB3aXRoIGFub3RoZXIgeDg2XzY0IHRvIGNvbmZpcm0gdGhpcyB0
b28pDQogICAgICAgICAgICAgIHRvdGFsICAgICAgICB1c2VkICAgICAgICBmcmVlICAgICAgc2hh
cmVkICBidWZmL2NhY2hlICAgYXZhaWxhYmxlCk1lbTogICAgICAgICAyNTk4MjggICAgICAgIDUz
NjUgICAgICAyNDczODMgICAgICAgICAgNjggICAgICAgIDcwNzkgICAgICAyMzEyOTYKU3dhcDog
ICAgICAgICAgNDA5NSAgICAgICAgICA1NSAgICAgICAgNDA0MC0tLQpNZW1Ub3RhbDogICAgICAg
MjY2MDYzODcyIGtCCk1lbUZyZWU6ICAgICAgICAyNTMzMjA3Njgga0IKTWVtQXZhaWxhYmxlOiAg
IDIzNjg0ODA2NCBrQgpCdWZmZXJzOiAgICAgICAgICAgIDE0NzIga0IKQ2FjaGVkOiAgICAgICAg
ICA2NzU1NDU2IGtCClN3YXBDYWNoZWQ6ICAgICAgICAxMjE2MCBrQgouLi4KQ29tbWl0TGltaXQ6
ICAgIDEzNzIyNjE3NiBrQgpDb21taXR0ZWRfQVM6ICAgIDEyMDY5MTIga0IKLS0tDQoNClRoZSBw
cmV2aW91cyBtZXRob2QgaW4gdGhlIHBhdGNoWzFdIHNlZW1zIG5vdCBnb29kIGVub3VnaCwgYnV0
IHRoYXQgY2FuDQpoZWxwIHRvIHZlcmlmeSBpZiBPT00gZGlzYXBwZWFycyB3aGVuIHJlc2V0dGlu
ZyB0aGUgb3ZlcmNvbW1pdF9yYXRpby4NClsxXSBodHRwOi8vbGlzdHMubGludXguaXQvcGlwZXJt
YWlsL2x0cC8yMDIxLUZlYnJ1YXJ5LzAyMDkwNy5odG1sDQoNCkhlbmNlLCBhbm90aGVyIGltcHJv
dmVtZW50IHdheSBiYXNlZCBvbiB0aGUgYWJvdmUgaXMgdG8gYWxsb2NhdGUgcHJvcGVyDQptZW1v
cnktc2l6ZSBhY2NvcmRpbmcgdG8gQ29tbWl0TGltaXQgdmFsdWUgd2hlbiBkZXRlY3RpbmcgdGhl
IHZhbHVlIG9mDQpDb21taXRMaW1pdCBpcyBsZXNzIHRoYW4gTWVtQXZhaWxhYmxlLiBUaGF0IHdp
bGwgbWFrZSB0aGUgdGVzdCBoYXBweSB3aXRoDQphIGxpdHRsZSBzd2FwLXNwYWNlIHNpemUgc3lz
dGVtLg0KDQpBbnkgdGhvdWdodHMsIG9yIGNvbW1lbnRzPw0KDQotLS0gYS9saWIvdHN0X21lbXV0
aWxzLmMNCisrKyBiL2xpYi90c3RfbWVtdXRpbHMuYw0KQEAgLTM2LDYgKzM2LDEzIEBAIHZvaWQg
dHN0X3BvbGx1dGVfbWVtb3J5KHNpemVfdCBtYXhzaXplLCBpbnQgZmlsbGNoYXIpDQogICAgICAg
IGlmIChpbmZvLmZyZWVyYW0gLSBzYWZldHkgPCBtYXhzaXplIC8gaW5mby5tZW1fdW5pdCkNCiAg
ICAgICAgICAgICAgICBtYXhzaXplID0gKGluZm8uZnJlZXJhbSAtIHNhZmV0eSkgKiBpbmZvLm1l
bV91bml0Ow0KIA0KKyAgICAgICAvKg0KKyAgICAgICAgKiBUbyByZXNwZWN0IENvbW1pdExpbWl0
IHRvIHByZXZlbnQgdGVzdCBpbnZva2luZyBPT00ga2lsbGVyLA0KKyAgICAgICAgKiB0aGlzIG1h
eSBhcHBlYXIgb24gc3lzdGVtIHdpdGggYSBzbWFsbGVyIHN3YXAtZGlzayAob3IgZGlzYWJsZWQp
Lg0KKyAgICAgICAgKi8NCisgICAgICAgaWYgKFNBRkVfUkVBRF9NRU1JTkZPKCJDb21taXRMaW1p
dDoiKSA8IFNBRkVfUkVBRF9NRU1JTkZPKCJNZW1BdmFpbGFibGU6IikpDQorICAgICAgICAgICAg
ICAgbWF4c2l6ZSA9IFNBRkVfUkVBRF9NRU1JTkZPKCJDb21taXRMaW1pdDoiKSAqIDEwMjQgLSAo
c2FmZXR5ICogaW5mby5tZW1fdW5pdCk7DQorDQogICAgICAgIGJsb2Nrc2l6ZSA9IE1JTihtYXhz
aXplLCBibG9ja3NpemUpOw0KICAgICAgICBtYXBfY291bnQgPSBtYXhzaXplIC8gYmxvY2tzaXpl
Ow0KICAgICAgICBtYXBfYmxvY2tzID0gU0FGRV9NQUxMT0MobWFwX2NvdW50ICogc2l6ZW9mKHZv
aWQgKikpOw0KDQoNCj09PT09PT09PT09PT09PT09PT09PT09PQ0KDQpBYm91dCB0aGUgIE1lbUF2
YWlsYWJsZSA8IE1lbUZyZWUsIEkgdGhpbmsgdGhhdCBpcyBjb3JyZWN0IGJlaGF2aW9yIG9uDQp5
b3VyIHN5c3RlbSBhbmQgbm90IHRoZSBPT00gcm9vdC1jYXVzZS4NCg0KR2VuZXJhbGx5LCB3ZSBh
c3N1bWVkIHRoZSBNZW1BdmFpbGFibGUgaGlnaGVyIHRoYW4gTWVtRnJlZSwNCmJ1dCB3ZSBzb21l
dGltZXMgYWxzbyBhbGxvdyBzaXR1YXRpb25zIHRvIGJyZWFrIHRoYXQuIFdlJ2QgYmV0dGVyDQpj
b3VudCBhbGwgb2YgdGhlIGRpZmZlcmVudCBmcmVlIHdhdGVybWFya3MgZnJvbSAvcHJvYy96b25l
aW5mbywgdGhlbg0KYWRkIHRoZSBzdW0gb2YgdGhlIGxvdyB3YXRlcm1hcmtzIHRvIE1lbUF2YWls
YWJsZSwgaWYgZ2V0IGEgdmFsdWUNCmxhcmdlciB0aGFuIE1lbUZyZWUsIHRoYXQgc2hvdWxkIGJl
IE9LIGZyb20gbXkgcGVyc3BlY3RpdmUuDQoNCi0tLS0tDQojIGVjaG8gNjc1ODQwID4gL3Byb2Mv
c3lzL3ZtL21pbl9mcmVlX2tieXRlcw0KDQojIGNhdCAvcHJvYy9tZW1pbmZvIHxncmVwIC1pIG1l
bQ0KTWVtVG90YWw6ICAgICAgICA1ODg4NTg0IGtCDQpNZW1GcmVlOiAgICAgICAgIDQ1MTgwNjQg
a0INCk1lbUF2YWlsYWJsZTogICAgMzY5MjAwOCBrQg0KU2htZW06ICAgICAgICAgICAgIDIxMTI4
IGtCDQpTaG1lbUh1Z2VQYWdlczogICAgICAgIDAga0INClNobWVtUG1kTWFwcGVkOiAgICAgICAg
MCBrQg0KDQoNCiMgY2F0IC9wcm9jL3pvbmVpbmZvIHxncmVwIGxvdyAtQiAzIA0KLi4uDQogIHBh
Z2VzIGZyZWUgICAgIDM4NDANCiAgICAgICAgbWluICAgICAgNDQwDQogICAgICAgIGxvdyAgICAg
IDU1MA0KLS0NCk5vZGUgMCwgem9uZSAgICBETUEzMg0KICBwYWdlcyBmcmVlICAgICAzNTU2MDIN
CiAgICAgICAgbWluICAgICAgNzk3MDYNCiAgICAgICAgbG93ICAgICAgOTk2MzINCi0tDQpOb2Rl
IDAsIHpvbmUgICBOb3JtYWwNCiAgcGFnZXMgZnJlZSAgICAgMA0KICAgICAgICBtaW4gICAgICAw
DQogICAgICAgIGxvdyAgICAgIDANCi0tDQpOb2RlIDAsIHpvbmUgIE1vdmFibGUNCiAgcGFnZXMg
ZnJlZSAgICAgMA0KICAgICAgICBtaW4gICAgICAwDQogICAgICAgIGxvdyAgICAgIDANCi0tDQpO
b2RlIDAsIHpvbmUgICBEZXZpY2UNCiAgcGFnZXMgZnJlZSAgICAgMA0KICAgICAgICBtaW4gICAg
ICAwDQogICAgICAgIGxvdyAgICAgIDANCi0tDQpOb2RlIDEsIHpvbmUgICAgICBETUENCiAgcGFn
ZXMgZnJlZSAgICAgMA0KICAgICAgICBtaW4gICAgICAwDQogICAgICAgIGxvdyAgICAgIDANCi0t
DQpOb2RlIDEsIHpvbmUgICAgRE1BMzINCiAgcGFnZXMgZnJlZSAgICAgMA0KICAgICAgICBtaW4g
ICAgICAwDQogICAgICAgIGxvdyAgICAgIDANCi0tDQogICAgICBucl9rZXJuZWxfbWlzY19yZWNs
YWltYWJsZSAwDQogIHBhZ2VzIGZyZWUgICAgIDc2OTE5Mg0KICAgICAgICBtaW4gICAgICA4ODgx
Mg0KICAgICAgICBsb3cgICAgICAxMTEwMTUNCg0KKDExMTAxNSs5OTYzMis1NTApKjQgKyAzNjky
MDA4KE1lbUF2YWlsYWJsZSkgPiA1ODg4NTg0KE1lbUZyZWUpDQoNCkJ0dyB0aGUgZm9ybXVsYSB0
byBjb3VudCBNZW1BdmFpbGFibGUgaXM6DQoNCmF2YWlsYWJsZSA9IE1lbUZyZWUgLSB0b3RhbHJl
c2VydmVfcGFnZXMgKyBwYWdlc1tMUlVfQUNUSVZFX0ZJTEVdICsgcGFnZXNbTFJVX0lOQUNUSVZF
X0ZJTEVdIC0gbWluKHBhZ2VjYWNoZSAvIDIsIHdtYXJrX2xvdykNCg0KLS0gDQpSZWdhcmRzLA0K
TGkgV2FuZw0K

------=_001_NextPart680247663225_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }p { margin-top: 0px; margin-botto=
m: 0px; }div.FoxDiv20210305134357785464 { }body { font-size: 14px; font-fa=
mily: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</styl=
e></head><body>=0A<div><span></span><div class=3D"gmail_quote"><span class=
=3D"gmail_default">--- a/lib/tst_memutils.c<br>+++ b/lib/tst_memutils.c<br=
>@@ -36,6 +36,13 @@ void tst_pollute_memory(size_t maxsize, int fillchar)<=
br><strike>&nbsp; &nbsp; &nbsp; &nbsp; if (info.freeram - safety &lt; maxs=
ize / info.mem_unit)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; maxsize =3D (info.freeram - safety) * info.mem_unit;</strike><br><br=
></span></div><div class=3D"gmail_quote"><span class=3D"gmail_default">&nb=
sp;=3D=3D&gt;Thanks,but the maxsize original code need to be deleted,Right=
?<br><br></span></div><div class=3D"gmail_quote"><span class=3D"gmail_defa=
ult">+ &nbsp; &nbsp; &nbsp; /*<br>+ &nbsp; &nbsp; &nbsp; &nbsp;* To respec=
t CommitLimit to prevent test invoking OOM killer,<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp;* this may appear on system with a smaller swap-disk (or disabled=
).<br>+ &nbsp; &nbsp; &nbsp; &nbsp;*/<br>+ &nbsp; &nbsp; &nbsp; if (SAFE_R=
EAD_MEMINFO("CommitLimit:") &lt; SAFE_READ_MEMINFO("MemAvailable:"))<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; maxsize =3D SAFE_READ_MEM=
INFO("CommitLimit:") * 1024 - (safety * info.mem_unit);<br>+<br>&nbsp; &nb=
sp; &nbsp; &nbsp; blocksize =3D MIN(maxsize, blocksize);<br>&nbsp; &nbsp; =
&nbsp; &nbsp; map_count =3D maxsize / blocksize;<br>&nbsp; &nbsp; &nbsp; &=
nbsp; map_blocks =3D SAFE_MALLOC(map_count * sizeof(void *));<br></span></=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br></=
div></div>=0A<div><br></div><hr style=3D"width: 210px; height: 1px;" color=
=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div style=3D"margin:=
 10px;"><p class=3D"MsoNormal" style=3D"font-family: =E7=AD=89=E7=BA=BF; f=
ont-size: 10.5pt; line-height: normal; margin: 0cm; text-align: justify;">=
<span lang=3D"EN-US" style=3D"font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91, sans-serif;">Thanks=EF=BC=81</span></p></div></span></div>=0A<bloc=
kquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; m=
argin-Right: inherit"><div>&nbsp;</div><div style=3D"border:none;border-to=
p:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIG=
HT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#0000=
00; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>Fr=
om:</b>&nbsp;<a href=3D"mailto:liwang@redhat.com">Li Wang</a></div><div><b=
>Date:</b>&nbsp;2021-03-04&nbsp;15:52</div><div><b>To:</b>&nbsp;<a href=3D=
"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a></div><div><b>=
CC:</b>&nbsp;<a href=3D"mailto:chrubis@suse.cz">Cyril Hrubis</a>; <a href=
=3D"mailto:ltp@lists.linux.it">ltp</a>; <a href=3D"mailto:mdoucha@suse.cz"=
>Martin Doucha</a></div><div><b>Subject:</b>&nbsp;Re: [LTP] [PATCH 1/2] sy=
scalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div></div></div=
><div><div class=3D"FoxDiv20210305134357785464"><div dir=3D"ltr"><div dir=
=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi Xinpeng=
,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">=0A<div><span></span><div>[root@test-env-nm05-compute-14e5e72e38 ~=
]# cat /proc/meminfo</div><div>MemTotal: &nbsp; &nbsp; &nbsp; 526997420 kB=
</div><div>MemFree: &nbsp; &nbsp; &nbsp; &nbsp;520224908 kB</div><div><spa=
n class=3D"gmail_default" style=3D"font-size:small"></span>MemAvailable: &=
nbsp; 519936744 kB</div><div>Buffers: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; 0 kB</div><div>Cached: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2509=
036 kB</div><div>SwapCached: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB=
</div><div><span class=3D"gmail_default" style=3D"font-size:small">...</sp=
an></div><div>SwapTotal: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</d=
iv><div>SwapFree: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB</di=
v><div><span class=3D"gmail_default" style=3D"font-size:small">...</span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>C=
ommitLimit: &nbsp; &nbsp;263498708 kB</div><div>Committed_AS: &nbsp; 10263=
760 kB</div></div><div><br></div><div><div>[root@test-env-nm05-compute-14e=
5e72e38 ~]# cat &nbsp;/proc/sys/vm/min_free_kbytes</div><div>90112</div></=
div></blockquote><div><br></div><span class=3D"gmail_default" style=3D"fon=
t-size:small">After looking back on this problem</span>,&nbsp;<span class=
=3D"gmail_default" style=3D"font-size:small">I prefer to think </span><spa=
n class=3D"gmail_default" style=3D"font-size:small">the reasons were cause=
d by lower CommitLimit.</span></div><div class=3D"gmail_quote"><span class=
=3D"gmail_default" style=3D"font-size:small"><br></span></div><div class=
=3D"gmail_quote"><span class=3D"gmail_default">&nbsp; &nbsp;&nbsp;</span>C=
ommitLimit: &nbsp; &nbsp;263498708 kB<span class=3D"gmail_default"> &lt; <=
/span><span class=3D"gmail_default"></span>MemAvailable: &nbsp; 519936744 =
kB<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
"><span class=3D"gmail_default" style=3D"font-size:small">If you try to en=
able all swap-disk or reset to a high ratio in overcommit_ratio</span></di=
v><div class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-s=
ize:small">to make it larger than MemAvailable, probably no OOM occurs any=
more.</span></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote"><div class=3D"gmail_default" style=3D"font-size:small">Btw, I also=
 observed that ioctl_sg01 almost being killed by OOM</div><div class=3D"gm=
ail_default" style=3D"font-size:small">every time on<span class=3D"gmail_d=
efault">&nbsp;an aarch64&nbsp;</span>with little swap space<span class=3D"=
gmail_default">, but if I add more</span></div><div class=3D"gmail_default=
" style=3D"font-size:small"><span class=3D"gmail_default">swap&nbsp;</span=
><span class=3D"gmail_default">or set a high&nbsp;</span>value of overcomm=
it_ratio, the&nbsp;problem is gone.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">(I manually tried with another x86_64 to confirm thi=
s too)</div><div class=3D"gmail_default" style=3D"font-size:small"><pre st=
yle=3D"color:rgb(0,0,0);white-space:pre-wrap">              total        u=
sed        free      shared  buff/cache   available=0AMem:         259828 =
       5365      247383          68        7079      231296=0ASwap:       =
   4095          55        4040</pre><pre style=3D"color:rgb(0,0,0);white-=
space:pre-wrap"><span style=3D"font-family:Arial,Helvetica,sans-serif">---=
</span>=0A</pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">MemTo=
tal:       266063872 kB=0AMemFree:        253320768 kB=0AMemAvailable:   2=
36848064 kB=0ABuffers:            1472 kB=0ACached:          6755456 kB=0A=
SwapCached:        12160 kB=0A...=0ACommitLimit:    137226176 kB=0ACommitt=
ed_AS:    1206912 kB=0A---</pre></div></div><div class=3D"gmail_quote"><sp=
an class=3D"gmail_default" style=3D"font-size:small"><div class=3D"gmail_q=
uote"><span class=3D"gmail_default"><br></span></div><div class=3D"gmail_q=
uote"><span class=3D"gmail_default">The previous method in the patch[1] se=
ems not good enough, but that can</span></div><div class=3D"gmail_quote"><=
span class=3D"gmail_default">help&nbsp;</span>to verify if OOM <span class=
=3D"gmail_default">disappears</span>&nbsp;when resetting the&nbsp;overcomm=
it_ratio.</div><div class=3D"gmail_quote"><span class=3D"gmail_default">[1=
] <a href=3D"http://lists.linux.it/pipermail/ltp/2021-February/020907.html=
" target=3D"_blank">http://lists.linux.it/pipermail/ltp/2021-February/0209=
07.html</a></span></div><div class=3D"gmail_quote"><br></div></span></div>=
<div class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-siz=
e:small">Hence, another improvement way based on the above is to allocate =
proper</span></div><div class=3D"gmail_quote"><span class=3D"gmail_default=
">memory-size&nbsp;</span><span class=3D"gmail_default">according&nbsp;</s=
pan><span class=3D"gmail_default">to&nbsp;</span><span class=3D"gmail_defa=
ult">CommitLimit value when detecting&nbsp;</span>the value of<span class=
=3D"gmail_default"></span></div><div class=3D"gmail_quote"><span class=3D"=
gmail_default"></span>CommitLimit<span class=3D"gmail_default" style=3D"fo=
nt-size:small"> is </span>less<span class=3D"gmail_default"> </span>than<s=
pan class=3D"gmail_default">&nbsp;</span><span class=3D"gmail_default"></s=
pan>MemAvailable.<span class=3D"gmail_default"> </span>That will make the<=
span class=3D"gmail_default"> </span><span class=3D"gmail_default">test ha=
ppy with</span><span class=3D"gmail_default"></span></div><div class=3D"gm=
ail_quote"><span class=3D"gmail_default">a&nbsp;</span>little swap-space<s=
pan class=3D"gmail_default" style=3D"font-size:small"> </span><span class=
=3D"gmail_default"></span>size<span class=3D"gmail_default"> </span>system=
<span class=3D"gmail_default">.</span></div><div class=3D"gmail_quote"><sp=
an class=3D"gmail_default"><br></span></div><div class=3D"gmail_quote"><sp=
an class=3D"gmail_default">Any thoughts, or comments?</span></div><div cla=
ss=3D"gmail_quote"><span class=3D"gmail_default"><br></span></div><div cla=
ss=3D"gmail_quote"><span class=3D"gmail_default">--- a/lib/tst_memutils.c<=
br>+++ b/lib/tst_memutils.c<br>@@ -36,6 +36,13 @@ void tst_pollute_memory(=
size_t maxsize, int fillchar)<br>&nbsp; &nbsp; &nbsp; &nbsp; if (info.free=
ram - safety &lt; maxsize / info.mem_unit)<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; maxsize =3D (info.freeram - safety) * info.mem=
_unit;<br>&nbsp;<br>+ &nbsp; &nbsp; &nbsp; /*<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp;* To respect CommitLimit to prevent test invoking OOM killer,<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp;* this may appear on system with a smaller swap-di=
sk (or disabled).<br>+ &nbsp; &nbsp; &nbsp; &nbsp;*/<br>+ &nbsp; &nbsp; &n=
bsp; if (SAFE_READ_MEMINFO("CommitLimit:") &lt; SAFE_READ_MEMINFO("MemAvai=
lable:"))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; maxsize =
=3D SAFE_READ_MEMINFO("CommitLimit:") * 1024 - (safety * info.mem_unit);<b=
r>+<br>&nbsp; &nbsp; &nbsp; &nbsp; blocksize =3D MIN(maxsize, blocksize);<=
br>&nbsp; &nbsp; &nbsp; &nbsp; map_count =3D maxsize / blocksize;<br>&nbsp=
; &nbsp; &nbsp; &nbsp; map_blocks =3D SAFE_MALLOC(map_count * sizeof(void =
*));<br></span></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote"><div class=3D"gmail_defaul=
t" style=3D"font-size:small">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font-s=
ize:small">About the </span>&nbsp;<span class=3D"gmail_default" style=3D"f=
ont-size:small">MemAvailable &lt; MemFree, I think that is correct behavio=
r on</span></div><div class=3D"gmail_quote"><span class=3D"gmail_default" =
style=3D"font-size:small">your system and not the OOM root-cause.</span></=
div><div class=3D"gmail_quote"><span class=3D"gmail_default" style=3D"font=
-size:small"><br></span></div><div class=3D"gmail_quote"><span class=3D"gm=
ail_default" style=3D"font-size:small">Generally, we assumed the MemAvaila=
ble higher&nbsp;</span><span class=3D"gmail_default">than&nbsp;</span><spa=
n class=3D"gmail_default">MemFree,</span></div><div class=3D"gmail_quote">=
but we&nbsp;<span class=3D"gmail_default">sometimes also allow situations =
to break that.&nbsp;</span><span class=3D"gmail_default">We'd better</span=
></div><div class=3D"gmail_quote"><span class=3D"gmail_default">count</spa=
n><span class=3D"gmail_default">&nbsp;</span>all of the different free wat=
ermarks from /proc/zoneinfo<span class=3D"gmail_default">,&nbsp;</span><sp=
an class=3D"gmail_default">then</span></div><div class=3D"gmail_quote">add=
 the sum of the low watermarks to MemAvailable, if get a value</div><div c=
lass=3D"gmail_quote">larger<span class=3D"gmail_default" style=3D"font-siz=
e:small"> </span>than MemFree, that should be OK from my perspective.</div=
><div><div class=3D"gmail_default" style=3D"font-size:small"></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">-----</div># echo 675840 &gt; /proc=
/sys/vm/min_free_kbytes</div><div><br># cat /proc/meminfo |grep -i mem<br>=
MemTotal: &nbsp; &nbsp; &nbsp; &nbsp;5888584 kB<br><span class=3D"gmail_de=
fault" style=3D"font-size:small"></span>MemFree: &nbsp; &nbsp; &nbsp; &nbs=
p; 4518064 kB<br><span class=3D"gmail_default" style=3D"font-size:small"><=
/span>MemAvailable: &nbsp; &nbsp;3692008 kB<br>Shmem: &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; 21128 kB<br>ShmemHugePages: &nbsp; &nbsp; &nbsp; &nb=
sp;0 kB<br>ShmemPmdMapped: &nbsp; &nbsp; &nbsp; &nbsp;0 kB</div><div><span=
 class=3D"gmail_default" style=3D"font-size:small"></span><br><br># cat /p=
roc/zoneinfo |grep low<span class=3D"gmail_default" style=3D"font-size:sma=
ll"> -B 3 </span><br><span class=3D"gmail_default" style=3D"font-size:smal=
l">...</span><span class=3D"gmail_default" style=3D"font-size:small"></spa=
n><br>&nbsp; pages free &nbsp; &nbsp; 3840<br>&nbsp; &nbsp; &nbsp; &nbsp; =
min &nbsp; &nbsp; &nbsp;440<br>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &nbs=
p; &nbsp;550<br>--<br>Node 0, zone &nbsp; &nbsp;DMA32<br>&nbsp; pages free=
 &nbsp; &nbsp; 355602<br>&nbsp; &nbsp; &nbsp; &nbsp; min &nbsp; &nbsp; &nb=
sp;79706<br>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &nbsp; &nbsp;99632<br>-=
-<br>Node 0, zone &nbsp; Normal<br>&nbsp; pages free &nbsp; &nbsp; 0<br>&n=
bsp; &nbsp; &nbsp; &nbsp; min &nbsp; &nbsp; &nbsp;0<br>&nbsp; &nbsp; &nbsp=
; &nbsp; low &nbsp; &nbsp; &nbsp;0<br>--<br>Node 0, zone &nbsp;Movable<br>=
&nbsp; pages free &nbsp; &nbsp; 0<br>&nbsp; &nbsp; &nbsp; &nbsp; min &nbsp=
; &nbsp; &nbsp;0<br>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &nbsp; &nbsp;0<=
br>--<br>Node 0, zone &nbsp; Device<br>&nbsp; pages free &nbsp; &nbsp; 0<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; min &nbsp; &nbsp; &nbsp;0<br>&nbsp; &nbsp; &=
nbsp; &nbsp; low &nbsp; &nbsp; &nbsp;0<br>--<br>Node 1, zone &nbsp; &nbsp;=
 &nbsp;DMA<br>&nbsp; pages free &nbsp; &nbsp; 0<br>&nbsp; &nbsp; &nbsp; &n=
bsp; min &nbsp; &nbsp; &nbsp;0<br>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &=
nbsp; &nbsp;0<br>--<br>Node 1, zone &nbsp; &nbsp;DMA32<br>&nbsp; pages fre=
e &nbsp; &nbsp; 0<br>&nbsp; &nbsp; &nbsp; &nbsp; min &nbsp; &nbsp; &nbsp;0=
<br>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &nbsp; &nbsp;0<br>--<br>&nbsp; =
&nbsp; &nbsp; nr_kernel_misc_reclaimable 0<br>&nbsp; pages free &nbsp; &nb=
sp; 769192<br>&nbsp; &nbsp; &nbsp; &nbsp; min &nbsp; &nbsp; &nbsp;88812<br=
>&nbsp; &nbsp; &nbsp; &nbsp; low &nbsp; &nbsp; &nbsp;111015</div><div><br>=
<div class=3D"gmail_default" style=3D"font-size:small"></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">(111015+99632+550)*4 + 3692=
008(<span class=3D"gmail_default"></span>MemAvailable) &gt;&nbsp;5888584(<=
span class=3D"gmail_default"></span>MemFree)</div></div><div><br><div clas=
s=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:small">B=
tw the&nbsp;formula to count MemAvailable is:</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">available =3D MemFree - totalreserve_pages + pages[=
LRU_ACTIVE_FILE] + pages[LRU_INACTIVE_FILE] - min(pagecache / 2, wmark_low=
)</div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div></div></div>=0A<=
/div></div></blockquote>=0A</body></html>
------=_001_NextPart680247663225_=------


--===============1571651059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1571651059==--

