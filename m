Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426FF97A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:04:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC8C33EACA2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:04:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EDAAE3EA0E9
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:04:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C2C291A000B3
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:04:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3BB3AD93;
 Tue, 30 Apr 2019 13:04:05 +0000 (UTC)
Date: Tue, 30 Apr 2019 15:04:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190430130403.GC30997@rei.lan>
References: <20190430031859.28473-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430031859.28473-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it, Xiao Liang <xiliang@redhat.com>
Subject: Re: [LTP] [PATCH v4] hugetlb: limit hugepages according to
	MemAvailable
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

SGkhCj4gK3ZvaWQgbGltaXRfaHVnZXBhZ2VzKGxvbmcgKmhwYWdlcykKPiArewo+ICsJbG9uZyBt
ZW1fYXZhaWwsIG1heF9ocGFnZXM7Cj4gKwo+ICsJaWYgKEZJTEVfTElORVNfU0NBTkYoIi9wcm9j
L21lbWluZm8iLAo+ICsJCQkiTWVtQXZhaWxhYmxlOiAlbGQiLCAmbWVtX2F2YWlsKSkgewo+ICsJ
CS8qCj4gKwkJICogRHJvcHBpbmcgY2FjaGVzIGFuZCB1c2luZyAiTWVtRnJlZToiIG9uIGtlcm5l
bAo+ICsJCSAqIHRoYXQgZG9lc24ndCBoYXZlICJNZW1BdmFpbGFibGU6IiBpbiBNZW1pbmZvCj4g
KwkJICovCgpJJ3ZlIGFkZGVkIG9uZSBUSU5GTyBtZXNzYWdlIGhlcmUuCgo+ICsJCVNBRkVfRklM
RV9QUklOVEYoIi9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcyIsICIzIik7Cj4gKwkJbWVtX2F2YWls
ID0gU0FGRV9SRUFEX01FTUlORk8oIk1lbUZyZWU6Iik7Cj4gKwl9Cj4gKwo+ICsJbWF4X2hwYWdl
cyA9IG1lbV9hdmFpbCAvIFNBRkVfUkVBRF9NRU1JTkZPKCJIdWdlcGFnZXNpemU6Iik7Cj4gKwo+
ICsJaWYgKCpocGFnZXMgPiBtYXhfaHBhZ2VzKSB7Cj4gKwkJdHN0X3JlcyhUSU5GTywgIlRoZSBo
dWdlcGFnZXMgYmV5b25kIHN5c3RlbSBhdmFpbGFibGUsIGhlcmUgIgo+ICsJCQkJInJlc2V0IHRv
IDgwJSUgb2YgdGhlIG1heCBwYWdlIGNvdW50ICVsZCIsCj4gKwkJCQltYXhfaHBhZ2VzKTsKClJl
d29yZGVkIHRoaXMgbWVzc2FnZSBhIGJpdCwgdG8gbWFrZSBpdCBjbGVhcmVyLgoKCkFuZCBwdXNo
ZWQsIHRoYW5rcy4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
