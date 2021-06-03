Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566AF399EE7
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 12:28:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3B013C53B1
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 12:28:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1107D3C183E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:28:00 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5EF85100093A
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:27:56 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id XIF00050;
 Thu, 03 Jun 2021 18:27:50 +0800
Received: from jtjnmail201619.home.langchao.com (10.100.2.19) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 18:27:49 +0800
Received: from jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372])
 by jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372%2])
 with mapi id 15.01.2176.012; Thu, 3 Jun 2021 18:27:49 +0800
From: =?gb2312?B?SmFtZXMgRG9uZyAotq3KwL2tKQ==?= <dongshijiang@inspur.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] ltp-aiodio/dio_append: fix dio_append()
Thread-Index: AQHXWE4W7JSLVftZ70WCzStzVLHVFasBiRQAgACKUGA=
Date: Thu, 3 Jun 2021 10:27:49 +0000
Message-ID: <befea6726fc7467b9410db3e3b961f3e@inspur.com>
References: <d87da351dd8cd8c8e51afc8922162e84@sslemail.net>
 <60B8A96C.8080503@fujitsu.com>
In-Reply-To: <60B8A96C.8080503@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.111.79]
MIME-Version: 1.0
tUid: 2021603182750d9ba17c56e0c4f22e38f133bc2d9a15c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9fYXBw?=
 =?gb2312?b?ZW5kOiBmaXggZGlvX2FwcGVuZCgp?=
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

