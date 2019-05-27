Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E202B17A
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 11:42:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64655294AE5
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 11:42:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0D9223EA96E
 for <ltp@lists.linux.it>; Mon, 27 May 2019 11:42:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 00B6614016B6
 for <ltp@lists.linux.it>; Mon, 27 May 2019 11:42:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B0C4AF1B
 for <ltp@lists.linux.it>; Mon, 27 May 2019 09:42:15 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Mon, 27 May 2019 11:41:46 +0200
Message-Id: <20190527094146.13561-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] syscalls/setsockopt04: Add CVE-2016-9793 testcase
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

S2VybmVscyBiZXR3ZWVuIHZlcnNpb24gMy4xMSBhbmQgNC44IG1pc3NpbmcgY29tbWl0IGI5OGIw
YmM4CmFyZSB2dWxuZXJhYmxlIHRvIGEgcHJpdmlnbGVnZSBlc2NhbGF0aW9uIGV4cGxvaXQgYnkg
b3ZlcmZsb3dpbmcKYSBzb2NrZXQgc2VuZCBidWZmZXIgc2l6ZSBpbnRlZ2VyLgpUaGlzIHRlc3Qg
Y2hlY2tzIGlmIHRoZSBzeXN0ZW0gaXMgdnVsbmVyYWJsZSBieSB0ZXN0aW5nIGlmIGEKbmVnYXRp
dmUgYnVmZmVyIHNpemUgY2FuIGJlIHNldC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBBbWFu
biA8Y2FtYW5uQHN1c2UuY29tPgotLS0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRz
b2Nrb3B0Ly5naXRpZ25vcmUgICAgfCAgMSArCiAuLi4va2VybmVsL3N5c2NhbGxzL3NldHNvY2tv
cHQvc2V0c29ja29wdDA0LmMgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysKIDMgZmls
ZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc2V0c29ja29wdC9zZXRzb2Nrb3B0MDQuYwoKZGlmZiAtLWdpdCBh
L3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDA0NTU4YTU4MC4uYjA2
YWQ5NDllIDEwMDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qvc3lzY2Fs
bHMKQEAgLTEyMzMsNiArMTIzMyw3IEBAIHNldHNpZDAxIHNldHNpZDAxCiBzZXRzb2Nrb3B0MDEg
c2V0c29ja29wdDAxCiBzZXRzb2Nrb3B0MDIgc2V0c29ja29wdDAyCiBzZXRzb2Nrb3B0MDMgc2V0
c29ja29wdDAzCitzZXRzb2Nrb3B0MDQgc2V0c29ja29wdDA0CiAKIHNldHRpbWVvZmRheTAxIHNl
dHRpbWVvZmRheTAxCiBzZXR0aW1lb2ZkYXkwMiBzZXR0aW1lb2ZkYXkwMgpkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRzb2Nrb3B0Ly5naXRpZ25vcmUgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3NldHNvY2tvcHQvLmdpdGlnbm9yZQppbmRleCBkOGZiMGYzYjQu
LjYwM2UyYWQ3YSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRzb2Nr
b3B0Ly5naXRpZ25vcmUKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zZXRzb2Nrb3B0
Ly5naXRpZ25vcmUKQEAgLTEsMyArMSw0IEBACiAvc2V0c29ja29wdDAxCiAvc2V0c29ja29wdDAy
CiAvc2V0c29ja29wdDAzCisvc2V0c29ja29wdDA0CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3NldHNvY2tvcHQvc2V0c29ja29wdDA0LmMgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3NldHNvY2tvcHQvc2V0c29ja29wdDA0LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwLi42Y2I0MTk5YWIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3NldHNvY2tvcHQvc2V0c29ja29wdDA0LmMKQEAgLTAsMCArMSw2NSBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKy8qCisgKiBD
b3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMKKyAqIEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5uIDxj
YW1hbm5Ac3VzZS5jb20+CisgKi8KKy8qIFRlc3QgZm9yIENWRS0yMDE2LTk3OTMKKyAqCisgKiBX
aXRoIGtlcm5lbHMgYmV0d2VlbiB2ZXJzaW9uIDMuMTEgYW5kIDQuOCBtaXNzaW5nIGNvbW1pdCBi
OThiMGJjOCBpdAorICogaXMgcG9zc2libGUgdG8gcGFzcyBhIHZlcnkgaGlnaCB1bnNpZ25lZCBp
bnRlZ2VyIGFzIHNlbmQgYnVmZmVyIHNpemUKKyAqIHRvIGEgc29ja2V0IHdoaWNoIGlzIHRoZW4g
aW50ZXJwcmV0ZWQgYXMgYSBuZWdhdGl2ZSB2YWx1ZS4KKyAqCisgKiBUaGlzIGNhbiBiZSB1c2Vk
IHRvIGVzY2FsYXRlIHByaXZpbGVnZXMgYnkgZXZlcnkgdXNlciB0aGF0IGhhcyB0aGUKKyAqIENB
UF9ORVRfQURNSU4gY2FwYWJpbGl0eS4KKyAqCisgKiBGb3IgYWRkaXRpb25hbCBpbmZvcm1hdGlv
biBhYm91dCB0aGlzIENWRSBzZWU6CisgKiBodHRwczovL3d3dy5zdXNlLmNvbS9zZWN1cml0eS9j
dmUvQ1ZFLTIwMTYtOTc5My8KKyAqLworCisjaW5jbHVkZSA8c3lzL3NvY2tldC5oPgorI2luY2x1
ZGUgInRzdF90ZXN0LmgiCisjaW5jbHVkZSAidHN0X3NhZmVfbmV0LmgiCisKKyNkZWZpbmUgU05E
QlVGCSgweGZmZmZmZjAwKQorCitzdGF0aWMgaW50IHNvY2tmZDsKKworc3RhdGljIHZvaWQgcnVu
KHZvaWQpCit7CisJdW5zaWduZWQgaW50IHNuZGJ1ZiwgcmVjX3NuZGJ1ZjsKKwlzb2NrbGVuX3Qg
b3B0bGVuOworCisJc25kYnVmID0gU05EQlVGOworCXJlY19zbmRidWYgPSAwOworCW9wdGxlbiA9
IHNpemVvZihzbmRidWYpOworCisJU0FGRV9TRVRTT0NLT1BUKHNvY2tmZCwgU09MX1NPQ0tFVCwg
U09fU05EQlVGRk9SQ0UsICZzbmRidWYsIG9wdGxlbik7CisJU0FGRV9HRVRTT0NLT1BUKHNvY2tm
ZCwgU09MX1NPQ0tFVCwgU09fU05EQlVGLCAmcmVjX3NuZGJ1ZiwgJm9wdGxlbik7CisKKwl0c3Rf
cmVzKFRJTkZPLCAiVHJ5IHRvIHNldCBzZW5kIGJ1ZmZlciBzaXplIHRvOiAldSIsIHNuZGJ1Zik7
CisJdHN0X3JlcyhUSU5GTywgIlNlbmQgYnVmZmVyIHNpemUgd2FzIHNldCB0bzogJWQiLCByZWNf
c25kYnVmKTsKKworCWlmICgoaW50KXJlY19zbmRidWYgPCAwKQorCQl0c3RfcmVzKFRGQUlMLCAi
V2FzIGFibGUgdG8gc2V0IG5lZ2F0aXZlIHNlbmQgYnVmZmVyIHNpemUhIik7CisJZWxzZQorCQl0
c3RfcmVzKFRQQVNTLCAiV2FzIHVuYWJsZSB0byBzZXQgbmVnYXRpdmUgc2VuZCBidWZmZXIgc2l6
ZSEiKTsKK30KKworc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKK3sKKwlzb2NrZmQgPSBTQUZFX1NP
Q0tFVChBRl9JTkVULCBTT0NLX0RHUkFNLCAwKTsKK30KKworc3RhdGljIHZvaWQgY2xlYW51cCh2
b2lkKQoreworCWlmIChzb2NrZmQgPiAwKQorCQlTQUZFX0NMT1NFKHNvY2tmZCk7Cit9CisKK3N0
YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKKwkudGVzdF9hbGwgPSBydW4sCisJLnNldHVw
ID0gc2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAorCS5uZWVkc19yb290ID0gMSwKKwkudGlt
ZW91dCA9IDIwLAorfTsKLS0gCjIuMTYuNAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
