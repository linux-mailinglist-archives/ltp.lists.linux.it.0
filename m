Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BF17BC60
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:10:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B13943C63B2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 13:10:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 277453C63A7
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:10:07 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 40795200FC0
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 13:10:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583496605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mZXSxOC6R3nHgWWUI6Q0x9r2qUZeyh7+6zlwl+sJKA=;
 b=Ao0Ys/kEn15lWiUvic/rs974yjURmWq/Nq22jD4ISJ6Z7d4yUvdx6NksBk9/7TRuCKG3KG
 VBDxtwaB+GqRQTTUUayXIodCczzMBXVsQ6sdH7KD0mYvXt9Zps+FVc9CMI557uUCJEiSlq
 M6WdOSRd/nNKso752hyxFEm0iTt4/0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-zAXhmHtKOOOUQJAOlWa6lw-1; Fri, 06 Mar 2020 07:10:00 -0500
X-MC-Unique: zAXhmHtKOOOUQJAOlWa6lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21E4800D50;
 Fri,  6 Mar 2020 12:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E89AC46;
 Fri,  6 Mar 2020 12:09:58 +0000 (UTC)
Received: from zmail19.collab.prod.int.phx2.redhat.com
 (zmail19.collab.prod.int.phx2.redhat.com [10.5.83.22])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA30186A04;
 Fri,  6 Mar 2020 12:09:58 +0000 (UTC)
Date: Fri, 6 Mar 2020 07:09:58 -0500 (EST)
From: Veronika Kabatova <vkabatov@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1680169507.12167032.1583496598731.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200306080838.GB14808@dell5510>
References: <cki.AEA99E5519.SMAFL9TDK6@redhat.com>
 <20200306080838.GB14808@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.182, 10.4.195.4]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.5.8-97453d9.cki (stable)
