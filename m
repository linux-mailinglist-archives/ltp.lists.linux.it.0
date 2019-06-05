Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC0C3574E
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 09:02:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6461D3EA68A
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 09:02:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A3CA13EA662
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 09:02:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D05CD201022
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 09:02:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03885ADE0;
 Wed,  5 Jun 2019 07:02:29 +0000 (UTC)
Date: Wed, 5 Jun 2019 09:02:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190605070228.GA778@rei.lan>
References: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
 <20190531083203.GA4224@rei.lan> <20190531094356.GC4224@rei.lan>
 <CAMy_GT-80RtX=qkXJ0NYN-3eY_N+MiH5Xq5iPGm41y=d-n3CAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT-80RtX=qkXJ0NYN-3eY_N+MiH5Xq5iPGm41y=d-n3CAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
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

SGkhCj4gWWVzIHlvdSdyZSByaWdodCwgdGhlIGluc21vZCB0ZXN0IGlzIG5vdCB0aGUgY2F1c2Ug
aGVyZS4KPiAKPiBJIGZvdW5kIGl0J3MgdGhlIGJsb2NrX2RldiB0ZXN0IGZyb20ga2VybmVsX21p
c2MsIHRoZSBsdHBfYmxvY2tfZGV2Cj4gbW9kdWxlIGluc2VydGlvbiB3aWxsIGZpcnN0IHNldCB0
aGUgdGFpbnQgZmxhZyB0byAxMjI4ODoKPiAkIHN1ZG8gaW5zbW9kIGx0cF9ibG9ja19kZXYua28K
PiAkIGNhdCAvcHJvYy9zeXMva2VybmVsL3RhaW50ZWQKPiAxMjI4OAo+IAo+IEJ1dCB0aGUgdGVz
dCB3aWxsIGdlbmVyYXRlIGtlcm5lbCB3YXJuaW5ncyBhbmQgbWFrZSBpdCAxMjgwMAo+ICQgc3Vk
byBybW1vZCBsdHBfYmxvY2tfZGV2Cj4gJCBzdWRvIC4vYmxvY2tfZGV2Cj4gYmxvY2tfZGV2ICAg
IDEgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzEnCj4gYmxvY2tfZGV2ICAgIDIgIFRQQVNTICA6ICBU
ZXN0LWNhc2UgJzInCj4gYmxvY2tfZGV2ICAgIDMgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzMnCj4g
YmxvY2tfZGV2ICAgIDQgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzQnCj4gYmxvY2tfZGV2ICAgIDUg
IFRQQVNTICA6ICBUZXN0LWNhc2UgJzUnCj4gYmxvY2tfZGV2ICAgIDYgIFRQQVNTICA6ICBUZXN0
LWNhc2UgJzYnCj4gYmxvY2tfZGV2ICAgIDcgIFRQQVNTICA6ICBUZXN0LWNhc2UgJzcnCj4gJCBj
YXQgL3Byb2Mvc3lzL2tlcm5lbC90YWludGVkCj4gMTI4MDAKPiAKPiAxMjgwMCA9IDAwMTEwMDEw
MDAwMDAwMDAKPiBUaGUgVyBmbGFnIGlzIGhlcmUuCj4gCj4gVHJhY2VzIGNvdWxkIGJlIGZvdW5k
IGluIGRtZXNnOgo+IGh0dHBzOi8vcGFzdGViaW4udWJ1bnR1LmNvbS9wL2dwOVpESE5qNkovCgpM
b29raW5nIGF0IHRoZSB0ZXN0IGFuZCBhdCB0aGUga2VybmVsIHNvdXJjZSB0aGUgdGVzdCBpcyB0
cmlnZ2VyaW5nCmV4YWN0bHkgdGhlIGNvbmRpdGlvbiBpdCdzIHN1cHBvc2VkIHRvIHRvIHRyaWdn
ZXIgYW5kIHRoZSB3YXJuaW5nIGlzIHRvCmJlIGV4cGVjdGVkLgoKSSBndWVzcyB0aGF0IHRoZSBi
ZXN0IHNvbHV0aW9uIHdvdWxkIGJlIHJ1bm5pbmcgdGhlIGtlcm5lbF9taXNjCnRlc3RjYXNlcyBz
ZXBhcmF0ZWx5IGZyb20gdGhlIHJlc3QuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5j
egoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
