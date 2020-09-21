Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A5272183
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 12:54:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5C6A3C2A2F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 12:54:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E02963C29BF
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 12:54:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6FE0E200A19
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 12:54:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,286,1596470400"; d="scan'208";a="99462883"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Sep 2020 18:54:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id CA5A948990EB
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 18:53:56 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 21 Sep 2020 18:53:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::549d:26ce:6b90:da77])
 by G08CNEXMBPEKD04.g08.fujitsu.local
 ([fe80::549d:26ce:6b90:da77%14]) with
 mapi id 15.00.1497.006; Mon, 21 Sep 2020 18:53:58 +0800
From: "Chen, Hanxiao" <chenhx.fnst@cn.fujitsu.com>
To: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] memcg_use_hierarchy_test.sh: skip setting
 use_hierarchy if not available
Thread-Index: AQHWiBz40A39Xowdq0aInA9FO04F86lrzmwAgAazURA=
Date: Mon, 21 Sep 2020 10:53:58 +0000
Message-ID: <ebd86e7d991642cbb13e3ce46d032a69@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <20200911092121.1917-1-chenhx.fnst@cn.fujitsu.com>
 <7584a7ab-bc37-111f-f9bf-38da2d1e8099@cn.fujitsu.com>
In-Reply-To: <7584a7ab-bc37-111f-f9bf-38da2d1e8099@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.189]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CA5A948990EB.AAF86
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: chenhx.fnst@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gbWVtY2dfdXNlX2hpZXJhcmNo?=
 =?gb2312?b?eV90ZXN0LnNoOiBza2lwIHNldHRpbmcgdXNlX2hpZXJhcmNoeSBpZiBub3Qg?=
 =?gb2312?b?YXZhaWxhYmxl?=
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

