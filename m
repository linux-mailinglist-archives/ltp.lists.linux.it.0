Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E762C26452
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 15:09:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF0B63EA383
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 15:09:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BEBCE3EA346
 for <ltp@lists.linux.it>; Wed, 22 May 2019 15:09:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 700871400760
 for <ltp@lists.linux.it>; Wed, 22 May 2019 15:09:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99BE3AF08;
 Wed, 22 May 2019 13:09:01 +0000 (UTC)
Date: Wed, 22 May 2019 15:09:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Ammy Yi <ammy.yi@intel.com>
Message-ID: <20190522130900.GC7912@rei.lan>
References: <20190428054815.3266-1-ammy.yi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190428054815.3266-1-ammy.yi@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 ltp] Add 4 more cases for Intel PT.
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

SGkhCj4gLXN0YXRpYyB1aW50NjRfdCAqKmNyZWF0ZV9tYXAoaW50IGZkZSwgbG9uZyBidWZzaXpl
KQo+ICtzdGF0aWMgdWludDY0X3QgKipjcmVhdGVfbWFwKGludCByd19mbGFnLCBsb25nIGJ1ZnNp
emUsIGludCBmbGFnKQoKSHVoLCBJIGZhciBhcyBJIGNhbiB0ZWxsIEkgYXNrZWQgZm9yIHRoZSBm
bGFnIHRvIGJlIHJlbmFtZWQgcndfZmxhZyB0bwptYWtlIGl0IG1vcmUgY2xlYXIgd2hhdCB0aGUg
ZmxhZyBpcyBhY3R1YWxseSBkb2luZy4KClJlbmFtaW5nIHRoZSBmZGUgdG8gcndfZmxhZyBtYWtl
cyB0aGlzIGNvZGUgY3J5cHRpYyBpbnN0ZWFkLgoKPiAgewo+ICAJdWludDY0X3QgKipidWZfZXY7
Cj4gKwlpbnQgcHJvX2ZsYWc7Cj4gIAlzdHJ1Y3QgcGVyZl9ldmVudF9tbWFwX3BhZ2UgKnBjOwo+
ICAKPiAgCWJ1Zl9ldiA9IFNBRkVfTUFMTE9DKDIqc2l6ZW9mKHVpbnQ2NF90ICopKTsKPiAgCWJ1
Zl9ldlswXSA9IE5VTEw7Cj4gIAlidWZfZXZbMV0gPSBOVUxMOwo+IC0JYnVmX2V2WzBdID0gU0FG
RV9NTUFQKE5VTEwsIElOVEVMX1BUX01FTVNJWkUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4g
LQkJCQkJCQlNQVBfU0hBUkVELCBmZGUsIDApOwo+ICsJaWYgKGZsYWcgPT0gMSkgewo+ICsJCXRz
dF9yZXMoVElORk8sICJtZW1vcnkgd2lsbCBiZSByL3cgZm9yIGZ1bGwgdHJhY2UgbW9kZSEiKTsK
PiArCQlwcm9fZmxhZyA9IFBST1RfUkVBRCB8IFBST1RfV1JJVEU7Cj4gKwl9IGVsc2Ugewo+ICsJ
CXRzdF9yZXMoVElORk8sICJtZW1vcnkgd2lsbCBiZSByIG9ubHkgZm9yIHNuYXBzaG90IG1vZGUh
Iik7Cj4gKwkJcHJvX2ZsYWcgPSBQUk9UX1JFQUQ7Cj4gKwl9CgpBZ2Fpbiwgd2h5IGRvIHdlIG5l
ZWQgZXhjbGFtYXRpb24gbWFya3MgKCEpIGluIHRoZSBpbmZvIG1lc3NhZ2VzPwoKPiArCWJ1Zl9l
dlswXSA9IFNBRkVfTU1BUChyd19mbGFnLCBJTlRFTF9QVF9NRU1TSVpFLCBQUk9UX1JFQUQgfCBQ
Uk9UX1dSSVRFLAo+ICsJCQkJCQkJTUFQX1NIQVJFRCwgcndfZmxhZywgMCk7Cj4gIAo+ICAJcGMg
PSAoc3RydWN0IHBlcmZfZXZlbnRfbW1hcF9wYWdlICopYnVmX2V2WzBdOwo+ICAJcGMtPmF1eF9v
ZmZzZXQgPSBJTlRFTF9QVF9NRU1TSVpFOwo+ICAJcGMtPmF1eF9zaXplID0gYnVmc2l6ZTsKPiAt
CWJ1Zl9ldlsxXSA9IFNBRkVfTU1BUChOVUxMLCBidWZzaXplLCBQUk9UX1JFQUQgfCBQUk9UX1dS
SVRFLAo+IC0JCQkJCU1BUF9TSEFSRUQsIGZkZSwgSU5URUxfUFRfTUVNU0laRSk7Cj4gKwlidWZf
ZXZbMV0gPSBTQUZFX01NQVAoTlVMTCwgYnVmc2l6ZSwgcHJvX2ZsYWcsCj4gKwkJCQkJTUFQX1NI
QVJFRCwgcndfZmxhZywgSU5URUxfUFRfTUVNU0laRSk7Cj4gIAlyZXR1cm4gYnVmX2V2Owo+ICB9
Cj4gIAo+IEBAIC04OSw3ICsxMDEsNyBAQCBzdGF0aWMgdm9pZCBkZWxfbWFwKHVpbnQ2NF90ICoq
YnVmX2V2LCBsb25nIGJ1ZnNpemUpCj4gIAlmcmVlKGJ1Zl9ldik7Cj4gIH0KPiAgCj4gLXN0YXRp
YyB2b2lkIGludGVsX3B0X2Z1bGxfdHJhY2VfY2hlY2sodm9pZCkKPiArc3RhdGljIHZvaWQgaW50
ZWxfcHRfdHJhY2VfY2hlY2sodm9pZCkKPiAgewo+ICAJdWludDY0X3QgYXV4X2hlYWQgPSAwOwo+
ICAJc3RydWN0IHBlcmZfZXZlbnRfbW1hcF9wYWdlICpwbXA7Cj4gQEAgLTEwOCw3ICsxMjAsNyBA
QCBzdGF0aWMgdm9pZCBpbnRlbF9wdF9mdWxsX3RyYWNlX2NoZWNrKHZvaWQpCj4gIAkJcmV0dXJu
Owo+ICAJfQo+ICAKPiAtCXRzdF9yZXMoVFBBU1MsICJwZXJmIHRyYWNlIGZ1bGwgbW9kZSBpcyBw
YXNzZWQhIik7Cj4gKwl0c3RfcmVzKFRQQVNTLCAicGVyZiB0cmFjZSB0ZXN0IGlzIHBhc3NlZCEi
KTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiBAQCAtMTE2LDYgKzEyOCw3
IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gIAlzdHJ1Y3QgcGVyZl9ldmVudF9hdHRyIGF0
dHIgPSB7fTsKPiAgCj4gIAlidWhzeiA9IDIgKiBQQUdFU0laRTsKPiArCj4gIAlpZiAoYWNjZXNz
KElOVEVMX1BUX1BBVEgsIEZfT0spKSB7Cj4gIAkJdHN0X2JyayhUQ09ORiwKPiAgCQkJIlJlcXVp
cmVzIEludGVsIENvcmUgNXRoKyBnZW5lcmF0aW9uIChCcm9hZHdlbGwgYW5kIG5ld2VyKSIKPiBA
QCAtMTMwLDkgKzE0MywyMyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICAJYXR0ci5jb25m
aWcJPSBCSVQoaW50ZWxfcHRfcG11X3ZhbHVlKElOVEVMX1BUX0ZPUk1BVF9UU0MpKSB8Cj4gIAkJ
CQlCSVQoaW50ZWxfcHRfcG11X3ZhbHVlKElOVEVMX1BUX0ZPUk1BVF9OUlQpKTsKPiAgCWF0dHIu
c2l6ZQk9IHNpemVvZihzdHJ1Y3QgcGVyZl9ldmVudF9hdHRyKTsKPiAtCWF0dHIuZXhjbHVkZV9r
ZXJuZWwJCT0gMDsKPiAtCWF0dHIuZXhjbHVkZV91c2VyCQk9IDA7Cj4gIAlhdHRyLm1tYXAJCQk9
IDE7Cj4gKwlpZiAoc3RyX2JyYW5jaF9mbGFnICE9IE5VTEwgJiYgIXN0cl9icmFuY2hfZmxhZykg
ewoKVGhpcyBzaG91bGQgYmUganVzdCBpZiAoc3RyX2JyYW5jaF9mbGFnKS4gQW5kIGFjdHVhbGx5
IHRoZSBjb25kaXRpb24KKGEgIT0gTlVMTCAmJiAhYSkgaXMgbmV2ZXIgdHJ1ZS4KCj4gKwkJdHN0
X3JlcyhUSU5GTywgIkludGVsIFBUIHdpbGwgZGlzYWJsZSBicmFuY2ggdHJhY2UhIik7Cj4gKwkJ
YXR0ci5jb25maWcgfD0gMTsKPiArCX0KPiArCj4gKwlhdHRyLmV4Y2x1ZGVfa2VybmVsCT0gMDsK
PiArCWF0dHIuZXhjbHVkZV91c2VyCT0gMDsKPiArCj4gKwlpZiAoc3RyX2V4Y2x1ZGVfaW5mbyAh
PSBOVUxMICYmIHN0cmNtcChzdHJfZXhjbHVkZV9pbmZvLCAidXNlciIpKSB7CgoKVGhpcyBjb3Vs
ZCBiZSBqdXN0OgoKCWlmIChzdHJfZXhjbHVkZV9pbmZvICYmIHN0cmNtcChzdHJfZXhjbHVkZV9p
bmZvLCAidXNlciIpKQoKPiArCQl0c3RfcmVzKFRJTkZPLCAiSW50ZWwgUFQgd2lsbCBleGNsdWRl
IGtlcm5lbCB0cmFjZSEiKTsKPiArCQlhdHRyLmV4Y2x1ZGVfa2VybmVsID0gMTsKPiArCX0KPiAr
CWlmIChzdHJfZXhjbHVkZV9pbmZvICE9IE5VTEwgJiYgc3RyY21wKHN0cl9leGNsdWRlX2luZm8s
ICJrZXJuZWwiKSkgewo+ICsJCXRzdF9yZXMoVElORk8sICJJbnRlbCBQVCB3aWxsIGV4Y2x1ZGUg
dXNlciB0cmFjZSEiKTsKPiArCQlhdHRyLmV4Y2x1ZGVfdXNlciA9IDE7Cj4gKwl9CgpIZXJlIGFz
IHdlbGwuCgo+ICAJLyogb25seSBnZXQgdHJhY2UgZm9yIG93biBwaWQgKi8KPiAgCWZkZSA9IHRz
dF9zeXNjYWxsKF9fTlJfcGVyZl9ldmVudF9vcGVuLCAmYXR0ciwgMCwgLTEsIC0xLCAwKTsKPiBA
QCAtMTQyLDggKzE2OSwxMCBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICAJCXJldHVybjsK
PiAgCX0KPiAgCWJ1Zm0gPSBOVUxMOwo+IC0JYnVmbSA9IGNyZWF0ZV9tYXAoZmRlLCBidWhzeik7
Cj4gKwlpZiAoc3RyX21vZGUgIT0gTlVMTCAmJiAhc3RyX21vZGUpCgpIZXJlIGFzIHdlbGwganVz
dCBpZiAoc3RyX21vZGUpCgo+ICsJCW1vZGUgPSAwOwo+ICAKPiArCWJ1Zm0gPSBjcmVhdGVfbWFw
KGZkZSwgYnVoc3osIG1vZGUpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQp
Cj4gQEAgLTE1NCw4ICsxODMsMTcgQEAgc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQo+ICAJZGVs
X21hcChidWZtLCBidWhzeik7Cj4gIH0KPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgdHN0X29wdGlvbiBv
cHRpb25zW10gPSB7Cj4gKwl7Im0iLCAmc3RyX21vZGUsICItbSBkaWZmZXJlbnQgbW9kZSwgZGVm
YXVsdCBpcyBmdWxsIG1vZGUifSwKPiArCXsiZToiLCAmc3RyX2V4Y2x1ZGVfaW5mbywgIi1lIGV4
Y2x1ZGUgaW5mbywgdXNlciBvciBrZXJuZWwifSwKPiArCXsiYiIsICZzdHJfYnJhbmNoX2ZsYWcs
ICItYiBpZiBkaXNhYmxlIGJyYW5jaCB0cmFjZSJ9LAo+ICsJe05VTEwsIE5VTEwsIE5VTEx9Cj4g
K307Cj4gKwo+ICsKPiAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+IC0JLnRlc3Rf
YWxsID0gaW50ZWxfcHRfZnVsbF90cmFjZV9jaGVjaywKPiArCS50ZXN0X2FsbCA9IGludGVsX3B0
X3RyYWNlX2NoZWNrLAo+ICsJLm9wdGlvbnMgPSBvcHRpb25zLAo+ICAJLm1pbl9rdmVyID0gIjQu
MSIsCj4gIAkuc2V0dXAgPSBzZXR1cCwKPiAgCS5jbGVhbnVwID0gY2xlYW51cCwKPiAtLSAKPiAy
LjE0LjEKPiAKPiAKPiAtLSAKPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAKCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
