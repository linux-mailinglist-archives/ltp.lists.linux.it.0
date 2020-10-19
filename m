Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3DF2923E0
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 10:45:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 839103C31E3
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 10:45:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A31993C2403
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 10:45:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 240626000FC
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 10:45:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 111FFAC8C;
 Mon, 19 Oct 2020 08:45:34 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook> <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
In-reply-to: <20201016171502.GA102311@blackbook>
Date: Mon, 19 Oct 2020 09:45:32 +0100
Message-ID: <87lfg2ob83.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
 linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpNaWNoYWwgS291dG7DvSA8bWtvdXRueUBzdXNlLmNvbT4gd3JpdGVzOgoKPiBPbiBG
cmksIE9jdCAxNiwgMjAyMCBhdCAxMDo1MzowOEFNIC0wNDAwLCBKb2hhbm5lcyBXZWluZXIgPGhh
bm5lc0BjbXB4Y2hnLm9yZz4gd3JvdGU6Cj4+IFRoZSBjZW50cmFsIHRyeV9jaGFyZ2UoKSBmdW5j
dGlvbiBjaGFyZ2VzIHJlY3Vyc2l2ZWx5IGFsbCB0aGUgd2F5IHVwCj4+IHRvIGFuZCBpbmNsdWRp
bmcgdGhlIHJvb3QuCj4gRXhjZXB0IGZvciB1c2VfaGllYXJjaHk9MCAod2hpY2ggaXMgdGhlIGNh
c2UgaGVyZSBhcyBSaWNoYXJkCj4gd3JvdGUpLiBUaGUgcmVwYXJlbnRpbmcgaXMgaGVuY2Ugc29t
ZXdoYXQgaW5jb21wYXRpYmxlIHdpdGgKPiBuZXdfcGFyZW50LnVzZV9oaWVhcmNoeT0wIDotLwo+
CgpZZXMgYW5kIGl0IGFsc28gc2VlbXMKCm5ld19wYXJlbnQudXNlX2hpZXJhcmNoPTAgLT4gbmV3
X2NoaWxkLnVzZV9oaWVyYXJjaHk9MAoKYW5kCgpuZXdfcGFyZW50LnVzZV9oaWVyYXJjaD0wIC0+
IG5ld19jaGlsZC51c2VfaGllcmFyY2h5PTEKCmFyZSBjb25zaWRlcmVkIHZhbGlkIG9uIGNncm91
cHNWMS4gVGhlIGtlcm5lbCB3aWxsIGFsc28gYWxsb3cgbW9yZQpkZXNjZW5kYW50cyBvbiBuZXdf
Y2hpbGQudXNlX2hpZXJhcmNoeT0wLCBidXQgc2V0cwpicm9rZW5faGllcmFyY2h5PTEuIEhvd2V2
ZXIgdGhpcyB3aWxsIG5vdCBzdG9wIHRoZSBzdGFjayB0cmFjZSBvY2N1cmluZwooQUZBSUNUKSB3
aGVuIHRoZSByZXBhcmVudGluZyBoYXBwZW5zIGJldHdlZW4gdHdvIGRlc2NlbmRhbnRzLgoKPj4g
V2Ugc2hvdWxkIGNsZWFuIHRoaXMgdXAgb25lIHdheSBvciBhbm90aGVyOiBlaXRoZXIgY2hhcmdl
IHRoZSByb290IG9yCj4+IGRvbid0LCBidXQgZG8gaXQgY29uc2lzdGVudGx5Lgo+IEkgYWdyZWUg
dGhpcydkIGJlIGdvb2QgdG8gdW5pZnkuIE9uZSB1cHNpZGUgb2YgZXhjbHVkaW5nIHJvb3QgbWVt
Y2cgZnJvbQo+IGNoYXJnaW5nIGlzIHRoYXQgdXNlcnMgYXJlIHNwYXJlZCBmcm9tIHRoZSBjaGFy
Z2luZyBvdmVyaGVhZCB3aGVuIG1lbWNnCj4gdHJlZSBpcyBub3QgY3JlYXRlZC4gIChBY3R1YWxs
eSwgSSB0aG91Z2h0IHRoYXQgd2FzIHRoZSByZWFzb24gZm9yIHRoaXMKPiBleGNlcHRpb24uKQo+
Cj4gTWljaGFsCgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
