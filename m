Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAA2907F1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 17:05:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4CC93C57CC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 17:05:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 017B43C011E
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 17:05:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33AC0200E1D
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 17:05:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 594B3B1AB;
 Fri, 16 Oct 2020 15:05:22 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook> <87sgaesba0.fsf@suse.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
In-reply-to: <87sgaesba0.fsf@suse.de>
Date: Fri, 16 Oct 2020 16:05:21 +0100
Message-ID: <87pn5irz2m.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] mm: memcg/slab: Stop reparented obj_cgroups
 from charging root
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
Cc: linux-kernel@vger.kernel.org, Roman Gushchin <guro@fb.com>,
 linux-mm@kvack.org, Shakeel
 Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpSaWNoYXJkIFBhbGV0aG9ycGUgPHJwYWxldGhvcnBlQHN1c2UuZGU+IHdyaXRlczoK
Cj4gSGVsbG8gTWljaGFsLAo+Cj4gTWljaGFsIEtvdXRuw70gPG1rb3V0bnlAc3VzZS5jb20+IHdy
aXRlczoKPgo+PiBIZWxsby4KPj4KPj4gT24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgMDg6MDc6NDlQ
TSArMDEwMCwgUmljaGFyZCBQYWxldGhvcnBlIDxycGFsZXRob3JwZUBzdXNlLmNvbT4gd3JvdGU6
Cj4+PiBTTEFCIG9iamVjdHMgd2hpY2ggb3V0bGl2ZSB0aGVpciBtZW1jZyBhcmUgbW92ZWQgdG8g
dGhlaXIgcGFyZW50Cj4+PiBtZW1jZyB3aGVyZSB0aGV5IG1heSBiZSB1bmNoYXJnZWQuIEhvd2V2
ZXIgaWYgdGhleSBhcmUgbW92ZWQgdG8gdGhlCj4+PiByb290IG1lbWNnLCB1bmNoYXJnaW5nIHdp
bGwgcmVzdWx0IGluIG5lZ2F0aXZlIHBhZ2UgY291bnRlciB2YWx1ZXMgYXMKPj4+IHJvb3QgaGFz
IG5vIHBhZ2UgY291bnRlcnMuCj4+IFdoeSBkbyB5b3UgdGhpbmsgdGhvc2UgYXJlIHJlcGFyZW50
ZWQgb2JqZWN0cz8gSWYgdGhvc2UgYXJlIG9yaWdpbmFsbHkKPj4gY2hhcmdlZCBpbiBhIG5vbi1y
b290IGNncm91cCwgdGhlbiB0aGUgY2hhcmdlIHZhbHVlIHNob3VsZCBiZSBwcm9wYWdhdGVkIHVw
IHRoZQo+PiBoaWVyYXJjaHksIGluY2x1ZGluZyByb290IG1lbWNnLCBzbyBpZiB0aGV5J3JlIGxh
dGVyIHVuY2hhcmdlZCBpbiByb290Cj4+IGFmdGVyIHJlcGFyZW50aW5nLCBpdCBzaG91bGQgc3Rp
bGwgYnJlYWsgZXZlbi4gKE9yIGRpZCBJIG1pc3Mgc29tZSBzdG9jawo+PiBpbWJhbGFuY2U/KQo+
Cj4gSSB0cmFjZWQgaXQgYW5kIGNhbiBzZWUgdGhleSBhcmUgcmVwYXJlbnRlZCBvYmplY3RzIGFu
ZCB0aGF0IHRoZSByb290Cj4gZ3JvdXBzIGNvdW50ZXJzIGFyZSB6ZXJvIChvciBuZWdhdGl2ZSBp
ZiBJIHJ1biBtYWR2aXNlMDYgbXVsdGlwbGUgdGltZXMpCj4gYmVmb3JlIGEgZHJhaW4gdGFrZXMg
cGxhY2UuIEknbSBndWVzc2luZyB0aGlzIGlzIGJlY2F1c2UgdGhlIHJvb3QgZ3JvdXAKPiBoYXMg
J3VzZV9oaWVyYWNoeScgc2V0IHRvIGZhbHNlIHNvIHRoYXQgdGhlIGNoaWxkcyBwYWdlX2NvdW50
ZXIgcGFyZW50cwo+IGFyZSBzZXQgdG8gTlVMTC4gSG93ZXZlciBJIHdpbGwgY2hlY2ssIGJlY2F1
c2UgSSdtIG5vdCBzdXJlIGFib3V0Cj4gZWl0aGVyLgoKWWVzLCBpdCBhcHBlYXJzIHRoYXQgdXNl
X2hpZXJhcmNoeT0wIHdoaWNoIGlzIHByb2JhYmx5IGJlY2F1c2UgdGhlIHRlc3QKbW91bnRzIGNn
cm91cCB2MSwgY3JlYXRlcyBhIGNoaWxkIGdyb3VwIHdpdGhpbiB0aGF0IGFuZCBkb2VzIG5vdCBz
ZXQKdXNlX2hpZXJhcmNoeSBvbiB0aGUgcm9vdC4gT24gdjIgcm9vdCBhbHdheXMgaGFzIHVzZV9o
aWVyYXJjaHkgZW5hYmxlZC4KCj4KPj4KPj4gKEJ1dCB0aGUgcGF0Y2ggc2VlbXMganVzdGlmaWFi
bGUgdG8gbWUgYXMgb2JqZWN0cyAobm90KWNoYXJnZWQgZGlyZWN0bHkgdG8KPj4gcm9vdCBtZW1j
ZyBtYXkgYmUgaW5jb3JyZWN0bHkgdW5jaGFyZ2VkLikKPj4KPj4gVGhhbmtzLAo+PiBNaWNoYWwK
CkknbSBkb24ndCBrbm93IGlmIHRoYXQgY291bGQgaGFwcGVuIHdpdGhvdXQgcmVwYXJlbnRpbmcu
IEkgc3VwcG9zZSBpZgp1c2VfaGllcmFyY2h5PTEgdGhlbiBhY3R1YWxseSB0aGlzIHBhdGNoIHdp
bGwgcmVzdWx0IGluIHJvb3QgYmVpbmcKb3ZlcmNoYXJnZWQsIHNvIHBlcmhhcHMgaXQgc2hvdWxk
IGFsc28gY2hlY2sgZm9yIHVzZV9oaWVyYXJjaHk/CgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
