Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A32A28A1
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 23:08:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F5B33C2015
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 23:08:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 77A173C136F
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 23:08:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 66E91140113C
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 23:08:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A533DAC93;
 Thu, 29 Aug 2019 21:08:11 +0000 (UTC)
Date: Thu, 29 Aug 2019 23:08:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20190829210810.GC5711@dell5510>
References: <20190823094621.21747-1-rpalethorpe@suse.com>
 <CAEemH2dVf66_sKT4iBSEOXg+yFhpL7mAp4Uar5OT6vmbiMa0ZQ@mail.gmail.com>
 <871rx5mrhr.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rx5mrhr.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] capability: Introduce capability API
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
Cc: Michael Moese <mmoese@suse.com>, LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmljaGllLAoKPiBIZWxsbyBMaSwKCj4gTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+IHdy
aXRlczoKCj4gPj4gVGhlIGNhcGFiaWxpdHkgd2lsbCBiZSBkcm9wcGVkIGluIGJldHdlZW4gJ3Nl
dHVwJyBhbmQgJ3J1bicuCgo+ID4gSSdtIG5vdCBzdXJlIHRvIHB1dCB0aGlzIGNhcCBmdW5jdGlv
biBiZWhpbmQgJ3NldHVwJyBpcyBhIGJldHRlcgo+ID4gY2hvaWNlLgoKPiA+IEFsdGhvdWdoIGl0
IHByb3ZpZGVzIG1vcmUgY2FwYWJpbGl0eSBpbiBkaWZmZXJlbnQgdGVzdCBwaGFzZSBhbmQgbWFr
ZXMKPiA+IHRlc3QgZmxleGlibGUsIHRoYXQgYWxzbyBpbnZvbHZlcyBtb3JlIGNvbXBsZXhpdHkg
Zm9yIExUUCB1c2VycywKPiA+IHNvbWV0aW1lcyB0ZXN0IG5lZWRzIHRvIHNwYXduIGNoaWxkcmVu
IGluIHRoZSAnc2V0dXAnIGFuZCBkbyBtb3JlCj4gPiB0ZXN0aW5nIGluIG5leHQgJ3J1bicgcGhh
c2UsIHdoaWNoIG9idmlvdXNseSBtYWtlcyB1cyBoYXZlIHRvIGNvbnNpZGVyCj4gPiBtb3JlIGlu
IHRoaXMgY2FzZSB3cml0aW5nLgoKPiBDaGlsZHJlbiB3aWxsIG5lZWQgdG8gZHJvcCBhbmQgY2hl
Y2sgZm9yIHByaXZzIHRoZW1zZWx2ZXMgYW55d2F5IHVubGVzcwo+IG9uZSB1c2VzIGFtYmllbnQg
cHJpdmlsZWdlcyAod2hpY2ggSSBndWVzcyBjb3VsZCBzdGlsbCBiZSBvdmVycmlkZW4gYnkKPiB0
aGUgZW52aXJvbm1lbnQpLgoKPiBNYXliZSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGNoZWNrIGZv
ciBwcml2aWxlZ2VzIGJlZm9yZSBzZXR1cC4gSG93ZXZlcgo+IEkgY2FuJ3QgdGhpbmsgb2YgYSBz
aXR1YXRpb24gd2hlcmUgb25lIHdvdWxkIHdhbnQgdG8gZHJvcCB0aGVtIGJlZm9yZQo+IHNldHVw
LiBNZWFud2hpbGUgaXQgc2VlbXMgbGlrZWx5IHRoYXQgc2V0dXAgcmVxdWlyZXMgcHJpdnMsIGJ1
dCB0aGUgdGVzdAo+IHNob3VsZCBub3QgaGF2ZSB0aGVtLgoKKzEKCk5pY2Ugd29yay4KUmV2aWV3
ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKVGhlcmUgaXMgYSB3YXJuaW5nLCBi
dXQgSSBndWVzcyB0aGF0J3MganVzdCBnY2MgYmVpbmcgcGFyYW5vaWQ6CnRlc3RfZ3VhcmRlZF9i
dWYuYzo5MzoxOiB3YXJuaW5nOiBtaXNzaW5nIGluaXRpYWxpemVyIGZvciBmaWVsZCDigJhjYXBz
4oCZIG9mIOKAmHN0cnVjdCB0c3RfdGVzdOKAmSBbLVdtaXNzaW5nLWZpZWxkLWluaXRpYWxpemVy
c10KICAgOTMgfCB9OwogICAgICB8IF4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHRlc3RfZ3VhcmRl
ZF9idWYuYzoxMjoKLi4vLi4vaW5jbHVkZS90c3RfdGVzdC5oOjIxNDoxODogbm90ZTog4oCYY2Fw
c+KAmSBkZWNsYXJlZCBoZXJlCiAgMjE0IHwgIHN0cnVjdCB0c3RfY2FwICpjYXBzOwogICAgICB8
ICAgICAgICAgICAgICAgICAgXn5+fgoKCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
