Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C974747B06
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:34:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91DFB294B11
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 09:34:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 11856294AC6
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:34:05 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1D3B360073A
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 09:34:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF9143086222
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 07:34:02 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273587E658;
 Mon, 17 Jun 2019 07:34:02 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 17 Jun 2019 09:33:59 +0200
Message-Id: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 17 Jun 2019 07:34:03 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH v2] syscalls/tgkill03: wait for defunct tid to get
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
KCspLCAxIGRlbGV0aW9uKC0pCgpDaGFuZ2VzIGluIHYyOgogIC0gdXNlIGhlbHBlciBmdW5jIHN1
Z2dlc3RlZCBieSBMaSAod2l0aCBoaWdoZXIgdGltZW91dCkKICAtIG5vdCB0ZXN0ZWQsIHRyeWlu
ZyB0byBnZXQgczM5MHggdG8gY29uZmlybQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rn
a2lsbC90Z2tpbGwwMy5jCmluZGV4IGY1YmJkYzVhOGQ0ZS4uY2UwNDZmNTc2YjVmIDEwMDY0NAot
LS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rna2lsbC90Z2tpbGwwMy5jCisrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMKQEAgLTcsNiArNyw3IEBA
CiAKICNpbmNsdWRlIDxwdGhyZWFkLmg+CiAjaW5jbHVkZSA8cHdkLmg+CisjaW5jbHVkZSA8c3Rk
aW8uaD4KICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KIAogI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJl
YWQuaCIKQEAgLTQyLDYgKzQzLDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKIAlzaWdz
ZXRfdCBzaWd1c3IxOwogCXB0aHJlYWRfdCBkZWZ1bmN0X3RocmVhZDsKKwljaGFyIGRlZnVuY3Rf
dGlkX3BhdGhbUEFUSF9NQVhdOwogCiAJc2lnZW1wdHlzZXQoJnNpZ3VzcjEpOwogCXNpZ2FkZHNl
dCgmc2lndXNyMSwgU0lHVVNSMSk7CkBAIC01NSw4ICs1Nyw5IEBAIHN0YXRpYyB2b2lkIHNldHVw
KHZvaWQpCiAJVFNUX0NIRUNLUE9JTlRfV0FJVCgwKTsKIAogCVNBRkVfUFRIUkVBRF9DUkVBVEUo
JmRlZnVuY3RfdGhyZWFkLCBOVUxMLCBkZWZ1bmN0X3RocmVhZF9mdW5jLCBOVUxMKTsKLQogCVNB
RkVfUFRIUkVBRF9KT0lOKGRlZnVuY3RfdGhyZWFkLCBOVUxMKTsKKwlzcHJpbnRmKGRlZnVuY3Rf
dGlkX3BhdGgsICIvcHJvYy8lZC90YXNrLyVkIiwgZ2V0cGlkKCksIGRlZnVuY3RfdGlkKTsKKwlU
U1RfUkVUUllfRk5fRVhQX0JBQ0tPRkYoYWNjZXNzKGRlZnVuY3RfdGlkX3BhdGgsIFJfT0spLCAt
MSwgMTUpOwogfQogCiBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCkBAIC0xMDgsNCArMTExLDUg
QEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewogCS5zZXR1cCA9IHNldHVwLAogCS5j
bGVhbnVwID0gY2xlYW51cCwKIAkudGVzdCA9IHJ1biwKKwkudGltZW91dCA9IDE1LAogfTsKLS0g
CjEuOC4zLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
