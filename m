Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA62618F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 12:17:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAF803EA505
	for <lists+linux-ltp@lfdr.de>; Wed, 22 May 2019 12:17:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BA63D3EA3FB
 for <ltp@lists.linux.it>; Wed, 22 May 2019 12:17:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 11B17601C2D
 for <ltp@lists.linux.it>; Wed, 22 May 2019 12:17:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,498,1549900800"; d="scan'208";a="64162710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 May 2019 18:17:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 46D344C4BD33
 for <ltp@lists.linux.it>; Wed, 22 May 2019 18:16:59 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 22 May 2019 18:16:54 +0800
Message-ID: <5CE52199.9080508@cn.fujitsu.com>
Date: Wed, 22 May 2019 18:16:57 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
References: <1557404414-3797-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1557404414-3797-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 46D344C4BD33.AC328
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/prctl05.c: New test for prctl() with
	PR_{SET, GET}_NAME
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

SGkKUGluZy4gOi0pCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5m
dWppdHN1LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9sYXBpL3ByY3RsLmggICAgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrCj4gIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3Jl
IHwgIDEgKwo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYyAgfCA1
MSArKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0
bC9wcmN0bDA1LmMKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xhcGkvcHJjdGwuaCBiL2luY2x1
ZGUvbGFwaS9wcmN0bC5oCj4gaW5kZXggYzM2MTJlNjQzLi45MWRhOWMyZDYgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9sYXBpL3ByY3RsLmgKPiArKysgYi9pbmNsdWRlL2xhcGkvcHJjdGwuaAo+IEBA
IC05LDYgKzksMTEgQEAKPiAgCj4gICNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KPiAgCj4gKyNpZm5k
ZWYgUFJfU0VUX05BTUUKPiArIyBkZWZpbmUgUFJfU0VUX05BTUUgMTUKPiArIyBkZWZpbmUgUFJf
R0VUX05BTUUgMTYKPiArI2VuZGlmCj4gKwo+ICAjaWZuZGVmIFBSX1NFVF9DSElMRF9TVUJSRUFQ
RVIKPiAgIyBkZWZpbmUgUFJfU0VUX0NISUxEX1NVQlJFQVBFUgkzNgo+ICAjIGRlZmluZSBQUl9H
RVRfQ0hJTERfU1VCUkVBUEVSCTM3Cj4gZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9y
dW50ZXN0L3N5c2NhbGxzCj4gaW5kZXggNTFiZmYyOTkwLi45NTA2MTViZWYgMTAwNjQ0Cj4gLS0t
IGEvcnVudGVzdC9zeXNjYWxscwo+ICsrKyBiL3J1bnRlc3Qvc3lzY2FsbHMKPiBAQCAtODY0LDYg
Kzg2NCw3IEBAIHByY3RsMDEgcHJjdGwwMQo+ICBwcmN0bDAyIHByY3RsMDIKPiAgcHJjdGwwMyBw
cmN0bDAzCj4gIHByY3RsMDQgcHJjdGwwNAo+ICtwcmN0bDA1IHByY3RsMDUKPiAgCj4gIHByZWFk
MDEgcHJlYWQwMQo+ICBwcmVhZDAxXzY0IHByZWFkMDFfNjQKPiBkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlCj4gaW5kZXggMWMzZGEzMDUyLi45ZWNhZjk4NTQgMTAw
NjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlCj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlCj4gQEAgLTIs
MyArMiw0IEBACj4gIC9wcmN0bDAyCj4gIC9wcmN0bDAzCj4gIC9wcmN0bDA0Cj4gKy9wcmN0bDA1
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uOGEwZWEyZWIzCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5jCj4gQEAgLTAs
MCArMSw1MSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgRlVKSVRTVSBMSU1JVEVELiBBbGwgcmln
aHRzIHJlc2VydmVkLgo+ICsgKiBBdXRob3I6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVq
aXRzdS5jb20+Cj4gKyAqCj4gKyAqIFRlc3QgUFJfR0VUX05BTUUgYW5kIFBSX1NFVF9OQU1FIG9m
IHByY3RsKDIpLgo+ICsgKiAxKVNldCB0aGUgbmFtZSBvZiB0aGUgY2FsbGluZyB0aHJlYWQsIHRo
ZSBuYW1lIGNhbiBiZSB1cCB0byAxNiBieXRlcwo+ICsgKiAgIGxvbmcsIGluY2x1ZGluZyB0aGUg
dGVybWluYXRpbmcgbnVsbCBieXRlLiBJZiBleGNlZWRzIDE2IGJ5dGVzLCB0aGUKPiArICogICBz
dHJpbmcgaXMgc2lsZW50bHkgdHJ1bmNhdGVkLgo+ICsgKiAyKVJldHVybiB0aGUgbmFtZSBvZiB0
aGUgY2FsbGluZyB0aHJlYWQsIHRoZSBidWZmZXIgc2hvdWxkIGFsbG93IHNwYWNlCj4gKyAqICAg
Zm9yIHVwIHRvIDE2IGJ5dGVzLCB0aGUgcmV0dXJuZWQgc3RyaW5nIHdpbGwgYmUgbnVsbC10ZXJt
aW5hdGVkLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ICsjaW5jbHVkZSA8c3lz
L3ByY3RsLmg+Cj4gKyNpbmNsdWRlIDxzdHJpbmcuaD4KPiArI2luY2x1ZGUgPGxhcGkvcHJjdGwu
aD4KPiArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gKwo+ICsjZGVmaW5lIHRocmVhZF9uYW1lICJw
cmN0bDA1X3Rlc3RfeHh4eHgiCj4gKwo+ICtzdGF0aWMgdm9pZCB2ZXJpZnlfcHJjdGwodm9pZCkK
PiArewo+ICsJY2hhciBidWZbMjBdOwo+ICsKPiArCVRFU1QocHJjdGwoUFJfU0VUX05BTUUsICZ0
aHJlYWRfbmFtZSkpOwo+ICsJaWYgKFRTVF9SRVQgPT0gLTEpIHsKPiArCQl0c3RfcmVzKFRGQUlM
IHwgVFRFUlJOTywgInByY3RsKFBSX1NFVF9OQU1FKSBmYWlsZWQiKTsKPiArCQlyZXR1cm47Cj4g
Kwl9Cj4gKwl0c3RfcmVzKFRQQVNTLCAicHJjdGwoUFJfU0VUX05BTUUpIHN1Y2NlZWRlZCwgc2V0
IHRocmVhZCBuYW1lIGFzICIKPiArCQkJInByY3RsMDVfdGVzdF94eHh4eCIpOwo+ICsKPiArCVRF
U1QocHJjdGwoUFJfR0VUX05BTUUsICZidWYpKTsKPiArCWlmIChUU1RfUkVUID09IC0xKSB7Cj4g
KwkJdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkIik7
Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiArCWlmICghc3RybmNtcCh0aHJlYWRfbmFtZSwgYnVm
LCAxNSkgJiYgc3RybGVuKGJ1ZikgPT0gMTUpCj4gKwkJdHN0X3JlcyhUUEFTUywgInByY3RsKFBS
X0dFVF9OQU1FKSBzdWNjZWVkZWQsICIKPiArCQkJCSJ0aHJlYWQgbmFtZSBpcyAlcyIsIGJ1Zik7
Cj4gKwllbHNlCj4gKwkJdHN0X3JlcyhURkFJTCwKPiArCQkJInByY3RsKFBSX0dFVF9OQU1FKSBm
YWlsZWQgdG8gdHJ1bmNhdGUgdGhlIG5hbWUgaW50byAiCj4gKwkJCSIxNiBieXRlIGxvbmciKTsK
PiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICsJLnRlc3RfYWxs
ID0gdmVyaWZ5X3ByY3RsLAo+ICt9OwoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
