Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A724BFC
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 11:48:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06AD23EA708
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 11:48:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C49D53EA6F6
 for <ltp@lists.linux.it>; Tue, 21 May 2019 11:48:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 458431401449
 for <ltp@lists.linux.it>; Tue, 21 May 2019 11:48:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,494,1549900800"; d="scan'208";a="63977823"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 May 2019 17:48:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 09BAE4CD846F;
 Tue, 21 May 2019 17:48:20 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 21 May 2019 17:48:17 +0800
Message-ID: <5CE3C962.3000907@cn.fujitsu.com>
Date: Tue, 21 May 2019 17:48:18 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1512100108-28359-2-git-send-email-yangx.jy@cn.fujitsu.com>
 <1555404533-2316-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190520144145.GC28976@rei.lan>
In-Reply-To: <20190520144145.GC28976@rei.lan>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 09BAE4CD846F.A1B41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ICAgSGkgY3J5aWwKCj4gSGkhCj4+ICAgI2luY2x1ZGU8ZXJybm8uaD4KPj4gQEAgLTQ5LDkgKzU0
LDE3IEBACj4+ICAgI2RlZmluZSBQQVRIX01FTUlORk8JIi9wcm9jL21lbWluZm8iCj4+ICAgI2Rl
ZmluZSBQQVRIX05SX0hVR0VQQUdFUwkiL3Byb2Mvc3lzL3ZtL25yX2h1Z2VwYWdlcyIKPj4gICAj
ZGVmaW5lIFBBVEhfSFVHRVBBR0VTCSIvc3lzL2tlcm5lbC9tbS9odWdlcGFnZXMvIgo+PiAtI2Rl
ZmluZSBURVNUX1BBR0VTCTIKPj4gKyNkZWZpbmUgUEFUSF9QQUdFTUFQCSIvcHJvYy9zZWxmL3Bh
Z2VtYXAiCj4+ICAgI2RlZmluZSBURVNUX05PREVTCTIKPj4KPj4gK3N0YXRpYyBzdHJ1Y3QgdGNh
c2Ugewo+PiArCWludCB0cGFnZXM7Cj4+ICsJaW50IG9mZmxpbmU7Cj4+ICt9IHRjYXNlc1tdID0g
ewo+PiArCXsyLCAwfSwKPj4gKwl7MiwgMX0sCj4+ICt9Owo+PiArCj4+ICAgc3RhdGljIGludCBw
Z3N6LCBocHN6Owo+PiAgIHN0YXRpYyBsb25nIG9yaWdfaHVnZXBhZ2VzID0gLTE7Cj4+ICAgc3Rh
dGljIGNoYXIgcGF0aF9odWdlcGFnZXNfbm9kZTFbUEFUSF9NQVhdOwo+PiBAQCAtNjEsOSArNzQs
MjEgQEAgc3RhdGljIGxvbmcgb3JpZ19odWdlcGFnZXNfbm9kZTIgPSAtMTsKPj4gICBzdGF0aWMg
dW5zaWduZWQgaW50IG5vZGUxLCBub2RlMjsKPj4gICBzdGF0aWMgdm9pZCAqYWRkcjsKPj4KPj4g
LXN0YXRpYyB2b2lkIGRvX2NoaWxkKHZvaWQpCj4+ICtzdGF0aWMgdm9pZCBkb19zb2Z0X29mZmxp
bmUoaW50IHRwZ3MpCj4+ICAgewo+PiAtCWludCB0ZXN0X3BhZ2VzID0gVEVTVF9QQUdFUyAqIGhw
c3ogLyBwZ3N6Owo+PiArCWlmIChtYWR2aXNlKGFkZHIsIHRwZ3MgKiBocHN6LCBNQURWX1NPRlRf
T0ZGTElORSkgPT0gLTEpIHsKPj4gKwkJaWYgKGVycm5vID09IEVJTlZBTCkgewo+PiArCQkJdHN0
X2JyayhUQ09ORiwKPj4gKwkJCQkibWFkdmlzZSgpIGRpZG4ndCBzdXBwb3J0IE1BRFZfU09GVF9P
RkZMSU5FIik7Cj4gQ2FuIHdlIGNoYW5nZSB0aGlzIHRvIHRzdF9yZXMoKSBhbmQgcmV0dXJuIGEg
dmFsdWUgZnJvbSB0aGlzIGZ1bmN0aW9uIHNvCj4gdGhhdCB0aGUgc2Vjb25kIHRlc3QgY291bGQg
YmUgc2tpcHBlZCB3aXRob3V0IGV4aXR0aW5nIHRoZSB3aG9sZSB0ZXN0Pwo+Cj4gVGhlIHRoaW5n
IGlzIHRoYXQgYXMgZmFyIGFzIHdlIGFyZSBpbXBsZW1lbnRpbmcgbW9yZSB0aGFuIG9uZSB0ZXN0
Y2FzZQo+IGluIGEgdGVzdCB1bnN1cHBvcnRlZCBmZWF0dXJlcyB0aGF0IGFyZSBvbmx5IHJlbGV2
YW50IGZvciBhIG9uZSB0ZXN0Cj4gc2hvdWxkIG5vdCBleGl0IHRoZSB3aG9sZSB0ZXN0Y2FzZSBp
biBjYXNlIG9mIGxvb3BpbmcgKHRoZSAtaQo+IHBhcmFtZXRlcikuCiAgIE9LLiAgSSB3aWxsIGNo
YW5nZSBpdCB0byB0c3RfcmVzIGluIHYzIHBhdGNoIHNvb24uCgo+PiArCQl9IGVsc2Ugewo+PiAr
CQkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywgIm1hZHZpc2UoKSBmYWlsZWQiKTsKPj4gKwkJfQo+
PiArCX0KPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgZG9fY2hpbGQoaW50IHRwZ3MpCj4+ICt7
Cj4+ICsJaW50IHRlc3RfcGFnZXMgPSB0cGdzICogaHBzeiAvIHBnc3o7Cj4+ICAgCWludCBpLCBq
Owo+PiAgIAlpbnQgKm5vZGVzLCAqc3RhdHVzOwo+PiAgIAl2b2lkICoqcGFnZXM7Cj4+IEBAIC05
NiwzNCArMTIxLDQyIEBAIHN0YXRpYyB2b2lkIGRvX2NoaWxkKHZvaWQpCj4+ICAgCWV4aXQoMCk7
Cj4+ICAgfQo+Pgo+PiAtc3RhdGljIHZvaWQgZG9fdGVzdCh2b2lkKQo+PiArc3RhdGljIHZvaWQg
ZG9fdGVzdCh1bnNpZ25lZCBpbnQgbikKPj4gICB7Cj4+ICAgCWludCBpOwo+PiAgIAlwaWRfdCBj
cGlkID0gLTE7Cj4+ICAgCWludCBzdGF0dXM7Cj4+ICAgCXVuc2lnbmVkIGludCB0d2VudHlfcGVy
Y2VudCA9ICh0c3RfdGltZW91dF9yZW1haW5pbmcoKSAvIDUpOwo+Pgo+PiAtCWFkZHIgPSBTQUZF
X01NQVAoTlVMTCwgVEVTVF9QQUdFUyAqIGhwc3osIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4+
ICsJaWYgKHRjYXNlc1tuXS5vZmZsaW5lKSB7Cj4+ICsJCWlmIChhY2Nlc3MoUEFUSF9QQUdFTUFQ
LCBGX09LKSkKPj4gKwkJCXRzdF9icmsoVENPTkYsICJwYWdlbWFwIHdhcyBub3Qgc3VwcG9ydGVk
Iik7Cj4gSGVyZSBhcyB3ZWxsLCBjYW4gd2UgZG8gdHN0X3JlcygpIGFuZCByZXR1cm4gaW5zdGVh
ZD8KPgogICBQQVRIX1BBR0VNQVAgaXMgdXNlbGVzcyBpbiB0aGlzIGNhc2UuIEkgd2lsbCByZW1v
dmUgaXQgLgoKPj4gKwl9Cj4+ICsKPj4gKwlhZGRyID0gU0FGRV9NTUFQKE5VTEwsIHRjYXNlc1tu
XS50cGFnZXMgKiBocHN6LCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+PiAgIAkJTUFQX1BSSVZB
VEUgfCBNQVBfQU5PTllNT1VTIHwgTUFQX0hVR0VUTEIsIC0xLCAwKTsKPj4KPj4gLQlTQUZFX01V
Tk1BUChhZGRyLCBURVNUX1BBR0VTICogaHBzeik7Cj4+ICsJU0FGRV9NVU5NQVAoYWRkciwgdGNh
c2VzW25dLnRwYWdlcyAqIGhwc3opOwo+Pgo+PiAgIAljcGlkID0gU0FGRV9GT1JLKCk7Cj4+ICAg
CWlmIChjcGlkID09IDApCj4+IC0JCWRvX2NoaWxkKCk7Cj4+ICsJCWRvX2NoaWxkKHRjYXNlc1tu
XS50cGFnZXMpOwo+Pgo+PiAgIAlmb3IgKGkgPSAwOyBpPCAgTE9PUFM7IGkrKykgewo+PiAgIAkJ
dm9pZCAqcHRyOwo+Pgo+PiAtCQlwdHIgPSBTQUZFX01NQVAoTlVMTCwgVEVTVF9QQUdFUyAqIGhw
c3osCj4+ICsJCXB0ciA9IFNBRkVfTU1BUChOVUxMLCB0Y2FzZXNbbl0udHBhZ2VzICogaHBzeiwK
Pj4gICAJCQlQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+PiAgIAkJCU1BUF9QUklWQVRFIHwgTUFQ
X0FOT05ZTU9VUyB8IE1BUF9IVUdFVExCLCAtMSwgMCk7Cj4+ICAgCQlpZiAocHRyICE9IGFkZHIp
Cj4+ICAgCQkJdHN0X2JyayhUQlJPSywgIkZhaWxlZCB0byBtbWFwIGF0IGRlc2lyZWQgYWRkciIp
Owo+Pgo+PiAtCQltZW1zZXQoYWRkciwgMCwgVEVTVF9QQUdFUyAqIGhwc3opOwo+PiArCQltZW1z
ZXQoYWRkciwgMCwgdGNhc2VzW25dLnRwYWdlcyAqIGhwc3opOwo+PiArCj4+ICsJCWlmICh0Y2Fz
ZXNbbl0ub2ZmbGluZSkKPj4gKwkJCWRvX3NvZnRfb2ZmbGluZSh0Y2FzZXNbbl0udHBhZ2VzKTsK
Pgo+IEFuZCBoZXJlIHdlIHNob3VsZCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIGFuZCByZXR1cm4g
aWYgdGhlIG1hZHZpc2UgaW4KPiB0aGUgZnVuY3Rpb24gaGFzIHJldHVybmVkIEVJTlZBTC4KPgo+
CkkgZ290IGl0LgoKPj4gLQkJU0FGRV9NVU5NQVAoYWRkciwgVEVTVF9QQUdFUyAqIGhwc3opOwo+
PiArCQlTQUZFX01VTk1BUChhZGRyLCB0Y2FzZXNbbl0udHBhZ2VzICogaHBzeik7Cj4+Cj4+ICAg
CQlpZiAodHN0X3RpbWVvdXRfcmVtYWluaW5nKCk8ICB0d2VudHlfcGVyY2VudCkKPj4gICAJCQli
cmVhazsKPj4gQEAgLTI2Niw3ICsyOTksOCBAQCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3Qg
PSB7Cj4+ICAgCS5mb3Jrc19jaGlsZCA9IDEsCj4+ICAgCS5zZXR1cCA9IHNldHVwLAo+PiAgIAku
Y2xlYW51cCA9IGNsZWFudXAsCj4+IC0JLnRlc3RfYWxsID0gZG9fdGVzdCwKPj4gKwkudGVzdCA9
IGRvX3Rlc3QsCj4+ICsJLnRjbnQgPSBBUlJBWV9TSVpFKHRjYXNlcyksCj4+ICAgfTsKPj4KPj4g
ICAjZWxzZQo+IE90aGVyd2lzZSBpdCBsb29rcyBnb29kLgo+CgoKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
