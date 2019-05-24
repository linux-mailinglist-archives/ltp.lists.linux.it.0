Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E629931
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:45:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C9AE3EA6C0
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:45:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 932D33EA17E
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:45:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 468CF1B601C2
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:45:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57DFDAE65;
 Fri, 24 May 2019 13:45:23 +0000 (UTC)
Date: Fri, 24 May 2019 15:45:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190524134521.GA2251@rei>
References: <20190523134549.23103-1-chrubis@suse.cz>
 <CAOQ4uxhHVG9f1njmPgei8-QO4UEivXbxoHkqKi4f50XN6Gup9A@mail.gmail.com>
 <20190524085947.GA11508@rei.lan>
 <CAOQ4uxj3X2Eh+RmzunW1Sb8PWrHWsS1_h-xEH2Bofcr+-S-tiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj3X2Eh+RmzunW1Sb8PWrHWsS1_h-xEH2Bofcr+-S-tiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, ltp@lists.linux.it,
 Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs
 -> overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gPiBBZ3JlZWQsIEknbSBhbHdheXMgYWdhaW5zdCB3b3JraW5nIGFyb3VuZCBrZXJuZWwg
YnVncy9kZWZpY2llbmNpZXMgaW4KPiA+IHRlc3RzLCB1bmZvcnR1bmF0ZWx5IHRoYXQgdXN1YWxs
eSBjb25mbGljdHMgd2l0aCBRQSBkZXBhcmVubWVudHMgdGhhdAo+ID4gd2FudHMgdG8gc2tpcCBr
bm93biBwcm9ibGVtcyBhbmQgaGF2ZSBldmVyeXRoaW5nIGdyZWVuLiBTbyB3ZSB1c3VhbGx5Cj4g
PiBlbmQgdXAgc29tZXdoZXJlIGluIGEgbWlkZGxlIGdyb3VuZC4KPiAKPiBCdXQgaXMgZXZlcnl0
aGluZyBncmVlbiB0aG91Z2g/Cj4gRG9lcyBRQSBkZXBhcnRtZW50IGtub3cgdGhhdCBpZiB5b3Ug
cnVuIHNhbWJhIGluc2lkZSBhIGNvbnRhaW5lcgo+IHdob3NlIHN0b3JhZ2UgZHJpdmVyIGlzIG92
ZXJsYXlmcywgaWYgc2FtYmEgaXMgY29uZmlndXJlZCB3aXRoCj4gImtlcm5lbCBvcGxvY2sgPSB5
ZXMiCj4gU2FtYmEgY2xpZW50cyB3b3VsZCBuZXZlciBiZSBhYmxlIHRvIGFjcXVpcmUgYW4gb3Bs
b2NrIGFuZAo+IHdyaXRlIHBlcmZvcm1hbmNlIHdvdWxkIGJlIGhvcnJpYmxlPwo+IAo+IFN1cmUs
IG5vdCBldmVyeW9uZSBjYXJlcyBhYm91dCB0aGlzIGNhc2UsIGJ1dCBzZWVtcyB0byBiZSB0aGF0
Cj4gc2lsZW5jaW5nIHRoZSBlcnJvciBzaG91bGQgYmUgaW4gdGhlIGhhbmRzIG9mIHRoZSB1c2Vy
IGFuZCB0aGF0IExUUAo+IHByb2plY3Qgc2hvdWxkIGp1c3QgcmVwb3J0IHRoZSBwcm9ibGVtcyBh
cyB0aGV5IGFyZS4KPiAKPiBXb3JzZSBpcyB0aGUgZmFjdCB0aGF0IHRoaXMgZXJyb3Igd2lsbCBv
bmx5IHRyaWdnZXIgZm9yIHBlb3BsZSB0aGF0Cj4gY29uZmlndXJlZCBMVFAgdG8gdGVzdCBvdmVy
bGF5ZnMgc3BlY2lmaWNhbGx5LCBub3QgYWxsIExUUCB1c2Vycy4KPiBUaGlzIGdyb3VwIG9mIHVz
ZXJzIGlzIGV2ZW4gbW9yZSBsaWtlbHkgdG8gYmUgaW50ZXJlc3RlZCBpbgo+IGJ1Z3MvZGVmaWNp
ZW5jaWVzIG9mIG92ZXJsYXlmcy4KCkkgY2FuIHNlZSBob3cgdGhpcyBpcyB3cm9uZy4KCk9uIHRo
ZSBvdGhlciBoYW5kIGl0IHRvb2sgdXMgc29tZSB0aW1lIHRvIGV4cGxhaW4gb3VyIHJlbGVhc2Ug
bWFuYWdlcnMKdGhhdCBrZXJuZWwgaXMgT0sgd2hlbiB3ZSBzYXkgdGhhdCBpdCdzIE9LIGFuZCB0
aGF0IHRoZSBhY3R1YWxsIHRlc3QKcmVzdWx0cyBhcmUgbm90IHRoZSBlbmQgcmVzdWx0LiBCdXQg
ZXZlbiB0aGVuIHdlIG5ldmVyIGF0dGVtcHRlZCB0bwp0byBwdXQgd29ya2Fyb3VuZHMgaW50byB0
aGUgdXBzdHJlYW0gdGVzdHMuIFNvIEkgZ3Vlc3MgdGhhdCB3ZSBjYW4KcmVtb3ZlIHRoZSB3b3Jr
YXJvdW5kIHdoZW4gdGhlcmUgaXMgYSBmaXggaW4gdXBzdHJlYW0uCgo+ID4gQWxzbyBhcyB1c3Vh
bGwsIGRvIHlvdSBjYXJlIGVub3VnaCB0byBzZW5kIGEgcGF0Y2g/IDotKQo+IAo+IE5vLCBub3Qg
eWV0Lgo+IEdpdmUgbWUgYSBmZXcgZGF5cyB0byBjb29rLgo+IFdoZW4gSSBnZXQgdG8gY2FyaW5n
IGVub3VnaCBJIHdpbGwgZml4IHRoZSBrZXJuZWwgOy0pCgpPay4KCj4gPiA+IEJlc2lkZXMsIHRo
aXMgcHJvYmxlbSBsb29rcyBxdWl0ZSBlYXN5IHRvIGZpeC4KPiA+ID4gSSB0aGluayBCcnVjZSB3
YXMgYWxyZWFkeSBsb29raW5nIGF0IGNoYW5naW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+ID4g
PiBjaGVja19jb25mbGljdGluZ19vcGVuKCksIHNvIGlmIHRoZSB0ZXN0IGlzIG5vdCBmYWlsaW5n
LCBub2JvZHkgaXMgZ29pbmcgdG8KPiA+ID4gbnVkZ2UgZm9yIGEgZml4Li4uCj4gPgo+ID4gT25j
ZSBpdCdzIGZpeGVkIHdlIGNhbiBjaGFuZ2UgdGhhdCB0byBhIGZhaWx1cmUgZm9yIG5ldyBlbm91
Z2gga2VybmVscywKPiA+IG9sZCBvbmVzIHNob3VsZCBwcm9iYWJseSBzdGF5IHdpdGggU0tJUFBF
RC9UQ09ORi4KPiA+Cj4gCj4gVGhpcyB0b28gd291bGQgYmUgd3JvbmcgcHJhY3RpY2UgSU1PLgo+
IElmIHN0YWJsZSBrZXJuZWwgdXNlcnMgc2VlIHRoYXQgdGhlIHRlc3QgcGFzc2VzIG9uIG1haW5s
aW5lIGFuZCBmYWlscwo+IG9uIG9sZCBrZXJuZWwsIHNvbWVib2R5IG1heSBnZXQgdGhlIGlkZWEg
dG8gYmFja3BvcnQgdGhlIGZpeCB0byBzdGFibGUga2VybmVsCj4gYW5kIGZpeCB0aGUgYnVnLgo+
IElPVywgc2V0dGluZyBtaW5fa3ZlciBpcyBhIHRvb2wgdGhhdCBzaG91bGQgYmUgcmVzZXJ2ZWQg
SU1PIHRvIHNpdHVhdGlvbnMKPiB3aGVyZToKPiAxLiBUaGUgaW50ZXJmYWNlL2Z1bmN0aW9uYWxp
dHkgZG9lcyBub3QgZXhpc3QgLU9SLQo+IDIuIFRoZSBtYWludGFpbmVycyBoYXZlIG1hZGUgaXQg
Y2xlYXIgdGhhdCB0aGUgZml4IHdpbGwgbm90IGJlIGJhY2twb3J0ZWQKCkl0J3MgZXZlbiB3b3Jz
ZSB3aXRoIHRoZSBkaXN0cmlidXRpb24ga2VybmVscyB0aGF0IGhhdmUgYXJiaXRyYXJ5CnZlcnNp
b24gbnVtYmVycyBhbmQgdGhvdXNhbmRzIG9mIHBhdGNoZXMgb24gdGhlIHRvcCBvZiBpdCwgc28g
d2UgdXNlIGl0CmFzIGEgbGFzdCBvcHRpb24uLi4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0Bz
dXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
