Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6F2B5F50
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 13:45:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2133C5D24
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 13:45:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 802FF3C2EF3
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 13:45:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F3831000B70
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 13:45:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7777AAC24;
 Tue, 17 Nov 2020 12:45:29 +0000 (UTC)
References: <20201116130915.18264-1-lkml@jv-coder.de> <875z64pc1r.fsf@suse.de>
 <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
 <873618p7ns.fsf@suse.de>
 <0d2a3cc5-e257-ebc5-1488-2a186411d8ad@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <0d2a3cc5-e257-ebc5-1488-2a186411d8ad@jv-coder.de>
Date: Tue, 17 Nov 2020 12:45:28 +0000
Message-ID: <87zh3gnod3.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

SGVsbG8sCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4gSGkKPj4g
SSB0aGluayBpbiBnZW5lcmFsIG9sZGVyIHZlcnNpb25zIGFyZSBzdXBwb3J0ZWQsIGF0IGxlYXN0
IGJhY2sgdG8gMi42Cj4+IChhbHRob3VnaCB5b3UgbWF5IG5lZWQgdG8gY29tcGlsZSBpbiBhIG5l
d2VyIHVzZXIgbGFuZCkuIEhvd2V2ZXIgaXQKPj4gZGVwZW5kcyBvbiB0aGUgdGVzdCwgc28gd2Ug
bWF5YmUgY291bGQgZGlzYWJsZSB0aGUgdGVzdCBvbiBvbGRlcgo+PiBrZXJuZWxzLCBidXQgY2hh
bmdlcyBsaWtlIHRoZSBhYm92ZSBhcmUgb2Z0ZW4gYmFja3BvcnRlZCB0byBvbGRlcgo+PiBrZXJu
ZWxzLi4uCj4+Cj4+IFBvc3NpYmx5IHRoZSB0ZXN0IHNob3VsZCBiZSBjb252ZXJ0ZWQgdG8gY2hl
Y2sgZm9yIHJlZ3Jlc3Npb25zIHRvIHRoZQo+PiBhYm92ZSBjb21taXQ/IFdoaWNoIHdpbGwgcHJv
YmFibHkgYWxzbyB0ZXN0IHdoZXRoZXIgc2V0dGluZyBvdmVyY29tbWl0Cj4+IHdvcmtzIGFzIGEg
Ynlwcm9kdWN0Lgo+Pgo+IEluIHRoYXQgY2FzZSwgSSB3b3VsZCB2b3RlIHRvIGVpdGhlciByZW1v
dmUgdGhlIHN1YnRlc3QsIG9yIG1ha2UgaXQKPiBtb3JlIHBlcm1pc3NpdmUsIGJ5IHVzaW5nIHNv
bWV0aGluZyBsaWtlIDEuNXggY29tbWl0X2xpbWl0LiBUaGF0IG1pZ2h0Cj4gYWxzbyBmYWlsLCBi
dXQgaXMgdmVyeSBsZXNzIGxpa2VseS4KCk1vcmUgcGVybWlzc2l2ZSBzb3VuZHMgZ29vZCB0byBt
ZSwgYXMgb2Z0ZW4gdGhlc2UgdGVzdHMgdHJpZ2dlciBzb21lCmtlcm5lbCBlcnJvciBub3QgcmVs
YXRlZCB0byB0aGUgb3JpZ2luYWwgaW50ZW50IG9mIHRoZSB0ZXN0LgoKSWYgd2UgY29udGludWUg
dG8gc2VlIGZhaWx1cmVzIHRoZW4gaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gc2NhbGUgdGhlCmNv
bW1pdF9saW1pdCBkeW5hbWljYWxseSB0byBhdm9pZCB0aGVtLCBidXQgZm9yIG5vdyB0aGlzIHNl
ZW1zIGxpa2UgYQpnb29kIHNvbHV0aW9uLgoKPgo+IEZvciB0aGUgbmV3IGNoYW5nZSBJIHdvdWxk
IHJhdGhlciBjcmVhdGUgYSBuZXcgdGVzdCwgdGhhdCB0ZXN0cwo+IGV4YWN0bHkgdGhpcyBjaGFu
Z2UsIGFsdGhvdWdoIHRoZSBtb3JlIGFjY3VyYXRlIGFjY291bnRpbmcgaXMgbW9yZSBvcgo+IGxl
c3MgYSBieS1wcm9kdWN0IG9mIHRoZSBjaGFuZ2UsIHRoYXQgaXMgbm90IGV2ZW4gZG9jdW1lbnRl
ZAo+IHRoZXJlLi4uIFRoaXMgaXMgYWxsIGFib3V0IGNoYW5naW5nIHRoZSBiYXRjaCBzaXplLiBU
aGV5IGp1c3QgYWRkZWQKPiB0aGUgc3luY2hyb25pemF0aW9uIG9mIHRoZSBjb3VudGVycywgYmVj
YXVzZSB0aGV5IGVubGFyZ2UgdGhlIGJhdGNoCj4gc2l6ZSBmb3IgcG9saWNpZXMsIGJ1dCBORVZF
UiBhbmQgdGhhdCBjb3VsZCBsZWFkIHRvIHRoZSBzaXR1YXRpb24gSQo+IGRlc2NyaWJlZCBldmVu
IG1vcmUgZnJlcXVlbnRseS4KPiBOb3cgdGhhdCBjb2RlIG9mIG1tX2NvbXB1dGVfYmF0Y2ggYmVm
b3JlIHRoZSBjaGFuZ2UsIEkgd29uZGVyIGhvdyB0aGlzCj4gd2FzIGV2ZW4gcG9zc2libGUuLi4g
VGhlIGJhdGNoIHNpemUgd2FzIGNvbnN0YW50LCBpZiBubyBtZW1vcnkgaG90cGx1ZyAKPiBvY2N1
cnJlZC4gU28gbm9ybWFsbHkgYWxsb2NhdGlvbnMgYW5kIGRlYWxsb2NhdGlvbiBzaG91bGQgYmUg
YWNjb3VudGVkCj4gZm9yIGluIHRoZSBzYW1lIGNvdW50ZXIgdHlwZSAoYWx0aG91Z2ggbWF5YmUg
dGhlIGNwdSB0aGF0IGRvZXMgdGhlIAo+IGFjY291bnRpbmcgbWF5IGRpZmZlcjsgYWxsb2NhdGVk
IG9uIGNvcmUgMCBkZWFsbG9jYXRlZCBvbiAxKS4KPiBCdXQgbmV2ZXIgYWxsb2NhdGVkIG9uIGEg
Y3B1IGNvdW50ZXIgYW5kIGRlYWxsb2NhdGVkIG9uIHRoZSBnbG9iYWwgY291bnRlci4KPgo+IE9o
aCB0aGlzIGNvdWxkIGJlIG1yZW1hcDoKPiBJZiBhIG1lbW9yeSByZWdpb24gaXMgYWxsb2NhdGVk
IHdpdGggbW1hcCBhbmQgdGhlbiBncm93biB3aXRoIG1yZW1hcCwKPiB0aGlzIG1heSBsZWFkIHRv
IHRoZXNlIHNtYWxsIGFsbG9jYXRpb25zIGJlaW5nIGFkZGVkIHRvIHRoZSBwZXIgY3B1IAo+IGNv
dW50ZXJzIGFuZCB0aGUgZGVhbGxvY2F0aW9uIG9mIHRoZSBiaWdnZXIgcmFuZ2Ugc3VidHJhY3Rl
ZCBmcm9tIHRoZQo+IGdsb2JhbCBjb3VudGVyLiBUaGlzIGNvdWxkIGJlIGUuZy4gYSBzdGFjaywg
dGhhdCBoYWQgdG8gZ3Jvdy4KPiBJIHdvbmRlciBpZiB0aGlzIGNvdWxkIG92ZXJmbG93IHRoZSBn
bG9iYWwgY291bnRlciwgaWYgZG9uZSBvZnRlbiBlbm91Z2guCj4KPiBKw7ZyZwoKVGhhdCBpcyBh
biBpbnRlcmVzdGluZyBwb3NzaWJpbGl0eSEKCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
