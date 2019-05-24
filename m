Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92529408
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 10:59:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A38ED3EA5E2
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 10:59:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 62A0F3EA17E
 for <ltp@lists.linux.it>; Fri, 24 May 2019 10:59:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0B470141BB5C
 for <ltp@lists.linux.it>; Fri, 24 May 2019 10:59:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32A73ADF2;
 Fri, 24 May 2019 08:59:49 +0000 (UTC)
Date: Fri, 24 May 2019 10:59:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190524085947.GA11508@rei.lan>
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, ltp@lists.linux.it,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
 -> overlayfs
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

SGkhCj4gPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMgfCAyICst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMy5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+IGluZGV4IDQz
ZGM1YTJhZi4uNjI3ODIzYzVjIDEwMDY0NAo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mY250bC9mY250bDMzLmMKPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZmNudGwvZmNudGwzMy5jCj4gPiBAQCAtMTE3LDcgKzExNyw3IEBAIHN0YXRpYyB2b2lkIGRvX3Rl
c3QodW5zaWduZWQgaW50IGkpCj4gPiAgICAgICAgIGlmIChUU1RfUkVUID09IC0xKSB7Cj4gPiAg
ICAgICAgICAgICAgICAgaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJQyAmJiBUU1RfRVJS
ID09IEVBR0FJTikgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgdHN0X3JlcyhUSU5GTyB8
IFRURVJSTk8sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY250bChGX1NF
VExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3ZlcmxhcGZzIGFzIGV4cGVjdGVkIik7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmY250bChGX1NFVExFQVNFLCBGX1dSTENL
KSBmYWlsZWQgb24gb3ZlcmxheWZzIGFzIGV4cGVjdGVkIik7Cj4gCj4gWW91IGhhdmUgMyBtb3Jl
IG9mIHRoaXMgdHlwbyBpbiBmY250bCB0ZXN0cy4KCkFoLCByaWdodCwgSSBzaG91bGQgaGF2ZSBk
b25lIGdpdCBncmVwIGJlZm9yZSBjb21taXRpbmcgdGhpcy4gSSB3aWxsIGZpeAp0aGF0IHJpZ2h0
IGF3YXkuCgo+IElmIHlvdSBhc2sgbWUsIHNpbGVuY2luZyB0aGlzIGVycm9yIHNlZW1zIHdyb25n
Lgo+IFdoaWxlIHRoZSBlcnJvciBpcyAqZXhwZWN0ZWQqIGl0IGlzIHN0aWxsIGEgYnJva2VuIGlu
dGVyZmFjZS4KPiBJdCBtYXkgYmUganVzdCBhIG1hdHRlciBvZiB0ZXJtaW5vbG9neSwgYnV0IEkg
YW0gcmVhZGluZyB0aGlzIG1lc3NhZ2UgYXM6Cj4gCj4gVEVTVCBQQVNTRUQ6IE92ZXJsYXlmcyBm
YWlsZWQgYXMgZXhwZWN0ZWQKPiAKPiBXaGlsZSBpdCByZWFsbHkgc2hvdWxkIGJlIG1vcmUgYWxv
bmcgdGhlIGxpbmVzIG9mOgo+IAo+IFRFU1QgU0tJUFBFRDogT3ZlcmxheWZzIGRvZXNuJ3Qgc3Vw
cG9ydCB3cml0ZSBsZWFzZWQKCkFncmVlZCwgSSdtIGFsd2F5cyBhZ2FpbnN0IHdvcmtpbmcgYXJv
dW5kIGtlcm5lbCBidWdzL2RlZmljaWVuY2llcyBpbgp0ZXN0cywgdW5mb3J0dW5hdGVseSB0aGF0
IHVzdWFsbHkgY29uZmxpY3RzIHdpdGggUUEgZGVwYXJlbm1lbnRzIHRoYXQKd2FudHMgdG8gc2tp
cCBrbm93biBwcm9ibGVtcyBhbmQgaGF2ZSBldmVyeXRoaW5nIGdyZWVuLiBTbyB3ZSB1c3VhbGx5
CmVuZCB1cCBzb21ld2hlcmUgaW4gYSBtaWRkbGUgZ3JvdW5kLgoKQWxzbyBhcyB1c3VhbGwsIGRv
IHlvdSBjYXJlIGVub3VnaCB0byBzZW5kIGEgcGF0Y2g/IDotKQoKPiBCZXNpZGVzLCB0aGlzIHBy
b2JsZW0gbG9va3MgcXVpdGUgZWFzeSB0byBmaXguCj4gSSB0aGluayBCcnVjZSB3YXMgYWxyZWFk
eSBsb29raW5nIGF0IGNoYW5naW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IGNoZWNrX2NvbmZs
aWN0aW5nX29wZW4oKSwgc28gaWYgdGhlIHRlc3QgaXMgbm90IGZhaWxpbmcsIG5vYm9keSBpcyBn
b2luZyB0bwo+IG51ZGdlIGZvciBhIGZpeC4uLgoKT25jZSBpdCdzIGZpeGVkIHdlIGNhbiBjaGFu
Z2UgdGhhdCB0byBhIGZhaWx1cmUgZm9yIG5ldyBlbm91Z2gga2VybmVscywKb2xkIG9uZXMgc2hv
dWxkIHByb2JhYmx5IHN0YXkgd2l0aCBTS0lQUEVEL1RDT05GLgoKLS0gCkN5cmlsIEhydWJpcwpj
aHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
