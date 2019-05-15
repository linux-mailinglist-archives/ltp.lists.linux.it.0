Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 216461F5C0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:42:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF7D8294AC1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 15:42:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1AC33294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:42:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A41661A00F9C
 for <ltp@lists.linux.it>; Wed, 15 May 2019 15:42:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1B1BAD56;
 Wed, 15 May 2019 13:42:46 +0000 (UTC)
Date: Wed, 15 May 2019 15:42:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190515134245.GC5429@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515133102.GA5429@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

SGkgTXVycGh5LAoKPiAuLi4KPiA+ICtpbnQgc2V0dXBfb3ZlcmxheShpbnQgbW91bnRvdmwpCj4g
PiArewo+ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50
IHdpdGggbG93ZXIgZGlyIGFuZCBmaWxlICovCj4gPiArCVNBRkVfTUtESVIoT1ZMX0xPV0VSLCAw
NzU1KTsKPiA+ICsJU0FGRV9NS0RJUihPVkxfVVBQRVIsIDA3NTUpOwo+ID4gKwlTQUZFX01LRElS
KE9WTF9XT1JLLCAwNzU1KTsKPiA+ICsJU0FGRV9NS0RJUihPVkxfTU5ULCAwNzU1KTsKPiA+ICsK
PiA+ICsJLyogT25seSBjcmVhdGUgZGlycywgZG8gbm90IG1vdW50ICovCj4gPiArCWlmIChtb3Vu
dG92bCA9PSAwKQo+ID4gKwkJcmV0dXJuIDA7Cj4gSW5zdGVhZCBvZiBoYXZpbmcgaW50IHBhcmFt
ZXRlciwgdGhlcmUgY291bGQgYmUgY3JlYXRlX292ZXJsYXlfZGlycygpCj4gYW5kIG1vdW50X292
ZXJsYXkoKSwgd2hpY2ggd291bGQgY2FsbCBjcmVhdGVfb3ZlcmxheV9kaXJzKCkuCj4gKG5vIG5l
ZWQgdG8gbG9va3VwIG1lYW5pbmcgb2YgcGFyYW1ldGVyKS4KCj4gPiArCj4gPiArCXJldCA9IG1v
dW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dF
Ugo+ID4gKwkJICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+
ID4gKwlpZiAocmV0IDwgMCkgewo+ID4gKwkJaWYgKGVycm5vID09IEVOT0RFVikgewo+ID4gKwkJ
CXRzdF9yZXMoVElORk8sCj4gPiArCQkJCSJvdmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4g
dGhpcyBrZXJuZWwuIik7Cj4gPiArCQkJcmV0dXJuIDE7Cj4gRmlyc3QgSSB0aG91Z2h0IHdlJ2Qg
aW1wbGVtZW50IGl0IGFzIGEgdGVzdCBmbGFnIChtZW1iZXIgb2Ygc3RydWN0IHRzdF90ZXN0KS4K
PiBXaGVuIHdlIGhhdmUgaXQgYXMgc2VwYXJhdGUgZnVuY3Rpb24gSSB3b25kZXIgd2hldGhlciB3
ZSBjb3VsZCBUQ09ORiBvbiBFTk9ERVYKPiBpbnN0ZWFkIG9mIFRJTkZPIGFuZCByZXR1cm4uIE1h
eWJlIHRoZXJlIGNvdWxkIGJlIGhlcmUgZm9yIGludCBzdHJpY3QgcGFyYW1ldGVyLAo+IHdoZXJl
IDEgd291bGQgYmUgZm9yY2Ugc2FmZSAoaS5lLiBUQ09ORiksIG90aGVyd2lzZSBvbmx5IFRJTkZP
Lgo+IFRoaXMgY291bGQgYWxzbyB0byBoYXZlIFNBRkVfTU9VTlRfT1ZFUkxBWSgpIG1hY3JvIHdo
aWNoIHdvdWxkIHVzZSBtb3VudF9vdmVybGF5KCkuCj4gU2ltaWxhciBhcHByb2FjaCBhcyBTQUZF
X1NFTkQoKSBhbmQgc2FmZV9zZW5kKCkuCgpGcm9tIG5leHQgcGF0Y2g6Cj4gKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5L2lub3RpZnkwNy5jCj4gLSNkZWZpbmUgT1ZMX01O
VCAib3ZsIgo+ICAjZGVmaW5lIERJUl9OQU1FICJ0ZXN0X2RpciIKPiAgI2RlZmluZSBESVJfUEFU
SCBPVkxfTU5UIi8iRElSX05BTUUKPiAgI2RlZmluZSBGSUxFX05BTUUgInRlc3RfZmlsZSIKPiAg
I2RlZmluZSBGSUxFX1BBVEggT1ZMX01OVCIvIkRJUl9OQU1FIi8iRklMRV9OQU1FCgo+ICBzdGF0
aWMgaW50IG92bF9tb3VudGVkOwo+ICtzdGF0aWMgY29uc3QgY2hhciBtbnRwb2ludFtdID0gT1ZM
X0JBU0VfTU5UUE9JTlQ7Cgo+ICBzdGF0aWMgc3RydWN0IGV2ZW50X3QgZXZlbnRfc2V0W0VWRU5U
X01BWF07Cgo+IEBAIC0xNjQsMTQgKzE2NCwxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+
ICAJaW50IHJldDsKCj4gIAkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdpdGggbG93ZXIgZGly
IGFuZCBmaWxlICovCj4gLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwo+IC0JU0FGRV9NS0RJ
UigibG93ZXIvIkRJUl9OQU1FLCAwNzU1KTsKPiAtCVNBRkVfVE9VQ0goImxvd2VyLyJESVJfTkFN
RSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Cj4gLQlTQUZFX01LRElSKCJ1cHBlciIsIDA3NTUp
Owo+IC0JU0FGRV9NS0RJUigid29yayIsIDA3NTUpOwo+IC0JU0FGRV9NS0RJUihPVkxfTU5ULCAw
NzU1KTsKPiAtCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLAo+
IC0JCSAgICAibG93ZXJkaXI9bG93ZXIsdXBwZXJkaXI9dXBwZXIsd29ya2Rpcj13b3JrIik7Cj4g
KwlzZXR1cF9vdmVybGF5KDApOwo+ICsJU0FGRV9NS0RJUihPVkxfTE9XRVIiLyJESVJfTkFNRSwg
MDc1NSk7Cj4gKwlTQUZFX1RPVUNIKE9WTF9MT1dFUiIvIkRJUl9OQU1FIi8iRklMRV9OQU1FLCAw
NjQ0LCBOVUxMKTsKPiArCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXki
LCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgo+ICsJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIi
LHdvcmtkaXI9Ik9WTF9XT1JLKTsKPiAgCWlmIChyZXQgPCAwKSB7Cj4gIAkJaWYgKGVycm5vID09
IEVOT0RFVikgewo+ICAJCQl0c3RfYnJrKFRDT05GLApJbiBoZXJlIGluIGlub3RpZnkwNy5jIGFu
ZCBpbiBpbm90aWZ5MDguYyB5b3UgY3JlYXRlIGRpcnMgKDAgcGFyYW1ldGVyKSBmb3IgYmVjYXVz
ZSB5b3UgaXQncwpuZWVkZWQgdG8gY3JlYXRlIG1vcmUgZGlycy4gVGhhbiB0aGUgcmVzdCAobW91
bnQsIFRDT05GIG9uIEVOT0RFViwgVEJST0sKb3RoZXJ3aXNlKSBpcyBzdGlsbCBjb3B5IHBhc3Rl
ZC4gSSB3b25kZXIgaG93IHRvIG1vdmUgZXZlcnl0aGluZyBpbnRvCnNldHVwX292ZXJsYXkoKSBo
ZWxwZXIuIE1heWJlIHN0cnVjdCB3aXRoIGZpbGVzIG9yIGRpcmVjdG9yaWVzIGFuZCBwZXJtaXNz
aW9ucwp0byBmb3IgdG91Y2gvbWtkaXI/IFdpdGggdGhpcywgaW50IG1vdW50b3ZsIGRpciBjcmVh
dGVfb3ZlcmxheV9kaXJzKCkgbWlnaHQgbm90CmJlIG5lZWRlZC4KCgpLaW5kIHJlZ2FyZHMsClBl
dHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
