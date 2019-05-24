Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C652901B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 06:32:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D9BD3EA5F8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 06:32:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6CAEF3EA5E2
 for <ltp@lists.linux.it>; Fri, 24 May 2019 06:32:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CD9B01417245
 for <ltp@lists.linux.it>; Fri, 24 May 2019 06:32:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E8F7308FBA9;
 Fri, 24 May 2019 04:32:03 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93AEC19C4F;
 Fri, 24 May 2019 04:32:02 +0000 (UTC)
Date: Fri, 24 May 2019 12:32:01 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515133102.GA5429@dell5510>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 24 May 2019 04:32:03 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDM6MzE6MDJQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90
ZToKPiBIaSBNdXJwaHksCj4gCj4gPiBUbyBjcmVhdGUgb3ZlcmxheWZzIGRpcnMsIGFuZCBtb3Vu
dCBvdmVybGF5ZnMgaWYgbmVlZGVkLgo+IAo+IC4uLgo+ID4gK2ludCBzZXR1cF9vdmVybGF5KGlu
dCBtb3VudG92bCkKPiA+ICt7Cj4gPiArCWludCByZXQ7Cj4gPiArCj4gPiArCS8qIFNldHVwIGFu
IG92ZXJsYXkgbW91bnQgd2l0aCBsb3dlciBkaXIgYW5kIGZpbGUgKi8KPiA+ICsJU0FGRV9NS0RJ
UihPVkxfTE9XRVIsIDA3NTUpOwo+ID4gKwlTQUZFX01LRElSKE9WTF9VUFBFUiwgMDc1NSk7Cj4g
PiArCVNBRkVfTUtESVIoT1ZMX1dPUkssIDA3NTUpOwo+ID4gKwlTQUZFX01LRElSKE9WTF9NTlQs
IDA3NTUpOwo+ID4gKwo+ID4gKwkvKiBPbmx5IGNyZWF0ZSBkaXJzLCBkbyBub3QgbW91bnQgKi8K
PiA+ICsJaWYgKG1vdW50b3ZsID09IDApCj4gPiArCQlyZXR1cm4gMDsKPiBJbnN0ZWFkIG9mIGhh
dmluZyBpbnQgcGFyYW1ldGVyLCB0aGVyZSBjb3VsZCBiZSBjcmVhdGVfb3ZlcmxheV9kaXJzKCkK
PiBhbmQgbW91bnRfb3ZlcmxheSgpLCB3aGljaCB3b3VsZCBjYWxsIGNyZWF0ZV9vdmVybGF5X2Rp
cnMoKS4KPiAobm8gbmVlZCB0byBsb29rdXAgbWVhbmluZyBvZiBwYXJhbWV0ZXIpLgo+IAo+ID4g
Kwo+ID4gKwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVybGF5IiwgMCwgImxv
d2VyZGlyPSJPVkxfTE9XRVIKPiA+ICsJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIiLHdvcmtk
aXI9Ik9WTF9XT1JLKTsKPiA+ICsJaWYgKHJldCA8IDApIHsKPiA+ICsJCWlmIChlcnJubyA9PSBF
Tk9ERVYpIHsKPiA+ICsJCQl0c3RfcmVzKFRJTkZPLAo+ID4gKwkJCQkib3ZlcmxheWZzIGlzIG5v
dCBjb25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+ID4gKwkJCXJldHVybiAxOwo+IEZpcnN0
IEkgdGhvdWdodCB3ZSdkIGltcGxlbWVudCBpdCBhcyBhIHRlc3QgZmxhZyAobWVtYmVyIG9mIHN0
cnVjdCB0c3RfdGVzdCkuCj4gV2hlbiB3ZSBoYXZlIGl0IGFzIHNlcGFyYXRlIGZ1bmN0aW9uIEkg
d29uZGVyIHdoZXRoZXIgd2UgY291bGQgVENPTkYgb24gRU5PREVWCj4gaW5zdGVhZCBvZiBUSU5G
TyBhbmQgcmV0dXJuLiBNYXliZSB0aGVyZSBjb3VsZCBiZSBoZXJlIGZvciBpbnQgc3RyaWN0IHBh
cmFtZXRlciwKClRoZSByZXR1cm4gdmFsdWUgaXMgcmVmZXJlbmNlZCBpbiB0aGUgdGVzdGNhc2Ug
dG8gZGV0ZXJtaW5lIHdoZXRoZXIgdG8gcnVuCnRlc3RzIGluIG92ZXJsYXlmcy4gSXQncyBuZWVk
ZWQuCgpJZiB0aGlzIHN0cmljdCBwYXJhbWV0ZXIgaXMgb25seSBmb3IgZGlmZmVyZW50IHdvcmRp
bmcgb24gTk9ERVYuIElzIGl0Cm5lY2Vzc2FyeSA/CgpNdXJwaHkKCj4gd2hlcmUgMSB3b3VsZCBi
ZSBmb3JjZSBzYWZlIChpLmUuIFRDT05GKSwgb3RoZXJ3aXNlIG9ubHkgVElORk8uCj4gVGhpcyBj
b3VsZCBhbHNvIHRvIGhhdmUgU0FGRV9NT1VOVF9PVkVSTEFZKCkgbWFjcm8gd2hpY2ggd291bGQg
dXNlIG1vdW50X292ZXJsYXkoKS4KPiBTaW1pbGFyIGFwcHJvYWNoIGFzIFNBRkVfU0VORCgpIGFu
ZCBzYWZlX3NlbmQoKS4KPiAKPiA+ICsJCX0KPiA+ICsJCXRzdF9icmsoVEJST0sgfCBURVJSTk8s
ICJvdmVybGF5ZnMgbW91bnQgZmFpbGVkIik7Cj4gPiArCX0KPiA+ICsJcmV0dXJuIDA7Cj4gPiAr
fQo+IAo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
