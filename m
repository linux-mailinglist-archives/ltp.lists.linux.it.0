Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6215A162
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 07:42:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 818943C25DE
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 07:42:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BE7283C134F
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 07:42:00 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 59B5D1A016EB
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 07:41:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83193054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 14:41:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E583A50A9974;
 Wed, 12 Feb 2020 14:32:21 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 14:41:52 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5E439705.4010303@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <05dd082a-417b-b71b-909a-2691b96adec9@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 14:41:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E439705.4010303@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E583A50A9974.ADA2D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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
Cc: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

b24gMjAyMC8wMi8xMiAxNDoxMSwgWGlhbyBZYW5nIHdyb3RlOgo+IE9uIDIwMjAvMi8xMiAxMzo0
NCwgWWFuZyBYdSB3cm90ZToKPj4gQ3VycmVudGx5LCBydW5uaW5nIHRoaXMgY2FzZSB3aWxsIHJl
cG9ydCBFSU5WQUwgZXJyb3IgaWYgSSBydW4gInVsaW1pdCAtYwo+PiAxMDIzIiBjb21tYW5kIGZp
cnN0bHkuIEZyb20gc2V0cmxpbWl0KDIpbWFucGFnZSwgaXQgZ290IEVJTlZBTCBlcnJvciAKPj4g
YmVjYXVzZQo+PiBybGltLT5ybGltX2N1ciB3YXMgZ3JlYXRlciB0aGFuIHJsaW0tPnJsaW1fbWF4
LiBTbyBhZGQgYSBjaGVjayBmb3IgaXQgCj4+IGJlZm9yZQo+PiBzZXRybGltaXQuCj4gSGkgWHUs
Cj4gCj4gSXQgc2VlbXMgYmV0dGVyIHRvIGZpeCB0aGUgaXNzdWUgYnkgc2V0dGluZyBib3RoIHJs
aW1fY3VyIGFuZCBybGltaXRfbWF4IAo+IHRvIHRoZSBNSU5fUkxJTUlUX0NPUkUuCj4gV2UgY2Fu
IG5vdCByYWlzZSBybGltX21heCB2YWx1ZSB1bmRlciB1bnByaXZpbGVnZWQgdXNlci4gT3IsIHNo
b3VsZCBJIApjbGVhbnVwIHRoaXMgY2FzZSBhbmQgdXNlIG5lZWRzX3Jvb3Q9MSA/CgpCZXN0IFJl
Z2FyZHMKWWFuZyBYdQo+IFRoYW5rcywKPiBYaWFvIFlhbmcKPj4gUmVwb3J0ZWQtYnk6IFBhbmth
aiBWaW5hZHJhbyBKb3NoaTxQYW5rYWouVkpAZXhhbGVhcHNlbWkuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBZYW5nIFh1PHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+Cj4+IC0tLQo+PiDCoCB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMgfCAzICsrKwo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMgCj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9raWxsL2tpbGwxMS5jCj4+IGluZGV4IDgzZmJhNWJlYi4uNWY3MGIwYTA3IDEwMDY0NAo+
PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMKPj4gKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9raWxsL2tpbGwxMS5jCj4+IEBAIC0yMDEsNiArMjAx
LDkgQEAgdm9pZCBzZXR1cCh2b2lkKQo+Pgo+PiDCoMKgwqDCoMKgIFNBRkVfR0VUUkxJTUlUKE5V
TEwsIFJMSU1JVF9DT1JFLCZybGltKTsKPj4KPj4gK8KgwqDCoCBpZiAocmxpbS5ybGltX21heDzC
oCBNSU5fUkxJTUlUX0NPUkUpCj4+ICvCoMKgwqDCoMKgwqDCoCB0c3RfYnJrbShUQ09ORiwgTlVM
TCwgImhhcmQgbGltaXQoJWx1KWxlc3MgdGhhbiAKPj4gTUlOX1JMSU1UX0NPUkUoJWkpIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBybGltLnJsaW1fbWF4LCBNSU5fUkxJTUlU
X0NPUkUpOwo+PiDCoMKgwqDCoMKgIGlmIChybGltLnJsaW1fY3VyPMKgIE1JTl9STElNSVRfQ09S
RSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdHN0X3Jlc20oVElORk8sICJBZGp1c3RpbmcgUkxJ
TUlUX0NPUkUgdG8gJWkiLCAKPj4gTUlOX1JMSU1JVF9DT1JFKTsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJsaW0ucmxpbV9jdXIgPSBNSU5fUkxJTUlUX0NPUkU7Cj4gCgoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
