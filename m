Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AF2BE61
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AE1D3EA51C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1BFDC3EA1EF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9670A600659
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D42781DFB;
 Tue, 28 May 2019 04:40:01 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 023101820E;
 Tue, 28 May 2019 04:40:00 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: chrubis@suse.cz
Date: Tue, 28 May 2019 12:39:27 +0800
Message-Id: <20190528043929.19671-2-xzhou@redhat.com>
In-Reply-To: <20190528043929.19671-1-xzhou@redhat.com>
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 28 May 2019 04:40:01 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v5 2/4] swapon/libswapon: add helper is_swap_supported
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

VG8gY2hlY2sgaWYgdGhlIGZpbGVzeXN0ZW0gd2UgYXJlIHRlc3Rpbmcgb24gc3VwcG9ydHMgc3dh
cG9uL3N3YXBvZmYKb3BlcmF0aW9ucy4gS2VlcCBORlMgYW5kIFRNUEZTIG9uIHRoZSB3aGl0ZSBs
aXN0LiBEb24ndCByZXBvcnQgZmFpbAppZiBCVFJGUyBmYWlscyB3aXRoIEVJTlZBTC4KClNpZ25l
ZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgotLS0KIHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jIHwgNTYgKysrKysrKysrKysrKysrKysr
KysKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5oIHwgIDYgKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCmluZGV4IGNmNmE5ODg5MS4uZTAyZmRkNGFkIDEw
MDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYwor
KysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYwpAQCAtMTks
NiArMTksOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlICJsYXBp
L3N5c2NhbGxzLmgiCiAjaW5jbHVkZSAidGVzdC5oIgogI2luY2x1ZGUgImxpYnN3YXBvbi5oIgog
CkBAIC00NywzICs0OSw1NyBAQCB2b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCkodm9p
ZCksIGNvbnN0IGNoYXIgKnN3YXBmaWxlKQogCiAJdHN0X3J1bl9jbWQoY2xlYW51cCwgYXJndiwg
Ii9kZXYvbnVsbCIsICIvZGV2L251bGwiLCAwKTsKIH0KKworLyoKKyAqIENoZWNrIHN3YXBvbi9z
d2Fwb2ZmIHN1cHBvcnQgc3RhdHVzIG9mIGZpbGVzeXN0ZW1zIG9yIGZpbGVzCisgKiB3ZSBhcmUg
dGVzdGluZyBvbi4KKyAqLwordm9pZCBpc19zd2FwX3N1cHBvcnRlZCh2b2lkIChjbGVhbnVwKSh2
b2lkKSwgY29uc3QgY2hhciAqb3BzLAorCQkJCWNvbnN0IGNoYXIgKmZpbGVuYW1lKQoreworCWlu
dCBmaWJtYXAgPSB0c3RfZmlibWFwKGZpbGVuYW1lKTsKKwlsb25nIGZzX3R5cGUgPSB0c3RfZnNf
dHlwZShjbGVhbnVwLCBmaWxlbmFtZSk7CisJY29uc3QgY2hhciAqZnN0eXBlID0gdHN0X2ZzX3R5
cGVfbmFtZShmc190eXBlKTsKKworCS8qIHdoaXRlbGlzdCBsZWdhY3kgZnMgKi8KKwlzd2l0Y2gg
KGZzX3R5cGUpIHsKKwljYXNlIFRTVF9ORlNfTUFHSUM6CisJY2FzZSBUU1RfVE1QRlNfTUFHSUM6
CisJCXRzdF9icmttKFRDT05GLCBjbGVhbnVwLAorCQkJICJDYW5ub3QgZG8gJXMgb24gYSBmaWxl
IG9uICVzIGZpbGVzeXN0ZW0iLAorCQkJIG9wcywgZnN0eXBlKTsKKwlicmVhazsKKwl9CisKKwlt
YWtlX3N3YXBmaWxlKE5VTEwsIGZpbGVuYW1lKTsKKworCVRFU1QobHRwX3N5c2NhbGwoX19OUl9z
d2Fwb24sIGZpbGVuYW1lLCAwKSk7CisKKwlpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsKKwkJaWYg
KGZzX3R5cGUgPT0gVFNUX0JUUkZTX01BR0lDICYmIGVycm5vID09IEVJTlZBTCkgeworCQkJdHN0
X2Jya20oVENPTkYsIGNsZWFudXAsCisJCQkJIlN3YXBmaWxlIG9uIEJUUkZTIG5vdCBpbXBsZW1l
bnRlZCIpOworCQl9IGVsc2UgeworCQkJaWYgKGZpYm1hcCA9PSAwKSB7CisJCQkJdHN0X2Jya20o
VEZBSUwgfCBURVJSTk8sIGNsZWFudXAsCisJCQkJCSAic3dhcG9uIG9uICVzIGZhaWxlZCIsIGZz
dHlwZSk7CisJCQl9IGVsc2UgeworCQkJCXRzdF9icmttKFRDT05GLCBjbGVhbnVwLAorCQkJCQkg
InN3YXBvbiBvbiAlcyBpcyBub3Qgc3VwcG9ydGVkIiwKKwkJCQkJCWZzdHlwZSk7CisJCQl9CisJ
CX0KKwl9CisKKwlURVNUKGx0cF9zeXNjYWxsKF9fTlJfc3dhcG9mZiwgZmlsZW5hbWUsIDApKTsK
KworCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgeworCQlpZiAoZmlibWFwID09IDApIHsKKwkJCXRz
dF9icmttKFRGQUlMIHwgVEVSUk5PLCBjbGVhbnVwLAorCQkJCSJzd2Fwb2ZmIG9uICVzIGZhaWxl
ZCIsIGZzdHlwZSk7CisJCX0gZWxzZSB7CisJCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKKwkJ
CQkgInN3YXBvZmYgb24gJXMgaXMgbm90IHN1cHBvcnRlZCIsIGZzdHlwZSk7CisJCX0KKwl9Cit9
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24u
aCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5oCmluZGV4IDdm
NzIxMWViNC4uNGYyYzgzNjE0IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3N3YXBvbi9saWJzd2Fwb24uaAorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
bi9saWJzd2Fwb24uaApAQCAtMzEsNCArMzEsMTAgQEAKICAqLwogdm9pZCBtYWtlX3N3YXBmaWxl
KHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFyICpzd2FwZmlsZSk7CiAKKy8qCisgKiBD
aGVjayBzd2Fwb24vc3dhcG9mZiBzdXBwb3J0IHN0YXR1cyBvZiBmaWxlc3lzdGVtcyBvciBmaWxl
cworICogd2UgYXJlIHRlc3Rpbmcgb24uCisgKi8KK3ZvaWQgaXNfc3dhcF9zdXBwb3J0ZWQodm9p
ZCAoY2xlYW51cCkodm9pZCksIGNvbnN0IGNoYXIgKm9wcywKKwkJCQljb25zdCBjaGFyICpmaWxl
bmFtZSk7CiAjZW5kaWYgLyogX19MSUJTV0FQT05fSF9fICovCi0tIAoyLjIxLjAKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
