Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE236D0DA
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 05:26:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 157BE3C6612
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 05:26:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A1073C1A7E
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 05:26:52 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ADB3068FF29
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 05:26:50 +0200 (CEST)
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FVP8V3nCyzWcVt
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 11:22:50 +0800 (CST)
Received: from dggpeml500013.china.huawei.com (7.185.36.41) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 11:26:46 +0800
Received: from dggpeml500013.china.huawei.com ([7.185.36.41]) by
 dggpeml500013.china.huawei.com ([7.185.36.41]) with mapi id 15.01.2176.012;
 Wed, 28 Apr 2021 11:26:46 +0800
From: "wangxin (CQ)" <wangxin410@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP][PATCH] openposix/conformance/interfaces: Correct typos
Thread-Index: AQHXOw3UORe7CA8upkKI2cWQx6HKCqrIOJcAgAELkFA=
Date: Wed, 28 Apr 2021 03:26:46 +0000
Message-ID: <781c7f83980f45ffaefa3d93dff9f4a5@huawei.com>
References: <1619491883-69694-1-git-send-email-wangxin410@huawei.com>
 <YIhkBsRClMPkyM4Y@pevik>
In-Reply-To: <YIhkBsRClMPkyM4Y@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.33]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogW1BBVENIXSBvcGVucG9zaXgvY29uZm9ybWFu?=
 =?gb2312?b?Y2UvaW50ZXJmYWNlczogQ29ycmVjdCB0eXBvcw==?=
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

SGkgUGV0ciwNCgkNCkknbSByZWFsbHkgc29ycnkuIExhdGVyLCBJIGNoZWNrZWQgdGhlIHN0ZXBz
IG9mIG1ha2luZyBhbmQgc3VibWl0dGluZyBhIHBhdGNoLiANClRoZSByZWFzb24gaXMgdGhhdCB3
aGVuIEkgY2hlY2tlZCB0aGUgcGF0Y2ggZm9ybWF0IHVzaW5nIHRoZSB0b29sLCBzb21lIGZvcm1h
dCBlcnJvcnMgd2VyZSByZXBvcnRlZC4gDQpIb3dldmVyLCBJIG1vZGlmaWVkIHRoZSBwYXRjaCBm
b3JtYXQgaW4gYW4gaW5jb3JyZWN0IHdheSAoYWx0aG91Z2ggdGhlIHRvb2wgc2hvd2VkIG5vIGVy
cm9yIGFmdGVyIHRoZSBtb2RpZmljYXRpb24pLiANCkkgc3dlYXIgdGhlcmUgd2lsbCBiZSBubyBz
dWNoIG1pc3Rha2UgdGhpcyB0aW1lLCBhbmQgSSdtIHJlYWxseSBzb3JyeS4NCg0KDQpLaW5kIHJl
Z2FyZHMsDQpXYW5nIFhpbg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogUGV0ciBWb3Jl
bCBbbWFpbHRvOnB2b3JlbEBzdXNlLmN6XSANCreiy83KsbzkOiAyMDIxxOo01MIyOMjVIDM6MjEN
CsrVvP7Iyzogd2FuZ3hpbiAoQ1EpIDx3YW5neGluNDEwQGh1YXdlaS5jb20+DQqzrcvNOiBsdHBA
bGlzdHMubGludXguaXQNCtb3zOI6IFJlOiBbTFRQXVtQQVRDSF0gb3BlbnBvc2l4L2NvbmZvcm1h
bmNlL2ludGVyZmFjZXM6IENvcnJlY3QgdHlwb3MNCg0KSGkgWGluLA0KDQo+IFR5cGVzIGluIHRo
ZSBuYW1lIG9mIHRoZSB0ZW1wb3JhcnkgZmlsZXM6IEZvciBleGFtcGxlLCBpbiANCj4gYWlvX2Nh
bmNlbC84LTEuYyBmaWxlLA0KPiBwdHNfYWlvX2NhbmNlbF8xXzEgLT4gcHRzX2Fpb19jYW5jZWxf
OF8xLg0KPiBPdGhlcnMgbGlrZSB0aGlzIGhhdmUgYmVlbiBtb2RpZmllZC4NCg0KVGhpcyBwYXRj
aCBpcyBhbHNvIG5vdCBhcHBsaWNhYmxlIHdpdGggZ2l0IGFtLiBOb3Qgc3VyZSB3aGF0IHlvdSBk
byB3cm9uZywgYnV0IHNpbXBsZSAnZ2l0IGZvcm1hdC1wYXRjaCBvcmlnaW4vbWFzdGVyJyBzaG91
bGQgd29yay4NCg0KS2luZCByZWdhcmRzLA0KUGV0cg0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
