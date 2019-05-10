Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B46541A307
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 20:32:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00E903EA4C8
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 20:32:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1A0583EA292
 for <ltp@lists.linux.it>; Fri, 10 May 2019 20:31:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D58A3100153B
 for <ltp@lists.linux.it>; Fri, 10 May 2019 20:31:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EAA5AEF7;
 Fri, 10 May 2019 18:31:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 May 2019 20:31:31 +0200
Message-Id: <20190510183132.31039-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510183132.31039-1-pvorel@suse.cz>
References: <20190510183132.31039-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 5/6] net: Move setup_addrinfo() from
	netstress.c into tst_net.h
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

VGhpcyBhbGxvd3MgcmV1c2luZyBpdCBpbiBuZXh0IGNvbW1pdC4KCkFkZCBtaXNzaW5nIGluY2x1
ZGVzIGludG8gdHN0X25ldC5oLCBtYWtlIGZ1bmN0aW9ucyBpbmxpbmUuCgpTaWduZWQtb2ZmLWJ5
OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLS0tCk1heWJlIHRzdF9uZXQuYyB3b3VsZCBi
ZSBiZXR0ZXIgdGhhbiBpbmxpbmUgZnVuY3Rpb25zLgp0c3RfbmV0LmggcmVxdWlyZXMgdHN0X3Rl
c3QuaCBiZSBsb2FkZWQgZmlyc3QuCgogaW5jbHVkZS90c3RfbmV0LmggICAgICAgICAgICAgICAg
ICAgICAgIHwgNDUgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogdGVzdGNhc2VzL25ldHdvcmsv
bmV0c3RyZXNzL25ldHN0cmVzcy5jIHwgMTQgKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3Rf
bmV0LmggYi9pbmNsdWRlL3RzdF9uZXQuaAppbmRleCBjYjk3YjdiNjEuLmFkMDY3ZDhjNiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS90c3RfbmV0LmgKKysrIGIvaW5jbHVkZS90c3RfbmV0LmgKQEAgLTEs
MjIgKzEsMTIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
CiAvKgotICogQ29weXJpZ2h0IChjKSAyMDE3IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgot
ICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQotICogdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiwgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKLSAqIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRp
c3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lU
SE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgot
ICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlIHRoZQotICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4K
LSAqCi0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZQotICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2Vl
IDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqIENvcHlyaWdodCAoYykgMjAxNy0y
MDE5IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgogICovCiAKICNpbmNsdWRlIDxhcnBhL2lu
ZXQuaD4KICNpbmNsdWRlIDxlcnJuby5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSA8
c3RkbGliLmg+CiAKICNkZWZpbmUgTUFYX0lQVjRfUFJFRklYIDMyCiAjZGVmaW5lIE1BWF9JUFY2
X1BSRUZJWCAxMjgKQEAgLTQ1LDcgKzM1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHByaW50X3N2
YXJfY2hhbmdlKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnZhbCkKIC8qCiAgKiBGdW5j
dGlvbiBiaXRfY291bnQgaXMgZnJvbSBpcGNhbGMgcHJvamVjdCwgaXBjYWxjLmMuCiAgKi8KLXN0
YXRpYyBpbnQgYml0X2NvdW50KHVpbnQzMl90IGkpCitzdGF0aWMgaW5saW5lIGludCBiaXRfY291
bnQodWludDMyX3QgaSkKIHsKIAlpbnQgYyA9IDA7CiAJdW5zaWduZWQgaW50IHNlZW5fb25lID0g
MDsKQEAgLTY3LDcgKzU3LDcgQEAgc3RhdGljIGludCBiaXRfY291bnQodWludDMyX3QgaSkKIC8q
CiAgKiBGdW5jdGlvbiBtYXNrMnByZWZpeCBpcyBmcm9tIGlwY2FsYyBwcm9qZWN0LCBpcGNhbGMu
Yy4KICAqLwotc3RhdGljIGludCBtYXNrMnByZWZpeChzdHJ1Y3QgaW5fYWRkciBtYXNrKQorc3Rh
dGljIGlubGluZSBpbnQgbWFzazJwcmVmaXgoc3RydWN0IGluX2FkZHIgbWFzaykKIHsKIAlyZXR1
cm4gYml0X2NvdW50KG50b2hsKG1hc2suc19hZGRyKSk7CiB9CkBAIC03NSw3ICs2NSw3IEBAIHN0
YXRpYyBpbnQgbWFzazJwcmVmaXgoc3RydWN0IGluX2FkZHIgbWFzaykKIC8qCiAgKiBGdW5jdGlv
biBpcHY0X21hc2tfdG9faW50IGlzIGZyb20gaXBjYWxjIHByb2plY3QsIGlwY2FsYy5jLgogICov
Ci1zdGF0aWMgaW50IGlwdjRfbWFza190b19pbnQoY29uc3QgY2hhciAqcHJlZml4KQorc3RhdGlj
IGlubGluZSBpbnQgaXB2NF9tYXNrX3RvX2ludChjb25zdCBjaGFyICpwcmVmaXgpCiB7CiAJaW50
IHJldDsKIAlzdHJ1Y3QgaW5fYWRkciBpbjsKQEAgLTkwLDcgKzgwLDcgQEAgc3RhdGljIGludCBp
cHY0X21hc2tfdG9faW50KGNvbnN0IGNoYXIgKnByZWZpeCkKIC8qCiAgKiBGdW5jdGlvbiBzYWZl
X2F0b2kgaXMgZnJvbSBpcGNhbGMgcHJvamVjdCwgaXBjYWxjLmMuCiAgKi8KLXN0YXRpYyBpbnQg
c2FmZV9hdG9pKGNvbnN0IGNoYXIgKnMsIGludCAqcmV0X2kpCitzdGF0aWMgaW5saW5lIGludCBz
YWZlX2F0b2koY29uc3QgY2hhciAqcywgaW50ICpyZXRfaSkKIHsKIAljaGFyICp4ID0gTlVMTDsK
IAlsb25nIGw7CkBAIC0xMTIsNyArMTAyLDcgQEAgc3RhdGljIGludCBzYWZlX2F0b2koY29uc3Qg
Y2hhciAqcywgaW50ICpyZXRfaSkKIC8qCiAgKiBGdW5jdGlvbiBnZXRfcHJlZml4IHVzZSBjb2Rl
IGZyb20gaXBjYWxjIHByb2plY3QsIHN0cl90b19wcmVmaXgvaXBjYWxjLmMuCiAgKi8KLXN0YXRp
YyBpbnQgZ2V0X3ByZWZpeChjb25zdCBjaGFyICppcF9zdHIsIGludCBpc19pcHY2KQorc3RhdGlj
IGlubGluZSBpbnQgZ2V0X3ByZWZpeChjb25zdCBjaGFyICppcF9zdHIsIGludCBpc19pcHY2KQog
ewogCWNoYXIgKnByZWZpeF9zdHIgPSBOVUxMOwogCWludCBwcmVmaXggPSAtMSwgcjsKQEAgLTE0
MCwxNCArMTMwLDI3IEBAIHN0YXRpYyBpbnQgZ2V0X3ByZWZpeChjb25zdCBjaGFyICppcF9zdHIs
IGludCBpc19pcHY2KQogCXJldHVybiBwcmVmaXg7CiB9CiAKLXN0YXRpYyB2b2lkIGdldF9pbl9h
ZGRyKGNvbnN0IGNoYXIgKmlwX3N0ciwgc3RydWN0IGluX2FkZHIgKmlwKQorc3RhdGljIGlubGlu
ZSB2b2lkIGdldF9pbl9hZGRyKGNvbnN0IGNoYXIgKmlwX3N0ciwgc3RydWN0IGluX2FkZHIgKmlw
KQogewogCWlmIChpbmV0X3B0b24oQUZfSU5FVCwgaXBfc3RyLCBpcCkgPD0gMCkKIAkJdHN0X2Jy
a19jb21tZW50KCJiYWQgSVB2NCBhZGRyZXNzOiAnJXMnIiwgaXBfc3RyKTsKIH0KIAotc3RhdGlj
IHZvaWQgZ2V0X2luNl9hZGRyKGNvbnN0IGNoYXIgKmlwX3N0ciwgc3RydWN0IGluNl9hZGRyICpp
cDYpCitzdGF0aWMgaW5saW5lIHZvaWQgZ2V0X2luNl9hZGRyKGNvbnN0IGNoYXIgKmlwX3N0ciwg
c3RydWN0IGluNl9hZGRyICppcDYpCiB7CiAJaWYgKGluZXRfcHRvbihBRl9JTkVUNiwgaXBfc3Ry
LCBpcDYpIDw9IDApCiAJCXRzdF9icmtfY29tbWVudCgiYmFkIElQdjYgYWRkcmVzczogJyVzJyIs
IGlwX3N0cik7CiB9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXR1cF9hZGRyaW5mbyhjb25zdCBj
aGFyICpzcmNfYWRkciwgY29uc3QgY2hhciAqcG9ydCwKKwkJCSAgIGNvbnN0IHN0cnVjdCBhZGRy
aW5mbyAqaGludHMsCisJCQkgICBzdHJ1Y3QgYWRkcmluZm8gKiphZGRyX2luZm8pCit7CisJaW50
IGVyciA9IGdldGFkZHJpbmZvKHNyY19hZGRyLCBwb3J0LCBoaW50cywgYWRkcl9pbmZvKTsKKwor
CWlmIChlcnIpCisJCXRzdF9icmsoVEJST0ssICJnZXRhZGRyaW5mbyBmYWlsZWQsICVzIiwgZ2Fp
X3N0cmVycm9yKGVycikpOworCisJaWYgKCEqYWRkcl9pbmZvKQorCQl0c3RfYnJrKFRCUk9LLCAi
ZmFpbGVkIHRvIGdldCB0aGUgYWRkcmVzcyIpOworfQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL25l
dHdvcmsvbmV0c3RyZXNzL25ldHN0cmVzcy5jIGIvdGVzdGNhc2VzL25ldHdvcmsvbmV0c3RyZXNz
L25ldHN0cmVzcy5jCmluZGV4IDA2ODgyYjFiMy4uNTAwMWYyMDZhIDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMvbmV0d29yay9uZXRzdHJlc3MvbmV0c3RyZXNzLmMKKysrIGIvdGVzdGNhc2VzL25ldHdv
cmsvbmV0c3RyZXNzL25ldHN0cmVzcy5jCkBAIC00Myw2ICs0Myw3IEBACiAjaW5jbHVkZSAidHN0
X3NhZmVfc3RkaW8uaCIKICNpbmNsdWRlICJ0c3Rfc2FmZV9wdGhyZWFkLmgiCiAjaW5jbHVkZSAi
dHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJ0c3RfbmV0LmgiCiAKIHN0YXRpYyBjb25zdCBpbnQgbWF4
X21zZ19sZW4gPSAoMSA8PCAxNikgLSAxOwogc3RhdGljIGNvbnN0IGludCBtaW5fbXNnX2xlbiA9
IDU7CkBAIC00NTUsMTkgKzQ1Niw2IEBAIHN0YXRpYyBpbnQgcGFyc2VfY2xpZW50X3JlcXVlc3Qo
Y29uc3QgY2hhciAqbXNnKQogc3RhdGljIHN0cnVjdCB0aW1lc3BlYyB0dl9jbGllbnRfc3RhcnQ7
CiBzdGF0aWMgc3RydWN0IHRpbWVzcGVjIHR2X2NsaWVudF9lbmQ7CiAKLXN0YXRpYyB2b2lkIHNl
dHVwX2FkZHJpbmZvKGNvbnN0IGNoYXIgKnNyY19hZGRyLCBjb25zdCBjaGFyICpwb3J0LAotCQkJ
ICAgY29uc3Qgc3RydWN0IGFkZHJpbmZvICpoaW50cywKLQkJCSAgIHN0cnVjdCBhZGRyaW5mbyAq
KmFkZHJfaW5mbykKLXsKLQlpbnQgZXJyID0gZ2V0YWRkcmluZm8oc3JjX2FkZHIsIHBvcnQsIGhp
bnRzLCBhZGRyX2luZm8pOwotCi0JaWYgKGVycikKLQkJdHN0X2JyayhUQlJPSywgImdldGFkZHJp
bmZvIGZhaWxlZCwgJXMiLCBnYWlfc3RyZXJyb3IoZXJyKSk7Ci0KLQlpZiAoISphZGRyX2luZm8p
Ci0JCXRzdF9icmsoVEJST0ssICJmYWlsZWQgdG8gZ2V0IHRoZSBhZGRyZXNzIik7Ci19Ci0KIHN0
YXRpYyB2b2lkIGNsaWVudF9pbml0KHZvaWQpCiB7CiAJaWYgKGNsaWVudHNfbnVtID49IE1BWF9U
SFJFQURTKSB7Ci0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
