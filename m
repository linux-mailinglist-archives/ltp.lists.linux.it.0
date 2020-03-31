Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC5198A00
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 04:31:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A0CB3C3153
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 04:31:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0CAEF3C312E
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 04:30:57 +0200 (CEST)
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A087E1400DED
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 04:30:56 +0200 (CEST)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id DD9D35DEE4E62BD95E03;
 Tue, 31 Mar 2020 10:30:49 +0800 (CST)
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.149]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0487.000; Tue, 31 Mar 2020 10:30:49 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Xiao Yang <ice_yangxiao@163.com>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v3 1/3] security/dirtyc0w: Fix bug caused by
 default umask
Thread-Index: AQHWBnQ3p/bTYiL/G0a4Bq1HOxfNfKhgVfgAgAA14YCAAW9isA==
Date: Tue, 31 Mar 2020 02:30:48 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E59292BD@dggeml524-mbx.china.huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <1585553269-119544-2-git-send-email-zou_wei@huawei.com>
 <20200330091835.GA9845@yuki.lan> <20200330092046.GB9845@yuki.lan>
 <e08ee1c3-c537-a1ca-01b1-cf7d25d77117@163.com>
In-Reply-To: <e08ee1c3-c537-a1ca-01b1-cf7d25d77117@163.com>
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
Subject: [LTP] =?utf-8?b?562U5aSNOiAgW1BBVENIIHYzIDEvM10gc2VjdXJpdHkvZGly?=
 =?utf-8?q?tyc0w=3A_Fix_bug_caused_by_default_umask?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZyBhbmQgQ3lyaWwsDQoNClRoYW5rIHlvdSBzbyBtdWNoIGZvciBhbGwgeW91ciBzdWdn
ZXN0aW9ucy4NCg0KQmVzdCBSZWdhcmRzDQpab3UgV2VpDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0t
LS0NCuWPkeS7tuS6ujogWGlhbyBZYW5nIFttYWlsdG86aWNlX3lhbmd4aWFvQDE2My5jb21dIA0K
5Y+R6YCB5pe26Ze0OiAyMDIw5bm0M+aciDMw5pelIDIwOjM0DQrmlLbku7bkuro6IEN5cmlsIEhy
dWJpcyA8Y2hydWJpc0BzdXNlLmN6PjsgWm91d2VpIChTYW11ZWwpIDx6b3Vfd2VpQGh1YXdlaS5j
b20+DQrmioTpgIE6IGx0cEBsaXN0cy5saW51eC5pdA0K5Li76aKYOiBSZTogW0xUUF0gW1BBVENI
IHYzIDEvM10gc2VjdXJpdHkvZGlydHljMHc6IEZpeCBidWcgY2F1c2VkIGJ5IGRlZmF1bHQgdW1h
c2sNCg0KT24gMy8zMC8yMCA1OjIwIFBNLCBDeXJpbCBIcnViaXMgd3JvdGU6DQo+IEhpIQ0KPj4+
IFRoZSBjYXNlIGlzIG9ubHkgc3VjY2Vzc2Z1bCB3aGVuIHN5c3RlbSBkZWZhdWx0IHVtYXNrIGlz
IDAwMjIuDQo+Pj4gV2hlbiBkZWZhdWx0IHVtYXNrIGlzIDAwNzcgb3Igb3RoZXIgdmFsdWVzLCBz
aG91bGQgY2xlYXIgY3VycmVudCB1bWFzayBieSB1bWFzaygwKSBpbiBzZXR1cCgpLg0KPj4gV2hh
dCBleGFjdGx5IGZhaWxzIGluIHRoZSBkaXJ0eWMwdyBiZWNhdXNlIG9mIG5vbi1zdGFuZGFyZCB1
bWFzaz8NCj4+DQo+PiBJIGNhbiBlYXNpbHkgdW5kZXJzdGFuZCB3aHkgZnN0YXQgYW5kIHN0YXR4
IGZhaWwsIHNpbmNlIHdlIGNoZWNrIHRoZSANCj4+IGZpbGUgcGVybWlzc2lvbnMgdGhlcmUuIElk
ZWFsbHkgdGhlIGZhaWx1cmUgc2hvdWxkIGhhdmUgYmVlbiBwYXJ0IG9mIA0KPj4gdGhlIHBhdGNo
IGRlc2NyaXB0aW9uLg0KPiBMb29raW5nIGF0IHRoZSBjb2RlIEkgZ3Vlc3MgdGhhdCB0aGUgY2hp
bGQgZmFpbHMgdG8gb3BlbiB0aGUgZmlsZSANCj4gY3JlYXRlZCBpbiBwYXJlbnQgYmVmb3JlIHRo
ZSBzZXRnaWQvc2V0dWlkLCBzb21ldGhpbmcgbGlrZSB0aGlzIHNob3VsZCANCj4gcmVhbGx5IGhh
dmUgYmVlbiBwYXJ0IG9mIHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4NCj4NCkhpIEN5cmlsLA0KDQpS
aWdodCwgc29tZSBkZWZhdWx0IG1hc2sgZHJvcCB0aGUgcmVhZCBwZXJtaXNzaW9uIG9mIGcvbyBh
bmQNCg0Kbm9ib2R5IHVzZXIgY2Fubm90IGRvIHJlYWQuIDotKQ0KDQpUaGFua3MsDQoNClhpYW8g
WWFuZw0KDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
