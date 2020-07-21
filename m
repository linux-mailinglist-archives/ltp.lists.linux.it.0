Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 240012278B0
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 08:11:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F99C3C292B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 08:11:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B2F1E3C0886
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 08:11:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CFFB2201368
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 08:11:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AAB9ABD2;
 Tue, 21 Jul 2020 06:11:21 +0000 (UTC)
Date: Tue, 21 Jul 2020 08:11:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200721061113.GA4088@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-5-pvorel@suse.cz>
 <5F15686A.1070605@cn.fujitsu.com> <20200720141547.GB21201@dell5510>
 <5F16545D.4090103@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F16545D.4090103@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/7] net: Update README.md
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

SGkgWWFuZywKCj4gSWYgdGhlc2UgbmFtZSByZXByZXNlbnQgcGFrY2FnZSBuYW1lLCB0aGVyZSBh
cmUgc29tZSBkaWZmZXJuZXRzIGJldHdlZW4KPiBEZWJpYW4vVWJ1bnR1L29wZW5TVVNFIGFuZCBG
ZWRvcmEvUkhFTDoKPiBEZWJpYW4vVWJ1bnR1L29wZW5TVVNFOiBpc2MtZGhjcC1zZXJ2ZXIsIGRu
c21hc3HvvIxhcGFjaGUyLAo+IG5mcy1rZXJuZWwtc2VydmVyLCBycGNiaW5k77yMcnN5bmMsIHRl
bG5ldGQgKyB4aW5ldGQsIHZzZnRwZAo+IFJIRUwvRmVkb3JhOiBkaGNwLCBkbnNtYXNx77yMaHR0
cGQsIG5mcy11dGlsc++8jHJwY2JpbmTvvIxyc3luYywgdGVsbmV0LXNlcnZlciwKPiB2c2Z0cGQK
Cj4gQ291bGQgd2UganVzdCByZXByZXNlbnQgc2VydmljZSBuYW1lOgo+IGRoY3BkKG9yIGlzYy1k
aGNwLXNlcnZlciksIGRuc21hc3EsIGh0dHBkKG9yIGFwYWNoZTIpLCBuZnMtc2VydmVyLCBycGNi
aW5kLAo+IHRlbG5ldC5zb2NrZXQob3IgeGluZXRkKSwgdnNmdHBkCkknZCBlaXRoZXIgd3JvdGUg
c29mdHdhcmUgbmFtZXMgKHBlb3BsZSB3b3VsZCBoYXZlIHRvIGZpbmQgdGhlIHBhY2thZ2UgbmFt
ZSBmb3IKdGhlIGRpc3Rybykgb3IgZmluZCBwYWNrYWdlIG5hbWVzIGZvciBhbGwgZGlzdHJvcyAo
RGViaWFuIC8gVWJ1bnR1LCBPcGVuU1VTRSAvIFNMRVMsCkZlZG9yYSAvIENlbnRPUyAvIFJIRUwg
YXMgaXQncyBpbiBJTlNUQUxMKS4KCkFuZCB0aGVyZSBhcmUgeGluZXRkIHRlc3RzLCBzbyB4aW5l
dGQgYXJlIGFsd2F5cyBuZWVkZWQuCgorIFRoZXJlIGlzIHNvbWUgb3RoZXIgcGFja2FnZXMgbmVl
ZGVkLiBCdXQgaW5zdGVhZCBvZiB3cml0aW5nIGl0IGhlcmUgaXQnZCBiZQpnb29kIHRvIGFkZCBp
dCB0byBtZXRhZGF0YS4gV2UncmUgd29ya2luZyB3aXRoIEN5cmlsIG9uIGRvY3BhcnNlIHByb2pl
Y3QsIHdoaWNoCndpbGwgYXV0b2dlbmVyYXRlIHRoaXMgbWV0YWRhdGEuCgo+IEJUVzogSSBjYW5u
b3QgZmluZCB3aGljaCB0ZXN0IHVzZSByc3luYywgZGlkIEkgbWlzcyBzb21ldGhpbmc/CkNvcnJl
Y3QsIHRoaXMgbG9va3MgbGlrZSBhIGxlZnRvdmVyIGZyb20gdGhlIHBhc3QuIFRoYW5rcyEKCj4g
PiA+ID4gICAgTm90ZTogSWYgYW55IG9mIHRoZSBhYm92ZSBkYWVtb24gaXMgbm90IHJ1bm5pbmcg
b24gc2VydmVyLCB0aGUgdGVzdCByZWxhdGVkIHRvCj4gPiA+ID4gICAgdGhhdCBzZXJ2aWNlIHJ1
bm5pbmcgZnJvbSBjbGllbnQgd2lsbCBmYWlsLgo+ID4gPiA+IC0jIyMgRlRQIHNldHVwCj4gPiA+
ID4gLSogSW4g4oCcL2V0Yy9mdHB1c2Vyc+KAnSBbb3IgdmkgL2V0Yy92c2Z0cGQuZnRwdXNlcnNd
LCBjb21tZW50IHRoZSBsaW5lIGNvbnRhaW5pbmcKPiA+ID4gPiAt4oCccm9vdOKAnSBzdHJpbmcu
IFRoaXMgZmlsZSBsaXN0cyBhbGwgdGhvc2UgdXNlcnMgd2hvIGFyZSBub3QgZ2l2ZW4gYWNjZXNz
IHRvIGRvIGZ0cAo+ID4gPiA+ICsjIyMgRlRQIGFuZCB0ZWxuZXQgc2V0dXAKPiA+ID4gPiArQm90
aCB0ZXN0cyByZXF1aXJlIGVudmlyb25tZW50IHZhcmlhYmxlcyBgUkhPU1RgIChyZW1vdGUgbWFj
aGluZSksIGBSVVNFUmAKPiA+ID4gPiArKHJlbW90ZSB1c2VyKSBhbmQgYFBBU1NXRGAgKHJlbW90
ZSBwYXNzd29yZCkuIE5PVEU6IGBSSE9TVGAgd2lsbCBpbXBseSB0d28gaG9zdAo+ID4gPiA+ICtj
b25maWd1cmF0aW9lIGZvciBvdGhlciB0ZXN0cy4KPiA+ID4gPiArCj4gPiA+ID4gK0lmIGBSSE9T
VGAgaXMgc2V0IHRvIGByb290YCwgZWl0aGVyIG9mIHRoZXNlIHN0ZXBzIGlzIHJlcXVpcmVkOgo+
ID4gPiA+ICsKPiA+ID4gPiArKiBJbiBgL2V0Yy9mdHB1c2Vyc2AgKG9yIGAvZXRjL3ZzZnRwZC5m
dHB1c2Vyc2ApLCBjb21tZW50IHRoZSBsaW5lIGNvbnRhaW5pbmcKPiA+ID4gPiArInJvb3QiIHN0
cmluZy4gVGhpcyBmaWxlIGxpc3RzIGFsbCB0aG9zZSB1c2VycyB3aG8gYXJlIG5vdCBnaXZlbiBh
Y2Nlc3MgdG8gZG8gZnRwCj4gPiA+ID4gICAgb24gdGhlIGN1cnJlbnQgc3lzdGVtLgo+ID4gPiBB
cmUgdGhpcyBmaWxlIGZyb20gRGViaWFuL1VidW50dSBhcyB3ZWxsPwo+ID4gQWdhaW4sIC9ldGMv
ZnRwdXNlcnMgaXMgYXQgbGVhc3QgZm9yIG9wZW5TVVNFIGFuZCBEZWJpYW4vVWJ1bnR1Lgo+ID4g
RmVkb3JhL1JIRUwgaGFzIC9ldGMvdnNmdHBkL2Z0cHVzZXJzIGFuZCAvZXRjL3ZzZnRwZC91c2Vy
X2xpc3QKPiA+IC9ldGMvdnNmdHBkLmZ0cHVzZXJzIGxvb2tzIGxpa2UgdG8gYmUgb24gUkhFTCA0
LyBzb21lIG9sZCBGZWRvcmEuCgo+ID4gVGh1czoKPiA+ICogSW4gYC9ldGMvZnRwdXNlcnNgIChv
ciBgL2V0Yy92c2Z0cGQvZnRwdXNlcnNgIG9yIGAvZXRjL3ZzZnRwZC5mdHB1c2Vyc2ApLAo+ID4g
KiBjb21tZW50IHRoZSBsaW5lIGNvbnRhaW5pbmcKPiA+IC4uLgoKPiBUaGlzIGNoYW5nZSBsb29r
cyBnb29kLiA6LSkKb2suCgo+ID4gSSBhbHNvIHdvbmRlcmVkIGlmIHNldHVwIHNob3VsZCBtZW50
aW9uIHNvbWV0aGluZyByZWxhdGVkIHRvIHNpbmdsZSB0ZXN0LAo+ID4gYnV0IGl0IGRpZG4ndCBo
YXJtLiBJIHdhcyB0aGlua2luZyB3aGV0aGVyIGZ0cCB0ZXN0IGlzIHdvcnRoIHRvIGtlZXAgKGFu
ZCB0aHVzCj4gPiBuZWVkIHRvIGJlIHJld3JpdHRlbiksIGJ1dCB1bmRlcnN0YW5kIGl0J3MgdXNl
ZnVsIGFzIGEgaGlnaCBsZXZlbCBzbW9rZSB0ZXN0Lgo+IDEpIEl0IHNlZW1zIGJldHRlciB0byBt
ZW50aW9uIHNvbWV0aGluZyByZWxhdGVkIHRvIHNpbmdsZSB0ZXN0Lgo+IDIpIFBlcmZlciB0byBr
ZWVwIGFuZCByZXdyaXRlIGZ0cCB0ZXN0Lgpvay4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
