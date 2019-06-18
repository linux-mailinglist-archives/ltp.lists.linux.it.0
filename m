Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAF498BC
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 07:51:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E3F6294B12
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 07:51:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9B4B83EA3C6
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 07:51:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4102A1A008AA
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 07:51:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1DF6AE1F;
 Tue, 18 Jun 2019 05:51:20 +0000 (UTC)
Date: Tue, 18 Jun 2019 07:51:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190618055119.GA13571@x230>
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190617214901.GC19347@x230>
 <CAEemH2cAFUkmmiokVwvC5YvT1QoXaANxtCjFypnYS309ietX0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cAFUkmmiokVwvC5YvT1QoXaANxtCjFypnYS309ietX0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
 structure
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

SGkgTGksCgo+ID4gPiBUZXN0Y2FzZXMgZm9yIHNwZWNpZmllZCBhcmNoIHNob3VsZCBiZSBsaW1p
dGVkIG9uIHRoYXQgb25seSBiZWluZwo+ID4gc3VwcG9ydGVkCj4gPiA+IHBsYXRmb3JtIHRvIHJ1
biwgd2Ugbm93IGNyZWF0ZSBhIGZ1bmN0aW9uIHRzdF9vbl9hcmNoIHRvIGFjaGlldmUgdGhpcyBu
ZXcKPiA+ID4gZmVhdHVyZSBpbiBMVFAgbGlicmFyeS4gIEFsbCB5b3UgbmVlZCB0byBydW4gYSB0
ZXN0IG9uIHRoZSBleHBlY3RlZCBhcmNoCj4gPiBpcwo+ID4gPiB0byBzZXQgdGhlICcuYXJjaCcg
c3RyaW5nIGluIHRoZSAnc3RydWN0IHRzdF90ZXN0JyB0byBjaG9vc2UgdGhlIHJlcXVpcmVkCj4g
PiA+IGFyY2ggbGlzdC4gZS5nLiAnLmFyY2ggPSAieDg2XzY0IGkzODYiJy4KPiA+IEp1c3Qgb25l
IG5vdGUsIHN0cmluZ3MgYXJlIGVycm9yIHByb25lLiBJIHdvbmRlciBpZiBkZWZpbmluZyBjb25z
dGFudHMgYW5kCj4gPiB1c2luZwo+ID4gYXJyYXkgd291bGQgYmUgdG9vIGNvbXBsaWNhdGVkIGZv
ciB0aGlzIHVzZSBjYXNlLgoKCj4gSSB0aG91Z2h0IGFib3V0IHRoYXQgYXJyYXkgd2F5LCBidXQg
aXQgc2VlbXMgYSBiaXQgY29tcGxpY3RlZCBpbiB1c2luZy4KPiBZZXMsIHN0cmluZ3MgYXJlIGVh
c3kgdG8gaW52b2x2ZSB0eXBvIGJ1dCB3ZSBjYW4gbWFrZSBhIGNoZWNrIGluIGxpYnJhcnkuCk9L
LCBhZ3JlZSA6KS4KCj4gVGhhbmtzIGZvciByZXZpZXcuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
