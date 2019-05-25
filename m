Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 088172A44F
	for <lists+linux-ltp@lfdr.de>; Sat, 25 May 2019 14:03:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AE512D0143
	for <lists+linux-ltp@lfdr.de>; Sat, 25 May 2019 14:03:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 04D313EA1CA
 for <ltp@lists.linux.it>; Sat, 25 May 2019 14:03:30 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 00F81144B0E9
 for <ltp@lists.linux.it>; Sat, 25 May 2019 14:03:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 165A437EEA;
 Sat, 25 May 2019 12:03:26 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8194E60C64;
 Sat, 25 May 2019 12:03:25 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: pvorel@suse.cz
Date: Sat, 25 May 2019 19:51:11 +0800
Message-Id: <20190525115112.15399-1-xzhou@redhat.com>
In-Reply-To: <20190524122357.GA28108@dell5510>
References: <20190524122357.GA28108@dell5510>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sat, 25 May 2019 12:03:26 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v4 1/2] OVL_MNT: add helpers to setup overlayfs
	mountpoint
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

RGVmaW5lIGNvbnN0cmFpbnRzIG9mIG5lZWRlZCBvdmVybGF5ZnMgZGlyczsKY3JlYXRlX292ZXJs
YXlfZGlycygpIHRvIGNyZWF0ZSBsb3dlci91cHBlci93b3JrIGRpcnM7Cm1vdW50X292ZXJsYXko
KSB0byBtb3VudCBvdmVybGF5ZnM7ClNBRkVfTU9VTlRfT1ZFUkxBWSBtYWNybyB0byBtb3VudCBv
dmVybGF5ZnMgc2FmZWx5LCB0c3RfYnJrIFRDT05GCmlmIG1vdW50IGZhaWwgd2l0aCBlcnJubyBF
Tk9ERVY7ClRTVF9NT1VOVF9PVkVSTEFZICBtYWNybyB0byBtb3VudCBvdmVybGF5ZnMgYW5kIHJl
dHVybiAwIGlmIHN1Y2NlZWRzOwoKU3VnZ2VzdGVkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3Vz
ZS5jej4KU3VnZ2VzdGVkLWJ5OiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCnY0OgogIFVw
ZGF0ZSBFTk9ERVYgaGFuZGxlIGxvZ2ljCiAgRGVmaW5lIFRTVF9NT1VOVF9PVkVSTEFZIGFuZCBT
QUZFX01PVU5UX09WRVJMQVkgbWFjcm9zCiAgQ2hhbmdlIGhlbHBlciBuYW1lcwp2MzoKICBTcGxp
dCBzZXR1cCB0byAyIHBhcnRzOiBjcmVhdGluZyBmaWxlcyBhbmQgbW91bnRpbmcuCiAgVXNlIG1h
Y3JvIFNBRkVfTU9VTlRfT1ZFUkxBWUZTLgogIEhhbmRsZSBFTk9ERVYgZGlmZmVyZW50bHkgZm9y
IDQgdGVzdGNhc2VzIHdlIGhhdmUgbW9kaWZpZWQuCnYyOgogIGRlZmluZSBjb25zdHJhaW50cyBp
biBoZWFkZXIgZmlsZS4KICBhZGQgYSBzZXR1cCBoZWxwZXIgdG8gY3JlYXRlIGRpcnMgYW5kIG1v
dW50LgoKIGluY2x1ZGUvc2FmZV9maWxlX29wc19mbi5oICB8ICA0ICsrKysKIGluY2x1ZGUvdHN0
X2ZzLmggICAgICAgICAgICB8ICA2ICsrKysrCiBpbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3BzLmgg
fCAgNiArKysrKwogbGliL3RzdF9mc19zZXR1cC5jICAgICAgICAgIHwgNDYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3RzdF9mc19zZXR1cC5jCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9zYWZlX2ZpbGVfb3BzX2ZuLmggYi9pbmNsdWRlL3NhZmVfZmlsZV9vcHNfZm4uaApp
bmRleCAzNWVjNGZiMWYuLjUyNjQ1NGRhNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zYWZlX2ZpbGVf
b3BzX2ZuLmgKKysrIGIvaW5jbHVkZS9zYWZlX2ZpbGVfb3BzX2ZuLmgKQEAgLTc2LDQgKzc2LDgg
QEAgdm9pZCBzYWZlX3RvdWNoKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sCiAJ
CWNvbnN0IGNoYXIgKnBhdGhuYW1lLAogCQltb2RlX3QgbW9kZSwgY29uc3Qgc3RydWN0IHRpbWVz
cGVjIHRpbWVzWzJdKTsKIAorLyogaGVscGVyIGZ1bmN0aW9ucyB0byBzZXR1cCBvdmVybGF5ZnMg
bW91bnRwb2ludCAqLwordm9pZCBjcmVhdGVfb3ZlcmxheV9kaXJzKHZvaWQpOworaW50IG1vdW50
X292ZXJsYXkoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywgaW50IHNhZmUpOwor
CiAjZW5kaWYgLyogU0FGRV9GSUxFX09QU19GTiAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS90c3Rf
ZnMuaCBiL2luY2x1ZGUvdHN0X2ZzLmgKaW5kZXggNDIzY2E4MmVjLi5jZTExMGI3MjMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvdHN0X2ZzLmgKKysrIGIvaW5jbHVkZS90c3RfZnMuaApAQCAtNTAsNiAr
NTAsMTIgQEAgZW51bSB7CiAJVFNUX0dCID0gMTA3Mzc0MTgyNCwKIH07CiAKKyNkZWZpbmUgT1ZM
X0JBU0VfTU5UUE9JTlQgICAgICAgICJtbnRwb2ludCIKKyNkZWZpbmUgT1ZMX0xPV0VSCU9WTF9C
QVNFX01OVFBPSU5UIi9sb3dlciIKKyNkZWZpbmUgT1ZMX1VQUEVSCU9WTF9CQVNFX01OVFBPSU5U
Ii91cHBlciIKKyNkZWZpbmUgT1ZMX1dPUksJT1ZMX0JBU0VfTU5UUE9JTlQiL3dvcmsiCisjZGVm
aW5lIE9WTF9NTlQJCU9WTF9CQVNFX01OVFBPSU5UIi9vdmwiCisKIC8qCiAgKiBAcGF0aDogcGF0
aCBpcyB0aGUgcGF0aG5hbWUgb2YgYW55IGZpbGUgd2l0aGluIHRoZSBtb3VudGVkIGZpbGUgc3lz
dGVtCiAgKiBAbXVsdDogbXVsdCBzaG91bGQgYmUgVFNUX0tCLCBUU1RfTUIgb3IgVFNUX0dCCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3BzLmggYi9pbmNsdWRlL3RzdF9zYWZl
X2ZpbGVfb3BzLmgKaW5kZXggNWMzZmVhNGUyLi5iNjJhNzQ0N2YgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdHN0X3NhZmVfZmlsZV9vcHMuaAorKysgYi9pbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3BzLmgK
QEAgLTU5LDQgKzU5LDEwIEBACiAJc2FmZV90b3VjaChfX0ZJTEVfXywgX19MSU5FX18sIE5VTEws
IFwKIAkJCShwYXRobmFtZSksIChtb2RlKSwgKHRpbWVzKSkKIAorI2RlZmluZSBTQUZFX01PVU5U
X09WRVJMQVkoKSBcCisJKCh2b2lkKSBtb3VudF9vdmVybGF5KF9fRklMRV9fLCBfX0xJTkVfXywg
MSkpCisKKyNkZWZpbmUgVFNUX01PVU5UX09WRVJMQVkoKSBcCisJKG1vdW50X292ZXJsYXkoX19G
SUxFX18sIF9fTElORV9fLCAwKSA9PSAwKQorCiAjZW5kaWYgLyogVFNUX1NBRkVfRklMRV9PUFMg
Ki8KZGlmZiAtLWdpdCBhL2xpYi90c3RfZnNfc2V0dXAuYyBiL2xpYi90c3RfZnNfc2V0dXAuYwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmRlMDljNzEzNQotLS0gL2Rldi9u
dWxsCisrKyBiL2xpYi90c3RfZnNfc2V0dXAuYwpAQCAtMCwwICsxLDQ2IEBACisvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorLyoKKyAqIERFU0NSSVBUSU9OCisg
KglBIHBsYWNlIGZvciBzZXR1cCBmaWxlc3lzdGVtIGhlbHBlcnMuCisgKi8KKworI2luY2x1ZGUg
PHN0ZGludC5oPgorI2luY2x1ZGUgPGVycm5vLmg+CisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNs
dWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzeXMvdmZzLmg+CisjaW5jbHVkZSA8c3lzL21vdW50
Lmg+CisKKyNkZWZpbmUgVFNUX05PX0RFRkFVTFRfTUFJTgorI2luY2x1ZGUgInRzdF90ZXN0Lmgi
CisjaW5jbHVkZSAidHN0X2ZzLmgiCisKK3ZvaWQgY3JlYXRlX292ZXJsYXlfZGlycyh2b2lkKQor
eworCVNBRkVfTUtESVIoT1ZMX0xPV0VSLCAwNzU1KTsKKwlTQUZFX01LRElSKE9WTF9VUFBFUiwg
MDc1NSk7CisJU0FGRV9NS0RJUihPVkxfV09SSywgMDc1NSk7CisJU0FGRV9NS0RJUihPVkxfTU5U
LCAwNzU1KTsKK30KKworaW50IG1vdW50X292ZXJsYXkoY29uc3QgY2hhciAqZmlsZSwgY29uc3Qg
aW50IGxpbmVubywgaW50IHNhZmUpCit7CisJaW50IHJldCA9IDA7CisJY2hhciAqY2ZnbXNnID0g
Im92ZXJsYXlmcyBpcyBub3QgY29uZmlndXJlZCBpbiB0aGlzIGtlcm5lbC4iOworCisJcmV0ID0g
bW91bnQoIm92ZXJsYXkiLCBPVkxfTU5ULCAib3ZlcmxheSIsIDAsICJsb3dlcmRpcj0iT1ZMX0xP
V0VSCisJCSAgICAiLHVwcGVyZGlyPSJPVkxfVVBQRVIiLHdvcmtkaXI9Ik9WTF9XT1JLKTsKKwlp
ZiAocmV0IDwgMCkgeworCQlpZiAoZXJybm8gPT0gRU5PREVWKSB7CisJCQlpZiAoc2FmZSkgewor
CQkJCXRzdF9icmsoVENPTkYsIGNmZ21zZyk7CisJCQl9IGVsc2UgeworCQkJCXRzdF9yZXMoVElO
Rk8sIGNmZ21zZyk7CisJCQkJcmV0dXJuIDE7CisJCQl9CisJCX0gZWxzZSB7CisJCQl0c3RfYnJr
KFRCUk9LIHwgVEVSUk5PLCAib3ZlcmxheWZzIG1vdW50IGZhaWxlZCIpOworCQl9CisJfQorCXJl
dHVybiAwOworfQotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
