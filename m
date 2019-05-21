Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418524A45
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 10:25:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00577390243
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 10:25:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C33B929879C
 for <ltp@lists.linux.it>; Tue, 21 May 2019 10:25:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8EB666002E7
 for <ltp@lists.linux.it>; Tue, 21 May 2019 10:25:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E42F3082E69
 for <ltp@lists.linux.it>; Tue, 21 May 2019 08:25:22 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0B4E5D9D5;
 Tue, 21 May 2019 08:25:21 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 21 May 2019 10:25:18 +0200
Message-Id: <dc7300409a949189aa4ce9ef555405e36bdb50ab.1558426636.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 21 May 2019 08:25:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH] overcommit_memory: update for "mm: fix false-positive
	OVERCOMMIT_GUESS failures"
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

Y29tbWl0IDhjNzgyOWIwNGM1MiAoIm1tOiBmaXggZmFsc2UtcG9zaXRpdmUgT1ZFUkNPTU1JVF9H
VUVTUyBmYWlsdXJlcyIpCmNoYW5nZXMgbG9naWMgb2YgX192bV9lbm91Z2hfbWVtb3J5KCksIHNp
bXBsaWZ5aW5nIGl0IHRvOgogICAgV2hlbiBpbiBHVUVTUyBtb2RlLCBjYXRjaCB3aWxkIGFsbG9j
YXRpb25zIGJ5IGNvbXBhcmluZyB0aGVpciByZXF1ZXN0CiAgICBzaXplIHRvIHRvdGFsIGFtb3Vu
dCBvZiByYW0gYW5kIHN3YXAgaW4gdGhlIHN5c3RlbS4KClRlc3RjYXNlIGN1cnJlbnRseSBhbGxv
Y2F0ZXMgbWVtX3RvdGFsICsgc3dhcF90b3RhbCwgd2hpY2ggZG9lc24ndCB0cmlnZ2VyCm5ldyBj
b25kaXRpb24uIE1ha2UgaXQgbW9yZSBleHRyZW1lLCBidXQgYXNzdW1pbmcgZnJlZV90b3RhbCAv
IDIgd2lsbCBQQVNTLAphbmQgc3VtX3RvdGFsICogMiB3aWxsIEZBSUwuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVs
L21lbS90dW5hYmxlL292ZXJjb21taXRfbWVtb3J5LmMgfCAxMSArKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL21lbS90dW5hYmxlL292ZXJjb21taXRfbWVtb3J5LmMgYi90ZXN0Y2Fz
ZXMva2VybmVsL21lbS90dW5hYmxlL292ZXJjb21taXRfbWVtb3J5LmMKaW5kZXggNTU1Mjk4ZmJm
ZDg1Li4zNDU3NjRkZmU0MjcgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3R1bmFi
bGUvb3ZlcmNvbW1pdF9tZW1vcnkuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS90dW5hYmxl
L292ZXJjb21taXRfbWVtb3J5LmMKQEAgLTM2LDExICszNiwxMCBAQAogICoKICAqIFRoZSBwcm9n
cmFtIGlzIGRlc2lnbmVkIHRvIHRlc3QgdGhlIHR3byB0dW5hYmxlczoKICAqCi0gKiBXaGVuIG92
ZXJjb21taXRfbWVtb3J5ID0gMCwgYWxsb2NhdGFibGUgbWVtb3J5IGNhbid0IG92ZXJleHRlbmRz
Ci0gKiB0aGUgYW1vdW50IG9mIGZyZWUgbWVtb3J5LiBJIGNob29zZSB0aGUgdGhyZWUgY2FzZXM6
CisgKiBXaGVuIG92ZXJjb21taXRfbWVtb3J5ID0gMCwgYWxsb2NhdGFibGUgbWVtb3J5IGNhbid0
IG92ZXJleHRlbmQKKyAqIHRoZSBhbW91bnQgb2YgdG90YWwgbWVtb3J5OgogICogYS4gbGVzcyB0
aGFuIGZyZWVfdG90YWw6ICAgIGZyZWVfdG90YWwgLyAyLCBhbGxvYyBzaG91bGQgcGFzcy4KLSAq
IGIuIGdyZWF0ZXIgdGhhbiBmcmVlX3RvdGFsOiBmcmVlX3RvdGFsICogMiwgYWxsb2Mgc2hvdWxk
IGZhaWwuCi0gKiBjLiBlcXVhbCB0byBzdW1fdG90YWw6ICAgICAgc3VtX3RhdGFsLCAgICAgIGFs
bG9jIHNob3VsZCBmYWlsCisgKiBiLiBncmVhdGVyIHRoYW4gc3VtX3RvdGFsOiAgIHN1bV90b3Rh
bCAqIDIsIGFsbG9jIHNob3VsZCBmYWlsLgogICoKICAqIFdoZW4gb3ZlcmNvbW1pdF9tZW1vcnkg
PSAxLCBpdCBjYW4gYWxsb2MgZW5vdWdoIG11Y2ggbWVtb3J5LCBJCiAgKiBjaG9vc2UgdGhlIHRo
cmVlIGNhc2VzOgpAQCAtMTY0LDkgKzE2Myw3IEBAIHN0YXRpYyB2b2lkIG92ZXJjb21taXRfbWVt
b3J5X3Rlc3Qodm9pZCkKIAogCXVwZGF0ZV9tZW0oKTsKIAlhbGxvY19hbmRfY2hlY2soZnJlZV90
b3RhbCAvIDIsIEVYUEVDVF9QQVNTKTsKLQl1cGRhdGVfbWVtKCk7Ci0JYWxsb2NfYW5kX2NoZWNr
KGZyZWVfdG90YWwgKiAyLCBFWFBFQ1RfRkFJTCk7Ci0JYWxsb2NfYW5kX2NoZWNrKHN1bV90b3Rh
bCwgRVhQRUNUX0ZBSUwpOworCWFsbG9jX2FuZF9jaGVjayhzdW1fdG90YWwgKiAyLCBFWFBFQ1Rf
RkFJTCk7CiAKIAkvKiBzdGFydCB0byB0ZXN0IG92ZXJjb21taXRfbWVtb3J5PTEgKi8KIAlzZXRf
c3lzX3R1bmUoIm92ZXJjb21taXRfbWVtb3J5IiwgMSwgMSk7Ci0tIAoxLjguMy4xCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
