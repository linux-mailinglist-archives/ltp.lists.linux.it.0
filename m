Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4A2B946F
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 15:23:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAEFA3C5F71
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 15:23:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D89EA3C2F94
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 15:23:03 +0100 (CET)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 253D1200C14
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 15:23:02 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B56A41C0002;
 Thu, 19 Nov 2020 14:23:01 +0000 (UTC)
Date: Thu, 19 Nov 2020 15:23:00 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Petr Vorel <petr.vorel@suse.com>
Message-ID: <20201119152300.05ef03b0@kmaincent-XPS-13-7390>
In-Reply-To: <20201112173609.4123-1-petr.vorel@suse.com>
References: <20201112173609.4123-1-petr.vorel@suse.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/traceroute01: Check also -T flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gUGV0ciwKCkp1c3QgZmluZCBvdXQgeW91IGRpZG4ndCBtZXJnZSB5b3VyIHBhdGNoIHdo
aWNoIG1ha2VzIHRoZSBjb2RlIGNsZWFuZXIuIDopCgpSZWdhcmRzLAoKCk9uIFRodSwgMTIgTm92
IDIwMjAgMTg6MzY6MDkgKzAxMDAKUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBzdXNlLmNvbT4gd3Jv
dGU6Cgo+IEZyb206IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IAo+IGFuZCBtb3ZlIGNo
ZWNrcyB0byBydW5fdHJhY2UoKQo+IAo+IFRoZXJlIGFyZSAzIHRyYWNlcm91dGUgdmVyc2lvbnM6
Cj4gCj4gKiBEbWl0cnkgQnV0c2tveSAoaHR0cDovL3RyYWNlcm91dGUuc291cmNlZm9yZ2UubmV0
LykKPiAqIGJ1c3lib3gKPiAqIGlwdXRpbHMgKG9ubHkgdHJhY2VwYXRoNjsgZGVwcmVjYXRlZCwg
YnV0IHN0aWxsIHVzZWQgKGUuZy4gT3BlbldydCBQcm9qZWN0KQo+IAo+IC1JIGlzIHN1cHBvcnRl
ZCBieSBEbWl0cnkgQnV0c2tveSdzIGFuZCBidXN5Ym94IGltcGxlbWVudGF0aW9uCj4gLVQgaXMg
c3VwcG9ydGVkIG9ubHkgYnkgRG1pdHJ5IEJ1dHNrb3kncyBpbXBsZW1lbnRhdGlvbgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IC0tLQo+IEhpIEFsZXhl
eSwgS29yeSwKPiAKPiBmb2xsb3cgdXAgdG8gS29yeSdzIGZpeCAodGhlcmUgYXJlIHNvbWUgcHJv
YmxlbXMgd2l0aCBzdXNlLmN6Cj4gbWFpbHNlcnZlciwgdGh1cyBJIGhhdmVuJ3QgcmVwbHkgYWJv
dXQgcHVzaGluZyB5b3VyIHBhdGNoKS4KPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+ICB0
ZXN0Y2FzZXMvbmV0d29yay90cmFjZXJvdXRlL3RyYWNlcm91dGUwMS5zaCB8IDMwICsrKysrKysr
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL25ldHdvcmsvdHJhY2Vyb3V0ZS90
cmFjZXJvdXRlMDEuc2gKPiBiL3Rlc3RjYXNlcy9uZXR3b3JrL3RyYWNlcm91dGUvdHJhY2Vyb3V0
ZTAxLnNoIGluZGV4IDM4ZjRkM2I4NS4uOTAwMzBhZjM5Cj4gMTAwNzU1IC0tLSBhL3Rlc3RjYXNl
cy9uZXR3b3JrL3RyYWNlcm91dGUvdHJhY2Vyb3V0ZTAxLnNoCj4gKysrIGIvdGVzdGNhc2VzL25l
dHdvcmsvdHJhY2Vyb3V0ZS90cmFjZXJvdXRlMDEuc2gKPiBAQCAtMTMsOSArMTMsMTIgQEAgVFNU
X05FRURTX1RNUERJUj0xCj4gIAo+ICBzZXR1cCgpCj4gIHsKPiAtCXRzdF9yZXMgVElORk8gInRy
YWNlcm91dGUgdmVyc2lvbjoiCj4gLQl0c3RfcmVzIFRJTkZPICQodHJhY2Vyb3V0ZSAtLXZlcnNp
b24gMj4mMSkKPiAtCVsgIiRUU1RfSVBWNiIgXSAmJiB0c3RfcmVzIFRJTkZPICJOT1RFOiB0cmFj
ZXBhdGg2IGZyb20gaXB1dGlscyBpcwo+IG5vdCBzdXBwb3J0ZWQiICsKPiArCVRSQUNFUk9VVEU9
dHJhY2Vyb3V0ZSR7VFNUX0lQVjZ9Cj4gKwl0c3RfcmVxdWlyZV9jbWRzICRUUkFDRVJPVVRFCj4g
Kwo+ICsJdHN0X3JlcyBUSU5GTyAiJFRSQUNFUk9VVEUgdmVyc2lvbjoiCj4gKwl0c3RfcmVzIFRJ
TkZPICQoJFRSQUNFUk9VVEUgLS12ZXJzaW9uIDI+JjEpCj4gIH0KPiAgCj4gIHJ1bl90cmFjZSgp
Cj4gQEAgLTI0LDE4ICsyNywyMyBAQCBydW5fdHJhY2UoKQo+ICAJbG9jYWwgaXA9JCh0c3RfaXBh
ZGRyIHJob3N0KQo+ICAJbG9jYWwgcGF0dGVybj0iXlsgXSsxWyBdKyRpcChbIF0rWzAtOV0rWy5d
WzAtOV0rIG1zKXszfSIKPiAgCj4gKwlpZiAkVFJBQ0VST1VURSAkb3B0cyAyPiYxIHwgZ3JlcCAt
cSAiaW52YWxpZCBvcHRpb24iOyB0aGVuCj4gKwkJdHN0X3JlcyBUQ09ORiAiJG9wdHMgZmxhZyBu
b3Qgc3VwcG9ydGVkIgo+ICsJCXJldHVybgo+ICsJZmkKPiArCj4gIAkjIEFjY29yZGluZyB0byBt
YW4gcGFnZXMsIGRlZmF1bHQgc2l6ZXM6Cj4gIAlsb2NhbCBieXRlcz02MAo+ICAJWyAiJFRTVF9J
UFY2IiBdICYmIGJ5dGVzPTgwCj4gIAo+IC0JRVhQRUNUX1BBU1MgdHJhY2Vyb3V0ZSAkaXAgJGJ5
dGVzIC1uIC1tIDIgJG9wdHMgXD5vdXQubG9nIDI+JjEKPiArCUVYUEVDVF9QQVNTICRUUkFDRVJP
VVRFICRpcCAkYnl0ZXMgLW4gLW0gMiAkb3B0cyBcPm91dC5sb2cgMj4mMQo+ICAKPiAgCWdyZXAg
LXEgIiRieXRlcyBieXRlIiBvdXQubG9nCj4gIAlpZiBbICQ/IC1uZSAwIF07IHRoZW4KPiAgCQlj
YXQgb3V0LmxvZwo+ICAJCXRzdF9yZXMgVEZBSUwgIickYnl0ZXMgYnl0ZScgbm90IGZvdW5kIgo+
ICAJZWxzZQo+IC0JCXRzdF9yZXMgVFBBU1MgInRyYWNlcm91dGUgdXNlICRieXRlcyBieXRlcyIK
PiArCQl0c3RfcmVzIFRQQVNTICIkVFJBQ0VST1VURSB1c2UgJGJ5dGVzIGJ5dGVzIgo+ICAJZmkK
PiAgCj4gIAl0YWlsIC0xIG91dC5sb2cgfCBncmVwIC1xRSAiJHBhdHRlcm4iCj4gQEAgLTQzLDI0
ICs1MSwyMCBAQCBydW5fdHJhY2UoKQo+ICAJCWNhdCBvdXQubG9nCj4gIAkJdHN0X3JlcyBURkFJ
TCAicGF0dGVybiAnJHBhdHRlcm4nIG5vdCBmb3VuZCBpbiBsb2ciCj4gIAllbHNlCj4gLQkJdHN0
X3JlcyBUUEFTUyAidHJhY2Vyb3V0ZSB0ZXN0IGNvbXBsZXRlZCB3aXRoIDEgaG9wIgo+ICsJCXRz
dF9yZXMgVFBBU1MgIiRUUkFDRVJPVVRFIHRlc3QgY29tcGxldGVkIHdpdGggMSBob3AiCj4gIAlm
aQo+ICB9Cj4gIAo+ICB0ZXN0MSgpCj4gIHsKPiAtCXRzdF9yZXMgVElORk8gInJ1biB0cmFjZXJv
dXRlIHdpdGggSUNNUCBFQ0hPIgo+ICsJdHN0X3JlcyBUSU5GTyAicnVuICRUUkFDRVJPVVRFIHdp
dGggSUNNUCBFQ0hPIgo+ICAJcnVuX3RyYWNlIC1JCj4gIH0KPiAgCj4gIHRlc3QyKCkKPiAgewo+
IC0JdHN0X3JlcyBUSU5GTyAicnVuIHRyYWNlcm91dGUgd2l0aCBUQ1AgU1lOIgo+IC0JaWYgdHJh
Y2Vyb3V0ZSAtVCAyPiYxIHwgZ3JlcCAtcSAiaW52YWxpZCBvcHRpb24iOyB0aGVuCj4gLQkJdHN0
X3JlcyBUQ09ORiAiLVQgZmxhZyAoVENQIFNZTikgbm90IHN1cHBvcnRlZCIKPiAtCWVsc2UKPiAt
CQlydW5fdHJhY2UgLVQKPiAtCWZpCj4gKwl0c3RfcmVzIFRJTkZPICJydW4gJFRSQUNFUk9VVEUg
d2l0aCBUQ1AgU1lOIgo+ICsJcnVuX3RyYWNlIC1UCj4gIH0KPiAgCj4gIHRzdF9ydW4KCgoKLS0g
CkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
