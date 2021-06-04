Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220539B081
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 04:37:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 753853C8F29
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 04:37:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7C603C2862
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 04:37:38 +0200 (CEST)
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ABB33600F3A
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 04:37:34 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id XYP00126;
 Fri, 04 Jun 2021 10:37:26 +0800
Received: from jtjnmail201619.home.langchao.com (10.100.2.19) by
 jtjnmail201621.home.langchao.com (10.100.2.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 10:37:27 +0800
Received: from jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372])
 by jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372%2])
 with mapi id 15.01.2176.012; Fri, 4 Jun 2021 10:37:27 +0800
From: =?gb2312?B?SmFtZXMgRG9uZyAotq3KwL2tKQ==?= <dongshijiang@inspur.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: =?gb2312?B?tPC4tDogW0xUUF0gW1BBVENIXSBsdHAtYWlvZGlvL2Rpb19hcHBlbmQ6IGZp?=
 =?gb2312?Q?x_dio=5Fappend()?=
Thread-Index: AQHXWE4W7JSLVftZ70WCzStzVLHVFasBiRQAgACKUGCAAHwkAIAAlFXg
Date: Fri, 4 Jun 2021 02:37:26 +0000
Message-ID: <eddbe134055240cb8889b4df76404c1d@inspur.com>
References: <d87da351dd8cd8c8e51afc8922162e84@sslemail.net>
 <60B8A96C.8080503@fujitsu.com> <befea6726fc7467b9410db3e3b961f3e@inspur.com>
 <60B98598.7000905@fujitsu.com>
In-Reply-To: <60B98598.7000905@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.111.79]
MIME-Version: 1.0
tUid: 2021604103727f192672c247453baf447de0cf1e52996
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogtPC4tDogIFtQQVRDSF0gbHRwLWFpb2Rpby9k?=
 =?gb2312?b?aW9fYXBwZW5kOiBmaXggZGlvX2FwcGVuZCgp?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgeHV5YW5nDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHksIGJ1dCBJIHRo
