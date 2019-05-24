Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08923298CD
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:21:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D27F73EA67C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:21:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 048373EA378
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:21:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4C9586026E3
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:21:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A14DAD4F;
 Fri, 24 May 2019 13:21:12 +0000 (UTC)
Date: Fri, 24 May 2019 15:21:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190524132109.GA30293@rei>
References: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
 <1558684246-2658-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558684246-2658-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl05.c: New test for prctl() with
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

SGkhCj4gKyNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KPiArI2luY2x1ZGUgPHN0cmluZy5oPgo+ICsj
aW5jbHVkZSA8c3RkaW8uaD4KPiArI2luY2x1ZGUgImxhcGkvc3lzY2FsbHMuaCIKPiArI2luY2x1
ZGUgImxhcGkvcHJjdGwuaCIKPiArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gKwo+ICtzdGF0aWMg
c3RydWN0IHRjYXNlIHsKPiArCWNoYXIgc2V0bmFtZVsyMF07Cj4gKwljaGFyIGV4cG5hbWVbMjBd
Owo+ICt9IHRjYXNlc1tdID0gewo+ICsJeyJwcmN0bDA1X3Rlc3QiLCAicHJjdGwwNV90ZXN0In0s
Cj4gKwl7InByY3RsMDVfdGVzdF94eHh4eCIsICJwcmN0bDA1X3Rlc3RfeHgifQo+ICt9Owo+ICsK
PiArc3RhdGljIHZvaWQgdmVyaWZ5X3ByY3RsKHVuc2lnbmVkIGludCBuKQo+ICt7Cj4gKwljaGFy
IGJ1ZlsyMF07Cj4gKwljaGFyIGNvbW1fYnVmWzIwXTsKPiArCWNoYXIgUFJPQ19OQU1FX1BBVEhb
NDBdOwoKVXBwZXJjYXNlIGlkZW50aWZpZXJzIGFyZSBieSBjb252ZW50aW9uIHVzZWQgZm9yIG1h
Y3JvcywgdGhpcyBzaG91bGQgYmUKcHJvY19wYXRoLCBvciBqdXN0IHBhdGguCgo+ICsJcGlkX3Qg
dGlkOwo+ICsJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07Cj4gKwo+ICsJVEVTVChwcmN0
bChQUl9TRVRfTkFNRSwgdGMtPnNldG5hbWUpKTsKPiArCWlmIChUU1RfUkVUID09IC0xKSB7Cj4g
KwkJdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJwcmN0bChQUl9TRVRfTkFNRSkgZmFpbGVkIik7
Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsJdHN0X3JlcyhUUEFTUywKPiArCQkicHJjdGwoUFJfU0VU
X05BTUUpIHN1Y2NlZWRlZCwgc2V0IHRocmVhZCBuYW1lIGFzICVzIiwgdGMtPnNldG5hbWUpOwoK
VGhpcyBjb3VsZCBiZSBzaG9ydGVyLCB3aHkgbm90IGp1c3Q6CgoJdHN0X3JlcyhUUEFTUywgInBy
Y3RsKFBSX1NFVF9OQU1FLCAnJXMnKSIsIHRjLT5zZXRuYW1lKTsKCj4gKwlURVNUKHByY3RsKFBS
X0dFVF9OQU1FLCBidWYpKTsKPiArCWlmIChUU1RfUkVUID09IC0xKSB7Cj4gKwkJdHN0X3JlcyhU
RkFJTCB8IFRURVJSTk8sICJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkIik7Cj4gKwkJcmV0dXJu
Owo+ICsJfQoKCkxvb2tzIGxpa2UgdGhlIG51bGwtdGVybWluYXRpb24gZ290IGxvc3QgYmV0d2Vl
biB2MiBhbmQgdjMuCgpBbmQgaXQgd291bGQgYmUgYmV0dGVyIG5vdCB0byBoYXJkY29kZSB0aGUg
c2l6ZSB3aXRoOgoKYnVmW3NpemVvZihidWYpLTFdID0gMDsKCj4gKwlpZiAoc3RyY21wKHRjLT5l
eHBuYW1lLCBidWYpKQo+ICsJCXRzdF9yZXMoVEZBSUwsCj4gKwkJCSJwcmN0bChQUl9HRVRfTkFN
RSkgZmFpbGVkICxleHBlY3RlZCAlcywgZ290ICVzIiwgdGMtPmV4cG5hbWUsIGJ1Zik7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoJCQkJCQkgIFRo
ZSBjb21tYSBzaG91bGQgYmUKCQkJCQkJICBiZWZvcmUgdGhlIHNwYWNlLgo+ICsJZWxzZQo+ICsJ
CXRzdF9yZXMoVFBBU1MsCj4gKwkJCSJwcmN0bChQUl9HRVRfTkFNRSkgc3VjY2VlZGVkLCB0aHJl
YWQgbmFtZSBpcyAlcyIsIGJ1Zik7Cj4gKwo+ICsJdGlkID0gdHN0X3N5c2NhbGwoX19OUl9nZXR0
aWQpOwo+ICsKPiArCXNwcmludGYoUFJPQ19OQU1FX1BBVEgsICIvcHJvYy9zZWxmL3Rhc2svJWQv
Y29tbSIsIHRpZCk7Cj4gKwlTQUZFX0ZJTEVfU0NBTkYoUFJPQ19OQU1FX1BBVEgsICIlcyIsIGNv
bW1fYnVmKTsKPiArCWlmIChzdHJjbXAodGMtPmV4cG5hbWUsIGNvbW1fYnVmKSkKPiArCQl0c3Rf
cmVzKFRGQUlMLAo+ICsJCQkiJXMgc2V0cyB0aHJlYWQgbmFtZSBmYWlsZWQsIGV4cGVjdGVkICVz
LCBnb3QgJXMiLAoKVGhpcyBtZXNzYWdlIGNvdWxkIGJlIHNob3J0ZXIgYW5kIHRvIHRoZSBwb2lu
dCwgc29tZXRoaW5nIGFzOgoKdHN0X3JlcyhURkFJTCwgIiVzIGhhcyAlcywgZXhwZWN0ZWQgJXMi
LCBwYXRoLCBidWYsIHRjLT5leHBuYW1lKTsKCgo+ICsJCQlQUk9DX05BTUVfUEFUSCwgdGMtPmV4
cG5hbWUsIGNvbW1fYnVmKTsKPiArCWVsc2UKPiArCQl0c3RfcmVzKFRQQVNTLCAiJXMgc2V0cyB0
aHJlYWQgbmFtZSBzdWNjZWVkIGFzICVzIiwKCkhlcmUgYXMgd2VsbCwgc29tZXRoaW5nIGFzOgoK
dHN0X3JlcyhUUEFTUywgIiVzIHNldCB0byAlcyIsIHBhdGgsIGJ1Zik7Cgo+ICsJCQlQUk9DX05B
TUVfUEFUSCwgY29tbV9idWYpOwo+ICsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCB0c3RfdGVz
dCB0ZXN0ID0gewo+ICsJLnRlc3QgPSB2ZXJpZnlfcHJjdGwsCj4gKwkudGNudCA9IEFSUkFZX1NJ
WkUodGNhc2VzKSwKPiArfTsKPiAtLSAKPiAyLjE4LjEKPiAKPiAKPiAKCi0tIApDeXJpbCBIcnVi
aXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
