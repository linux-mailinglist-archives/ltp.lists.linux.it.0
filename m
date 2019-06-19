Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA174BC6B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 17:07:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72BF63EA94C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 17:07:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0D8B23EA36C
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 17:07:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C41FC62C495
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 17:07:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29867ACA7
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 15:07:30 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Jun 2019 17:07:28 +0200
Message-Id: <20190619150728.32578-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] runtest: Fix asyncio02 -> stat02 rename
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

VGhpcyBmaXhlczoKCmNvbW1pdCBkMDc4OWY3NzRiNTU5YWQ4Nzc2MGI2OTU4YTU4ZTZlMmZkN2Yw
ZGJlCkF1dGhvcjogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBhbmRyb2lkLmNvbT4KRGF0ZTogICBT
dW4gSnVuIDkgMTc6MjY6MDkgMjAxOSAtMDcwMAoKICAgIHN5c2NhbGxzL2FzeW5jaW8wMjogY29u
dmVydCB0byBuZXcgbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJp
c0BzdXNlLmN6PgotLS0KIHJ1bnRlc3QvcXVpY2toaXQgfCAxNSAtLS0tLS0tLS0tLS0tLS0KIHJ1
bnRlc3Qvc3lzY2FsbHMgfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcnVudGVzdC9xdWlja2hpdCBiL3J1bnRl
c3QvcXVpY2toaXQKaW5kZXggOWU2YWQzZWQ0Li5lMDFiODM4ZmIgMTAwNjQ0Ci0tLSBhL3J1bnRl
c3QvcXVpY2toaXQKKysrIGIvcnVudGVzdC9xdWlja2hpdApAQCAtMjAsMjEgKzIwLDYgQEAgYWxh
cm0wMyBhbGFybTAzCiAjICAgIFRFU1QgQ0FTRVMKICMgCTEuKSBhbGFybSgxMDApLCBmb3JrLCBj
aGlsZCdzIGFsYXJtKDApIHNoYWxsIHJldHVybiAwOwogIwkyLikgYWxhcm0oMTAwKSwgZm9yaywg
cGFyZW50J3MgYWxhcm0oMCkgc2hhbGwgcmV0dXJuIG5vbi16ZXJvLgotYXN5bmNpbzAyIGFzeW5j
aW8wMgotIyAJQXR0ZW1wdCB0byBnZXQgc29tZSBtZW1vcnkgdG8gd29yayB3aXRoLgotIyAJQ2Fs
bCB0ZXN0cnVuIHdyaXRpbmcgKEJVRlNJWiArIDEpIGJ5dGVzCi0jIAlDYWxsIHRlc3RydW4gd3Jp
dGluZyBCVUZTSVogYnl0ZXMKLSMgCVJlcGVhdGVkIGNhbGwgdG8gdGVzdHJ1bigpIHdpdGggZGVj
cmVhc2luZyB3cml0ZSBzaXplcwotIyAJCWxlc3MgdGhhbiBCVUZTSVoKLSMgCUVuZAotIwotIyAJ
U3RhcnQgdGVzdHJ1bigpCi0jIAlBdHRlbXB0IHRvIG9wZW4gYSB0ZW1wb3JhcnkgZmlsZS4KLSMg
CVdyaXRlIHRoZSBtZW1vcnkgdG8gdGhlIGZpbGUuCi0jIAlBdHRlbXB0IHRvIGNsb3NlIHRoZSBm
aWxlIHdoaWNoIGFsc28gZmx1c2hlcyB0aGUgYnVmZmVycy4KLSMgCU5vdyBjaGVjayB0byBzZWUg
aWYgdGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVuIGlzIHRoZQotIyAJCXNhbWUgYXMgdGhlIG51
bWJlciBvZiBieXRlcyBpbiB0aGUgZmlsZS4KLSMgCUNsZWFudXAKIGJyazAxIGJyazAxCiAjIEJh
c2ljIHRlc3QgZm9yIGJyaygpCiAjICAgIFRFU1QgQ0FTRVMKZGlmZiAtLWdpdCBhL3J1bnRlc3Qv
c3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IGExMTA2ZmI4NC4uZmRhOTNlMzE5IDEw
MDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qvc3lzY2FsbHMKQEAgLTI4
LDggKzI4LDYgQEAgYWxhcm0wNSBhbGFybTA1CiBhbGFybTA2IGFsYXJtMDYKIGFsYXJtMDcgYWxh
cm0wNwogCi1hc3luY2lvMDIgYXN5bmNpbzAyCi0KIGJpbmQwMSBiaW5kMDEKIGJpbmQwMiBiaW5k
MDIKIGJpbmQwMyBiaW5kMDMKQEAgLTEzMzAsNiArMTMyOCw4IEBAIHNzZXRtYXNrMDEgc3NldG1h
c2swMQogCiBzdGF0MDEgc3RhdDAxCiBzdGF0MDFfNjQgc3RhdDAxXzY0CitzdGF0MDIgc3RhdDAy
CitzdGF0MDJfNjQgc3RhdDAyXzY0CiBzdGF0MDMgc3RhdDAzCiBzdGF0MDNfNjQgc3RhdDAzXzY0
CiBzdGF0MDQgc3ltbGluazAxIC1UIHN0YXQwNAotLSAKMi4xOS4yCgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
