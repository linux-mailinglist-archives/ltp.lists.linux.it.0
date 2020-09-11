Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF32659FA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:05:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F37063C2BF7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 09:05:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CD6EE3C262C
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:05:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 72A5860123C
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 09:05:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5336CB28F;
 Fri, 11 Sep 2020 07:05:57 +0000 (UTC)
Date: Fri, 11 Sep 2020 09:05:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200911070540.GA22970@dell5510>
References: <20200911035533.30538-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911035533.30538-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: pravin <pravinraghul@zilogic.com>, ltp@lists.linux.it,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgo+IEZyb206IHByYXZpbiA8cHJhdmlucmFnaHVsQHppbG9naWMuY29tPgoKPiBXZSBh
c3NpZ24gdGhlIG1lbW9yeSByZWdpb24gYWxsb2NhdGVkIHVzaW5nIE1BUF9HUk9XU0RPV04gdG8g
YSB0aHJlYWQsCj4gYXMgYSBzdGFjaywgdG8gdGVzdCB0aGUgZWZmZWN0IG9mIE1BUF9HUk9XU0RP
V04uIFRoaXMgaXMgYmVjYXVzZSB0aGUKPiBrZXJuZWwgb25seSBncm93cyB0aGUgbWVtb3J5IHJl
Z2lvbiB3aGVuIHRoZSBzdGFjayBwb2ludGVyLCBpcyB3aXRoaW4KPiBndWFyZCBwYWdlLCB3aGVu
IHRoZSBndWFyZCBwYWdlIGlzIHRvdWNoZWQuCgo+ICAgMS4gTWFwIGFuIGFueW9ueW1vdXMgbWVt
b3J5IHJlZ2lvbiBvZiBzaXplIFgsIGFuZCB1bm1hcCBpdC4KPiAgIDIuIFNwbGl0IHRoZSB1bm1h
cHBlZCBtZW1vcnkgcmVnaW9uIGludG8gdHdvLgo+ICAgMy4gVGhlIGxvd2VyIG1lbW9yeSByZWdp
b24gaXMgbGVmdCB1bm1hcHBlZC4KPiAgIDQuIFRoZSBoaWdoZXIgbWVtb3J5IHJlZ2lvbiBpcyBt
YXBwZWQgZm9yIHVzZSBhcyBzdGFjaywgdXNpbmcgTUFQX0ZJWEVEIHwgTUFQX0dST1dTRE9XTi4K
PiAgIDUuIFRoZSBoaWdoZXIgbWVtb3J5IHJlZ2lvbiBpcyBwcm92aWRlZCBhcyBzdGFjayB0byBh
IHRocmVhZCwgd2hlcmUKPiAgICAgIGEgcmVjdXJzaXZlIGZ1bmN0aW9uIGlzIGludm9rZWQuCj4g
ICA2LiBUaGUgc3RhY2sgZ3Jvd3MgYmV5b25kIHRoZSBhbGxvY2F0ZWQgcmVnaW9uLCBpbnRvIHRo
ZSBsb3dlciBtZW1vcnkgYXJlYS4KPiAgIDcuIElmIHRoaXMgcmVzdWx0cyBpbiB0aGUgbWVtb3J5
IHJlZ2lvbiBiZWluZyBleHRlbmRlZCwgaW50byB0aGUKPiAgICAgIHVubWFwcGVkIHJlZ2lvbiwg
dGhlIHRlc3QgaXMgY29uc2lkZXJlZCB0byBoYXZlIHBhc3NlZC4KCj4gQWxzbywgdG8gdmVyaWZ5
IHRoYXQoVGVzdDIpIHRoZSBzdGFjayBncm93cyB0byB3aXRoaW4gYSBwYWdlIG9mIHRoZSBoaWdo
Cj4gZW5kIG9mIHRoZSBuZXh0IGxvd2VyIG1hcOKAkHBpbmcgd2lsbCByZXN1bHQgaW4gYSBTSUdT
RUdWIHNpZ25hbC4KCj4gUmVzb2x2ZXMgIzMwMAo+IFNpZ25lZC1vZmYtYnk6IFByYXZpbiBSYWdo
dWwgUy4gPHByYXZpbnJhZ2h1bEB6aWxvZ2ljLmNvbT4KPiBSZXZpZXdlZC1ieTogVmlqYXkgS3Vt
YXIgQi4gPHZpamF5a3VtYXJAemlsb2dpYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8
bGl3YW5nQHJlZGhhdC5jb20+Cj4gQ2M6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PgoK
UmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgpMR1RNLgoKSnVzdCBwbGVh
c2UgZml4IHVzaW5nIHNwYWNlcyBpbnN0ZWFkIG9mIHRhYnMgaW4gY2hlY2tfc3RhY2tncm93X3Vw
KCkgYW5kCnJ1bl90ZXN0KCkgKEkgc3VwcG9zZSB5b3VyIG1vZGlmaWNhdGlvbnMgdG8gcHJhdmlz
J3MgY29kZSk6CgptbWFwMTguYzo1NTogV0FSTklORzogcGxlYXNlLCBubyBzcGFjZXMgYXQgdGhl
IHN0YXJ0IG9mIGEgbGluZQptbWFwMTguYzo1NTogV0FSTklORzogc3VzcGVjdCBjb2RlIGluZGVu
dCBmb3IgY29uZGl0aW9uYWwgc3RhdGVtZW50cyAoNywgMTUpCm1tYXAxOC5jOjU2OiBFUlJPUjog
Y29kZSBpbmRlbnQgc2hvdWxkIHVzZSB0YWJzIHdoZXJlIHBvc3NpYmxlCm1tYXAxOC5jOjU2OiBX
QVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUgc3RhcnQgb2YgYSBsaW5lCm1tYXAxOC5j
OjU3OiBFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIHVzZSB0YWJzIHdoZXJlIHBvc3NpYmxlCm1t
YXAxOC5jOjU3OiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUgc3RhcnQgb2YgYSBs
aW5lCm1tYXAxOC5jOjU4OiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUgc3RhcnQg
b2YgYSBsaW5lCm1tYXAxOC5jOjYwOiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUg
c3RhcnQgb2YgYSBsaW5lCm1tYXAxOC5jOjE2NzogRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCB1
c2UgdGFicyB3aGVyZSBwb3NzaWJsZQptbWFwMTguYzoxNjc6IFdBUk5JTkc6IHBsZWFzZSwgbm8g
c3BhY2VzIGF0IHRoZSBzdGFydCBvZiBhIGxpbmUKbW1hcDE4LmM6MTY5OiBFUlJPUjogY29kZSBp
bmRlbnQgc2hvdWxkIHVzZSB0YWJzIHdoZXJlIHBvc3NpYmxlCm1tYXAxOC5jOjE2OTogV0FSTklO
RzogcGxlYXNlLCBubyBzcGFjZXMgYXQgdGhlIHN0YXJ0IG9mIGEgbGluZQptbWFwMTguYzoxNzA6
IEVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgdXNlIHRhYnMgd2hlcmUgcG9zc2libGUKbW1hcDE4
LmM6MTcwOiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlcyBhdCB0aGUgc3RhcnQgb2YgYSBsaW5l
CgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
