Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B341A0835
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 09:25:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E796A3C2D82
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 09:25:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D47A93C2D78
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 09:25:37 +0200 (CEST)
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3BFC8140110F
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 09:25:35 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 3E5DE7293376C96E870C;
 Tue,  7 Apr 2020 15:25:30 +0800 (CST)
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.149]) by
 DGGEML402-HUB.china.huawei.com ([fe80::fca6:7568:4ee3:c776%31]) with mapi id
 14.03.0487.000; Tue, 7 Apr 2020 15:25:28 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] aio_error/3-1.c: Call write before aio_error
Thread-Index: AQHV/o++p+LPGqFEMU6e+0hCo+EYb6htXAWA
Date: Tue, 7 Apr 2020 07:25:27 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E592EF19@dggeml524-mbx.china.huawei.com>
References: <1584586550-11668-1-git-send-email-zou_wei@huawei.com>
 <6fb895d9-0396-1ee7-429f-ab7ea3ebdf0d@cn.fujitsu.com>
In-Reply-To: <6fb895d9-0396-1ee7-429f-ab7ea3ebdf0d@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gYWlvX2Vycm9yLzMtMS5jOiBD?=
 =?gb2312?b?YWxsIHdyaXRlIGJlZm9yZSBhaW9fZXJyb3I=?=
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

