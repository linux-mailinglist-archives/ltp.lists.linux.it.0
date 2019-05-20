Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 011D023A83
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:41:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF4912987AB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:41:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 54745298791
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:41:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EB3B91A01445
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:41:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EEB1AFEF;
 Mon, 20 May 2019 14:41:46 +0000 (UTC)
Date: Mon, 20 May 2019 16:41:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190520144145.GC28976@rei.lan>
References: <1512100108-28359-2-git-send-email-yangx.jy@cn.fujitsu.com>
 <1555404533-2316-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555404533-2316-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/move_page12.c: Add new regression test
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

SGkhCj4gICNpbmNsdWRlIDxlcnJuby5oPgo+IEBAIC00OSw5ICs1NCwxNyBAQAo+ICAjZGVmaW5l
IFBBVEhfTUVNSU5GTwkiL3Byb2MvbWVtaW5mbyIKPiAgI2RlZmluZSBQQVRIX05SX0hVR0VQQUdF
UwkiL3Byb2Mvc3lzL3ZtL25yX2h1Z2VwYWdlcyIKPiAgI2RlZmluZSBQQVRIX0hVR0VQQUdFUwki
L3N5cy9rZXJuZWwvbW0vaHVnZXBhZ2VzLyIKPiAtI2RlZmluZSBURVNUX1BBR0VTCTIKPiArI2Rl
ZmluZSBQQVRIX1BBR0VNQVAJIi9wcm9jL3NlbGYvcGFnZW1hcCIKPiAgI2RlZmluZSBURVNUX05P
REVTCTIKPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgdGNhc2Ugewo+ICsJaW50IHRwYWdlczsKPiArCWlu
dCBvZmZsaW5lOwo+ICt9IHRjYXNlc1tdID0gewo+ICsJezIsIDB9LAo+ICsJezIsIDF9LAo+ICt9
Owo+ICsKPiAgc3RhdGljIGludCBwZ3N6LCBocHN6Owo+ICBzdGF0aWMgbG9uZyBvcmlnX2h1Z2Vw
YWdlcyA9IC0xOwo+ICBzdGF0aWMgY2hhciBwYXRoX2h1Z2VwYWdlc19ub2RlMVtQQVRIX01BWF07
Cj4gQEAgLTYxLDkgKzc0LDIxIEBAIHN0YXRpYyBsb25nIG9yaWdfaHVnZXBhZ2VzX25vZGUyID0g
LTE7Cj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgbm9kZTEsIG5vZGUyOwo+ICBzdGF0aWMgdm9pZCAq
YWRkcjsKPiAgCj4gLXN0YXRpYyB2b2lkIGRvX2NoaWxkKHZvaWQpCj4gK3N0YXRpYyB2b2lkIGRv
X3NvZnRfb2ZmbGluZShpbnQgdHBncykKPiAgewo+IC0JaW50IHRlc3RfcGFnZXMgPSBURVNUX1BB
R0VTICogaHBzeiAvIHBnc3o7Cj4gKwlpZiAobWFkdmlzZShhZGRyLCB0cGdzICogaHBzeiwgTUFE
Vl9TT0ZUX09GRkxJTkUpID09IC0xKSB7Cj4gKwkJaWYgKGVycm5vID09IEVJTlZBTCkgewo+ICsJ
CQl0c3RfYnJrKFRDT05GLAo+ICsJCQkJIm1hZHZpc2UoKSBkaWRuJ3Qgc3VwcG9ydCBNQURWX1NP
RlRfT0ZGTElORSIpOwoKQ2FuIHdlIGNoYW5nZSB0aGlzIHRvIHRzdF9yZXMoKSBhbmQgcmV0dXJu
IGEgdmFsdWUgZnJvbSB0aGlzIGZ1bmN0aW9uIHNvCnRoYXQgdGhlIHNlY29uZCB0ZXN0IGNvdWxk
IGJlIHNraXBwZWQgd2l0aG91dCBleGl0dGluZyB0aGUgd2hvbGUgdGVzdD8KClRoZSB0aGluZyBp
cyB0aGF0IGFzIGZhciBhcyB3ZSBhcmUgaW1wbGVtZW50aW5nIG1vcmUgdGhhbiBvbmUgdGVzdGNh
c2UKaW4gYSB0ZXN0IHVuc3VwcG9ydGVkIGZlYXR1cmVzIHRoYXQgYXJlIG9ubHkgcmVsZXZhbnQg
Zm9yIGEgb25lIHRlc3QKc2hvdWxkIG5vdCBleGl0IHRoZSB3aG9sZSB0ZXN0Y2FzZSBpbiBjYXNl
IG9mIGxvb3BpbmcgKHRoZSAtaQpwYXJhbWV0ZXIpLgoKPiArCQl9IGVsc2Ugewo+ICsJCQl0c3Rf
YnJrKFRCUk9LIHwgVEVSUk5PLCAibWFkdmlzZSgpIGZhaWxlZCIpOwo+ICsJCX0KPiArCX0KPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgZG9fY2hpbGQoaW50IHRwZ3MpCj4gK3sKPiArCWludCB0ZXN0
X3BhZ2VzID0gdHBncyAqIGhwc3ogLyBwZ3N6Owo+ICAJaW50IGksIGo7Cj4gIAlpbnQgKm5vZGVz
LCAqc3RhdHVzOwo+ICAJdm9pZCAqKnBhZ2VzOwo+IEBAIC05NiwzNCArMTIxLDQyIEBAIHN0YXRp
YyB2b2lkIGRvX2NoaWxkKHZvaWQpCj4gIAlleGl0KDApOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9p
ZCBkb190ZXN0KHZvaWQpCj4gK3N0YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IG4pCj4g
IHsKPiAgCWludCBpOwo+ICAJcGlkX3QgY3BpZCA9IC0xOwo+ICAJaW50IHN0YXR1czsKPiAgCXVu
c2lnbmVkIGludCB0d2VudHlfcGVyY2VudCA9ICh0c3RfdGltZW91dF9yZW1haW5pbmcoKSAvIDUp
Owo+ICAKPiAtCWFkZHIgPSBTQUZFX01NQVAoTlVMTCwgVEVTVF9QQUdFUyAqIGhwc3osIFBST1Rf
UkVBRCB8IFBST1RfV1JJVEUsCj4gKwlpZiAodGNhc2VzW25dLm9mZmxpbmUpIHsKPiArCQlpZiAo
YWNjZXNzKFBBVEhfUEFHRU1BUCwgRl9PSykpCj4gKwkJCXRzdF9icmsoVENPTkYsICJwYWdlbWFw
IHdhcyBub3Qgc3VwcG9ydGVkIik7CgpIZXJlIGFzIHdlbGwsIGNhbiB3ZSBkbyB0c3RfcmVzKCkg
YW5kIHJldHVybiBpbnN0ZWFkPwoKPiArCX0KPiArCj4gKwlhZGRyID0gU0FGRV9NTUFQKE5VTEws
IHRjYXNlc1tuXS50cGFnZXMgKiBocHN6LCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+ICAJCU1B
UF9QUklWQVRFIHwgTUFQX0FOT05ZTU9VUyB8IE1BUF9IVUdFVExCLCAtMSwgMCk7Cj4gIAo+IC0J
U0FGRV9NVU5NQVAoYWRkciwgVEVTVF9QQUdFUyAqIGhwc3opOwo+ICsJU0FGRV9NVU5NQVAoYWRk
ciwgdGNhc2VzW25dLnRwYWdlcyAqIGhwc3opOwo+ICAKPiAgCWNwaWQgPSBTQUZFX0ZPUksoKTsK
PiAgCWlmIChjcGlkID09IDApCj4gLQkJZG9fY2hpbGQoKTsKPiArCQlkb19jaGlsZCh0Y2FzZXNb
bl0udHBhZ2VzKTsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgTE9PUFM7IGkrKykgewo+ICAJCXZv
aWQgKnB0cjsKPiAgCj4gLQkJcHRyID0gU0FGRV9NTUFQKE5VTEwsIFRFU1RfUEFHRVMgKiBocHN6
LAo+ICsJCXB0ciA9IFNBRkVfTU1BUChOVUxMLCB0Y2FzZXNbbl0udHBhZ2VzICogaHBzeiwKPiAg
CQkJUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPiAgCQkJTUFQX1BSSVZBVEUgfCBNQVBfQU5PTllN
T1VTIHwgTUFQX0hVR0VUTEIsIC0xLCAwKTsKPiAgCQlpZiAocHRyICE9IGFkZHIpCj4gIAkJCXRz
dF9icmsoVEJST0ssICJGYWlsZWQgdG8gbW1hcCBhdCBkZXNpcmVkIGFkZHIiKTsKPiAgCj4gLQkJ
bWVtc2V0KGFkZHIsIDAsIFRFU1RfUEFHRVMgKiBocHN6KTsKPiArCQltZW1zZXQoYWRkciwgMCwg
dGNhc2VzW25dLnRwYWdlcyAqIGhwc3opOwo+ICsKPiArCQlpZiAodGNhc2VzW25dLm9mZmxpbmUp
Cj4gKwkJCWRvX3NvZnRfb2ZmbGluZSh0Y2FzZXNbbl0udHBhZ2VzKTsKCgpBbmQgaGVyZSB3ZSBz
aG91bGQgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBhbmQgcmV0dXJuIGlmIHRoZSBtYWR2aXNlIGlu
CnRoZSBmdW5jdGlvbiBoYXMgcmV0dXJuZWQgRUlOVkFMLgoKCj4gLQkJU0FGRV9NVU5NQVAoYWRk
ciwgVEVTVF9QQUdFUyAqIGhwc3opOwo+ICsJCVNBRkVfTVVOTUFQKGFkZHIsIHRjYXNlc1tuXS50
cGFnZXMgKiBocHN6KTsKPiAgCj4gIAkJaWYgKHRzdF90aW1lb3V0X3JlbWFpbmluZygpIDwgdHdl
bnR5X3BlcmNlbnQpCj4gIAkJCWJyZWFrOwo+IEBAIC0yNjYsNyArMjk5LDggQEAgc3RhdGljIHN0
cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAJLmZvcmtzX2NoaWxkID0gMSwKPiAgCS5zZXR1cCA9
IHNldHVwLAo+ICAJLmNsZWFudXAgPSBjbGVhbnVwLAo+IC0JLnRlc3RfYWxsID0gZG9fdGVzdCwK
PiArCS50ZXN0ID0gZG9fdGVzdCwKPiArCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAo+ICB9
Owo+ICAKPiAgI2Vsc2UKCk90aGVyd2lzZSBpdCBsb29rcyBnb29kLgoKLS0gCkN5cmlsIEhydWJp
cwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
