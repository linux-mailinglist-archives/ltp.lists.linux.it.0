Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4642C862
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:12:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A0A4294AC4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:12:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C7E0A3EA4D7
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:12:57 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C96241A00CBC
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:12:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 871C446217;
 Tue, 28 May 2019 14:12:55 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F362A10027C5;
 Tue, 28 May 2019 14:12:54 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: amir73il@gmail.com
Date: Tue, 28 May 2019 22:12:12 +0800
Message-Id: <20190528141214.18752-2-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-1-xzhou@redhat.com>
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 28 May 2019 14:12:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v6 2/4] swapon/libswapon: add helper is_swap_supported
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

VG8gY2hlY2sgaWYgdGhlIGZpbGVzeXN0ZW0gd2UgYXJlIHRlc3Rpbmcgb24gc3VwcG9ydHMgRklC
TUFQLCBta3N3YXAsCnN3YXBvbiBhbmQgc3dhcG9mZiBvcGVyYXRpb25zLgpNb2RpZnkgbWFrZV9z
d2FwZmlsZSBmdW5jdGlvbiB0byB0ZXN0IG1rc3dhcCBzdXBwb3J0IHN0YXR1cyBzYWZlbHkuCgpT
aWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uYyB8IDQ1ICsrKysrKysrKysrKysr
KysrKystCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uaCB8ICA3
ICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMKaW5kZXggY2Y2
YTk4ODkxLi5mNjZkMTk1NDggMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c3dhcG9uL2xpYnN3YXBvbi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9u
L2xpYnN3YXBvbi5jCkBAIC0xOSwxMyArMTksMTUgQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGVy
cm5vLmg+CisjaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgogI2luY2x1ZGUgInRlc3QuaCIKICNp
bmNsdWRlICJsaWJzd2Fwb24uaCIKIAogLyoKICAqIE1ha2UgYSBzd2FwIGZpbGUKICAqLwotdm9p
ZCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFyICpzd2FwZmls
ZSkKK2ludCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFyICpz
d2FwZmlsZSwgaW50IHNhZmUpCiB7CiAJaWYgKCF0c3RfZnNfaGFzX2ZyZWUoTlVMTCwgIi4iLCBz
eXNjb25mKF9TQ19QQUdFU0laRSkgKiAxMCwKIAkgICAgVFNUX0JZVEVTKSkgewpAQCAtNDUsNSAr
NDcsNDQgQEAgdm9pZCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBj
aGFyICpzd2FwZmlsZSkKIAlhcmd2WzFdID0gc3dhcGZpbGU7CiAJYXJndlsyXSA9IE5VTEw7CiAK
LQl0c3RfcnVuX2NtZChjbGVhbnVwLCBhcmd2LCAiL2Rldi9udWxsIiwgIi9kZXYvbnVsbCIsIDAp
OworCXJldHVybiB0c3RfcnVuX2NtZChjbGVhbnVwLCBhcmd2LCAiL2Rldi9udWxsIiwgIi9kZXYv
bnVsbCIsIHNhZmUpOworfQorCisvKgorICogQ2hlY2sgc3dhcG9uL3N3YXBvZmYgc3VwcG9ydCBz
dGF0dXMgb2YgZmlsZXN5c3RlbXMgb3IgZmlsZXMKKyAqIHdlIGFyZSB0ZXN0aW5nIG9uLgorICov
Cit2b2lkIGlzX3N3YXBfc3VwcG9ydGVkKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFy
ICpmaWxlbmFtZSkKK3sKKwlpbnQgZmlibWFwID0gdHN0X2ZpYm1hcChmaWxlbmFtZSk7CisJbG9u
ZyBmc190eXBlID0gdHN0X2ZzX3R5cGUoY2xlYW51cCwgZmlsZW5hbWUpOworCWNvbnN0IGNoYXIg
KmZzdHlwZSA9IHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSk7CisKKwlpbnQgcmV0ID0gbWFrZV9z
d2FwZmlsZShOVUxMLCBmaWxlbmFtZSwgMSk7CisJaWYgKHJldCAhPSAwKSB7CisJCWlmIChmaWJt
YXAgIT0gMCkgeworCQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCisJCQkJIm1rc3dhcCBvbiAl
cyBub3Qgc3VwcG9ydGVkIiwgZnN0eXBlKTsKKwkJfSBlbHNlIHsKKwkJCXRzdF9icmttKFRGQUlM
LCBjbGVhbnVwLAorCQkJCSJta3N3YXAgb24gJXMgZmFpbGVkIiwgZnN0eXBlKTsKKwkJfQorCX0K
KworCVRFU1QobHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sIGZpbGVuYW1lLCAwKSk7CisJaWYgKFRF
U1RfUkVUVVJOID09IC0xKSB7CisJCWlmIChmaWJtYXAgIT0gMCAmJiBlcnJubyA9PSBFSU5WQUwp
IHsKKwkJCXRzdF9icmttKFRDT05GLCBjbGVhbnVwLAorCQkJCSJTd2FwZmlsZSBvbiAlcyBub3Qg
aW1wbGVtZW50ZWQiLCBmc3R5cGUpOworCQl9IGVsc2UgeworCQkJdHN0X2Jya20oVEZBSUwgfCBU
RVJSTk8sIGNsZWFudXAsCisJCQkJICJzd2Fwb24gb24gJXMgZmFpbGVkIiwgZnN0eXBlKTsKKwkJ
fQorCX0KKworCVRFU1QobHRwX3N5c2NhbGwoX19OUl9zd2Fwb2ZmLCBmaWxlbmFtZSwgMCkpOwor
CWlmIChURVNUX1JFVFVSTiA9PSAtMSkgeworCQl0c3RfYnJrbShURkFJTCB8IFRFUlJOTywgY2xl
YW51cCwKKwkJCSJzd2Fwb2ZmIG9uICVzIGZhaWxlZCIsIGZzdHlwZSk7CisJfQogfQpkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmggYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9saWJzd2Fwb24uaAppbmRleCA3ZjcyMTFlYjQu
LmE1MTgzM2VjMSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24v
bGlic3dhcG9uLmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dh
cG9uLmgKQEAgLTI5LDYgKzI5LDExIEBACiAvKgogICogTWFrZSBhIHN3YXAgZmlsZQogICovCi12
b2lkIG1ha2Vfc3dhcGZpbGUodm9pZCAoY2xlYW51cCkodm9pZCksIGNvbnN0IGNoYXIgKnN3YXBm
aWxlKTsKK2ludCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBjaGFy
ICpzd2FwZmlsZSwgaW50IHNhZmUpOwogCisvKgorICogQ2hlY2sgc3dhcG9uL3N3YXBvZmYgc3Vw
cG9ydCBzdGF0dXMgb2YgZmlsZXN5c3RlbXMgb3IgZmlsZXMKKyAqIHdlIGFyZSB0ZXN0aW5nIG9u
LgorICovCit2b2lkIGlzX3N3YXBfc3VwcG9ydGVkKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25z
dCBjaGFyICpmaWxlbmFtZSk7CiAjZW5kaWYgLyogX19MSUJTV0FQT05fSF9fICovCi0tIAoyLjIx
LjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