SGkgeHV5YW5nDQoxLiBpZiBub3QgY3JlYXRlIGRpcmVjdG9yeSwgaW4gdGhlIGZ1bmN0aW9uIGRp
b19hcHBlbmQgVGhlIG9wZW4gZmlsZSByZXR1cm5zIGEgZmFpbHVyZSwgQmVjYXVzZSB0aGUgZGly
ZWN0b3J5ICJhaW9kaW8iIGRvZXMgbm90IGV4aXN0Lg0KMi4gVGhlIG1rZGlyIGNvbW1hbmQgaXMg
Y2FsbGVkIHRvIHJlY3Vyc2l2ZWx5IGNyZWF0ZSBkaXJlY3Rvcmllcw0KDQotLS0tLdPKvP7Urbz+
LS0tLS0NCreivP7IyzogeHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbSBbbWFpbHRvOnh1eWFuZzIw
MTguanlAZnVqaXRzdS5jb21dIA0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjPI1SAxODowNQ0KytW8/sjL
OiBKYW1lcyBEb25nICi2rcrAva0pIDxkb25nc2hpamlhbmdAaW5zcHVyLmNvbT4NCrOty806IGx0
cEBsaXN0cy5saW51eC5pdA0K1vfM4jogUmU6IFtMVFBdIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9f
YXBwZW5kOiBmaXggZGlvX2FwcGVuZCgpDQoNCkhpIGRvbmcNCj4gV2hlbiBydW5uaW5nIHRoZSBk
aW9fYXBwZW5kIHRlc3QgaW4gdGhlIGx0cC1haW9kaWlvLnBhcnQ0IHRlc3QgaXRlbSwgdGhlcmUg
d2FzIGEgcHJvYmxlbSB0aGF0IHRoZSBmaWxlIGNvdWxkIG5vdCBiZSBjcmVhdGVkLCBidXQgdGhl
IHRlc3QgcmVzdWx0IHdhcyBQQVNTLiBUbyB0aGlzIGVuZCwgdGhlIGZvbGxvd2luZyBvcGVyYXRp
b25zIGhhdmUgYmVlbiBhZGRlZC4NCj4gMS4gY3JlYXRlIHRoZSBkaXJlY3Rvcnkgd2hlcmUgdGhl
IGZpbGUgaXMgbG9jYXRlZC4NCldoeSBuZWVkIHRvIGNyZWF0ZSBkaXJlY3Rvcnk/DQo+IDIuIHJl
d3JpdGUgdGhlIGRpb19hcHBlbmQgQVBJLiBBZGQgcmVsZXZhbnQgcmV0dXJuIHZhbHVlcy4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogZG9uZ3NoaWppYW5nPGRvbmdzaGlqaWFuZ0BpbnNwdXIuY29tPg0K
PiAtLS0NCj4gICB0ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jIHwg
MjYgKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9sdHAtYWlv
ZGlvL2Rpb19hcHBlbmQuYw0KPiBpbmRleCAzZjBlZDI5ZDUuLjUwMGRmZGMzMSAxMDA2NDQNCj4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9pby9sdHAtYWlvZGlvL2Rpb19hcHBlbmQuYw0KPiArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+IEBAIC03NSw3
ICs3NSw3IEBAIGludCByZWFkX2VvZihjaGFyICpmaWxlbmFtZSkNCj4gICAJcmV0dXJuIDA7DQo+
ICAgfQ0KPg0KPiAtdm9pZCBkaW9fYXBwZW5kKGNoYXIgKmZpbGVuYW1lKQ0KPiAraW50IGRpb19h
cHBlbmQoY2hhciAqZmlsZW5hbWUpDQo+ICAgew0KPiAgIAlpbnQgZmQ7DQo+ICAgCXZvaWQgKmJ1
ZnB0cjsNCj4gQEAgLTg2LDE0ICs4NiwxNCBAQCB2b2lkIGRpb19hcHBlbmQoY2hhciAqZmlsZW5h
bWUpDQo+DQo+ICAgCWlmIChmZDwgIDApIHsNCj4gICAJCXBlcnJvcigiY2Fubm90IGNyZWF0ZSBm
aWxlIik7DQo+IC0JCXJldHVybjsNCj4gKwkJcmV0dXJuIDE7DQo+ICAgCX0NCj4NCj4gICAJVEVT
VChwb3NpeF9tZW1hbGlnbigmYnVmcHRyLCA0MDk2LCA2NCAqIDEwMjQpKTsNCj4gICAJaWYgKFRF
U1RfUkVUVVJOKSB7DQo+ICAgCQl0c3RfcmVzbShUQlJPSyB8IFRSRVJSTk8sICJjYW5ub3QgbWFs
bG9jIGFsaWduZWQgbWVtb3J5Iik7DQo+ICAgCQljbG9zZShmZCk7DQo+IC0JCXJldHVybjsNCj4g
KwkJcmV0dXJuIDE7DQo+ICAgCX0NCj4NCj4gICAJbWVtc2V0KGJ1ZnB0ciwgMCwgNjQgKiAxMDI0
KTsNCj4gQEAgLTEwMiwxNyArMTAyLDI5IEBAIHZvaWQgZGlvX2FwcGVuZChjaGFyICpmaWxlbmFt
ZSkNCj4gICAJCQlmcHJpbnRmKHN0ZGVyciwgIndyaXRlICVkIHJldHVybmVkICVkXG4iLCBpLCB3
KTsNCj4gICAJCX0NCj4gICAJfQ0KPiArCXJldHVybiAwOw0KPiAgIH0NCj4NCj4gICBpbnQgbWFp
bih2b2lkKQ0KPiAgIHsNCj4gLQljaGFyIGZpbGVuYW1lW1BBVEhfTUFYXTsNCj4gKwljaGFyIGZp
bGVuYW1lW1BBVEhfTUFYXSwgZmlsZXBhdGhbUEFUSF9NQVgtNV07DQo+ICAgCWludCBwaWRbTlVN
X0NISUxEUkVOXTsNCj4gICAJaW50IG51bV9jaGlsZHJlbiA9IDE7DQo+ICAgCWludCBpOw0KPiAr
CWludCByZXQgPSAtMTsNCj4NCj4gLQlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1l
KSwgIiVzL2Fpb2Rpby9maWxlIiwNCj4gKwlzbnByaW50ZihmaWxlcGF0aCwgc2l6ZW9mKGZpbGVw
YXRoKSwgIiVzL2Fpb2RpbyIsDQo+ICAgCQkgZ2V0ZW52KCJUTVAiKSA/IGdldGVudigiVE1QIikg
OiAiL3RtcCIpOw0KPiArDQo+ICsJaWYgKGFjY2VzcyhmaWxlcGF0aCwgRl9PSykgPT0gLTEpIHsN
Cj4gKwkJY2hhciBjb21tYW5kW1BBVEhfTUFYICsgMTBdOw0KPiArDQo+ICsJCXNucHJpbnRmKGNv
bW1hbmQsIHNpemVvZihjb21tYW5kKSwgIm1rZGlyIC1wICVzIiwgZmlsZXBhdGgpOw0KPiArCQlp
ZiAoc3lzdGVtKGNvbW1hbmQpICE9IDApDQo+ICsJCQlyZXR1cm4gMTsNCmp1c3Qgb25seSBjYWxs
IG1rZGlyIHN5c2NhbGwgaW5zdGVhZCBvZiBjb21tYW5kLg0KPiArCX0NCj4gKw0KPiArCXNucHJp
bnRmKGZpbGVuYW1lLCBzaXplb2YoZmlsZW5hbWUpLCAiJXMvZmlsZSIsIGZpbGVwYXRoKTsNCj4N
Cj4gICAJcHJpbnRmKCJCZWdpbiBkaW9fYXBwZW5kIHRlc3QuLi5cbiIpOw0KPg0KPiBAQCAtMTM0
LDEwICsxNDYsMTAgQEAgaW50IG1haW4odm9pZCkNCj4gICAJICogUGFyZW50IGFwcGVuZHMgdG8g
ZW5kIG9mIGZpbGUgdXNpbmcgZGlyZWN0IGkvbw0KPiAgIAkgKi8NCj4NCj4gLQlkaW9fYXBwZW5k
KGZpbGVuYW1lKTsNCj4gKwlyZXQgPSBkaW9fYXBwZW5kKGZpbGVuYW1lKTsNCj4NCj4gICAJZm9y
IChpID0gMDsgaTwgIG51bV9jaGlsZHJlbjsgaSsrKSB7DQo+ICAgCQlraWxsKHBpZFtpXSwgU0lH
VEVSTSk7DQo+ICAgCX0NCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
