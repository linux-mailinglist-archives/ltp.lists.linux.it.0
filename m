Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA892FAD7
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:52:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9061B3EACAA
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:52:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4D1EE3EA140
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:52:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F3D311A00CD0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:52:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36267AC44;
 Tue, 30 Apr 2019 13:52:31 +0000 (UTC)
Date: Tue, 30 Apr 2019 15:52:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190430135229.GB7752@dell5510>
References: <20190430133836.28400-1-chrubis@suse.cz>
 <20190430133836.28400-2-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430133836.28400-2-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] Makefile: Fix target redefinition
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

SGksCgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIGEgcnVsZSBmb3IgdGhlIGxpYnMgZGlyZWN0
b3J5IGJlY2F1c2UgdGhlcmUgaXMgYQo+IGdlbmVyaWMgcnVsZSBmb3IgZGlyZWN0b3J5IGNyZWF0
aW9uIGFscmVhZHkuIEFsbCB3ZSBuZWVkIHRvIGRvIGlzIHRvCj4gbWFrZSB0aGUgbGlicy1hbGwg
dGFyZ2V0IGRlcGVuZCBvbiB0aGUgZGlyZWN0b3J5IHBhdGgsIHdoaWNoIHdlIGRvCj4gYWxyZWFk
eSBzbyB0aGF0IHRoZSBkaXJlY3RvcnkgaXMgY3JlYXRlZCBiZWZvcmUgd2UgYXR0ZW1wdCB0byBl
eGVjdXRlCj4gbWFrZSB0aGVyZS4KCj4gRml4ZXM6IDE3YTViMGZiNjNiZjY1ZWZmNDMzYmRlZTNi
ZjVmNzM4MjZhNTBlMGYKCj4gU2lnbmVkLW9mZi1ieTogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1
c2UuY3o+Cj4gQ0M6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IENDOiBKYW4gU3RhbmNl
ayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KPiAtLS0KVGVzdGVkLWJ5OiBQZXRyIFZvcmVsIDxwdm9y
ZWxAc3VzZS5jej4KVGhlIHNhbWUgYXMgcHJldmlvdXMgcGF0Y2ggKHRlc3RpbmcgYm90aCB0b2dl
dGhlcikuCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gIE1ha2VmaWxlIHwgMyAtLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2Vm
aWxlCj4gaW5kZXggYzQ2ZDA1MGNlLi43NjhjYTQ2MDYgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUK
PiArKysgYi9NYWtlZmlsZQo+IEBAIC0xMDIsOSArMTAyLDYgQEAgJChzb3J0ICQoYWRkcHJlZml4
ICQoYWJzX3RvcF9idWlsZGRpcikvLCQoQk9PVFNUUkFQX1RBUkdFVFMpKSAkKElOU1RBTExfRElS
KSAkKEQKPiAgIyMgUGF0dGVybiBiYXNlZCBzdWJ0YXJnZXQgcnVsZXMuCj4gIGxpYi1pbnN0YWxs
OiBsaWItYWxsCgo+IC0kKGFic190b3BfYnVpbGRkaXIpL2xpYnM6Cj4gLQlta2RpciAtbSAwMDc1
NSAtcCAiJEAiCj4gLQo+ICBsaWJzLWFsbDogJChhYnNfdG9wX2J1aWxkZGlyKS9saWJzCgo+ICAk
KE1BS0VfVEFSR0VUUykgaW5jbHVkZS1hbGwgbGliLWFsbCBsaWJzLWFsbDoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
