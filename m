Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7EAFAD0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:51:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDC8E3EA140
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 15:51:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CC13D3EA140
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:51:23 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 86E68600F47
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 15:51:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B81753092666;
 Tue, 30 Apr 2019 13:51:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFA744BF;
 Tue, 30 Apr 2019 13:51:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A544A3FA45;
 Tue, 30 Apr 2019 13:51:21 +0000 (UTC)
Date: Tue, 30 Apr 2019 09:51:18 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <578696332.20195422.1556632278327.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190430133836.28400-1-chrubis@suse.cz>
References: <20190430133836.28400-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: testcases.mk: Fix libs/ path for out-of-tree build
Thread-Index: 06kncYjmdorOsnZmEdqo0/yq9tLOYw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 13:51:21 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] testcases.mk: Fix libs/ path for out-of-tree
	build
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBUaGUgcGF0aCB0byB0aGUgTWFrZWZpbGUg
d2FzIG5vdCBjb3JyZWN0IGZvciB0aGUgb3V0LW9mLXRyZWUgYnVpbGQKPiBiZWNhdXNlIGl0IHdh
cyBwb2ludGluZyB0byB0aGUgYnVpbGQgZGlyZWN0b3J5IHJhdGhlciB0aGFuIHRvIHRoZSBzb3Vy
Y2UKPiBkaXJlY3RvcnkuCj4gCj4gQXBwYXJlbnRseSB0aGlzIGFsc28gY2F1c2VkIHJhbmRvbSBm
YWlsdXJlcyBmb3Igb3V0LW9mLXRyZWUgYnVpbGQuIEZvcgo+IHNvbWUgcmVhc29uIHdoZW4gYnVp
bGRpbmcgc3lzY2FsbHMvc2V0X21lbXBvbGljeS8gdGVzdGNhc2VzIHRoZSByZWJ1aWxkCj4gb2Yg
dGhlIGxpYmx0cG51bWEuYSBsaWJyYXJ5IGlzIHRyaWdnZXJlZCBmb3Igb3V0LW9mLXRyZWUgYnVp
bGQgZm9yIGFib3V0Cj4gMTAlIG9mIHRoZSBjYXNlcyBvbiBtYXNzaXZlbHkgcGFyYWxsZWwgYnVp
bGQuIFdoaWNoIGFzIGZhciBhcyBJIGNhbiB0ZWxsCj4gc2hvdWxkbid0IGhhcHBlbiBzaW5jZSB3
ZSBidWlsZCBldmVyeXRoaW5nIGluIHRoZSBsaWJzLyBkaXJlY3RvcnkgYXMgYQo+IHByZXJlcXVp
c2l0ZSBvZiB0aGUgdGVzdGNhc2VzLyBkaXJlY3RvcnkuIFNvIHRoZXJlIGlzIGxpa2VseSBzb21l
Cj4gc3RyYW5nZSByYWNlIGNvbmRpdGlvbiBoYXBwZW5pbmcgYW5kIHdoaWxlIHRoaXMgZG9lcyBu
b3QgZml4IHRoZSBhY3R1YWwKPiByYWNlIGl0IG1ha2VzIGl0IHF1aXRlIGhhcm1sZXNzIHNpbmNl
IHRoZSB0YXJnZXQgd2FzIGFscmVhZHkgYnVpbGQgYW5kCj4gdGhlIG1ha2UgaW4gdGhlIGxpYnMv
bGlibHRwbnVtYS8gZGlyZWN0b3J5IHdpbGwgYmUgbm8tb3AuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gQ0M6IFBldHIgVm9yZWwgPHB2b3JlbEBz
dXNlLmN6Pgo+IENDOiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KCkFja2VkLWJ5
OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIGluY2x1ZGUvbWsv
dGVzdGNhc2VzLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsgYi9p
bmNsdWRlL21rL3Rlc3RjYXNlcy5tawo+IGluZGV4IDEzMTg1NGVjNy4uNjg0NjU1ZmJmIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbWsvdGVzdGNhc2VzLm1rCj4gKysrIGIvaW5jbHVkZS9tay90ZXN0
Y2FzZXMubWsKPiBAQCAtNDksNyArNDksNyBAQCBMVFBMSUJTX0ZJTEVTID0gJChhZGRzdWZmaXgg
LmEsICQoYWRkcHJlZml4Cj4gJChhYnNfdG9wX2J1aWxkZGlyKS9saWJzLywgJChmb3JlYWNoCj4g
IE1BS0VfREVQUyArPSAkKExUUExJQlNfRklMRVMpCj4gIAo+ICAkKExUUExJQlNfRklMRVMpOiAk
KExUUExJQlNfRElSUykKPiAtCSQoTUFLRSkgLUMgIiReIiAtZiAiJF4vTWFrZWZpbGUiIGFsbAo+
ICsJJChNQUtFKSAtQyAiJF4iIC1mICIkKHN1YnN0Cj4gJChhYnNfdG9wX2J1aWxkZGlyKSwkKGFi
c190b3Bfc3JjZGlyKSwkXikvTWFrZWZpbGUiIGFsbAo+ICAKPiAgTERGTEFHUyArPSAkKGFkZHBy
ZWZpeCAtTCQodG9wX2J1aWxkZGlyKS9saWJzL2xpYiwgJChMVFBMSUJTKSkKPiAgCj4gLS0KPiAy
LjE5LjIKPiAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
