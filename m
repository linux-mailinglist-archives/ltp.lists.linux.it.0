Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B48601B232
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:00:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E7C3294AB3
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:00:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CF01C294A7D
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:00:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1555614017C9
 for <ltp@lists.linux.it>; Mon, 13 May 2019 11:00:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F733AEC6;
 Mon, 13 May 2019 09:00:52 +0000 (UTC)
Date: Mon, 13 May 2019 11:00:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20190513090051.GB12685@rei.lan>
References: <20190403152245.GC26464@rei.lan>
 <20190411192534.30525-1-fedebonfi95@gmail.com>
 <20190412143318.GA29856@haruka.lan>
 <874l67x53e.fsf@rpws.prws.suse.cz>
 <8736lrx3xu.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736lrx3xu.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Federico Bonfiglio <fedebonfi95@gmail.com>, ltp@lists.linux.it
Subject: Re: [LTP] NS_* ioctl commands fail in 32bit compat mode (-m32)
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

SGkhCj4gPiBBbGwgdGhlIHRlc3RzIGZhaWwgd2l0aCBzb21ldGhpbmcgc2ltaWxhciB0bzoKPiA+
IGlvY3RsX25zMDEuYzo0NTogRkFJTDogdW5leHBlY3RlZCBpb2N0bCBlcnJvcjogRU5PVFRZCj4g
Pgo+ID4gd2hlbiBjb21waWxlZCB3aXRoIHRoZSAtbTMyIGZsYWcgb24gYXQgbGVhc3QgU1VTRSBr
ZXJuZWwgNC4yMCBhbmQKPiA+IDQuMTIuCj4gPgo+ID4gRG8geW91IGtub3cgaWYgdGhpcyBmZWF0
dXJlIGlzIGV4cGVjdGVkIHRvIHdvcmsgaW4gMzJiaXQgY29tcGF0IG1vZGU/Cj4gPiBNYXliZSB0
aGUgc2l6ZSBvZiB0aGUgYXJndW1lbnRzIHNob3VsZCBiZSBkaWZmZXJlbnQgd2hlbiB1c2luZyAz
MmJpdCBtb2RlPwo+IAo+IEZZSSwgaXQgc2VlbXMgdGhlIHNpemUgb2YgdGhlIGFyZ3VtZW50IGFu
ZCB2YWx1ZSBhcmUgdGhlIHNhbWUgb24gYm90aCAzMmJpdAo+IGFuZCA2NGJpdCBtb2RlIGluIHVz
ZXIgc3BhY2UuCgpNb3N0IGxpa2VseSB0aGVzZSBjYWxscyB3ZXJlIG5vdCBpbXBsZW1lbnRlZCBm
b3IgMzJiaXQgY29tcGF0IG1vZGUKYmVjYXVzZSBub2JvZHkgbmVlZHMgdGhlbSB0aGVyZS4gSSBn
dWVzcyB0aGF0IHRoZSBiZXN0IHNvbHV0aW9uIHdvdWxkIGJlCmp1c3QgcmVwb3J0IFRDT05GIG9u
IEVOT1RUWS4KCkFsc28gaXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRoaXMgc29ydGVkIGJlZm9y
ZSB0aGUgdXBjb21taW5nIHJlbGVhc2UuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5j
egoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
