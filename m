Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A0109E32
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:42:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5EA8F3C2092
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:42:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3B2EB3C1C71
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:42:46 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 176E91401737
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:42:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A14CB39E;
 Tue, 26 Nov 2019 12:42:45 +0000 (UTC)
Date: Tue, 26 Nov 2019 13:42:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20191126124243.GA10841@dell5510>
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
 <CAEemH2f=_oGD8Zo=EDE6D096EEP=jCjzEUPOszJ7W7j8vbV7XA@mail.gmail.com>
 <87zhgjc4ie.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhgjc4ie.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] Wrapper for Syzkaller
 reproducers
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
Cc: syzkaller <syzkaller@googlegroups.com>, LTP List <ltp@lists.linux.it>,
 automated-testing@yoctoproject.org, Richard Palethorpe <rpalethorpe@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+ID4+ICtBQ19BUkdfV0lUSChbc3l6a2FsbGVyLXJlcHJvc10sCj4gPj4gKyAgW0FDX0hF
TFBfU1RSSU5HKFstLXdpdGgtc3l6a2FsbGVyLXJlcHJvc10sCj4gPj4gKyAgICBbY29tcGlsZSBh
bmQgaW5zdGFsbCBTeXprYWxsZXIgcmVwcm9kdWNlcnMgKGRlZmF1bHQ9bm8pXSldLAo+ID4+ICsg
IFt3aXRoX3N5emthbGxlcl9yZXByb3M9JHdpdGh2YWxdCgoKPiA+IFRvIHN0cmljdGx5LCB0aGUg
W2FjdGlvbi1pZi1ub3QtZ2l2ZW5dIHNob3VsZCBiZSBhZGRlZCB0b28/Cgo+IFdlcmUgdGhlIG90
aGVyICd3aXRoJyBvcHRpb25zIHVwZGF0ZWQgcmVjZW50bHkgdG8gaGF2ZSB0aGF0PyBJIGp1c3QK
PiBjb3BpZWQgdGhpcyBmcm9tIHRoZSBvdGhlciBvcHRpb25zLgpZZXAsIHlvdSdsbCBqdXN0IGFk
ZApbd2l0aF9zeXprYWxsZXJfcmVwcm9zPW5vXQoobG9va2luZyBhdCB0aGUgZGVmYXVsdCBvZmYs
IHByb2JhYmx5IHNhZmVyIGZvciB0aGUgc3RhcnQpCgo+ID4+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9NYWtlZmlsZQo+ID4+IGluZGV4
IDMzMTliMzE2My4uMDE1MGNmYjRmIDEwMDY0NAo+ID4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
TWFrZWZpbGUKPiA+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL01ha2VmaWxlCj4gPj4gQEAgLTUz
LDYgKzUzLDcgQEAgU1VCRElSUyAgICAgICAgICAgICAgICAgICAgICAgKz0gY29ubmVjdG9ycyBc
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NoZWQgXAo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNlY3VyaXR5IFwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzb3VuZCBcCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3l6a2FsbGVyLXJlcHJv
cyBcCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJhY2luZyBcCj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWV2ZW50cyBcCgo+ID4+ICsjIFNvbWUgdXNlZnVsIGNvbXBp
bGVyIGZsYWdzIGZvciB0aGUgTFRQIHdpbGwgY2F1c2UgcHJvYmxlbXMgd2l0aCB0aGUKPiA+PiAr
IyBzeXprYWxsZXIgcmVwcm9zIHNvIHRoZSByZXByb3MgaGF2ZSBzZXBlcmF0ZSBmbGFncwo+ID4+
ICtTWVpLQUxMRVJfQ0ZMQUdTID89IC1wdGhyZWFkCj4gPj4gK1NZWktBTExFUl9SRVBST1MgPSAk
KHN1YnN0Cj4gPj4gJChhYnNfdG9wX3NyY2RpciksJChhYnNfdG9wX2J1aWxkZGlyKSwkKFNZWktB
TExFUl9SRVBST1NfU1JDUzouYz0pKQo+ID4+ICskKFNZWktBTExFUl9SRVBST1MpOiAlOiAlLmMK
PiA+PiArICAgICAgIC1AaWYgZ3JlcCAtcSAiX19OUl9tbWFwMiIgJF47IHRoZW4gXAo+ID4+ICsg
ICAgICAgICAgICAgICBNMzI9Ii1tMzIiOyBcCgoKPiA+IEkgZ290IGNvbXBpbGluZyBlcnJvcnMg
b24gczM5MHg6Cj4gPiAgIGdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0
aW9uIOKAmC1tMzLigJk7IGRpZCB5b3UgbWVhbgo+ID4g4oCYLW0zMeKAmT8KCj4gSSBoYXZlIG9u
bHkgdHJpZWQgdGhlc2Ugb24geDg2XzY0IHNvIGZhciBhbmQgSSB0aGluayB0aGF0IGlzIGFsbCB3
ZSBjYW4KPiBzdXBwb3J0IHRvIGJlZ2luIHdpdGguCgpNYXliZSBmaWx0ZXIgaXQgb3V0IGluIHRl
c3RjYXNlcy9rZXJuZWwvTWFrZWZpbGUgd2l0aCBzb21ldGhpbmcgbGlrZSB0aGlzOgppZm5lcSAo
LCQoZmlsdGVyICQoSE9TVF9DUFUpLHg4NiB4ODZfNjQpKQpGSUxURVJfT1VUX0RJUlMgKz0gc3l6
a2FsbGVyLXJlcHJvcwplbmRpZgoKPiA+IE15IG90aGVyIGNvbmNlcm4gaXMgc3l6a2FsbGVyIChJ
IGd1ZXNzIG1heWJlKSBoYXZlIHNvbWUgcGFja2FnZQo+ID4gZGVwZW5kZW5jaWVzLCBhbmQgdGhh
dCB3aWxsIGJyZWFrIHRoZSBjb21waWxlciBwaGFzZSBvbiB0aGUgZW1iZWRkZWQKPiA+IHN5c3Rl
bS4KCj4gVGhpcyBpcyB0cnVlLCB0aGUgcmVwcm9kdWNlcnMgZG8gaGF2ZSBkZXBlbmRlbmNpZXMg
YW5kIGl0IHNlZW1zIHRvIHZhcnkKPiAocmFuZG9tbHkgdmlldyBzb21lIG9mIHRoZSBDIGZpbGVz
KS4gSG93ZXZlciB0aGlzIGlzIG9uZSBvZiB0aGUgcmVhc29ucwo+IHdoeSB0aGV5IGFyZSBvbmx5
IGluc3RhbGxlZCBpZiAtLXdpdGgtc3l6a2FsbGVyLXJlcHJvcyBpcyBzZXQuCk1heWJlIGxhdGVy
IHdlIG1hbmFnZSB0byBnZW5lcmF0ZSBhdXRvdG9vbHMgY29uZmlnIGJhc2VkIG9uIHBrZy1jb25m
aWcuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
