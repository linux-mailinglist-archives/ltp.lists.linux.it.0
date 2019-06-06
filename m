Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E7C37351
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:50:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F4C73EAA55
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 13:50:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EB4493EA9D5
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:50:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BFDF81A01234
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:50:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E082FAF38
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:50:01 +0000 (UTC)
Date: Thu, 6 Jun 2019 13:49:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190606114956.GA27083@rei>
References: <20190606090009.31124-1-camann@suse.com>
 <20190606090009.31124-2-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606090009.31124-2-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/fstat{03,05}: rewrote testcases
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

SGkhCj4gK3N0YXRpYyB2b2lkIHNpZ2hhbmRsZXIoaW50IHNpZyBMVFBfQVRUUklCVVRFX1VOVVNF
RCkKPiAgewo+IC0Jc3RydWN0IHN0YXQgc3RhdF9idWY7CS8qIHN0YXQgc3RydWN0dXJlIGJ1ZmZl
ciAqLwo+IC0JaW50IGxjOwo+IC0KPiAtCXRzdF9wYXJzZV9vcHRzKGFjLCBhdiwgTlVMTCwgTlVM
TCk7Cj4gLQo+IC0JLyoKPiAtCSAqIEludm9rZSBzZXR1cCBmdW5jdGlvbiB0byBjcmVhdGUgYSB0
ZXN0ZmlsZSB1bmRlciB0ZW1wb3JhcnkKPiAtCSAqIGRpcmVjdG9yeS4KPiAtCSAqLwo+IC0Jc2V0
dXAoKTsKPiArCXRzdF9yZXMoVFBBU1MsICJmc3RhdCgpIGZhaWxlZCBhcyBleHBlY3RlZCB3aXRo
IFNJR1NFR1YiKTsKPiArCWV4aXQoMCk7Cj4gK30KClRlY2huaWNhbGx5IHlvdSBzaG91bGQgbm90
IHVzZSBhbnl0aGluZyBidXQgc2lnbmFsLWFzeW5jLXNhZmUgZnVuY3Rpb25zCmluIHNpZ25hbCBo
YW5kbGVycyBhbmQgd2hpbGUgdGhpcyB3b3VsZCB3b3JrIGZpbmUgbW9zdCBvZiB0aGUgdGltZSBp
dAptYXkgZGVhZGxvY2sgdGhlIHByb2Nlc3MgdW5kZXIgY2VydGFpbiBjaXJjdW1zdGF0bmNlcy4K
ClNvIHRoZSBiZXN0IHdheSBob3cgdG8gaGFuZGxlIHRoaXMgaXMgdG8gbGV0IHRoZSBjaGlsZCBz
ZWdmYXVsdCB0aGVuIGRvClNBRkVfV0FJVFBJRCgpIGFuZCBleGFtaW5lIHRoZSBzdGF0dXMgdmFs
dWUuCgo+IC0JZm9yIChsYyA9IDA7IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKPiArc3RhdGlj
IHZvaWQgY2hlY2tfZnN0YXQodW5zaWduZWQgaW50IHRjX251bSkKPiArewo+ICsJc3RydWN0IHRj
YXNlICp0YyA9ICZ0Y2FzZXNbdGNfbnVtXTsKPiAgCj4gLQkJdHN0X2NvdW50ID0gMDsKPiAtCQkv
Kgo+IC0JCSAqIENhbGwgZnN0YXQoMikgdG8gZ2V0IHRoZSBzdGF0dXMgaW5mb3JtYXRpb24KPiAt
CQkgKiBvZiBhIGNsb3NlZCB0ZXN0ZmlsZSBwb2ludGVkIHRvIGJ5ICdmZCcuCj4gLQkJICogdmVy
aWZ5IHRoYXQgZnN0YXQgZmFpbHMgd2l0aCAtMSByZXR1cm4gdmFsdWUgYW5kCj4gLQkJICogc2V0
cyBhcHByb3ByaWF0ZSBlcnJuby4KPiAtCQkgKi8KPiAtCQlURVNUKGZzdGF0KGZpbGRlcywgJnN0
YXRfYnVmKSk7Cj4gKwlpZiAodGNfbnVtID09IDEpCj4gKwkJc2lnbmFsKFNJR1NFR1YsICZzaWdo
YW5kbGVyKTsKPiAgCj4gLQkJLyogQ2hlY2sgcmV0dXJuIGNvZGUgZnJvbSBmc3RhdCgyKSAqLwo+
IC0JCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgewo+IC0JCQlpZiAoVEVTVF9FUlJOTyA9PSBFQkFE
Rikgewo+IC0JCQkJdHN0X3Jlc20oVFBBU1MsCj4gLQkJCQkJICJmc3RhdCgpIGZhaWxzIHdpdGgg
ZXhwZWN0ZWQgZXJyb3IgRUJBREYiKTsKPiAtCQkJfSBlbHNlIHsKPiAtCQkJCXRzdF9yZXNtKFRG
QUlMIHwgVFRFUlJOTywKPiAtCQkJCQkgImZzdGF0KCkgZGlkIG5vdCBmYWlsIHdpdGggRUJBREYi
KTsKPiAtCQkJfQo+ICsJVEVTVChmc3RhdCgqdGMtPmZkLCB0Yy0+c3RhdF9idWYpKTsKPiArCWlm
IChUU1RfUkVUID09IC0xKSB7Cj4gKwkJaWYgKHRjLT5leHBfZXJyID09IFRTVF9FUlIpIHsKPiAr
CQkJdHN0X3JlcyhUUEFTUywKPiArCQkJCSAiZnN0YXQoKSBmYWlscyB3aXRoIGV4cGVjdGVkIGVy
cm9yICVzIiwKPiArCQkJCSB0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKPiAgCQl9IGVsc2Ug
ewo+IC0JCQl0c3RfcmVzbShURkFJTCwgImZzdGF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3RlZCAt
MSIsCj4gLQkJCQkgVEVTVF9SRVRVUk4pOwo+ICsJCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywK
PiArCQkJCSAiZnN0YXQoKSBkaWQgbm90IGZhaWwgd2l0aCAlcywgYnV0IHdpdGgiLAo+ICsJCQkJ
IHRzdF9zdHJlcnJubyh0Yy0+ZXhwX2VycikpOwo+ICAJCX0KPiArCX0gZWxzZSB7Cj4gKwkJdHN0
X3JlcyhURkFJTCwgImZzdGF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3RlZCAtMSIsCj4gKwkJCSBU
U1RfUkVUKTsKPiAgCX0KPiAtCj4gLQkvKgo+IC0JICogSW52b2tlIGNsZWFudXAoKSB0byBkZWxl
dGUgdGhlIHRlc3QgZGlyZWN0b3J5L2ZpbGUocykgY3JlYXRlZAo+IC0JICogaW4gdGhlIHNldHVw
KCkuCj4gLQkgKi8KPiAtCWNsZWFudXAoKTsKPiAtCj4gLQl0c3RfZXhpdCgpOwo+ICB9Cj4gIAo+
IC0vKgo+IC0gKiB2b2lkCj4gLSAqIHNldHVwKHZvaWQpIC0gcGVyZm9ybXMgYWxsIE9ORSBUSU1F
IHNldHVwIGZvciB0aGlzIHRlc3QuCj4gLSAqCUV4aXQgdGhlIHRlc3QgcHJvZ3JhbSBvbiByZWNl
aXB0IG9mIHVuZXhwZWN0ZWQgc2lnbmFscy4KPiAtICoJQ3JlYXRlIGEgdGVtcG9yYXJ5IGRpcmVj
dG9yeSBhbmQgY2hhbmdlIGRpcmVjdG9yeSB0byBpdC4KPiAtICogICAgICBDcmVhdGUgYSB0ZXN0
ZmlsZSB1bmRlciB0ZW1wb3JhcnkgZGlyZWN0b3J5Lgo+IC0gKiAgICAgIENsb3NlIHRoZSB0ZXN0
ZmlsZS4KPiAtICovCj4gLXZvaWQgc2V0dXAodm9pZCkKPiArc3RhdGljIHZvaWQgcnVuKHVuc2ln
bmVkIGludCB0Y19udW0pCj4gIHsKPiAtCS8qIENhcHR1cmUgdW5leHBlY3RlZCBzaWduYWxzICov
Cj4gLQl0c3Rfc2lnKE5PRk9SSywgREVGX0hBTkRMRVIsIGNsZWFudXApOwo+IC0KPiAtCVRFU1Rf
UEFVU0U7Cj4gLQo+IC0JLyogTWFrZSBhIHRlbXAgZGlyIGFuZCBjZCB0byBpdCAqLwo+IC0JdHN0
X3RtcGRpcigpOwo+ICsJcGlkX3QgcGlkOwo+ICAKPiAtCS8qIENyZWF0ZSBhIHRlc3RmaWxlIHVu
ZGVyIHRlbXBvcmFyeSBkaXJlY3RvcnkgKi8KPiAtCWZpbGRlcyA9IFNBRkVfT1BFTihjbGVhbnVw
LCBURVNUX0ZJTEUsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NjYpOwo+IC0KPiAtCVNBRkVfQ0xPU0Uo
Y2xlYW51cCwgZmlsZGVzKTsKPiArCXBpZCA9IFNBRkVfRk9SSygpOwo+ICsJaWYgKHBpZCA9PSAw
KSB7Cj4gKwkJY2hlY2tfZnN0YXQodGNfbnVtKTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwl0c3Rf
cmVhcF9jaGlsZHJlbigpOwo+ICB9Cj4gIAo+IC0vKgo+IC0gKiB2b2lkCj4gLSAqIGNsZWFudXAo
KSAtIFBlcmZvcm1zIGFsbCBPTkUgVElNRSBjbGVhbnVwIGZvciB0aGlzIHRlc3QgYXQKPiAtICog
ICAgICAgICAgICAgY29tcGxldGlvbiBvciBwcmVtYXR1cmUgZXhpdC4KPiAtICoJUHJpbnQgdGVz
dCB0aW1pbmcgc3RhdHMgYW5kIGVycm5vIGxvZyBpZiB0ZXN0IGV4ZWN1dGVkIHdpdGggb3B0aW9u
cy4KPiAtICoJQ2xvc2UgdGhlIHRlc3RmaWxlIGlmIHN0aWxsIG9wZW5lZC4KPiAtICoJUmVtb3Zl
IHRlbXBvcmFyeSBkaXJlY3RvcnkgYW5kIHN1Yi1kaXJlY3Rvcmllcy9maWxlcyB1bmRlciBpdAo+
IC0gKgljcmVhdGVkIGR1cmluZyBzZXR1cCgpLgo+IC0gKglFeGl0IHRoZSB0ZXN0IHByb2dyYW0g
d2l0aCBub3JtYWwgZXhpdCBjb2RlLgo+IC0gKi8KPiAtdm9pZCBjbGVhbnVwKHZvaWQpCj4gK3N0
YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gIHsKPiArCWZkX2ViYWRmID0gU0FGRV9PUEVOKFRFU1RG
SUxFLCBPX1JEV1IgfCBPX0NSRUFULCAwNjQ0KTsKPiArCVNBRkVfQ0xPU0UoZmRfZWJhZGYpOwoK
QWN0dWFsbHkgdGhpcyBpcyBraW5kIG9mIHVzZWxlc3Mgc2luY2UgdGhlIFNBRkVfQ0xPU0UoKSBz
ZXRzIHRoZQpmZF9lYmFkZmQgdG8gLTEuCgpBbmQgd2UgZXZlbiBoYXZlIHRzdF9nZXRfdW51c2Vk
X3BpZCgpIGZ1bmN0aW9uIGV4YWN0bHkgZm9yIHRoaXMuCgo+ICsJZmRfb2sgPSBTQUZFX09QRU4o
VEVTVEZJTEUsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NDQpOwo+ICt9Cj4gIAo+IC0JdHN0X3JtZGly
KCk7Cj4gLQoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
