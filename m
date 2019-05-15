Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7D1F598
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:31:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50B1A294AF0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:31:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AE71B294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:31:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DD9F4601CC1
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:31:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85CEFAF70;
 Wed, 15 May 2019 13:31:04 +0000 (UTC)
Date: Wed, 15 May 2019 15:31:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190515133102.GA5429@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515092129.26336-1-xzhou@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

SGkgTXVycGh5LAoKPiBUbyBjcmVhdGUgb3ZlcmxheWZzIGRpcnMsIGFuZCBtb3VudCBvdmVybGF5
ZnMgaWYgbmVlZGVkLgoKLi4uCj4gK2ludCBzZXR1cF9vdmVybGF5KGludCBtb3VudG92bCkKPiAr
ewo+ICsJaW50IHJldDsKPiArCj4gKwkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdpdGggbG93
ZXIgZGlyIGFuZCBmaWxlICovCj4gKwlTQUZFX01LRElSKE9WTF9MT1dFUiwgMDc1NSk7Cj4gKwlT
QUZFX01LRElSKE9WTF9VUFBFUiwgMDc1NSk7Cj4gKwlTQUZFX01LRElSKE9WTF9XT1JLLCAwNzU1
KTsKPiArCVNBRkVfTUtESVIoT1ZMX01OVCwgMDc1NSk7Cj4gKwo+ICsJLyogT25seSBjcmVhdGUg
ZGlycywgZG8gbm90IG1vdW50ICovCj4gKwlpZiAobW91bnRvdmwgPT0gMCkKPiArCQlyZXR1cm4g
MDsKSW5zdGVhZCBvZiBoYXZpbmcgaW50IHBhcmFtZXRlciwgdGhlcmUgY291bGQgYmUgY3JlYXRl
X292ZXJsYXlfZGlycygpCmFuZCBtb3VudF9vdmVybGF5KCksIHdoaWNoIHdvdWxkIGNhbGwgY3Jl
YXRlX292ZXJsYXlfZGlycygpLgoobm8gbmVlZCB0byBsb29rdXAgbWVhbmluZyBvZiBwYXJhbWV0
ZXIpLgoKPiArCj4gKwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVybGF5Iiwg
MCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKPiArCQkgICAgIix1cHBlcmRpcj0iT1ZMX1VQUEVSIix3
b3JrZGlyPSJPVkxfV09SSyk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWlmIChlcnJubyA9PSBF
Tk9ERVYpIHsKPiArCQkJdHN0X3JlcyhUSU5GTywKPiArCQkJCSJvdmVybGF5ZnMgaXMgbm90IGNv
bmZpZ3VyZWQgaW4gdGhpcyBrZXJuZWwuIik7Cj4gKwkJCXJldHVybiAxOwpGaXJzdCBJIHRob3Vn
aHQgd2UnZCBpbXBsZW1lbnQgaXQgYXMgYSB0ZXN0IGZsYWcgKG1lbWJlciBvZiBzdHJ1Y3QgdHN0
X3Rlc3QpLgpXaGVuIHdlIGhhdmUgaXQgYXMgc2VwYXJhdGUgZnVuY3Rpb24gSSB3b25kZXIgd2hl
dGhlciB3ZSBjb3VsZCBUQ09ORiBvbiBFTk9ERVYKaW5zdGVhZCBvZiBUSU5GTyBhbmQgcmV0dXJu
LiBNYXliZSB0aGVyZSBjb3VsZCBiZSBoZXJlIGZvciBpbnQgc3RyaWN0IHBhcmFtZXRlciwKd2hl
cmUgMSB3b3VsZCBiZSBmb3JjZSBzYWZlIChpLmUuIFRDT05GKSwgb3RoZXJ3aXNlIG9ubHkgVElO
Rk8uClRoaXMgY291bGQgYWxzbyB0byBoYXZlIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIG1hY3JvIHdo
aWNoIHdvdWxkIHVzZSBtb3VudF9vdmVybGF5KCkuClNpbWlsYXIgYXBwcm9hY2ggYXMgU0FGRV9T
RU5EKCkgYW5kIHNhZmVfc2VuZCgpLgoKPiArCQl9Cj4gKwkJdHN0X2JyayhUQlJPSyB8IFRFUlJO
TywgIm92ZXJsYXlmcyBtb3VudCBmYWlsZWQiKTsKPiArCX0KPiArCXJldHVybiAwOwo+ICt9CgpL
aW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
