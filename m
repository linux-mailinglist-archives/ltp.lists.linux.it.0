Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B155DFFF3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 10:47:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 684F63C2293
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 10:47:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3AA933C185E
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 10:47:52 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 295411A01085
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 10:47:51 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4448F9F6BD;
 Tue, 22 Oct 2019 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1571734070; bh=B5UzEcZgqD9vIy/43EpvWvtJjrmFm6+a9SNT6O+SI/g=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Y+dTwcYA9wru1V2q4847F2606ey5b+BfmUaKp2SYkY0Fdlf9gXLQLyscO0ZI/oPC0
 NZD+LfDdoazTpJexwHemi5AnoP3O9X/+vGnLnlXQmdL3o4Yo7wifvmRzQbN5Nk3/JI
 IxmcUxNm97t2yPQx87GRY6gIZphjwgEy/YSr9iec=
To: Cyril Hrubis <chrubis@suse.cz>, Steven Rostedt <rostedt@goodmis.org>
References: <015a01d56486$6c905050$45b0f0f0$@jv-coder.de>
 <20190913135121.GB7939@rei>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <51ded182-023d-da52-9784-f2705cd89026@jv-coder.de>
Date: Tue, 22 Oct 2019 10:47:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20190913135121.GB7939@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] sched_football: Validity of testcase
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
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgppcyBubyBvbmUgaW50ZXJlc3RlZCBpbiB0aGlzPwoKPiBIaSwKPiAKPiBJIHdhcyBsb29r
aW5nIHRob3JvdWdobHkgYXQgdGhlIHJlYWx0aW1lIHRlc3RjYXNlIHNjaGVkX2Zvb3RiYWxsLAo+
IGJlY2F1c2UgaXQgc29tZXRpbWVzIGZhaWxzIGFuZCBsaWtlIHRvIGtub3cgeW91ciBvcGluaW9u
IG9uIHRoZSB0ZXN0IGNhc2UuCj4gCj4gQSBzaG9ydCBpbnRyb2R1Y3Rpb24gdG8gaG93IHRoZSB0
ZXN0IHdvcmtzOgo+IEl0IGNyZWF0ZXMgblRocmVhZHMgdGhyZWFkcyBjYWxsZWQgb2ZmZW5zZSBh
bmQgbiB0aHJlYWRzIGNhbGxlZCBkZWZlbnNlCj4gKGFsbCBmaWZvIHNjaGVkdWxlZCkuIFRoZSBv
ZmZlbnNlIHRocmVhZHMgcnVuIGF0IGEgbG93ZXIgcHJpb3JpdHkgdGhhbgo+IHRoZSBkZWZlbnNl
IHRocmVhZHMgYW5kIHRoZSBtYWluIHRocmVhZCBoYXMgdGhlIGhpZ2hlc3QgcHJpb3JpdHkuIEFm
dGVyCj4gYWxsIHRocmVhZHMgYXJlIGNyZWF0ZWQgKHZhbGlkYXRlZCB1c2luZyBhbiBhdG9taWMg
Y291bnRlcikuIFRoZSB0ZXN0Cj4gdmVyaWZpZXMsIHRoYXQgdGhlIG9mZmVuc2UgdGhyZWFkcyBh
cmUgbmV2ZXIgZXhlY3V0ZWQgYnkgaW5jcmVtZW50aW5nCj4gYSBjb3VudGVyIGluIHRoZSBvZmZl
bnNlIHRocmVhZHMsIHRoYXQgaXMgemVyb2VkIGluIHRoZSBtYWluIHRocmVhZC4KPiBEdXJpbmcg
dGhlIHRlc3QgdGhlIG1haW4gdGhyZWFkcyBzbGVlcHMgdG8gcmVndWxhcmx5Lgo+IAo+IFdoaWxl
IHRoZSB0ZXN0IGlzIHRvdGFsbHkgZmluZSBvbiBhIHNpbmdsZSBjb3JlIHN5c3RlbSwgeW91IGNh
bgo+IGltbWVkaWF0ZWx5IHNlZSwgdGhhdCBpdCB3aWxsIGZhaWwgb24gYSBzeXN0ZW0gd2l0aCBu
Q29yZXMgPiBuVGhyZWFkcywKPiBiZWNhdXNlIHRoZXJlIHdpbGwgYmUgYSBjb3JlIHdlcmUgb25s
eSBhbiBvZmZlbnNlIHRocmVhZCBhbiBubyBkZWZlbnNlCj4gdGhyZWFkIGlzIHNjaGVkdWxlZC4g
SW4gaXRzIGRlZmF1bHQgc2V0dXAgblRocmVhZHMgPSBuQ29yZXMuIFRoaXMgc2hvdWxkCj4gdGhl
b3JldGljYWxseSB3b3JrLCBiZWNhdXNlIHRoZXJlIGlzIGEgZGVmZW5zZSB0aHJlYWQgZm9yIGV2
ZXJ5IHNjb3JlIHdpdGgKPiAKPiBhIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZSBvZmZlbnNlIHRo
cmVhZHMgYW5kIHRoZXkgc2hvdWxkIGJlIHNjaGVkdWxlZAo+IG9udG8gIGV2ZXJ5IGNvcmUuIFRo
aXMgaXMgaW5kZWVkIHdoYXQgaGFwcGVucy4gVGhlIHByb2JsZW0gc2VlbXMgdG8gYmUKPiB0aGUg
IGluaXRpYWxpemF0aW9uIHBoYXNlLiBXaGVuIHRoZSB0aHJlYWRzIGFyZSBjcmVhdGVkLCB0aGV5
IGFyZSBub3QKPiBldmVubHkgc2NoZWR1bGVkLiBBZnRlciBwdGhyZWFkX2NyZWF0ZSB3YXMgY2Fs
bGVkLCB0aGUgdGhyZWFkcyBhcmUKPiBzY2hlZHVsZWQKPiAKPiB0b28gY29yZXMgd2hlcmUgbm90
aGluZyBpcyBydW5uaW5nLiBJZiB0aGVyZSBpcyBubyBpZGxlIGNvcmUgYW55bW9yZSwgdGhleQo+
IGFyZQo+IHNjaGVkdWxlZCB0byBhbnkgY29yZSAodGhlIGZpcnN0PywgdGhlIG9uZSB3aXRoIHRo
ZSBzaG9ydGVzdCB3YWl0IHF1ZXVlPykuCj4gQXQKPiBzb21lIHBvaW50IGFmdGVyIGFsbCB0aHJl
YWRzIGFyZSBjcmVhdGVkLCB0aGV5IGFyZSByZXNjaGVkdWxlZCB0byBldmVyeQo+IGNvcmUuCj4g
SXQgbG9va3MgbGlrZSB0aGUgdGVzdCBmYWlscywgd2hlbiB0aGVyZSBpcyBpbml0aWFsbHkgYSBj
b3JlIHdpdGggb25seSBhbgo+IG9mZmVuc2UgdGhyZWFkIHNjaGVkdWxlZCBvbnRvIGl0LiBJbiBw
ZXJmIHNjaGVkIHRyYWNlcyBJIHNhdywgdGhhdCBhCj4gZGVmZW5zZQo+IHRocmVhZCB3YXMgbWln
cmF0ZWQgdG8gdGhpcyBjb3JlLCBidXQgc3RpbGwgdGhlIG9mZmVuc2UgdGhyZWFkIHdhcwo+IGV4
ZWN1dGVkCj4gZm9yCj4gYSBzaG9ydCB0aW1lLCB1bnRpbCB0aGUgb2ZmZW5zZSB0aHJlYWQgcnVu
cy4gRnJvbSB0aGlzIHBvaW50IG9ud2FyZHMgb25seQo+IGRlZmVuc2UgdGhyZWFkcyBhcmUgcnVu
bmluZy4KPiAKPiBJIHRlc3RlZCBhZGRpbmcgYSBzbGVlcCB0byB0aGUgbWFpbiBmdW5jdGlvbiwg
YWZ0ZXIgYWxsIHRocmVhZHMgYXJlCj4gY3JlYXRlZCwKPiB0byBnaXZlIHRoZSBzeXN0ZW0gc29t
ZSB0aW1lIGZvciByZXNjaGVkdWxpbmcuIEEgc2xlZXAgb2YgYXJvdW5kIDUwbXMKPiB3b3Jrcwo+
IHF1aXRlIHdlbGwgYW5kIHN1cHBvcnRzIG15IHRoZW9yeSBhYm91dCB0aGUgbWlncmF0aW9uIHRp
bWUgYmVpbmcgdGhlCj4gcHJvYmxlbS4KPiAKPiBOb3cgSSBhbSBub3Qgc3VyZSBpZiB0aGUgdGVz
dCBjYXNlIGlzIGV2ZW4gdmFsaWQgb3IgaWYgdGhlIHNjaGVkdWxlciBpcwo+IG5vdAo+IHdvcmtp
bmcgYXMgaXQgaXMgc3VwcG9zZWQgdG8uIExvb2tpbmcgYXQgdGhlIGNvbW1pdHMgb2Ygc2NoZWRf
Zm9vdGJhbGwgaXQKPiBsb29rcyBsaWtlIGl0IHdhcyBydW5uaW5nIHN0YWJsZSBhdCBsZWFzdCBh
dCBzb21lIHBvaW50LCBhdCBsZWFzdCBpdCBlcwo+IHJlcG9ydGVkIHRvIGhhdmUgcnVuIDE1ayBp
dGVyYXRpb25zIGluIGU2NDMyZTQ1Lgo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoZSB0ZXN0
IGNhc2U/IElzIGl0IGV2ZW4gdmFsaWQ/Cj4gU2hvdWxkIHRoZSBjcHUgYWZmaW5pdHkgYmUgc2V0
IGZpeGVkPwo+IAo+IEEgbm90ZSBhYm91dCBteSB0ZXN0aW5nIG1ldGhvZG9sb2d5Ogo+IEFmdGVy
IEkgcmVhbGl6ZWQsIHRoYXQgdGhlIGV4ZWN1dGlvbiBvZnRlbiBmYWlsZWQgZHVlIHRvIHRoZSBv
ZmZlbnNlCj4gdGhyZWFkCj4gcnVubmluZyBhZnRlciByZWZlcmVlIHNldCB0aGVfYmFsbCB0byAw
LCBJIHJlcGxhY2VkIHRoZSBsb29wIHdpdGgganVzdAo+IHVzbGVlcCgxMDAwMCksIGZvciBmYXN0
ZXIgaXRlcmF0aW9uLgo+IEkgdGVzdGVkIG9uIHVidW50dSAxOS4wNCB3aXRoIGxpbnV4IDUuMC4w
LTI3IHJ1bm5pbmcgaW4gdm13YXJlIGFuZAo+IGEgY3VzdG9tIHlvY3RvIGRpc3RyaWJ1dGlvbiBy
dW5uaW5nIGxpbnV4IDQuMTkuNTkgKHdpdGggYW5kIHdpdGhvdXQgcnQKPiBwYXRjaGVzKQo+IAo+
IErDtnJnCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
