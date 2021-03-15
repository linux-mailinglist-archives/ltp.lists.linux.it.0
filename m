Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89333B219
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 13:07:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95BC83C2E2B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 13:07:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A50843C23B8
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 13:07:06 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A362A140074A
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 13:07:03 +0100 (CET)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DzZp43GdWzWLXM;
 Mon, 15 Mar 2021 20:03:56 +0800 (CST)
Received: from DGGEML421-HUB.china.huawei.com (10.1.199.38) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 15 Mar 2021 20:06:55 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 dggeml421-hub.china.huawei.com ([10.1.199.38]) with mapi id 14.03.0513.000;
 Mon, 15 Mar 2021 20:06:47 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
Thread-Index: AdcZk5eUDiUopWZdSgWBqCOLZzGDTA==
Date: Mon, 15 Mar 2021 12:06:45 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB403891DF0@dggeml511-mbs.china.huawei.com>
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

SGkgQ3lyaWwsDQoNCkkgbWVhbiB0aGF0IC9kZXYvbG9vcFggbWF5YmUgcmVtb3ZlZCBieSBtaXN0
YWtlIGFmdGVyIHdlIGdldCBhIGZyZWUgbG9vcCBkZXYgL2Rldi9sb29wWC4gQW5kIGluIHRoaXMg
Y2FzZSwgd2UgY291bGQgdHJ5IHRvIGNyZWF0ZSBpdCBvciByZXBvcnQgZXJyb3IgaW5mbyBpbW1l
ZGlhdGVseT8NCg0KQWN0dWFsbHmjrGl0IHNlZW1zIHRoZXJlIGhhcyBubyBTdWZmaWNpZW50IHJl
YXNvbiB0byBkbyBpdC4NCg0KVGhhbmtzIHNvIG11Y2ghDQoNCkJlc3QgUmVnYXJkcywNCkdvbmd5
aQ0KDQo+IA0KPiBIaSENCj4gPiA+IEluIGFkZGl0aW9uLCB3aGVuICJsb29wZGV2bm8gPSBpb2N0
bChmZCwgTE9PUF9DVExfR0VUX0ZSRUUpIiBnZXQNCj4gPiA+IGZyZWUgbG9vcCBkZXZpY2UgaSwg
YW5kIHRoZSBsb29wIGRldmljZSBmaWxlIC9kZXYvbG9vcCVpIGhhcyBiZWVuDQo+IHJlbW92ZWQ/
Pw0KPiA+ID4gc2V0X2Rldl9wYXRoIHdpbGwgcmV0dXJuIDEgYW5kIHNldCAiIC9kZXYvYmxvY2sv
bG9vcCVpICINCj4gPiA+IGluIHBhdGguIEl0IG1pZ2h0IGhhcHBlbmVkIGluIG1hbnkgRW1iZWRk
ZWQgU3lzdGVtcyBiZWNhdXNlIHRoZQ0KPiB0ZXN0DQo+ID4gPiBwcm9jZXNzJ3MgaWQgaXMgcm9v
dCBhbHdheXMuIFNvIHdlIGNvdWxkIGFsc28gQWRkIGV4Y2VwdGlvbiBoYW5kbGluZz8NCj4gPg0K
PiA+IE9yIG1heWJlIHdlIGNhbiB0cnkgdG8gY3JlYXRlIGl0IHdoZW4gbm9kZSBkb2Vzbid0IGV4
aXN0Pw0KPiA+IAlta25vZCgiL2Rldi9sb29wJWkiLCBTX0lGQkxLfDA2NDQsIG1ha2VkZXYoNywg
aSkpDQo+IA0KPiBJIGRvIG5vdCByZWFsbHkgZ2V0IHdoYXQgaGFwcGVucyBvbiB5b3VyIHN5c3Rl
bS4gSXQgbG9va3MgbGlrZSBkZXYgZnMgaXMgbm90DQo+IHByb3Blcmx5IHBvcHVsYXRlZCwgd2hp
Y2ggd291bGQgYmUgYnVnIGluIHlvdXIgc3lzdGVtIHJhdGhlciB0aGFuIGluIHRoZQ0KPiB0ZXN0
IGxpYnJhcnkuDQo+IA0KPiBXaGF0IGlzIHRoZSBzdGF0ZSBvZiAvZGV2L2xvb3AqIGFuZCAvZGV2
L2Jsb2NrL2xvb3AqIGJlZm9yZSB5b3UgYXR0ZW1wdA0KPiB0byBydW4gdGhlIHRlc3Q/DQo+IA0K
PiAtLQ0KPiBDeXJpbCBIcnViaXMNCj4gY2hydWJpc0BzdXNlLmN6DQoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
