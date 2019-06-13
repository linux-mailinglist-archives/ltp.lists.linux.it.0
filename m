Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F143348
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 09:24:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02335294B37
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 09:24:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 67B3A294B0F
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 09:24:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E3A3600FD7
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 09:24:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6459C004BEB
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 07:24:09 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F4E7981C
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 07:24:09 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 13 Jun 2019 09:24:00 +0200
Message-Id: <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
In-Reply-To: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 13 Jun 2019 07:24:09 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] lib: rename ltp_clone_malloc to ltp_clone_alloc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhlcmUgYXJlIG5vIHVzZXJzIG91dHNpZGUgb2YgbGliLgoKU2lnbmVkLW9mZi1ieTogSmFuIFN0
YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS90c3RfY2xvbmUuaCB8IDIg
Ky0KIGxpYi9jbG9uZXIuYyAgICAgICAgfCA4ICsrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9j
bG9uZS5oIGIvaW5jbHVkZS90c3RfY2xvbmUuaAppbmRleCA3ODZjZWU1ZDEyMDkuLmZkNTIwOTdl
MjA3MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS90c3RfY2xvbmUuaAorKysgYi9pbmNsdWRlL3RzdF9j
bG9uZS5oCkBAIC0yOSw3ICsyOSw3IEBAIGludCBsdHBfY2xvbmUodW5zaWduZWQgbG9uZyBmbGFn
cywgaW50ICgqZm4pKHZvaWQgKmFyZyksIHZvaWQgKmFyZywKIAkJc2l6ZV90IHN0YWNrX3NpemUs
IHZvaWQgKnN0YWNrKTsKIGludCBsdHBfY2xvbmU3KHVuc2lnbmVkIGxvbmcgZmxhZ3MsIGludCAo
KmZuKSh2b2lkICphcmcpLCB2b2lkICphcmcsCiAJCXNpemVfdCBzdGFja19zaXplLCB2b2lkICpz
dGFjaywgLi4uKTsKLWludCBsdHBfY2xvbmVfbWFsbG9jKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxh
Z3MsIGludCAoKmZuKSh2b2lkICphcmcpLAoraW50IGx0cF9jbG9uZV9hbGxvYyh1bnNpZ25lZCBs
b25nIGNsb25lX2ZsYWdzLCBpbnQgKCpmbikodm9pZCAqYXJnKSwKIAkJdm9pZCAqYXJnLCBzaXpl
X3Qgc3RhY2tzaXplKTsKIGludCBsdHBfY2xvbmVfcXVpY2sodW5zaWduZWQgbG9uZyBjbG9uZV9m
bGFncywgaW50ICgqZm4pKHZvaWQgKmFyZyksCiAJCXZvaWQgKmFyZyk7CmRpZmYgLS1naXQgYS9s
aWIvY2xvbmVyLmMgYi9saWIvY2xvbmVyLmMKaW5kZXggY2YzNzE4NGFhMjJhLi44NDY5NzQ1ZDAw
NGIgMTAwNjQ0Ci0tLSBhL2xpYi9jbG9uZXIuYworKysgYi9saWIvY2xvbmVyLmMKQEAgLTEzNSwx
MSArMTM1LDExIEBAIHZvaWQgKmx0cF9hbGxvY19zdGFjayhzaXplX3Qgc2l6ZSkKIH0KIAogLyoK
LSAqIGx0cF9jbG9uZV9tYWxsb2M6IGFsc28gZG9lcyB0aGUgbWVtb3J5IGFsbG9jYXRpb24gZm9y
IGNsb25lIHdpdGggYQorICogbHRwX2Nsb25lX2FsbG9jOiBhbHNvIGRvZXMgdGhlIG1lbW9yeSBh
bGxvY2F0aW9uIGZvciBjbG9uZSB3aXRoIGEKICAqIGNhbGxlci1zcGVjaWZpZWQgc2l6ZS4KICAq
LwogaW50Ci1sdHBfY2xvbmVfbWFsbG9jKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIGludCAo
KmZuKSAodm9pZCAqYXJnKSwgdm9pZCAqYXJnLAorbHRwX2Nsb25lX2FsbG9jKHVuc2lnbmVkIGxv
bmcgY2xvbmVfZmxhZ3MsIGludCAoKmZuKSAodm9pZCAqYXJnKSwgdm9pZCAqYXJnLAogCQkgc2l6
ZV90IHN0YWNrX3NpemUpCiB7CiAJdm9pZCAqc3RhY2s7CkBAIC0xNjIsNyArMTYyLDcgQEAgbHRw
X2Nsb25lX21hbGxvYyh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdzLCBpbnQgKCpmbikgKHZvaWQg
KmFyZyksIHZvaWQgKmFyZywKIH0KIAogLyoKLSAqIGx0cF9jbG9uZV9xdWljazogY2FsbHMgbHRw
X2Nsb25lX21hbGxvYyB3aXRoIHByZWRldGVybWluZWQgc3RhY2sgc2l6ZS4KKyAqIGx0cF9jbG9u
ZV9xdWljazogY2FsbHMgbHRwX2Nsb25lX2FsbG9jIHdpdGggcHJlZGV0ZXJtaW5lZCBzdGFjayBz
aXplLgogICogRXhwZXJpZW5jZSB0aHVzIGZhciBzdWdnZXN0cyB0aGF0IG9uZSBwYWdlIGlzIG9m
dGVuIGluc3VmZmljaWVudCwKICAqIHdoaWxlIDYqZ2V0cGFnZXNpemUoKSBzZWVtcyBhZGVxdWF0
ZS4KICAqLwpAQCAtMTcwLDUgKzE3MCw1IEBAIGludCBsdHBfY2xvbmVfcXVpY2sodW5zaWduZWQg
bG9uZyBjbG9uZV9mbGFncywgaW50ICgqZm4pICh2b2lkICphcmcpLCB2b2lkICphcmcpCiB7CiAJ
c2l6ZV90IHN0YWNrX3NpemUgPSBnZXRwYWdlc2l6ZSgpICogNjsKIAotCXJldHVybiBsdHBfY2xv
bmVfbWFsbG9jKGNsb25lX2ZsYWdzLCBmbiwgYXJnLCBzdGFja19zaXplKTsKKwlyZXR1cm4gbHRw
X2Nsb25lX2FsbG9jKGNsb25lX2ZsYWdzLCBmbiwgYXJnLCBzdGFja19zaXplKTsKIH0KLS0gCjEu
OC4zLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
