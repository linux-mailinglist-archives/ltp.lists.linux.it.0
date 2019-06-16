Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11047406
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 11:52:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60D433EAFFB
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 11:52:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8BC063EA4B7
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 11:52:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E4A6C20168D
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 11:52:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6DF32F8BEA
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 09:52:46 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20C197FE99;
 Sun, 16 Jun 2019 09:52:45 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Sun, 16 Jun 2019 11:52:41 +0200
Message-Id: <a15d4137b63e4202751bea4e726658aa14be7351.1560678643.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sun, 16 Jun 2019 09:52:46 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: fhrbata@redhat.com, liwan@redhat.com
Subject: [LTP] [PATCH] syscalls/tgkill03: wait for defunct tid to get
	detached
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

Q2FzZSB3aGVyZSBkZWZ1bmN0IHRpZCBpcyB1c2VkIGhhcyBiZWVuIG9ic2VydmVkIHRvIHNwb3Jh
ZGljYWxseSBmYWlsOgogIHRna2lsbDAzLmM6OTY6IEZBSUw6IERlZnVuY3QgdGlkIHNob3VsZCBo
YXZlIGZhaWxlZCB3aXRoIEVTUkNIOiBTVUNDRVNTCgpnbGliYyBfX3B0aHJlYWRfdGltZWRqb2lu
X2V4KCkgd2FpdHMgZm9yIENMT05FX0NISUxEX0NMRUFSVElEIHRvIGNsZWFyIHRpZCwKYW5kIHRo
ZW4gcmVzdW1lcy4gS2VybmVsIGNsZWFycyBpdCAoZ2xpYmMgcGQtPnRpZCkgYXQ6CiAgZG9fZXhp
dAogICAgZXhpdF9tbQogICAgICBtbV9yZWxlYXNlCiAgICAgICAgcHV0X3VzZXIoMCwgdHNrLT5j
bGVhcl9jaGlsZF90aWQpOwoKYnV0IGtlcm5lbCB0aWQgaXMgc3RpbGwgdmFsaWQsIHByZXN1bWFi
bHkgdW50aWw6CiAgcmVsZWFzZV90YXNrCiAgICBfX2V4aXRfc2lnbmFsCiAgICAgIF9fdW5oYXNo
X3Byb2Nlc3MKICAgICAgICBkZXRhY2hfcGlkCgpUbyBhdm9pZCByYWNlIHdhaXQgdW50aWwgL3By
b2MvPHBpZD4vdGFzay88dGlkPiBkaXNhcHBlYXJzLgoKU2lnbmVkLW9mZi1ieTogSmFuIFN0YW5j
ZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy90
Z2tpbGwvdGdraWxsMDMuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy90Z2tpbGwvdGdraWxsMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rn
a2lsbDAzLmMKaW5kZXggZjViYmRjNWE4ZDRlLi41YWMxZDI2NTFmN2EgMTAwNjQ0Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYwpAQCAtNyw2ICs3LDcgQEAKIAogI2lu
Y2x1ZGUgPHB0aHJlYWQuaD4KICNpbmNsdWRlIDxwd2QuaD4KKyNpbmNsdWRlIDxzdGRpby5oPgog
I2luY2x1ZGUgPHN5cy90eXBlcy5oPgogCiAjaW5jbHVkZSAidHN0X3NhZmVfcHRocmVhZC5oIgpA
QCAtNDIsNiArNDMsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogewogCXNpZ3NldF90IHNp
Z3VzcjE7CiAJcHRocmVhZF90IGRlZnVuY3RfdGhyZWFkOworCWNoYXIgZGVmdW5jdF90aWRfcGF0
aFtQQVRIX01BWF07CiAKIAlzaWdlbXB0eXNldCgmc2lndXNyMSk7CiAJc2lnYWRkc2V0KCZzaWd1
c3IxLCBTSUdVU1IxKTsKQEAgLTU1LDggKzU3LDEwIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQp
CiAJVFNUX0NIRUNLUE9JTlRfV0FJVCgwKTsKIAogCVNBRkVfUFRIUkVBRF9DUkVBVEUoJmRlZnVu
Y3RfdGhyZWFkLCBOVUxMLCBkZWZ1bmN0X3RocmVhZF9mdW5jLCBOVUxMKTsKLQogCVNBRkVfUFRI
UkVBRF9KT0lOKGRlZnVuY3RfdGhyZWFkLCBOVUxMKTsKKwlzcHJpbnRmKGRlZnVuY3RfdGlkX3Bh
dGgsICIvcHJvYy8lZC90YXNrLyVkIiwgZ2V0cGlkKCksIGRlZnVuY3RfdGlkKTsKKwl3aGlsZSAo
YWNjZXNzKGRlZnVuY3RfdGlkX3BhdGgsIFJfT0spID09IDApCisJCXVzbGVlcCgxMDAwMCk7CiB9
CiAKIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKLS0gCjEuOC4zLjEKCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
