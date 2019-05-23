Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C528430
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 18:46:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A99B53EA43C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 18:46:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5DF943EA293
 for <ltp@lists.linux.it>; Thu, 23 May 2019 18:46:15 +0200 (CEST)
Received: from fieldses.org (fieldses.org [173.255.197.46])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 883601A0111C
 for <ltp@lists.linux.it>; Thu, 23 May 2019 18:46:14 +0200 (CEST)
Received: by fieldses.org (Postfix, from userid 2815)
 id 9001088A; Thu, 23 May 2019 12:46:12 -0400 (EDT)
Date: Thu, 23 May 2019 12:46:12 -0400
From: "J. Bruce Fields" <bfields@fieldses.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190523164612.GA11083@fieldses.org>
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: Miklos Szeredi <miklos@szeredi.hu>, ltp@lists.linux.it,
 overlayfs <linux-unionfs@vger.kernel.org>
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDY6NDI6MTJQTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNDo0NSBQTSBDeXJpbCBIcnViaXMgPGNo
cnViaXNAc3VzZS5jej4gd3JvdGU6Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ3lyaWwgSHJ1Ymlz
IDxjaHJ1YmlzQHN1c2UuY3o+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2ZjbnRsL2ZjbnRsMzMuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mY250bC9mY250bDMzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRs
L2ZjbnRsMzMuYwo+ID4gaW5kZXggNDNkYzVhMmFmLi42Mjc4MjNjNWMgMTAwNjQ0Cj4gPiAtLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwo+ID4gKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKPiA+IEBAIC0xMTcsNyArMTE3
LDcgQEAgc3RhdGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgaSkKPiA+ICAgICAgICAgaWYg
KFRTVF9SRVQgPT0gLTEpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAodHlwZSA9PSBUU1RfT1ZF
UkxBWUZTX01BR0lDICYmIFRTVF9FUlIgPT0gRUFHQUlOKSB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB0c3RfcmVzKFRJTkZPIHwgVFRFUlJOTywKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBvdmVybGFw
ZnMgYXMgZXhwZWN0ZWQiKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZj
bnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBvdmVybGF5ZnMgYXMgZXhwZWN0ZWQi
KTsKPiAKPiBZb3UgaGF2ZSAzIG1vcmUgb2YgdGhpcyB0eXBvIGluIGZjbnRsIHRlc3RzLgo+IAo+
IElmIHlvdSBhc2sgbWUsIHNpbGVuY2luZyB0aGlzIGVycm9yIHNlZW1zIHdyb25nLgo+IFdoaWxl
IHRoZSBlcnJvciBpcyAqZXhwZWN0ZWQqIGl0IGlzIHN0aWxsIGEgYnJva2VuIGludGVyZmFjZS4K
PiBJdCBtYXkgYmUganVzdCBhIG1hdHRlciBvZiB0ZXJtaW5vbG9neSwgYnV0IEkgYW0gcmVhZGlu
ZyB0aGlzIG1lc3NhZ2UgYXM6Cj4gCj4gVEVTVCBQQVNTRUQ6IE92ZXJsYXlmcyBmYWlsZWQgYXMg
ZXhwZWN0ZWQKPiAKPiBXaGlsZSBpdCByZWFsbHkgc2hvdWxkIGJlIG1vcmUgYWxvbmcgdGhlIGxp
bmVzIG9mOgo+IAo+IFRFU1QgU0tJUFBFRDogT3ZlcmxheWZzIGRvZXNuJ3Qgc3VwcG9ydCB3cml0
ZSBsZWFzZWQKPiAKPiBCZXNpZGVzLCB0aGlzIHByb2JsZW0gbG9va3MgcXVpdGUgZWFzeSB0byBm
aXguCj4gSSB0aGluayBCcnVjZSB3YXMgYWxyZWFkeSBsb29raW5nIGF0IGNoYW5naW5nIHRoZSBp
bXBsZW1lbnRhdGlvbiBvZgo+IGNoZWNrX2NvbmZsaWN0aW5nX29wZW4oKSwgc28gaWYgdGhlIHRl
c3QgaXMgbm90IGZhaWxpbmcsIG5vYm9keSBpcyBnb2luZyB0bwo+IG51ZGdlIGZvciBhIGZpeC4u
LgoKVW0sIEkgcmVtZW1iZXIgdGhhdCBkaXNjdXNzaW9uIGJ1dCBJIGNhbid0IHJlbWVtYmVyIHdo
YXQgdGhlIG9ic3RhY2xlcwp3ZXJlIGluIHRoZSBlbmQuICBUcnlpbmcgdG8gZmluZCB0aGF0IHRo
cmVhZC4uLi4KCi0tYi4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
