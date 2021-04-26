Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1236B65E
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 18:01:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0573B3C673D
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 18:01:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F22B3C5E5D
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:01:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC6C7200069
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:01:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45E79AC5B;
 Mon, 26 Apr 2021 16:01:54 +0000 (UTC)
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-4-rpalethorpe@suse.com>
 <CAEemH2fmw0_HuetkiFTnyQGsa0HiD3vsUH-oD9XTTMsynOzn+g@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2fmw0_HuetkiFTnyQGsa0HiD3vsUH-oD9XTTMsynOzn+g@mail.gmail.com>
Date: Mon, 26 Apr 2021 17:01:53 +0100
Message-ID: <87lf95m3v2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/7] Add new CGroups APIs
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPiAgSGkgUmljaGFy
ZCwKPgo+IFRoYW5rcyBmb3IgeW91ciB3b3JrLCB0aGUgd2hvbGUgZGVzaWduIGxvb2tzIGdvb2Qu
Cj4KPiBNaW5vciBzdWdnZXN0aW9ucyBhcyBiZWxvdzoKPgo+Cj4+ICtzdGF0aWMgY29uc3QgY2hh
ciAqbHRwX2Nncm91cF9kaXIgPSAibHRwIjsKPj4gK3N0YXRpYyBjb25zdCBjaGFyICpsdHBfY2dy
b3VwX2RyYWluX2RpciA9ICJkcmFpbiI7Cj4+ICtzdGF0aWMgY2hhciB0ZXN0X2Nncm91cF9kaXJb
UEFUSF9NQVgvNF07Cj4+ICtzdGF0aWMgY29uc3QgY2hhciAqbHRwX21vdW50X3ByZWZpeCA9ICIv
dG1wL2Nncm91cF8iOwo+PiArc3RhdGljIGNvbnN0IGNoYXIgKmx0cF92Ml9tb3VudCA9ICJ1bmlm
aWVkIjsKPj4gKwo+PiArI2RlZmluZSBmaXJzdF9yb290ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+ICsgICAgICAgKHJvb3RzWzBdLnZlciA/IHJvb3RzIDogcm9vdHMgKyAxKQo+PiAr
I2RlZmluZSBmb3JfZWFjaF9yb290KHIpICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAg
ICAgZm9yICgocikgPSBmaXJzdF9yb290OyAociktPnZlcjsgKHIpKyspCj4+ICsjZGVmaW5lIGZv
cl9lYWNoX3YxX3Jvb3QocikgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICBmb3IgKChy
KSA9IHJvb3RzICsgMTsgKHIpLT52ZXI7IChyKSsrKQo+Pgo+Cj4gSWYgeW91IGdvIHRocm91Z2gg
dGhlIHdob2xlIGZpbGVzIHlvdSB3aWxsIGZpbmQsIHRoZXJlIGFyZSBzb21lIHBsYWNlcyB1c2UK
PiAncicgdG8gcmVwcmVzZW50IHRoZSByb290IGJ1dCBvdGhlciB1c2VzICd0JywgZXZlbiBpbiBm
dW5jdGlvbnMgdGhhdAo+IGluY2x1ZGUg4oCYdOKAmAo+IHRvIHJlcHJlc2VudCBhIHRyZWUuCj4K
PiBUaGF0IHByb2JhYmx5IGEgbWlub3IgaXNzdWUgdG8gbWFrZSBwZW9wbGUgZ2V0IGxvc3Q6KS4K
Pgo+IFNvIEknZCBzdWdnZXN0IGEgdW5pZmllZCBhYmJyZXZpYXRpb24gaW4gYWxsOgo+Cj4gciAg
LS0+IHJvb3QKPiB0ICAtLT4gdHJlZQo+Cj4gaWYgYSBmdW5jdGlvbiBoYXMgcm9vdCBhbmQgdHJl
ZSwgcGx6IGF2b2lkIHVzaW5nIGFiYnJldmlhdGlvbnMsIGp1c3QgdXNlCj4gaXRzZWxmLgoKWWVz
LCBJIHNob3VsZCBkbyBzb21ldGhpbmcgYWJvdXQgdGhpcyBuYW1pbmcuIEkgdGhpbmsgdGhpcyBp
cyByZWxhdGVkIHRvCm90aGVyIGlzc3VlcyBDeXJpbCBtZW50aW9uZWQgaW4gdGhlIG5hbWluZyBv
ZiB0cmVlIGl0ZW1zLgoKPgo+Cj4KPj4gKyNkZWZpbmUgZm9yX2VhY2hfY3NzKGNzcykgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiArICAgICAgIGZvciAoKGNzcykgPSBpdGVtcyArIDE7IChjc3Mp
LT5uYW1lOyAoY3NzKSsrKQo+PiArCj4+ICsvKiBDb250cm9sbGVyIGl0ZW1zIG1heSBvbmx5IGJl
IGluIGEgc2luZ2xlIHRyZWUuIFNvIHdoZW4gKHNzKSA+IDAKPj4gKyAqIHdlIG9ubHkgbG9vcCBv
bmNlLgo+PiArICovCj4+ICsjZGVmaW5lIGZvcl9lYWNoX3RyZWUoY2csIGNzcywgdCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICBmb3IgKCh0KSA9IChj
c3MpID8gKGNnKS0+dHJlZXNfYnlfY3NzICsgKGNzcykgOiAoY2cpLT50cmVlczsgICAgXAo+PiAr
ICAgICAgICAgICAgKih0KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+ICsgICAgICAgICAgICAodCkgPSAoY3NzKSA/IChjZyktPnRyZWVz
ICsgVFNUX0NHUk9VUF9NQVhfVFJFRVMgOiAodCkgKyAxKQo+PiArCj4+ICtzdGF0aWMgaW50IGhh
c19jc3ModWludDMyX3QgY3NzX2ZpZWxkLCBlbnVtIHRzdF9jZ3JvdXBfY3NzIHR5cGUpCj4+ICt7
Cj4+ICsgICAgICAgcmV0dXJuICEhKGNzc19maWVsZCAmICgxIDw8IHR5cGUpKTsKPj4gIH0KPj4K
Pj4KPgo+Cj4+ICtzdHJ1Y3QgdHN0X2Nncm91cCAqdHN0X2Nncm91cF9tayhjb25zdCBzdHJ1Y3Qg
dHN0X2Nncm91cCAqcGFyZW50LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpuYW1lKQo+PiAgewo+Pgo+Cj4gU2luY2Ugd2UgaGF2ZSBhbHJlYWR5IGdvdCB0
aGUgcGFyZW50IHRzdF9jZ3JvdXAsIGl0IG1lYW5zIHdlIGtub3cgd2hpY2gKPiBjb250cm9sbGVy
cy90eXBlIGhhcyBiZWVuIG1vdW50ZWQuCj4KPiBDYW4gd2UgYWRkIHRoZSByZXF1aXJlZCBjb250
cm9sbGVycyAoZS5nLiAiK21lbW9yeSIpICB0byBzdWJ0cmVlX2NvbnRyb2wKPiBhdXRvbWF0aWNh
bGx5IGF0IGhlcmUsIHJhdGhlciB0aGFuIGRvaW5nIGl0IG1hbnVhbGx5IGJlZm9yZSBjcmVhdGlu
Zwo+IGNoaWxkcmVuPwo+ICh0aGVuIHdlIGNhbiByZW1vdmUgdGhlIGxpbmUjMjd+MzAgaW4gdHN0
X2Nncm91cDAyLmMpCgpJdCBpcyBwb3NzaWJsZSBhbmQgbW9yZSBjb25zaXN0ZW50IHdpdGggVjEg
YmVoYXZpb3IuIEkgc3VwcG9zZSB1c2Vycwpjb3VsZCByZW1vdmUgY29udHJvbGxlcnMgYWdhaW4g
aWYgdGhleSB3YW50ZWQgdG8gdGVzdCBzb21lIFYyIHNwZWNpZmljCmNvbmZpZ3VyYXRpb24uCgpP
VE9IIHdlIGNvdWxkIGxlYXZlIHRoaXMgZm9yIGEgbGF0ZXIgcGF0Y2ggd2hlbiB3ZSBhY3R1YWxs
eSBoYXZlIHNvbWUKcmVhbCB0ZXN0cyBjb250YWluaW5nIGNoaWxkIGdyb3Vwcz8gSSdtIG5vdCBm
dWxseSBzdXJlIHdoYXQgdGhlIHJlc3VsdHMKb2YgZG9pbmcgdGhpcyBhcmUgYW5kIHdlIG1heSBq
dXN0IGhhdmUgdG8gcmV2ZXJzZSBpdC4KCi0tIApUaGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
