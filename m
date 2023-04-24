Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1136E79E1
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Apr 2023 14:40:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C49763CC00A
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Apr 2023 14:40:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 36D003CBFF4
 for <ltp@lists.linux.it>; Wed, 19 Apr 2023 14:40:24 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8A6C51400BD7
 for <ltp@lists.linux.it>; Wed, 19 Apr 2023 14:40:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B44641424;
 Wed, 19 Apr 2023 05:41:03 -0700 (PDT)
Received: from [10.1.34.37] (e126380.cambridge.arm.com [10.1.34.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 087D03F6C4;
 Wed, 19 Apr 2023 05:40:18 -0700 (PDT)
Message-ID: <b589a29f-98e5-b3dc-530b-af3a2a1207d2@arm.com>
Date: Wed, 19 Apr 2023 13:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
References: <20230418130944.181716-1-teo.coupriediaz@arm.com>
 <ZD/JxunXsz7Lms9U@yuki>
 <CAEemH2caEaXVzrgVD70VvvnVYRvo4BLRs1GvbMJutma9p-OW1Q@mail.gmail.com>
Content-Language: en-US
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
Organization: Arm Ltd.
In-Reply-To: <CAEemH2caEaXVzrgVD70VvvnVYRvo4BLRs1GvbMJutma9p-OW1Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.6 required=7.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] setpgid02: Use pid_max as PGID for EPERM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsIExpLCB0aGFua3MgZm9yIHRoZSByZXZpZXcgIQoKT24gMTkvMDQvMjAyMyAxMjox
MSwgTGkgV2FuZyB3cm90ZToKPgo+Cj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgNjo1OeKAr1BN
IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PiB3cm90ZToKPgo+ICAgICBIaSEKPiAgICAg
PiBJbiBzb21lIHNpbXBsZSBzeXN0ZW1zIChsaWtlIEJ1c3lib3gpLCB0aGUgbG9naW4gc2hlbGwg
bWlnaHQgYmUgcnVuCj4gICAgID4gYXMgaW5pdCAoUElEIDEpLgo+ICAgICA+IFRoaXMgbGVhZHMg
dG8gYSBjYXNlIHdoZXJlIExUUCBpcyBydW4gaW4gdGhlIHNhbWUgc2Vzc2lvbiBhcyBpbml0LAo+
ICAgICA+IHRodXMgc2V0cGdpZCBpcyBhbGxvd2VkIHRvIHRoZSBQR0lEIG9mIGluaXQgd2hpY2gg
cmVzdWx0cyBpbiBhCj4gICAgIHRlc3QgZmFpbC4KPiAgICAgPiBJbmRlZWQsIHRoZSB0ZXN0IHJl
dHJpZXZlcyB0aGUgUEdJRCBvZiBpbml0IHRvIHRyeSBhbmQgZ2VuZXJhdGUKPiAgICAgRVBFUk0u
Cj4gICAgID4KPiAgICAgPiBJbnN0ZWFkLCBnZXQgdGhlIFBHSUQgd2UgdXNlIHRvIGdlbmVyYXRl
IEVQRVJNIGZyb20gdGhlIGtlcm5lbAo+ICAgICBwaWRfbWF4Lgo+ICAgICA+IEl0IHNob3VsZCBu
b3QgYmUgdXNlZCBieSBhbnkgcHJvY2VzcywgZ3VhcmFudGVlaW5nIGEgZGlmZmVyZW50Cj4gICAg
IHNlc3Npb24KPiAgICAgPiBhbmQgZ2VuZXJhdGluZyBhbiBFUEVSTSBlcnJvci4KPgo+ICAgICBT
byBJIHN1cHBvc2UgdGhhdCB3ZSBoaXQgc2xpZ2h0bHkgZGlmZmVyZW50IGNvbmRpdGlvbiBpbiB0
aGUga2VybmVsOgo+Cj4gICAgIMKgIMKgIMKgIMKgIGlmIChwZ2lkICE9IHBpZCkgewo+ICAgICDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmc7Cj4KPiAgICAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcGdycCA9IGZpbmRfdnBpZChwZ2lkKTsKPiAgICAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZyA9IHBpZF90YXNrKHBncnAsIFBJRFRZUEVfUEdJRCk7Cj4gICAg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghZyB8fCB0YXNrX3Nlc3Npb24oZykgIT0KPiAg
ICAgdGFza19zZXNzaW9uKGdyb3VwX2xlYWRlcikpCj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGdvdG8gb3V0Owo+ICAgICDCoCDCoCDCoCDCoCB9Cj4KPiAgICAgUHJl
dmlvdXNseSB3ZSB3ZXJlIHN1cHBvc2VkIHRvIGhpdCB0aGUgdGFza19zZXNzaW9uKGcpICE9Cj4g
ICAgIHRhc2tfc2Vzc2lvbihncm91cF9sZWFkZXIpIG5vdyB3ZSBoaXQgIWcuCj4KPgo+IEFoLCB5
ZXMsIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBkaWZmZXJlbmNlIGZyb20gdGhlIGtlcm5l
bCBsYXllci4KPgo+Cj4gICAgIEFsc28gSSBndWVzcyB0aGF0IHRoZSBvbmx5IHdheSB0byBoaXQg
dGhlIHNlY29uZCBwYXJ0IG9mIHRoZSBjb25kaXRpb24KPiAgICAgaXMgdG8gYWN0dWFsbHkgb3Bl
biBhbmQgaW5pdGlhbGl6ZSBhIHB0eSBzbyB0aGF0IHdlIGhhdmUgYSBwcm9jZXNzCj4gICAgIG91
dHNpZGUgb2YgdGhlIGN1cnJlbnQgc2Vzc2lvbi4KPgo+Cj4gKzEsIHRoaXMgc291bmRzIGNvcnJl
Y3Qgd2F5IHRvIHJlYWNoIHRoYXQgYnJhbmNoLgo+IFdlIGNhbiBhZGQgb25lIG1vcmUgaXRlbSBp
biB0aGUgdGNhc2Ugc3RydWN0IHRvIGNvdmVyIGl0LgpUaGUgbWVjaGFuaXNtIGlzIGluZGVlZCBk
aWZmZXJlbnQuIE15IGZpcnN0IGFwcHJvYWNoIHRvIHRoaXMgcGF0Y2ggd2FzIAp0byBmb3JrIGFu
ZCBzZXRzaWQoKSB0aGUgY2hpbGQsIHdoaWNoCmltcGxpZWQgYW4gRVBFUk0gZHVlIHRvIHRoZSBz
ZXNzaW9uIGRpZmZlcmVuY2UuCkhvd2V2ZXIsIHdoZW4gZGlzY3Vzc2luZyB0aGlzIGFwcHJvYWNo
IG9uIHRoZSBtYWlsaW5nIGxpc3QgKHNlZSAKaHR0cHM6Ly9saXN0cy5saW51eC5pdC9waXBlcm1h
aWwvbHRwLzIwMjMtQXByaWwvMDMzNTA1Lmh0bWwgKQppdCB3YXMgYnJvdWdodCB0byBteSBhdHRl
bnRpb24gdGhhdCBzZXRwZ2lkMDMgaXMgaW4gZmFjdCBkb2luZyBleGFjdGx5IAp0aGF0IGFscmVh
ZHkuCgpLbm93aW5nIHRoYXQsIEkgZGlkbid0IGZlZWwgaXQgd291bGQgYmUgd29ydGh3aGlsZSB0
byBhZGQgc3VjaCBhIGNhc2UgaW4gCnNldHBnaWQwMi4KCkhvd2V2ZXIsIEkgc3BlbnQgbW9yZSB0
aW1lIGxvb2tpbmcgYXQgdGhlIGNvZGUgb24gdGhlIGtlcm5lbCBzaWRlIApwcm9tcHRlZCBieSB5
b3VyIHJlbWFyayBhbmQgSSB0aGluawp0aGF0IHNldHBnaWQwMyBpcyBnb2luZyB0aHJvdWdoIGFu
b3RoZXIgcGF0aDoKCiDCoMKgwqAgaWYgKHNhbWVfdGhyZWFkX2dyb3VwKHAtPnJlYWxfcGFyZW50
LCBncm91cF9sZWFkZXIpKSB7CiDCoMKgIMKgwqDCoMKgIGVyciA9IC1FUEVSTTsKIMKgwqAgwqDC
oMKgwqAgaWYgKHRhc2tfc2Vzc2lvbihwKSAhPSB0YXNrX3Nlc3Npb24oZ3JvdXBfbGVhZGVyKSkK
IMKgwqAgwqDCoMKgwqAgwqDCoMKgIGdvdG8gb3V0OwoKU28gaXQgbWlnaHQgaW5kZWVkIG1ha2Ug
c2Vuc2UgdG8gYWRkIGFub3RoZXIgY2FzZSBpbiBzZXRwZ2lkMDIuCgpXb3VsZCBpbml0aWFsaXpp
bmcgYSBwdHkgYmUgbmVjZXNzYXJ5IHRob3VnaCA/IENvdWxkIGl0IGJlIHNpbXBseSAKYWNoaWV2
ZWQgYnkgc3Bhd25pbmcgYSBjaGlsZCB0aGF0CnNldHNpZCgpIGl0c2VsZiwgYW5kIHRyeSB0byBz
ZXRwZ2lkIHRoZSBwYXJlbnQgdG8gdGhlIGNoaWxkIFBHSUQgPyAKKFJhdGhlciB0aGFuIHNldHBn
aWQgdGhlIGNoaWxkIGFzIGluIHNldHBnaWQwMykKCk1heWJlIGl0IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8gYWRkIHRoYXQgY2FzZSB0byBzZXRwZ2lkMDMgcmF0aGVyIHRoYW4gCnNldHBnaWQwMiwgYXMg
c2V0cGdpZDAzIGFscmVhZHkgaGFzCnRoZSBuZWNlc3Nhcnkgc2NhZmZvbGRpbmcgPwoKPgo+Cj4g
ICAgIFRoZSBwYXRjaCBpdHNlbGYgbG9va3Mgb2theSwgYnV0IHdlIHNob3VsZCBhdCBsZWFzdCB1
cGRhdGUgdGhlCj4gICAgIGRvY3VtZW50YXRpb24gY29tbWVudCBzdWNoIGFzOgo+Cj4gICAgIGRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NldHBnaWQvc2V0cGdpZDAyLmMK
PiAgICAgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NldHBnaWQvc2V0cGdpZDAyLmMKPiAg
ICAgaW5kZXggNGI2M2FmZWU4Li42OGI2NjM2MzMgMTAwNjQ0Cj4gICAgIC0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc2V0cGdpZC9zZXRwZ2lkMDIuYwo+ICAgICArKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3NldHBnaWQvc2V0cGdpZDAyLmMKPiAgICAgQEAgLTEzLDggKzEz
LDggQEAKPiAgICAgwqAgKiAtIEVJTlZBTCB3aGVuIGdpdmVuIHBnaWQgaXMgbGVzcyB0aGFuIDAu
Cj4gICAgIMKgICogLSBFU1JDSCB3aGVuIHBpZCBpcyBub3QgdGhlIGNhbGxpbmcgcHJvY2VzcyBh
bmQgbm90IGEgY2hpbGQgb2YKPiAgICAgwqAgKiB0aGUgY2FsbGluZyBwcm9jZXNzLgo+ICAgICAt
ICogLSBFUEVSTSB3aGVuIGFuIGF0dGVtcHQgd2FzIG1hZGUgdG8gbW92ZSBhIHByb2Nlc3MgaW50
byBhIHByb2Nlc3MKPiAgICAgLSAqIGdyb3VwIGluIGEgZGlmZmVyZW50IHNlc3Npb24uCj4gICAg
ICsgKiAtIEVQRVJNIHdoZW4gYW4gYXR0ZW1wdCB3YXMgbWFkZSB0byBtb3ZlIGEgcHJvY2VzcyBp
bnRvIGEKPiAgICAgbm9uZXhpc3RpbmcKPiAgICAgKyAqwqAgwqBwcm9jZXNzIGdyb3VwLgo+ICAg
ICDCoCAqLwo+ClRoYW5rcywgSSBtaXNzZWQgdGhhdCwgd2lsbCB1cGRhdGUgaW4gdjIuCgo+ICAg
ICBBbmQgaWRlYWxseSB3cml0ZSBhIHRlc3QgZm9yIHRoZSBzZWNvbmQgY2FzZSBhcyB3ZWxsLgo+
CkhhcHB5IHRvIGRvIHNvLCB3aWxsIHdhaXQgZm9yIHlvdXIgdGhvdWdodHMgb24gbXkgcmVzcG9u
c2VzIGFib3ZlIGJlZm9yZSAKc2VuZGluZyBhIHYyLgo+Cj4KPiAgICAgLS0gCj4gICAgIEN5cmls
IEhydWJpcwo+ICAgICBjaHJ1YmlzQHN1c2UuY3oKPgo+ICAgICAtLSAKPiAgICAgTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4KPgo+Cj4gLS0g
Cj4gUmVnYXJkcywKPiBMaSBXYW5nClRoYW5rcyBib3RoICEKQmVzdCByZWdhcmRzLApUw6lvCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
