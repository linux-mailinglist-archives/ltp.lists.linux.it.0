Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 164843C567
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:49:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4F763EB10D
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:49:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BB4E23EB006
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:57 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 72DA0600B05
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:48:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9B803082E25;
 Tue, 11 Jun 2019 07:48:55 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2626360BC9;
 Tue, 11 Jun 2019 07:48:54 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: liwang@redhat.com
Date: Tue, 11 Jun 2019 15:47:41 +0800
Message-Id: <20190611074741.31903-4-xzhou@redhat.com>
In-Reply-To: <20190611074741.31903-1-xzhou@redhat.com>
References: <CAEemH2e5b4q+bOeE3v8FG-piSUteCinPMVmxpnkVcYCmrUc4Uw@mail.gmail.com>
 <20190611074741.31903-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 11 Jun 2019 07:48:55 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v7 4/4] syscalls/swapoff/swapoff0{1,
	2}: use helpers to check support status
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
Ci4uL3N3YXBvbi9saWJzd2Fwb24uYwoKUmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRo
YXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KLS0t
CiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUgICAgIHwgIDMgKyst
CiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUuaW5jIHwgIDYgKysr
KysrCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMgIHwgMTAg
KystLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMi5j
ICB8IDExICsrLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvc3dhcG9mZi9NYWtlZmlsZS5pbmMKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
ZmYvTWFrZWZpbGUKaW5kZXggYmQ2MTdkODA2Li41MzZiMmRiYWMgMTAwNjQ0Ci0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZQorKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUKQEAgLTE5LDUgKzE5LDYgQEAKIHRvcF9zcmNk
aXIJCT89IC4uLy4uLy4uLy4uCiAKIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rl
c3RjYXNlcy5tawotCitpbmNsdWRlICQoYWJzX3NyY2RpcikvLi9NYWtlZmlsZS5pbmMKIGluY2x1
ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2dlbmVyaWNfbGVhZl90YXJnZXQubWsKKyQoTUFL
RV9UQVJHRVRTKTogJTogJS5vIC4uL3N3YXBvbi9saWJzd2Fwb24ubwpkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL01ha2VmaWxlLmluYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9NYWtlZmlsZS5pbmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwLi42NTM1MGNiZWIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvTWFrZWZpbGUuaW5jCkBAIC0wLDAgKzEsNiBAQAorTElC
RElSCQkJKz0gLi4vc3dhcG9uLworTElCU1dBUE9OCQk6PSAkKExJQkRJUikvbGlic3dhcG9uLm8K
KyQoTElCU1dBUE9OKToKKwkkKE1BS0UpIC1DICQoTElCRElSKQorQ1BQRkxBR1MJCSs9IC1JJChh
YnNfc3JjZGlyKS8kKExJQkRJUikKK0xERkxBR1MJCQkrPSAtTCQoYWJzX2J1aWxkZGlyKS8kKExJ
QkRJUikKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fw
b2ZmMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2ZmMDEuYwpp
bmRleCBhNjNlNjYxYTUuLmUxMTUyNjljMCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvc3dhcG9mZi9zd2Fwb2ZmMDEuYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgPHN0ZGxp
Yi5oPgogI2luY2x1ZGUgImNvbmZpZy5oIgogI2luY2x1ZGUgImxhcGkvc3lzY2FsbHMuaCIKKyNp
bmNsdWRlICIuLi9zd2Fwb24vbGlic3dhcG9uLmgiCiAKIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQp
Owogc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKQEAgLTg2LDE0ICs4Nyw3IEBAIHN0YXRpYyB2
b2lkIHNldHVwKHZvaWQpCiAKIAl0c3RfdG1wZGlyKCk7CiAKLQlzd2l0Y2ggKChmc190eXBlID0g
dHN0X2ZzX3R5cGUoY2xlYW51cCwgIi4iKSkpIHsKLQljYXNlIFRTVF9ORlNfTUFHSUM6Ci0JY2Fz
ZSBUU1RfVE1QRlNfTUFHSUM6Ci0JCXRzdF9icmttKFRDT05GLCBjbGVhbnVwLAotCQkJICJDYW5u
b3QgZG8gc3dhcG9mZiBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCi0JCQkgdHN0X2ZzX3R5
cGVfbmFtZShmc190eXBlKSk7Ci0JYnJlYWs7Ci0JfQorCWlzX3N3YXBfc3VwcG9ydGVkKGNsZWFu
dXAsICIuL3RzdHN3YXAiKTsKIAogCWlmICghdHN0X2ZzX2hhc19mcmVlKE5VTEwsICIuIiwgNjQs
IFRTVF9NQikpIHsKIAkJdHN0X2Jya20oVEJST0ssIGNsZWFudXAsCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMKaW5kZXggYjVjNjMxMmExLi44OTU0Zjk3
NWYgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9mZi9zd2Fwb2Zm
MDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMK
QEAgLTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlICJ0ZXN0LmgiCiAjaW5jbHVkZSAibGFwaS9zeXNj
YWxscy5oIgogI2luY2x1ZGUgInNhZmVfbWFjcm9zLmgiCisjaW5jbHVkZSAiLi4vc3dhcG9uL2xp
YnN3YXBvbi5oIgogCiBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKTsKIHN0YXRpYyB2b2lkIGNsZWFu
dXAodm9pZCk7CkBAIC0xMjQsNyArMTI1LDYgQEAgc3RhdGljIHZvaWQgY2xlYW51cDAxKHZvaWQp
CiAKIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiB7Ci0JbG9uZyB0eXBlOwogCXN0cnVjdCBwYXNz
d2QgKm5vYm9keTsKIAogCXRzdF9zaWcoRk9SSywgREVGX0hBTkRMRVIsIGNsZWFudXApOwpAQCAt
MTM4LDE0ICsxMzgsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCiAJdHN0X3RtcGRpcigp
OwogCi0Jc3dpdGNoICgodHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIuIikpKSB7Ci0JY2Fz
ZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNUX1RNUEZTX01BR0lDOgotCQl0c3RfYnJrbShUQ09O
RiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRvIHN3YXBvZmYgb24gYSBmaWxlIG9uICVzIGZpbGVz
eXN0ZW0iLAotCQkJIHRzdF9mc190eXBlX25hbWUodHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19z
d2FwX3N1cHBvcnRlZChjbGVhbnVwLCAiLi90c3Rzd2FwIik7CiAKIAlpZiAoIXRzdF9mc19oYXNf
ZnJlZShOVUxMLCAiLiIsIDEsIFRTVF9LQikpIHsKIAkJdHN0X2Jya20oVEJST0ssIGNsZWFudXAs
Ci0tIAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
