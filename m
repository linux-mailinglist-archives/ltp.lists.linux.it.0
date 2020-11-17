Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAD2B5DCC
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 12:03:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6CA63C6489
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 12:03:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4126F3C3078
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 12:03:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A7B41200D55
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 12:03:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BEA7AC2E;
 Tue, 17 Nov 2020 11:03:20 +0000 (UTC)
References: <20201116130915.18264-1-lkml@jv-coder.de> <875z64pc1r.fsf@suse.de>
 <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
Date: Tue, 17 Nov 2020 11:03:19 +0000
Message-ID: <873618p7ns.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/1] overcommit_memory: Remove unstable subtest
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gSm9lcmcsCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4g
SGkgUmljaGFyZCwKPj4gUG9zc2libHkgL3Byb2Mvc3lzL3ZtL3N0YXRfcmVmcmVzaCBjYW4gYmUg
dXNlZCB0byBmbHVzaCB0aGVzZSBjb3VudGVycwo+PiBhZnRlciBjaGFuZ2luZyB0aGUgb3ZlcmNv
bW1pdCBwb2xpY3k/Cj4gVGhpcyBzb3VuZHMgaW50ZXJlc3RpbmcuIEZyb20gdGhlIGNvZGUgSSBj
YW5ub3Qgc2VlIHRoYXQgaXQgd29ya3Mgd2l0aAo+IHZtX2NvbW1pdHRlZF9hcy4KPiBJZiB0aGlz
IGlzIG5vdCBkb25lIHdpdGggc29tZSAiaW52aXNpYmxlIiBtYWdpYywgSSBkbyBub3QgdGhpbmsg
aXQKPiB3aWxsIGhlbHAuCj4+IEkgZ3Vlc3MgdGhhdCBpZiB0aGVzZSBjb3VudGVycyB0dXJuaW5n
IG5lZ2F0aXZlIGlzIGNvbnNpZGVyZWQgYSBidWcgdGhlbgo+PiBhIHdhcm5pbmcgd2lsbCBiZSBw
cmludGVkIG90aGVyd2lzZSB0aGUgdGVzdCBuZWVkcyB0byBiZSBzbWFydGVyLgo+IE5vIEkgZG8g
bm90IHRoaW5rIHNvLiBGb3IgY29ycmVjdCBtZW1vcnkgYWNjb3VudGluZywgdXNlZCBmb3IKPiBl
LmcuIENvbW1pdGVkX0FTIGluIC9wcm9jIC9tZW1pbmZvLCB0aGUgbWVtb3J5IGlzIHN1bW1lZCB1
cCBjb3JyZWN0bHkKPiB1c2luZyBnbG9iYWxfY291bnRlciArIHN1bShjcHVfY291bnRlcnMpLiBJ
ZiBnbG9iYWxfY291bnRlciBpcwo+IG5lZ2F0aXZlLCB0aGFuIHRoZSBjcHVfY291bnRlcnMgYXJl
IHBvc2l0aXZlIGJ5IGF0IGxlYXN0IHRoZSBzYW1lCj4gYW1vdW50IGFuZCB0aGUgb3ZlcmFsbCBt
ZW1vcnkgaXMgcmVwb3J0ZWQgY29ycmVjdGx5IGFnYWluLgoKUmlnaHQsIGFuZCBpdCBzZWVtcyB0
aGF0IHRoZSBwZXJjcHUgY291bnRlcnMgYXJlIG5vdCBmbHVzaGVkIHRvIHRoZQpnbG9iYWwgY291
bnRlciB3aGVuIHBlcmZvcm1pbmcgdGhlIHN1bSwgc28gaXQgd291bGQgbm90IGJlIHBvc3NpYmxl
IHRvCnVzZSAvbWVtaW5mbyB0byBmbHVzaCB0aGUgY291bnRlcnMgb3IgYW55dGhpbmcgZWxzZSBB
RkFJQ1QuCgo+Cj4gVGhlIHByb2JsZW0gaGVyZSBpcywgdGhhdCBfX3ZtX2Vub3VnaF9tZW1vcnkg
aW4gbW0vdXRpbC5jIHVzZXMgb25seQo+IHRoZSBnbG9iYWxfY291bnRlciB0cnVuY2F0ZWQgYXQg
MCwgdGhyb3VnaAo+IHBlcmNwdV9jb3VudGVyX3JlYWRfcG9zaXRpdmUuIEkgZ3Vlc3MgdGhpcyBp
cyBpbnRlbnRpb25hbCwgYmVjYXVzZSBpdAo+IHByZXZlbnRzIGxvY2tpbmcgZm9yIG1lbW9yeSBh
bGxvY2F0aW9ucy4gVGhlIHN1bW1hdGlvbiBmdW5jdGlvbiB1c2VkCj4gYWJvdmUgcmVxdWlyZXMg
bG9ja2luZy4KPgo+IFRoZSB0ZXN0IGNhbm5vdCBrbm93IHdoYXQgdmFsdWUgdGhlIDErbmNwdSBj
b3VudGVycyBoYXZlLCBzbyBpdCBjYW5ub3QKPiBwcmludCBhIHdhcm5pbmcgb3IgYW55dGhpbmcu
CgpUbyBjbGFyaWZ5LCBJIG1lYW50IHRoYXQgdGhlIGtlcm5lbCB3aWxsIChwcm9iYWJseSkgcHJp
bnQgYSB3YXJuaW5nIGlmIGEKY291bnRlciB2YWx1ZSB0dXJucyBuZWdhdGl2ZSB1bmV4cGVjdGVk
bHkuIFdoaWNoIGlzIHRoZSBjYXNlIHdpdGggdGhlCnBhZ2UgY291bnRlciB1c2VkIGluIGNncm91
cHMuCgo+Cj4gV2hpbGUgd3JpdGluZyB0aGlzIGFuIGNoZWNraW5nIHRoZSBrZXJuZWwgY29kZSBJ
IHJlYWxpemVkIHRoYXQgdGhpcwo+IGlzc3VlIHNob3VsZG4ndCBleGlzdCBhbnltb3JlIHdpdGgg
bGludXggNS45Lgo+IENvbW1pdCA1NmYzNTQ3YmZhNGQzNjExNDhhYTc0OGNjYjg2MDczYmM1N2Y1
ZTZjIHN5bmNzIHRoZSBjb3VudGVycwo+IChpLmUuIHN1bW1pbmcgdXAgdGhlIHRvdGFsIHZhbHVl
IGluIHRoZSBnb2JhbF9jb3VudGVyKSwgd2hlbiB0aGUKPiBvdmVyY29tbWl0IHBvbGljeSBpcyBj
aGFuZ2VkIHRvIE5FVkVSLgo+IFlldCB0aGlzIHN1YnRlc3QgY2Fubm90IGJlIGNvbnNpZGVyZWQg
YSB0ZXN0IGYgb3IgdGhpcyBjaGFuZ2UsIGJlY2F1c2UKPiBmb3IgdGhhdCBhbGxvY2F0aW9ucyBh
bmQgZGVhbGxvY2F0aW9ucyBoYXZlIHRvIGJlIGNhcmVmdWxseQo+IGNvbnN0cnVjdGVkLCB0byB0
cmlnZ2VyIHRoZSBiZWhhdmlvciBJIGRlc2NyaWJlZC4KPgo+IEkgYW0gbm90IHN1cmUgd2hhdCBs
dHAncyBwb2xpY3kgaXMgZm9yIHN1cHBvcnRpbmcgb2xkZXIga2VybmVsCj4gdmVyc2lvbnMuIFBy
b2JhYmx5IG5vdCBzdXBwb3J0aW5nIHRoZW0sIHRoZW4gdGhpcyBwYXRjaCBzaG91bGQgYmUKPiBy
ZWplY3RlZCwgYnV0IG1heWJlIHRoZSBjb21taXQgaWQgc2hvdWxkIGJlIG1lbnRpb25lZCB0aGVy
ZS4KPgo+IErDtnJnCgpJIHRoaW5rIGluIGdlbmVyYWwgb2xkZXIgdmVyc2lvbnMgYXJlIHN1cHBv
cnRlZCwgYXQgbGVhc3QgYmFjayB0byAyLjYKKGFsdGhvdWdoIHlvdSBtYXkgbmVlZCB0byBjb21w
aWxlIGluIGEgbmV3ZXIgdXNlciBsYW5kKS4gSG93ZXZlciBpdApkZXBlbmRzIG9uIHRoZSB0ZXN0
LCBzbyB3ZSBtYXliZSBjb3VsZCBkaXNhYmxlIHRoZSB0ZXN0IG9uIG9sZGVyCmtlcm5lbHMsIGJ1
dCBjaGFuZ2VzIGxpa2UgdGhlIGFib3ZlIGFyZSBvZnRlbiBiYWNrcG9ydGVkIHRvIG9sZGVyCmtl
cm5lbHMuLi4KClBvc3NpYmx5IHRoZSB0ZXN0IHNob3VsZCBiZSBjb252ZXJ0ZWQgdG8gY2hlY2sg
Zm9yIHJlZ3Jlc3Npb25zIHRvIHRoZQphYm92ZSBjb21taXQ/IFdoaWNoIHdpbGwgcHJvYmFibHkg
YWxzbyB0ZXN0IHdoZXRoZXIgc2V0dGluZyBvdmVyY29tbWl0CndvcmtzIGFzIGEgYnlwcm9kdWN0
LgoKCi0tIApUaGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
