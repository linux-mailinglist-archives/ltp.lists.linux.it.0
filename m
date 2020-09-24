Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF6276C7C
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 10:55:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1D843C4D90
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 10:55:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1245A3C26BC
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 10:55:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D93261000CEE
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 10:55:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DCDAAE19;
 Thu, 24 Sep 2020 08:56:26 +0000 (UTC)
References: <20200609095102.21153-1-liwang@redhat.com> <87pn6cycui.fsf@suse.de>
 <CAEemH2eqPgS=2n5NAgiVgE6Q+mie0=hiu-wn1OCrxPNEHnd1BA@mail.gmail.com>
 <87mu1gy6r8.fsf@suse.de>
 <CAEemH2eCEyebEBZhuQJ+FHs9UpWw_+A=D0vJbx6g8KixPTH4jA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2eCEyebEBZhuQJ+FHs9UpWw_+A=D0vJbx6g8KixPTH4jA@mail.gmail.com>
Message-ID: <87blhvy2ng.fsf@suse.de>
Date: Thu, 24 Sep 2020 09:55:47 +0100
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Reply-To: rpalethorpe@suse.de
Cc: chrubis@suze.cz, pvorel@suze.cz, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPj4gUGVyaGFwcyB5
b3UgbWVhbnQ6Cj4+Cj4+IGlmICh0c3RfaXNfbW91bnRlZCgiY2dyb3VwIikpCj4+ICAgIGNnX3Zl
ciA9IFRTVF9DR1JPVVBfVjE7Cj4+IGVsc2UKPj4gICAgY2dfdmVyID0gVFNUX0NHUk9VUF9WMjsK
Pj4KPgo+IFRoaXMgaXMgbm90IGVub3VnaCBmb3IgdGhlIHZlcnNpb24gY2hvaWNlLiBBcyB0c3Rf
aXNfbW91bnRlZCjigJxjZ3JvdXDigJ0pIGNhbid0Cj4gZGlzdGluZ3Vpc2ggcHJlY2lzZWx5IHdo
YXQgImNncm91cCIgb3IgImNncm91cDIiIGhhcyBiZWVuIG1vdW50ZWQuIEJlY2F1c2UKPiB0aGUg
ZnVuY3Rpb24gaXMgZnV6enkgbWF0Y2hpbmcgYSBzdHJpbmcuCj4+ID4KPj4gPiBUbyBiZSBob25l
c3QsIEkgaG9wZSBhIExpbnV4IGRpc3RyaWJ1dGlvbiBwcm92aWRlcyBhIHB1cmUgd2F5IGluIGNn
cm91cAo+PiA+IHVzaW5nLCB3aGljaCBtZWFucyBqdXN0IG1vdW50aW5nIFYxIG9yIFYyIGJ1dCBu
b3QgdG8gbWl4IHRvZ2V0aGVyLiBPciwgZG8KPj4gPiB5b3UgdGhpbmsgTFRQIHNob3VsZCBoYW5k
bGUgdGhlIHNpdHVhdGlvbiBmb3IgdGhlIHYxJnYyIG1peGluZyBtb3VudD8KPj4KPj4gRm9yIG5v
dywgSSB0aGluayB3ZSBqdXN0IG5lZWQgdG8gdXNlIFYxIGlmIGl0IGlzIG1vdW50ZWQuIEkgZG9u
J3QgbGlrZQo+PiB0aGUgZmFjdCB3ZSBoYXZlIGJvdGggbW91bnRlZCwgYnV0IGl0IHNlZW1zIG1v
c3Qgc29mdHdhcmUgY2FuIGhhbmRsZSBpdCwKPj4gc28gTFRQIHNob3VsZCBhcyB3ZWxsLgo+Pgo+
Cj4gQWdyZWVkLgoKT0ssIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdW5sZXNzIHlvdSBzZW5kIG9uZSBm
aXJzdC4KCi0tIApUaGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
