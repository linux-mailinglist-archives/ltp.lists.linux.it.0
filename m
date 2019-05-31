Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409230F3A
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:47:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E70D53EA351
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:47:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F18F33EA195
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:47:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 43A80100143E
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:47:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5968AAA8;
 Fri, 31 May 2019 13:47:03 +0000 (UTC)
Date: Fri, 31 May 2019 15:47:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Yi, Ammy" <ammy.yi@intel.com>
Message-ID: <20190531134702.GC12608@rei.lan>
References: <20190524020123.7623-1-ammy.yi@intel.com>
 <20190529143831.GA4610@rei.lan>
 <6A26F11783B7464A9CE09DB41C14533C5EDE1B8B@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6A26F11783B7464A9CE09DB41C14533C5EDE1B8B@SHSMSX101.ccr.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 ltp] Add 4 more cases for Intel PT.
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

SGkhCj4gPiArCWlmIChmbGFnID09IDEpIHsKPiA+ICsJCXRzdF9yZXMoVElORk8sICJtZW1vcnkg
d2lsbCBiZSByL3cgZm9yIGZ1bGwgdHJhY2UgbW9kZSEiKTsKPiA+ICsJCXByb19mbGFnID0gUFJP
VF9SRUFEIHwgUFJPVF9XUklURTsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCXRzdF9yZXMoVElORk8s
ICJtZW1vcnkgd2lsbCBiZSByIG9ubHkgZm9yIHNuYXBzaG90IG1vZGUhIik7Cj4gPiArCQlwcm9f
ZmxhZyA9IFBST1RfUkVBRDsKPiA+ICsJfQo+ID4gKwlidWZfZXZbMF0gPSBTQUZFX01NQVAoZmRl
LCBJTlRFTF9QVF9NRU1TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gCQkJICAgICAgIFRoaXMgc2hvdWxkIGJlIE5VTEwsIHJp
Z2h0Pwo+IFtBbW15XSBEbyB5b3UgbWVhbiB0aXMgd2lsbCBnZXQgTlVMTD8gTm8sIFNBRkVfTU1B
UCBzaG91bGQgYmUgc3VjY2Vzc2Z1bGx5IGhlcmUuCgpOb3QgYXQgYWxsLiBZb3UgYXJlIHBhc3Np
bmcgZmlsZSBkZXNjcmlwdG9yIGFzIGFkZHIgcGFyYW1ldGVyIHRvIG1tYXAoKQp3aGljaCBpcyB3
cm9uZyBhbmQgdGhlIG1tYXAoKSBjYWxsIG9ubHkgcGFzc2VzIGJlY2F1c2UgdGhlIGFkZHJlc3MK
cGFyYW1ldGVycyBpcyBpZ25vcmVkIHVubGVzcyB3ZSBwYXNzIE1BUF9GSVhFRC4KCj4gPiArCWlm
IChzdHJfYnJhbmNoX2ZsYWcpIHsKPiA+ICsJCXRzdF9yZXMoVElORk8sICJJbnRlbCBQVCB3aWxs
IGRpc2FibGUgYnJhbmNoIHRyYWNlLiIpOwo+ID4gKwkJYXR0ci5jb25maWcgfD0gMTsKPiA+ICsJ
fQo+ID4gKwo+ID4gKwlhdHRyLmV4Y2x1ZGVfa2VybmVsCT0gMDsKPiA+ICsJYXR0ci5leGNsdWRl
X3VzZXIJPSAwOwo+ID4gKwo+ID4gKwlpZiAoc3RyX2V4Y2x1ZGVfaW5mbyAmJiBzdHJjbXAoc3Ry
X2V4Y2x1ZGVfaW5mbywgInVzZXIiKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+IAkJCQlTaG91bGQgYmUgIXN0cmNtcCgpIGFzIHRoZSBmdW5jdGlvbgo+IAkJCQlyZXR1
cm5zIDAgb24gbWF0Y2gKPiBbQW1teV0gVGhpcyBpcyBhIGxpdHRsZSB0cmlja3kgaGVyZSwgaWYg
PSB1c2VyLCBtZWFucyBleGNsdWRlIHVzZXIsIHRoZW4gYXR0ci5leGNsdWRlX3VzZXIgPSAxLiBI
ZXJlIGlzIHJpZ2h0LiBJZiBub3QgbWF0Y2ggd2l0aCB1c2VyLCBpdCBtZWFucyBub3QgZXhjbHVk
ZSB1c2VyLCBpdCBuZWVkIGV4Y2x1ZGUga2VybmVsIHRyYWNlLCB0aGVuIGF0dHIuZXhjbHVkZV9r
ZXJuZWwgPSAxOwo+IEZyb20gZm9sbG93aW5nIGV4ZWN1dGlvbiBsb2csIHdlIGNhbiBzZWUgY2Fz
ZSBuYW1lIGlzICIgcHRfZXhfdXNlciAiIGZvciBleGNsdWRlIHVzZXIgdGVzdCwgdGhlbiAiIElu
dGVsIFBUIHdpbGwgZXhjbHVkZSB1c2VyIHRyYWNlICIgaW4gbG9nLCB0aGV5IGFyZSBtYXRjaGVk
LgoKV2VsbCBhcyBpdCBpcyB0aGlzIHdpbGwgYWxzbyB3b3JrIGlmIHdlIHBhc3MgZ2FyYmFnZSB0
byB0aGUgLWUKcGFyYW1ldGVyIGl0IHdpbGwgc2V0IGJvdGggZXhjbHVkZV9rZXJuZWwgYW5kIGV4
Y2x1ZGVfdXNlciBwYXJhbXRlcnMuCgpXaHkgaXNuJ3QgdGhpcyBzaW1wbHk6CgoJaWYgKHN0cl9l
eGNsdWRlKSB7CgkJaWYgKCFzdHJjbXAoc3RyX2V4Y2x1ZGUsICJ1c2VyIikpIHsKCQkJdHN0X3Jl
cyhUSU5GTywgIkV4Y2x1ZGluZyB1c2VyIHRyYWNlIik7CgkJCWF0dHIuZXhjbHVkZV91c2VyID0g
MTsKCQl9IGVsc2UgaWYgKCFzdHJjbXAoc3RyX2V4Y2x1ZGUsICJrZXJuZWwiKSkgewoJCQl0c3Rf
cmVzKFRJTkZPLCAiRXhjbHVkaW5nIGtlcm5lbCB0cmFjZSIpOwoJCQlhdHRyLmV4Y2x1ZGVfa2Vy
bmVsID0gMTsKCQl9IGVsc2UgewoJCQl0c3RfYnJrKFRCUk9LLCAiSW52YWxpZCAtZSAnJXMnIiwg
c3RyX2V4Y2x1ZGUpOwoJCX0KCX0KCj4gPiArCQl0c3RfcmVzKFRJTkZPLCAiSW50ZWwgUFQgd2ls
bCBleGNsdWRlIGtlcm5lbCB0cmFjZS4iKTsKPiA+ICsJCWF0dHIuZXhjbHVkZV9rZXJuZWwgPSAx
Owo+ID4gKwl9Cj4gPiArCWlmIChzdHJfZXhjbHVkZV9pbmZvICYmIHN0cmNtcChzdHJfZXhjbHVk
ZV9pbmZvLCAia2VybmVsIikpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiAJCQkJSGVyZSBhcyB3ZWxsLgo+IFtBbW15XSBTYW1lIGFzIGFib3ZlLgo+ID4gKwkJdHN0X3Jl
cyhUSU5GTywgIkludGVsIFBUIHdpbGwgZXhjbHVkZSB1c2VyIHRyYWNlLiIpOwo+ID4gKwkJYXR0
ci5leGNsdWRlX3VzZXIgPSAxOwo+ID4gKwl9Cj4gPiAgCj4gPiAgCS8qIG9ubHkgZ2V0IHRyYWNl
IGZvciBvd24gcGlkICovCj4gPiAgCWZkZSA9IHRzdF9zeXNjYWxsKF9fTlJfcGVyZl9ldmVudF9v
cGVuLCAmYXR0ciwgMCwgLTEsIC0xLCAwKTsKPiA+ICAJaWYgKGZkZSA8IDApIHsKPiA+IC0JCXRz
dF9yZXMoVElORk8sICJPcGVuIEludGVsIFBUIGV2ZW50IGZhaWxlZCEiKTsKPiA+IC0JCXRzdF9y
ZXMoVEZBSUwsICJwZXJmIHRyYWNlIGZ1bGwgbW9kZSBpcyBmYWlsZWQhIik7Cj4gPiArCQl0c3Rf
cmVzKFRJTkZPLCAiT3BlbiBJbnRlbCBQVCBldmVudCBmYWlsZWQuIik7Cj4gPiArCQl0c3RfcmVz
KFRGQUlMLCAicGVyZiB0cmFjZSBmdWxsIG1vZGUgaXMgZmFpbGVkLiIpOwo+ID4gIAkJcmV0dXJu
Owo+ID4gIAl9Cj4gPiAgCWJ1Zm0gPSBOVUxMOwo+ID4gLQlidWZtID0gY3JlYXRlX21hcChmZGUs
IGJ1aHN6KTsKPiA+ICsJaWYgKHN0cl9tb2RlKQo+ID4gKwkJbW9kZSA9IDA7Cj4gPiAgCj4gPiAr
CWJ1Zm0gPSBjcmVhdGVfbWFwKGZkZSwgYnVoc3osIG1vZGUpOwo+ID4gIH0KPiA+ICAKPiA+ICBz
dGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCj4gPiBAQCAtMTU0LDggKzE4MywxNyBAQCBzdGF0aWMg
dm9pZCBjbGVhbnVwKHZvaWQpCj4gPiAgCWRlbF9tYXAoYnVmbSwgYnVoc3opOwo+ID4gIH0KPiA+
ICAKPiA+ICtzdGF0aWMgc3RydWN0IHRzdF9vcHRpb24gb3B0aW9uc1tdID0gewo+ID4gKwl7Im0i
LCAmc3RyX21vZGUsICItbSBkaWZmZXJlbnQgbW9kZSwgZGVmYXVsdCBpcyBmdWxsIG1vZGUifSwK
PiA+ICsJeyJlOiIsICZzdHJfZXhjbHVkZV9pbmZvLCAiLWUgZXhjbHVkZSBpbmZvLCB1c2VyIG9y
IGtlcm5lbCJ9LAo+ID4gKwl7ImIiLCAmc3RyX2JyYW5jaF9mbGFnLCAiLWIgaWYgZGlzYWJsZSBi
cmFuY2ggdHJhY2UifSwKPiA+ICsJe05VTEwsIE5VTEwsIE5VTEx9Cj4gPiArfTsKPiA+ICsKPiA+
ICsKPiA+ICBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gPiAtCS50ZXN0X2FsbCA9
IGludGVsX3B0X2Z1bGxfdHJhY2VfY2hlY2ssCj4gPiArCS50ZXN0X2FsbCA9IGludGVsX3B0X3Ry
YWNlX2NoZWNrLAo+ID4gKwkub3B0aW9ucyA9IG9wdGlvbnMsCj4gPiAgCS5taW5fa3ZlciA9ICI0
LjEiLAo+ID4gIAkuc2V0dXAgPSBzZXR1cCwKPiA+ICAJLmNsZWFudXAgPSBjbGVhbnVwLAo+ID4g
LS0gCj4gPiAyLjE0LjEKPiA+IAo+ID4gCj4gPiAtLSAKPiA+IE1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+IAo+IC0tIAo+IEN5cmlsIEhydWJp
cwo+IGNocnViaXNAc3VzZS5jegoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
