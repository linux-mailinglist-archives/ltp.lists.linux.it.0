Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0729422
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:04:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 062343EA2D1
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:04:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A0E673EA2D1
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:04:52 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9CBDC60162F
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:04:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6275AC0733C9;
 Fri, 24 May 2019 09:04:49 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1133110027B9;
 Fri, 24 May 2019 09:04:47 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: pvorel@suse.cz
Date: Fri, 24 May 2019 17:04:40 +0800
Message-Id: <20190524090441.21586-1-xzhou@redhat.com>
In-Reply-To: <20190524073045.GA29592@dell5510>
References: <20190524073045.GA29592@dell5510>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 24 May 2019 09:04:49 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: [LTP] [PATCH v3 1/2] OVL_MNT: add helpers to setup overlayfs
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

QWxzbyBkZWZpbmVkIGNvbnN0cmFpbnRzIG9mIG5lZWRlZCBvdmVybGF5ZnMgZGlycy4Kc2V0dXBf
b3ZlcmxheWZzX2ZpbGVzKCkgdG8gY3JlYXRlIGxvd2VyL3VwcGVyL3dvcmsgZGlycy4Kc2FmZV9t
b3VudF9vdmVybGF5ZnMoKSB0byBtb3VudCBvdmVybGF5ZnMuCgpTaWduZWQtb2ZmLWJ5OiBNdXJw
aHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCnYzOgogIFNwbGl0IHNldHVwIHRvIDIgcGFy
dHM6IGNyZWF0aW5nIGZpbGVzIGFuZCBtb3VudGluZy4KICBVc2UgbWFjcm8gU0FGRV9NT1VOVF9P
VkVSTEFZRlMuCiAgSGFuZGxlIEVOT0RFViBkaWZmZXJlbnRseSBmb3IgNCB0ZXN0Y2FzZXMgd2Ug
aGF2ZSBtb2RpZmllZC4KdjI6CiAgZGVmaW5lIGNvbnN0cmFpbnRzIGluIGhlYWRlciBmaWxlLgog
IGFkZCBhIHNldHVwIGhlbHBlciB0byBjcmVhdGUgZGlycyBhbmQgbW91bnQuCgogaW5jbHVkZS9z
YWZlX2ZpbGVfb3BzX2ZuLmggIHwgIDUgKysrKwogaW5jbHVkZS90c3RfZnMuaCAgICAgICAgICAg
IHwgIDYgKysrKwogaW5jbHVkZS90c3Rfc2FmZV9maWxlX29wcy5oIHwgIDMgKysKIGxpYi90c3Rf
ZnNfc2V0dXAuYyAgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi90c3RfZnNfc2V0dXAuYwoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2FmZV9maWxlX29w
c19mbi5oIGIvaW5jbHVkZS9zYWZlX2ZpbGVfb3BzX2ZuLmgKaW5kZXggMzVlYzRmYjFmLi4yNDkx
ZmE0MGMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc2FmZV9maWxlX29wc19mbi5oCisrKyBiL2luY2x1
ZGUvc2FmZV9maWxlX29wc19mbi5oCkBAIC03Niw0ICs3Niw5IEBAIHZvaWQgc2FmZV90b3VjaChj
b25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLAogCQljb25zdCBjaGFyICpwYXRobmFt
ZSwKIAkJbW9kZV90IG1vZGUsIGNvbnN0IHN0cnVjdCB0aW1lc3BlYyB0aW1lc1syXSk7CiAKKy8q
IGhlbHBlciBmdW5jdGlvbnMgdG8gc2V0dXAgb3ZlcmxheWZzIG1vdW50cG9pbnQgKi8KK3ZvaWQg
c2V0dXBfb3ZlcmxheWZzX2ZpbGVzKHZvaWQpOworCitpbnQgc2FmZV9tb3VudF9vdmVybGF5ZnMo
Y29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKKwkJdm9pZCAoY2xlYW51cF9mbiko
dm9pZCksIGludCBpbmZvZmxhZyk7CiAjZW5kaWYgLyogU0FGRV9GSUxFX09QU19GTiAqLwpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS90c3RfZnMuaCBiL2luY2x1ZGUvdHN0X2ZzLmgKaW5kZXggNDIzY2E4
MmVjLi5jZTExMGI3MjMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdHN0X2ZzLmgKKysrIGIvaW5jbHVk
ZS90c3RfZnMuaApAQCAtNTAsNiArNTAsMTIgQEAgZW51bSB7CiAJVFNUX0dCID0gMTA3Mzc0MTgy
NCwKIH07CiAKKyNkZWZpbmUgT1ZMX0JBU0VfTU5UUE9JTlQgICAgICAgICJtbnRwb2ludCIKKyNk
ZWZpbmUgT1ZMX0xPV0VSCU9WTF9CQVNFX01OVFBPSU5UIi9sb3dlciIKKyNkZWZpbmUgT1ZMX1VQ
UEVSCU9WTF9CQVNFX01OVFBPSU5UIi91cHBlciIKKyNkZWZpbmUgT1ZMX1dPUksJT1ZMX0JBU0Vf
TU5UUE9JTlQiL3dvcmsiCisjZGVmaW5lIE9WTF9NTlQJCU9WTF9CQVNFX01OVFBPSU5UIi9vdmwi
CisKIC8qCiAgKiBAcGF0aDogcGF0aCBpcyB0aGUgcGF0aG5hbWUgb2YgYW55IGZpbGUgd2l0aGlu
IHRoZSBtb3VudGVkIGZpbGUgc3lzdGVtCiAgKiBAbXVsdDogbXVsdCBzaG91bGQgYmUgVFNUX0tC
LCBUU1RfTUIgb3IgVFNUX0dCCmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3Bz
LmggYi9pbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3BzLmgKaW5kZXggNWMzZmVhNGUyLi5kMjExYjQw
ZmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdHN0X3NhZmVfZmlsZV9vcHMuaAorKysgYi9pbmNsdWRl
L3RzdF9zYWZlX2ZpbGVfb3BzLmgKQEAgLTU5LDQgKzU5LDcgQEAKIAlzYWZlX3RvdWNoKF9fRklM
RV9fLCBfX0xJTkVfXywgTlVMTCwgXAogCQkJKHBhdGhuYW1lKSwgKG1vZGUpLCAodGltZXMpKQog
CisjZGVmaW5lIFNBRkVfTU9VTlRfT1ZFUkxBWUZTKGZsYWcpIFwKKwlzYWZlX21vdW50X292ZXJs
YXlmcyhfX0ZJTEVfXywgX19MSU5FX18sIE5VTEwsIChmbGFnKSkKKwogI2VuZGlmIC8qIFRTVF9T
QUZFX0ZJTEVfT1BTICovCmRpZmYgLS1naXQgYS9saWIvdHN0X2ZzX3NldHVwLmMgYi9saWIvdHN0
X2ZzX3NldHVwLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4wZjI4YmVi
NjEKLS0tIC9kZXYvbnVsbAorKysgYi9saWIvdHN0X2ZzX3NldHVwLmMKQEAgLTAsMCArMSw1NiBA
QAorLyoKKyAqIERFU0NSSVBUSU9OCisgKglBIHBsYWNlIGZvciBzZXR1cCBmaWxlc3lzdGVtIGhl
bHBlcnMuCisgKi8KKworI2luY2x1ZGUgPHN0ZGludC5oPgorI2luY2x1ZGUgPGVycm5vLmg+Cisj
aW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzeXMvdmZz
Lmg+CisjaW5jbHVkZSA8c3lzL21vdW50Lmg+CisKKyNkZWZpbmUgVFNUX05PX0RFRkFVTFRfTUFJ
TgorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisjaW5jbHVkZSAidHN0X2ZzLmgiCisKK3ZvaWQgc2V0
dXBfb3ZlcmxheWZzX2ZpbGVzKHZvaWQpCit7CisJU0FGRV9NS0RJUihPVkxfTE9XRVIsIDA3NTUp
OworCVNBRkVfTUtESVIoT1ZMX1VQUEVSLCAwNzU1KTsKKwlTQUZFX01LRElSKE9WTF9XT1JLLCAw
NzU1KTsKKwlTQUZFX01LRElSKE9WTF9NTlQsIDA3NTUpOworfQorCitpbnQgc2FmZV9tb3VudF9v
dmVybGF5ZnMoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubywKKwkJdm9pZCAoY2xl
YW51cF9mbikodm9pZCksIGludCBpbmZvZmxhZykKK3sKKwlpbnQgcmV0ID0gMDsKKwljaGFyICpj
Zmdtc2cgPSAib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGluIHRoaXMga2VybmVsLiI7CisK
KwlyZXQgPSBtb3VudCgib3ZlcmxheSIsIE9WTF9NTlQsICJvdmVybGF5IiwgMCwgImxvd2VyZGly
PSJPVkxfTE9XRVIKKwkJICAgICIsdXBwZXJkaXI9Ik9WTF9VUFBFUiIsd29ya2Rpcj0iT1ZMX1dP
UkspOworCWlmIChyZXQgPCAwKSB7CisJCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKKwkJCS8qIFRv
IGtlZXAgdGhlIG9yaWdpbmFsIHRlc3QgbG9naWMgb2YgdGVzdGNhc2VzLCB1c2UKKwkJCSAgIGlu
Zm9mbGFnIHRvIGhhbmRsZSBFTk9ERVYgZGlmZmVyZW50bHkuIExpa2UKKwkJCSAgIGV4ZWN2ZWF0
MDMgaW5vdGlmeTB7Nyw4fSByZWFkYWhlYWQwMi4gKi8KKwkJCXN3aXRjaCAoaW5mb2ZsYWcpIHsK
KwkJCWNhc2UgMToKKwkJCQl0c3RfcmVzKFRJTkZPLCBjZmdtc2cpOworCQkJCXJldHVybiAxOwor
CQkJY2FzZSAyOgorCQkJCXRzdF9icmsoVENPTkYsIGNmZ21zZyk7CisJCQkJYnJlYWs7CisJCQlj
YXNlIDM6CisJCQkJdHN0X2JyayhUQ09ORiwgY2ZnbXNnKTsKKwkJCWRlZmF1bHQ6CisJCQkJdHN0
X2JyayhUQlJPSyB8IFRFUlJOTywgIm92ZXJsYXlmcyBtb3VudCBmYWlsZWQiKTsKKwkJCQlicmVh
azsKKwkJCX0KKwkJfSBlbHNlIHsKKwkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJvdmVybGF5
ZnMgbW91bnQgZmFpbGVkIik7CisJCX0KKwl9CisJcmV0dXJuIDA7Cit9Ci0tIAoyLjIxLjAKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
