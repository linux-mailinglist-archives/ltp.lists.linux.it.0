Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B52B5BC8
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 10:28:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D2E73C4F26
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 10:28:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7D6803C2F83
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 10:28:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1A2BA6000F4
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 10:28:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5ECA3AE95;
 Tue, 17 Nov 2020 09:28:33 +0000 (UTC)
References: <20201116130915.18264-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20201116130915.18264-1-lkml@jv-coder.de>
Date: Tue, 17 Nov 2020 09:28:32 +0000
Message-ID: <875z64pc1r.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

SGVsbG8sCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4gSGksCj4K
PiB0aGlzIGlzIHNvbWV0aGluZyBsaWtlIGFuIFJGQy4gKEkgdGhpbmsgSSBtaXhlZCBteSB0aG91
Z2h0cwo+IGJldHdlZW4gdGhpcyBhbmQgdGhlIHBhdGNoIGRlc2NyaXB0aW9uLiBNYXliZSByZWFk
IHRoZSBwYXRjaAo+IGRlc2NyaXB0aW9uIGZpcnN0KS4KPiBJIGZvdW5kIHRoZSBvdmVyY29tbWl0
X21lbW9yeSB0ZXN0LCB0aGF0IHRyaWVzIHRvIGFsbG9jYXRlCj4gYWxsIGFsb2NhdGFibGUgbWVt
b3J5IGZvciBvdmVyY29tbWl0IHBvbGljeSBuZXZlciwgZmFpbGVkIAo+IGEgbG90IGFuZCBhIGxv
dCBtb3JlIG9mdGVuLCBpZiB0aGUgc3lzdGVtIGhhcyBtb3JlIG1lbW9yeS4KPiBXaGVuIGxvb2tp
bmcgYXQgdGhlIGtlcm5lbCBzb3VyY2UgSSBmb3VuZCB0aGUgcmVhc29uOiAKPiBUaGUgcGVyY3B1
IGNvdW50ZXIgdGhhdCBjb3VudHMgdGhlIHVzZWQgbWVtb3J5IHVzZXMgYSAKPiBjb3VudGVyIGZv
ciBldmVyeSBjcHUsIGlmIHRoZSBhbGxvY2F0aW9uIG9yIGRlYWxsb2NhdGlvbnMgCj4gYXJlIHZl
cnkgc21hbGwuIFRoZSBtb3JlIG1lbW9yeSB0aGUgc3lzdGVtIGhhcywgCj4gdGhlIGJpZ2dlciAi
c21hbGwiIGlzIGRlZmluZWQuIFNlZSBtbV9jb21wdXRlX2JhdGNoLgo+Cj4gSSBzdGFydGVkIHNl
ZWluZyB0aGlzIGlzc3VlIGEgbG90IGFmdGVyIHVwZ3JhZGluZyB0byAyMDIwMDkzMAo+IGNvbW1p
bmcgZnJvbSAyMDE5MDExNS4gU29tZSBjaGFuZ2VzIGluIHRoZSBmcmFtZXdvcmsgbWF5IGhhdmUK
PiBsZWQgdG8gdGhpcy4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGtlcm5lbCBidWcsIGJ1
dCBhIHJlc3VsdCBmcm9tIHN3aXRjaGluZwo+IGJldHdlZW4gb3ZlcmNvbW1pdCBtb2Rlcy4gSW4g
b3ZlcmNvbW1pdCBtb2RlIG5ldmVyLCB0aGUgYmF0Y2gKPiBzaXplIGlzIGEgbG90IHNtYWxsZXIg
dGhhbiBpbiB0aGUgb3RoZXIgbW9kZXMKPiAocmFtX3BhZ2VzL2NwdXMvMjU2IGluc3RlYWQgb2Yg
cmEsX3BhZ2VzL2NwdXMvNCkuCj4gVGhpcyBsZWFkcyB0byBhbGxvY2F0aW9ucyBkb25lIGJlZm9y
ZSBzd2l0Y2hpbmcgdGhlIG1vZGUgdG8gYmUKPiBhY2NvdW50ZWQgaW4gdGhlIHBlciBjcHUgY291
bnRlcnMsIGFuZCBkZWFsbG9jYXRlZCBhZnRlciBpbiB0aGUKPiBnbG9iYWwgY291bnRlciwgbWFr
aW5nIHRoZSBnbG9iYWwgY291bnRlciBuZWdhdGl2ZS4gSWYgdGhlCj4gb3ZlcmNvbW1pdCBtb2Rl
IHdhcyB0aGUgc2FtZSBhbGwgdGhlIHRpbWUsIGl0IHNob3VsZCBhbGwgaGF2ZQo+IGJlZW4gYWNj
b3VudGVkIGluIHRoZSBzYW1lIGNvdW50ZXJzIGFuZCB0aGUgZ2xvYmFsIGNvdW50ZXIKPiB3b3Vs
ZG4ndCBiZSBuZWdhdGl2ZS4KPgo+IErDtnJnCgpQb3NzaWJseSAvcHJvYy9zeXMvdm0vc3RhdF9y
ZWZyZXNoIGNhbiBiZSB1c2VkIHRvIGZsdXNoIHRoZXNlIGNvdW50ZXJzCmFmdGVyIGNoYW5naW5n
IHRoZSBvdmVyY29tbWl0IHBvbGljeT8KCkZvciByZWZlcmVuY2Ugc2VlIERvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvc3lzY3RsL3ZtLnJzdC4KCkkgZ3Vlc3MgdGhhdCBpZiB0aGVzZSBjb3VudGVy
cyB0dXJuaW5nIG5lZ2F0aXZlIGlzIGNvbnNpZGVyZWQgYSBidWcgdGhlbgphIHdhcm5pbmcgd2ls
bCBiZSBwcmludGVkIG90aGVyd2lzZSB0aGUgdGVzdCBuZWVkcyB0byBiZSBzbWFydGVyLgoKLS0g
ClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
