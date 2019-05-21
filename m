Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA824E4C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:46:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 375613EA767
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 13:46:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6EE8A3EA2E0
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:46:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 69364600BDB
 for <ltp@lists.linux.it>; Tue, 21 May 2019 13:46:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B90EAF3E;
 Tue, 21 May 2019 11:46:30 +0000 (UTC)
Date: Tue, 21 May 2019 13:46:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190521114629.GC13910@rei>
References: <20190520041730.28238-1-sspatil@android.com>
 <20190520041730.28238-2-sspatil@android.com>
 <20190520095356.GB25405@rei.lan> <20190521044001.GB7753@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521044001.GB7753@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 1/1] open_posix_testsuite/pthread_sigmask: fix
 return value checks
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

SGkhCj4gPiBUaGUgZXJyb3IoMykgaXMgR05VIGV4dGVuc2lvbiB3ZSBjYW5ub3QgdXNlIGl0IGlu
IGEgUE9TSVggdGVzdHN1aXRlIGFzCj4gPiBzdWNoLCBJIGd1ZXNzIHRoYXQgd2Ugd2lsbCBoYXZl
IHRvIGFkZCBjdXN0b20gZXJyb3IgcmVwb3J0aW5nIGZ1bmN0aW9ucwo+ID4gKGluIGEgc2VwYXJh
dGUgcGF0Y2gpIHRvIHRoZSBvcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9pbmNsdWRlL3Bvc2l4dGVzdC5o
Cj4gPiBoZWFkZXIuLi4KPiA+IAo+ID4gT3RoZXIgdGhhbiB0aGF0IHRoZSBwYXRjaCBpcyBvYnZp
b3VzbHkgY29ycmVjdC4KPiAKPiBUaGFua3MgeW91IHdhbnQgbWUgdG8gYWRkIGFuIGVycm9yKDMp
LWxpa2UgZnVuY3Rpb24gdGhlcmU/Cj4gSSBndWVzcyBJIGNhbiBkbyB0aGF0IGFuZCB0aGVuIHN0
YXJ0IGNoYW5naW5nIGFsbCB0ZXN0cy4KCklmIHlvdSB0aGluayB0aGF0IGVycm9yKDMpIGxpa2Ug
QVBJIGlzIGJlc3QgZml0IHRoZW4gd2UgY2FuIGdvIGFoZWFkIGFuZAp1c2UgaXQgZm9yIHBvc2l4
IHRlc3RzdWl0ZS4gWW91IGNhbiBhbHNvIHRoaW5rIGFib3V0IGl0IGEgYml0IGFuZCBtYXliZQpj
cmVhdGUgc29tZXRoaW5nIHRoYXQgd2lsbCBmaXQgdGhlIHB1cnBvc2Ugc2xpZ2h0bHkgYmV0dGVy
LgoKT25seSB0aGluZyBJIHdvdWxkIGhhdmUgYXZvaWRlZCBpcyB0byBnaXZlIHRoZSBmdW5jdGlv
biBuYW1lcyB0aGF0IGFyZQpsaWtlbHkgdG8gY29sbGlkZSB3aXRoIHRlc3QgY29kZS4gSSB3b3Vs
ZCBleHBlY3QgdGhhdCB0aGVyZSBhcmUgc2V2ZXJhbAp0ZXN0cyB0aGF0IHVzZSBlcnJvciBhcyBh
IHZhcmlhYmxlLCBzbyBpZiB3ZSBkZWNpZGUgdG8gbmFtZSB0aGUgZnVuY3Rpb24KdGhhdCB3YXkg
d2Ugc2hvdWxkIHByZWZpeCBpdCB3aXRoIHB0c18gZS5nLiBwdHNfZXJyb3IoKS4KCi0tIApDeXJp
bCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
