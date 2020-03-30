Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900319765D
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 10:23:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E9FA3C3165
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 10:23:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D810B3C1115
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:23:08 +0200 (CEST)
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC921600BC3
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:23:07 +0200 (CEST)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 57FBFB678CDCB397FF0A;
 Mon, 30 Mar 2020 16:22:59 +0800 (CST)
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.149]) by
 dggeml406-hub.china.huawei.com ([10.3.17.50]) with mapi id 14.03.0487.000;
 Mon, 30 Mar 2020 16:22:44 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH v3 0/3] Fix bug caused by default umask
Thread-Index: AQHWBmWd+n11rkNuOUS38urzc/1eIahgx7ew
Date: Mon, 30 Mar 2020 08:22:43 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E5928002@dggeml524-mbx.china.huawei.com>
References: <1585553269-119544-1-git-send-email-zou_wei@huawei.com>
 <5E81A0EF.4040508@cn.fujitsu.com>
In-Reply-To: <5E81A0EF.4040508@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSCB2MyAwLzNdIEZpeCBidWcgY2F1?=
 =?gb2312?b?c2VkIGJ5IGRlZmF1bHQgdW1hc2s=?=
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

SGkgWWFuZywNCg0KSSBkb3dubG9hZGVkIHRoZSBkZXZlbG9wbWVudCB2ZXJzaW9uIG9mIGx0cCB0
d28gd2Vla3MgYWdvLCByYW4gdGhlIGNhc2VzIGluIHRoZSBydW50ZXN0IGRpcmVjdG9yeSwgYW5k
IGFuYWx5emVkIGFsbCB0aGUgZmFpbGVkIGNhc2VzLiANCkkgZm91bmQgdGhhdCB0aGVzZSAzIGNh
c2VzIGhhdmUgdGhlIHVtYXNrIGlzc3VlLiANCg0KRHVlIHRvIHRoZSBsaW1pdGVkIHRpbWUgaW52
ZXN0ZWQgYnkgaW5kaXZpZHVhbHMsIGl0IGlzIHBvc3NpYmxlIHRoYXQgb3RoZXIgY2FzZXMgd2l0
aCB0aGUgc2FtZSBpc3N1ZSB3aWxsIG5vdCBiZSBkaXNjb3ZlcmVkLg0KSSB3aWxsIGFuYWx5emUg
dGhlIG90aGVyIGZhaWxlZCBjYXNlcyB0aGF0IGhhdmUgbm90IGJlZW4gY29uY2x1ZGVkIGZ1cnRo
ZXIgaW4gdGhlIG5leHQgZmV3IHdlZWtzLg0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMg
YW5kIHJldmlld3MuDQoNCkJlc3QgUmVnYXJkcw0KWm91IFdlaQ0KLS0tLS3Tyrz+1K28/i0tLS0t
DQq3orz+yMs6IFhpYW8gWWFuZyBbbWFpbHRvOnlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tXSANCrei
y83KsbzkOiAyMDIwxOoz1MIzMMjVIDE1OjM0DQrK1bz+yMs6IFpvdXdlaSAoU2FtdWVsKSA8em91
X3dlaUBodWF3ZWkuY29tPg0Ks63LzTogbHRwQGxpc3RzLmxpbnV4Lml0DQrW98ziOiBSZTogW0xU
UF0gW1BBVENIIHYzIDAvM10gRml4IGJ1ZyBjYXVzZWQgYnkgZGVmYXVsdCB1bWFzaw0KDQpPbiAy
MDIwLzMvMzAgMTU6MjcsIFpvdSBXZWkgd3JvdGU6DQo+IHYzOg0KPiBUaGUgY2FzZSBpcyBvbmx5
IHN1Y2Nlc3NmdWwgd2hlbiBzeXN0ZW0gZGVmYXVsdCB1bWFzayBpcyAwMDIyLg0KPiBXaGVuIGRl
ZmF1bHQgdW1hc2sgaXMgMDA3NyBvciBvdGhlciB2YWx1ZXMsIHNob3VsZCBjbGVhciB1bWFzayBi
eSB1bWFzaygwKSBpbiBzZXR1cCgpLg0KSGkgWm91LA0KDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2gg
c2V0Lg0KRGlkIHlvdSBmaW5kIGFueSBvdGhlciBjYXNlcyByZWxhdGVkIHdpdGggdGhlIHNhbWUg
aXNzdWU/DQoNClRoYW5rcywNClhpYW8gWWFuZw0KPg0KPiBab3UgV2VpICgzKToNCj4gICAgc2Vj
dXJpdHkvZGlydHljMHc6IEZpeCBidWcgY2F1c2VkIGJ5IGRlZmF1bHQgdW1hc2sNCj4gICAgc3lz
Y2FsbHMvZnN0YXQ6IEZpeCBidWcgY2F1c2VkIGJ5IGRlZmF1bHQgdW1hc2sNCj4gICAgc3lzY2Fs
bHMvc3RhdHgwMTogRml4IGJ1ZyBjYXVzZWQgYnkgZGVmYXVsdCB1bWFzaw0KPg0KPiAgIHRlc3Rj
YXNlcy9rZXJuZWwvc2VjdXJpdHkvZGlydHljMHcvZGlydHljMHcuYyB8IDIgKysNCj4gICB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0L2ZzdGF0MDIuYyAgICAgfCAyICsrDQo+ICAgdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zdGF0eC9zdGF0eDAxLmMgICAgIHwgMiArKw0KPiAgIDMg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+DQo+IC0tDQo+IDIuNi4yDQo+DQo+DQoN
Cg0KDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
