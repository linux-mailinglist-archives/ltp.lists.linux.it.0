Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611F4287F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 16:13:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 342473EAE3B
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 16:13:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7CA363EA6D9
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 16:13:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 250E31401842
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 16:13:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63953B02B
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 14:13:23 +0000 (UTC)
Date: Wed, 12 Jun 2019 16:13:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190612141322.GB15090@x230>
References: <20190604114702.28255-1-camann@suse.com>
 <20190604114702.28255-3-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604114702.28255-3-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 4/4] syscalls/pidfd_send_signal03
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiBBZGQgdGVzdGNhc2UgdG8gY2hlY2sgaWYgdGhlIHN5c2NhbGwgd2lsbCBzZW5kIGEgc2lnbmFs
Cj4gdG8gYSBwcm9jZXNzIHdpdGggdGhlIHNhbWUgUElEIGFzIHRoZSB0YXJnZXRlZCBwcm9jZXNz
LgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CgpMR1RNLCB0aGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCgo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRf
c2VuZF9zaWduYWwvcGlkZmRfc2VuZF9zaWduYWwwMy5jCi4uLgo+ICsjZGVmaW5lIF9HTlVfU09V
UkNFCkkgZ3Vlc3MgdGhpcyBpcyBub3QgbmVlZGVkLgo+ICsKPiArI2luY2x1ZGUgPHNpZ25hbC5o
Pgo+ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICsjaW5jbHVk
ZSAicGlkZmRfc2VuZF9zaWduYWwuaCIKPiArI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJlYWQuaCIK
PiArLy8jaW5jbHVkZSAidHN0X3NhZmVfZmlsZV9vcHMuaCIKUmV2aWV3ZXIgc2hvdWxkIHJlbW92
ZSB0aGlzIGNvbW1lbnQuCgo+ICsKPiArI2RlZmluZSBQSURUUklFUwkzCj4gKwo+ICtzdGF0aWMg
Y2hhciAqbGFzdF9waWRfZmlsZTsKPiArc3RhdGljIGludCBwaWRmZCwgbmV3X3BpZGZkOwo+ICtz
dGF0aWMgaW50IG9sZF9pbm9kZSwgbmV3X2lub2RlOwo+ICsKPiArc3RhdGljIGludCBnZXRfaW5v
ZGVfbnVtYmVyKGludCBmZCkKPiArewo+ICsJc3RydWN0IHN0YXQgZmlsZV9zdGF0Owo+ICsKPiAr
CVNBRkVfRlNUQVQoZmQsICZmaWxlX3N0YXQpOwo+ICsJcmV0dXJuIGZpbGVfc3RhdC5zdF9pbm87
Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHZlcmlmeV9waWRmZF9zZW5kX3NpZ25hbCh2b2lkKQo+
ICt7Cj4gKwlwaWRfdCBwaWQsIG5ld19waWQ7Cj4gKwljaGFyIHBpZF9maWxlbmFtZVszMl07Cj4g
KwljaGFyIHBpZF9zdHJbMTZdOwo+ICsJaW50IGksIGZhaWw7Cj4gKwo+ICsJZmFpbCA9IDE7Cj4g
Kwlmb3IgKGkgPSAwOyBpIDwgUElEVFJJRVM7IGkrKykgewo+ICsJCXBpZCA9IFNBRkVfRk9SSygp
Owo+ICsJCWlmIChwaWQgPT0gMCkgewo+ICsJCQlUU1RfQ0hFQ0tQT0lOVF9XQUlUKDApOwo+ICsJ
CQlyZXR1cm47Cj4gKwkJfQo+ICsKPiArCQlzcHJpbnRmKHBpZF9maWxlbmFtZSwgIi9wcm9jLyVk
IiwgcGlkKTsKPiArCQlwaWRmZCA9IFNBRkVfT1BFTihwaWRfZmlsZW5hbWUsIE9fRElSRUNUT1JZ
IHwgT19DTE9FWEVDKTsKPiArCQlvbGRfaW5vZGUgPSBnZXRfaW5vZGVfbnVtYmVyKHBpZGZkKTsK
PiArCj4gKwkJVFNUX0NIRUNLUE9JTlRfV0FLRSgwKTsKPiArCQl0c3RfcmVhcF9jaGlsZHJlbigp
Owo+ICsKPiArCQkvKiBNYW5pcHVsYXRlIFBJRCBmb3IgbmV4dCBwcm9jZXNzICovCj4gKwkJc3By
aW50ZihwaWRfc3RyLCAiJWQiLCBwaWQgLSAxKTsKPiArCQlTQUZFX0ZJTEVfUFJJTlRGKGxhc3Rf
cGlkX2ZpbGUsIHBpZF9zdHIpOwo+ICsKPiArCQluZXdfcGlkID0gU0FGRV9GT1JLKCk7Cj4gKwkJ
aWYgKG5ld19waWQgPT0gMCkgewo+ICsJCQlUU1RfQ0hFQ0tQT0lOVF9XQUlUKDApOwo+ICsJCQly
ZXR1cm47Cj4gKwkJfQo+ICsKPiArCQlpZiAobmV3X3BpZCA9PSBwaWQpIHsKPiArCQkJbmV3X3Bp
ZGZkID0gU0FGRV9PUEVOKHBpZF9maWxlbmFtZSwKPiArCQkJCQlPX0RJUkVDVE9SWSB8IE9fQ0xP
RVhFQyk7Cj4gKwkJCW5ld19pbm9kZSA9IGdldF9pbm9kZV9udW1iZXIobmV3X3BpZGZkKTsKPiAr
CQkJU0FGRV9DTE9TRShuZXdfcGlkZmQpOwo+ICsJCQlmYWlsID0gMDsKPiArCQkJYnJlYWs7Cj4g
KwkJfQo+ICsKPiArCQlpZiAoaSA8IFBJRFRSSUVTKSB7Cj4gKwkJCXRzdF9yZXMoVElORk8sCj4g
KwkJCQkiRmFpbGVkIHRvIHNldCBjb3JyZWN0IFBJRCwgdHJ5aW5nIGFnYWluLi4uIik7Cj4gKwkJ
fQo+ICsJCVNBRkVfQ0xPU0UocGlkZmQpOwo+ICsJCVRTVF9DSEVDS1BPSU5UX1dBS0UoMCk7Cj4g
KwkJdHN0X3JlYXBfY2hpbGRyZW4oKTsKPiArCX0KPiArCWlmIChmYWlsKSB7Cj4gKwkJdHN0X2Jy
ayhUQlJPSywKPiArCQkJIkNvdWxkIG5vdCBzZXQgbmV3IGNoaWxkIHRvIHNhbWUgUElEIGFzIHRo
ZSBvbGQgb25lISIpOwo+ICsJfQo+ICsJaWYgKG9sZF9pbm9kZSA9PSBuZXdfaW5vZGUpIHsKPiAr
CQl0c3RfcmVzKFRXQVJOLAo+ICsJCQkiRmlsZSBkZXNjcmlwdG9yIG9mIG5ldyBwcm9jZXNzIHBv
aW50cyB0byB0aGUgaW5vZGUgIgo+ICsJCQkib2YgdGhlIG9sZCBwcm9jZXNzISIpOwpJJ2Qgam9p
biB0aGlzIHN0cmluZyBvbiBhIHNpbmdsZSBsaW5lLiBBbHNvIG5vdCBzdXJlIGlmIHRoaXMgaXMg
bm90IFRGQUlMLApidXQgcHJvYmFibHkgbm90LgoKPiArCX0KPiArCj4gKwlURVNUKHBpZGZkX3Nl
bmRfc2lnbmFsKHBpZGZkLCBTSUdVU1IxLCBOVUxMLCAwKSk7Cj4gKwlpZiAoVFNUX1JFVCA9PSAt
MSAmJiBUU1RfRVJSID09IEVTUkNIKSB7Cj4gKwkJdHN0X3JlcyhUUEFTUywKPiArCQkJIkRpZCBu
b3Qgc2VuZCBzaWduYWwgdG8gd3JvbmcgcHJvY2VzcyB3aXRoIHNhbWUgUElEISIpOwo+ICsJfSBl
bHNlIHsKPiArCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywKPiArCQkJInBpZGZfc2VuZF9zaWdu
YWwoKSBlbmRlZCB1bmV4cGVjdGVkbHkgLSByZXR1cm4gdmFsdWU6ICVsZCwgZXJyb3IiLAo+ICsJ
CQlUU1RfUkVUKTsKPiArCX0KPiArCVRTVF9DSEVDS1BPSU5UX1dBS0UoMCk7Cj4gKwl0c3RfcmVh
cF9jaGlsZHJlbigpOwo+ICsKPiArCVNBRkVfQ0xPU0UocGlkZmQpOwpBIGJpdCByZXBlYXRpbmcg
eW91cnNlbGYsIGJ1dCBub3QgaW1wb3J0YW50LgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
