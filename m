Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ED138C69
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 16:16:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50DE73EA700
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 16:16:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 81EE13EA606
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 16:16:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA9651401A40
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 16:16:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02418AECD
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 14:16:29 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Fri,  7 Jun 2019 16:16:22 +0200
Message-Id: <20190607141622.20316-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] syscalls/acct02: Fix wrongfully failing sometimes
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

T24gc29tZSBzeXN0ZW1zIHRoZSBwcm9jZXNzIGNhbGxpbmcgYWNjdCgpIGhhcyB0byBlbmQgYmVm
b3JlCnByb2Nlc3MgYWNjb3VudGluZyBpcyBzdGFydGVkLiBUaGlzIGNhdXNlZCB0aGUgb3JpZ2lu
YWwgdGVzdAp0byBmYWlsIG9uIHRob3NlIHN5c3RlbXMuCgpUaGlzIGZpeCBmb3JrcyBhIGNoaWxk
IHByb2Nlc3MgdG8gY2FsbCBhY2N0KCkgaW4gb3JkZXIgdG8KYWN0aXZhdGUgcHJvY2VzcyBhY2Nv
dW50aW5nIGJlZm9yZSBydW5uaW5nIHRoZSB0ZXN0IHByb2dyYW0uCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2FjY3QvYWNjdDAyLmMgfCAyMCArKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0L2FjY3QwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9hY2N0L2FjY3QwMi5jCmluZGV4IDhhOTliYjk0ZC4uYjYwOWVlYzJiIDEwMDY0NAot
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2FjY3QvYWNjdDAyLmMKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0L2FjY3QwMi5jCkBAIC0xMDgsMTMgKzEwOCwyNCBAQCBz
dGF0aWMgaW50IHZlcmlmeV9hY2N0X3YzKHN0cnVjdCBhY2N0X3YzICphY2MpCiAKIHN0YXRpYyB2
b2lkIHJ1bih2b2lkKQogewotCWludCByZWFkX2J5dGVzLCByZXQsIGVudHJ5X2NvdW50OworCWlu
dCByZWFkX2J5dGVzLCByZXQsIGVudHJ5X2NvdW50LCBwaWQ7CiAKIAlmZCA9IFNBRkVfT1BFTihP
VVRQVVRfRklMRSwgT19SRFdSIHwgT19DUkVBVCwgMDY0NCk7CiAKLQlURVNUKGFjY3QoT1VUUFVU
X0ZJTEUpKTsKLQlpZiAoVFNUX1JFVCA9PSAtMSkKLQkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8s
ICJDb3VsZCBub3Qgc2V0IGFjY3Qgb3V0cHV0IGZpbGUiKTsKKwkvKiBPbiBzb21lIHN5c3RlbXMg
dGhlIHByb2Nlc3MgY2FsbGluZyBhY2N0IGhhcyB0byBlbmQKKwkgKiBiZWZvcmUgaXQgdGFrZXMg
ZWZmZWN0CisJICovCisJcGlkID0gU0FGRV9GT1JLKCk7CisKKwlpZiAocGlkID09IDApIHsKKwkJ
VEVTVChhY2N0KE9VVFBVVF9GSUxFKSk7CisJCWlmIChUU1RfUkVUID09IC0xKSB7CisJCQl0c3Rf
YnJrKFRCUk9LIHwgVFRFUlJOTywKKwkJCQkiQ291bGQgbm90IHNldCBhY2N0IG91dHB1dCBmaWxl
Iik7CisJCX0KKwkJcmV0dXJuOworCX0KKwl0c3RfcmVhcF9jaGlsZHJlbigpOwogCiAJc3RhcnRf
dGltZSA9IHRpbWUoTlVMTCk7CiAJcnVuX2NvbW1hbmQoKTsKQEAgLTE4MCw0ICsxOTEsNSBAQCBz
dGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLmNsZWFudXAgPSBjbGVhbnVwLAogCS5u
ZWVkc190bXBkaXIgPSAxLAogCS5uZWVkc19yb290ID0gMSwKKwkuZm9ya3NfY2hpbGQgPSAxLAog
fTsKLS0gCjIuMTYuNAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
