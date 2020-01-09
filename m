Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B2135319
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 07:17:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6C833C24D2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 07:17:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B94623C23D9
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 07:17:23 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D8D6B600722
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 07:17:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,412,1571673600"; d="scan'208";a="81517986"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 14:17:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0A58B4CE20F8;
 Thu,  9 Jan 2020 14:08:14 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 14:17:14 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1576577571-3668-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200107133913.GE26408@rei.lan>
 <e6cada30-fb4e-a2e0-72e9-cdfc796361cb@cn.fujitsu.com>
 <20200108110343.GA3318@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <cb1878f7-a00a-f5d1-c55f-6f80ff01cb6b@cn.fujitsu.com>
Date: Thu, 9 Jan 2020 14:17:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200108110343.GA3318@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0A58B4CE20F8.A1602
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/capset03: add new EPERM error
 test without CAP_SETPCAP
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gSGkhCj4+Pj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4+Pj4gK3sKPj4+PiArCXBp
ZF90IHBpZDsKPj4+PiArCj4+Pj4gKwlwaWQgPSBnZXRwaWQoKTsKPj4+PiArCWhlYWRlci5waWQg
PSBwaWQ7Cj4+Pj4gKwlpZiAoZ2V0ZXVpZCgpID09IDApIHsKPj4+PiArCQlURVNUKHRzdF9zeXNj
YWxsKF9fTlJfY2Fwc2V0LCAmaGVhZGVyLCBkYXRhKSk7Cj4+Pj4gKwkJaWYgKFRTVF9SRVQgPT0g
LTEpCj4+Pj4gKwkJCXRzdF9icmsoVEJST0sgfCBUVEVSUk5PLCAiY2Fwc2V0IGRhdGEgZmFpbGVk
Iik7Cj4+Pj4gKwl9Cj4+Pgo+Pj4gUGxlYXNlIGRvbid0IGRvIHRoYXQuIElmIHRlc3RzIG5lZWRz
IHJvb3QgKGV2ZW4gZm9yIGEgc3Vic2V0IG9mIHRoZQo+Pj4gdGVzdCkganVzdCBzZXQgdGhlIC5u
ZWVkc19yb290IGZsYWcuCj4+Pgo+PiBUaGlzIHRlc3QgZG9lc24ndCBuZWVkIHJvb3QuIFRoZXNl
IGNvZGUgaXMgZGVzaWduZWQgdG8gY3JlYXRlIGEKPj4gZW52cmlvbm1lbnQgZm9yIHJvb3QgdXNl
ciB0byBnZW5lcmF0ZSB0aGlzIHR5cGUgRVBFUk0KPj4gZXJyb3I/P25ld19Jbmhlcml0YWJsZSBp
cyBub3QgYSBzdWJzZXQgb2Ygb2xkX0luaGVyaXRhYmxlIGFuZAo+PiBvbGRfUGVybWl0dGVkIHdp
dGhvdXQgQ0FQX1NFVFBDQVA/Py4KPj4gcm9vdCB1c2VyOgo+PiBvbGQgcEk6IENBUF9LSUxMCj4+
IG9sZCBwUDogQ0FQX0tJTEwKPj4gbmV3IHBJOiBDQVBfS0lMTCArIENBUF9ORVRfUkFXCj4+Cj4+
IG90aGVyIHVzZXI6Cj4+IG9sZCBwSTogMAo+PiBvbGQgcFA6IDAKPj4gbmV3IHBJOiBDQVBfS0lM
TCArIENBUF9ORVRfUkFXCj4+Cj4+IG90aGVyIHVzZXIgYWxzbyBtZXQgY29uZGl0aW9uIGFuZCBj
YW4gZ2VuZXJhdGUgdGhpcyBFUEVSTSBlcnJvci4KPiAKPiBIbW0sIHdlIGFyZSB0ZXN0aW5nIGRp
ZmZlcmVudCB0aGluZ3MgdW5kZXIgcm9vdCBhbmQgbm9uLXJvb3QgdGhlbi4gV2hlbgo+IHRoZSB0
ZXN0IGlzIGV4ZWN1dGVkIHVuZGVyIGEgcmVndWxhciB1c2VyIHdlIGFzc2VydCB0aGF0IHRoZSBz
eXN0ZW0KPiBkZWZhdWx0IGlzIHNhbmUgKyB0aGUgY2Fwc2V0IGFzc2VydGlvbiwgd2hpbGUgdW5k
ZXIgdGhlIHJvb3Qgd2UgdGVzdAo+IG9ubHkgY2Fwc2V0Lgo+IAo+IEl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8gcnVuIHRoZSB0ZXN0IG9ubHkgdW5kZXIgcm9vdCB0byBtYWtlIHN1cmUgdGhhdCB3ZQo+
IGFyZSBjb25zaXN0ZW50Lgo+IApPay4gSSB3aWxsIG1ha2UgdGhpcyBjYXNlIGNvbnNpc3RlbnQg
YW5kIGFkZCAubmVlZF9yb290IGZsYWcuCj4gQWxzbyB0aGUgQ0FQX0RST1AgaW4gdGhlIHRzdF90
ZXN0IHN0cnVjdHVyZSBzZWVtcyB0byBiZSB1c2VsZXNzIHRvIG1lLgo+IAo+IAo+IExvb2tpbmcg
YXQgbWFuIDcgY2FwYWJpbGl0aWVzLCB0aGVyZSBhcmUgYWxzbyB0cmFuc2l0aW9ucyBkZWZpbmVk
IGZvcgo+IHdoYXQgaXMgc3VwcG9zZWQgdG8gaGFwcGVuIHdoZW4gd2UgY2hhbmdlIHVzZXIgaWQu
IEl0IHdvdWxkIG1ha2Ugc2Vuc2UKPiB0byB3cml0ZSB0ZXN0cyB0aGF0IGNhcGFiaWxpdGllcyBh
cmUgY29ycmVjdGx5IGRyb3BwZWQgd2hlbiBVSUQgY2hhbmdlcwo+IGZyb20gMCB0byBub256ZXJv
LiBXaGljaCBpcyB3aGF0IHRoaXMgdGVzdCBpcyB0ZXN0aW5nIHdoZW4gZXhlY3V0ZWQgYXMKPiBu
b24tcm9vdCwgc2luY2UgdGhlIHRyYW5zaXRpb24gZnJvbSAwIHRvIG5vbnplcm8gbXVzdCBoYXZl
IGhhcHBlbmVkCj4gc29tZXdoZXJlIHdoZW4gdXNlciBoYXMgbG9nZ2VkIGluLgpJbiBtYW4gNyBj
YXBhYmlsaXRpZXMgIiBFZmZlY3Qgb2YgdXNlciBJRCBjaGFuZ2VzIG9uIGNhcGFiaWxpdGllcyIs
Ckkgc2VlIHRyYW5zaXRpb25zIGJldHdlZW4gMCBhbmQgbm9uemVybyB1c2VyIElEcy4gQnV0IGl0
IGlzIGFib3V0IApjYXBhYmlsaXRpZXOjrG5vdCBhYm91dCBjYXBzZXQgc3lzY2FsbC4gSSB0aGlu
ayB3ZSBzaG91bGQgYWRkIHRoZXNlIApjYXNlcyh1c2VyIElEIGNoYW5nZXMgb24gY2FwYWJpbGl0
aWVzKSBpbnRvIGtlcm5lbC9zZWN1cml0eSAoc3VjaCBhcyAKY2FwX2JvdW5kIG9yIGZpbGVjYXBz
KS4gSW4gY2Fwc2V0LCB3ZSBjYW4gb25seSB0ZXN0IGNhcHNldCB2YXJpb3VzIEVQRVJNIAplcnJv
ciBhcyBrZXJuZWwgc2VyY3VyaXR5L2NvbW1vbmNhcC5jICBjYXBfY2Fwc2V0IGZ1bmN0aW9uLgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgaWYgKGNhcF9pbmhfaXNfY2Fw
cGVkKCkgJiYKICAgICAgICAgICAgICFjYXBfaXNzdWJzZXQoKmluaGVyaXRhYmxlLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICBjYXBfY29tYmluZShvbGQtPmNhcF9pbmhlcml0YWJsZSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkLT5jYXBfcGVybWl0dGVkKSkp
CiAgICAgICAgICAgICAgICAgLyogaW5jYXBhYmxlIG9mIHVzaW5nIHRoaXMgaW5oZXJpdGFibGUg
c2V0ICovCiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKCiAgICAgICAgIGlmICghY2Fw
X2lzc3Vic2V0KCppbmhlcml0YWJsZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FwX2Nv
bWJpbmUob2xkLT5jYXBfaW5oZXJpdGFibGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG9sZC0+Y2FwX2JzZXQpKSkKICAgICAgICAgICAgICAgICAvKiBubyBuZXcgcEkg
Y2FwYWJpbGl0aWVzIG91dHNpZGUgYm91bmRpbmcgc2V0ICovCiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FUEVSTTsKCiAgICAgICAgIC8qIHZlcmlmeSByZXN0cmljdGlvbnMgb24gdGFyZ2V0J3Mg
bmV3IFBlcm1pdHRlZCBzZXQgKi8KICAgICAgICAgaWYgKCFjYXBfaXNzdWJzZXQoKnBlcm1pdHRl
ZCwgb2xkLT5jYXBfcGVybWl0dGVkKSkKICAgICAgICAgICAgICAgICByZXR1cm4gLUVQRVJNOwoK
ICAgICAgICAgLyogdmVyaWZ5IHRoZSBfbmV3X0VmZmVjdGl2ZV8gaXMgYSBzdWJzZXQgb2YgdGhl
IF9uZXdfUGVybWl0dGVkXyAqLwogICAgICAgICBpZiAoIWNhcF9pc3N1YnNldCgqZWZmZWN0aXZl
LCAqcGVybWl0dGVkKSkKICAgICAgICAgICAgICAgICByZXR1cm4gLUVQRVJNOwotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxzbywgaWYgd2Ugb25seSBydW4gdW5kZXIgcm9vdCwg
Q0FQX0RST1AoQ0FQX1NFVFBDQVApIGlzIG5lZWRlZCAgdG8gCnJlcHJvZHVjZSB0aGlzIEVQRVJN
IGVycm9yLgo+IAo+PiBwczogSW4gY2Fwc2V0MDMsIGdldHBpZCgpIGlzIHVzZWxlc3MsIHdlIGNh
biB1c2UgcGlkID0gMCB0byByZXBsYWNlLgo+PiBBbHNvLCBpZiB3ZSBjYW4gdXNlIHBpZCA9MCBp
biBlcnJvciB0ZXN0LCBtYXliZSB3ZSBkb24ndCBuZWVkIHRvIHRlc3QKPj4gcGlkID0wIGluIGNh
cGdldDAxL2NhcHNldDAxLmMgLiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdD8KPiAKPiBTdXJl
LiBXZSBjYW4gdXNlIDAgaW4gYWxsIHRlc3RzIGlmIHdlIGhhdmUgYSBsZWFzdCBvbmUgZm9yIGVh
Y2ggc3lzY2FsbAo+IHRoYXQgdGVzdHMgaXQgd2l0aCBwaWQgIT0gMC4KT2suIEkgd2lsbCBkbyBp
dC4KPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
