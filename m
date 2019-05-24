Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5429914
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:36:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BCE63EA5FE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 570213EA166
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:36:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 44054616E0E
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:36:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AC1F3087950;
 Fri, 24 May 2019 13:36:17 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84ED260639;
 Fri, 24 May 2019 13:36:15 +0000 (UTC)
Date: Fri, 24 May 2019 21:36:13 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190524133613.vg73b3csqyamtau3@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
 <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
 <20190524085452.GB29592@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524085452.GB29592@dell5510>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 24 May 2019 13:36:17 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCk9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDEwOjU0OjUyQU0gKzAyMDAsIFBldHIg
Vm9yZWwgd3JvdGU6Cj4gSGkgTXVycGh5LAo+IAo+ID4gPiA+ICsJcmV0ID0gbW91bnQoIm92ZXJs
YXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsICJsb3dlcmRpcj0iT1ZMX0xPV0VSCj4gPiA+ID4g
KwkJICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+ID4gPiA+
ICsJaWYgKHJldCA8IDApIHsKPiA+ID4gPiArCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7Cj4gPiA+
ID4gKwkJCXRzdF9yZXMoVElORk8sCj4gPiA+ID4gKwkJCQkib3ZlcmxheWZzIGlzIG5vdCBjb25m
aWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+ID4gPiA+ICsJCQlyZXR1cm4gMTsKPiA+ID4gRmly
c3QgSSB0aG91Z2h0IHdlJ2QgaW1wbGVtZW50IGl0IGFzIGEgdGVzdCBmbGFnIChtZW1iZXIgb2Yg
c3RydWN0IHRzdF90ZXN0KS4KPiA+ID4gV2hlbiB3ZSBoYXZlIGl0IGFzIHNlcGFyYXRlIGZ1bmN0
aW9uIEkgd29uZGVyIHdoZXRoZXIgd2UgY291bGQgVENPTkYgb24gRU5PREVWCj4gPiA+IGluc3Rl
YWQgb2YgVElORk8gYW5kIHJldHVybi4gTWF5YmUgdGhlcmUgY291bGQgYmUgaGVyZSBmb3IgaW50
IHN0cmljdCBwYXJhbWV0ZXIsCj4gCj4gPiBUaGUgcmV0dXJuIHZhbHVlIGlzIHJlZmVyZW5jZWQg
aW4gdGhlIHRlc3RjYXNlIHRvIGRldGVybWluZSB3aGV0aGVyIHRvIHJ1bgo+ID4gdGVzdHMgaW4g
b3ZlcmxheWZzLiBJdCdzIG5lZWRlZC4KPiAKPiA+IElmIHRoaXMgc3RyaWN0IHBhcmFtZXRlciBp
cyBvbmx5IGZvciBkaWZmZXJlbnQgd29yZGluZyBvbiBOT0RFVi4gSXMgaXQKPiA+IG5lY2Vzc2Fy
eSA/Cj4gCj4gSSdsbCByZWNhcCBteSBzdWdnZXN0aW9uczoKPiAxKSBJIGxpa2UgaGF2aW5nIG1h
Y3JvcyB0byBoZWxwIHJlZHVjZSBzb21lIHBhcmFtZXRlcnMsIHRoaXMgZG9lcyBub3QgYmxvY2sK
PiBmdW5jdGlvbnMgYmVpbmcgZmxleGlibGUgKHdoaWNoIHJlcXVpcmVzIHBhcmFtZXRlcnMpLgo+
IDIpIEhhdmluZyBoZWxwZXIgZnVuY3Rpb24gY3JlYXRlX292ZXJsYXlfZGlycygpIHVzZWQgc2Vw
YXJhdGVseSwgdGhhbiBwYXJhbWV0ZXIKPiBpbiBzaW5nbGUgZnVuY3Rpb24gKEFtaXIgWzFdIHN1
Z2dlc3Rpb24gbWFrZXMgc2Vuc2UpLgo+IAo+IFNvbWV0aGluZyBsaWtlIHRoaXMsIGp1c3QgYSBz
dWdnZXN0aW9uOgo+IAo+IGludCBjcmVhdGVfb3ZlcmxheV9kaXJzKCkKPiB7Cj4gCVNBRkVfTUtE
SVIoT1ZMX0xPV0VSLCAwNzU1KTsKPiAJLi4uCj4gCXJldHVybiByZXQ7Cj4gfQo+IAo+IGludCBt
b3VudF9vdmVybGF5KGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sIGludCBzYWZl
KQo+IHsKPiAJLi4uCj4gCWlmIChjcmVhdGVfb3ZlcmxheV9kaXJzKCkpCj4gCQl0c3RfYnJrKFRD
T05GLCAiLi4uIik7Cj4gCj4gCXJldCA9IG1vdW50KCJvdmVybGF5IiwgT1ZMX01OVCwgIm92ZXJs
YXkiLCAwLCAibG93ZXJkaXI9Ik9WTF9MT1dFUgo+IAkJICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBF
UiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+IAlpZiAocmV0IDwgMCkgewo+IAkJaWYgKGVycm5vID09
IEVOT0RFVikgewo+IAkJCS8qCj4gCQkJICogVE9ETzogbWF5YmUgc2FmZSBpcyBjb25mdXNpbmcg
YXMgd2UgdXNlIHRzdF9icmsoVEJST0sgYW55d2F5KSwKPiAJCQkgKiArIHNvbWV0aW1lcyB0c3Rf
cmVzKFRDT05GLCAuLikgd291bGQgYmUgcHJlZmVycmVkIG92ZXIKPiAJCQkgKiB0c3RfYnJrKFRD
T05GLCAuLi4pCj4gCQkJICovCj4gCQkJaWYgKHNhZmUpCj4gCQkJCXRzdF9icmsoVENPTkYsCj4g
CQkJCQkib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+IAkJ
CX0gZWxzZSB7Cj4gCQkJCXRzdF9yZXMoVElORk8sCj4gCQkJCQkib3ZlcmxheWZzIGlzIG5vdCBj
b25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+IAkJCQlyZXR1cm4gMTsKPiAJCQl9Cj4gCQl9
Cj4gCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAib3ZlcmxheWZzIG1vdW50IGZhaWxlZCIpOwoK
SG1tLi4gVGhpcyB3b3VsZCBjaGFuZ2VkICJ0ZXN0IGxvZ2ljIiBpbiB0aGUgZXhpc3RpbmcgNCB0
ZXN0Y2FzZXMuCgpNdXJwaHkKPiAJfQo+IH0KPiAKPiAjZGVmaW5lIFNBRkVfTU9VTlRfT1ZFUkxB
WSgpIFwKPiAJbW91bnRfb3ZlcmxheShfX0ZJTEVfXywgX19MSU5FX18sIDEpOwo+IAo+ICNkZWZp
bmUgVFNUX01PVU5UX09WRVJMQVkoKSBcCj4gCW1vdW50X292ZXJsYXkoX19GSUxFX18sIF9fTElO
RV9fLCAwKTsKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+IFsxXSBodHRwOi8vbGlzdHMu
bGludXguaXQvcGlwZXJtYWlsL2x0cC8yMDE5LU1heS8wMTE5ODMuaHRtbAoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
