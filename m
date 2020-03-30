Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE165197271
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 04:30:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CC223C31E4
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 04:30:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EFC773C31BE
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 04:30:02 +0200 (CEST)
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6DDDA1A008BE
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 04:30:00 +0200 (CEST)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id E27E06F04D0AD145C16E;
 Mon, 30 Mar 2020 10:29:56 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 30 Mar 2020 10:29:56 +0800
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.149]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0487.000;
 Mon, 30 Mar 2020 10:29:55 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Xiao Yang <ice_yangxiao@163.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] syscalls/statx: Add judgment to the MODE value
Thread-Index: AQHWBPVikXsKW5sbFEa6viRyn26TQqhgazpg
Date: Mon, 30 Mar 2020 02:29:53 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E5925F39@dggeml524-mbx.china.huawei.com>
References: <1585377584-9931-1-git-send-email-zou_wei@huawei.com>
 <7640be42-53a5-c97e-e4ed-042dc323025a@163.com>
In-Reply-To: <7640be42-53a5-c97e-e4ed-042dc323025a@163.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] =?utf-8?b?562U5aSNOiAgW1BBVENIXSBzeXNjYWxscy9zdGF0eDogQWRk?=
 =?utf-8?q?_judgment_to_the_MODE_value?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQgY29tbWVudHMsIEkgd2lsbCBz
ZW5kIHRoZSB2MiBwYXRjaC4NCg0KQmVzdCBSZWdhcmRzDQpab3UgV2VpDQoNCi0tLS0t6YKu5Lu2
5Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogWGlhbyBZYW5nIFttYWlsdG86aWNlX3lhbmd4aWFvQDE2
My5jb21dIA0K5Y+R6YCB5pe26Ze0OiAyMDIw5bm0M+aciDI45pelIDE5OjM4DQrmlLbku7bkuro6
IFpvdXdlaSAoU2FtdWVsKSA8em91X3dlaUBodWF3ZWkuY29tPjsgbHRwQGxpc3RzLmxpbnV4Lml0
DQrkuLvpopg6IFJlOiBbTFRQXSBbUEFUQ0hdIHN5c2NhbGxzL3N0YXR4OiBBZGQganVkZ21lbnQg
dG8gdGhlIE1PREUgdmFsdWUNCg0KT24gMy8yOC8yMCAyOjM5IFBNLCBab3UgV2VpIHdyb3RlOg0K
PiAxLiBUaGUgZGVmYXVsdCB2YWx1ZSBvZiB1bWFzayBpbiBtb3N0IGxpbnV4IHN5c3RlbXMgaXMg
MDAyMiwgYnV0IGluIHNvbWUgb3RoZXIgc3lzdGVtcyBpcyAwMDc3LA0KPiAgICAgd2hpY2ggcmVz
dWx0cyBpbiBkaWZmZXJlbnQgTU9ERSB2YWx1ZXMgd2hlbiBvcGVuaW5nIGZpbGVzLg0KPg0KPiAy
LiBBZGRpbmcganVkZ21lbnQgdG8gdGhlIE1PREUgdmFsdWUgY2FuIGltcHJvdmUgdGhlIHZlcnNh
dGlsaXR5IG9mIHRoaXMgY2FzZS4NCj4NCj4gMy4gNjMgdHJhbnNsYXRlcyB0byA3NyBpbiBvY3Rh
bCwgbWVhbmluZyB0aGUgcnVubmluZyBwcm9jZXNzIGhhcyBhIHVtYXNrIG9mIDAwMjIuDQo+ICAg
ICBUaGF0IG1lYW5zIHRoZSBwcm9jZXNzIHdpbGwgb3BlbiBmaWxlcyB3aXRoIDA2MDAgYXMgcGVy
bWlzc2lvbnMgb24gdGhlIGZpbGVzeXN0ZW0uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkg
PHpvdV93ZWlAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zdGF0eC9zdGF0eDAxLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N0YXR4L3N0YXR4MDEuYyANCj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N0
YXR4L3N0YXR4MDEuYw0KPiBpbmRleCA0ZjlkNTgyLi5hZGNhMWQzIDEwMDY0NA0KPiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N0YXR4L3N0YXR4MDEuYw0KPiArKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N0YXR4L3N0YXR4MDEuYw0KPiBAQCAtNDcsNyArNDcsNyBAQA0K
PiAgICNkZWZpbmUgVEVTVEZJTEUgInRlc3RfZmlsZSINCj4gICAjZGVmaW5lIE1OVFBPSU5UICJt
bnRwb2ludC8iDQo+ICAgI2RlZmluZSBERVZJQ0VGSUxFIE1OVFBPSU5UImJsa19kZXYiDQo+IC0j
ZGVmaW5lIE1PREUgMDY0NA0KPiArI2RlZmluZSBNT0RFICgodW1hc2soMCk9PTYzKT8wNjAwOjA2
NDQpDQoNCkhpIFpvdSwNCg0KMSkgRm9yIHRoZSBmaXgsIEkgdGhpbmsgeW91IGp1c3QgbmVlZCB0
byBjbGVhciBjdXJyZW50IG1hc2sgYnkgdW1hc2soMCkgaW4gc2V0dXAoKS4NCg0KMikgRG9uJ3Qg
bWl4IHRoZSBmaXggYW5kIGFkZGluZyBjb3ZlcmFnZShpLmUuIGRpZmZlcmVudCBwZXJtaXNzaW9u
cykuIFBsZWFzZSB1c2UNCg0KIMKgwqDCoCBvdGhlciB3YXlzKGNyZWF0ZSB0d28gZmlsZXMgd2l0
aCBkaWZmZXJlbnQgcGVybWlzc2lvbnMgb3IgY2hhbmdlIHRoZSBwZXJtaXNzaW9uDQoNCiDCoMKg
wqAgZHVyaW5nIHRlc3QsIGV0YykgaWYgeW91IHdhbnQgdG8gcnVuIHRlc3Qgd2l0aCBkaWZmZXJl
bnQgcGVybWlzc2lvbnMuDQoNClRoYW5rcywNCg0KWGlhbyBZYW5nDQoNCj4NCj4gICAjZGVmaW5l
IFNJWkUgMjU2DQo+ICAgI2RlZmluZSBNQUpPUiA4DQo+IC0tDQo+IDIuNi4yDQo+DQo+DQoNCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
