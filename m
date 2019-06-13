Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846943701
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 15:57:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CBB53EA2FF
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 15:57:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7EE833EA2B3
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 15:57:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D7A21001753
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 15:57:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AE408AC4E;
 Thu, 13 Jun 2019 13:57:42 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:57:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190613135740.GB29926@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
 <CAEemH2f_oMYubEDLdOmhxrEguKkc+3smx682LF7D9uiwZ26OAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f_oMYubEDLdOmhxrEguKkc+3smx682LF7D9uiwZ26OAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 2/3] lib: rename ltp_clone_malloc to
 ltp_clone_alloc
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

SGkhCj4gPiBAQCAtMTcwLDUgKzE3MCw1IEBAIGludCBsdHBfY2xvbmVfcXVpY2sodW5zaWduZWQg
bG9uZyBjbG9uZV9mbGFncywgaW50Cj4gPiAoKmZuKSAodm9pZCAqYXJnKSwgdm9pZCAqYXJnKQo+
ID4gIHsKPiA+ICAgICAgICAgc2l6ZV90IHN0YWNrX3NpemUgPSBnZXRwYWdlc2l6ZSgpICogNjsK
PiA+Cj4gPiAtICAgICAgIHJldHVybiBsdHBfY2xvbmVfbWFsbG9jKGNsb25lX2ZsYWdzLCBmbiwg
YXJnLCBzdGFja19zaXplKTsKPiA+ICsgICAgICAgcmV0dXJuIGx0cF9jbG9uZV9hbGxvYyhjbG9u
ZV9mbGFncywgZm4sIGFyZywgc3RhY2tfc2l6ZSk7Cj4gPiAgfQo+ID4KPiAKPiBUaGVyZSBpcyBh
bm90aGVyIGxlZ2FjeSBwcm9ibGVtIG1heWJlIHdlIG5lZWQgdGFrZSBjYXJlLgo+IAo+IEFueSB0
aG91Z2h0IGFib3V0IGhvdyByZWxlYXNpbmcgdGhlIHN0YWNrIG1lbW9yeVsxXSBhZnRlciBjYWxs
aW5nCj4gbHRwX2Nsb25lX3F1aWNrKCkgaW4gYSB0ZXN0Pwo+IAo+IFsxXSB3aGljaCBhbGxvY2F0
ZWQgbWVtb3J5IGluIGx0cF9jbG9uZV9hbGxvYygpLgoKV2VsbCwgd2UgY2FuIGZyZWUgdGhlIG1l
bW9yeSBpbiBsdHBfY2xvbmVfYWxsb2MoKSBpZiB0aGUgY2hpbGQgcnVucyBpbiBhCnNlcGFyYXRl
IG1lbW9yeSBzcGFjZSwgYnV0IGlmIENMT05FX1ZNIHdhcyBwYXNzZWQgaW4gZmxhZ3MgdGhlcmUg
aXMgbm8Kd2F5IGhvdyB0byBmcmVlIHRoZSBtZW1vcnkuLi4KCi0tIApDeXJpbCBIcnViaXMKY2hy
dWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
