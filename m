Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DB1EADA
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:22:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEB46294ADD
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:22:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 84484294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:21:59 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE508200B9E
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:21:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 31C2C83F3D;
 Wed, 15 May 2019 09:21:56 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A240D5D706;
 Wed, 15 May 2019 09:21:55 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it,
	pvorel@suse.cz
Date: Wed, 15 May 2019 17:21:28 +0800
Message-Id: <20190515092129.26336-1-xzhou@redhat.com>
In-Reply-To: <20190503210005.GA18171@x230>
References: <20190503210005.GA18171@x230>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 15 May 2019 09:21:56 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

VG8gY3JlYXRlIG92ZXJsYXlmcyBkaXJzLCBhbmQgbW91bnQgb3ZlcmxheWZzIGlmIG5lZWRlZC4K
ClNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgotLS0KdjI6CiAg
ZGVmaW5lIGNvbnN0cmFpbnRzIGluIGhlYWRlciBmaWxlCiAgYWRkIGEgc2V0dXAgaGVscGVyIHRv
IGNyZWF0ZSBkaXJzIGFuZCBtb3VudAoKIGluY2x1ZGUvdHN0X2ZzLmggICB8IDEyICsrKysrKysr
KysrKwogbGliL3RzdF9mc19zZXR1cC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBsaWIvdHN0X2ZzX3NldHVwLmMKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Rz
dF9mcy5oIGIvaW5jbHVkZS90c3RfZnMuaAppbmRleCA0MjNjYTgyZWMuLjc1MGJiMWE5MSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS90c3RfZnMuaAorKysgYi9pbmNsdWRlL3RzdF9mcy5oCkBAIC01MCw2
ICs1MCwxOCBAQCBlbnVtIHsKIAlUU1RfR0IgPSAxMDczNzQxODI0LAogfTsKIAorI2RlZmluZSBP
VkxfQkFTRV9NTlRQT0lOVCAgICAgICAgIm1udHBvaW50IgorI2RlZmluZSBPVkxfTE9XRVIJT1ZM
X0JBU0VfTU5UUE9JTlQiL2xvd2VyIgorI2RlZmluZSBPVkxfVVBQRVIJT1ZMX0JBU0VfTU5UUE9J
TlQiL3VwcGVyIgorI2RlZmluZSBPVkxfV09SSwlPVkxfQkFTRV9NTlRQT0lOVCIvd29yayIKKyNk
ZWZpbmUgT1ZMX01OVAkJT1ZMX0JBU0VfTU5UUE9JTlQiL292bCIKKworLyoKKyAqIENyZWF0ZSBh
Ym92ZSBvdmVybGF5ZnMgY29uc3RyYWludHMsIGlmIG1vdW50ID09IDEsCisgKiBtb3VudCBvdmVy
bGF5ZnMKKyAqLworaW50IHNldHVwX292ZXJsYXkoaW50IG1vdW50KTsKKwogLyoKICAqIEBwYXRo
OiBwYXRoIGlzIHRoZSBwYXRobmFtZSBvZiBhbnkgZmlsZSB3aXRoaW4gdGhlIG1vdW50ZWQgZmls
ZSBzeXN0ZW0KICAqIEBtdWx0OiBtdWx0IHNob3VsZCBiZSBUU1RfS0IsIFRTVF9NQiBvciBUU1Rf
R0IKZGlmZiAtLWdpdCBhL2xpYi90c3RfZnNfc2V0dXAuYyBiL2xpYi90c3RfZnNfc2V0dXAuYwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmIxODgwZWUxMQotLS0gL2Rldi9u
dWxsCisrKyBiL2xpYi90c3RfZnNfc2V0dXAuYwpAQCAtMCwwICsxLDQyIEBACisvKgorICogREVT
Q1JJUFRJT04KKyAqCUEgcGxhY2UgZm9yIHNldHVwIGZpbGVzeXN0ZW0gaGVscGVycy4KKyAqLwor
CisjaW5jbHVkZSA8c3RkaW50Lmg+CisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlIDxzdGRp
by5oPgorI2luY2x1ZGUgPHN0ZGxpYi5oPgorI2luY2x1ZGUgPHN5cy92ZnMuaD4KKyNpbmNsdWRl
IDxzeXMvbW91bnQuaD4KKworI2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOCisjaW5jbHVkZSAi
dHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJ0c3RfZnMuaCIKKworaW50IHNldHVwX292ZXJsYXkoaW50
IG1vdW50b3ZsKQoreworCWludCByZXQ7CisKKwkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50IHdp
dGggbG93ZXIgZGlyIGFuZCBmaWxlICovCisJU0FGRV9NS0RJUihPVkxfTE9XRVIsIDA3NTUpOwor
CVNBRkVfTUtESVIoT1ZMX1VQUEVSLCAwNzU1KTsKKwlTQUZFX01LRElSKE9WTF9XT1JLLCAwNzU1
KTsKKwlTQUZFX01LRElSKE9WTF9NTlQsIDA3NTUpOworCisJLyogT25seSBjcmVhdGUgZGlycywg
ZG8gbm90IG1vdW50ICovCisJaWYgKG1vdW50b3ZsID09IDApCisJCXJldHVybiAwOworCisJcmV0
ID0gbW91bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsICJsb3dlcmRpcj0iT1ZM
X0xPV0VSCisJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIiLHdvcmtkaXI9Ik9WTF9XT1JLKTsK
KwlpZiAocmV0IDwgMCkgeworCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7CisJCQl0c3RfcmVzKFRJ
TkZPLAorCQkJCSJvdmVybGF5ZnMgaXMgbm90IGNvbmZpZ3VyZWQgaW4gdGhpcyBrZXJuZWwuIik7
CisJCQlyZXR1cm4gMTsKKwkJfQorCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAib3ZlcmxheWZz
IG1vdW50IGZhaWxlZCIpOworCX0KKwlyZXR1cm4gMDsKK30KLS0gCjIuMjEuMAoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
