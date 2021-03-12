Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62A33894A
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 10:54:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D61753C6834
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 10:54:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 25C5D3C2FDA
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 10:54:54 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 254311401320
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 10:54:53 +0100 (CET)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dxh2S2WxnzYJDn;
 Fri, 12 Mar 2021 17:53:04 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 DGGEML403-HUB.china.huawei.com ([fe80::74d9:c659:fbec:21fa%31]) with mapi id
 14.03.0513.000; Fri, 12 Mar 2021 17:54:34 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
Thread-Index: AdcXDKKG3rO+KmgFT4uW0XxtZwHjpgAF97gQ
Date: Fri, 12 Mar 2021 09:54:34 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB403891318@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhDQo+IEluIGFkZGl0aW9uLCB3aGVuICJsb29wZGV2bm8gPSBpb2N0bChmZCwgTE9PUF9DVExf
R0VUX0ZSRUUpIiBnZXQgZnJlZQ0KPiBsb29wIGRldmljZSBpLCBhbmQgdGhlIGxvb3AgZGV2aWNl
IGZpbGUgL2Rldi9sb29wJWkgaGFzIGJlZW4gcmVtb3ZlZKOsDQo+IHNldF9kZXZfcGF0aCB3aWxs
IHJldHVybiAxIGFuZCBzZXQgIiAvZGV2L2Jsb2NrL2xvb3AlaSAiDQo+IGluIHBhdGguIEl0IG1p
Z2h0IGhhcHBlbmVkIGluIG1hbnkgRW1iZWRkZWQgU3lzdGVtcyBiZWNhdXNlIHRoZSB0ZXN0DQo+
IHByb2Nlc3MncyBpZCBpcyByb290IGFsd2F5cy4gU28gd2UgY291bGQgYWxzbyBBZGQgZXhjZXB0
aW9uIGhhbmRsaW5nPw0KDQpPciBtYXliZSB3ZSBjYW4gdHJ5IHRvIGNyZWF0ZSBpdCB3aGVuIG5v
ZGUgZG9lc24ndCBleGlzdD8NCglta25vZCgiL2Rldi9sb29wJWkiLCBTX0lGQkxLfDA2NDQsIG1h
a2VkZXYoNywgaSkpDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBIaSBQZXRyLCBMaSwNCj4gDQo+IEF0IGZpcnN0LCBp
dCBzZWVtcyBvayB0aGF0IHVzaW5nIFNUX1JFVFJZX0ZVTkMgbWFjcm8gdG8gdHJ5IG1vcmUgdGlt
ZXMgZm9yDQo+IHJhY2UgY29uZGl0aW9uLg0KPiANCj4gSW4gYWRkaXRpb24sIHdoZW4gImxvb3Bk
ZXZubyA9IGlvY3RsKGZkLCBMT09QX0NUTF9HRVRfRlJFRSkiIGdldCBmcmVlDQo+IGxvb3AgZGV2
aWNlIGksIGFuZCB0aGUgbG9vcCBkZXZpY2UgZmlsZSAvZGV2L2xvb3AlaSBoYXMgYmVlbiByZW1v
dmVko6wNCj4gc2V0X2Rldl9wYXRoIHdpbGwgcmV0dXJuIDEgYW5kIHNldCAiIC9kZXYvYmxvY2sv
bG9vcCVpICINCj4gaW4gcGF0aC4gSXQgbWlnaHQgaGFwcGVuZWQgaW4gbWFueSBFbWJlZGRlZCBT
eXN0ZW1zIGJlY2F1c2UgdGhlIHRlc3QNCj4gcHJvY2VzcydzIGlkIGlzIHJvb3QgYWx3YXlzLiBT
byB3ZSBjb3VsZCBhbHNvIEFkZCBleGNlcHRpb24gaGFuZGxpbmc/DQo+IA0KPiBUaGFua3MhDQo+
IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IEdvbmd5aQ0KPiANCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4g
PiA+IEJlY2F1c2Ugb2YgcmFjZSBjb25kaXRpb24gb3IgYWJub3JtYWwgZW52LCBzZXRfZGV2X3Bh
dGggbWF5IGJlDQo+ID4gPiA+IHJldHVybiAxLiBBbmQgd2hlbiBzZXRfZGV2X3BhdGggcmV0dXJu
IDEgaW4gdHN0X2ZpbmRfZnJlZV9sb29wZGV2LA0KPiA+ID4gPiB3ZSBzaG91bGQgcmV0dXJuIElt
bWVkaWF0ZWx5Lg0KPiA+DQo+ID4NCj4gPiA+IElmIHRoZXJlIGV4aXN0cyBhIHJhY2UgY29uZGl0
aW9uLCBJIGZpcnN0bHkgdGhpbmsgb2YgdGhlDQo+ID4gPiBUU1RfUkVUUllfRlVOQyBtYWNybyB0
byB0cnkgbW9yZSB0aW1lcyBmb3IgdGhlIHNldF9kZXZfcGF0aC4gVGhhdA0KPiA+ID4gbWlnaHQg
aGVscCB0byBnZXQgdGhlIGZ1bmN0aW9uIHN1Y2Nlc3MgaW4gdGhlIGZvbGxvdy11cCB0cmllcy4N
Cj4gPg0KPiA+ICsxDQo+ID4NCj4gPiBLaW5kIHJlZ2FyZHMsDQo+ID4gUGV0cg0KCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
