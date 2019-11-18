Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA0FFE46
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:18:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0BC3C233C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 07:18:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A34573C176D
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:18:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0A6541A01169
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 07:18:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,319,1569254400"; d="scan'208";a="78653274"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2019 14:18:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 240334CE1C01;
 Mon, 18 Nov 2019 14:10:07 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 18 Nov 2019 14:18:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::c04f:a92d:e25c:5f44])
 by G08CNEXMBPEKD04.g08.fujitsu.local
 ([fe80::c04f:a92d:e25c:5f44%14]) with
 mapi id 15.00.1395.000; Mon, 18 Nov 2019 14:18:25 +0800
From: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
Thread-Index: AQHVkLOpzxsBeFNK7kCf1U9FU6HaBaeMAZEAgASMn3A=
Date: Mon, 18 Nov 2019 06:18:25 +0000
Message-ID: <05d48a2311e249e1b39f63b4869c90e8@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115164844.GA22234@x230>
In-Reply-To: <20191115164844.GA22234@x230>
Accept-Language: en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.220.84]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 240334CE1C01.AA717
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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

SGkgUGV0cg0KIEkgd2lsbCBjaGVjayBpdCBhbmQgY29ycmVjdCB0aGVtLg0KPlN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMS81XSBzeXNjYWxscy9xdW90YWN0bDAxLmM6IEFkZCBRX0dFVE5FWFFVT1RB
IHRlc3QNCj4NCj5TdWJqZWN0OiBbUEFUQ0ggdjMgMS81XSBzeXNjYWxscy9xdW90YWN0bDAxLmM6
IEFkZCBRX0dFVE5FWFFVT1RBIHRlc3QgPT4gcy9RX0dFVE5FWFFVT1RBL1FfR0VUTkVYVFFVT1RB
LyA6KSBHZW5lcmFsbHkgdGhlcmUgYXJlIG1vcmUgdHlwb3MgaW4gZG9jcyBhbmQgPmZvcm1hdHRp
bmcg44CLaXNzdWVzLiBBcyB0aGVzZSBhcmUganVzdCBhIHNtYWxsIGRldGFpbHMsIEkgdXN1YWxs
eSBmaXggdGhlbSBkdXJpbmcgbWVyZ2UsIGJ1dCBjb3B5IHBhc3RlIG9uIGNvbnN0YW50cyBpcyB5
b3UgZnJpZW5kLg0KPg0KPktpbmQgcmVnYXJkcywNCj5QZXRyDQoNCg0KCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
