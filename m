Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278F45C20
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:06:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68A2C294AD4
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:06:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0972B3EA505
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:06:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1FE51002044
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:06:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 150F1AD0C
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 12:06:11 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:06:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Michael Moese <mmoese@suse.de>
Message-ID: <20190614120610.GA8796@rei.lan>
References: <20190614111310.30548-1-mmoese@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614111310.30548-1-mmoese@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] Add a regression test for CVE-2017-1000380
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gK3N0YXRpYyB2b2lkICppb2N0bF90aHJlYWQodm9pZCAqdW51c2VkKQo+ICt7Cj4gKwko
dm9pZCkgdW51c2VkOwo+ICsJaW50IHRyZWFkX2FyZyA9IDE7Cj4gKwlzdHJ1Y3Qgc25kX3RpbWVy
X3NlbGVjdCB0czsKPiArCXN0cnVjdCBzbmRfdGltZXJfcGFyYW1zIHRwOwo+ICsKPiArCXdoaWxl
ICh0c3RfZnpzeW5jX3J1bl9iKCZmenN5bmNfcGFpcikpIHsKPiArCj4gKwkJaW9jdGwoc25kX2Zk
LCBTTkRSVl9USU1FUl9JT0NUTF9UUkVBRCwgJnRyZWFkX2FyZyk7Cj4gKwo+ICsJCW1lbXNldCgm
dHMsIDAsIHNpemVvZih0cykpOwo+ICsJCXRzLmlkLmRldl9jbGFzcyA9IDE7Cj4gKwkJaW9jdGwo
c25kX2ZkLCBTTkRSVl9USU1FUl9JT0NUTF9TRUxFQ1QsICZ0cyk7Cj4gKwo+ICsJCW1lbXNldCgm
dHAsIDAsIHNpemVvZih0cCkpOwo+ICsJCXRwLnRpY2tzID0gMTsKPiArCQl0cC5maWx0ZXIgPSAw
eGY7Cj4gKwkJaW9jdGwoc25kX2ZkLCBTTkRSVl9USU1FUl9JT0NUTF9QQVJBTVMsICZ0cCk7CgpJ
IGd1ZXNzIHRoYXQgd2UgY2FuIGRvIHRoZXNlIHR3byBidWZmZXIgaW5pdGlhbGl6YXRpb25zIG91
dHNpZGUgb2YgdGhlCmxvb3AsIGJ1dCBJIGd1ZXNzIGNvbXBhcmVkIHRvIHRoZSB0aW1lIHNwZW5k
IGluIHRoZSBzeXNjYWxsIGl0IHdvdWxkCm5lZ2xlY3RpYmxlLgoKPiArCQlpb2N0bChzbmRfZmQs
IFNORFJWX1RJTUVSX0lPQ1RMX1NUQVJULCAwKTsKPiArCj4gKwkJdHN0X2Z6c3luY19lbmRfcmFj
ZV9iKCZmenN5bmNfcGFpcik7Cj4gKwl9Cj4gKwlyZXR1cm4gTlVMTDsKCkhpbnQ6IFdlIGNhbiBk
byByZXR1cm4gdW51c2VkOyBoZXJlIGluc3RlYWQgb2YgdGhlIHZvaWQgY2FzdC4KCj4gK30KPiAr
Cj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gK3sKPiArCXRzdF9menN5bmNfcGFpcl9pbml0
KCZmenN5bmNfcGFpcik7Cj4gKwl0c3RfdGFpbnRfaW5pdChUU1RfVEFJTlRfVyB8IFRTVF9UQUlO
VF9EKTsKPiArCXNuZF9mZCA9IFNBRkVfT1BFTigiL2Rldi9zbmQvdGltZXIiLAo+ICsJCQlPX1JE
T05MWXxPX0NSRUFUfE9fTk9DVFRZfE9fU1lOQ3xPX0xBUkdFRklMRSwgMCk7Cj4gK30KPiArCj4g
K3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiArewo+ICsJdHN0X2Z6c3luY19wYWlyX2NsZWFu
dXAoJmZ6c3luY19wYWlyKTsKPiArCVNBRkVfQ0xPU0Uoc25kX2ZkKTsKPiArfQo+ICsKPiArc3Rh
dGljIHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArCXNpemVfdCBsZW47Cj4gKwlpbnQgc2l6ZTsKPiAr
CXN0cnVjdCBpb3ZlYyBpb3Y7Cj4gKwlwdGhyZWFkX3QgdGg7Cj4gKwljaGFyIHJlYWRfYnVmW01B
WF9CVUZTSVpFXTsKPiArCWludCBpLCBueiA9IDA7Cj4gKwlwdGhyZWFkX2F0dHJfdCB0aHJlYWRf
YXR0cjsKPiArCj4gKwlwdGhyZWFkX2F0dHJfaW5pdCgmdGhyZWFkX2F0dHIpOwo+ICsJcHRocmVh
ZF9hdHRyX3NldGRldGFjaHN0YXRlKCZ0aHJlYWRfYXR0ciwgUFRIUkVBRF9DUkVBVEVfREVUQUNI
RUQpOwo+ICsJU0FGRV9QVEhSRUFEX0NSRUFURSgmdGgsICZ0aHJlYWRfYXR0ciwgaW9jdGxfdGhy
ZWFkLCBOVUxMKTsKPiArCj4gKwlpb3YuaW92X2Jhc2UgPSByZWFkX2J1ZjsKPiArCWlvdi5pb3Zf
bGVuID0gc2l6ZW9mKHJlYWRfYnVmKTsKPiArCj4gKwl3aGlsZSAodHN0X2Z6c3luY19ydW5fYSgm
ZnpzeW5jX3BhaXIpKSB7Cj4gKwkJbWVtc2V0KHJlYWRfYnVmLCAwLCBzaXplb2YocmVhZF9idWYp
KTsKPiArCQlzaXplID0gcmVhZHYoc25kX2ZkLCAmaW92LCAxKTsKPiArCj4gKwkJdHN0X2Z6c3lu
Y19lbmRfcmFjZV9hKCZmenN5bmNfcGFpcik7Cj4gKwo+ICsJCS8qIGNoZWNrIGlmIGl0IGNvdWxk
IGJlIGEgdmFsaWQgaW9jdGwgcmVzdWx0ICovCj4gKwkJaWYgKHNpemUgPT0gMCkKPiArCQkJY29u
dGludWU7Cj4gKwo+ICsJCS8qIGNoZWNrIGlmIHRoZSBidWZmZXIgaXMgICovCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCQkJCQkgIG5vbi1lbXB0eT8KPiArCQlm
b3IgKGkgPSAwOyBpIDwgc2l6ZTsgaSsrKSB7Cj4gKwkJCWlmIChyZWFkX2J1ZltpXSkgewo+ICsJ
CQkJbnogPSAxOwo+ICsJCQkJYnJlYWs7Cj4gKwkJCX0KPiArCQl9Cj4gKwkJaWYgKCFueikKPiAr
CQkJY29udGludWU7CgpBbHNvIEkgZG8gbm90IHJlYWxseSBnZXQgdGhpcyBwYXJ0LCB3ZSBkbyBu
b3QgcmVzZXQgdGhlIG56IGF0IGFsbCBzbwp0aGlzIGlzIGluZWZmZWN0aXZlIGFmdGVyIGZpc3Qg
bm9uLXplcm8gYnVmZmVyLgoKPiArCQlsZW4gPSBzdHJsZW4ocmVhZF9idWYpOwoKSXNuJ3QgdGhl
cmUgYSBwb3NzaWJpbGl0eSB0aGF0IHRoZSBidWZmZXIgd2FzIGZpbGxlZCBjb21wbGVsZXR5IHdp
dGgKbm9uLXplcm8gY2hhcmFjdGVycz8gQ2FuJ3Qgd2UganVzdCBzdG9yZSB0aGUgcG9zaXRpb24g
b2YgdGhlIGxhc3QKbm9uLXplcmVvIGJ5dGUgaW4gdGhlIGxvb3AgYWJvdmU/Cgo+ICsJCS8qIHRo
ZSBrZXJuZWwncyBzdHJ1Y3Qgc25kX3RpbWVyX3JlYWQgaXMgdHdvIHVuc2lnbmVkIGludGVnZXJz
Ki8KPiArCQlpZiAobGVuIDw9IDIgKiBzaXplb2YodW5zaWduZWQgaW50KSkKPiArCQkJY29udGlu
dWU7Cj4gKwo+ICsJCXRzdF9yZXMoVEZBSUwsICJrZXJuZWwgc2VlbXMgdnVsbmVyYWJsZSIpOwo+
ICsJCXJldHVybjsKPiArCX0KPiArCj4gKwlpZiAodHN0X3RhaW50X2NoZWNrKCkgIT0gMCkKPiAr
CQl0c3RfcmVzKFRGQUlMLCAia2VybmVsIHNlZW1zIHZ1bG5lcmFibGUiKTsKPiArCWVsc2UKPiAr
CQl0c3RfcmVzKFRQQVNTLCAia2VybmVsIHNlZW1zIG5vdCB2dWxuZXJhYmxlIik7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiArCS50ZXN0X2FsbCA9IHJ1biwK
PiArCS5zZXR1cCA9IHNldHVwLAo+ICsJLmNsZWFudXAgPSBjbGVhbnVwLAo+ICt9OwoKQW5kIGxh
c3RseSBidXQgbm90IGxlYXN0LCBjYW4gd2UgbmFtZSB0aGlzIHNuZF90aW1lcjAxIHNvIHRoYXQg
d2UgZG9uJ3QKaGF2ZSB0byByZW5hbWUgaXQgaW4gYSBjYXNlIHRoYXQgc29tZW9uZSB3aWxsIHdy
aXRlIHNvdW5kIHRpbWVyIHRlc3RzPwoKT3RoZXIgdGhhbiB0aGUgbWlub3Igbml0cyBpdCBsb29r
cyBmaW5lLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
