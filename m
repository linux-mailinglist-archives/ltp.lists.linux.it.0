Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF52958C4
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 09:05:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D89823C318D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 09:05:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7774B3C25F7
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 09:05:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 05D13600A0C
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 09:05:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9F03AD4A;
 Thu, 22 Oct 2020 07:04:59 +0000 (UTC)
References: <87lfg2ob83.fsf@suse.de>
 <20201019095812.25710-1-rpalethorpe@suse.com>
 <CALvZod6FNH3cZfZxLSFXtQR5bV_2Tese0793Ve9rd1YNW22MKg@mail.gmail.com>
 <87mu0hwik7.fsf@suse.de> <20201020172402.GD46039@blackbook>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
In-reply-to: <20201020172402.GD46039@blackbook>
Date: Thu, 22 Oct 2020 08:04:58 +0100
Message-ID: <87sga6vizp.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] mm: memcg/slab: Stop reparented obj_cgroups
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
Cc: Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpNaWNoYWwgS291dG7DvSA8bWtvdXRueUBzdXNlLmNvbT4gd3JpdGVzOgoKPiBIaS4K
Pgo+IE9uIFR1ZSwgT2N0IDIwLCAyMDIwIGF0IDA2OjUyOjA4QU0gKzAxMDAsIFJpY2hhcmQgUGFs
ZXRob3JwZSA8cnBhbGV0aG9ycGVAc3VzZS5kZT4gd3JvdGU6Cj4+IEkgZG9uJ3QgdGhpbmsgdGhh
dCBpcyByZWxldmFudCBhcyB3ZSBnZXQgdGhlIG1lbWNnIGZyb20gb2JqY2ctPm1lbWNnCj4+IHdo
aWNoIGlzIHNldCBkdXJpbmcgcmVwYXJlbnRpbmcuIEkgc3VwcG9zZSBob3dldmVyLCB3ZSBjYW4g
ZGV0ZXJtaW5lIGlmCj4+IHRoZSBvYmpjZyB3YXMgcmVwYXJlbnRlZCBieSBpbnNwZWN0aW5nIG1l
bWNnLT5vYmpjZy4KPiArMQo+Cj4+IElmIHdlIGp1c3QgY2hlY2sgdXNlX2hpZXJhcmNoeSB0aGVu
IG9iamVjdHMgZGlyZWN0bHkgY2hhcmdlZCB0byB0aGUKPj4gbWVtY2cgd2hlcmUgdXNlX2hpZXJh
cmNoeT0wIHdpbGwgbm90IGJlIHVuY2hhcmdlZC4gSG93ZXZlciwgbWF5YmUgaXQgaXMKPj4gYmV0
dGVyIHRvIGNoZWNrIGlmIGl0IHdhcyByZXBhcmVudGVkIGFuZCBpZiB1c2VfaGllcmFyY2h5PTAu
Cj4gSSB0aGluayAoSSBoYWQgdG8gbWFrZSBhIHRhYmxlKSB0aGUgeWllbGRlZCBjb25kaXRpb24g
d291bGQgYmU6Cj4KPiBpZiAoKG1lbWNnLT51c2VfaGllcmFyY2h5ICYmIHJlcGFyZW50ZWQpIHx8
ICghbWVtX2Nncm91cF9pc19yb290KG1lbWNnKSAmJiAhcmVwYXJlbnRlZCkpCgpUaGlzIGxvb2tz
IGNvcnJlY3QsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gY2hlY2sgZm9yIHJlcGFyZW50
aW5nCmFmdGVyIGFsbC4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIHVuaXF1ZSBzY2VuYXJpb3VzOgoK
dXNlX2hpZXJhcmNoeT0xLCBtZW1jZz0/LCByZXBhcmVudGVkPT86CkJlY2F1c2UgdXNlX2hpZXJh
cmNoeT0xIGFueSBkZXNjZW5kYW50cyB3aWxsIGhhdmUgY2hhcmdlZCB0aGUgY3VycmVudAptZW1j
ZywgaW5jbHVkaW5nIHJvb3QsIHNvIHdlIGNhbiBzaW1wbHkgdW5jaGFyZ2UgcmVnYXJkbGVzcyBv
ZiB0aGUgbWVtY2cKb3Igb2JqY2cuCgp1c2VfaGllcmFyY2h5PTAsIG1lbWNnIT1yb290LCByZXBh
cmVudGVkPT86CldoZW4gdXNlX2hpZXJhcmNoeT0wLCBvYmpjZ3MgYXJlICpvbmx5KiByZXBhcmVu
dGVkIHRvIHJvb3QsIHNvIGlmIHdlIGFyZQpub3Qgcm9vdCB0aGUgb2JqY2cgbXVzdCBiZWxvbmcg
dG8gdXMuCgp1c2VfaGllcmFyY2h5PTAsIG1lbWNnPXJvb3QsIHJlcGFyZW50ZWQ9PzoKV2UgbXVz
dCBoYXZlIGJlZW4gcmVwYXJlbnRlZCBiZWNhdXNlIHJvb3QgaXMgbm90IGluaXRpYWxpc2VkIHdp
dGggYW4Kb2JqY2csIGJ1dCB1c2VfaGllcmFyY2h5PTAgc28gd2UgY2FuIG5vdCB1bmNoYXJnZS4K
ClNvIEkgYmVsaWV2ZSB0aGF0IHRoZSBmb2xsb3dpbmcgaXMgc3VmZmljaWVudC4KCmlmIChtZW1j
Zy0+dXNlX2hpZXJhcmNoeSB8fCAhbWVtX2Nncm91cF9pc19yb290KG1lbWNnKSkKPiAJIF9fbWVt
Y2dfa21lbV91bmNoYXJnZShtZW1jZywgbnJfcGFnZXMpOwo+Cj4gKEkgYWRtaXQgaXQncyBub3Qg
dmVyeSByZWFkYWJsZS4pCj4KPgo+IE1pY2hhbAoKRm9yIHRoZSByZWNvcmQsIEkgZGlkIGNyZWF0
ZSB0aGUgZm9sbG93aW5nIHBhdGNoIHdoaWNoIGNoZWNrcyBmb3IKcmVwYXJlbnRpbmcsIGJ1dCBp
dCBhcHBlYXJzIHRvIGJlIHVuZWNlc3NhcnkuCgotLS0tCgpkaWZmIC0tZ2l0IGEvbW0vbWVtY29u
dHJvbC5jIGIvbW0vbWVtY29udHJvbC5jCmluZGV4IDY4NzdjNzY1YjhkMC4uMDI4NWY3NjBmMDAz
IDEwMDY0NAotLS0gYS9tbS9tZW1jb250cm9sLmMKKysrIGIvbW0vbWVtY29udHJvbC5jCkBAIC0y
NTcsNiArMjU3LDE0IEBAIHN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlICp2bXByZXNzdXJlX3Rv
X2NzcyhzdHJ1Y3Qgdm1wcmVzc3VyZSAqdm1wcikKICNpZmRlZiBDT05GSUdfTUVNQ0dfS01FTQog
ZXh0ZXJuIHNwaW5sb2NrX3QgY3NzX3NldF9sb2NrOwoKKy8qIEFzc3VtZXMgb2JqY2cgb3JpZ2lu
YXRlZCBmcm9tIGEgZGVzY2VuZGFudCBvZiBtZW1jZyBvciBpcyBtZW1jZydzICovCitzdGF0aWMg
Ym9vbCBvYmpfY2dyb3VwX2RpZF9jaGFyZ2UoY29uc3Qgc3RydWN0IG9ial9jZ3JvdXAgKm9iamNn
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1lbV9jZ3Jv
dXAgKm1lbWNnKQoreworICAgICAgIHJldHVybiBtZW1jZy0+dXNlX2hpZXJhcmNoeSB8fAorICAg
ICAgICAgICAgICAgcmN1X2FjY2Vzc19wb2ludGVyKG1lbWNnLT5vYmpjZykgPT0gb2JqY2c7Cit9
CisKIHN0YXRpYyB2b2lkIG9ial9jZ3JvdXBfcmVsZWFzZShzdHJ1Y3QgcGVyY3B1X3JlZiAqcmVm
KQogewogICAgICAgIHN0cnVjdCBvYmpfY2dyb3VwICpvYmpjZyA9IGNvbnRhaW5lcl9vZihyZWYs
IHN0cnVjdCBvYmpfY2dyb3VwLCByZWZjbnQpOwpAQCAtMjkxLDcgKzI5OSw3IEBAIHN0YXRpYyB2
b2lkIG9ial9jZ3JvdXBfcmVsZWFzZShzdHJ1Y3QgcGVyY3B1X3JlZiAqcmVmKQoKICAgICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmY3NzX3NldF9sb2NrLCBmbGFncyk7CiAgICAgICAgbWVtY2cgPSBv
YmpfY2dyb3VwX21lbWNnKG9iamNnKTsKLSAgICAgICBpZiAobnJfcGFnZXMpCisgICAgICAgaWYg
KG5yX3BhZ2VzICYmIG9ial9jZ3JvdXBfZGlkX2NoYXJnZShvYmpjZywgbWVtY2cpKQogICAgICAg
ICAgICAgICAgX19tZW1jZ19rbWVtX3VuY2hhcmdlKG1lbWNnLCBucl9wYWdlcyk7CiAgICAgICAg
bGlzdF9kZWwoJm9iamNnLT5saXN0KTsKICAgICAgICBtZW1fY2dyb3VwX3B1dChtZW1jZyk7CkBA
IC0zMTAwLDYgKzMxMDgsNyBAQCBzdGF0aWMgYm9vbCBjb25zdW1lX29ial9zdG9jayhzdHJ1Y3Qg
b2JqX2Nncm91cCAqb2JqY2csIHVuc2lnbmVkIGludCBucl9ieXRlcykKIHN0YXRpYyB2b2lkIGRy
YWluX29ial9zdG9jayhzdHJ1Y3QgbWVtY2dfc3RvY2tfcGNwICpzdG9jaykKIHsKICAgICAgICBz
dHJ1Y3Qgb2JqX2Nncm91cCAqb2xkID0gc3RvY2stPmNhY2hlZF9vYmpjZzsKKyAgICAgICBzdHJ1
Y3QgbWVtX2Nncm91cCAqbWVtY2c7CgogICAgICAgIGlmICghb2xkKQogICAgICAgICAgICAgICAg
cmV0dXJuOwpAQCAtMzExMCw3ICszMTE5LDkgQEAgc3RhdGljIHZvaWQgZHJhaW5fb2JqX3N0b2Nr
KHN0cnVjdCBtZW1jZ19zdG9ja19wY3AgKnN0b2NrKQoKICAgICAgICAgICAgICAgIGlmIChucl9w
YWdlcykgewogICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF9sb2NrKCk7Ci0gICAgICAg
ICAgICAgICAgICAgICAgIF9fbWVtY2dfa21lbV91bmNoYXJnZShvYmpfY2dyb3VwX21lbWNnKG9s
ZCksIG5yX3BhZ2VzKTsKKyAgICAgICAgICAgICAgICAgICAgICAgbWVtY2cgPSBvYmpfY2dyb3Vw
X21lbWNnKG9sZCk7CisgICAgICAgICAgICAgICAgICAgICAgIGlmIChvYmpfY2dyb3VwX2RpZF9j
aGFyZ2Uob2xkLCBtZW1jZykpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19tZW1j
Z19rbWVtX3VuY2hhcmdlKG1lbWNnLCBucl9wYWdlcyk7CiAgICAgICAgICAgICAgICAgICAgICAg
IHJjdV9yZWFkX3VubG9jaygpOwogICAgICAgICAgICAgICAgfQoKLS0gClRoYW5rIHlvdSwKUmlj
aGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
