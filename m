Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E596E2C3A2
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 11:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E5E3EA503
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 11:56:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4130C3EA1EF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 11:56:29 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 181E160124C
 for <ltp@lists.linux.it>; Tue, 28 May 2019 11:56:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B292C09AD18;
 Tue, 28 May 2019 09:56:24 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A433D611B9;
 Tue, 28 May 2019 09:56:23 +0000 (UTC)
Date: Tue, 28 May 2019 17:56:22 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190528095622.gi5islpc7zlmpc2n@XZHOUW.usersys.redhat.com>
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
 <20190528043929.19671-2-xzhou@redhat.com>
 <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 28 May 2019 09:56:24 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v5 2/4] swapon/libswapon: add helper
	is_swap_supported
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDg6NTY6MDZBTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNzo0MCBBTSBNdXJwaHkgWmhvdSA8eHpo
b3VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVG8gY2hlY2sgaWYgdGhlIGZpbGVzeXN0ZW0g
d2UgYXJlIHRlc3Rpbmcgb24gc3VwcG9ydHMgc3dhcG9uL3N3YXBvZmYKPiA+IG9wZXJhdGlvbnMu
IEtlZXAgTkZTIGFuZCBUTVBGUyBvbiB0aGUgd2hpdGUgbGlzdC4gRG9uJ3QgcmVwb3J0IGZhaWwK
PiA+IGlmIEJUUkZTIGZhaWxzIHdpdGggRUlOVkFMLgo+IAo+IENoYW5nZXMgbG9vayB2ZXJ5IGdv
b2QsIGJ1dCBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoZSB3aGl0ZWxpc3QgYW55bW9yZS4uLgo+
IAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgo+
ID4gLS0tCj4gPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMg
fCA1NiArKysrKysrKysrKysrKysrKysrKwo+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c3dhcG9uL2xpYnN3YXBvbi5oIHwgIDYgKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c3dhcG9uL2xpYnN3YXBvbi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGli
c3dhcG9uLmMKPiA+IGluZGV4IGNmNmE5ODg5MS4uZTAyZmRkNGFkIDEwMDY0NAo+ID4gLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMKPiA+ICsrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCj4gPiBAQCAtMTksNiAr
MTksOCBAQAo+ID4gICAqCj4gPiAgICovCj4gPgo+ID4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ID4g
KyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gPiAgI2luY2x1ZGUgInRlc3QuaCIKPiA+ICAj
aW5jbHVkZSAibGlic3dhcG9uLmgiCj4gPgo+ID4gQEAgLTQ3LDMgKzQ5LDU3IEBAIHZvaWQgbWFr
ZV9zd2FwZmlsZSh2b2lkIChjbGVhbnVwKSh2b2lkKSwgY29uc3QgY2hhciAqc3dhcGZpbGUpCj4g
Pgo+ID4gICAgICAgICB0c3RfcnVuX2NtZChjbGVhbnVwLCBhcmd2LCAiL2Rldi9udWxsIiwgIi9k
ZXYvbnVsbCIsIDApOwo+ID4gIH0KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIENoZWNrIHN3YXBvbi9z
d2Fwb2ZmIHN1cHBvcnQgc3RhdHVzIG9mIGZpbGVzeXN0ZW1zIG9yIGZpbGVzCj4gPiArICogd2Ug
YXJlIHRlc3Rpbmcgb24uCj4gPiArICovCj4gPiArdm9pZCBpc19zd2FwX3N1cHBvcnRlZCh2b2lk
IChjbGVhbnVwKSh2b2lkKSwgY29uc3QgY2hhciAqb3BzLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpmaWxlbmFtZSkKPiA+ICt7Cj4gPiArICAgICAgIGlu
dCBmaWJtYXAgPSB0c3RfZmlibWFwKGZpbGVuYW1lKTsKPiA+ICsgICAgICAgbG9uZyBmc190eXBl
ID0gdHN0X2ZzX3R5cGUoY2xlYW51cCwgZmlsZW5hbWUpOwo+ID4gKyAgICAgICBjb25zdCBjaGFy
ICpmc3R5cGUgPSB0c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUpOwo+ID4gKwo+ID4gKyAgICAgICAv
KiB3aGl0ZWxpc3QgbGVnYWN5IGZzICovCj4gPiArICAgICAgIHN3aXRjaCAoZnNfdHlwZSkgewo+
ID4gKyAgICAgICBjYXNlIFRTVF9ORlNfTUFHSUM6Cj4gPiArICAgICAgIGNhc2UgVFNUX1RNUEZT
X01BR0lDOgo+ID4gKyAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICJDYW5ub3QgZG8gJXMgb24gYSBmaWxlIG9uICVzIGZp
bGVzeXN0ZW0iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG9wcywgZnN0eXBlKTsKPiA+
ICsgICAgICAgYnJlYWs7Cj4gPiArICAgICAgIH0KPiAKPiBJZiB5b3UgcmVtb3ZlIHRoaXMgd2hp
dGVsaXN0LCB0aGVuIE5GUyx0bXBmcyB3aWxsIHJlYWNoIHRoZSBmaWVtYXAgIT0gMCBjYXNlCj4g
YW5kIHJlc3VsdCBpbiB0c3RfYnJrbShUQ09ORiBhbnl3YXkuCj4gCj4gPiArCj4gPiArICAgICAg
IG1ha2Vfc3dhcGZpbGUoTlVMTCwgZmlsZW5hbWUpOwo+ID4gKwo+ID4gKyAgICAgICBURVNUKGx0
cF9zeXNjYWxsKF9fTlJfc3dhcG9uLCBmaWxlbmFtZSwgMCkpOwo+ID4gKwo+ID4gKyAgICAgICBp
ZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoZnNfdHlwZSA9
PSBUU1RfQlRSRlNfTUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKSB7Cj4gCj4gSWYgeW91IHJlcGxh
Y2UgKGZzX3R5cGUgPT0gVFNUX0JUUkZTX01BR0lDKSB3aXRoIChmaWJtYXAgIT0gMCkKPiB0aGVu
IE5GUyBzd2FwZmlsZSBzdXBwb3J0IGNvdWxkIGJlIHRlc3RlZCBhcyB3ZWxsIGFuZCB5b3UgZG8g
bm90Cj4gc3BlY2lhbCBjYXNlIGFueSBmaWxlc3lzdGVtLgoKVGhlcmUgaXMgYSBzdXJwcmlzZSB0
aGF0IG9uIG9sZCBrZXJuZWxzLCAyLjYuMzIgYmFzZWQsIHRoaXMgY2hhbmdlCndvdWxkIFRCUk9L
IHdoaXRlbGlzdGVkIE5GUyBUQ09ORiB3aGlsZSBta3N3YXAgc3dhcGZpbGVzLgoKVEJST0sgb24g
bWtzd2FwIGZhaWx1cmUgc2VlbXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBidXQgdGhlIHdoaXRl
bGlzdApoZXJlIGludGVuZGVkIHRvIGZpeCB0aGlzIGZhbHNlIGFsYXJtLgoKSSByZW1lbWJlciBM
aSBzdWdnZXN0ZWQgdGhhdCB1bi13aGl0ZWxpc3QgTkZTIHdvdWxkIGJyZWFrIG9sZCBkaXN0cm9z
LgpUTVBGUyBpcyBmaW5lLgoKTWF5YmUgd2Ugc2hvdWxkIHNhZmVseSBjaGVjayBpZiBta3N3YXAg
aXMgZG9hYmxlIGJlZm9yZSBjaGVja2luZyBzd2Fwb24/Cm1rc3dhcCBmYWlsLCBmaWJtYXAgZmFp
bCAtLT4gdHN0X2JyayBUQ09ORgpta3N3YXAgZmFpbCwgZmlibWFwIHBhc3MgLS0+IHRzdF9icmsg
VEZBSUwKClRoYW5rcywKTXVycGh5Cj4gCj4gCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0
c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIlN3YXBmaWxlIG9uIEJUUkZTIG5vdCBpbXBsZW1lbnRlZCIpOwo+ID4gKyAgICAgICAgICAg
ICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZmlibWFwID09IDAp
IHsKPiAKPiBhbmQgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0aGlzIGV4dHJhIHRlc3QuCj4gCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRGQUlMIHwgVEVSUk5PLCBj
bGVhbnVwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3dh
cG9uIG9uICVzIGZhaWxlZCIsIGZzdHlwZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9
IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQ09O
RiwgY2xlYW51cCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InN3YXBvbiBvbiAlcyBpcyBub3Qgc3VwcG9ydGVkIiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZzdHlwZSk7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiAr
ICAgICAgIFRFU1QobHRwX3N5c2NhbGwoX19OUl9zd2Fwb2ZmLCBmaWxlbmFtZSwgMCkpOwo+ID4g
Kwo+ID4gKyAgICAgICBpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKPiA+ICsgICAgICAgICAgICAg
ICBpZiAoZmlibWFwID09IDApIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmtt
KFRGQUlMIHwgVEVSUk5PLCBjbGVhbnVwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAic3dhcG9mZiBvbiAlcyBmYWlsZWQiLCBmc3R5cGUpOwo+ID4gKyAgICAgICAgICAgICAg
IH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQ09ORiwgY2xl
YW51cCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzd2Fwb2ZmIG9uICVz
IGlzIG5vdCBzdXBwb3J0ZWQiLCBmc3R5cGUpOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiAKPiBJ
IGRvbid0IHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhbnkgVENPTkYgaGVyZS4KPiBJZiB3ZSByZWFj
aGVkIGhlcmUgdGhlbiBzd2Fwb24gaXMgc3VwcG9ydGVkIC0gaW4gdGhhdCBjYXNlCj4gZmFpbHVy
ZSB0byBzd2Fwb2ZmIGlzIGEgcmVhbCBmYWlsdXJlLgo+IAo+IFRoYW5rcywKPiBBbWlyLgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
