Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0E24CE43
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:51:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31D893C2F86
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:51:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8EE473C2F6D
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:51:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3C2B6600429
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:51:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36528B663;
 Fri, 21 Aug 2020 06:51:35 +0000 (UTC)
Date: Fri, 21 Aug 2020 08:51:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200821065105.GB11908@dell5510>
References: <20200820091612.692383444@linuxfoundation.org>
 <CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com>
 <20200820182516.GA49496@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820182516.GA49496@sol.localdomain>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.8 000/232] 5.8.3-rc1 review
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, patches@kernelci.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgYWxsLAoKPiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAwODo1Nzo1N1BNICswNTMwLCBOYXJl
c2ggS2FtYm9qdSB3cm90ZToKPiA+IE9uIFRodSwgMjAgQXVnIDIwMjAgYXQgMTQ6NTUsIEdyZWcg
S3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKCj4g
PiA+IFRoaXMgaXMgdGhlIHN0YXJ0IG9mIHRoZSBzdGFibGUgcmV2aWV3IGN5Y2xlIGZvciB0aGUg
NS44LjMgcmVsZWFzZS4KPiA+ID4gVGhlcmUgYXJlIDIzMiBwYXRjaGVzIGluIHRoaXMgc2VyaWVz
LCBhbGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNwb25zZQo+ID4gPiB0byB0aGlzIG9uZS4gIElm
IGFueW9uZSBoYXMgYW55IGlzc3VlcyB3aXRoIHRoZXNlIGJlaW5nIGFwcGxpZWQsIHBsZWFzZQo+
ID4gPiBsZXQgbWUga25vdy4KCj4gPiA+IFJlc3BvbnNlcyBzaG91bGQgYmUgbWFkZSBieSBTYXQs
IDIyIEF1ZyAyMDIwIDA5OjE1OjA5ICswMDAwLgo+ID4gPiBBbnl0aGluZyByZWNlaXZlZCBhZnRl
ciB0aGF0IHRpbWUgbWlnaHQgYmUgdG9vIGxhdGUuCgo+ID4gPiBUaGUgd2hvbGUgcGF0Y2ggc2Vy
aWVzIGNhbiBiZSBmb3VuZCBpbiBvbmUgcGF0Y2ggYXQ6Cj4gPiA+ICAgICAgICAgaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1Lngvc3RhYmxlLXJldmlldy9wYXRjaC01
LjguMy1yYzEuZ3oKPiA+ID4gb3IgaW4gdGhlIGdpdCB0cmVlIGFuZCBicmFuY2ggYXQ6Cj4gPiA+
ICAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0
YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0IGxpbnV4LTUuOC55Cj4gPiA+IGFuZCB0aGUgZGlmZnN0
YXQgY2FuIGJlIGZvdW5kIGJlbG93LgoKPiA+ID4gdGhhbmtzLAoKPiA+ID4gZ3JlZyBrLWgKCj4g
PiA+IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiA+ID4gICAgIGNy
eXB0bzogYWZfYWxnIC0gRml4IHJlZ3Jlc3Npb24gb24gZW1wdHkgcmVxdWVzdHMKCj4gPiBSZXN1
bHRzIGZyb20gTGluYXJv4oCZcyB0ZXN0IGZhcm0uCj4gPiBSZWdyZXNzaW9ucyBkZXRlY3RlZC4K
Cj4gPiAgIGx0cC1jcnlwdG8tdGVzdHM6Cj4gPiAgICAgKiBhZl9hbGcwMgo+ID4gICBsdHAtY3Zl
LXRlc3RzOgo+ID4gICAgICogY3ZlLTIwMTctMTc4MDUKCj4gPiBhZl9hbGcwMi5jOjUyOiBCUk9L
OiBUaW1lZCBvdXQgd2hpbGUgcmVhZGluZyBmcm9tIHJlcXVlc3Qgc29ja2V0Lgo+ID4gV2UgYXJl
IHJ1bm5pbmcgdGhlIExUUCAyMDIwMDUxNSB0YWcgcmVsZWFzZWQgdGVzdCBzdWl0ZS4KPiA+ICBo
dHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9ibG9iL21hc3Rlci90ZXN0
Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCgo+ID4gU3VtbWFyeQo+ID4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCgo+ID4ga2VybmVsOiA1LjguMy1yYzEKPiA+IGdpdCByZXBvOiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJj
LmdpdAo+ID4gZ2l0IGJyYW5jaDogbGludXgtNS44LnkKPiA+IGdpdCBjb21taXQ6IDIwMWZmZjgw
NzMxMGNlMTA0ODViY2ZmMjk0ZDQ3YmU5NWYzNzY5ZWIKPiA+IGdpdCBkZXNjcmliZTogdjUuOC4y
LTIzMy1nMjAxZmZmODA3MzEwCj4gPiBUZXN0IGRldGFpbHM6IGh0dHBzOi8vcWEtcmVwb3J0cy5s
aW5hcm8ub3JnL2xrZnQvbGludXgtc3RhYmxlLXJjLTUuOC1vZS9idWlsZC92NS44LjItMjMzLWcy
MDFmZmY4MDczMTAKCj4gPiBSZWdyZXNzaW9ucyAoY29tcGFyZWQgdG8gYnVpbGQgdjUuOC4yKQo+
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCgo+ID4geDE1Ogo+ID4gICBsdHAtY3J5cHRvLXRlc3RzOgo+ID4g
ICAgICogYWZfYWxnMDIKCj4gPiAgIGx0cC1jdmUtdGVzdHM6Cj4gPiAgICAgKiBjdmUtMjAxNy0x
NzgwNQoKCj4gTG9va3MgbGlrZSB0aGlzIHRlc3QgaXMgc3RpbGwgImJyb2tlbiIgYmVjYXVzZSBp
dCBhc3N1bWVzIGJlaGF2aW9yIHRoYXQgaXNuJ3QKPiBjbGVhcmx5IHNwZWNpZmllZCwgYXMgcHJl
dmlvdXNseSBkaXNjdXNzZWQgYXQKPiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMjAwNzAy
MDMzMjIxLkdBMTkzNjdAZ29uZG9yLmFwYW5hLm9yZy5hdS4KCj4gSSBzZW50IG91dCBMVFAgcGF0
Y2hlcyB0byBmaXggaXQ6Cj4gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvbGludXgtY3J5cHRvLzIw
MjAwODIwMTgxOTE4LjQwNDc1OC0xLWViaWdnZXJzQGtlcm5lbC5vcmcvVC8jdQoKRllJIGZpeCBm
b3IgTFRQIG1lcmdlZC4KCktpbmQgcmVnYXJkcywKUGV0cgoKPiAtIEVyaWMKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
