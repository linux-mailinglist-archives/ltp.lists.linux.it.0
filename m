Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A452EAB16
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 13:44:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A40C63C31F2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 13:44:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 02B293C231A
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 13:44:17 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 834041A007E3
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 13:44:15 +0100 (CET)
Received: from dggeme715-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4D9Bwc32T2zVwys
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 20:42:40 +0800 (CST)
Received: from dggeme765-chm.china.huawei.com (10.3.19.111) by
 dggeme715-chm.china.huawei.com (10.1.199.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 5 Jan 2021 20:44:09 +0800
Received: from dggeme765-chm.china.huawei.com ([10.6.66.37]) by
 dggeme765-chm.china.huawei.com ([10.6.66.37]) with mapi id 15.01.1913.007;
 Tue, 5 Jan 2021 20:44:09 +0800
From: "luofenglin (A)" <luofenglin1@huawei.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [ping][LTP] [PATCH 1/3] sched/sched_stress: Modify sched driver
Thread-Index: AdbjX/hXuiNhvAVlSoqIqiupPmOuLw==
Date: Tue, 5 Jan 2021 12:44:09 +0000
Message-ID: <d8886954e04a4f8a9e6ef210e63bd14c@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.70]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [ping] [PATCH 1/3] sched/sched_stress: Modify sched driver
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UGluZ6OhDQoNCk1lc3NhZ2U6IDENCkRhdGU6IFR1ZSwgMSBEZWMgMjAyMCAxOTo0OToyNCArMDgw
MA0KRnJvbTogTHVvIEZlbmdsaW4gPGx1b2ZlbmdsaW4xQGh1YXdlaS5jb20+DQpUbzogPGx0cEBs
aXN0cy5saW51eC5pdD4NCkNjOiA8Y2xhaXJlLmNoZW55dWVAaHVhd2VpLmNvbT4sIDxxaWFuZ3Fp
YW5nLndhbmdxaWFuZ0BodWF3ZWkuY29tPiwNCglsdW9mZW5nbGluIDxsdW9mZW5nbGluMUBodWF3
ZWkuY29tPg0KU3ViamVjdDogW0xUUF0gW1BBVENIIDEvM10gc2NoZWQvc2NoZWRfc3RyZXNzOiBN
b2RpZnkgc2NoZWQgZHJpdmVyDQoJcGFyYW0gdG8gcnVuIGxvbmcgdGVybSB0ZXN0Y2FzZXMNCk1l
c3NhZ2UtSUQ6DQoJPDE2MDY4MjMzNjYtMTIxNTIwLTEtZ2l0LXNlbmQtZW1haWwtbHVvZmVuZ2xp
bjFAaHVhd2VpLmNvbT4NCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbg0KDQpGcm9tOiBsdW9mZW5n
bGluIDxsdW9mZW5nbGluMUBodWF3ZWkuY29tPg0KDQpBZGQgc2NoZWRfZHJpdmVyIHByb2Nlc3Mg
c2xvdHMgcGFyYW0gdG8gMTAsIHRoZW4gbG9uZyB0ZXJtIHRlc3RjYXNlcyBjYW4gcnVuLg0KQWRk
aXRpb25hbGx5LCBhZGQgc2NoZWRfZHJpdmVyIHJ1biB0aW1lIDAuMDUgaG91ciwgbG9uZyB0ZXJt
IHRlc3RjYXNlcyBydW4gMS81IG9mIHRvdGFsIHRpbWUuDQoNClNpZ25lZC1vZmYtYnk6IGx1b2Zl
bmdsaW4gPGx1b2ZlbmdsaW4xQGh1YXdlaS5jb20+DQotLS0NCiB0ZXN0Y2FzZXMva2VybmVsL3Nj
aGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9kcml2ZXIuYyAgfCA2ICsrKysrLSAgdGVzdGNhc2VzL2tl
cm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfc3RyZXNzLnNoIHwgMyArKy0NCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX2RyaXZlci5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfZHJpdmVyLmMNCmluZGV4IDYx
NTczZDc4OC4uMWJlZTlkMTMwIDEwMDY0NA0KLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9z
Y2hlZF9zdHJlc3Mvc2NoZWRfZHJpdmVyLmMNCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2NoZWQv
c2NoZWRfc3RyZXNzL3NjaGVkX2RyaXZlci5jDQpAQCAtMjAyLDggKzIwMiwxMiBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQoNCiAJLyoNCiAJICogU3RhcnQgdGhlIGxvbmctdGVy
bSB0ZXN0Y2FzZXMgcnVubmluZw0KKwkgKiBSdW4gdGltZSBzZXQgMS81IG9mIHRvdGFsDQogCSAq
Lw0KLQlzdGFydF9sb25nX3Rlcm1fdGVzdGNhc2VzKGxvbmdfdGVybV9zbG90X3RvdGFsLCBhcmd2
WzJdKTsNCisJY2hhciBydW5fbG9uZ190ZXJtX3RpbWVbMjBdOw0KKwlpbnQgcnVubG9uZ3RpbWUg
PSBydW5zZWNvbmRzIC8gNTsNCisJc3ByaW50ZihydW5fbG9uZ190ZXJtX3RpbWUsICIlZCIsIHJ1
bmxvbmd0aW1lKTsNCisJc3RhcnRfbG9uZ190ZXJtX3Rlc3RjYXNlcyhsb25nX3Rlcm1fc2xvdF90
b3RhbCwgcnVuX2xvbmdfdGVybV90aW1lKTsNCiAJc2hvcnRfdGVybV9zbG90X3RvdGFsID0gd29y
a3Nsb3RzIC8gMjsNCiAJZmZsdXNoKHN0ZG91dCk7DQoNCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9zdHJlc3Muc2ggYi90ZXN0Y2FzZXMva2Vy
bmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9zdHJlc3Muc2gNCmluZGV4IDc5N2QwNjAxYi4u
MDIwNTQ0NmE3IDEwMDc1NQ0KLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJl
c3Mvc2NoZWRfc3RyZXNzLnNoDQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0
cmVzcy9zY2hlZF9zdHJlc3Muc2gNCkBAIC0zMCw2ICszMCw3IEBAIGV4cG9ydCBLRVJORUw9Li9z
Y2hlZF9kYXRhZmlsZSAgdG91Y2ggJEtFUk5FTCAgZWNobyAwLjAwMDAwMCA+IHNjaC5tZWFzdXJl
ICBleHBvcnQgUkFXREVWPWBkZiAvIHwgZ3JlcCBkZXYgfCBhd2sgeydwcmludCAkMSd9YCAtc2No
ZWRfZHJpdmVyIC1zIDAuOSAtdCAwLjAyIC1wIDIgPiAvdG1wL3RtcCQkDQorZWNobyAiUmVzdWx0
IGZpbGU6IC90bXAvdG1wJCQiDQorc2NoZWRfZHJpdmVyIC1zIDAuOSAtdCAwLjA1IC1wIDEwIC1k
ID4gL3RtcC90bXAkJA0KIHRhaWwgLW4gNSAvdG1wL3RtcCQkDQogcm0gLXJmIC90bXAvdG1wJCQg
Li9zY2hlZF9kYXRhZmlsZSBzY2gubWVhc3VyZQ0KLS0NCjIuMTcuMQ0KDQoNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCk1lc3NhZ2U6IDINCkRhdGU6IFR1ZSwgMSBEZWMgMjAy
MCAxOTo0OToyNSArMDgwMA0KRnJvbTogTHVvIEZlbmdsaW4gPGx1b2ZlbmdsaW4xQGh1YXdlaS5j
b20+DQpUbzogPGx0cEBsaXN0cy5saW51eC5pdD4NCkNjOiA8Y2xhaXJlLmNoZW55dWVAaHVhd2Vp
LmNvbT4sIDxxaWFuZ3FpYW5nLndhbmdxaWFuZ0BodWF3ZWkuY29tPiwNCglsdW9mZW5nbGluIDxs
dW9mZW5nbGluMUBodWF3ZWkuY29tPg0KU3ViamVjdDogW0xUUF0gW1BBVENIIDIvM10gc2NoZWQv
c2NoZWRfc3RyZXNzOiBGaXhlZCBwYXJhbSBvZiBzY2hlZF90Yw0KTWVzc2FnZS1JRDoNCgk8MTYw
NjgyMzM2Ni0xMjE1MjAtMi1naXQtc2VuZC1lbWFpbC1sdW9mZW5nbGluMUBodWF3ZWkuY29tPg0K
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluDQoNCkZyb206IGx1b2ZlbmdsaW4gPGx1b2ZlbmdsaW4x
QGh1YXdlaS5jb20+DQoNClJ0IGZsYWcgb2Ygc2NoZWRfdGMgbXVzdCBsaWtlICItcGZpeGVkIiBv
ciAiLXB2YXJpYWJsZSINCg0KU2lnbmVkLW9mZi1ieTogbHVvZmVuZ2xpbiA8bHVvZmVuZ2xpbjFA
aHVhd2VpLmNvbT4NCi0tLQ0KIC4uLi9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX2Ry
aXZlci5jICB8IDUxICsrKysrKysrKystLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9kcml2ZXIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX2RyaXZlci5jDQppbmRleCAxYmVlOWQxMzAuLjQ3NTM2
OWI0NiAxMDA2NDQNCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3Nj
aGVkX2RyaXZlci5jDQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9z
Y2hlZF9kcml2ZXIuYw0KQEAgLTYyMSwyNSArNjIxLDI4IEBAIGNoYXIgKmV4ZWN1dGlvbl90aW1l
OwkJLyogcnVudGltZSBob3VycyB0byBwYXNzIHRvIGVhY2ggdGVzdGNhc2UgKi8NCiAJCXByaW50
ZigibG9uZy10ZXJtIHNsb3RzIGF2YWlsYWJsZTogICVkXG4iLA0KIAkJICAgICAgIGxvbmdfdGVy
bV9zbG90X3RvdGFsKTsNCg0KKwljaGFyIHRpbWVwYXJhbVszMF07DQorCXNwcmludGYodGltZXBh
cmFtLCAiLXQlcyIsIGV4ZWN1dGlvbl90aW1lKTsNCisNCiAJZm9yIChpID0gMDsgaSA8IChsb25n
X3Rlcm1fc2xvdF90b3RhbCAvIDQpOyBpKyspIHsgICNpZiBkZWZpbmVkKF9JQTY0KSAmJiAhZGVm
aW5lZChfXzY0QklUX18pDQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzAuMzIiLCAic2No
ZWRfdGMwIC10IiwgZXhlY3V0aW9uX3RpbWUsDQotCQkJICAgICAgICIgLXAxIiwgTlVMTCwgTlVM
TCk7DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzIuMzIiLCAic2NoZWRfdGMyIiwgZXhl
Y3V0aW9uX3RpbWUsDQotCQkJICAgICAgICIxIiwgTlVMTCwgTlVMTCk7DQotCQlzdGFydF90ZXN0
Y2FzZSgiLi9zY2hlZF90YzAuMzIiLCAic2NoZWRfdGMwIC10IiwgZXhlY3V0aW9uX3RpbWUsDQot
CQkJICAgICAgICIgLXAwIiwgTlVMTCwgTlVMTCk7DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hl
ZF90YzIuMzIiLCAic2NoZWRfdGMyIiwgZXhlY3V0aW9uX3RpbWUsDQotCQkJICAgICAgICIwIiwg
TlVMTCwgTlVMTCk7DQorCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzAuMzIiLCAic2NoZWRf
dGMwIiwgdGltZXBhcmFtLA0KKwkJCSAgICAgICAiLXBmaXhlZCIsICItZCIsIE5VTEwpOw0KKwkJ
c3RhcnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMyLjMyIiwgInNjaGVkX3RjMiIsIHRpbWVwYXJhbSwN
CisJCQkgICAgICAgIi1wZml4ZWQiLCAiLWQiLCBOVUxMKTsNCisJCXN0YXJ0X3Rlc3RjYXNlKCIu
L3NjaGVkX3RjMC4zMiIsICJzY2hlZF90YzAiLCB0aW1lcGFyYW0sDQorCQkJICAgICAgICItcHZh
cmlhYmxlIiwgIi1kIiwgTlVMTCk7DQorCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzIuMzIi
LCAic2NoZWRfdGMyIiwgdGltZXBhcmFtLA0KKwkJCSAgICAgICAiLXB2YXJpYWJsZSIsICItZCIs
IE5VTEwpOw0KICNlbHNlDQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzAiLCAic2NoZWRf
dGMwIC10IiwgZXhlY3V0aW9uX3RpbWUsDQotCQkJICAgICAgICIgLXAxIiwgTlVMTCwgTlVMTCk7
DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzIiLCAic2NoZWRfdGMyIiwgZXhlY3V0aW9u
X3RpbWUsICIxIiwNCi0JCQkgICAgICAgTlVMTCwgTlVMTCk7DQotCQlzdGFydF90ZXN0Y2FzZSgi
Li9zY2hlZF90YzAiLCAic2NoZWRfdGMwIC10IiwgZXhlY3V0aW9uX3RpbWUsDQotCQkJICAgICAg
ICIgLXAwIiwgTlVMTCwgTlVMTCk7DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzIiLCAi
c2NoZWRfdGMyIiwgZXhlY3V0aW9uX3RpbWUsICIwIiwNCi0JCQkgICAgICAgTlVMTCwgTlVMTCk7
DQorCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzAiLCAic2NoZWRfdGMwIiwgdGltZXBhcmFt
LA0KKwkJCSAgICAgICAiLXBmaXhlZCIsICItZCIsIE5VTEwpOw0KKwkJc3RhcnRfdGVzdGNhc2Uo
Ii4vc2NoZWRfdGMyIiwgInNjaGVkX3RjMiIsIHRpbWVwYXJhbSwgIi1wZml4ZWQiLA0KKwkJCSAg
ICAgICAiLWQiLCBOVUxMKTsNCisJCXN0YXJ0X3Rlc3RjYXNlKCIuL3NjaGVkX3RjMCIsICJzY2hl
ZF90YzAiLCB0aW1lcGFyYW0sDQorCQkJICAgICAgICItcHZhcmlhYmxlIiwgIi1kIiwgTlVMTCk7
DQorCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzIiLCAic2NoZWRfdGMyIiwgdGltZXBhcmFt
LCAiLXB2YXJpYWJsZSIsDQorCQkJICAgICAgICItZCIsIE5VTEwpOw0KICNlbmRpZg0KIAl9DQog
fQ0KQEAgLTY3NCwyMiArNjc3LDIyIEBAIHZvaWQgc3RhcnRfc2hvcnRfdGVybV90ZXN0Y2FzZXMo
aW50IHNob3J0X3Rlcm1fc2xvdF90b3RhbCwNCg0KIAlmb3IgKGkgPSAwOyBpIDwgKHNob3J0X3Rl
cm1fc2xvdHMgLyA0KTsgaSsrKSB7ICAjaWYgZGVmaW5lZChfSUE2NCkgJiYgIWRlZmluZWQoX182
NEJJVF9fKQ0KLQkJc3RhcnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMxLjMyIiwgInNjaGVkX3RjMSIs
ICIxIiwgTlVMTCwgTlVMTCwNCisJCXN0YXJ0X3Rlc3RjYXNlKCIuL3NjaGVkX3RjMS4zMiIsICJz
Y2hlZF90YzEiLCAiLXBmaXhlZCIsICItZCIsIE5VTEwsDQogCQkJICAgICAgIE5VTEwpOw0KLQkJ
c3RhcnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMzLjMyIiwgInNjaGVkX3RjMyIsICIxIiwgTlVMTCwg
TlVMTCwNCisJCXN0YXJ0X3Rlc3RjYXNlKCIuL3NjaGVkX3RjMy4zMiIsICJzY2hlZF90YzMiLCAi
LXBmaXhlZCIsICItZCIsIE5VTEwsDQogCQkJICAgICAgIE5VTEwpOw0KLQkJc3RhcnRfdGVzdGNh
c2UoIi4vc2NoZWRfdGMxLjMyIiwgInNjaGVkX3RjMSIsICIwIiwgTlVMTCwgTlVMTCwNCisJCXN0
YXJ0X3Rlc3RjYXNlKCIuL3NjaGVkX3RjMS4zMiIsICJzY2hlZF90YzEiLCAiLXB2YXJpYWJsZSIs
ICItZCIsIA0KK05VTEwsDQogCQkJICAgICAgIE5VTEwpOw0KLQkJc3RhcnRfdGVzdGNhc2UoIi4v
c2NoZWRfdGMzLjMyIiwgInNjaGVkX3RjMyIsICIwIiwgTlVMTCwgTlVMTCwNCisJCXN0YXJ0X3Rl
c3RjYXNlKCIuL3NjaGVkX3RjMy4zMiIsICJzY2hlZF90YzMiLCAiLXB2YXJpYWJsZSIsICItZCIs
IA0KK05VTEwsDQogCQkJICAgICAgIE5VTEwpOw0KICNlbHNlDQotCQlzdGFydF90ZXN0Y2FzZSgi
Li9zY2hlZF90YzEiLCAic2NoZWRfdGMxIiwgIjEiLCBOVUxMLCBOVUxMLA0KKwkJc3RhcnRfdGVz
dGNhc2UoIi4vc2NoZWRfdGMxIiwgInNjaGVkX3RjMSIsICItcGZpeGVkIiwgIi1kIiwgTlVMTCwN
CiAJCQkgICAgICAgTlVMTCk7DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzMiLCAic2No
ZWRfdGMzIiwgIjEiLCBOVUxMLCBOVUxMLA0KKwkJc3RhcnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMz
IiwgInNjaGVkX3RjMyIsICItcGZpeGVkIiwgIi1kIiwgTlVMTCwNCiAJCQkgICAgICAgTlVMTCk7
DQotCQlzdGFydF90ZXN0Y2FzZSgiLi9zY2hlZF90YzEiLCAic2NoZWRfdGMxIiwgIjAiLCBOVUxM
LCBOVUxMLA0KKwkJc3RhcnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMxIiwgInNjaGVkX3RjMSIsICIt
cHZhcmlhYmxlIiwgIi1kIiwgTlVMTCwNCiAJCQkgICAgICAgTlVMTCk7DQotCQlzdGFydF90ZXN0
Y2FzZSgiLi9zY2hlZF90YzMiLCAic2NoZWRfdGMzIiwgIjAiLCBOVUxMLCBOVUxMLA0KKwkJc3Rh
cnRfdGVzdGNhc2UoIi4vc2NoZWRfdGMzIiwgInNjaGVkX3RjMyIsICItcHZhcmlhYmxlIiwgIi1k
IiwgTlVMTCwNCiAJCQkgICAgICAgTlVMTCk7DQogI2VuZGlmDQogI2lmIDANCi0tDQoyLjE3LjEN
Cg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpNZXNzYWdlOiAzDQpEYXRl
OiBUdWUsIDEgRGVjIDIwMjAgMTk6NDk6MjYgKzA4MDANCkZyb206IEx1byBGZW5nbGluIDxsdW9m
ZW5nbGluMUBodWF3ZWkuY29tPg0KVG86IDxsdHBAbGlzdHMubGludXguaXQ+DQpDYzogPGNsYWly
ZS5jaGVueXVlQGh1YXdlaS5jb20+LCA8cWlhbmdxaWFuZy53YW5ncWlhbmdAaHVhd2VpLmNvbT4s
DQoJbHVvZmVuZ2xpbiA8bHVvZmVuZ2xpbjFAaHVhd2VpLmNvbT4NClN1YmplY3Q6IFtMVFBdIFtQ
QVRDSCAzLzNdIHNjaGVkL3NjaGVkX3N0cmVzczogQnVnZml4IGZvciBzZXR0aW5nIHJlYWwNCgl0
aW1lIHByaW9yaXR5DQpNZXNzYWdlLUlEOg0KCTwxNjA2ODIzMzY2LTEyMTUyMC0zLWdpdC1zZW5k
LWVtYWlsLWx1b2ZlbmdsaW4xQGh1YXdlaS5jb20+DQpDb250ZW50LVR5cGU6IHRleHQvcGxhaW4N
Cg0KRnJvbTogbHVvZmVuZ2xpbiA8bHVvZmVuZ2xpbjFAaHVhd2VpLmNvbT4NCg0KV2hlbiByZWFs
IHRpbWUgZmxhZyBpcyBzZXQsIHNldHByaW9yaXR5IGZ1bmN0aW9uIGlzIHVzZWQgZm9yIHVzZXIt
dGltZSBwb2xpY3kgc2V0dGluZywgaGVyZSB1c2Ugc2NoZWRfc2V0c2NoZWR1bGVyIHRvIHNldCBy
ZWFsIHRpbWUgcG9saWN5IFJSIGluc3RlYWQNCg0KU2lnbmVkLW9mZi1ieTogbHVvZmVuZ2xpbiA8
bHVvZmVuZ2xpbjFAaHVhd2VpLmNvbT4NCi0tLQ0KIHRlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2No
ZWRfc3RyZXNzL3NjaGVkLmggICAgIHwgIDIgKysNCiB0ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3Nj
aGVkX3N0cmVzcy9zY2hlZF90YzAuYyB8IDEwICsrKysrKy0tLS0gIHRlc3RjYXNlcy9rZXJuZWwv
c2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX3RjMS5jIHwgMTAgKysrKysrLS0tLSAgdGVzdGNhc2Vz
L2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGMyLmMgfCAxMCArKysrKystLS0tICB0
ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzMuYyB8IDEwICsrKysr
Ky0tLS0gIHRlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX3RjNC5jIHwg
IDkgKysrKystLS0tICB0ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90
YzUuYyB8ICA5ICsrKysrLS0tLSAgdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mv
c2NoZWRfdGM2LmMgfCAgOCArKysrKy0tLQ0KIDggZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9u
cygrKSwgMjcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3Nj
aGVkL3NjaGVkX3N0cmVzcy9zY2hlZC5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9z
dHJlc3Mvc2NoZWQuaA0KaW5kZXggOGVkOTQxZWJhLi5iY2RlY2FjYzUgMTAwNjQ0DQotLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZC5oDQorKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZC5oDQpAQCAtNDYsOCArNDYsMTAgQEAN
CiAjaW5jbHVkZSA8dGltZS5oPg0KICNpbmNsdWRlIDxlcnJuby5oPg0KICNpbmNsdWRlIDxzdGRp
by5oPg0KKyNpbmNsdWRlIDxzY2hlZC5oPg0KDQogI2RlZmluZSBERUZBVUxUX1BSSU9SSVRZIDcw
DQorI2RlZmluZSBTRVRfUlRfU0NIRURVTEVSKHBhcmFBLCBwYXJhQiwgcGFyYUMpIHNjaGVkX3Nl
dHNjaGVkdWxlcihwYXJhQSwgDQorcGFyYUIsIHBhcmFDKQ0KDQogI2lmIDANCiBpbnQgIG9wZW5s
b2cgKGNoYXIgKik7DQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9z
dHJlc3Mvc2NoZWRfdGMwLmMgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9z
Y2hlZF90YzAuYw0KaW5kZXggOWFjYmMyZjU4Li4yOTBhZDFlNjMgMTAwNjQ0DQotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzAuYw0KKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGMwLmMNCkBAIC05MCw3ICs5MCw5
IEBAIGludCB2ZXJib3NlID0gMDsNCiBpbnQgZGVidWcgPSAwOw0KIGxvbmcgZXhlY3V0aW9uX3Rp
bWUgPSBERUZBVUxUX0VYRUNVVElPTl9USU1FOyAgY2hhciAqcHJpb3JpdHkgPSBERUZBVUxUX1BS
SU9SSVRZX1RZUEU7DQotDQorc3RydWN0IHNjaGVkX3BhcmFtIHBhcmFtID0gew0KKwkJLnNjaGVk
X3ByaW9yaXR5ID0gREVGQVVMVF9QUklPUklUWQ0KK307DQogLyotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQogfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1haW4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8DQogfCA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PSB8IEBAIC0xMjcsMTAgKzEyOSwxMCBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQogCWlmICghc3RyY21wKHByaW9yaXR5LCAiZml4
ZWQiKSkgew0KICNpZm5kZWYgX19saW51eF9fDQogCQlpZiAoc2V0cHJpKDAsIERFRkFVTFRfUFJJ
T1JJVFkpIDwgMCkNCi0JCQlzeXNfZXJyb3IoInNldHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19M
SU5FX18pOw0KKwkJCXN5c19lcnJvcigic2V0IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19M
SU5FX18pOw0KICNlbHNlDQotCQlpZiAoc2V0cHJpb3JpdHkoUFJJT19QUk9DRVNTLCAwLCAwKSA8
IDApDQotCQkJc3lzX2Vycm9yKCJzZXRwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsN
CisJCWlmIChTRVRfUlRfU0NIRURVTEVSKDAsIFNDSEVEX1JSLCAmcGFyYW0pIDwgMCkNCisJCQlz
eXNfZXJyb3IoInNldCBydCBwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCiAjZW5k
aWYNCiAJfQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJl
c3Mvc2NoZWRfdGMxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hl
ZF90YzEuYw0KaW5kZXggYzc3MWVmNDIxLi4xN2QzMmNkOWQgMTAwNjQ0DQotLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzEuYw0KKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGMxLmMNCkBAIC03Miw3ICs3Miw5IEBA
DQogdm9pZCBwcm9jZXNzX2ZpbGUoY2hhciAqKTsNCiB2b2lkIHBhcnNlX2FyZ3MoaW50LCBjaGFy
ICoqKTsNCiB2b2lkIHNpZ25hbF9oYW5kbGVyKCk7DQotDQorc3RydWN0IHNjaGVkX3BhcmFtIHBh
cmFtID0gew0KKwkuc2NoZWRfcHJpb3JpdHkgPSBERUZBVUxUX1BSSU9SSVRZDQorfTsNCiAvKg0K
ICAqIEdsb2JhbCB2YXJpYWJsZXM6DQogICoNCkBAIC0xMjgsMTAgKzEzMCwxMCBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQogCWlmICghc3RyY21wKHByaW9yaXR5LCAiZml4ZWQi
KSkgew0KICNpZm5kZWYgX19saW51eF9fDQogCQlpZiAoc2V0cHJpKDAsIERFRkFVTFRfUFJJT1JJ
VFkpIDwgMCkNCi0JCQlzeXNfZXJyb3IoInNldHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5F
X18pOw0KKwkJCXN5c19lcnJvcigic2V0IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5F
X18pOw0KICNlbHNlDQotCQlpZiAoc2V0cHJpb3JpdHkoUFJJT19QUk9DRVNTLCAwLCAwKSA8IDAp
DQotCQkJc3lzX2Vycm9yKCJzZXRwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCisJ
CWlmIChTRVRfUlRfU0NIRURVTEVSKDAsIFNDSEVEX1JSLCAmcGFyYW0pIDwgMCkNCisJCQlzeXNf
ZXJyb3IoInNldCBydCBwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCiAjZW5kaWYN
CiAJfQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mv
c2NoZWRfdGMyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90
YzIuYw0KaW5kZXggMWUyZTNlNjI5Li5lZjkwY2ZkMmQgMTAwNjQ0DQotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzIuYw0KKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGMyLmMNCkBAIC00Nyw3ICs0Nyw5IEBADQog
I2luY2x1ZGUgPHN5cy90aW1lLmg+DQogI2luY2x1ZGUgPHN5cy9yZXNvdXJjZS5oPg0KICNpbmNs
dWRlICAgInNjaGVkLmgiDQotDQorc3RydWN0IHNjaGVkX3BhcmFtIHBhcmFtID0gew0KKwkuc2No
ZWRfcHJpb3JpdHkgPSBERUZBVUxUX1BSSU9SSVRZDQorfTsNCiAvKg0KICAqIERlZmluZXM6DQog
ICoNCkBAIC0xMjksMTAgKzEzMSwxMCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3Yp
DQogCWlmICghc3RyY21wKHByaW9yaXR5LCAiZml4ZWQiKSkgew0KICNpZm5kZWYgX19saW51eF9f
DQogCQlpZiAoc2V0cHJpKDAsIERFRkFVTFRfUFJJT1JJVFkpIDwgMCkNCi0JCQlzeXNfZXJyb3Io
InNldHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KKwkJCXN5c19lcnJvcigic2V0
IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KICNlbHNlDQotCQlpZiAoc2V0
cHJpb3JpdHkoUFJJT19QUk9DRVNTLCAwLCAwKSA8IDApDQotCQkJc3lzX2Vycm9yKCJzZXRwcmkg
ZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCisJCWlmIChTRVRfUlRfU0NIRURVTEVSKDAs
IFNDSEVEX1JSLCAmcGFyYW0pIDwgMCkNCisJCQlzeXNfZXJyb3IoInNldCBydCBwcmkgZmFpbGVk
IiwgX19GSUxFX18sIF9fTElORV9fKTsNCiAjZW5kaWYNCiAJfQ0KDQpkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGMzLmMgYi90ZXN0Y2FzZXMv
a2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzMuYw0KaW5kZXggODA2NGU5ZWRhLi45
MTM2NjIxNzIgMTAwNjQ0DQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVz
cy9zY2hlZF90YzMuYw0KKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mv
c2NoZWRfdGMzLmMNCkBAIC05NSw3ICs5NSw5IEBAIGludCB2ZXJib3NlID0gMDsNCiBpbnQgZGVi
dWcgPSAwOw0KIGludCBzaWduYWxlZCA9IDA7DQogY2hhciAqcHJpb3JpdHkgPSBERUZBVUxUX1BS
SU9SSVRZX1RZUEU7DQotDQorc3RydWN0IHNjaGVkX3BhcmFtIHBhcmFtID0gew0KKwkuc2NoZWRf
cHJpb3JpdHkgPSBERUZBVUxUX1BSSU9SSVRZDQorfTsNCiAvKi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFpbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwNCiB8ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09IHwgQEAgLTEzMSwxMCArMTMzLDEwIEBAIGludCBt
YWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCiAJaWYgKCFzdHJjbXAocHJpb3JpdHksICJmaXhl
ZCIpKSB7DQogI2lmbmRlZiBfX2xpbnV4X18NCiAJCWlmIChzZXRwcmkoMCwgREVGQVVMVF9QUklP
UklUWSkgPCAwKQ0KLQkJCXN5c19lcnJvcigic2V0cHJpIGZhaWxlZCIsIF9fRklMRV9fLCBfX0xJ
TkVfXyk7DQorCQkJc3lzX2Vycm9yKCJzZXQgcnQgcHJpIGZhaWxlZCIsIF9fRklMRV9fLCBfX0xJ
TkVfXyk7DQogI2Vsc2UNCi0JCWlmIChzZXRwcmlvcml0eShQUklPX1BST0NFU1MsIDAsIDApIDwg
MCkNCi0JCQlzeXNfZXJyb3IoInNldHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0K
KwkJaWYgKFNFVF9SVF9TQ0hFRFVMRVIoMCwgU0NIRURfUlIsICZwYXJhbSkgPCAwKQ0KKwkJCXN5
c19lcnJvcigic2V0IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KICNlbmRp
Zg0KIAl9DQoNCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVz
cy9zY2hlZF90YzQuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVk
X3RjNC5jDQppbmRleCA1YmZmYjY0NzguLjgxYThlMTcwYyAxMDA2NDQNCi0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX3RjNC5jDQorKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzQuYw0KQEAgLTk5LDcgKzk5LDcgQEAg
aW50IGRlYnVnID0gMDsNCiBpbnQgcHJpb3JpdHkgPSBERUZBVUxUX1BSSU9SSVRZOw0KIGNoYXIg
KmxvZ2ZpbGUgPSBERUZBVUxUX0xPR0ZJTEU7DQogY2hhciAqcHJpb3JpdHlfdHlwZSA9IERFRkFV
TFRfUFJJT1JJVFlfVFlQRTsNCi0NCitzdHJ1Y3Qgc2NoZWRfcGFyYW0gcGFyYW07DQogLyotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rDQogfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1haW4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8DQogfCA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSB8IEBAIC0xMzMsMTAg
KzEzMywxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQogCWlmICghc3RyY21w
KHByaW9yaXR5X3R5cGUsICJmaXhlZCIpKSB7ICAjaWZuZGVmIF9fbGludXhfXw0KIAkJaWYgKHNl
dHByaSgwLCBERUZBVUxUX1BSSU9SSVRZKSA8IDApDQotCQkJc3lzX2Vycm9yKCJzZXRwcmkgZmFp
bGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCisJCQlzeXNfZXJyb3IoInNldCBydCBwcmkgZmFp
bGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCiAjZWxzZQ0KLQkJaWYgKHNldHByaW9yaXR5KFBS
SU9fUFJPQ0VTUywgMCwgMCkgPCAwKQ0KLQkJCXN5c19lcnJvcigic2V0cHJpIGZhaWxlZCIsIF9f
RklMRV9fLCBfX0xJTkVfXyk7DQorCQlwYXJhbS5zY2hlZF9wcmlvcml0eSA9IHByaW9yaXR5Ow0K
KwkJaWYgKFNFVF9SVF9TQ0hFRFVMRVIoMCwgU0NIRURfUlIsICZwYXJhbSkgPCAwKQ0KKwkJCXN5
c19lcnJvcigic2V0IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KICNlbmRp
Zg0KIAl9IGVsc2Ugew0KIAkJaWYgKG5pY2UoKHByaW9yaXR5IC0gNTApIC0gKG5pY2UoMCkgKyAy
MCkpIDwgMCAmJiBlcnJubyAhPSAwKSBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hl
ZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGM1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVk
X3N0cmVzcy9zY2hlZF90YzUuYw0KaW5kZXggZGI1Y2U5NjNjLi5jMzE1ZjlhZGUgMTAwNjQ0DQot
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF90YzUuYw0KKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGM1LmMNCkBAIC05
NSw3ICs5NSw3IEBAIGludCBkZWJ1ZyA9IDA7DQogaW50IHByaW9yaXR5ID0gREVGQVVMVF9QUklP
UklUWTsNCiBjaGFyICpsb2dmaWxlID0gREVGQVVMVF9MT0dGSUxFOw0KIGNoYXIgKnByaW9yaXR5
X3R5cGUgPSBERUZBVUxUX1BSSU9SSVRZX1RZUEU7DQotDQorc3RydWN0IHNjaGVkX3BhcmFtIHBh
cmFtOw0KIC8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KIHwgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0g
fCBAQCAtMTMwLDEwICsxMzAsMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0K
IAlpZiAoIXN0cmNtcChwcmlvcml0eV90eXBlLCAiZml4ZWQiKSkgeyAgI2lmbmRlZiBfX2xpbnV4
X18NCiAJCWlmIChzZXRwcmkoMCwgREVGQVVMVF9QUklPUklUWSkgPCAwKQ0KLQkJCXN5c19lcnJv
cigic2V0cHJpIGZhaWxlZCIsIF9fRklMRV9fLCBfX0xJTkVfXyk7DQorCQkJc3lzX2Vycm9yKCJz
ZXQgcnQgcHJpIGZhaWxlZCIsIF9fRklMRV9fLCBfX0xJTkVfXyk7DQogI2Vsc2UNCi0JCWlmIChz
ZXRwcmlvcml0eShQUklPX1BST0NFU1MsIDAsIDApIDwgMCkNCi0JCQlzeXNfZXJyb3IoInNldHBy
aSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KKwkJcGFyYW0uc2NoZWRfcHJpb3JpdHkg
PSBwcmlvcml0eTsNCisJCWlmIChTRVRfUlRfU0NIRURVTEVSKDAsIFNDSEVEX1JSLCAmcGFyYW0p
IDwgMCkNCisJCQlzeXNfZXJyb3IoInNldCBydCBwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElO
RV9fKTsNCiAjZW5kaWYNCiAJfSBlbHNlIHsNCiAJCWlmIChuaWNlKChwcmlvcml0eSAtIDUwKSAt
IChuaWNlKDApICsgMjApKSA8IDAgJiYgZXJybm8gIT0gMCkgZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX3RjNi5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfdGM2LmMNCmluZGV4IGU3MGU4ZjI1MC4uMjA5ODdm
NTcxIDEwMDY0NA0KLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2No
ZWRfdGM2LmMNCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVk
X3RjNi5jDQpAQCAtMTE3LDYgKzExNyw3IEBAIGNoYXIgKmxvZ2ZpbGUgPSBERUZBVUxUX0xPR0ZJ
TEU7ICBjaGFyICpwcmlvcml0eV90eXBlID0gREVGQVVMVF9QUklPUklUWV9UWVBFOyAgc3RydWN0
IGZsb2NrIGZsb2NrX3N0cnVjdDsgIHN0cnVjdCBmbG9jayAqZmxvY2tfcHRyID0gJmZsb2NrX3N0
cnVjdDsNCitzdHJ1Y3Qgc2NoZWRfcGFyYW0gcGFyYW07DQoNCiBpbnQgb3Blbl9maWxlKGNoYXIg
KiwgaW50KTsNCg0KQEAgLTE2MywxMCArMTY0LDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikNCiAJaWYgKCFzdHJjbXAocHJpb3JpdHlfdHlwZSwgImZpeGVkIikpIHsgICNpZm5k
ZWYgX19saW51eF9fDQogCQlpZiAoc2V0cHJpKDAsIERFRkFVTFRfUFJJT1JJVFkpIDwgMCkNCi0J
CQlzeXNfZXJyb3IoInNldHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KKwkJCXN5
c19lcnJvcigic2V0IHJ0IHByaSBmYWlsZWQiLCBfX0ZJTEVfXywgX19MSU5FX18pOw0KICNlbHNl
DQotCQlpZiAoc2V0cHJpb3JpdHkoUFJJT19QUk9DRVNTLCAwLCAwKSA8IDApDQotCQkJc3lzX2Vy
cm9yKCJzZXRwcmkgZmFpbGVkIiwgX19GSUxFX18sIF9fTElORV9fKTsNCisJCXBhcmFtLnNjaGVk
X3ByaW9yaXR5ID0gcHJpb3JpdHk7DQorCQlpZiAoU0VUX1JUX1NDSEVEVUxFUigwLCBTQ0hFRF9S
UiwgJnBhcmFtKSA8IDApDQorCQkJc3lzX2Vycm9yKCJzZXQgcnQgcHJpIGZhaWxlZCIsIF9fRklM
RV9fLCBfX0xJTkVfXyk7DQogI2VuZGlmDQogCX0gZWxzZSB7DQogCQlpZiAobmljZSgocHJpb3Jp
dHkgLSA1MCkgLSAobmljZSgwKSArIDIwKSkgPCAwICYmIGVycm5vICE9IDApDQotLQ0KMi4xNy4x
DQoNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KU3ViamVjdDogRGlnZXN0
IEZvb3Rlcg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KbHRwIG1haWxpbmcgbGlzdA0KbHRwQGxpc3RzLmxpbnV4Lml0DQpodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cA0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
DQpFbmQgb2YgbHRwIERpZ2VzdCwgVm9sIDY0LCBJc3N1ZSA0DQoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
