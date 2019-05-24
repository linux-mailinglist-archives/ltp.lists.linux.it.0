Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B129024
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 06:49:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66F7B294ADB
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 06:49:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 69B183EA603
 for <ltp@lists.linux.it>; Fri, 24 May 2019 06:48:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F9AB1003A5F
 for <ltp@lists.linux.it>; Fri, 24 May 2019 06:48:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC09E81DF9;
 Fri, 24 May 2019 04:48:52 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A3F262516;
 Fri, 24 May 2019 04:48:51 +0000 (UTC)
Date: Fri, 24 May 2019 12:48:50 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190524044850.x6adkl6uen5tgeqw@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510> <20190515134245.GC5429@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515134245.GC5429@dell5510>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 24 May 2019 04:48:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCk9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDAzOjQyOjQ1UE0gKzAyMDAsIFBldHIg
Vm9yZWwgd3JvdGU6Cj4gSGkgTXVycGh5LAo+IAo+ID4gLi4uCj4gPiA+ICtpbnQgc2V0dXBfb3Zl
cmxheShpbnQgbW91bnRvdmwpCj4gPiA+ICt7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4g
PiArCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQgd2l0aCBsb3dlciBkaXIgYW5kIGZpbGUgKi8K
PiA+ID4gKwlTQUZFX01LRElSKE9WTF9MT1dFUiwgMDc1NSk7Cj4gPiA+ICsJU0FGRV9NS0RJUihP
VkxfVVBQRVIsIDA3NTUpOwo+ID4gPiArCVNBRkVfTUtESVIoT1ZMX1dPUkssIDA3NTUpOwo+ID4g
PiArCVNBRkVfTUtESVIoT1ZMX01OVCwgMDc1NSk7Cj4gPiA+ICsKPiA+ID4gKwkvKiBPbmx5IGNy
ZWF0ZSBkaXJzLCBkbyBub3QgbW91bnQgKi8KPiA+ID4gKwlpZiAobW91bnRvdmwgPT0gMCkKPiA+
ID4gKwkJcmV0dXJuIDA7Cj4gPiBJbnN0ZWFkIG9mIGhhdmluZyBpbnQgcGFyYW1ldGVyLCB0aGVy
ZSBjb3VsZCBiZSBjcmVhdGVfb3ZlcmxheV9kaXJzKCkKPiA+IGFuZCBtb3VudF9vdmVybGF5KCks
IHdoaWNoIHdvdWxkIGNhbGwgY3JlYXRlX292ZXJsYXlfZGlycygpLgo+ID4gKG5vIG5lZWQgdG8g
bG9va3VwIG1lYW5pbmcgb2YgcGFyYW1ldGVyKS4KPiAKPiA+ID4gKwo+ID4gPiArCXJldCA9IG1v
dW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dF
Ugo+ID4gPiArCQkgICAgIix1cHBlcmRpcj0iT1ZMX1VQUEVSIix3b3JrZGlyPSJPVkxfV09SSyk7
Cj4gPiA+ICsJaWYgKHJldCA8IDApIHsKPiA+ID4gKwkJaWYgKGVycm5vID09IEVOT0RFVikgewo+
ID4gPiArCQkJdHN0X3JlcyhUSU5GTywKPiA+ID4gKwkJCQkib3ZlcmxheWZzIGlzIG5vdCBjb25m
aWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+ID4gPiArCQkJcmV0dXJuIDE7Cj4gPiBGaXJzdCBJ
IHRob3VnaHQgd2UnZCBpbXBsZW1lbnQgaXQgYXMgYSB0ZXN0IGZsYWcgKG1lbWJlciBvZiBzdHJ1
Y3QgdHN0X3Rlc3QpLgo+ID4gV2hlbiB3ZSBoYXZlIGl0IGFzIHNlcGFyYXRlIGZ1bmN0aW9uIEkg
d29uZGVyIHdoZXRoZXIgd2UgY291bGQgVENPTkYgb24gRU5PREVWCj4gPiBpbnN0ZWFkIG9mIFRJ
TkZPIGFuZCByZXR1cm4uIE1heWJlIHRoZXJlIGNvdWxkIGJlIGhlcmUgZm9yIGludCBzdHJpY3Qg
cGFyYW1ldGVyLAo+ID4gd2hlcmUgMSB3b3VsZCBiZSBmb3JjZSBzYWZlIChpLmUuIFRDT05GKSwg
b3RoZXJ3aXNlIG9ubHkgVElORk8uCj4gPiBUaGlzIGNvdWxkIGFsc28gdG8gaGF2ZSBTQUZFX01P
VU5UX09WRVJMQVkoKSBtYWNybyB3aGljaCB3b3VsZCB1c2UgbW91bnRfb3ZlcmxheSgpLgo+ID4g
U2ltaWxhciBhcHByb2FjaCBhcyBTQUZFX1NFTkQoKSBhbmQgc2FmZV9zZW5kKCkuCj4gCj4gRnJv
bSBuZXh0IHBhdGNoOgo+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pbm90aWZ5
L2lub3RpZnkwNy5jCj4gPiAtI2RlZmluZSBPVkxfTU5UICJvdmwiCj4gPiAgI2RlZmluZSBESVJf
TkFNRSAidGVzdF9kaXIiCj4gPiAgI2RlZmluZSBESVJfUEFUSCBPVkxfTU5UIi8iRElSX05BTUUK
PiA+ICAjZGVmaW5lIEZJTEVfTkFNRSAidGVzdF9maWxlIgo+ID4gICNkZWZpbmUgRklMRV9QQVRI
IE9WTF9NTlQiLyJESVJfTkFNRSIvIkZJTEVfTkFNRQo+IAo+ID4gIHN0YXRpYyBpbnQgb3ZsX21v
dW50ZWQ7Cj4gPiArc3RhdGljIGNvbnN0IGNoYXIgbW50cG9pbnRbXSA9IE9WTF9CQVNFX01OVFBP
SU5UOwo+IAo+ID4gIHN0YXRpYyBzdHJ1Y3QgZXZlbnRfdCBldmVudF9zZXRbRVZFTlRfTUFYXTsK
PiAKPiA+IEBAIC0xNjQsMTQgKzE2NCwxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ID4g
IAlpbnQgcmV0Owo+IAo+ID4gIAkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdpdGggbG93ZXIg
ZGlyIGFuZCBmaWxlICovCj4gPiAtCVNBRkVfTUtESVIoImxvd2VyIiwgMDc1NSk7Cj4gPiAtCVNB
RkVfTUtESVIoImxvd2VyLyJESVJfTkFNRSwgMDc1NSk7Cj4gPiAtCVNBRkVfVE9VQ0goImxvd2Vy
LyJESVJfTkFNRSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Cj4gPiAtCVNBRkVfTUtESVIoInVw
cGVyIiwgMDc1NSk7Cj4gPiAtCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKPiA+IC0JU0FGRV9N
S0RJUihPVkxfTU5ULCAwNzU1KTsKPiA+IC0JcmV0ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5U
LCAib3ZlcmxheSIsIDAsCj4gPiAtCQkgICAgImxvd2VyZGlyPWxvd2VyLHVwcGVyZGlyPXVwcGVy
LHdvcmtkaXI9d29yayIpOwo+ID4gKwlzZXR1cF9vdmVybGF5KDApOwo+ID4gKwlTQUZFX01LRElS
KE9WTF9MT1dFUiIvIkRJUl9OQU1FLCAwNzU1KTsKPiA+ICsJU0FGRV9UT1VDSChPVkxfTE9XRVIi
LyJESVJfTkFNRSIvIkZJTEVfTkFNRSwgMDY0NCwgTlVMTCk7Cj4gPiArCXJldCA9IG1vdW50KCJv
dmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgo+ID4g
KwkJICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+ID4gIAlp
ZiAocmV0IDwgMCkgewo+ID4gIAkJaWYgKGVycm5vID09IEVOT0RFVikgewo+ID4gIAkJCXRzdF9i
cmsoVENPTkYsCj4gSW4gaGVyZSBpbiBpbm90aWZ5MDcuYyBhbmQgaW4gaW5vdGlmeTA4LmMgeW91
IGNyZWF0ZSBkaXJzICgwIHBhcmFtZXRlcikgZm9yIGJlY2F1c2UgeW91IGl0J3MKPiBuZWVkZWQg
dG8gY3JlYXRlIG1vcmUgZGlycy4gVGhhbiB0aGUgcmVzdCAobW91bnQsIFRDT05GIG9uIEVOT0RF
ViwgVEJST0sKPiBvdGhlcndpc2UpIGlzIHN0aWxsIGNvcHkgcGFzdGVkLiBJIHdvbmRlciBob3cg
dG8gbW92ZSBldmVyeXRoaW5nIGludG8KPiBzZXR1cF9vdmVybGF5KCkgaGVscGVyLiBNYXliZSBz
dHJ1Y3Qgd2l0aCBmaWxlcyBvciBkaXJlY3RvcmllcyBhbmQgcGVybWlzc2lvbnMKCklmIHdlIGRl
ZmluZSBhIHN0cnVjdCB0byBwdXQgbmFtZXMgYW1kIG1vZGVzIGluIGl0IHRoZW4gcGFzcyB0byBo
ZWxwZXIsIHdlCnN0aWxsIG5lZWQgdG8gd3JpdGUgYWxsIHRoZXNlIE9WTCBtYWNyb3MgaW4gdGhl
IHRlc3RjYXNlIHRvIGRlZmlsZSB0aGUgc3RydWN0LgpTbyB3ZSBuZWVkIHRvIHdyaXRlIGFsbCB0
aGUgX3NhbWVfIG1hY3JvcyBpbiBldmVyeSB0ZXN0Y2FzZSB3aGVyZSBuZWVkZWQuCgpJbiB0aGlz
IGNhc2UsIGl0J3MgYWdhaW5zdCBteSBpbnRlbnRpb24gb2YgdGhpcyBwYXRjaDogZGVkdXBlIGR1
cGxpY2F0ZWQgbGluZXMuCgpZb3VyIHN0cnVjdCBpZGVhIGlzIGdyZWF0IHdoZW4gaGFuZGxpbmcg
dGhlIGRpZmZlcmVudCBmaWxlcyB0aGF0IG5lZWQgdG8gYmUKY3JlYXRlZCBpbiBkaWZmZXJlbnQg
dGVzdGNhc2VzLiBIb3dldmVyIEknZCBsaWtlIHRvIGRvIGl0IGluIGEgc2ltcGxlciB3YXkuCk9u
bHkgbWFrZSBuZWNlc3NhcnkgZGlycyBpbiB0aGUgaGVscGVyLCBsZXQgdGhlIHRlc3RjYXNlcyB0
byBjcmVhdGUgdGhlIG90aGVyCmRpcnMgdGhleSB3YW50IHRoZW1zZWx2ZXMuCgpUaGFua3MsCk11
cnBoeQoKPiB0byBmb3IgdG91Y2gvbWtkaXI/IFdpdGggdGhpcywgaW50IG1vdW50b3ZsIGRpciBj
cmVhdGVfb3ZlcmxheV9kaXJzKCkgbWlnaHQgbm90Cj4gYmUgbmVlZGVkLgo+IAo+IAo+IEtpbmQg
cmVnYXJkcywKPiBQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
