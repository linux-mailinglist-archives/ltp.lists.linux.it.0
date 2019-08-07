Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41B86419
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 16:13:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D449A3C1D7B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 16:13:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B2EF23C1D0B
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 12:15:54 +0200 (CEST)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1B258600C3F
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 12:15:55 +0200 (CEST)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1hvIyt-000559-Gj; Wed, 07 Aug 2019 12:15:43 +0200
Date: Wed, 7 Aug 2019 12:15:43 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <20190807101542.bshdy6bqxjkiaeou@linutronix.de>
References: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
 <20190717094614.GA9539@rei>
 <7d2c4936-2e89-6285-c856-a156d3a76284@windriver.com>
 <CAEemH2edg4R-JFM=u_ceLoRcNAMmV=c+hVV6kxoK4g6DOBnGeg@mail.gmail.com>
 <e7d0e66d-f348-9d57-0ea9-dc1fa289942d@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7d0e66d-f348-9d57-0ea9-dc1fa289942d@windriver.com>
User-Agent: NeoMutt/20180716
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 08 Aug 2019 16:13:22 +0200
Subject: Re: [LTP] Question about kernel/syscall/signal/signal06.c
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: x86-ml <x86@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SSBqdXN0IHdva2UgdXAgZnJvbSBoaWJlcm5hdGlvbiBhbmQgYXNzdW1lIHRoYXQgdGhpcyBoYXMg
bm90IGJlZW4KaGFuZGxlZCB5ZXQgc2/igKYKCk9uIDIwMTktMDctMjIgMDk6NTY6NTUgWyswODAw
XSwgSG9uZ3poaSwgU29uZyB3cm90ZToKPiAKPiBPbiA3LzE5LzE5IDQ6NDQgUE0sIExpIFdhbmcg
d3JvdGU6Cj4gPiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCA0OjE0IFBNIEhvbmd6aGksIFNvbmcK
PiA+IDxob25nemhpLnNvbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6Cj4gPiA+IFRoaXMgY2FzZSBm
YWlscyB3aGVuIGJvb3QgcWVtdXg4Ni02NCB3aXRoIDEvMiBjb3Jlcy4KPiA+ID4gCj4gPiA+IEkg
ZmluZCBba2VybmVsIDUuMi1yYzE6IDBkNzE0ZGJhMTYyXSBjYXVzZXMgdGhlIGZhaWx1cmUgYnkg
Z2l0IGJpc2VjdC4KPiAKPiBIaSBMaSxXYW5nCj4gCj4gCj4gU29ycnkgZm9yIG15IGEgYml0IG1p
c3Rha2UsIHRoZSBleGFjdCB0YWcgaXMgWzUuMS1yYzMgOiAwZDcxNGRiYTE2Ml0KPiAKPiBjb21t
aXQgMGQ3MTRkYmExNjI2MjBmZDhiOWY1YjMxMDRhNDg3ZTA0MTM1M2M0ZAo+IEF1dGhvcjogU2Vi
YXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPgo+IERhdGU6wqDC
oCBXZWQgQXByIDMgMTg6NDE6NDggMjAxOSArMDIwMAo+IAo+IMKgwqDCoCB4ODYvZnB1OiBVcGRh
dGUgeHN0YXRlJ3MgUEtSVSB2YWx1ZSBvbiB3cml0ZV9wa3J1KCkKPiAKPiDCoMKgwqAgRHVyaW5n
IHRoZSBjb250ZXh0IHN3aXRjaCB0aGUgeHN0YXRlIGlzIGxvYWRlZCB3aGljaCBhbHNvIGluY2x1
ZGVzIHRoZQo+IMKgwqDCoCBQS1JVIHZhbHVlLgo+IAo+IMKgwqDCoCBJZiB4c3RhdGUgaXMgcmVz
dG9yZWQgb24gcmV0dXJuIHRvIHVzZXJsYW5kIGl0IGlzIHJlcXVpcmVkCj4gwqDCoMKgIHRoYXQg
dGhlIFBLUlUgdmFsdWUgaW4geHN0YXRlIGlzIHRoZSBzYW1lIGFzIHRoZSBvbmUgaW4gdGhlIENQ
VS4KPiAKPiDCoMKgwqAgU2F2ZSB0aGUgUEtSVSBpbiB4c3RhdGUgZHVyaW5nIG1vZGlmaWNhdGlv
bi4KClNvIHRoaXMgY29tbWl0IGlzIGFib3V0IFBLUlUgaGFuZGxpbmcgYW5kIEkgbWlzcyBQS1Ug
Yml0cyBpbiB5b3VyIGxzY3B1Cm91dHB1dC4gU28gSSBhc3N1bWUgdGhpcyBjb21taXQgaXMgbm90
IHJlbGF0ZWQgYnV0IHRoZSBGUFUgcmV3b3JrIGluCmdlbmVyYWwuCgo+IDMuwqAgdW5hbWUgLXIK
PiAKPiByb290QHFlbXV4ODYtNjQ6fiMgdW5hbWUgLXIKPiA1LjEuMC1yYzMtTGludXgtc3RhbmRh
cmQKClRoaXMgaXMgaW5mb3JtYXRpb24gaXMgY29uZnVzaW5nLiBJIGNhbiByZXByb2R1Y2UgYSB0
ZXN0IGNhc2UgZmFpbHVyZSBpbgowZDcxNGRiYTE2MiBidXQgaXQgcGFzc2VzIHdpdGggbGF0ZXN0
IHN1cHBvcnRlZCBrZXJuZWwuClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIHByb2JsZW0gc3Rp
bGwgZXhpc3RzIHdpdGggNS4zLXJjMyBvciA1LjIuNy4gSQpjYW4ndCByZXByb2R1Y2UgaXQgb24g
YW55IG9mIHRob3NlIGtlcm5lbHMuCjUuMSBpcyBFT0wgYW5kIHRoZSBjb21taXQgaW4gcXVlc3Rp
b24gd2FzIG1lcmdlZCBpbnRvIDUuMi1yYzEuCgo+IFRoYW5rcy4KPiAKPiAtLUhvbmd6aGkKClNl
YmFzdGlhbgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
