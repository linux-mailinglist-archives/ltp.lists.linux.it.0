Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03043984
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 17:14:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11F74294AE8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 17:14:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 96206294A36
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 17:14:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 13CA81000AD1
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 17:14:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B651AEF5;
 Thu, 13 Jun 2019 15:14:20 +0000 (UTC)
Date: Thu, 13 Jun 2019 17:14:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190613151419.GE29926@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
 <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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

SGkhCj4gPiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSBhdCBzb21lIHBvaW50IHdlIGRlY2lkZWQg
dG8gY2xlYW4gdXAgYWZ0ZXIgdGVzdHMKPiA+IHByb3Blcmx5IHNvIHRoYXQgd2UgZG9uJ3QgdXBz
ZXQgdmFyaW91cyBkZWJ1Z2dpbmcgdG9vbHMsIGkuZS4gY292ZXJpdHksCj4gPiB2YWxncmluZCwg
ZXRjLiBhbmQgSSB0aGluayB0aGF0IHlvdSB3ZXJlIHBhcnQgb2YgdGhhdCBkaXNjdXNzaW9uLgo+
IAo+IEkgcmVjYWxsIEkgc3RhcnRlZCB3aXRoIHRoYXQgcG9zaXRpb24gKGZyZWUgYWxsKSwgYW5k
IEkgdGhvdWdodCB5b3UKPiB0dXJuZWQgbWUgYXJvdW5kIGFmdGVyIHRoaXMgbWFueSB5ZWFycyA6
LSkuCgpXZWxsIEkgZGlkbid0IGNhcmUgdGhhdCBtdWNoLCBidXQgSSBndWVzcyB0aGF0IEkgbGVh
biBzbGlnaHRseSB0byBmcmVlCnRoZSBtZW1vcnkgOi0pLgoKPiBEbyB3ZSBoYXZlIGFueXRoaW5n
IGFib3V0IHRoaXMgaW4gc3R5bGUgZ3VpZGU/IEkgb25seSBmb3VuZCBicmllZiBtZW50aW9uIAo+
IGluICJkb24ndCBjYWxsIGNsZWFudXAgZnJvbSBzZXR1cCIgc2VjdGlvbiwgd2hpY2ggaXNuJ3Qg
ZXZlbiBwb3NzaWJsZSB3aXRoIG5ld2xpYi4KCkkgZG9uJ3QgdGhpbmsgc28uIEkgZ3Vlc3MgdGhh
dCB3ZSBzaG91bGQgd3JpdGUgc29tZXRoaW5nIGRvd24sIG9uY2Ugd2UKZGVjaWRlIHdoYXQgaXMg
dGhlIHByZWZlcmVkIG9wdGlvbi4KCj4gLi4uCj4gWW91IGRvbid0IG5lZWQgdG8gY2xlYW4gdXAg
dGhlIGZvbGxvd2luZzogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
PiAgKiArbWFsbG9jKDMpKydlZCBtZW1vcnkuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICogUmVhZC1vbmx5
IGZpbGUgZGVzY3JpcHRvcnMgaW4gcGVyc2lzdGVudCBwYXRocyAoaS5lLiBub3QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAgIHRlbXBvcmFyeSBkaXJlY3Rvcmllcyku
ICAKCkxvb2tzIGxpa2UgdGhpcyBpcyB0ZXJyaWJseSBvdXRkYXRlZCwgYXQgbGVhc3QgSSB0ZW5k
IHRvIHRlbGwgcGVvcGxlIHRvCmNsb3NlIGFsbCBmaWxlZGVzY3JpcHRvcnMgdG8gbWFrZSB0aGlu
Z3Mgc2ltcGxlci4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
