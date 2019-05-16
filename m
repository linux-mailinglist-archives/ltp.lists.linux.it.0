Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74C2022E
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:07:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A5993EA3E8
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:07:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E655B3EA2DB
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:07:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9C10D1000457
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:07:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0797AD3A;
 Thu, 16 May 2019 09:07:06 +0000 (UTC)
Date: Thu, 16 May 2019 11:07:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190516090705.GA21814@rei.lan>
References: <20190516073826.GA14532@dell5510>
 <1051593197.23090826.1557995723298.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1051593197.23090826.1557995723298.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] Oldest still supported kernel
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

SGkhCj4gPiBJcyBpdCB0aGUgb2xkZXN0IHZlcnNpb24gd2Ugd2FudCB0byBzdXBwb3J0IG9yIGV2
ZW4gc29tZXRoaW5nIG9sZGVyPwo+IAo+IEknZCBsaWtlIG1pbmltdW0gdG8gYmUgYXQgbGVhc3Qg
My4xMC4wIC8gZ2xpYmMtMi4xNyAoUkhFTDcpLgo+IAo+IE9sZGVyIGRpc3Ryb3MgdXNlIExUUCBt
b3N0bHkgZm9yIHJlZ3Jlc3Npb24gdGVzdHMsIHNvIGl0IG1pZ2h0IGJlIGFjY2VwdGFibGUKPiBm
b3IgdXNlcnMgdG8gc3dpdGNoIHRvIG9sZGVyIHJlbGVhc2UgdGFnLCByYXRoZXIgdGhhbiBhbHdh
eXMgbGF0ZXN0IG1hc3Rlci4KPiAKPiBUaGVyZSdzIGFsc28gYW4gb3B0aW9uLCB3ZSBjcmVhdGUg
YSAibGVnYWN5IiBicmFuY2ggZm9yIG9sZCBkaXN0cm9zLAo+IGFuZCBhY2NlcHQgb25seSBjcml0
aWNhbCBmaXhlcyAobm8gbmV3IHRlc3RzLCByZXdyaXRlcywgZXRjLikuIEl0IHdvdWxkCj4gYmUg
dW5zdXBwb3J0ZWQsIGJ1dCBwcm92aWRlIHBsYWNlIHdoZXJlIGxlZ2FjeSB1c2VycyBjYW4gY29v
cGVyYXRlLgoKSSB3YXMgdHJ5aW5nIHRvIGF2b2lkIGhhdmluZyBzZXZlcmFsIGFjdGl2ZSBicmFu
Y2hlcyBmb3IgTFRQIGZvciBzZXZlcmFsCnJlYXNvbnMuIE1haW5seSB0byBhdm9pZCBwZW9wbGUg
cnVubmluZyBvbGQgTFRQIG9uIHJlYXNvbmFibHkgbW9kZXJuCmtlcm5lbHMgYmVjYXVzZSB0aGV5
IHdlcmUgdW5kZXIgYW4gaW1wcmVzc2lvbiB0aGF0IG9sZGVyIHJlbGVhc2UgaXMgbW9yZQpzdGFi
bGUuIEhlbmNlIEkgd291bGQgbGlrZSB0byBhdm9pZCBoYXZpbmcgdGhpcyBpZiBwb3NzaWJsZS4K
Ci0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
