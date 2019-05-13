Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037EA1B1DE
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 10:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2BE6294AB1
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 10:27:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7281C294A36
 for <ltp@lists.linux.it>; Mon, 13 May 2019 10:27:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3CBAA1A01447
 for <ltp@lists.linux.it>; Mon, 13 May 2019 10:27:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64F3DAECD;
 Mon, 13 May 2019 08:27:10 +0000 (UTC)
Date: Mon, 13 May 2019 10:27:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190513082708.GA9928@dell5510>
References: <20190412114632.GD28648@haruka.lan>
 <1555481102-4158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555481102-4158-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IHNjaGVkX2dldGNwdSgpIGlzbid0IGRlZmluZWQgb24gc29tZSBvbGQgZGlzdHJvcywg
c28gd2UgY2FuIGFkZCBkZWN0aW9uCj4gYW5kIGZpeCBjb21waWxlciBlcnJvci4KCj4gU2lnbmVk
LW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KQWNrZWQtYnk6
IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKQE1ldGFuOiBJJ2QgYmUgZm9yIHB1c2hpbmcg
dGhpcyBiZWZvcmUgbmV3IHJlbGVhc2UuCgouLi4KPiAgc3RhdGljIGlubGluZSBpbnQgZ2V0X2Nw
dSh1bnNpZ25lZCAqY3B1X2lkLAo+ICAJCQkgIHVuc2lnbmVkICpub2RlX2lkIExUUF9BVFRSSUJV
VEVfVU5VU0VELAo+ICAJCQkgIHZvaWQgKmNhY2hlX3N0cnVjdCBMVFBfQVRUUklCVVRFX1VOVVNF
RCkKPiAgewo+IC0jaWYgZGVmaW5lZChfX2kzODZfXykKPiAtCXJldHVybiBzeXNjYWxsKF9fTlJf
Z2V0Y3B1LCBjcHVfaWQsIG5vZGVfaWQsIGNhY2hlX3N0cnVjdCk7Cj4gKyNpZm5kZWYgSEFWRV9T
Q0hFRF9HRVRDUFUKPiArCXJldHVybiB0c3Rfc3lzY2FsbChfX05SX2dldGNwdSwgY3B1X2lkLCBu
b2RlX2lkLCBjYWNoZV9zdHJ1Y3QpOwo+ICAjZWxzZQo+ICAJKmNwdV9pZCA9IHNjaGVkX2dldGNw
dSgpOwo+ICAjZW5kaWYKCkJUVzogd2hlbiByZXdyaXRpbmcgaW50byBuZXcgQyBBUEkgKHdoZW5l
dmVyIGl0IGhhcHBlbnMpIGl0J2QgYmUgbmljZSB0byB0ZXN0CmJvdGggc3lzY2FsbCBhbmQgbGli
YyBzY2hlZF9nZXRjcHUoKSAoaWYgYXZhaWxhYmxlKSB2aWEgcmVjZW50bHkgYWRkZWQgdGVzdF92
YXJpYW50cyBbMV0uCgpLaW5kIHJlZ2FyZHMsClBldHIKClsxXSBodHRwczovL2dpdGh1Yi5jb20v
bGludXgtdGVzdC1wcm9qZWN0L2x0cC93aWtpL1Rlc3QtV3JpdGluZy1HdWlkZWxpbmVzIzIyMjkt
dGVzdGluZy1zaW1pbGFyLXN5c2NhbGxzLWluLW9uZS10ZXN0CgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
