Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EE36E70D
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 10:32:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29BEB3C613A
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 10:32:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ACD13C0F91
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 10:32:20 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 70A101A0145F
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 10:32:19 +0200 (CEST)
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FW7vR0RYcz5gTS
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 16:29:07 +0800 (CST)
Received: from dggpeml500013.china.huawei.com (7.185.36.41) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 16:32:15 +0800
Received: from dggpeml500013.china.huawei.com ([7.185.36.41]) by
 dggpeml500013.china.huawei.com ([7.185.36.41]) with mapi id 15.01.2176.012;
 Thu, 29 Apr 2021 16:32:15 +0800
From: "wangxin (CQ)" <wangxin410@huawei.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH] controllers/cpuset: Restore the value of
 cpuset.sched_load_balance
Thread-Index: AQHXN04Bm9buOB4WAUmb5vxWrGZ7B6rLMT3A
Date: Thu, 29 Apr 2021 08:32:15 +0000
Message-ID: <c6f0d000f05943a1bb1cac3c1bbd8867@huawei.com>
References: <1619079641-30553-1-git-send-email-wangxin410@huawei.com>
In-Reply-To: <1619079641-30553-1-git-send-email-wangxin410@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.33]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?tPC4tDogW1BBVENIXSBjb250cm9sbGVycy9jcHVzZXQ6?=
 =?gb2312?b?IFJlc3RvcmUgdGhlIHZhbHVlIG9mIGNwdXNldC5zY2hlZF9sb2FkX2JhbGFu?=
 =?gb2312?b?Y2U=?=
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
Cc: Yanjin <yanjin.yan@huawei.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksDQoNCglQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guIFdoZW4gSSB3YXMgbWFraW5nIHRoaXMg
cGF0Y2gsDQoJSSB1c2VkIGFuIGluY29ycmVjdCBtZXRob2QgdG8gZml4IG15IGZvcm1hdHRpbmcg
cHJvYmxlbS4gDQoJTm93IEkndmUgcmVtYWRlIGEgbmV3IHBhdGNoLCBwbGVhc2UgY2hlY2sgb3V0
IHRoZSB2MiB2ZXJzaW9uLg0KDQpLaW5kIHJlZ2FyZHMsDQpXYW5nIFhpbg0KDQoNCi0tLS0t08q8
/tStvP4tLS0tLQ0Kt6K8/sjLOiB3YW5neGluIChDUSkgDQq3osvNyrG85DogMjAyMcTqNNTCMjLI
1SAxNjoyMQ0KytW8/sjLOiBsdHBAbGlzdHMubGludXguaXQNCrOty806IHdhbmd4aW4gKENRKSA8
d2FuZ3hpbjQxMEBodWF3ZWkuY29tPg0K1vfM4jogW1BBVENIXSBjb250cm9sbGVycy9jcHVzZXQ6
IFJlc3RvcmUgdGhlIHZhbHVlIG9mIGNwdXNldC5zY2hlZF9sb2FkX2JhbGFuY2UNCg0KV2hlbiB3
ZSBydW4gdGhlIGNwdWhvdHBsdWcwMyB0ZXN0IGNhc2Ugb24gdGhlIGFybTY0IG1hY2hpbmUsIHdl
IGNvbmNsdWRlIHRoYXQgbm8gZXJyb3Igb2NjdXJzIHdoZW4gdGhlIGNwdWhvdHBsdWcwMyBjYXNl
IGlzIGV4ZWN1dGVkIGFsb25lLCBidXQgb25jZSB0aGUgY3B1c2V0X3NjaGVkX2RvbWFpbnMgY2Fz
ZSBpcyBleGVjdXRlZCBmaXJzdCwgQWZ0ZXIgY3B1aG90cGx1ZzAzIGlzIGV4ZWN1dGVkLCB0aGUg
ZXJyb3IgImNwdWhvdHBsdWcwMyAxIFRGQUlMOiBObyBjcHVob3RwbHVnX2RvX3NwaW5fbG9vcCBw
cm9jZXNzZXMgZm91bmQgb24iIG9jY3Vycy4NClRoZSBjcHVzZXRfc2NoZWRfZG9tYWlucyB0ZXN0
IGNhc2UgY2hhbmdlcyB0aGUgdmFsdWUgb2YgY3B1c2V0LnNjaGVkX2xvYWRfYmFsYW5jZSBpbiB0
aGUgY3B1c2V0IGNncm91cCBzdWJzeXN0ZW0sIGJ1dCBkb2VzIG5vdCByZXN0b3JlIHRoZSB2YWx1
ZSBhdCB0aGUgZW5kIG9mIHRoZSB0ZXN0Lg0KTW9kaWZ5IHRoZSBjcHVzZXRfZnVuY3Muc2ggZmls
ZS4gVGhlIHRlc3QgcmVzdWx0IHNob3dzIHRoYXQgdGhlIHByb2JsZW0gaXMgc29sdmVkIHN1Y2Nl
c3NmdWxseS4NCg0KU2lnbmVkLW9mZi1ieTogV2FuZyBYaW4gPHdhbmd4aW40MTBAaHVhd2VpLmNv
bT4NCi0tLQ0KIHRlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9mdW5j
cy5zaCB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCg0KZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9mdW5jcy5z
aCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9mdW5jcy5zaA0K
aW5kZXggMDBhYWQwZS4uODIwZGUzMyAxMDA3NTUNCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY29u
dHJvbGxlcnMvY3B1c2V0L2NwdXNldF9mdW5jcy5zaA0KKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9j
b250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2Z1bmNzLnNoDQpAQCAtNTksNiArNTksOCBAQCBDUFVT
RVQ9Ii9kZXYvY3B1c2V0Ig0KIENQVVNFVF9UTVA9Ii90bXAvY3B1c2V0X3RtcCINCiBDTE9ORV9D
SElMRFJFTj0iL2Rldi9jcHVzZXQvY2dyb3VwLmNsb25lX2NoaWxkcmVuIg0KIENISUxEUkVOX1ZB
TFVFPSIwIg0KK1NDSEVEX0xCPSIvZGV2L2NwdXNldC9jcHVzZXQuc2NoZWRfbG9hZF9iYWxhbmNl
Ig0KK1NDSEVEX0xCX1ZBTFVFPSIwIg0KIEhPVFBMVUdfQ1BVPSIxIg0KIGNwdXNldF9sb2coKQ0K
QEAgLTE2OSw2ICsxNzEsNyBAQCBzZXR1cCgpDQogCWZpDQogCUNISUxEUkVOX1ZBTFVFPSJgY2F0
ICRDTE9ORV9DSElMRFJFTmAiDQorCVNDSEVEX0xCX1ZBTFVFPSJgY2F0ICRTQ0hFRF9MQmAiDQog
fQ0KICMgV3JpdGUgdGhlIGNsZWFudXAgZnVuY3Rpb24NCkBAIC0xODAsNiArMTgzLDcgQEAgY2xl
YW51cCgpDQogCX0NCiAJZWNobyAkQ0hJTERSRU5fVkFMVUUgPiAkQ0xPTkVfQ0hJTERSRU4NCisJ
ZWNobyAkU0NIRURfTEJfVkFMVUUgPiAkU0NIRURfTEINCiAJZmluZCAiJENQVVNFVCIgLXR5cGUg
ZCB8IHNvcnQgfCBzZWQgLW4gJzIsJHAnIHwgdGFjIHwgd2hpbGUgcmVhZCBzdWJkaXINCglkbw0K
Mi42LjINCg0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
