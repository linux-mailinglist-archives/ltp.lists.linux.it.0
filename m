Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE473B2462
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 03:02:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D5F43C8E3E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 03:02:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E84D3C2307
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 03:02:49 +0200 (CEST)
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 25E94600706
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 03:02:46 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id RXA00137;
 Thu, 24 Jun 2021 09:02:37 +0800
Received: from jtjnmail201620.home.langchao.com (10.100.2.20) by
 jtjnmail201623.home.langchao.com (10.100.2.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 24 Jun 2021 09:02:37 +0800
Received: from jtjnmail201620.home.langchao.com ([fe80::24f6:b8e5:a824:6a6b])
 by jtjnmail201620.home.langchao.com ([fe80::24f6:b8e5:a824:6a6b%17])
 with mapi id 15.01.2176.014; Thu, 24 Jun 2021 09:02:37 +0800
From: =?gb2312?B?SmFtZXMgRG9uZyAotq3KwL2tKQ==?= <dongshijiang@inspur.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
Thread-Index: AddolBJx4eueXHxIsE+jfZ2y41B5ZA==
Date: Thu, 24 Jun 2021 01:02:37 +0000
Message-ID: <92ed4ea616c14205b30f14f0caf26c95@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.58.101]
MIME-Version: 1.0
tUid: 2021624090238d4a36d916cb7c972d836c0fbb51f648e
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
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
Cc: "libtirpc-devel@lists.sourceforge.net"
 <libtirpc-devel@lists.sourceforge.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Steve Dickson <SteveD@redhat.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0cg0KDQpNeSB0ZXN0IGVudmlyb25tZW50IGlzIGNlbnRvczguMiwga2VybmVsIHZlcnNp
b24gaXMgNC4xOCAoQ2VudE9TLTguMi4yMDA0LXg4Nl82NC1kdmQxLmlzbykNCkZvciBleGFtcGxl
Og0KCXN2Y3IgPSBzdmNmZF9jcmVhdGUoZmQsIDAsIDApOw0KCS8vVGhlbiBjYWxsIGRlc3Ryb3kg
bWFjcm8NCglzdmNfZGVzdHJveShzdmNyKTsNCg0KSWYgInN2Y2ZkX2NyZWF0ZSIgZmFpbHMsIHRo
YXQgaXMsIHRoZSByZXR1cm4gdmFsdWUgaXMgTlVMTCBhbmQgdGhlbiBjYWxsICJzdmNfZGVzdHJv
eSIgd2lsbCByZXBvcnQgYW4gZXJyb3IgIlNlZ21lbnRhdGlvbiBmYXVsdCINCg0KS2luZCByZWdh
cmRzLA0KRG9uZw0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogUGV0ciBWb3JlbCBbbWFp
bHRvOnB2b3JlbEBzdXNlLmN6XSANCreiy83KsbzkOiAyMDIxxOo21MIyNMjVIDA6MDcNCsrVvP7I
yzogSmFtZXMgRG9uZyAotq3KwL2tKSA8ZG9uZ3NoaWppYW5nQGluc3B1ci5jb20+DQqzrcvNOiBs
dHBAbGlzdHMubGludXguaXQ7IEFsZXhleSBLb2RhbmV2IDxhbGVrc2VpLmtvZGFuZXZAYmVsbC1z
dy5jb20+OyBTdGV2ZSBEaWNrc29uIDxTdGV2ZURAcmVkaGF0LmNvbT47IGxpYnRpcnBjLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgtbmZzQHZnZXIua2VybmVsLm9yZw0K1vfM4jog
UmU6IFtMVFBdIFtQQVRDSF0gZml4IHJwY19zdWl0ZS9ycGM6YWRkIGNoZWNrIHJldHVybmVkIHZh
bHVlDQoNCkhpIERvbmcsDQoNCj4gSGkgUGV0cg0KPiBJIHRoaW5rIHRoaXMgaXMganVzdCBhIHNp
bXBsZSB0ZXN0IG9mIHNvbWUgQVBJcywgYnV0IHNvbWUgdGVzdCBjYXNlcyBhcmUgbm90IHN0YW5k
YXJkaXplZCBhbmQgY2F1c2UgZXJyb3JzIGxpa2UgIlNlZ21lbnRhdGlvbiBmYXVsdCIgZHVyaW5n
IHRlc3RpbmcuIEkgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IHRvIGZpeCB0aGVzZSBlcnJvcnMgb3Ig
ZGVsZXRlIHRoZXNlIHRlc3RzLg0KDQpTdXJlIHRoaXMgZml4IGNhbiBnZXQgaW4uIEkgc2F3IGlz
c3VlcyB3aXRoIHNvbWUgdGVzdHMgb24gb3BlblNVU0UsIGJ1dCB0aGF0J3MgYSBzZXBhcmF0ZSBw
cm9ibGVtIChJIHdhcyBub3QgYWJsZSB0byBmaW5kIHRoZSBwcm9ibGVtIHRodXMgcmVwb3J0IGl0
Lg0KDQo+IEtpbmQgcmVnYXJkcywNCj4gRG9uZw0KDQo+ID4gKysrIGIvdGVzdGNhc2VzL25ldHdv
cmsvcnBjL3JwYy10aXJwYy90ZXN0c19wYWNrL3JwY19zdWl0ZS9ycGMvcnBjX2MNCj4gPiArKysg
cmVhdGVkZXN0cm95X3N2Y19kZXN0cm95L3JwY19zdmNfZGVzdHJveS5jDQo+ID4gQEAgLTQ2LDYg
KzQ2LDExIEBAIGludCBtYWluKHZvaWQpDQoNCj4gPiAgCS8vRmlyc3Qgb2YgYWxsLCBjcmVhdGUg
YSBzZXJ2ZXINCj4gPiAgCXN2Y3IgPSBzdmNmZF9jcmVhdGUoZmQsIDAsIDApOw0KPiA+ICsNCj4g
PiArCS8vY2hlY2sgcmV0dXJuZWQgdmFsdWUNCj4gPiArCWlmICgoU1ZDWFBSVCAqKSBzdmNyID09
IE5VTEwpIHsNCklNSE8gY2FzdGluZyBpcyBub3QgcmVxdWlyZWQsIHJpZ2h0PyBKdXN0DQoJaWYg
KHN2Y3IgPT0gTlVMTCkgew0KDQpLaW5kIHJlZ2FyZHMsDQpQZXRyDQoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