aW5rIHdlIHNob3VsZCBhZGQgdGhlIGp1ZGdtZW50IG9mIHRoZSByZXR1cm4gdmFsdWUgaW4gdGhl
ICJkaW9fYXBwZW5kIiBmdW5jdGlvbiwgYmVjYXVzZSB0aGUgZmluYWwgcmV0dXJuIHZhbHVlIGlz
IDAgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSB0ZXN0IGl0ZW0gcGFzc2VzIG9yIG5vdCwgYW5k
IDAgbWVhbnMgUEFTUy4NCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IHh1eWFuZzIwMTgu
anlAZnVqaXRzdS5jb20gW21haWx0bzp4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tXSANCreiy83K
sbzkOiAyMDIxxOo21MI0yNUgOTo0NA0KytW8/sjLOiBKYW1lcyBEb25nICi2rcrAva0pIDxkb25n
c2hpamlhbmdAaW5zcHVyLmNvbT4NCrOty806IGx0cEBsaXN0cy5saW51eC5pdA0K1vfM4jogUmU6
ILTwuLQ6IFtMVFBdIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9fYXBwZW5kOiBmaXggZGlvX2FwcGVu
ZCgpDQoNCkhpIERvbmcNCg0KUGxlYXNlIHNlZSBsdHAvdGVzdGNhc2VzL2tlcm5lbC9pby9sdHAt
YWlvZGlvL1JFQURNRQ0KaXQgc2FpZCAiDQpSdW4gdGhlIGx0cC1haW9kaW8uc2ggZmlsZSB0byBl
eGVjdXRlIGFsbCB0aGUgdGVzdHMuIFRoZSB0ZXN0cyBjYW4gYWxzbyBiZSBydW4gaW5kaXZpZHVh
bGx5LCBqdXN0IGV4ZWN1dGUgdGhlIHByb2dyYW0gYW5kIHRoZSBleGNlcHRlZCBwYXJhbXMgd2ls
bCBiZSBvdXRwdXQuIE5vIHNjcmlwdHMgd2VyZSBjcmVhdGVkIHRvIHJ1biB0aGUgdGVzdCBzdGFu
ZGFsb25lLiINCg0KU28gdXNlIHJ1bmx0cCB0byBleGN1dGUgbHRwLWFpb2Rpby5wYXJ0NCB3YXNu
J3Qgc3VwcG9ydGVkLg0KDQpab3JybyBhbmQgQ3lyaWwgYWxzbyBkaXNjdXNzIGFib3V0IGx0cC1h
aW9kaW8gZGlyZWN0b3J5L2ZpbGUgbm9uLWV4aXN0ZWQgcHJvYmxlbS4gUGxlYXNlIHNlZSB0aGUg
Zm9sbG93aW5nIHVybC4NCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAv
cGF0Y2gvMjAyMTA2MDExNTU0MjcuOTk2MzIxLTEtemxhbmdAcmVkaGF0LmNvbS8NCg0KDQpCZXN0
IFJlZ2FyZHMNCllhbmcgWHUNCj4gSGkgeHV5YW5nDQo+IDEuIGlmIG5vdCBjcmVhdGUgZGlyZWN0
b3J5LCBpbiB0aGUgZnVuY3Rpb24gZGlvX2FwcGVuZCBUaGUgb3BlbiBmaWxlIHJldHVybnMgYSBm
YWlsdXJlLCBCZWNhdXNlIHRoZSBkaXJlY3RvcnkgImFpb2RpbyIgZG9lcyBub3QgZXhpc3QuDQo+
IDIuIFRoZSBta2RpciBjb21tYW5kIGlzIGNhbGxlZCB0byByZWN1cnNpdmVseSBjcmVhdGUgZGly
ZWN0b3JpZXMNCj4gDQo+IC0tLS0t08q8/tStvP4tLS0tLQ0KPiC3orz+yMs6IHh1eWFuZzIwMTgu
anlAZnVqaXRzdS5jb20gW21haWx0bzp4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tXQ0KPiC3osvN
yrG85DogMjAyMcTqNtTCM8jVIDE4OjA1DQo+IMrVvP7IyzogSmFtZXMgRG9uZyAotq3KwL2tKTxk
b25nc2hpamlhbmdAaW5zcHVyLmNvbT4NCj4gs63LzTogbHRwQGxpc3RzLmxpbnV4Lml0DQo+INb3
zOI6IFJlOiBbTFRQXSBbUEFUQ0hdIGx0cC1haW9kaW8vZGlvX2FwcGVuZDogZml4IGRpb19hcHBl
bmQoKQ0KPiANCj4gSGkgZG9uZw0KPj4gV2hlbiBydW5uaW5nIHRoZSBkaW9fYXBwZW5kIHRlc3Qg
aW4gdGhlIGx0cC1haW9kaWlvLnBhcnQ0IHRlc3QgaXRlbSwgdGhlcmUgd2FzIGEgcHJvYmxlbSB0
aGF0IHRoZSBmaWxlIGNvdWxkIG5vdCBiZSBjcmVhdGVkLCBidXQgdGhlIHRlc3QgcmVzdWx0IHdh
cyBQQVNTLiBUbyB0aGlzIGVuZCwgdGhlIGZvbGxvd2luZyBvcGVyYXRpb25zIGhhdmUgYmVlbiBh
ZGRlZC4NCj4+IDEuIGNyZWF0ZSB0aGUgZGlyZWN0b3J5IHdoZXJlIHRoZSBmaWxlIGlzIGxvY2F0
ZWQuDQo+IFdoeSBuZWVkIHRvIGNyZWF0ZSBkaXJlY3Rvcnk/DQo+PiAyLiByZXdyaXRlIHRoZSBk
aW9fYXBwZW5kIEFQSS4gQWRkIHJlbGV2YW50IHJldHVybiB2YWx1ZXMuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogZG9uZ3NoaWppYW5nPGRvbmdzaGlqaWFuZ0BpbnNwdXIuY29tPg0KPj4gLS0tDQo+
PiAgICB0ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jIHwgMjYgKysr
KysrKysrKysrKysrLS0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9p
by9sdHAtYWlvZGlvL2Rpb19hcHBlbmQuYyANCj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9pby9sdHAt
YWlvZGlvL2Rpb19hcHBlbmQuYw0KPj4gaW5kZXggM2YwZWQyOWQ1Li41MDBkZmRjMzEgMTAwNjQ0
DQo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+PiBA
QCAtNzUsNyArNzUsNyBAQCBpbnQgcmVhZF9lb2YoY2hhciAqZmlsZW5hbWUpDQo+PiAgICAJcmV0
dXJuIDA7DQo+PiAgICB9DQo+Pg0KPj4gLXZvaWQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkN
Cj4+ICtpbnQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkNCj4+ICAgIHsNCj4+ICAgIAlpbnQg
ZmQ7DQo+PiAgICAJdm9pZCAqYnVmcHRyOw0KPj4gQEAgLTg2LDE0ICs4NiwxNCBAQCB2b2lkIGRp
b19hcHBlbmQoY2hhciAqZmlsZW5hbWUpDQo+Pg0KPj4gICAgCWlmIChmZDwgICAwKSB7DQo+PiAg
ICAJCXBlcnJvcigiY2Fubm90IGNyZWF0ZSBmaWxlIik7DQo+PiAtCQlyZXR1cm47DQo+PiArCQly
ZXR1cm4gMTsNCj4+ICAgIAl9DQo+Pg0KPj4gICAgCVRFU1QocG9zaXhfbWVtYWxpZ24oJmJ1ZnB0
ciwgNDA5NiwgNjQgKiAxMDI0KSk7DQo+PiAgICAJaWYgKFRFU1RfUkVUVVJOKSB7DQo+PiAgICAJ
CXRzdF9yZXNtKFRCUk9LIHwgVFJFUlJOTywgImNhbm5vdCBtYWxsb2MgYWxpZ25lZCBtZW1vcnki
KTsNCj4+ICAgIAkJY2xvc2UoZmQpOw0KPj4gLQkJcmV0dXJuOw0KPj4gKwkJcmV0dXJuIDE7DQo+
PiAgICAJfQ0KPj4NCj4+ICAgIAltZW1zZXQoYnVmcHRyLCAwLCA2NCAqIDEwMjQpOw0KPj4gQEAg
LTEwMiwxNyArMTAyLDI5IEBAIHZvaWQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFtZSkNCj4+ICAg
IAkJCWZwcmludGYoc3RkZXJyLCAid3JpdGUgJWQgcmV0dXJuZWQgJWRcbiIsIGksIHcpOw0KPj4g
ICAgCQl9DQo+PiAgICAJfQ0KPj4gKwlyZXR1cm4gMDsNCj4+ICAgIH0NCj4+DQo+PiAgICBpbnQg
bWFpbih2b2lkKQ0KPj4gICAgew0KPj4gLQljaGFyIGZpbGVuYW1lW1BBVEhfTUFYXTsNCj4+ICsJ
Y2hhciBmaWxlbmFtZVtQQVRIX01BWF0sIGZpbGVwYXRoW1BBVEhfTUFYLTVdOw0KPj4gICAgCWlu
dCBwaWRbTlVNX0NISUxEUkVOXTsNCj4+ICAgIAlpbnQgbnVtX2NoaWxkcmVuID0gMTsNCj4+ICAg
IAlpbnQgaTsNCj4+ICsJaW50IHJldCA9IC0xOw0KPj4NCj4+IC0Jc25wcmludGYoZmlsZW5hbWUs
IHNpemVvZihmaWxlbmFtZSksICIlcy9haW9kaW8vZmlsZSIsDQo+PiArCXNucHJpbnRmKGZpbGVw
YXRoLCBzaXplb2YoZmlsZXBhdGgpLCAiJXMvYWlvZGlvIiwNCj4+ICAgIAkJIGdldGVudigiVE1Q
IikgPyBnZXRlbnYoIlRNUCIpIDogIi90bXAiKTsNCj4+ICsNCj4+ICsJaWYgKGFjY2VzcyhmaWxl
cGF0aCwgRl9PSykgPT0gLTEpIHsNCj4+ICsJCWNoYXIgY29tbWFuZFtQQVRIX01BWCArIDEwXTsN
Cj4+ICsNCj4+ICsJCXNucHJpbnRmKGNvbW1hbmQsIHNpemVvZihjb21tYW5kKSwgIm1rZGlyIC1w
ICVzIiwgZmlsZXBhdGgpOw0KPj4gKwkJaWYgKHN5c3RlbShjb21tYW5kKSAhPSAwKQ0KPj4gKwkJ
CXJldHVybiAxOw0KPiBqdXN0IG9ubHkgY2FsbCBta2RpciBzeXNjYWxsIGluc3RlYWQgb2YgY29t
bWFuZC4NCj4+ICsJfQ0KPj4gKw0KPj4gKwlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVu
YW1lKSwgIiVzL2ZpbGUiLCBmaWxlcGF0aCk7DQo+Pg0KPj4gICAgCXByaW50ZigiQmVnaW4gZGlv
X2FwcGVuZCB0ZXN0Li4uXG4iKTsNCj4+DQo+PiBAQCAtMTM0LDEwICsxNDYsMTAgQEAgaW50IG1h
aW4odm9pZCkNCj4+ICAgIAkgKiBQYXJlbnQgYXBwZW5kcyB0byBlbmQgb2YgZmlsZSB1c2luZyBk
aXJlY3QgaS9vDQo+PiAgICAJICovDQo+Pg0KPj4gLQlkaW9fYXBwZW5kKGZpbGVuYW1lKTsNCj4+
ICsJcmV0ID0gZGlvX2FwcGVuZChmaWxlbmFtZSk7DQo+Pg0KPj4gICAgCWZvciAoaSA9IDA7IGk8
ICAgbnVtX2NoaWxkcmVuOyBpKyspIHsNCj4+ICAgIAkJa2lsbChwaWRbaV0sIFNJR1RFUk0pOw0K
Pj4gICAgCX0NCj4+IC0JcmV0dXJuIDA7DQo+PiArCXJldHVybiByZXQ7DQo+PiAgICB9DQoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