Thread-Index: WRh379kE2ZSfHWEbe2FjFUkY8TU74g==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for=09kernel_5=2E5?=
 =?utf-8?q?=2E8-97453d9=2Ecki_=28stable=29?=
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
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, Inaki Malerba <imalerba@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gRnJvbTogIlBldHIgVm9yZWwiIDxwdm9y
ZWxAc3VzZS5jej4KPiBUbzogIkNLSSBQcm9qZWN0IiA8Y2tpLXByb2plY3RAcmVkaGF0LmNvbT4K
PiBDYzogIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+LCAi
TFRQIE1haWxpbmcgTGlzdCIgPGx0cEBsaXN0cy5saW51eC5pdD4sICJOaWtvbGFpIEtvbmRyYXNo
b3YiCj4gPHNwYm5pY2tAZ21haWwuY29tPgo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggNiwgMjAyMCA5
OjA4OjM4IEFNCj4gU3ViamVjdDogUmU6IFtMVFBdIOKdjCBGQUlMOiBUZXN0IHJlcG9ydCBmb3IJ
a2VybmVsIDUuNS44LTk3NDUzZDkuY2tpIChzdGFibGUpCj4gCj4gSGksCj4gCj4gPiBXZSByYW4g
YXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6
Cj4gCj4gPiAgICAgICAgS2VybmVsIHJlcG86Cj4gPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQK
PiA+ICAgICAgICAgICAgIENvbW1pdDogOTc0NTNkOWI5YjJiIC0gTGludXggNS41LjgKPiAKPiA+
IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cu
Cj4gCj4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4g
PiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiAgICAgICAgICAgIENvbXBpbGU6IE9LCj4gPiAg
ICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+IAo+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29u
ZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZAo+ID4gaGVyZToK
PiAKPiA+ICAgaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29t
L2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8wNS80NzM1MTMKPiAKPiA+
IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gCj4gPiAgICAgczM5MHg6Cj4gPiAg
ICAgIOKdjCBzdHJlc3M6IHN0cmVzcy1uZwo+ID4gICAgICDinYwgTFRQCj4gSGVyZSBpdCdzIDkg
c3lzY2FsbHMgZmFpbGVkIGZvciAic2xlcHQgZm9yIHRvbyBsb25nIiBbMV0KPiAgICAgMjgJdHN0
X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IGNsb2NrX25hbm9zbGVlcCgpIHNsZXB0IGZvciB0b28g
bG9uZwo+ICAgICAxMgl0c3RfdGltZXJfdGVzdC5jOjMxMDogRkFJTDogbmFub3NsZWVwKCkgc2xl
cHQgZm9yIHRvbyBsb25nCj4gICAgIDI3CXRzdF90aW1lcl90ZXN0LmM6MzEwOiBGQUlMOiBwb2xs
KCkgc2xlcHQgZm9yIHRvbyBsb25nCj4gICAgIDIyCXRzdF90aW1lcl90ZXN0LmM6MzEwOiBGQUlM
OiBwcmN0bCgpIHNsZXB0IGZvciB0b28gbG9uZwo+ICAgICAyNQl0c3RfdGltZXJfdGVzdC5jOjMx
MDogRkFJTDogc2VsZWN0KCkgc2xlcHQgZm9yIHRvbyBsb25nCj4gICAgIDc2CXRzdF90aW1lcl90
ZXN0LmM6MzEwOiBGQUlMOiBzZWxlY3QoKSBzbGVwdCBmb3IgdG9vIGxvbmcKPiAgICAxMjYJdHN0
X3RpbWVyX3Rlc3QuYzozMTA6IEZBSUw6IHNlbGVjdCgpIHNsZXB0IGZvciB0b28gbG9uZwo+ICAg
ICAyMgl0c3RfdGltZXJfdGVzdC5jOjMxMDogRkFJTDogZnV0ZXhfd2FpdCgpIHNsZXB0IGZvciB0
b28gbG9uZwo+ICAgICA1Mwl0c3RfdGltZXJfdGVzdC5jOjMxMDogRkFJTDogZnV0ZXhfd2FpdCgp
IHNsZXB0IGZvciB0b28gbG9uZwo+IAo+IEJUVyBpdCdkIGJlIGludGVyZXN0aW5nIHRvIHNlZSBw
cmV2aW91cyBidWlsZC4gSSBzZWFyY2hlZCBmb3Igc3RhYmxlIGluIGpvYnMKPiBbMl0sIGJ1dCB0
aGVyZSBpcyBubyBsaW51eC01LjUueSAoSSBzZWUgbGludXgtNS40LnkpLgo+IAoKV2UncmUgbm90
IG9uIHRoZSBtYWluIGtlcm5lbGNpLm9yZyBwYWdlIGp1c3QgeWV0LiBUaGVyZSdzIGEgc3RhZ2lu
ZyBncmFmYW5hCmluc3RhbmNlIHdpdGggYSBsaW1pdGVkIHNldCBvZiBkYXRhOgoKaHR0cHM6Ly9z
dGFnaW5nLmtlcm5lbGNpLm9yZzozMDAwL2QvaG9tZS9ob21lP29yZ0lkPTEmdmFyLW9yaWdpbj1y
ZWRoYXQmdmFyLWdpdF9yZXBvc2l0b3J5X3VybD1BbGwKCldlJ3JlIHBsYW5uaW5nIHRoZSBkYXNo
Ym9hcmQgSSBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIGVtYWlsIHdoaWNoIHNob3VsZAptYWtl
IHRoZSBkaXNjb3ZlcnkgZWFzaWVyLCBhcyB3ZWxsIGFzIHdvcmtpbmcgb24gZ2V0dGluZyBvbiB0
aGUgbWFpbgpLZXJuZWwgQ0kgcGFnZS4gVGhlIGJlc3Qgd2F5IHJpZ2h0IG5vdyBpcyB0byBjaGVj
ayBwcmV2aW91cyBzdGFibGUgZW1haWxzCmJ5IENLSSBQcm9qZWN0IGluIHRoZSBhcmNoaXZlczoK
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9waXBlcm1haWwvbGludXgtc3RhYmxlLW1pcnJvci8y
MDIwLU1hcmNoLwoKVGhlc2UgYXJlIHR3byA1LjUueSB0ZXN0IHJ1bnMgZnJvbSB0aGUgbGlzdDoK
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9waXBlcm1haWwvbGludXgtc3RhYmxlLW1pcnJvci8y
MDIwLU1hcmNoLzE3NDcxNi5odG1sCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9waXBlcm1haWwv
bGludXgtc3RhYmxlLW1pcnJvci8yMDIwLU1hcmNoLzE3NDcxNS5odG1sCgpqc3RhbmNlayBhbHNv
IGFscmVhZHkgc2VlbXMgdG8gYmUgbG9va2luZyBpbnRvIHNvbWUgczM5MHggaXNzdWVzIHdoaWNo
IG1pZ2h0CmJlIHJlbGF0ZWQ6CgpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvcGlwZXJtYWlsL2xp
bnV4LXN0YWJsZS1taXJyb3IvMjAyMC1NYXJjaC8xNzQ1NDkuaHRtbAoKClZlcm9uaWthCgo+IEtp
bmQgcmVnYXJkcywKPiBQZXRyCj4gCj4gWzFdCj4gaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVz
LWVhc3QtMi5hbWF6b25hd3MuY29tL2RhdGF3YXJlaG91c2UvMjAyMC8wMy8wNS80NzM1MTMvczM5
MHhfMl9MVFBfc3lzY2FsbHMuZmFpbC5sb2cKPiBbMl0gaHR0cHM6Ly9rZXJuZWxjaS5vcmcvam9i
Lwo+IAo+IAo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
