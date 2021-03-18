Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BA33FFD5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:44:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF8CC3C2CD2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:44:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D5F4C3C2C85
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:44:40 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B73A1A014BA
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:44:39 +0100 (CET)
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F1HX42670zYL9F;
 Thu, 18 Mar 2021 14:42:44 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Mar 2021 14:44:29 +0800
Received: from dggemi753-chm.china.huawei.com (10.1.198.139) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 14:44:29 +0800
Received: from dggemi753-chm.china.huawei.com ([10.9.48.91]) by
 dggemi753-chm.china.huawei.com ([10.9.48.91]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 14:44:28 +0800
From: xieziyao <xieziyao@huawei.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] kernel/syscalls: Use SAFE_OPEN() instead of
 calling system API functions
Thread-Index: AdcbwDPrnH9XXMIvQI6nZ8HTRG/93wAARrIw
Date: Thu, 18 Mar 2021 06:44:28 +0000
Message-ID: <11d89e3b750a4544aad4d75f0acd5f51@huawei.com>
References: <TYCPR01MB654415A23C745F8AB49DEC15FD699@TYCPR01MB6544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB654415A23C745F8AB49DEC15FD699@TYCPR01MB6544.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogIFtQQVRDSF0ga2VybmVsL3N5c2NhbGxzOiBV?=
 =?gb2312?b?c2UgU0FGRV9PUEVOKCkgaW5zdGVhZCBvZiBjYWxsaW5nIHN5c3RlbSBBUEkg?=
 =?gb2312?b?ZnVuY3Rpb25z?=
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

SSdsbCBzZW5kIGEgbmV3IHBhdGNoIHRvIGZpeCBpdC4gVGhhbmtzIQ0KDQotLS0tLdPKvP7Urbz+
LS0tLS0NCreivP7IyzogeHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbSBbbWFpbHRvOnh1eWFuZzIw
MTguanlAZnVqaXRzdS5jb21dIA0Kt6LLzcqxvOQ6IDIwMjHE6jPUwjE4yNUgMTQ6MzUNCsrVvP7I
yzogeGlleml5YW8gPHhpZXppeWFvQGh1YXdlaS5jb20+DQqzrcvNOiBsdHBAbGlzdHMubGludXgu
aXQNCtb3zOI6IFJFOiBbTFRQXSBbUEFUQ0hdIGtlcm5lbC9zeXNjYWxsczogVXNlIFNBRkVfT1BF
TigpIGluc3RlYWQgb2YgY2FsbGluZyBzeXN0ZW0gQVBJIGZ1bmN0aW9ucw0KDQpIaSBYaWUNCj4t
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzY29uZmlnL2ZzY29uZmlnMDIuYw0KPisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnNjb25maWcvZnNjb25maWcwMi5jDQo+QEAg
LTU1LDkgKzU1LDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkNCj4gCWlmIChmZCA9PSAtMSkN
Cj4gCQl0c3RfYnJrKFRCUk9LIHwgVFRFUlJOTywgImZzb3BlbigpIGZhaWxlZCIpOw0KPg0KPi0J
dGVtcF9mZCA9IG9wZW4oInRlc3RmaWxlIiwgT19SRFdSIHwgT19DUkVBVCwgMDE0NDQpOw0KPi0J
aWYgKHRlbXBfZmQgPT0gLTEpDQo+LQkJdHN0X2JyayhUQlJPSywgIkNhbid0IG9idGFpbiB0ZW1w
X2ZkLCBvcGVuKCkgZmFpbGVkIik7DQo+KwlmZCA9IFNBRkVfT1BFTigidGVzdGZpbGUiLCBPX1JE
V1IgfCBPX0NSRUFULCAwMTQ0NCk7DQo+IH0NCg0KSGVyZSBoYXMgYSB0eXBvLiBXZSBzaG91bGQg
dXNlIHRlbXBfZmQgaW5zdGVhZCBvZiBmZC4NCk90aGVyIHRoYW4gdGhpcywgaXQgbG9va3MgZ29v
ZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRz
dS5jb20+DQoNCg0KLS0gDQpNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHANCg0KDQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
