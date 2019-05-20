Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC9240ED
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 21:09:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2180294AC1
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 21:09:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1A669294AAC
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:09:15 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 361EE1A00EFB
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:09:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1C075AFD9
 for <ltp@lists.linux.it>; Mon, 20 May 2019 19:08:56 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416E31001E73;
 Mon, 20 May 2019 19:08:55 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 20 May 2019 21:08:53 +0200
Message-Id: <a5e65ca65d88177d9142cbd2d5a3ddf5dda174b5.1558379215.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 20 May 2019 19:09:02 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH] shmctl01: don't use hardcoded index == 0 for SHM_STAT
	test
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

VGVzdCBmYWlscyBvbiBTSE1fU1RBVCB0ZXN0Y2FzZToKICAgc2htY3RsMDEgICAgNSAgVEZBSUwg
IDogIHNobWN0bDAxLmM6MTczOiBzaG1jdGwwMSBjYWxsIGZhaWxlZAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZXJybm8gPSAyMiA6IEludmFsaWQgYXJndW1lbnQKICAgc2htY3RsKDAsIFNI
TV9TVEFULCAweDYwMTA2MCkgICAgICAgICAgID0gLUVJTlZBTAoKc2luY2UgZm9sbG93aW5nIGNv
bW1pdDoKICAgY29tbWl0IDk5ZGI0NmVhMjkyNzgwY2Q5NzhkNTY5MzJkOTQ0NWIxZThiZGFmZTgK
ICAgQXV0aG9yOiBNYW5mcmVkIFNwcmF1bCA8bWFuZnJlZEBjb2xvcmZ1bGxpZmUuY29tPgogICBE
YXRlOiAgIFR1ZSBNYXkgMTQgMTU6NDY6MzYgMjAxOSAtMDcwMAogICAgIGlwYzogZG8gY3ljbGlj
IGlkIGFsbG9jYXRpb24gZm9yIHRoZSBpcGMgb2JqZWN0LgoKRG9uJ3QgcmVseSBvbiBpbmRleCAw
IGJlaW5nIGFsd2F5cyBhdmFpbGFibGUsIGJ1dCBpbnN0ZWFkCnVzZSAobWF4aW11bSkgaW5kZXgg
cmV0dXJuZWQgYnkgU0hNX0lORk8uCgpTaWduZWQtb2ZmLWJ5OiBKYW4gU3RhbmNlayA8anN0YW5j
ZWtAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9zaG1jdGwv
c2htY3RsMDEuYyB8IDIxICsrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9pcGMvc2htY3RsL3NobWN0bDAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2lwYy9zaG1jdGwvc2htY3RsMDEuYwppbmRleCAxYjQ2OTc3NTU0ZDUuLjUyYmYyM2E0
MGZjMSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2htY3RsL3No
bWN0bDAxLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2htY3RsL3NobWN0
bDAxLmMKQEAgLTc5LDYgKzc5LDcgQEAgc3RhdGljIHZvaWQgZnVuY19pbmZvKGludCByZXQpOwog
CiAvKiBDaGVjayByb3V0aW5lIGZvciBTSE1fU1RBVCAqLwogc3RhdGljIHZvaWQgZnVuY19zc3Rh
dChpbnQgcmV0KTsKK3N0YXRpYyB2b2lkIGZ1bmNfc3N0YXRfc2V0dXAodm9pZCk7CiAKIC8qIENo
ZWNrIHJvdXRpbmUgZm9yIFNITV9MT0NLICovCiBzdGF0aWMgdm9pZCBmdW5jX2xvY2soaW50IHJl
dCk7CkBAIC0xMTAsNyArMTExLDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2VfdCB7CiAjZW5k
aWYKIAl7JnNobV9pZF8xLCBJUENfU0VULCAmYnVmLCBmdW5jX3NldCwgc2V0X3NldHVwfSwKIAl7
JnNobV9pZF8xLCBJUENfSU5GTywgKHN0cnVjdCBzaG1pZF9kcyAqKSAmaW5mbywgZnVuY19pbmZv
LCBOVUxMfSwKLQl7JnNobV9pbmRleCwgU0hNX1NUQVQsICZidWYsIGZ1bmNfc3N0YXQsIE5VTEx9
LAorCXsmc2htX2luZGV4LCBTSE1fU1RBVCwgJmJ1ZiwgZnVuY19zc3RhdCwgZnVuY19zc3RhdF9z
ZXR1cH0sCiAJeyZzaG1faWRfMSwgU0hNX0xPQ0ssIE5VTEwsIGZ1bmNfbG9jaywgTlVMTH0sCiAJ
eyZzaG1faWRfMSwgU0hNX1VOTE9DSywgTlVMTCwgZnVuY191bmxvY2ssIE5VTEx9LAogCXsmc2ht
X2lkXzEsIElQQ19STUlELCBOVUxMLCBmdW5jX3JtaWQsIE5VTEx9LApAQCAtNDA3LDkgKzQwOCwy
MyBAQCBzdGF0aWMgdm9pZCBmdW5jX2luZm8oaW50IHJldCkKIHN0YXRpYyB2b2lkIGZ1bmNfc3N0
YXQoaW50IHJldCkKIHsKIAlpZiAocmV0ID49IDApCi0JCXRzdF9yZXNtKFRQQVNTLCAiZ2V0IGNv
cnJlY3Qgc2hhcmVkIG1lbW9yeSBpZCIpOworCQl0c3RfcmVzbShUUEFTUywgImdldCBjb3JyZWN0
IHNoYXJlZCBtZW1vcnkgaWQgZm9yIGluZGV4OiAlZCIsCisJCQlzaG1faW5kZXgpOwogCWVsc2UK
LQkJdHN0X3Jlc20oVEZBSUwsICJzaGFyZWQgbWVtb3J5IGlkIGlzIGluY29ycmVjdCIpOworCQl0
c3RfcmVzbShURkFJTCwgInNoYXJlZCBtZW1vcnkgaWQgaXMgaW5jb3JyZWN0LCBpbmRleDogJWQi
LAorCQkJc2htX2luZGV4KTsKK30KKworc3RhdGljIHZvaWQgZnVuY19zc3RhdF9zZXR1cCh2b2lk
KQoreworCXN0cnVjdCBzaG1faW5mbyB0bXA7CisJaW50IHJldDsKKworCXJldCA9IHNobWN0bChz
aG1faWRfMSwgU0hNX0lORk8sICh2b2lkICopJnRtcCk7CisJaWYgKHJldCA8IDApCisJCXRzdF9y
ZXNtKFRGQUlMfFRFUlJOTywgInNobWN0bChTSE1fSU5GTykiKTsKKwllbHNlCisJCXNobV9pbmRl
eCA9IHJldDsKIH0KIAogc3RhdGljIHZvaWQgZnVuY19sb2NrKGludCByZXQpCi0tIAoxLjguMy4x
CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
