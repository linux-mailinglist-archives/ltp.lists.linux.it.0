Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D042902F6
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 12:41:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06A873C323D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 12:41:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 65D823C2403
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 12:41:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EE001400C47
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 12:41:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DCC7AB5C;
 Fri, 16 Oct 2020 10:41:45 +0000 (UTC)
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
In-reply-to: <20201016094702.GA95052@blackbook>
Date: Fri, 16 Oct 2020 11:41:43 +0100
Message-ID: <87sgaesba0.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

SGVsbG8gTWljaGFsLAoKTWljaGFsIEtvdXRuw70gPG1rb3V0bnlAc3VzZS5jb20+IHdyaXRlczoK
Cj4gSGVsbG8uCj4KPiBPbiBXZWQsIE9jdCAxNCwgMjAyMCBhdCAwODowNzo0OVBNICswMTAwLCBS
aWNoYXJkIFBhbGV0aG9ycGUgPHJwYWxldGhvcnBlQHN1c2UuY29tPiB3cm90ZToKPj4gU0xBQiBv
YmplY3RzIHdoaWNoIG91dGxpdmUgdGhlaXIgbWVtY2cgYXJlIG1vdmVkIHRvIHRoZWlyIHBhcmVu
dAo+PiBtZW1jZyB3aGVyZSB0aGV5IG1heSBiZSB1bmNoYXJnZWQuIEhvd2V2ZXIgaWYgdGhleSBh
cmUgbW92ZWQgdG8gdGhlCj4+IHJvb3QgbWVtY2csIHVuY2hhcmdpbmcgd2lsbCByZXN1bHQgaW4g
bmVnYXRpdmUgcGFnZSBjb3VudGVyIHZhbHVlcyBhcwo+PiByb290IGhhcyBubyBwYWdlIGNvdW50
ZXJzLgo+IFdoeSBkbyB5b3UgdGhpbmsgdGhvc2UgYXJlIHJlcGFyZW50ZWQgb2JqZWN0cz8gSWYg
dGhvc2UgYXJlIG9yaWdpbmFsbHkKPiBjaGFyZ2VkIGluIGEgbm9uLXJvb3QgY2dyb3VwLCB0aGVu
IHRoZSBjaGFyZ2UgdmFsdWUgc2hvdWxkIGJlIHByb3BhZ2F0ZWQgdXAgdGhlCj4gaGllcmFyY2h5
LCBpbmNsdWRpbmcgcm9vdCBtZW1jZywgc28gaWYgdGhleSdyZSBsYXRlciB1bmNoYXJnZWQgaW4g
cm9vdAo+IGFmdGVyIHJlcGFyZW50aW5nLCBpdCBzaG91bGQgc3RpbGwgYnJlYWsgZXZlbi4gKE9y
IGRpZCBJIG1pc3Mgc29tZSBzdG9jawo+IGltYmFsYW5jZT8pCgpJIHRyYWNlZCBpdCBhbmQgY2Fu
IHNlZSB0aGV5IGFyZSByZXBhcmVudGVkIG9iamVjdHMgYW5kIHRoYXQgdGhlIHJvb3QKZ3JvdXBz
IGNvdW50ZXJzIGFyZSB6ZXJvIChvciBuZWdhdGl2ZSBpZiBJIHJ1biBtYWR2aXNlMDYgbXVsdGlw
bGUgdGltZXMpCmJlZm9yZSBhIGRyYWluIHRha2VzIHBsYWNlLiBJJ20gZ3Vlc3NpbmcgdGhpcyBp
cyBiZWNhdXNlIHRoZSByb290IGdyb3VwCmhhcyAndXNlX2hpZXJhY2h5JyBzZXQgdG8gZmFsc2Ug
c28gdGhhdCB0aGUgY2hpbGRzIHBhZ2VfY291bnRlciBwYXJlbnRzCmFyZSBzZXQgdG8gTlVMTC4g
SG93ZXZlciBJIHdpbGwgY2hlY2ssIGJlY2F1c2UgSSdtIG5vdCBzdXJlIGFib3V0CmVpdGhlci4K
Cj4KPiAoQnV0IHRoZSBwYXRjaCBzZWVtcyBqdXN0aWZpYWJsZSB0byBtZSBhcyBvYmplY3RzIChu
b3QpY2hhcmdlZCBkaXJlY3RseSB0bwo+IHJvb3QgbWVtY2cgbWF5IGJlIGluY29ycmVjdGx5IHVu
Y2hhcmdlZC4pCj4KPiBUaGFua3MsCj4gTWljaGFsCgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4K
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
