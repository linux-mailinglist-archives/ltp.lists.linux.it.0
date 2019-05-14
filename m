Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE41C8E8
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:38:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC5AD294AFE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 14:38:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 36DB8294AA9
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:38:25 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 86FA61400428
 for <ltp@lists.linux.it>; Tue, 14 May 2019 14:38:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7A5243082B40;
 Tue, 14 May 2019 12:38:22 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E92645C542;
 Tue, 14 May 2019 12:38:21 +0000 (UTC)
Date: Tue, 14 May 2019 20:38:20 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Steve French <smfrench@gmail.com>
Message-ID: <20190514123820.sh5l3rhyxaohmppn@XZHOUW.usersys.redhat.com>
References: <20190510043845.4977-1-xzhou@redhat.com>
 <20190513143413.GA4568@dell5510>
 <CAH2r5mvSS4crgid-srKr+hycN=uW-vPLGhF81RvA6UBP2T7K4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2r5mvSS4crgid-srKr+hycN=uW-vPLGhF81RvA6UBP2T7K4A@mail.gmail.com>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 14 May 2019 12:38:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: CIFS <linux-cifs@vger.kernel.org>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] safe_setuid: skip if testing on CIFS
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

SGkgUGV0ciBhbmQgU3RldmUsCgpUaGFua3MgZm9yIHJldmlld2luZyEgU3RldmUgeW91IGFyZSBy
aWdodCB0aGF0IHRoaXMgaXMgbW9yZSBhYm91dAptb2RlIGJpdHMgYW5kIG93bmVyc2hpcC4gR3Jl
YXQgdG8ga25vdyB0aGUgZGV2ZWxvcG1lbnQgd29yayBwcm9ncmVzcy4KTW9zdCBvZiB0aGUgdGVz
dHMgZmFpbCBhZnRlciBzZXR1aWQgYmVjYXVzZSBjaG1vZC9jaG93biBvcGVyYXRpb25zCmJlZm9y
ZSB0aGF0IGRvZXMgbm90IHRha2UgZWZmZWN0LCB3aGljaCBpcyBleHBlY3RlZCBub3cgSSBndWVz
cy4KTm93IEkgYW0gdGVzdGluZyBvcHRpb24gImR5bnBlcm0iLgoKU2VsZiBuYWNrIGZvciB0aGlz
IHBhdGNoLiBEb24ndCBza2lwIHRoZW0uCgpUaGFua3MhCk0KCk9uIE1vbiwgTWF5IDEzLCAyMDE5
IGF0IDAzOjEzOjM5UE0gLTA1MDAsIFN0ZXZlIEZyZW5jaCB3cm90ZToKPiBBbHNvIG5vdGUgdGhh
dCB3ZSBhcmUgd29ya2luZyBvbiBwYXRjaGVzIHRvIGltcHJvdmUgc2F2aW5nIG9mIG1vZGUKPiBi
aXRzIGFuZCBvd25lcnNoaXAgaW5mb3JtYXRpb24gZXZlbiBpbiBjYXNlcyB3aGVyZSB0aGUgc2Vy
dmVyIGRvZXMgbm90Cj4gc3VwcG9ydCBQT1NJWCBFeHRlbnNpb25zLgo+IAo+IEN1cnJlbnRseSBt
b3VudCBvcHRpb25zIGNpZnNhY2wgYW5kIGlkc2Zyb21zaWQgY2FuIGJlIHVzZWQgZm9yIHNvbWUK
PiB1c2UgY2FzZXMgYnV0IHRoZXkgYXJlIGJlaW5nIGV4dGVuZGVkLgo+IAo+IE9uIE1vbiwgTWF5
IDEzLCAyMDE5IGF0IDExOjA0IEFNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PiB3cm90ZToK
PiA+Cj4gPiBIaSBNdXJwaHksCj4gPgo+ID4gPiBBcyBDSUZTIGlzIG5vdCBzdXBwb3J0aW5nIHNl
dHVpZCBvcGVyYXRpb25zLgo+ID4gQW55IHJlZmVyZW5jZSB0byB0aGlzPwo+ID4gZnMvY2lmcy9j
aWZzZnMuYyBhbmQgb3RoZXIgcGFydHMgb2Yga2VybmVsIGNpZnMgd29ya3Mgd2l0aCBDSUZTX01P
VU5UX1NFVF9VSUQuCj4gPiBBbHNvIHNhbWJhX3NldHJldWlkKCkgZnJvbSBsaWIvdXRpbC9zZXRp
ZC5jIGZyb20gc2FtYmEgZ2l0IChJIGd1ZXNzIHVzZWQgaW4KPiA+IHNhbWJhIGxpYnJhcmllcyB3
b3JrcyB3aXRoIFNZU19zZXRyZXVpZCBzeXNjYWxsIG9yIHNldHJldWlkKCkgbGliYyB3cmFwcGVy
Lgo+ID4gV2hhdCBhbSBJIG1pc3Npbmc/Cj4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3RzdF9z
YWZlX21hY3Jvcy5jIGIvbGliL3RzdF9zYWZlX21hY3Jvcy5jCj4gPiA+IGluZGV4IDBlNTlhM2Y5
OC4uMzY5NDFlYzBiIDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvdHN0X3NhZmVfbWFjcm9zLmMKPiA+
ID4gKysrIGIvbGliL3RzdF9zYWZlX21hY3Jvcy5jCj4gPiA+IEBAIC0xMTEsNiArMTExLDcgQEAg
aW50IHNhZmVfc2V0cmV1aWQoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKPiA+
ID4gICAgICAgICAgICAgICAgIHVpZF90IHJ1aWQsIHVpZF90IGV1aWQpCj4gPiA+ICB7Cj4gPiA+
ICAgICAgIGludCBydmFsOwo+ID4gPiArICAgICBsb25nIGZzX3R5cGU7Cj4gPgo+ID4gPiAgICAg
ICBydmFsID0gc2V0cmV1aWQocnVpZCwgZXVpZCk7Cj4gPiA+ICAgICAgIGlmIChydmFsID09IC0x
KSB7Cj4gPiA+IEBAIC0xMTksNiArMTIwLDEzIEBAIGludCBzYWZlX3NldHJldWlkKGNvbnN0IGNo
YXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
KGxvbmcpcnVpZCwgKGxvbmcpZXVpZCk7Cj4gPiA+ICAgICAgIH0KPiA+Cj4gPiA+ICsgICAgIGZz
X3R5cGUgPSB0c3RfZnNfdHlwZSgiLiIpOwo+ID4gPiArICAgICBpZiAoZnNfdHlwZSA9PSBUU1Rf
Q0lGU19NQUdJQykgewo+ID4gPiArICAgICAgICAgICAgIHRzdF9icmtfKGZpbGUsIGxpbmVubywg
VENPTkYsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgInNldHJldWlkIGlzIG5vdCBzdXBw
b3J0ZWQgb24gJXMgZmlsZXN5c3RlbSIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgdHN0
X2ZzX3R5cGVfbmFtZShmc190eXBlKSk7Cj4gPiA+ICsgICAgIH0KPiA+IEkgZ3Vlc3MgdGhpcyBj
aGVjayBzaG91bGQgYmUgYmVmb3JlIHNldHJldWlkKCkgQXMgaXQncyBpbiBzYWZlX3NldGV1aWQo
KSBhbmQKPiA+IHNhZmVfc2V0dWlkKCkKPiA+ID4gKwo+ID4gPiAgICAgICByZXR1cm4gcnZhbDsK
PiA+ID4gIH0KPiA+Cj4gPiBLaW5kIHJlZ2FyZHMsCj4gPiBQZXRyCj4gCj4gCj4gCj4gLS0gCj4g
VGhhbmtzLAo+IAo+IFN0ZXZlCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
