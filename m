Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C52C86F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C159294B6A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E7550294AED
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:13:06 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1E41014016EC
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:13:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92A6530C0DFE;
 Tue, 28 May 2019 14:13:04 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8ACC6B8C6;
 Tue, 28 May 2019 14:13:02 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: amir73il@gmail.com
Date: Tue, 28 May 2019 22:12:14 +0800
Message-Id: <20190528141214.18752-4-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-1-xzhou@redhat.com>
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 28 May 2019 14:13:04 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v6 4/4] syscalls/swapoff/swapoff0{1,
	2}: use helper to check support status
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

T2Ygc3dhcCBvcGVyYXRpb25zLiBDaGFuZ2UgTWFrZWZpbGUgdG8gdXNlIGZ1bmN0aW9ucyBmcm9t
Ci4uL3N3YXBvbi9saWJzd2Fwb24uYwoKU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91
QHJlZGhhdC5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2Vm
aWxlICAgICB8ICAzICsrLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2Vm
aWxlLmluYyB8ICA2ICsrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3
YXBvZmYwMS5jICB8IDEwICsrLS0tLS0tLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dh
cG9mZi9zd2Fwb2ZmMDIuYyAgfCAgOSArLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlLmluYwoKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZQppbmRleCBiZDYxN2Q4MDYuLjUzNmIyZGJhYyAxMDA2
NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZQpAQCAtMTksNSArMTks
NiBAQAogdG9wX3NyY2RpcgkJPz0gLi4vLi4vLi4vLi4KIAogaW5jbHVkZSAkKHRvcF9zcmNkaXIp
L2luY2x1ZGUvbWsvdGVzdGNhc2VzLm1rCi0KK2luY2x1ZGUgJChhYnNfc3JjZGlyKS8uL01ha2Vm
aWxlLmluYwogaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvZ2VuZXJpY19sZWFmX3Rh
cmdldC5taworJChNQUtFX1RBUkdFVFMpOiAlOiAlLm8gLi4vc3dhcG9uL2xpYnN3YXBvbi5vCmRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUuaW5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlLmluYwpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjY1MzUwY2JlYgotLS0gL2Rldi9udWxsCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZS5pbmMKQEAgLTAs
MCArMSw2IEBACitMSUJESVIJCQkrPSAuLi9zd2Fwb24vCitMSUJTV0FQT04JCTo9ICQoTElCRElS
KS9saWJzd2Fwb24ubworJChMSUJTV0FQT04pOgorCSQoTUFLRSkgLUMgJChMSUJESVIpCitDUFBG
TEFHUwkJKz0gLUkkKGFic19zcmNkaXIpLyQoTElCRElSKQorTERGTEFHUwkJCSs9IC1MJChhYnNf
YnVpbGRkaXIpLyQoTElCRElSKQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zd2Fwb2ZmL3N3YXBvZmYwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2Zm
L3N3YXBvZmYwMS5jCmluZGV4IGE2M2U2NjFhNS4uZTExNTI2OWMwIDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5jCkBAIC0yNSw2ICsyNSw3IEBACiAj
aW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSAiY29uZmlnLmgiCiAjaW5jbHVkZSAibGFwaS9z
eXNjYWxscy5oIgorI2luY2x1ZGUgIi4uL3N3YXBvbi9saWJzd2Fwb24uaCIKIAogc3RhdGljIHZv
aWQgc2V0dXAodm9pZCk7CiBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpOwpAQCAtODYsMTQgKzg3
LDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAotCXN3aXRj
aCAoKGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2UgVFNUX05G
U19NQUdJQzoKLQljYXNlIFRTVF9UTVBGU19NQUdJQzoKLQkJdHN0X2Jya20oVENPTkYsIGNsZWFu
dXAsCi0JCQkgIkNhbm5vdCBkbyBzd2Fwb2ZmIG9uIGEgZmlsZSBvbiAlcyBmaWxlc3lzdGVtIiwK
LQkJCSB0c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUpKTsKLQlicmVhazsKLQl9CisJaXNfc3dhcF9z
dXBwb3J0ZWQoY2xlYW51cCwgIi4vdHN0c3dhcCIpOwogCiAJaWYgKCF0c3RfZnNfaGFzX2ZyZWUo
TlVMTCwgIi4iLCA2NCwgVFNUX01CKSkgewogCQl0c3RfYnJrbShUQlJPSywgY2xlYW51cCwKZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2ZmMDIuYyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2ZmMDIuYwppbmRleCBiNWM2
MzEyYTEuLmE1OWFhYWEwNiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9z
d2Fwb2ZmL3N3YXBvZmYwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9m
Zi9zd2Fwb2ZmMDIuYwpAQCAtMTM4LDE0ICsxMzgsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgodHlwZSA9IHRzdF9mc190eXBlKGNsZWFu
dXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNUX1RNUEZTX01BR0lD
OgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRvIHN3YXBvZmYgb24g
YSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJIHRzdF9mc190eXBlX25hbWUodHlwZSkpOwot
CWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBvcnRlZChjbGVhbnVwLCAiLi90c3Rzd2FwIik7CiAK
IAlpZiAoIXRzdF9mc19oYXNfZnJlZShOVUxMLCAiLiIsIDEsIFRTVF9LQikpIHsKIAkJdHN0X2Jy
a20oVEJST0ssIGNsZWFudXAsCi0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
