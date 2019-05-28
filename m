Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552B2C7B4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 15:22:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 370CC3EA4E9
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 15:22:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 431F13EA4D8
 for <ltp@lists.linux.it>; Tue, 28 May 2019 15:22:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3AD266011F6
 for <ltp@lists.linux.it>; Tue, 28 May 2019 15:22:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D44EAF0A
 for <ltp@lists.linux.it>; Tue, 28 May 2019 13:22:52 +0000 (UTC)
Date: Tue, 28 May 2019 15:22:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190528132251.GA25532@rei>
References: <20190515120116.11589-1-camann@suse.com>
 <20190515120116.11589-4-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515120116.11589-4-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1 4/4] syscalls/pidfd_send_signal03
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

SGkhCj4gKyNkZWZpbmUgX0dOVV9TT1VSQ0UKPiArCj4gKyNpbmNsdWRlIDxzaWduYWwuaD4KPiAr
I2luY2x1ZGUgPHN0ZGlvLmg+Cj4gKyNpbmNsdWRlIDx1bmlzdGQuaD4KPiArI2luY2x1ZGUgInBp
ZGZkX3NlbmRfc2lnbmFsLmgiCj4gKyNpbmNsdWRlICJ0c3Rfc2FmZV9wdGhyZWFkLmgiCj4gKwo+
ICsjZGVmaW5lIFBJRFRSSUVTCTMKPiArCj4gK3N0YXRpYyBjaGFyICpsYXN0X3BpZF9maWxlOwo+
ICtzdGF0aWMgaW50IHBpZGZkLCBsYXN0X3BpZGZkOwo+ICsKPiArc3RhdGljIHZvaWQgdmVyaWZ5
X3BpZGZkX3NlbmRfc2lnbmFsKHZvaWQpCj4gK3sKPiArCXBpZF90IHBpZCwgbmV3X3BpZDsKPiAr
CWNoYXIgcGlkX2ZpbGVuYW1lWzMyXTsKPiArCWNoYXIgcGlkX3N0clsxNl07Cj4gKwlpbnQgaSwg
ZmFpbDsKPiArCj4gKwlmYWlsID0gMTsKPiArCWZvciAoaSA9IDE7IGkgPD0gUElEVFJJRVM7IGkr
Kykgewo+ICsJCXBpZCA9IFNBRkVfRk9SSygpOwo+ICsJCWlmIChwaWQgPT0gMCkgewo+ICsJCQlU
U1RfQ0hFQ0tQT0lOVF9XQUlUKDApOwo+ICsJCQlyZXR1cm47Cj4gKwkJfQo+ICsKPiArCQlzcHJp
bnRmKHBpZF9maWxlbmFtZSwgIi9wcm9jLyVkIiwgcGlkKTsKPiArCQlwaWRmZCA9IFNBRkVfT1BF
TihwaWRfZmlsZW5hbWUsIE9fRElSRUNUT1JZIHwgT19DTE9FWEVDKTsKPiArCj4gKwkJVFNUX0NI
RUNLUE9JTlRfV0FLRSgwKTsKPiArCQl0c3RfcmVhcF9jaGlsZHJlbigpOwo+ICsKPiArCQkvKiBN
YW5pcHVsYXRlIFBJRCBmb3IgbmV4dCBwcm9jZXNzICovCj4gKwkJc3ByaW50ZihwaWRfc3RyLCAi
JWQiLCBwaWQgLSAxKTsKPiArCQlTQUZFX0xTRUVLKGxhc3RfcGlkZmQsIDAsIFNFRUtfU0VUKTsK
PiArCQlTQUZFX1dSSVRFKDEsIGxhc3RfcGlkZmQsIHBpZF9zdHIsIHN0cmxlbihwaWRfc3RyKSk7
CgoJCVdlIGRvIGhhdmUgU0FGRV9GSUxFX1BSSU5URigpIGZvciB0aGlzIHB1cnBvc2UuCgo+ICsJ
CW5ld19waWQgPSBTQUZFX0ZPUksoKTsKPiArCQlpZiAobmV3X3BpZCA9PSAwKSB7Cj4gKwkJCVRT
VF9DSEVDS1BPSU5UX1dBSVQoaSk7Cj4gKwkJCXJldHVybjsKPiArCQl9IGVsc2UgaWYgKG5ld19w
aWQgPT0gcGlkKSB7CgpObyBuZWVkIGZvciBlbHNlIGhlcmUgaWYgeW91IGRvIHJldHVybiBpbiB0
aGUgaWYgYWJvdmUuCgo+ICsJCQlmYWlsID0gMDsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsKPiAr
CQlpZiAoaSA8IFBJRFRSSUVTKQo+ICsJCQl0c3RfcmVzKFRJTkZPLAo+ICsJCQkJIkZhaWxlZCB0
byBzZXQgY29ycmVjdCBQSUQsIHRyeWluZyBhZ2Fpbi4uLiIpOwo+ICsJCVNBRkVfQ0xPU0UocGlk
ZmQpOwo+ICsJCVRTVF9DSEVDS1BPSU5UX1dBS0UoaSk7CgpEbyB3ZSByZWFsbHkgbmVlZCB0byB1
c2UgY2hlY2twb2ludCBpIGhlcmU/IFRoZSBjaGVja3BvaW50IDAgc2hvdWxkIGJlCnVudXNlZCBh
dCB0aGlzIHBvaW50Li4uCgo+ICsJCXRzdF9yZWFwX2NoaWxkcmVuKCk7Cj4gKwl9Cj4gKwlpZiAo
ZmFpbCkKPiArCQl0c3RfYnJrKFRCUk9LLAo+ICsJCQkiQ291bGQgbm90IHNldCBuZXcgY2hpbGQg
dG8gc2FtZSBQSUQgYXMgdGhlIG9sZCBvbmUhIik7Cj4gKwo+ICsJVEVTVCh0c3RfcGlkZmRfc2Vu
ZF9zaWduYWwocGlkZmQsIFNJR1VTUjEsIE5VTEwsIDApKTsKPiArCWlmIChUU1RfUkVUID09IC0x
ICYmIFRTVF9FUlIgPT0gRVNSQ0gpIHsKPiArCQl0c3RfcmVzKFRQQVNTLAo+ICsJCQkiRGlkIG5v
dCBzZW5kIHNpZ25hbCB0byB3cm9uZyBwcm9jZXNzIHdpdGggc2FtZSBQSUQhIik7Cj4gKwl9IGVs
c2UKPiArCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywKPiArCQkJInBpZGZfc2VuZF9zaWduYWwo
KSBlbmRlZCB1bmV4cGVjdGVkbHkgLSByZXR1cm4gdmFsdWU6ICVsZCwgZXJyb3IiLAo+ICsJCQlU
U1RfUkVUKTsKCk90aGVyIG9idmlvdXMgdGVzdCB3b3VsZCBiZSBvcGVuaW5nIHRoZSBwaWRmZCBv
ZiB0aGUgbmV3IHBpZCBhbmQKY29tcGFyaW5nIGlmIHRoZXkgcG9pbnQgb3V0IHRvIHRoZSBzYW1l
IGZpbGUgYnkgY29tcGFyaW5nIGktbm9kZXMsIHNlZQppb2N0bF9uczA1LmMuCgo+ICsJVFNUX0NI
RUNLUE9JTlRfV0FLRShpKTsKPiArCXRzdF9yZWFwX2NoaWxkcmVuKCk7Cj4gKwo+ICsJU0FGRV9D
TE9TRShwaWRmZCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gK3sKPiAr
CWxhc3RfcGlkX2ZpbGUgPSAiL3Byb2Mvc3lzL2tlcm5lbC9uc19sYXN0X3BpZCI7Cj4gKwlpZiAo
YWNjZXNzKGxhc3RfcGlkX2ZpbGUsIEZfT0spID09IC0xKQo+ICsJCXRzdF9icmsoVENPTkYsICIl
cyBkb2VzIG5vdCBleGlzdCwgY2Fubm90IHNldCBQSURzIiwKPiArCQkJbGFzdF9waWRfZmlsZSk7
Cj4gKwlsYXN0X3BpZGZkID0gU0FGRV9PUEVOKGxhc3RfcGlkX2ZpbGUsIE9fUkRXUik7Cj4gK30K
PiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiArewo+ICsJdHN0X3JlYXBfY2hpbGRy
ZW4oKTsKPiArCWlmIChwaWRmZCA+IDApCj4gKwkJU0FGRV9DTE9TRShwaWRmZCk7Cj4gKwlpZiAo
bGFzdF9waWRmZCA+IDApCj4gKwkJU0FGRV9DTE9TRShsYXN0X3BpZGZkKTsKPiArfQo+ICsKPiAr
c3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICsJLnRlc3RfYWxsID0gdmVyaWZ5X3Bp
ZGZkX3NlbmRfc2lnbmFsLAo+ICsJLnNldHVwID0gc2V0dXAsCj4gKwkuY2xlYW51cCA9IGNsZWFu
dXAsCj4gKwkubmVlZHNfcm9vdCA9IDEsCj4gKwkubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+ICsJ
LmZvcmtzX2NoaWxkID0gMSwKPiArCS50aW1lb3V0ID0gMjAsCj4gK307Cj4gLS0gCj4gMi4xNi40
Cj4gCj4gCj4gLS0gCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
