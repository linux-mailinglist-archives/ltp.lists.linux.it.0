Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A80EE34F68A
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 04:19:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CDDE3C8BF3
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 04:19:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45A9C3C57E9
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 04:19:47 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D05A60067C
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 04:19:46 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4F990l45D5z14B1g
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 10:16:23 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 31 Mar 2021 10:19:42 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 10:19:42 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 10:19:42 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/chdir01: Add umask before mkdir
Thread-Index: AdclZwKsWQobtGZChECwuE2hxLC7yf//tlOA//7eWHA=
Date: Wed, 31 Mar 2021 02:19:42 +0000
Message-ID: <3bcb94a23de3476ca3c4c6f68fe3b1f6@huawei.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E8F1@dggeml531-mbx.china.huawei.com>
 <YGNXkZMqqJpviwkL@pevik>
In-Reply-To: <YGNXkZMqqJpviwkL@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gc3lzY2FsbHMvY2hkaXIwMTog?=
 =?gb2312?b?QWRkIHVtYXNrIGJlZm9yZSBta2Rpcg==?=
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

SGkgR29uZ3lpLCBQZXRyLA0KDQpTb3JyeSwgSSBkaWRuJ3Qgc3Vic2NyaWJlIHRvIHRoZSBtYWls
IHdoZW4gR29uZ3lpJ3MgcGF0Y2ggd2FzIHN1Ym1pdHRlZC4NCg0KQW55d2F5LCB0aGFuayB5b3Ug
Zm9yIHlvdXIgZGlzY3Vzc2lvbiBvZiB0aGlzIGlzc3VlIGFuZCBmb3IgbWVyZ2luZyB0aGlzIHBh
dGNoLg0KDQpSZWdhcmRzLA0KWml5YW8NCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IFBl
dHIgVm9yZWwgW21haWx0bzpwdm9yZWxAc3VzZS5jel0gDQq3osvNyrG85DogMjAyMcTqM9TCMzHI
1SAwOjU0DQrK1bz+yMs6IHpoYW9nb25neWkgPHpoYW9nb25neWlAaHVhd2VpLmNvbT4NCrOty806
IHhpZXppeWFvIDx4aWV6aXlhb0BodWF3ZWkuY29tPjsgbHRwQGxpc3RzLmxpbnV4Lml0DQrW98zi
OiBSZTogW0xUUF0gW1BBVENIXSBzeXNjYWxscy9jaGRpcjAxOiBBZGQgdW1hc2sgYmVmb3JlIG1r
ZGlyDQoNCkhpIEdvbmd5aSwNCg0KPiBVbWFzayBpcyBhbHdheXMgMDIyIGluIG1hbnkgc3lzdGVt
IGVudi4gSW4gdGhpcyB0ZXN0Y2FzZSwgaWYgdW1hc2sgaXMgDQo+IG5vdCAwMjIsIGZvciBleGFt
cGxlLCB1bWFzayBpcyAwMDc3LCB0ZXN0IHdvdWxkIGZhaWwgYmVjYXVzZSB0aGUgZmlsZSANCj4g
bW9kZSBpcyBhZmZlY3RlZCBieSB1bWFzay4NClRoYW5rcyBhIGxvdCBmb3IgYSBnaXZpbmcgZXhh
bXBsZS4gSSB0ZXN0ZWQgb25seSAwMDY2Lg0KDQpJJ20gc29ycnkgSSBhY2NlcHRlZCB0aGUgWml5
YW8gdmVyc2lvbiBhcyBpdCBoYWQgYmV0dGVyIGRlc2NyaXB0aW9uLCByZXZlcnRlZCBiYWNrIGNo
YW5nZXMgYW5kIHdpbGwgd29yayBvbiBhbnkgbW9kZSBpbiBTQUZFX01LRElSKCkuIEkgcHV0IHlv
dXIgUmVwb3J0ZWQtYnk6DQp0YWcuDQoNCkknbGwgYWxzbyBzZW5kIG9uZSBtb3JlIGZpeCBmb3Ig
ZXhmYXQuDQoNCktpbmQgcmVnYXJkcywNClBldHINCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
