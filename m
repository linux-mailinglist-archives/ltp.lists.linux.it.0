Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D3C1B21F
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 10:55:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD8A1294AB2
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 10:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B58BC294A6E
 for <ltp@lists.linux.it>; Mon, 13 May 2019 10:55:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 601A914016BD
 for <ltp@lists.linux.it>; Mon, 13 May 2019 10:55:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA56EAB92;
 Mon, 13 May 2019 08:55:21 +0000 (UTC)
Date: Mon, 13 May 2019 10:55:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190513085520.GA12685@rei.lan>
References: <20190412114632.GD28648@haruka.lan>
 <1555481102-4158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513082708.GA9928@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513082708.GA9928@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/getcpu:Add libc sched_getcpu()
 detection &&fix compiler errors
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

SGkhCj4gPiBzY2hlZF9nZXRjcHUoKSBpc24ndCBkZWZpbmVkIG9uIHNvbWUgb2xkIGRpc3Ryb3Ms
IHNvIHdlIGNhbiBhZGQgZGVjdGlvbgo+ID4gYW5kIGZpeCBjb21waWxlciBlcnJvci4KPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+Cj4g
QWNrZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IAo+IEBNZXRhbjogSSdkIGJl
IGZvciBwdXNoaW5nIHRoaXMgYmVmb3JlIG5ldyByZWxlYXNlLgoKQWNrZWQsIHBsZWFzZSBnbyBh
aGVhZC4KCj4gLi4uCj4gPiAgc3RhdGljIGlubGluZSBpbnQgZ2V0X2NwdSh1bnNpZ25lZCAqY3B1
X2lkLAo+ID4gIAkJCSAgdW5zaWduZWQgKm5vZGVfaWQgTFRQX0FUVFJJQlVURV9VTlVTRUQsCj4g
PiAgCQkJICB2b2lkICpjYWNoZV9zdHJ1Y3QgTFRQX0FUVFJJQlVURV9VTlVTRUQpCj4gPiAgewo+
ID4gLSNpZiBkZWZpbmVkKF9faTM4Nl9fKQo+ID4gLQlyZXR1cm4gc3lzY2FsbChfX05SX2dldGNw
dSwgY3B1X2lkLCBub2RlX2lkLCBjYWNoZV9zdHJ1Y3QpOwo+ID4gKyNpZm5kZWYgSEFWRV9TQ0hF
RF9HRVRDUFUKPiA+ICsJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJfZ2V0Y3B1LCBjcHVfaWQsIG5v
ZGVfaWQsIGNhY2hlX3N0cnVjdCk7Cj4gPiAgI2Vsc2UKPiA+ICAJKmNwdV9pZCA9IHNjaGVkX2dl
dGNwdSgpOwo+ID4gICNlbmRpZgo+IAo+IEJUVzogd2hlbiByZXdyaXRpbmcgaW50byBuZXcgQyBB
UEkgKHdoZW5ldmVyIGl0IGhhcHBlbnMpIGl0J2QgYmUgbmljZSB0byB0ZXN0Cj4gYm90aCBzeXNj
YWxsIGFuZCBsaWJjIHNjaGVkX2dldGNwdSgpIChpZiBhdmFpbGFibGUpIHZpYSByZWNlbnRseSBh
ZGRlZCB0ZXN0X3ZhcmlhbnRzIFsxXS4KPiAKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC93aWtpL1Rlc3QtV3Jp
dGluZy1HdWlkZWxpbmVzIzIyMjktdGVzdGluZy1zaW1pbGFyLXN5c2NhbGxzLWluLW9uZS10ZXN0
CgoKU3VyZSwgYnV0IGxldCdzIGFpbSBmb3IgdGhhdCBhZnRlciB0aGUgcmVsZWFzZSBoYXMgYmVl
biBmaW5pc2hlZC4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
