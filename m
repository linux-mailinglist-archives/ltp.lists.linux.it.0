Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB242CA38E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 14:18:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 377073C5924
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 14:18:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 970133C2BEC
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 14:18:54 +0100 (CET)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D073A200D13
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 14:18:53 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8084E60007;
 Tue,  1 Dec 2020 13:18:52 +0000 (UTC)
Date: Tue, 1 Dec 2020 14:18:50 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201201141850.3ff2eefb@kmaincent-XPS-13-7390>
In-Reply-To: <1fac3929-a7ce-e35f-0adb-914a74e38843@oracle.com>
References: <20201130160235.25105-1-kory.maincent@bootlin.com>
 <1fac3929-a7ce-e35f-0adb-914a74e38843@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/ip_tests: Return TCONF if ip command can not
 create dummy interface
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gQWxleGV5LAoKT24gVHVlLCAxIERlYyAyMDIwIDEzOjU0OjM3ICswMzAwCkFsZXhleSBL
b2RhbmV2IDxhbGV4ZXkua29kYW5ldkBvcmFjbGUuY29tPiB3cm90ZToKCj4gT24gMzAuMTEuMjAy
MCAxOTowMiwgS29yeSBNYWluY2VudCB3cm90ZToKPiA+IFRlc3QgaWYgdGhlIGR1bW15IGludGVy
ZmFjZSBjYW4gYmUgY3JlYXRlZCwgcmV0dXJuIFRDT05GIGlmIG5vdC4KPiA+IE1vdmUgaXA0X2Fk
ZHIgYmVmb3JlLCB0byBoYXZlIGl0IGRlZmluZWQgYW5kIGF2b2lkIGNsZWFudXAgZXJyb3IuCj4g
PiAgIAo+IAo+IFRoZXJlIGlzIFRTVF9ORUVEU19EUklWRVJTIGZvciBjaGVja2luZyBtaXNzaW5n
IG1vZHVsZXMsIHNvIGl0Cj4gc2hvdWxkIFRDT05GIGlmIHNvbWUgYXJlIG5vdCBmb3VuZC4KPiAK
PiBUU1RfTkVFRFNfRFJJVkVSUz0iZHVtbXkiCgpBaCB5ZXMgdGhhbmtzLgoKUmVnYXJkcywKCkvD
tnJ5Cgo+IAo+IAo+ID4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2Vu
dEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIHRlc3RjYXNlcy9uZXR3b3JrL2lwcm91dGUvaXBf
dGVzdHMuc2ggfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL25ldHdvcmsv
aXByb3V0ZS9pcF90ZXN0cy5zaAo+ID4gYi90ZXN0Y2FzZXMvbmV0d29yay9pcHJvdXRlL2lwX3Rl
c3RzLnNoIGluZGV4IDQxYzUxNTY5Ni4uMWYwYzQ2MzRkIDEwMDc1NQo+ID4gLS0tIGEvdGVzdGNh
c2VzL25ldHdvcmsvaXByb3V0ZS9pcF90ZXN0cy5zaAo+ID4gKysrIGIvdGVzdGNhc2VzL25ldHdv
cmsvaXByb3V0ZS9pcF90ZXN0cy5zaAo+ID4gQEAgLTIzLDExICsyMywxNCBAQCBpbml0KCkKPiA+
ICAJdHN0X3JlcyBUSU5GTyAiaW5pdGl0YWxpemluZyB0ZXN0cyIKPiA+ICAKPiA+ICAJaWZhY2U9
bHRwX2R1bW15Cj4gPiArCWlwNF9hZGRyPSR7SVBWNF9ORVQxNl9VTlVTRUR9LjYuNgo+ID4gIAls
c21vZCB8IGdyZXAgLXEgZHVtbXkgfHwgcm1fZHVtbXk9MQo+ID4gIAo+ID4gLQlST0QgaXAgbGkg
YWRkICRpZmFjZSB0eXBlIGR1bW15Cj4gPiArCWlmICEgaXAgbGkgYWRkICRpZmFjZSB0eXBlIGR1
bW15ID4vZGV2L251bGw7IHRoZW4KPiA+ICsJCXJtX2R1bW15PQo+ID4gKwkJdHN0X2JyayBUQ09O
RiAiTW9kdWxlICdkdW1teScgbm90IGZvdW5kIgo+ID4gKwlmaQo+ID4gIAo+ID4gLQlpcDRfYWRk
cj0ke0lQVjRfTkVUMTZfVU5VU0VEfS42LjYKPiA+ICAJUk9EIGlwIGEgYWRkICR7aXA0X2FkZHJ9
LzI0IGRldiAkaWZhY2UKPiA+ICAKPiA+ICAJY2F0ID4gdHN0X2lwMDIuZXhwIDw8LUVPRgo+ID4g
ICAKPiAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
