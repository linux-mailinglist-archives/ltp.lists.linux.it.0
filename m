Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451E2C163
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 10:33:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E96C294AE5
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 10:33:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A2C263EA4D9
 for <ltp@lists.linux.it>; Tue, 28 May 2019 10:33:09 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F93A1000D41
 for <ltp@lists.linux.it>; Tue, 28 May 2019 10:33:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B2851368E6;
 Tue, 28 May 2019 08:33:06 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 248F15D71A;
 Tue, 28 May 2019 08:33:05 +0000 (UTC)
Date: Tue, 28 May 2019 16:33:04 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190528083304.pbxxlacyzi7ma6uz@XZHOUW.usersys.redhat.com>
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
 <20190528043929.19671-2-xzhou@redhat.com>
 <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 28 May 2019 08:33:06 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
bm90Cj4gc3BlY2lhbCBjYXNlIGFueSBmaWxlc3lzdGVtLgoKVmVyeSBnb29kIGlkZWEhCgo+IAo+
IAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJTd2FwZmlsZSBvbiBCVFJGUyBub3Qg
aW1wbGVtZW50ZWQiKTsKPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKGZpYm1hcCA9PSAwKSB7Cj4gCj4gYW5kIHRoZW4geW91IGRvbid0
IG5lZWQgdGhpcyBleHRyYSB0ZXN0LgoKWWVzLgoKPiAKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwgfCBURVJSTk8sIGNsZWFudXAsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzd2Fwb24gb24gJXMgZmFpbGVkIiwg
ZnN0eXBlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3dhcG9uIG9uICVzIGlzIG5v
dCBzdXBwb3J0ZWQiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZnN0eXBlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAg
ICAgICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgVEVTVChsdHBfc3lz
Y2FsbChfX05SX3N3YXBvZmYsIGZpbGVuYW1lLCAwKSk7Cj4gPiArCj4gPiArICAgICAgIGlmIChU
RVNUX1JFVFVSTiA9PSAtMSkgewo+ID4gKyAgICAgICAgICAgICAgIGlmIChmaWJtYXAgPT0gMCkg
ewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEZBSUwgfCBURVJSTk8sIGNs
ZWFudXAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzd2Fwb2ZmIG9uICVz
IGZhaWxlZCIsIGZzdHlwZSk7Cj4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInN3YXBvZmYgb24gJXMgaXMgbm90IHN1cHBvcnRlZCIs
IGZzdHlwZSk7Cj4gPiArICAgICAgICAgICAgICAgfQo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUg
c2hvdWxkIGJlIGFueSBUQ09ORiBoZXJlLgo+IElmIHdlIHJlYWNoZWQgaGVyZSB0aGVuIHN3YXBv
biBpcyBzdXBwb3J0ZWQgLSBpbiB0aGF0IGNhc2UKPiBmYWlsdXJlIHRvIHN3YXBvZmYgaXMgYSBy
ZWFsIGZhaWx1cmUuCgpIbW0uLiBtYWtlIHBlcmZlY3Qgc2Vuc2UuIEkgaGF2ZSBmZWx0IHRoaXMg
dGVzdCBoZXJlIHdhcyBhIGxpdHRsZSBvZGQuLgoKVGhhbmtzIQoKSSdsbCB0ZXN0cyB0aGlzIG1v
cmUgb24gZGlmZmVyZW50IGZpbGVzeXN0ZW1zIGFuZCB0aGVuIHBvc3QgYWdhaW4uCgotLQpNdXJw
aHkKCj4gCj4gVGhhbmtzLAo+IEFtaXIuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
