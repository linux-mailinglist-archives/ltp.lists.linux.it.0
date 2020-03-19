Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD518AA4C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 02:26:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBB283C5553
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 02:26:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0B4733C552E
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 02:26:27 +0100 (CET)
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D23CD200A00
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 02:26:26 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 55C99982764B43215BD3
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 09:26:20 +0800 (CST)
Received: from DGGEML423-HUB.china.huawei.com (10.1.199.40) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 19 Mar 2020 09:26:19 +0800
Received: from DGGEML524-MBX.china.huawei.com ([169.254.1.203]) by
 dggeml423-hub.china.huawei.com ([10.1.199.40]) with mapi id 14.03.0487.000;
 Thu, 19 Mar 2020 09:26:13 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] open_posix_testsuite: Fix compilation issues
Thread-Index: AQHV/FuA3JoVu1yWS0KBz5KQlNzDs6hPISGw
Date: Thu, 19 Mar 2020 01:26:13 +0000
Message-ID: <C3CD0DF8AD11A84CB25A1426DE537C61E5911584@dggeml524-mbx.china.huawei.com>
References: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
 <20200317205205.GA23447@yuki.lan>
In-Reply-To: <20200317205205.GA23447@yuki.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.144]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0gb3Blbl9wb3NpeF90ZXN0c3Vp?=
 =?gb2312?b?dGU6IEZpeCBjb21waWxhdGlvbiBpc3N1ZXM=?=
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

SGkgQ3lyaWwsDQoNClNvIHdlIG5lZWQgdG8gYWRkIC1wdGhyZWFkIHRvIGJvdGggQ0ZMQUdTIGFu
ZCBMREZMQUdTIHRvIGF2b2lkIHRoZSBjb21waWxhdGlvbiBhbmQgbGlua2luZyBwcm9ibGVtPw0K
DQpCZXN0IFJlZ2FyZHMNClpvdSBXZWkNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEN5
cmlsIEhydWJpcyBbbWFpbHRvOmNocnViaXNAc3VzZS5jel0gDQq3osvNyrG85DogMjAyMMTqM9TC
MTjI1SA0OjUyDQrK1bz+yMs6IFpvdXdlaSAoU2FtdWVsKSA8em91X3dlaUBodWF3ZWkuY29tPg0K
s63LzTogbHRwQGxpc3RzLmxpbnV4Lml0DQrW98ziOiBSZTogW0xUUF0gW1BBVENIXSBvcGVuX3Bv
c2l4X3Rlc3RzdWl0ZTogRml4IGNvbXBpbGF0aW9uIGlzc3Vlcw0KDQpIaSENCj4gRml4IGNvbXBp
bGF0aW9uIGlzc3VlczoNCj4gMS4gQWRkIHRoZSAnLWxwdGhyZWFkIC1scnQgLWxtJyBjb25maWcg
aW50byBMREZMQUdTDQoNCkp1c3QgbGlua2luZyB3aXRoIC1scHRocmVhZCBpcyBub3QgY29ycmVj
dCB3YXkgaG93IHRvIGNvbXBpbGUgcHRocmVhZCBwcm9ncmFtcyBvbiBMaW51eCwgd2UgaGF2ZSB0
byBhZGQgLXB0aHJlYWQgdG8gYm90aCBDTEZBR1MgYW5kIExERkxBR1MuDQoNCkkgZ3Vlc3MgdGhh
dCB3ZSBzaG91bGQgYWxzbyBkZWZhdWx0IHRvIHRoZSBvdXRwdXQgb2YgZ2V0Y29uZiBmb3IgcHRo
cmVhZCBDRkxBR1MgYW5kIExERkxBR1MgaWYgYXZhaWxhYmxlWzFdLiBVbmZvcnR1bmF0ZWx5IGl0
IGxvb2tzIGxpa2UgdGhpcyBpcyBub3QgaW1wbGVtZW50ZWQgb24gTGludXggeWV0Lg0KDQpTbyBp
ZiBnZXRjb25mIGZhaWxzIHdlIHdpbGwgaGF2ZSB0byBwcm9iYWJseSBmYWxsYmFjayB0byBwZXIt
T1MgdGFibGUgb2YgQ0ZMQUdTIGFuZCBMREZMQUdTLg0KDQpbMV0gaHR0cHM6Ly9wdWJzLm9wZW5n
cm91cC5vcmcvb25saW5lcHVicy85Njk5OTE5Nzk5L3V0aWxpdGllcy9jOTkuaHRtbCN0YWd0Y2po
XzI1DQoNCi0tDQpDeXJpbCBIcnViaXMNCmNocnViaXNAc3VzZS5jeg0KCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
