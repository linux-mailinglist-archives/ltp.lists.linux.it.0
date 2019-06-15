Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C286E46E18
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Jun 2019 06:21:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94EEA294B0D
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Jun 2019 06:21:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C485B294AC0
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 06:20:58 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE9F120100D
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 06:20:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35BB985539
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 04:20:55 +0000 (UTC)
Received: from dhcp-12-157.nay.redhat.com (dhcp-12-157.nay.redhat.com
 [10.66.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 642045D9E2
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 04:20:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat, 15 Jun 2019 12:20:47 +0800
Message-Id: <20190615042048.29839-2-liwang@redhat.com>
In-Reply-To: <20190615042048.29839-1-liwang@redhat.com>
References: <20190615042048.29839-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 15 Jun 2019 04:20:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] testcase: taking use of .arch in tst_test
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

VGhpcyBpcyBhIGRlbW8gZm9yIC5hcmNoIHVzYWdlOgogIDEuIHB0cmFjZTA3LmMsIGN2ZS0yMDE3
LTE3MDUzLmMsIG1lbHRkb3duLmMKClNpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRo
YXQuY29tPgotLS0KIHRlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTMuYyAgICAgICAgICAgICAg
fCAxICsKIHRlc3RjYXNlcy9jdmUvbWVsdGRvd24uYyAgICAgICAgICAgICAgICAgICAgfCA5ICst
LS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wdHJhY2UvcHRyYWNlMDcuYyB8IDgg
KysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvY3ZlL2N2ZS0yMDE3LTE3MDUzLmMgYi90ZXN0Y2Fz
ZXMvY3ZlL2N2ZS0yMDE3LTE3MDUzLmMKaW5kZXggZTAxZGIzZDRmLi42MmJiYzUwMTQgMTAwNjQ0
Ci0tLSBhL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTMuYworKysgYi90ZXN0Y2FzZXMvY3Zl
L2N2ZS0yMDE3LTE3MDUzLmMKQEAgLTE2Miw2ICsxNjIsNyBAQCB2b2lkIHJ1bih2b2lkKQogfQog
CiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLmFyY2ggPSAieDg2XzY0IGkzODYi
LAogCS5mb3Jrc19jaGlsZCA9IDEsCiAJLnNldHVwID0gc2V0dXAsCiAJLmNsZWFudXAgPSBjbGVh
bnVwLApkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jIGIvdGVzdGNhc2VzL2N2
ZS9tZWx0ZG93bi5jCmluZGV4IGE1M2VhOWI4ZS4uNzJjOWVjOTA3IDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMvY3ZlL21lbHRkb3duLmMKKysrIGIvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jCkBAIC0y
MCw4ICsyMCw2IEBACiAjaW5jbHVkZSAiY29uZmlnLmgiCiAjaW5jbHVkZSAidHN0X3Rlc3QuaCIK
IAotI2lmIGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2kzODZfXykKLQogI2luY2x1
ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c2lnbmFsLmg+CkBA
IC0zODIsMTUgKzM4MCwxMCBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiB9CiAKIHN0YXRp
YyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKKwkuYXJjaCA9ICJ4ODZfNjQgaTM4NiIsCiAJLm5l
ZWRzX3Jvb3QgPSAxLAogCS5zZXR1cCA9IHNldHVwLAogCS50ZXN0X2FsbCA9IHJ1biwKIAkuY2xl
YW51cCA9IGNsZWFudXAsCiAJLm1pbl9rdmVyID0gIjIuNi4zMiIKIH07Ci0KLSNlbHNlIC8qICNp
ZiBkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19pMzg2X18pICovCi0KLVRTVF9URVNU
X1RDT05GKCJub3QgeDg2XzY0IG9yIGkzODYiKTsKLQotI2VuZGlmIC8qICNlbHNlICNpZiBkZWZp
bmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19pMzg2X18pICovCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3B0cmFjZS9wdHJhY2UwNy5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9wdHJhY2UvcHRyYWNlMDcuYwppbmRleCA5Y2JhZWZjM2YuLjY3ZTQ3Y2UxNiAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wdHJhY2UvcHRyYWNlMDcuYwor
KysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3B0cmFjZS9wdHJhY2UwNy5jCkBAIC02MCwx
MyArNjAsMTMgQEAKICMgZGVmaW5lIE5UX1g4Nl9YU1RBVEUgMHgyMDIKICNlbmRpZgogCi0jaWZk
ZWYgX194ODZfNjRfXwogc3RhdGljIHZvaWQgY2hlY2tfcmVnc19sb29wKHVpbnQzMl90IGluaXR2
YWwpCiB7CiAJY29uc3QgdW5zaWduZWQgbG9uZyBudW1faXRlcnMgPSAxMDAwMDAwMDAwOwogCXVp
bnQzMl90IHhtbTBbNF0gPSB7IGluaXR2YWwsIGluaXR2YWwsIGluaXR2YWwsIGluaXR2YWwgfTsK
IAlpbnQgc3RhdHVzID0gMTsKIAorI2lmZGVmIF9feDg2XzY0X18KIAlhc20gdm9sYXRpbGUoIiAg
IG1vdmRxdSAlMCwgJSV4bW0wXG4iCiAJCSAgICAgIiAgIG1vdiAlMCwgJSVyYnhcbiIKIAkJICAg
ICAiMTogZGVjICUyXG4iCkBAIC04MCw2ICs4MCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3JlZ3Nf
bG9vcCh1aW50MzJfdCBpbml0dmFsKQogCQkgICAgICIzOlxuIgogCQkgICAgIDogIittIiAoeG1t
MCksICIrciIgKHN0YXR1cykKIAkJICAgICA6ICJyIiAobnVtX2l0ZXJzKSA6ICJyYXgiLCAicmJ4
IiwgInhtbTAiKTsKKyNlbmRpZgogCiAJaWYgKHN0YXR1cykgewogCQl0c3RfcmVzKFRGQUlMLApA
QCAtMTg4LDEwICsxODksNyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHZvaWQpCiAKIHN0YXRpYyBz
dHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKIAkudGVzdF9hbGwgPSBkb190ZXN0LAorCS5hcmNoID0g
Ing4Nl82NCIsCiAJLmZvcmtzX2NoaWxkID0gMSwKIAkubmVlZHNfY2hlY2twb2ludHMgPSAxLAog
fTsKLQotI2Vsc2UgLyogIV9feDg2XzY0X18gKi8KLQlUU1RfVEVTVF9UQ09ORigidGhpcyB0ZXN0
IGlzIG9ubHkgc3VwcG9ydGVkIG9uIHg4Nl82NCIpOwotI2VuZGlmIC8qIF9feDg2XzY0X18gKi8K
LS0gCjIuMjAuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
