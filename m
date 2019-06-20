Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021C4D01D
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:14:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD2B13EAECB
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:14:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 976293EA9B0
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:14:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CE3E1200DDA
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:14:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E09ACAD3B
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 14:14:27 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 Jun 2019 16:14:27 +0200
Message-Id: <20190620141427.26338-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/futex: Get rid of futex_common.h
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

VGhlcmUgaXMgbm8gcG9pbnQgaW4gcGFzc2luZyBmZCB0byBhbnlub21vdXMgbWFwcGluZywgdGhl
IGZkIHdhcyBpZ25vcmVkCnRvIGJlZ2luIHdpdGguCgpUaGlzIGNvbW1pdCBqdXN0IG1vdmVzIHRo
ZSBtbWFwKCkgdG8gcGFydGljdWxhciB0ZXN0cyBhcyB0aGVyZSBpcyBubwpwb2ludCBpbiBoYXZp
bmcgaGVscGVyIGp1c3QgZm9yIG9uZSBtbWFwKCkgY2FsbCBhbmQgcmVtb3ZlcyB0aGUKZnV0ZXhf
Y29tbW9uLmggY29tcGxldGVseS4KClNpZ25lZC1vZmYtYnk6IEN5cmlsIEhydWJpcyA8Y2hydWJp
c0BzdXNlLmN6PgotLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvZnV0ZXhfY29tbW9uLmgg
ICAgICB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgv
ZnV0ZXhfd2FpdDAyLmMgICAgICB8IDExICsrKystCiAuLi4va2VybmVsL3N5c2NhbGxzL2Z1dGV4
L2Z1dGV4X3dha2UwMy5jICAgICAgfCAxMSArKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2Z1dGV4L2Z1dGV4X2NvbW1vbi5oCgpkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9mdXRleF9jb21tb24uaCBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZnV0ZXgvZnV0ZXhfY29tbW9uLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDIzMWZkYzY3ZS4uMDAwMDAwMDAwCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZnV0ZXgvZnV0ZXhfY29tbW9uLmgKKysrIC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi0v
KgotICogQ29weXJpZ2h0IChDKSAyMDE1IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6Pgot
ICoKLSAqIExpY2Vuc2VkIHVuZGVyIHRoZSBHTlUgR1BMdjIgb3IgbGF0ZXIuCi0gKiBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgIHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnkKLSAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBl
aXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgotICogKGF0IHlvdXIgb3B0aW9uKSBh
bnkgbGF0ZXIgdmVyc2lvbi4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJS
QU5UWTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRB
QklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlCi0gKiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSAqCi0gKiBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZQotICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07ICBpZiBub3QsIHdyaXRlIHRvIHRoZSBG
cmVlIFNvZnR3YXJlCi0gKiBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZp
ZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCi0gKi8KLQotIC8qCi0gICogU2V0
dXBzIGZ1dGV4IGluIHNoYXJlZCBtZW1vcnkgbmVlZGVkIGZvciBzeW5jaHJvbml6YXRpb24gYmV0
d2VlbiBtdWx0aXBsZQotICAqIHByb2Nlc3Nlcy4KLSAgKi8KLQotc3RhdGljIGZ1dGV4X3QgKmZ1
dGV4OwotCi1zdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQotewotCWludCBmZDsKLQotCWZkID0gc2ht
X29wZW4oIi9MVFBfZnV0ZXhfd2FpdCIsIE9fUkRXUiB8IE9fQ1JFQVQgfCBPX0VYQ0wsIDApOwot
Ci0JaWYgKGZkIDwgMCkgewotCQl0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgTlVMTCwKLQkJICAg
ICAgICAgInNobV9vcGVuKC9MVFBfZnV0ZXhfd2FpdCxPX1JEV1J8T19DUkVBVHxPX0VYQ0wsNzc1
KSIpOwotCX0KLQlpZiAoc2htX3VubGluaygiL0xUUF9mdXRleF93YWl0IikpCi0JCXRzdF9icmtt
KFRCUk9LIHwgVEVSUk5PLCBOVUxMLCAic2htX3VubGluaygvTFRQX2Z1dGV4X3dhaXQpIik7Ci0K
LQlmdXRleCA9IFNBRkVfTU1BUChOVUxMLCBOVUxMLCBzaXplb2YoKmZ1dGV4KSwgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSwKLQkJCSAgTUFQX0FOT05ZTU9VUyB8IE1BUF9TSEFSRUQsIGZkLCAwKTsK
LQotCVNBRkVfQ0xPU0UoTlVMTCwgZmQpOwotCi0JKmZ1dGV4ID0gRlVURVhfSU5JVElBTElaRVI7
Ci19CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4L2Z1dGV4X3dh
aXQwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9mdXRleF93YWl0MDIuYwpp
bmRleCAyYjg2M2ZlN2MuLjFjYTFkZjQ1NyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mdXRleC9mdXRleF93YWl0MDIuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2Z1dGV4L2Z1dGV4X3dhaXQwMi5jCkBAIC0yOSwxMSArMjksMTIgQEAKICNpbmNsdWRlICJ0
ZXN0LmgiCiAjaW5jbHVkZSAic2FmZV9tYWNyb3MuaCIKICNpbmNsdWRlICJmdXRleHRlc3QuaCIK
LSNpbmNsdWRlICJmdXRleF9jb21tb24uaCIKIAogY29uc3QgY2hhciAqVENJRD0iZnV0ZXhfd2Fp
dDAyIjsKIGNvbnN0IGludCBUU1RfVE9UQUw9MTsKIAorc3RhdGljIGZ1dGV4X3QgKmZ1dGV4Owor
CiBzdGF0aWMgdm9pZCBkb19jaGlsZCh2b2lkKQogewogCWludCByZXQ7CkBAIC04MSw2ICs4Miwx
NCBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfZnV0ZXhfd2FpdCh2b2lkKQogCQl0c3RfcmVzbShURkFJ
TCwgImNoaWxkIGZhaWxlZCIpOwogfQogCitzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQoreworCWZ1
dGV4ID0gU0FGRV9NTUFQKE5VTEwsIE5VTEwsIHNpemVvZigqZnV0ZXgpLCBQUk9UX1JFQUQgfCBQ
Uk9UX1dSSVRFLAorCQkJICBNQVBfQU5PTllNT1VTIHwgTUFQX1NIQVJFRCwgLTEsIDApOworCisJ
KmZ1dGV4ID0gRlVURVhfSU5JVElBTElaRVI7Cit9CisKIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCiB7CiAJaW50IGxjOwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mdXRleC9mdXRleF93YWtlMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0
ZXgvZnV0ZXhfd2FrZTAzLmMKaW5kZXggNTIzZjMyODUxLi5kNmU1ZTU0MjIgMTAwNjQ0Ci0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvZnV0ZXhfd2FrZTAzLmMKKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9mdXRleF93YWtlMDMuYwpAQCAtMjcsMTEgKzI3
LDEyIEBACiAjaW5jbHVkZSAidGVzdC5oIgogI2luY2x1ZGUgInNhZmVfbWFjcm9zLmgiCiAjaW5j
bHVkZSAiZnV0ZXh0ZXN0LmgiCi0jaW5jbHVkZSAiZnV0ZXhfY29tbW9uLmgiCiAKIGNvbnN0IGNo
YXIgKlRDSUQ9ImZ1dGV4X3dha2UwMyI7CiBjb25zdCBpbnQgVFNUX1RPVEFMPTExOwogCitzdGF0
aWMgZnV0ZXhfdCAqZnV0ZXg7CisKIHN0YXRpYyB2b2lkIGRvX2NoaWxkKHZvaWQpCiB7CiAJZnV0
ZXhfd2FpdChmdXRleCwgKmZ1dGV4LCBOVUxMLCAwKTsKQEAgLTEwMyw2ICsxMDQsMTQgQEAgc3Rh
dGljIHZvaWQgdmVyaWZ5X2Z1dGV4X3dha2Uodm9pZCkKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIHNl
dHVwKHZvaWQpCit7CisJZnV0ZXggPSBTQUZFX01NQVAoTlVMTCwgTlVMTCwgc2l6ZW9mKCpmdXRl
eCksIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCisJCQkgIE1BUF9BTk9OWU1PVVMgfCBNQVBfU0hB
UkVELCAtMSwgMCk7CisKKwkqZnV0ZXggPSBGVVRFWF9JTklUSUFMSVpFUjsKK30KKwogaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKIAlpbnQgbGM7Ci0tIAoyLjE5LjIKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
