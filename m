Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93D45D26
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:47:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1A86294AF0
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:47:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 629B33EA5B4
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:47:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4DF1E140201F
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:47:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7110AAF94;
 Fri, 14 Jun 2019 12:47:18 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:47:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190614124714.GA4022@dell5510>
References: <20190510183132.31039-1-pvorel@suse.cz>
 <187fa31b-3295-6f1f-e330-1373b2fb4c66@oracle.com>
 <20190603072605.GB14710@dell5510>
 <925eb48b-cb17-a06e-175d-315716852c76@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <925eb48b-cb17-a06e-175d-315716852c76@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH v2 0/6] net/route: Rewrite route{4,
 6}-change-{dst, gw} into C
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxleGV5LAoKPiA+IHRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gSSBzdXBwb3NlIHlvdSBk
b24ndCBzZWUgbXVjaCBwb2ludCBvZiByZXdyaXRpbmcgdGVzdHMKPiA+IGludG8gQyAoYW5kIGRl
cGVuZGluZyBvbiBsaWJtbmwpLiBUaGUgb3JpZ2luYWwgaWRlYSB3YXMgdG8gY2hhbmdlIGl0IGZh
c3QgZW5vdWdoCj4gPiB3aXRoIEMgdG8gcmVhbGx5IHN0cmVzcyBpdC4gT0ssIGxldCdzIGxlYXZl
IGl0IDopLgoKCj4gU29ycnkgZm9yIHRoZSBkZWxheSwgaXQgd291bGQgYmUgZ29vZCB0byBoYXZl
IGEgc2hlbGwgdmFyaWFudCB3aXRoIHRoZSBwaW5nIChzbyB3ZQo+IGNhbiB2ZXJpZnkgdGhlIHJv
dXRlKSBhbmQgYWxzbyBrZWVwIHRoZSBsaWJtbmwgdGVzdC1jYXNlIHRvIHN0cmVzcyB0aGUgY3Jl
YXRpb24vZGVsZXRpb24uCgpUaGFua3MgZm9yIHlvdXIgb3Bpbmlvbi4gSXQncyBhY3R1YWxseSBn
b29kIGlkZWEgdG8gaGF2ZSBib3RoIGluc3RlYWQgb2YgdHJ5aW5nCnRvIGtpbGwgdHdvIGJpcmRz
IHdpdGggb25lIHN0b25lIGluIEMgKHNwZWVkIGFuZCB2YWxpZGF0aW9uKSA6KS4KSSdsbCBzZW5k
IHBpbmcgYW5kIG5laWdoYm9yIGRpc2NvdmVyeSB2YXJpYW50IGFuZCBmaXhlZCBDIHZhcmlhbnQu
CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gPj4+IGRvX3Rlc3QoKQo+ID4+PiB7Cj4gPj4+IAlsb2Nh
bCBpZmFjZT0kKHRzdF9pZmFjZSkKPiA+Pj4gCWxvY2FsIGFkZHIgbmV3X3J0Cgo+ID4+PiAJbmV3
X3J0PSIkKHRzdF9pcGFkZHJfdW4gJDEpLyRtYXNrIgo+ID4+PiAJYWRkcj0iJCh0c3RfaXBhZGRy
X3VuICQxIDEpIgoKPiA+Pj4gCXRzdF9yZXMgVElORk8gInRlc3Rpbmcgcm91dGUgJyRuZXdfcnQn
IgoKPiA+Pj4gCXRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIGFkZHIgYWRkICRhZGRyLyRtYXNrIGRl
diAkKHRzdF9pZmFjZSByaG9zdCkiCj4gPj4+IAlST0QgaXAgcm91dGUgYWRkICRuZXdfcnQgZGV2
ICRpZmFjZQo+ID4+PiAJUk9EIGlwIG5laWdoIHJlcGxhY2UgJGFkZHIgbGxhZGRyICQodHN0X2h3
YWRkciByaG9zdCkgbnVkIHBlcm1hbmVudCBkZXYgJGlmYWNlCj4gPj4+PiAJRVhQRUNUX1BBU1Mg
bnMtdWRwc2VuZGVyIC1mICRUU1RfSVBWRVIgLUQgJGFkZHIgLXAgJDEgLW8gLXMgJHVkcF9zaXpl
Cgo+ID4+PiAJUk9EIGlwIG5laWdoIGRlbCAkYWRkciBsbGFkZHIgJCh0c3RfaHdhZGRyIHJob3N0
KSBkZXYgJGlmYWNlCj4gPj4+IAlST0QgaXAgcm91dGUgZGVsICRuZXdfcnQgZGV2ICRpZmFjZQo+
ID4+PiAJdHN0X3Job3N0X3J1biAtYyAiaXAgYWRkciBkZWwgJGFkZHIvJG1hc2sgZGV2ICQodHN0
X2lmYWNlIHJob3N0KSIKCj4gPj4gV2l0aCBucy11ZHBzZW5kZXIsIEkgdGhpbmsgaXQgY2FuIGJl
IHdpdGhvdXQgc2V0dGluZyBpcCBhZGRyZXNzZXM6Cj4gPiBSb3V0ZSBvdmVyIGdhdGV3YXkgcmVx
dWlyZXMgKG9uIElQdjYpIGdhdGV3YXkgb24gcmhvc3QsIHdoaWNoIGlzIHJlcXVpcmVzIHRvCj4g
PiBjcmVhdGUgdGhpcyBJUCBhZGRyZXNzIGZpcnN0LgoKPiA+PiAgCVJPRCBpcCByb3V0ZSBhZGQg
JG5ld19ydCBkZXYgJGlmYWNlCj4gPj4gIAlST0QgaXAgbmVpZ2ggcmVwbGFjZSAkYWRkciBsbGFk
ZHIgJCh0c3RfaHdhZGRyIHJob3N0KSBudWQgcGVybWFuZW50IGRldiAkaWZhY2UKPiA+PiAgCUVY
UEVDVF9QQVNTIG5zLXVkcHNlbmRlciAtZiAkVFNUX0lQVkVSIC1EICRhZGRyIC1wICQxIC1vIC1z
ICR1ZHBfc2l6ZT4gCj4gPj4gCVJPRCBpcCBuZWlnaCBkZWwgJGFkZHIgbGxhZGRyICQodHN0X2h3
YWRkciByaG9zdCkgZGV2ICRpZmFjZQo+ID4+ICAJUk9EIGlwIHJvdXRlIGRlbCAkbmV3X3J0IGRl
diAkaWZhY2UKCj4gPj4gQnV0IHdpdGggcGluZyBhbmQgbmVpZ2hib3IgZGlzY292ZXJ5Ogo+ID4+
ICAJdHN0X3Job3N0X3J1biAtcyAtYyAiaXAgYWRkciBhZGQgJGFkZHIvJG1hc2sgZGV2ICQodHN0
X2lmYWNlIHJob3N0KSIKPiA+PiAgCVJPRCBpcCByb3V0ZSBhZGQgJG5ld19ydCBkZXYgJGlmYWNl
Cj4gPj4gIAlFWFBFQ1RfUEFTUyBwaW5nJFRTVF9JUFZFUiAuLi4KPiA+PiAgCVJPRCBpcCByb3V0
ZSBkZWwgJG5ld19ydCBkZXYgJGlmYWNlCj4gPj4gIAl0c3Rfcmhvc3RfcnVuIC1jICJpcCBhZGRy
IGRlbCAkYWRkci8kbWFzayBkZXYgJCh0c3RfaWZhY2Ugcmhvc3QpIgo+ID4gSSBwcmVmZXIgdXNp
bmcgcGluZyBhbmQgbmVpZ2hib3IgZGlzY292ZXJ5LiBJIHN1cHBvc2UgdGhlc2UgYXJlIGJvdGgg
ZXF1aXZhbGVudAo+ID4gKGlmIG5vdCBpdCdkIGJlIGdvb2QgdG8gcnVuIHRoZW0gYm90aCkuCgo+
ID4gS2luZCByZWdhcmRzLAo+ID4gUGV0cgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
