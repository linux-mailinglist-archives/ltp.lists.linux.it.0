Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F93C160BEC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 08:51:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 672223C25AE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 08:51:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 671E23C2209
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 08:51:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 907FD200D38
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 08:51:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B5BBB12A;
 Mon, 17 Feb 2020 07:51:07 +0000 (UTC)
Date: Mon, 17 Feb 2020 08:51:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217075105.GA16499@dell5510>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
 <20200216131723.GA2725117@x230>
 <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IE9uIFN1biwgRmViIDE2LCAyMDIwIGF0IDk6MTcgUE0gUGV0ciBWb3JlbCA8cHZv
cmVsQHN1c2UuY3o+IHdyb3RlOgoKPiA+IC4uLgo+ID4gPiA+ICBpbmNsdWRlL2xhcGkvc3lzY2Fs
bHMvcG93ZXJwYzY0LmluICAgICAgICAgICAgfCAgNCArCj4gPiA+IElzIHRoZXJlIGFueSByZWFz
b24gd2h5IG9ubHkgYWRkIHN5c2NhbGwgbnVtIGZvciBwcGM2ND8KPiA+IFRoZSBvdGhlciBudW1i
ZXJzIGFyZSBhbHJlYWR5IHRoZXJlOgo+ID4gMDFlNGRjMjIyIGxhcGkvc3lzY2FsbHM6IEFkZCBN
SVBTIHN1cHBvcnQKPiA+IGMyZjI3ZjZlOSBBZGQgc3lzY2FsbCBudW1iZXJzIGZvciBuZXcgZmls
ZS1zeXN0ZW0gcmVsYXRlZCBzeXNjYWxscwoKPiBHb29kIHRvIGtub3cgdGhpcy4KCj4gPiBOb3Qg
c3VyZSBpZiB3ZSBzaG91bGQgYWRkIGEgbm90ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gcHJl
dmVudCBjb25mdXNpb24KPiA+IGxhdGVyIChwcm9iYWJseSBub3QgbmVlZGVkKS4KCgo+IE9yIGp1
c3QgbWVudGlvbmlvbiB0aGF0IGNvbW1pdChjMmYyN2Y2ZTkgQWRkIHN5c2NhbGwgbnVtYmVycyAu
Li4pIG1lc3NhZ2UuCgpJJ2xsIGFkZCBpdCAoSSdsbCBtZW50aW9uIGJvdGggY29tbWl0cykuCgo+
ID4gQlRXLCBJIGxpa2UgdGhlIHdheSBWaXJlc2ggS3VtYXIgZ2l2ZXMgaW4gaGlzIGZzbW91bnQu
aCwgaXQgbG9va3MgbW9yZQo+ID4gdGlkeQo+ID4gPiBhbmQgY2xlYW4uCj4gPiA+IGh0dHA6Ly9s
aXN0cy5saW51eC5pdC9waXBlcm1haWwvbHRwLzIwMjAtRmVicnVhcnkvMDE1NDEzLmh0bWwKPiA+
IEhtLCBjb21wZXRpbmcgaW1wbGVtZW50YXRpb25zLgo+ID4gQm90aCB0cmllcyB0byBoYW5kbGUg
cHJldmVudGluZyByZWRlZmluaXRpb25zIChlLmcuIEZTT1BFTl9DTE9FWEVDKSBvbmNlCj4gPiB0
aGUgQVBJIGhpdHMgbGliYyBoZWFkZXJzIChhdCBsZWFzdCBpbiBtdXNsIGl0IG1pZ2h0IGJlIHNv
b24pLgo+ID4gWm9ycm8gdHJpZXMgdG8gYmluZCB0aGVtIHRvIGZ1bmN0aW9uIGNoZWNrIChlLmcu
ICNpZm5kZWYgSEFWRV9GU01PVU5ULAo+ID4gI2lmbmRlZgo+ID4gSEFWRV9NT1ZFX01PVU5UKSwg
VmlyZXNoIGp1c3QgdXNlIHNpbmdsZSBjaGVjayAjaWZuZGVmIE9QRU5fVFJFRV9DTE9ORS4KPiA+
IEkgc2xpZ2h0bHkgcHJlZmVyIFZpcmVzaCB3YXkgKGl0J3MgdW5saWtlbHkgdGhhdCBsaWJjIGhl
YWRlcnMgd291bGQKPiA+IGluY2x1ZGUganVzdAoKPiArMSBWaXJlc2ggd2F5LgpJJ20gYWxzbyBm
b3IgbWVyZ2luZyAxc3QgY29tbWl0IGZyb20gVmlyZXNoJ3MgcGF0Y2hzZXQgYW5kIHRoYW4gWm9y
cm8ncwpmc21vdW50MDEgdGVzdCB3aXRoIGRyb3BwZWQgbGFwaSBjb21taXQuIEknbGwgc2VuZCBQ
UiBzbyBvdGhlcnMgY2FuIHNlZSB0aGUKZml4ZXMuCgo+ID4gcGFydCBvZiB0aGUgbmV3IG1vdW50
IEFQSSBkZWZpbml0aW9ucywgYWx0aG91Z2ggb2J2aW91c2x5IHRoZSBtb3N0IHNhZmVzdAo+ID4g
d2F5Cj4gPiB3b3VsZCBiZSB0byBlaXRoZXIgZ3VhcmQgd2l0aCAjaWZuZGVmIGVhY2ggZGVmaW5p
dGlvbiBvciBqdXN0IGdpdmUgdXAgb24KPiA+IHRlc3RpbmcKPiA+IGhlYWRlciBhbmQgY29weSB3
aG9sZSBpbmNsdWRlL3VhcGkvbGludXgvbW91bnQuaCAoKyBhdm9pZCB1c2luZwo+ID4gc3lzL21v
dW50Lmg7Cj4gPiB0aGF0J3MgdGhlIHdheSB1c2VkIGZvciBpbmNsdWRlL2xhcGkvYnBmLmgpLgoK
Cj4gQEN5cmlsLCBASmFuLCBhbnkgZWxzZSBzdWdnZXN0aW9uPwoKPiBCdHcsIHdlIGhhdmUgdG8g
aW5jbHVkZSAibGFwaS9mY250bC5oIiBpbiB0aGUgdGVzdCB0byBnZXQgcmlkIG9mIGJ1aWxkCj4g
ZXJyb3IgZnJvbSBvbGQoUkhFTDUuMTEpIGRpc3RybzoKVGhhbmtzIGZvciBub3RpZnlpbmcsIEkn
bGwgYWRkIGl0LiBCVFcgaXMgdGhlcmUgYSB3YXkgdG8gYWRkIHRoaXMgb2xkIFJIRUwgdG8KdHJh
dmlzPyBPciBpcyB0aGVyZSBhbnkgb2xkIEZlZG9yYSB2ZXJzaW9uIHdoaWNoIHdvdWxkIGltaXRh
dGUgdGhhdD8KT3IgSSBjYW4gdHJ5IHRvIHNlYXJjaCBhYm91dCBvbGQgU0xFUyAxMSAob3Igb2xk
IG9wZW5TVVNFIHZlcnNpb24gd2hpY2ggd291bGQKaW1pdGF0ZSB0aGF0KS4KCj4gZnNtb3VudDAx
LmM6NzE6IGVycm9yOiDigJhBVF9GRENXROKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKPiBmc21vdW50MDEuYzo3MTogZXJyb3I6IChFYWNoIHVuZGVjbGFyZWQgaWRl
bnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UKPiBmc21vdW50MDEuYzo3MTogZXJyb3I6IGZv
ciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4uKQoKS2luZCByZWdhcmRzLApQZXRyCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
