Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0933700D
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 11:33:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C6EA3C5620
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 11:33:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7AFF63C3228
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 11:33:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F99B1A014E1
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 11:33:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69EC9AC16;
 Thu, 11 Mar 2021 10:33:07 +0000 (UTC)
Date: Thu, 11 Mar 2021 11:33:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>, Martin Doucha <martin.doucha@suse.com>,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YEnx4V3Il/VrThv/@pevik>
References: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
 <YEigO2gryF1Kp6Gq@pevik>
 <b11680c3-7878-b06b-e87a-8991bd3cb305@163.com>
 <YEkAH6xJlSK99bp+@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEkAH6xJlSK99bp+@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Use anonymous .resource_files for
 docparse
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgouLi4KPiA+IEhpIFBldHIsCgo+ID4gSSBjYW4gdXNlIGZpbGUgbmFtZSBkaXJlY3RseSBp
biB2MiBwYXRjaC4KPiBPSy4gSSdkIGxpa2UgdG8ga25vdyB0aGUgb3RoZXJzIG9waW5pb24gKHBy
ZWNlZGVudCkuCgo+ID4gRG8geW91IGFncmVlIHRvIHVzZSBhbm9ueW1vdXMgLnJlc291cmNlX2Zp
bGVzIGZvciBub3fvvJ8gb3IgaXMgaXQgYmV0dGVyIHRvCj4gPiBrZWVwIGl0Pwo+IEkgZ3Vlc3Mg
eWVzLCB3ZSd2ZSBhbHJlYWR5IHN0YXJ0ZWQgdG8gdXNlIGl0LgoKPiA+ID4gTm90IHN1cmUgaG93
IGZhciB3ZSBzaG91bGQgZ28gd2l0aCBtb3ZpbmcgZXZlcnl0aGluZyBpbnRvIGlubGluZSBhbm9u
eW1vdXMKPiA+ID4gZGVmaW5pdGlvbnMgKGl0J2QgYmUgbmljZSBpZiBkb2NwYXJzZSB3YXMgYWJs
ZSB0byBqdXN0IGV4cGFuZCBtYWNyb3MsIGJ1dCB0aGF0Cj4gPiA+IHdvdWxkIGJlIHdheSB0b28g
c2xvdykuCgo+ID4gSSBhZ3JlZSB0aGF0IGV4cGFuZGluZyBtYWNyb3Mgb3Igc3RydWN0cyBpcyB0
aGUgbmljZXIgd2F5IGJ1dAoKPiA+IHdlIG5lZWQgdG8gZG8gc29tZSBpbnZlc3RpZ2F0aW9uIGFi
b3V0IGl0Lgo+IGdjYyAtRSBmb28uYyB3b3VsZCBkbyBleHBhbnNpb24gZm9yIHVzLiBCdXQgbm90
IHN1cmUgaWYgaXQncyB3b3J0aCBvZiBydW50aW1lLgo+IEJlY2F1c2UgcHJvYmxlbSBvZiBtaXNz
aW5nIGRlZmluaXRpb25zIHdpbGwgYmUgb24gb3RoZXIgcGxhY2VzIGFuZCB3ZSBkb24ndCB3YW50
Cj4gdG8gZ2V0IHJpZCBvZiBkZWZpbml0aW9ucy4gZS5nLiBJIHBsYW5uZWQgdG8gYWRkIHNvbWUg
dGFnIGRlZmluaXRpb25zIChmb3IKPiAibGludXgtZ2l0IiwgLi4uKSBhcyBNYXJ0aW4gRG91Y2hh
IHN1Z2dlc3RlZCwgYnV0IHRoaXMgd291bGQgbm90IHdvcmsgdW50aWwKPiB3ZSBleHBhbmQgbWFj
cm9zLgoKSSB3YXMgbG9va2luZyBpbnRvIHRoZSBvdXRwdXQgb2YgZ2NjIC1FIGJ1dCBpdCBicmlu
Z3Mgb3RoZXIgcHJvYmxlbXMuCldvdWxkbid0IGJlIGJldHRlciBpbnN0ZWFkIG9mIHBhdGNoaW5n
IGxpa2UgdGhpcyB0byBqdXN0IHJlcGxhY2UgZG9jcGFyc2UuYyB3aXRoCmxpYnJhcnkgc3VwcG9y
dCB0byB0ZXN0IGl0c2VsZiBwcmludCBpdCdzIGRlc2NyaXB0aW9uIGluIGpzb24gZm9ybWF0Cihl
LmcuIC0tcHJpbnQtanNvbiBvcHQpPyBJIHdhcyB0aGlua2luZyB0byB1c2UgdGhlIHNhbWUgZm9y
IHNoZWxsIHRlc3RzIGRvY3BhcnNlCih3aGljaCBhcmVuJ3QgY292ZXJlZCBhdCBhbGwgeWV0KS4K
ClRoZSBkb3duc2lkZSB3b3VsZCBiZSB0aGF0IGdlbmVyYXRpb24gd291bGQgYmUgbXVjaCBzbG93
ZXIgYW5kIHJlcXVpcmUgbmF0aXZlCmJ1aWxkLgoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgoKPiA+
IEJlc3QgUmVnYXJkcywKCj4gPiBYaWFvIFlhbmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
