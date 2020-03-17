Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF3187A8E
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:34:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84AD33C55CD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:34:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7D74B3C55C3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:34:15 +0100 (CET)
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6DD8B1000C38
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:34:14 +0100 (CET)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 8C1476A5A44D04E1F2FF;
 Tue, 17 Mar 2020 15:34:09 +0800 (CST)
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.203]) by
 dggeml406-hub.china.huawei.com ([10.3.17.50]) with mapi id 14.03.0487.000;
 Tue, 17 Mar 2020 15:34:06 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
Thread-Index: AQHV/CvDLgEUU+DjKEqn32zZtcQfGKhMYxgQ
Date: Tue, 17 Mar 2020 07:34:05 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E5910B5D@dggeml524-mbx.china.huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <5E7078E9.9080809@cn.fujitsu.com>
In-Reply-To: <5E7078E9.9080809@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gcHRocmVhZF9jb25kX2luaXQv?=
 =?gb2312?b?cy1jLmM6IEFkZCB0aGUgbG9zZSBpZm5kZWYgbGluZQ==?=
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

SGkgWHUNCg0KVGhhbmtzIGZvciBtZXJnZSB0aGUgcGF0Y2guDQoNCkkgc2VudCBhbm90aGVyIDIg
cGF0Y2hlcywgb25lIGlzIHRvIGVuYWJsZSB0aGUgb3Blbl9wb3NpeF90ZXN0c3VpdGUgaW4gdGhl
IG1ha2VmaWxlLCBhbmQgdGhlIG90aGVyIG9uZSBpcyB0byBmaXggdGhlIG9wZW5fcG9zaXggY29t
cGlsYXRpb24gaXNzdWUuDQoNCkJlc3QgUmVnYXJkcw0KWm91IFdlaQ0KLS0tLS3Tyrz+1K28/i0t
LS0tDQq3orz+yMs6IFhpYW8gWWFuZyBbbWFpbHRvOnlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tXSAN
Creiy83KsbzkOiAyMDIwxOoz1MIxN8jVIDE1OjE1DQrK1bz+yMs6IFpvdXdlaSAoU2FtdWVsKSA8
em91X3dlaUBodWF3ZWkuY29tPg0Ks63LzTogbHRwQGxpc3RzLmxpbnV4Lml0DQrW98ziOiBSZTog
W0xUUF0gW1BBVENIXSBwdGhyZWFkX2NvbmRfaW5pdC9zLWMuYzogQWRkIHRoZSBsb3NlIGlmbmRl
ZiBsaW5lDQoNCkhpIFpvdSwNCg0KUHVzaGVkLg0KDQpCVFc6DQoxKSB3ZSBhbHNvIG5lZWQgdG8g
dXBkYXRlIG9wZW5fcG9zaXhfdGVzdHN1aXRlIHNvIHRoYXQgaXQgY2FuIGNvbXBpbGUgdGhlc2Ug
c3RyZXNzIHRlc3RzIGJ5IGRlZmF1bHQuDQoyKSBZb3VyIHBhdGNoIHNlZW1zIHRvIGJlIGJyb2tl
biBzbyBJIHJlY3JlYXRlIGFuZCBhcHBseSBpdC4NCg0KVGhhbmtzLA0KWGlhbyBZYW5nDQpPbiAy
MDIwLzMvMTYgMTA6NTgsIFpvdSBXZWkgd3JvdGU6DQo+IHB0aHJlYWRfY29uZF9pbml0L3MtYy5j
IHRlc3RjYXNlIGxvc2UgYSAjaWZuZGVmIGxpbmUsIGZpeCBpdA0KPg0KPiBSZXBvcnRlZC1ieTog
Wm91IFdlaTx6b3Vfd2VpQGh1YXdlaS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWk8em91
X3dlaUBodWF3ZWkuY29tPg0KPiAtLS0NCj4gICB0ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3Vp
dGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMgfCAxICsNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCANCj4gYS90ZXN0Y2Fz
ZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQv
cy1jLg0KPiBjIA0KPiBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhy
ZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuDQo+IGMNCj4gaW5kZXggNmE1YzcwYS4uOGQxODQ4
NCAxMDA2NDQNCj4gLS0tIA0KPiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJl
c3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuDQo+IGMNCj4gKysrIGIvdGVzdGNhc2Vz
L29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0Lw0K
PiArKysgcy1jLmMNCj4gQEAgLTgwLDYgKzgwLDcgQEANCj4gICAvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKiogICAgVGVzdCBjYXNlICAgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKiovDQo+ICAgDQo+IC8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gKioqKioqKioqKioq
KioqKioqKioqKiovDQo+ICsjaWZuZGVmIFdJVEhPVVRfWE9QRU4NCj4gICB0eXBlZGVmIHN0cnVj
dCBfdGVzdHN0cnVjdCB7DQo+ICAgCXB0aHJlYWRfY29uZF90IGNuZFsxMCAqIFNDQUxBQklMSVRZ
X0ZBQ1RPUl07DQo+ICAgCXB0aHJlYWRfY29uZGF0dHJfdCBjYVs0XTsNCj4gLS0NCj4gMi42LjIN
Cj4NCj4NCg0KDQoNCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