SGkgQWxsLA0KDQpEb2VzIHRoaXMgcGF0Y2ggbmVlZCB0byBiZSB1cGRhdGVkIG9yIG1vZGlmaWVk
Pw0KDQpCZXN0IFJlZ2FyZHMNClpvdSBXZWkNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6
IFlhbmcgWHUgW21haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tXSANCreiy83Ksbzk
OiAyMDIwxOoz1MIyMMjVIDE2OjE1DQrK1bz+yMs6IFpvdXdlaSAoU2FtdWVsKSA8em91X3dlaUBo
dWF3ZWkuY29tPg0Ks63LzTogbHRwQGxpc3RzLmxpbnV4Lml0DQrW98ziOiBSZTogW0xUUF0gW1BB
VENIXSBhaW9fZXJyb3IvMy0xLmM6IENhbGwgd3JpdGUgYmVmb3JlIGFpb19lcnJvcg0KDQpIaSBa
b3UNCg0KPiBJbiB0aGUgY2FzZSwgaWYgdGhlcmUgaXMgbm8gd3JpdGUvcmVhZCBvcGVyYXRpb24g
YmVmb3JlIGFpb19lcnJvciwgDQo+IGFpb19lcnJvciB3aWxsIGp1ZGdlIHRoYXQgdGhlIGN1cnJl
bnQgYXN5bmNocm9ub3VzIEkvTyBoYXMgYmVlbiANCj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZCwg
dGhlbiByZXR1cm4gMCwgY2FzZSBmYWlsZWQuDQo+IA0KPiBBZnRlciB0aGUgd3JpdGUvcmVhZCBv
cGVyYXRpb24gaXMgYWRkZWQsIGJlY2F1c2UgYWlvY2IuYWlvX3JlcXByaW8gaXMgDQo+IC0xLCB0
aGUgd3JpdGUvcmVhZCBvcGVyYXRpb24gd2lsbCByZXR1cm4gLTEsIHNvIGFpb19lcnJvciB3aWxs
IGFsc28gDQo+IHJldHVybiBFSU5WQUwgYmVjYXVzZSBpdCBkZXRlY3RzIHRoYXQgdGhlIGFzeW5j
aHJvbm91cyBJL08gaGFzIG5vdCBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5Lg0KSSBoYXZlIHNlZW4g
Z2xpYmMgY29kZSBhYm91dCBhaW9fd3JpdGUgYW5kIGFpb19lcnIgZnVuY3Rpb24sIHlvdSBhcmUg
cmlnaHQuIFRoYW5rcyBmb3IgdGhlIGZpeC4NCg0KTG9va3MgZ29vZCB0byBtZS4NClJldmlld2Vk
LWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPg0KDQpCZXN0IFJlZ2Fy
ZHMNCllhbmcgWHUNCj4gDQo+IHBzOg0KPiBodHRwOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2Vz
L21hbjMvYWlvX2Vycm9yLjMuaHRtbA0KPiBSRVRVUk4gVkFMVUUNCj4gICAgICAgICBUaGlzIGZ1
bmN0aW9uIHJldHVybnMgb25lIG9mIHRoZSBmb2xsb3dpbmc6DQo+ICAgICAgICAgKiAgRUlOUFJP
R1JFU1MsIGlmIHRoZSByZXF1ZXN0IGhhcyBub3QgYmVlbiBjb21wbGV0ZWQgeWV0Lg0KPiAgICAg
ICAgICogIEVDQU5DRUxFRCwgaWYgdGhlIHJlcXVlc3Qgd2FzIGNhbmNlbGVkLg0KPiAgICAgICAg
ICogIDAsIGlmIHRoZSByZXF1ZXN0IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuDQo+ICAgICAgICAg
KiAgQSBwb3NpdGl2ZSBlcnJvciBudW1iZXIsIGlmIHRoZSBhc3luY2hyb25vdXMgSS9PIG9wZXJh
dGlvbiBmYWlsZWQuDQo+ICAgICAgICAgICAgVGhpcyBpcyB0aGUgc2FtZSB2YWx1ZSB0aGF0IHdv
dWxkIGhhdmUgYmVlbiBzdG9yZWQgaW4gdGhlIGVycm5vDQo+ICAgICAgICAgICAgdmFyaWFibGUg
aW4gdGhlIGNhc2Ugb2YgYSBzeW5jaHJvbm91cyByZWFkKDIpLCB3cml0ZSgyKSwgZnN5bmMoMiks
DQo+ICAgICAgICAgICAgb3IgZmRhdGFzeW5jKDIpIGNhbGwuDQo+IEVSUk9SUw0KPiAgICAgICAg
IEVJTlZBTCBhaW9jYnAgZG9lcyBub3QgcG9pbnQgYXQgYSBjb250cm9sIGJsb2NrIGZvciBhbiBh
c3luY2hyb25vdXMNCj4gICAgICAgICAgICAgICAgSS9PIHJlcXVlc3Qgb2Ygd2hpY2ggdGhlIHJl
dHVybiBzdGF0dXMgKHNlZSBhaW9fcmV0dXJuKDMpKSBoYXMNCj4gICAgICAgICAgICAgICAgbm90
IGJlZW4gcmV0cmlldmVkIHlldC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93
ZWlAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgLi4uL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZv
cm1hbmNlL2ludGVyZmFjZXMvYWlvX2Vycm9yLzMtMS5jICAgICAgfCA1ICsrKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCANCj4gYS90ZXN0
Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9haW9fZXJy
b3IvMy0xLg0KPiBjIA0KPiBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3Jt
YW5jZS9pbnRlcmZhY2VzL2Fpb19lcnJvci8zLTEuDQo+IGMNCj4gaW5kZXggOWNjZGEwNS4uMmIy
YzY1YiAxMDA2NDQNCj4gLS0tIA0KPiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9j
b25mb3JtYW5jZS9pbnRlcmZhY2VzL2Fpb19lcnJvci8zLTEuDQo+IGMNCj4gKysrIGIvdGVzdGNh
c2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvYWlvX2Vycm9y
Lw0KPiArKysgMy0xLmMNCj4gQEAgLTY0LDYgKzY0LDExIEBAIGludCBtYWluKHZvaWQpDQo+ICAg
CWFpb2NiLmFpb19yZXFwcmlvID0gLTE7DQo+ICAgCWFpb2NiLmFpb19uYnl0ZXMgPSBCVUZfU0la
RTsNCj4gDQo+ICsJaWYgKGFpb193cml0ZSgmYWlvY2IpICE9IC0xKSB7DQo+ICsgICAgICAgICAg
ICAgICAgcHJpbnRmKFROQU1FICIgRXJyb3IgYXQgYWlvX3dyaXRlKCk6ICVzXG4iLCBzdHJlcnJv
cihlcnJubykpOw0KPiArICAgICAgICAgICAgICAgIHJldHVybiBQVFNfRkFJTDsNCj4gKyAgICAg
ICAgfQ0KPiArDQo+ICAgCXJldCA9IGFpb19lcnJvcigmYWlvY2IpOw0KPiANCj4gICAJaWYgKHJl
dCAhPSBFSU5WQUwpIHsNCj4gLS0NCj4gMi42LjINCj4gDQo+IA0KDQoNCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
