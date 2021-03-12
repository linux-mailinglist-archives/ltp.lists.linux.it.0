Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CCE338679
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 08:19:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9C2E3C3022
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 08:19:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D7D5C3C2F9F
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 08:19:05 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7F225601BCD
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 08:19:03 +0100 (CET)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DxcZk0GdzzRP2t;
 Fri, 12 Mar 2021 15:17:18 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 12 Mar 2021 15:18:57 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0513.000;
 Fri, 12 Mar 2021 15:18:51 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] lib/tst_device.c: Add exception handling of
 function tst_find_free_loopdev
Thread-Index: AdcXDKKG3rO+KmgFT4uW0XxtZwHjpg==
Date: Fri, 12 Mar 2021 07:18:51 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038910A5@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

SGkgUGV0ciwgTGksDQoNCkF0IGZpcnN0LCBpdCBzZWVtcyBvayB0aGF0IHVzaW5nIFNUX1JFVFJZ
X0ZVTkMgbWFjcm8gdG8gdHJ5IG1vcmUgdGltZXMgZm9yIHJhY2UgY29uZGl0aW9uLg0KDQpJbiBh
ZGRpdGlvbiwgd2hlbiAibG9vcGRldm5vID0gaW9jdGwoZmQsIExPT1BfQ1RMX0dFVF9GUkVFKSIg
Z2V0IGZyZWUgbG9vcCBkZXZpY2UgaSwgYW5kIA0KdGhlIGxvb3AgZGV2aWNlIGZpbGUgL2Rldi9s
b29wJWkgaGFzIGJlZW4gcmVtb3ZlZKOsc2V0X2Rldl9wYXRoIHdpbGwgcmV0dXJuIDEgYW5kIHNl
dCAiIC9kZXYvYmxvY2svbG9vcCVpICIgDQppbiBwYXRoLiBJdCBtaWdodCBoYXBwZW5lZCBpbiBt
YW55IEVtYmVkZGVkIFN5c3RlbXMgYmVjYXVzZSB0aGUgdGVzdCBwcm9jZXNzJ3MgaWQgaXMgcm9v
dCBhbHdheXMuIFNvIHdlIGNvdWxkIA0KYWxzbyBBZGQgZXhjZXB0aW9uIGhhbmRsaW5nPw0KDQpU
aGFua3MhDQoNCkJlc3QgUmVnYXJkcywNCkdvbmd5aQ0KDQo+IA0KPiBIaSwNCj4gDQo+ID4gPiBC
ZWNhdXNlIG9mIHJhY2UgY29uZGl0aW9uIG9yIGFibm9ybWFsIGVudiwgc2V0X2Rldl9wYXRoIG1h
eSBiZQ0KPiA+ID4gcmV0dXJuIDEuIEFuZCB3aGVuIHNldF9kZXZfcGF0aCByZXR1cm4gMSBpbiB0
c3RfZmluZF9mcmVlX2xvb3BkZXYsDQo+ID4gPiB3ZSBzaG91bGQgcmV0dXJuIEltbWVkaWF0ZWx5
Lg0KPiANCj4gDQo+ID4gSWYgdGhlcmUgZXhpc3RzIGEgcmFjZSBjb25kaXRpb24sIEkgZmlyc3Rs
eSB0aGluayBvZiB0aGUNCj4gPiBUU1RfUkVUUllfRlVOQyBtYWNybyB0byB0cnkgbW9yZSB0aW1l
cyBmb3IgdGhlIHNldF9kZXZfcGF0aC4gVGhhdA0KPiA+IG1pZ2h0IGhlbHAgdG8gZ2V0IHRoZSBm
dW5jdGlvbiBzdWNjZXNzIGluIHRoZSBmb2xsb3ctdXAgdHJpZXMuDQo+IA0KPiArMQ0KPiANCj4g
S2luZCByZWdhcmRzLA0KPiBQZXRyDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
