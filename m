Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69493291C4
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:30:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3679C3EA641
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:30:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8A7C53EA606
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:30:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 54C38602A02
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:30:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B51DAEC6;
 Fri, 24 May 2019 07:30:47 +0000 (UTC)
Date: Fri, 24 May 2019 09:30:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190524073045.GA29592@dell5510>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510> <20190515134245.GC5429@dell5510>
 <20190524044850.x6adkl6uen5tgeqw@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524044850.x6adkl6uen5tgeqw@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

SGkgTXVycGh5LAoKPiA+ID4gKwlTQUZFX01LRElSKE9WTF9MT1dFUiIvIkRJUl9OQU1FLCAwNzU1
KTsKPiA+ID4gKwlTQUZFX1RPVUNIKE9WTF9MT1dFUiIvIkRJUl9OQU1FIi8iRklMRV9OQU1FLCAw
NjQ0LCBOVUxMKTsKPiA+ID4gKwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVy
bGF5IiwgMCwgImxvd2VyZGlyPSJPVkxfTE9XRVIKPiA+ID4gKwkJICAgICIsdXBwZXJkaXI9Ik9W
TF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dPUkspOwo+ID4gPiAgCWlmIChyZXQgPCAwKSB7Cj4gPiA+
ICAJCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKPiA+ID4gIAkJCXRzdF9icmsoVENPTkYsCj4gPiBJ
biBoZXJlIGluIGlub3RpZnkwNy5jIGFuZCBpbiBpbm90aWZ5MDguYyB5b3UgY3JlYXRlIGRpcnMg
KDAgcGFyYW1ldGVyKSBmb3IgYmVjYXVzZSB5b3UgaXQncwo+ID4gbmVlZGVkIHRvIGNyZWF0ZSBt
b3JlIGRpcnMuIFRoYW4gdGhlIHJlc3QgKG1vdW50LCBUQ09ORiBvbiBFTk9ERVYsIFRCUk9LCj4g
PiBvdGhlcndpc2UpIGlzIHN0aWxsIGNvcHkgcGFzdGVkLiBJIHdvbmRlciBob3cgdG8gbW92ZSBl
dmVyeXRoaW5nIGludG8KPiA+IHNldHVwX292ZXJsYXkoKSBoZWxwZXIuIE1heWJlIHN0cnVjdCB3
aXRoIGZpbGVzIG9yIGRpcmVjdG9yaWVzIGFuZCBwZXJtaXNzaW9ucwoKPiBJZiB3ZSBkZWZpbmUg
YSBzdHJ1Y3QgdG8gcHV0IG5hbWVzIGFtZCBtb2RlcyBpbiBpdCB0aGVuIHBhc3MgdG8gaGVscGVy
LCB3ZQo+IHN0aWxsIG5lZWQgdG8gd3JpdGUgYWxsIHRoZXNlIE9WTCBtYWNyb3MgaW4gdGhlIHRl
c3RjYXNlIHRvIGRlZmlsZSB0aGUgc3RydWN0Lgo+IFNvIHdlIG5lZWQgdG8gd3JpdGUgYWxsIHRo
ZSBfc2FtZV8gbWFjcm9zIGluIGV2ZXJ5IHRlc3RjYXNlIHdoZXJlIG5lZWRlZC4KCj4gSW4gdGhp
cyBjYXNlLCBpdCdzIGFnYWluc3QgbXkgaW50ZW50aW9uIG9mIHRoaXMgcGF0Y2g6IGRlZHVwZSBk
dXBsaWNhdGVkIGxpbmVzLgpTdXJlLCBEUlkgaXMgaW50ZW50aW9uIDopLgoKPiBZb3VyIHN0cnVj
dCBpZGVhIGlzIGdyZWF0IHdoZW4gaGFuZGxpbmcgdGhlIGRpZmZlcmVudCBmaWxlcyB0aGF0IG5l
ZWQgdG8gYmUKPiBjcmVhdGVkIGluIGRpZmZlcmVudCB0ZXN0Y2FzZXMuIEhvd2V2ZXIgSSdkIGxp
a2UgdG8gZG8gaXQgaW4gYSBzaW1wbGVyIHdheS4KPiBPbmx5IG1ha2UgbmVjZXNzYXJ5IGRpcnMg
aW4gdGhlIGhlbHBlciwgbGV0IHRoZSB0ZXN0Y2FzZXMgdG8gY3JlYXRlIHRoZSBvdGhlcgo+IGRp
cnMgdGhleSB3YW50IHRoZW1zZWx2ZXMuCkkgYWdyZWUgd2l0aCBBbWlyIFsxXSB0aGF0IG15IG9y
aWdpbmFsIGFwcHJvYWNoIFsyXTogdG8gYWRkCmNyZWF0ZV9vdmVybGF5X2RpcnMoKSBhbmQgbW91
bnRfb3ZlcmxheSgpIGlzIGJldHRlciBhcyBpdCBhZGRzIG1vcmUgZmxleGliaWxpdHkKSSdsbCBy
ZWNhcCBteSBzdWdnZXN0aW9ucyBpbiB2MS4KCj4gVGhhbmtzLAo+IE11cnBoeQoKS2luZCByZWdh
cmRzLApQZXRyCgpbMV0gaHR0cDovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAxOS1N
YXkvMDExOTgzLmh0bWwKWzJdIGh0dHA6Ly9saXN0cy5saW51eC5pdC9waXBlcm1haWwvbHRwLzIw
MTktTWF5LzAxMTk3OS5odG1sCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
