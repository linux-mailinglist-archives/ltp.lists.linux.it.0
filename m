Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB9440CC
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:10:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65CAE3EA7ED
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:10:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 84C103EA7A2
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:10:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DB0742013C2
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:10:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1F290AE36;
 Thu, 13 Jun 2019 16:10:46 +0000 (UTC)
Date: Thu, 13 Jun 2019 18:10:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190613161042.GA24675@dell5510>
References: <20190611193021.17651-1-pvorel@suse.cz>
 <20190611193021.17651-4-pvorel@suse.cz>
 <1560352011.4578.43.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560352011.4578.43.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3 3/4] ima/ima_measurements.sh: Require builtin
 IMA tcb policy
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

SGkgTWltaSwKCnRoYW5rcyBhIGxvdCBmb3IgeW91ciByZXZpZXcuCgo+IE9uIFR1ZSwgMjAxOS0w
Ni0xMSBhdCAyMTozMCArMDIwMCwgUGV0ciBWb3JlbCB3cm90ZToKPiA+IEFsdGhvdWdoIGN1c3Rv
bSBwb2xpY3kgd2hpY2ggY29udGFpbnMgdGNiIGNhbiBiZSBsb2FkZWQgdmlhIGRyYWN1dCwKCj4g
XndoaWNoIG1heSBjb250YWluIHRoZSBlcXVpdmFsZW50IG1lYXN1cmVtZW50IHRjYiBydWxlcwpJ
J20gZ29pbmcgdG8gYWRkcmVzcyB0aGlzIGluIHY0LgoKPiA+IHN5c3RlbWQgb3IgbGF0ZXIgbWFu
dWFsbHkgZnJvbSB1c2VyIHNwYWNlLCBkZXRlY3RpbmcgaXQgd291bGQgcmVxdWlyZQo+ID4gSU1B
X1JFQURfUE9MSUNZPXkuIEluIG9yZGVyIHRvIHNpbXBsaWZ5IHRoZSBjaGVjayBhbmQgYXZvaWQg
ZmFsc2UKPiA+IHBvc2l0aXZlcyBsZXRzIGlnbm9yZSB0aGlzIG9wdGlvbiBhbmQgcmVxdWlyZSBi
dWlsdGluIElNQSB0Y2IgcG9saWN5LgoKPiBUaGlzIHRlc3QgaXMgZm9yIGFkZGluZyBuZXcgbWVh
c3VyZW1lbnRzIHRvIHRoZSBtZWFzdXJlbWVudCBsaXN0LgpTdXJlLiBTbyB3aGF0IHNob3VsZCBJ
IGNoYW5nZSBpbiBjb21taXQgbWVzc2FnZT8KCgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3Jl
bCA8cHZvcmVsQHN1c2UuY3o+Cj4gPiAtLS0KPiA+ICAuLi4va2VybmVsL3NlY3VyaXR5L2ludGVn
cml0eS9pbWEvdGVzdHMvaW1hX21lYXN1cmVtZW50cy5zaCAgICB8IDMgKystCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKPiA+IGRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX21lYXN1
cmVtZW50cy5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0
cy9pbWFfbWVhc3VyZW1lbnRzLnNoCj4gPiBpbmRleCAzMjhhZmZjNDMuLmEzYWEyNGQ4YSAxMDA3
NTUKPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0
cy9pbWFfbWVhc3VyZW1lbnRzLnNoCj4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5
L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX21lYXN1cmVtZW50cy5zaAo+ID4gQEAgLTU3LDcgKzU3
LDggQEAgc2V0dXAoKQo+ID4gIAlbIC16ICIkRElHRVNUX0lOREVYIiBdICYmIHRzdF9icmsgVENP
TkYgXAo+ID4gIAkJIkNhbm5vdCBmaW5kIGRpZ2VzdCBpbmRleCAodGVtcGxhdGU6ICckdGVtcGxh
dGUnKSIKCj4gPiAtCXRzdF9yZXMgVElORk8gIklNQSBtZWFzdXJlbWVudCB0ZXN0cyBhc3N1bWUg
dGNiIHBvbGljeSB0byBiZSBsb2FkZWQgKGltYV9wb2xpY3k9dGNiKSIKPiA+ICsJZ3JlcCAtcSAt
ZSBpbWFfcG9saWN5PVthLXpfXSp0Y2IgLWUgaW1hX3RjYiAtZSBpbWFfYXBwcmFpc2VfdGNiIC9w
cm9jL2NtZGxpbmUgfHwgXAo+ID4gKwkJdHN0X2JyayBUQ09ORiAiSU1BIG1lYXN1cmVtZW50IHRl
c3RzIHJlcXVpcmUgYnVpbHRpbiBJTUEgdGNiIHBvbGljeSAoaW1hX3BvbGljeT10Y2Igb3IgaW1h
X3BvbGljeT1hcHByYWlzZV90Y2Iga2VybmVsIHBhcmFtZXRlcikiCj4gPiAgfQoKCj4gImFwcHJh
aXNlX3RjYiIgZG9lc24ndCBwcm92aWRlIHRoZSBuZWNlc3NhcnkgbWVhc3VyZW1lbnQgcnVsZXMu
Cj4gImltYV9wb2xpY3k9IiBpc24ndCBvcmRlciBzcGVjaWZpYy4gwqBUaGUgY2hlY2sgd291bGQg
YmUgZm9yICJ8dGNiIiwgInwKPiB0Y2IiLCAidGNifCIsICJ0Y2IgfCIsIG9yIGp1c3QgIj10Y2Ii
LiDCoFRoZSBkZXByZWNhdGVkICJpbWFfdGNiIgo+IG9wdGlvbiBpcyBmaW5lIHRvby4KR29pbmcg
dG8gY2hhbmdlIGluIHY0LgoKPiBNaW1pCgpLaW5kIHJlZ2FyZHMsClBldHIKCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
