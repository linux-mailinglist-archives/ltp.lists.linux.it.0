Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7236030
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 17:18:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B83C3EA6A0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 17:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1645D3EA53C
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:18:40 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C2591A0123D
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:18:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50594AE52;
 Wed,  5 Jun 2019 15:18:38 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:18:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190605151838.GA15712@dell5510>
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190605072126.19856-2-pvorel@suse.cz>
 <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
 <20190605141613.GA3965@dell5510>
 <CAEemH2fLHFmNL57Hm5oU8MNoUN72brqz7fO-fOY_GGTxrAEpPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fLHFmNL57Hm5oU8MNoUN72brqz7fO-fOY_GGTxrAEpPQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/2] inotify: Add SAFE_MYINOTIFY_ADD_WATCH() helper
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

SGksCgo+ID4gPiBJZiB0ZXN0IGV4aXQgd2l0aCBUQlJPSyB0aGUgcmVhcF93ZCB3aWxsIG5ldmVy
IGdldCBhIGNoYW5jZSB0byBzZXQgYXMgMSwKPiA+ID4gYW5kIHRoZSBjbGVhbnVwKCkgYWxzbyBt
YWtlIG5vIHNlbnNlIGluIHRzdF9icmsoKSBjYWxsaW5nLgo+ID4gTm8sIHRoYXQncyBhICJmbGFn
IiBmb3IgY2xlYW51cCBmdW5jdGlvbiB3aGljaCBpcyBydW4gYWx3YXlzIChubyBtYXR0ZXIKPiA+
IHdoZXRoZXIKPiA+IHRzdF9icmsoKSB3YXMgY2FsbGVkKS4gU2VlIGNsZWFudXAoKSBhbmQgbW91
bnRfZmxhZyBpbiBbMV0uCgoKPiBZb3UgYXJlIHJpZ2h0LiBBbmQgc2VlbXMgdGhlIHByb2JsZW0g
aXMgb25seSBleGlzdCBpbiBvcmlnaW5hbCBjb2RlLCBpdCBwdXQKPiByZWFwX3dkIGluIHdyb25n
IHBsYWNlIGFuZCBtaXNsZWFkIG15IHNpZ2h0LgoKPiAgICAgICAgaWYgKCh3ZCA9IG15aW5vdGlm
eV9hZGRfd2F0Y2goZmRfbm90aWZ5LCBESVJfUEFUSCwgSU5fQUxMX0VWRU5UUykpIDwKPiAwKSB7
Cj4gICAgICAgICAgICAgICAgdHN0X2JyayhUQlJPSyB8IFRFUlJOTywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICJpbm90aWZ5X2FkZF93YXRjaCAoJWQsICIgRElSX1BBVEggIiwgSU5fQUxMX0VW
RU5UUykKPiBmYWlsZWQiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgZmRfbm90aWZ5KTsKPiAg
ICAgICAgICAgICAgICByZWFwX3dkID0gMTsKPiAgICAgICAgfTsKCnNvIEknbGwgcHV0IGludG8g
Y29tbWl0IG1lc3NhZ2U6CgogICAgQWxzbyBwdXQgcmVhcF93ZCB0byBjb3JyZWN0IHBsYWNlIGlu
IGlub3RpZnkwWzEyN10uYwogICAgKGluIG9yaWdpbmFsIGNvZGUgaXQgd2FzIGluIGlmIGNsYXVz
ZSBhZnRlciB0c3RfYnJrKCkgc28gaXQgd2FzCiAgICAxKSB1bnJlYWNoYWJsZSAyKSBmb3IgZGV0
ZWN0aW9uIGl0IHNob3VsZCBoYXZlIGJlZW4gYWZ0ZXIgaWYgKG91dHNpZGUpLgoKICAgIEZpeGVz
OiAwNGYyMTc3YjYsIGlub3RpZnkwWzEyXS5jLCA3NjNkMDI4MjQgKGlub3RpZnkwNy5jKQoKQWNr
ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgoKS2luZCByZWdhcmRzLApQZXRyCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