SGksIFlhbmcNCg0KPiAtLS0tLdPKvP7Urbz+LS0tLS0NCj4g1vfM4jogUmU6IFtMVFBdIFtQQVRD
SF0gbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0LnNoOiBza2lwIHNldHRpbmcNCj4gdXNlX2hpZXJh
cmNoeSBpZiBub3QgYXZhaWxhYmxlDQo+IA0KPiBIaSBoYW54aWFvDQo+IA0KPiANCj4gPiBUaGUg
cHJlY29uZGl0aW9uIG9mIHRoaXMgY2FzZSBpcyB0aGF0IHdlIGNhbiBkaXNhYmxlIHVzZV9oaWVy
YXJjaHkuDQo+ID4gQnV0IHNvbWUgZGlzdHJpYnV0aW9ucyBzdWNoIGFzIENlbnRPUyA4IGhhZCBl
bmFibGVkIGl0IGluIHJvb3QgY2dyb3VwDQo+ID4gYW5kIGhhcmQgdG8gZGlzYWJsZWQuDQpbc25p
cF0NCj4gL2Rldi9tZW1jZy9tZW1vcnkudXNlX2hpZXJhcmNoeSIgXA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAidG8gMCBmYWlsZWQiDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGZpDQo+ID4gKyAgICAgICAgICAgICAgICBmaQ0KPiBJIHRlc3QgdGhpcyBw
YXRjaCBvbiBjZW50b3M3IGFuZCB0ZXN0Y2FzZTIgc2tpcHMuIE9uIGNlbnRvczcod2l0aG91dCBp
bnN0YWxsaW5nDQo+IGRvY2tlciksIC9zeXMvZnMvY2dyb3VwL21lbW9yeS9tZW1vcnkudXNlX2hp
ZXJhcmNoeSB2YWx1ZSBpcyBlcXVhbCB0byAxIGFuZCBJDQo+IHN0aWxsIGNhbiBkaXNhYmxlIHZh
bHVlIGZvciAvZGV2L21lbWNnL21lbW9yeS51c2VfaGllcmFyY2h5Lg0KPiANCg0KVGhlIGJlaGF2
aW9yIGFib3ZlIGxvb2tzIGNvbmZsaWN0aW5nIHdpdGggaHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvRG9jdW1lbnRhdGlvbi9jZ3JvdXAtdjEvbWVtb3J5LnR4dC4NCg0KPiBTbyB3aHkgbm90IGRp
cmVjdGx5IHVzZSAvZGV2L21lbWNnL21lbW9yeS51c2VfaGllcmFyY2h5IHZhbHVlIHRvIGp1ZGdl
IGluDQo+IHRlc3RjYXNlIGFmdGVyIHNldHRpbmcgMC4NCg0KSW4gc2V0dXBfdGVzdCBmcm9tIG1l
bWNnX2xpYi5zaCwgd2UgYWN0dWFsbHkgZGlkOg0KICAgIG1vdW50IC10IGNncm91cCAtb21lbW9y
eSBtZW1jZyAvZGV2L21lbWNnDQpUaGVuIGtlcm5lbCB3aWxsIGZpbmQgYSBzdWl0YWJsZSBjZ3Jv
dXAgcm9vdCBmb3IgdXMgaW4gY2dyb3VwMV9tb3VudC4NCg0KSW4gdGhpcyBjYXNlLCAvc3lzL2Zz
L2Nncm91cC9tZW1vcnkvIHdvdWxkIGJlIHRoZSBnb29kIGNob2ljZS4NClNvIGl0J3MgZXF1aXZh
bGVudCB0byByZWFkIG1lbW9yeS51c2VfaGllcmFyY2h5IGZyb20gZWl0aGVyIHNpZGUuDQoNClJl
Z2FyZHMsIA0KLSBIYW54aWFvDQo+IA0KPiBCZXN0IFJlZ2FyZHMNCj4gWWFuZyBYdQ0KPiA+ICAg
CWZpDQo+ID4NCj4gPiAgIAlST0QgbWtkaXIgIi9kZXYvbWVtY2cvJFRFU1RfSUQiDQo+ID4gZGlm
ZiAtLWdpdA0KPiA+IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlv
bmFsL21lbWNnX3VzZV9oaWVyYXJjaHlfdGUNCj4gPiBzdC5zaA0KPiA+IGIvdGVzdGNhc2VzL2tl
cm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3VzZV9oaWVyYXJjaHlfdGUN
Cj4gPiBzdC5zaA0KPiA+IGluZGV4IDRjZjZiOWZjMi4uMTQzOWI2MzUyIDEwMDc1NQ0KPiA+IC0t
LQ0KPiA+IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21l
bWNnX3VzZV9oaWVyYXJjaHlfdGUNCj4gPiBzdC5zaA0KPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ191c2VfaGllcmFyY2gNCj4gPiAr
KysgeV90ZXN0LnNoDQo+ID4gQEAgLTM0LDcgKzM0LDkgQEAgVFNUX1RPVEFMPTMNCj4gPiAgICMg
dGVzdCBpZiBvbmUgb2YgdGhlIGFuY2VzdG9ycyBnb2VzIG92ZXIgaXRzIGxpbWl0LCB0aGUgcHJv
Y2VzIHdpbGwgYmUga2lsbGVkDQo+ID4gICB0ZXN0Y2FzZV8xKCkNCj4gPiAgIHsNCj4gPiAtCWVj
aG8gMSA+IG1lbW9yeS51c2VfaGllcmFyY2h5DQo+ID4gKyAgICAgICAgaWYgWyAiJHJvb3RfbWVt
b3J5X3VzZV9oaWVyYXJjaHkiICE9ICIxIiBdOyB0aGVuDQo+ID4gKyAgICAgICAgICAgICAgICBl
Y2hvIDEgPiBtZW1vcnkudXNlX2hpZXJhcmNoeQ0KPiA+ICsgICAgICAgIGZpDQo+ID4gICAJZWNo
byAkUEFHRVNJWkUgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMNCj4gPg0KPiA+ICAgCW1rZGlyIHN1
Ymdyb3VwDQo+ID4gQEAgLTQ4LDYgKzUwLDEwIEBAIHRlc3RjYXNlXzEoKQ0KPiA+ICAgIyB0ZXN0
IEVuYWJsaW5nIHdpbGwgZmFpbCBpZiB0aGUgY2dyb3VwIGFscmVhZHkgaGFzIG90aGVyIGNncm91
cHMNCj4gPiAgIHRlc3RjYXNlXzIoKQ0KPiA+ICAgew0KPiA+ICsgICAgICAgIGlmIFsgIiRyb290
X21lbW9yeV91c2VfaGllcmFyY2h5IiA9ICIxIiBdOyB0aGVuDQo+ID4gKyAgICAgICAgICAgICAg
IHRzdF9yZXNtIFRDT05GICJyb290IGNncm91cCBoYXMgdXNlX2hpZXJhcmNoeSBlbmFibGVkLA0K
PiBza2lwIg0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4NCj4gPiArICAgICAgICBmaQ0KPiA+
ICAgCW1rZGlyIHN1Ymdyb3VwDQo+ID4gICAJRVhQRUNUX0ZBSUwgZWNobyAxIFw+IG1lbW9yeS51
c2VfaGllcmFyY2h5DQo+ID4NCj4gPiBAQCAtNTcsNyArNjMsOSBAQCB0ZXN0Y2FzZV8yKCkNCj4g
PiAgICMgdGVzdCBkaXNhYmxpbmcgd2lsbCBmYWlsIGlmIHRoZSBwYXJlbnQgY2dyb3VwIGhhcyBl
bmFibGVkIGhpZXJhcmNoeS4NCj4gPiAgIHRlc3RjYXNlXzMoKQ0KPiA+ICAgew0KPiA+IC0JZWNo
byAxID4gbWVtb3J5LnVzZV9oaWVyYXJjaHkNCj4gPiArICAgICAgICBpZiBbICIkcm9vdF9tZW1v
cnlfdXNlX2hpZXJhcmNoeSIgIT0gIjEiIF07IHRoZW4NCj4gPiArICAgICAgICAgICAgICAgZWNo
byAxID4gbWVtb3J5LnVzZV9oaWVyYXJjaHkNCj4gPiArICAgICAgICBmaQ0KPiA+ICAgCW1rZGly
IHN1Ymdyb3VwDQo+ID4gICAJRVhQRUNUX0ZBSUwgZWNobyAwIFw+IHN1Ymdyb3VwL21lbW9yeS51
c2VfaGllcmFyY2h5DQo+ID4NCj4gPg0KCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
