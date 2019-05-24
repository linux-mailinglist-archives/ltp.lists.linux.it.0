Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D52941F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:03:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74F203EA5FE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:03:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 04E0D3EA2D1
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:03:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 654C71003AE6
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:03:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A832AE4F
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:03:25 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 May 2019 11:03:24 +0200
Message-Id: <20190524090324.15975-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] syscalls/fcntl2*: Fix typo overlapfs ->
	overlayfs
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

VGhpcyBpcyBmb2xsb3d1cCBvbjoKCmNvbW1pdCA0ZWVjMTJmNDgwYWY5OGQ1ZjFiNTZmOGUxNjNm
MmZlZjViOTkzOGMzCkF1dGhvcjogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+CkRhdGU6
ICAgVGh1IE1heSAyMyAxNTo0MjozNSAyMDE5ICswMjAwCgogICAgc3lzY2FsbHMvZmNudGwzMzog
Rml4IHR5cG8gb3ZlcmxhcGZzIC0+IG92ZXJsYXlmcwoKSSBzaG91bGQgaGF2ZSBkb25lIGdpdCBn
cmVwIGJlZm9yZSBjb21taXRpbmcgdGhlIGZpcnN0IG9uZS4KClJlcG9ydGVkLWJ5OiBBbWlyIEdv
bGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMg
PGNocnViaXNAc3VzZS5jej4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2Zj
bnRsMjQuYyB8IDIgKy0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwyNS5j
IHwgMiArLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDI2LmMgfCAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMjQuYyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwyNC5jCmluZGV4IGRmZjQwMDljZi4uNjNj
NzE2ZmY2IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRs
MjQuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMjQuYwpAQCAt
MTQ1LDcgKzE0NSw3IEBAIGludCBtYWluKGludCBhYywgY2hhciAqKmF2KQogCQlpZiAoVEVTVF9S
RVRVUk4gPT0gLTEpIHsKIAkJCWlmICh0eXBlID09IFRTVF9PVkVSTEFZRlNfTUFHSUMgJiYgVEVT
VF9FUlJOTyA9PSBFQUdBSU4pIHsKIAkJCQl0c3RfcmVzbShUSU5GTyB8IFRURVJSTk8sCi0JCQkJ
CSAiZmNudGwoRl9TRVRMRUFTRSwgRl9XUkxDSykgZmFpbGVkIG9uIG92ZXJsYXBmcyBhcyBleHBl
Y3RlZCIpOworCQkJCQkgImZjbnRsKEZfU0VUTEVBU0UsIEZfV1JMQ0spIGZhaWxlZCBvbiBvdmVy
bGF5ZnMgYXMgZXhwZWN0ZWQiKTsKIAkJCX0gZWxzZSB7CiAJCQkJdHN0X3Jlc20oVEZBSUwsCiAJ
CQkJCSJmY250bCglcywgRl9TRVRMRUFTRSwgRl9XUkxDSykgRmFpbGVkLCBlcnJubz0lZCA6ICVz
IiwKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwyNS5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDI1LmMKaW5kZXggMTU5MmVk
M2Q1Li40OTE3NTg0YzkgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNu
dGwvZmNudGwyNS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwy
NS5jCkBAIC0xNDYsNyArMTQ2LDcgQEAgaW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpCiAJCWlm
IChURVNUX1JFVFVSTiA9PSAtMSkgewogCQkJaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJ
QyAmJiBURVNUX0VSUk5PID09IEVBR0FJTikgewogCQkJCXRzdF9yZXNtKFRJTkZPIHwgVFRFUlJO
TywKLQkJCQkJICJmY250bChGX1NFVExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24gb3ZlcmxhcGZz
IGFzIGV4cGVjdGVkIik7CisJCQkJCSAiZmNudGwoRl9TRVRMRUFTRSwgRl9XUkxDSykgZmFpbGVk
IG9uIG92ZXJsYXlmcyBhcyBleHBlY3RlZCIpOwogCQkJfSBlbHNlIHsKIAkJCQl0c3RfcmVzbShU
RkFJTCwKIAkJCQkJICJmY250bCglcywgRl9TRVRMRUFTRSwgRl9XUkxDSykgRmFpbGVkLCBlcnJu
bz0lZCA6ICVzIiwKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwv
ZmNudGwyNi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDI2LmMKaW5k
ZXggMjhiZTRjMzYyLi5hYzc0YjU1NzEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZmNudGwvZmNudGwyNi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNu
dGwvZmNudGwyNi5jCkBAIC0xNDYsNyArMTQ2LDcgQEAgaW50IG1haW4oaW50IGFjLCBjaGFyICoq
YXYpCiAJCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgewogCQkJaWYgKHR5cGUgPT0gVFNUX09WRVJM
QVlGU19NQUdJQyAmJiBURVNUX0VSUk5PID09IEVBR0FJTikgewogCQkJCXRzdF9yZXNtKFRJTkZP
IHwgVFRFUlJOTywKLQkJCQkJICJmY250bChGX1NFVExFQVNFLCBGX1dSTENLKSBmYWlsZWQgb24g
b3ZlcmxhcGZzIGFzIGV4cGVjdGVkIik7CisJCQkJCSAiZmNudGwoRl9TRVRMRUFTRSwgRl9XUkxD
SykgZmFpbGVkIG9uIG92ZXJsYXlmcyBhcyBleHBlY3RlZCIpOwogCQkJfSBlbHNlIHsKIAkJCQl0
c3RfcmVzbShURkFJTCwKIAkJCQkJImZjbnRsKCVzLCBGX1NFVExFQVNFLCBGX1dSTENLKSBGYWls
ZWQsIGVycm5vPSVkIDogJXMiLAotLSAKMi4xOS4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
