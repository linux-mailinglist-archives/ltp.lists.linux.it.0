Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC522DA1C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:12:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C7983EA25F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 12:12:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BA40E3EA1DA
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:12:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 72463200DBD
 for <ltp@lists.linux.it>; Wed, 29 May 2019 12:12:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AED65AC84;
 Wed, 29 May 2019 10:12:28 +0000 (UTC)
Date: Wed, 29 May 2019 12:12:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190529101227.GB26685@rei.lan>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-3-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519003808.47425-3-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/5] syscalls/adjtimex02: Convert to new library
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

SGkhCj4gKwlidWZmID0gdGltX3NhdmU7Cj4gKwlidWZmLm1vZGVzID0gU0VUX01PREU7Cj4gKwlz
d2l0Y2ggKG5yKSB7Cj4gKwljYXNlIDA6Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIDE6Cj4gKwkJYnVm
Zi50aWNrID0gOTAwMDAwIC8gaHogLSAxOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSAyOgo+ICsJCWJ1
ZmYudGljayA9IDExMDAwMDAgLyBoeiArIDE7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIDM6Cj4gKwkJ
LyogU3dpdGNoIHRvIG5vYm9keSB1c2VyIGZvciBjb3JyZWN0IGVycm9yIGNvZGUgY29sbGVjdGlv
biAqLwo+ICsJCWx0cHVzZXIgPSBTQUZFX0dFVFBXTkFNKCJub2JvZHkiKTsKPiArCQlTQUZFX1NF
VEVVSUQobHRwdXNlci0+cHdfdWlkKTsKPiArCQlicmVhazsKPiArCWNhc2UgNDoKPiArCQlidWZm
Lm9mZnNldCA9IDUxMjAwMEwgKyAxOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSA1Ogo+ICsJCWJ1ZmYu
b2Zmc2V0ID0gKC0xKSAqICg1MTIwMDBMKSAtIDE7Cj4gKwkJYnJlYWs7Cj4gKwlkZWZhdWx0Ogo+
ICsJCXRzdF9icmsoVEZBSUwsICJJbnZhbGlkIHRlc3QgY2FzZSAldSAiLCBucik7Cj4gKwl9CgoK
V2hhdCBJIGRvIG5vdCBsaWtlIGFib3V0IHRoaXMgaXMgdGhhdCBoYWxmIG9mIHRoZSBkYXRhIGlz
IG5vdyBpbiB0aGUKc3RydWN0dXJlIHdpdGggZXJybm9zIHdoaWxlIHRoZSBvdGhlciBoYWxmIGlz
IGVuY29kZWQgaW4gdGhpcyBzd2l0Y2ggYW5kCndlIGRlcGVuZCBvbiB0aGUgb3JkZXIgb2YgdGhl
IHN0cnVjdHVyZS4KCkluIHRoaXMgY2FzZSBJIHRoaW5rIHRoYXQgdGhlIGNsZWFuZXIgb3B0aW9u
IHdvdWxkIGJlIGdldHRpbmcgcmlkIG9mIHRoZQpzdHJ1Y3R1cmUgYW5kIHNldCB0aGUgZXhwZWN0
ZWQgZXJybm8gaW4gdGhlIHN3aXRjaC4gVGhhdCB3YXkgYWxsIHRoZQpkYXRhIHdvdWxkIGJlIGlu
IGEgc2luZ2xlIHBsYWNlIGF0IGxlYXN0LgoKPiAtCXRzdF9leGl0KCk7Cj4gKwlURVNUKGFkanRp
bWV4KHRjYXNlLT5idWZmcCkpOwo+ICsJaWYgKChUU1RfUkVUID09IC0xKSAmJiAoVFNUX0VSUiA9
PSB0Y2FzZS0+ZXhwX2Vycm5vKSkgewo+ICsJCXRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLAo+ICsJ
CQkJImFkanRpbWV4KCkgZXJyb3IgJXUgIiwgdGNhc2UtPmV4cF9lcnJubyk7Cj4gKwl9IGVsc2Ug
ewo+ICsJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLAo+ICsJCQkJIlRlc3QgRmFpbGVkLCBhZGp0
aW1leCgpIHJldHVybmVkICVsZCIsCj4gKwkJCQlUU1RfUkVUKTsKPiArCX0KPiAgCj4gKwkvKiBj
bGVhbiB1cCBhZnRlciBvdXJzZWx2ZXMgKi8KPiArCWlmIChuciA9PSAzKQo+ICsJCVNBRkVfU0VU
RVVJRCgwKTsKPiAgfQoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
