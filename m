Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F597FCE5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 17:29:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EA733EACC9
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 17:29:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6B45D3EAC98
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 17:29:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC0A42003BC
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 17:29:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2104830832E1;
 Tue, 30 Apr 2019 15:29:54 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 875A978B27;
 Tue, 30 Apr 2019 15:29:53 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 23:29:49 +0800
Message-Id: <20190430152949.17723-1-xzhou@redhat.com>
In-Reply-To: <20190430095404.ipt3tuhyfd4hqz6w@XZHOUW.usersys.redhat.com>
References: <20190430095404.ipt3tuhyfd4hqz6w@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 30 Apr 2019 15:29:54 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: liwan@redhat.com
Subject: [LTP] [PATCH v2] syscalls/swap{on,
	off}: skip if FIBMAP ioctl trial fails
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

VGhhdCBtZWFucyBzd2FwZmlsZSBpbiB0aGUgdGVzdCBmaWxlc3lzdGVtIGlzIG5vdCBzdXBwb3J0
ZWQuCkFkZCBhIHRlc3QgaGVscGVyIHRvIGRvIGEgRklCTUFQIGlvY3RsIHRlc3QuIFJlbW92ZSBv
bGQgZnMgdHlwZSB3aGl0ZWxpc3QgY29kZS4KClNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4
emhvdUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvdHN0X2ZzLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICsrKwogbGliL3RzdF9pb2N0bC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5jIHwgMTMgKystLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMgfCAxMCArKy0tLQogdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYyAgIHwgMTMgKystLS0tCiB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jICAgfCAxNiArKy0tLS0tLQogdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYyAgIHwgMjAgKystLS0tLS0tCiA3IGZpbGVz
IGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGxpYi90c3RfaW9jdGwuYwoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X2ZzLmggYi9p
bmNsdWRlL3RzdF9mcy5oCmluZGV4IGIyYjE5YWRhNi4uY2MzOGIzNTQ3IDEwMDY0NAotLS0gYS9p
bmNsdWRlL3RzdF9mcy5oCisrKyBiL2luY2x1ZGUvdHN0X2ZzLmgKQEAgLTE3Miw2ICsxNzIsMTEg
QEAgY29uc3QgY2hhciAqKnRzdF9nZXRfc3VwcG9ydGVkX2ZzX3R5cGVzKHZvaWQpOwogICovCiB2
b2lkIHRzdF9maWxsX2ZzKGNvbnN0IGNoYXIgKnBhdGgsIGludCB2ZXJib3NlKTsKIAorLyoKKyAq
IHRlc3QgaWYgRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZAorICovCitpbnQgdHN0X2ZpYm1hcCh2
b2lkKTsKKwogI2lmZGVmIFRTVF9URVNUX0hfXwogc3RhdGljIGlubGluZSBsb25nIHRzdF9mc190
eXBlKGNvbnN0IGNoYXIgKnBhdGgpCiB7CmRpZmYgLS1naXQgYS9saWIvdHN0X2lvY3RsLmMgYi9s
aWIvdHN0X2lvY3RsLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5kNDY4
ZDU4OTgKLS0tIC9kZXYvbnVsbAorKysgYi9saWIvdHN0X2lvY3RsLmMKQEAgLTAsMCArMSw0MSBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKworI2luY2x1
ZGUgPGVycm5vLmg+CisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNp
bmNsdWRlIDxzeXMvaW9jdGwuaD4KKyNpbmNsdWRlIDxsaW51eC9mcy5oPgorCisjZGVmaW5lIFRT
VF9OT19ERUZBVUxUX01BSU4KKworI2luY2x1ZGUgInRzdF90ZXN0LmgiCisKK2ludCB0c3RfZmli
bWFwKHZvaWQpCit7CisJLyogdGVzdCBpZiBGSUJNQVAgaW9jdGwgaXMgc3VwcG9ydGVkICovCisJ
aW50IGZkLCBibG9jayA9IDA7CisJY29uc3QgY2hhciAqdG1wZGlyID0gZ2V0ZW52KCJUTVBESVIi
KTsKKwljaGFyIGJ1ZlsxMjhdOworCisJdHN0X3JlcyhUSU5GTywgIlRlc3RpbmcgaWYgRklCTUFQ
IGlvY3RsIGlzIHN1cHBvcnRlZCBpbiAlcyIsIHRtcGRpcik7CisKKwlzcHJpbnRmKGJ1ZiwgIiVz
L3RzdF9maWJtYXAiLCB0bXBkaXIpOworCisJZmQgPSBvcGVuKGJ1ZiwgT19SRFdSIHwgT19DUkVB
VCwgMDY2Nik7CisJaWYgKGZkIDwgMCkgeworCQl0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLAorCQkJ
ICJvcGVuKCVzLCBPX1JEV1IgfCBPX0NSRUFULCAwNjY2KSBmYWlsZWQiLCBidWYpOworCQlyZXR1
cm4gMTsKKwl9CisKKwlpZiAoaW9jdGwoZmQsIEZJQk1BUCwgJmJsb2NrKSkgeworCQljbG9zZShm
ZCk7CisJCXJldHVybiAxOworCX0KKworCWlmIChjbG9zZShmZCkpIHsKKwkJdHN0X3JlcyhUV0FS
TiB8IFRFUlJOTywgImNsb3NlKGZkKSBmYWlsZWQiKTsKKwkJcmV0dXJuIDE7CisJfQorCXJldHVy
biAwOworfQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3
YXBvZmYwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5j
CmluZGV4IGE2M2U2NjFhNS4uYTM3Y2Q5YmUxIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAxLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb2ZmL3N3YXBvZmYwMS5jCkBAIC01NSwxMSArNTUsNiBAQCBpbnQgbWFpbihpbnQg
YWMsIGNoYXIgKiphdikKIHN0YXRpYyB2b2lkIHZlcmlmeV9zd2Fwb2ZmKHZvaWQpCiB7CiAJaWYg
KGx0cF9zeXNjYWxsKF9fTlJfc3dhcG9uLCAiLi9zd2FwZmlsZTAxIiwgMCkgIT0gMCkgewotCQlp
ZiAoZnNfdHlwZSA9PSBUU1RfQlRSRlNfTUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKSB7Ci0JCQl0
c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAgICAgICAgICJTd2FwZmlsZXMgb24gQlRSRlMg
YXJlIG5vdCBpbXBsZW1lbnRlZCIpOwotCQl9Ci0KIAkJdHN0X3Jlc20oVEJST0ssICJGYWlsZWQg
dG8gdHVybiBvbiB0aGUgc3dhcCBmaWxlIgogCQkJICIsIHNraXBwaW5nIHRlc3QgaXRlcmF0aW9u
Iik7CiAJCXJldHVybjsKQEAgLTg2LDEzICs4MSwxMSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9mc190eXBlKGNs
ZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNUX1RNUEZTX01B
R0lDOgorCWZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpOworCWlmICh0c3RfZmli
bWFwKCkpIHsKIAkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCi0JCQkgIkNhbm5vdCBkbyBzd2Fw
b2ZmIG9uIGEgZmlsZSBvbiAlcyBmaWxlc3lzdGVtIiwKKwkJCSAiQ2Fubm90IGRvIEZJQk1BUCBp
b2N0bCBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCiAJCQkgdHN0X2ZzX3R5cGVfbmFtZShm
c190eXBlKSk7Ci0JYnJlYWs7CiAJfQogCiAJaWYgKCF0c3RfZnNfaGFzX2ZyZWUoTlVMTCwgIi4i
LCA2NCwgVFNUX01CKSkgewpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9z
d2Fwb2ZmL3N3YXBvZmYwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3
YXBvZmYwMi5jCmluZGV4IGI1YzYzMTJhMS4uZDE0YjFjN2FiIDEwMDY0NAotLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvZmYvc3dhcG9mZjAyLmMKKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9zd2Fwb2ZmL3N3YXBvZmYwMi5jCkBAIC0xMzgsMTMgKzEzOCwxMSBAQCBz
dGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgodHlw
ZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgot
CWNhc2UgVFNUX1RNUEZTX01BR0lDOgorCWZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAi
LiIpOworCWlmICh0c3RfZmlibWFwKCkpIHsKIAkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCi0J
CQkgIkNhbm5vdCBkbyBzd2Fwb2ZmIG9uIGEgZmlsZSBvbiAlcyBmaWxlc3lzdGVtIiwKLQkJCSB0
c3RfZnNfdHlwZV9uYW1lKHR5cGUpKTsKLQlicmVhazsKKwkJCSAiQ2Fubm90IGRvIEZJQk1BUCBp
b2N0bCBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCisJCQkgdHN0X2ZzX3R5cGVfbmFtZShm
c190eXBlKSk7CiAJfQogCiAJaWYgKCF0c3RfZnNfaGFzX2ZyZWUoTlVMTCwgIi4iLCAxLCBUU1Rf
S0IpKSB7CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fw
b24wMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYwppbmRl
eCAzMjUzOGY4MmIuLjBhNWEzZGU4NiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb24vc3dhcG9uMDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3
YXBvbi9zd2Fwb24wMS5jCkBAIC0zOSwxMSArMzksNiBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dh
cG9uKHZvaWQpCiAJVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgIi4vc3dhcGZpbGUwMSIs
IDApKTsKIAogCWlmIChURVNUX1JFVFVSTiA9PSAtMSkgewotCQlpZiAoZnNfdHlwZSA9PSBUU1Rf
QlRSRlNfTUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKSB7Ci0JCQl0c3RfYnJrbShUQ09ORiwgY2xl
YW51cCwKLQkJCSAgICAgICAgICJTd2FwZmlsZSBvbiBCVFJGUyBub3QgaW1wbGVtZXRlZCIpOwot
CQkJcmV0dXJuOwotCQl9CiAJCXRzdF9yZXNtKFRGQUlMIHwgVFRFUlJOTywgIkZhaWxlZCB0byB0
dXJuIG9uIHN3YXBmaWxlIik7CiAJfSBlbHNlIHsKIAkJdHN0X3Jlc20oVFBBU1MsICJTdWNjZWVk
ZWQgdG8gdHVybiBvbiBzd2FwZmlsZSIpOwpAQCAtODQsMTMgKzc5LDExIEBAIHN0YXRpYyB2b2lk
IHNldHVwKHZvaWQpCiAKIAl0c3RfdG1wZGlyKCk7CiAKLQlzd2l0Y2ggKChmc190eXBlID0gdHN0
X2ZzX3R5cGUoY2xlYW51cCwgIi4iKSkpIHsKLQljYXNlIFRTVF9ORlNfTUFHSUM6Ci0JY2FzZSBU
U1RfVE1QRlNfTUFHSUM6CisJZnNfdHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIuIik7CisJ
aWYgKHRzdF9maWJtYXAoKSkgewogCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fu
bm90IGRvIHN3YXBvbiBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCisJCQkgIkNhbm5vdCBk
byBGSUJNQVAgaW9jdGwgb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAogCQkJIHRzdF9mc190
eXBlX25hbWUoZnNfdHlwZSkpOwotCWJyZWFrOwogCX0KIAogCW1ha2Vfc3dhcGZpbGUoY2xlYW51
cCwgInN3YXBmaWxlMDEiKTsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c3dhcG9uL3N3YXBvbjAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fw
b24wMi5jCmluZGV4IDRhZjUxMDVjNi4uMzFmMGM2NmFjIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKQEAgLTgxLDExICs4MSw2IEBAIHN0YXRpYyB2b2lk
IHZlcmlmeV9zd2Fwb24oc3RydWN0IHRlc3RfY2FzZV90ICp0ZXN0KQogCQlyZXR1cm47CiAJfQog
Ci0JaWYgKGZzX3R5cGUgPT0gVFNUX0JUUkZTX01BR0lDICYmIGVycm5vID09IEVJTlZBTCkgewot
CQl0c3RfcmVzbShUQ09ORiwgIlN3YXBmaWxlIG9uIEJUUkZTIG5vdCBpbXBsZW1ldGVkIik7Ci0J
CQlyZXR1cm47Ci0JfQotCiAJdHN0X3Jlc20oVEZBSUwsICJzd2Fwb24oMikgZmFpbGVkIHRvIHBy
b2R1Y2UgZXhwZWN0ZWQgZXJyb3I6IgogCSAgICAgICAgICIgJWQsIGVycm5vOiAlcyBhbmQgZ290
ICVkLiIsIHRlc3QtPmV4cF9lcnJubywKIAkgICAgICAgICB0ZXN0LT5leHBfZXJydmFsLCBURVNU
X0VSUk5PKTsKQEAgLTEzMiwxMyArMTI3LDExIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiAK
IAl0c3RfdG1wZGlyKCk7CiAKLQlzd2l0Y2ggKChmc190eXBlID0gdHN0X2ZzX3R5cGUoY2xlYW51
cCwgIi4iKSkpIHsKLQljYXNlIFRTVF9ORlNfTUFHSUM6Ci0JY2FzZSBUU1RfVE1QRlNfTUFHSUM6
CisJZnNfdHlwZSA9IHRzdF9mc190eXBlKGNsZWFudXAsICIuIik7CisJaWYgKHRzdF9maWJtYXAo
KSkgewogCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRvIHN3YXBvbiBv
biBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCisJCQkgIkNhbm5vdCBkbyBGSUJNQVAgaW9jdGwg
b24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAogCQkJIHRzdF9mc190eXBlX25hbWUoZnNfdHlw
ZSkpOwotCWJyZWFrOwogCX0KIAogCVNBRkVfVE9VQ0goY2xlYW51cCwgIm5vdHN3YXAiLCAwNzc3
LCBOVUxMKTsKQEAgLTE0Niw4ICsxMzksNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCW1h
a2Vfc3dhcGZpbGUoY2xlYW51cCwgImFscmVhZHl1c2VkIik7CiAKIAlpZiAobHRwX3N5c2NhbGwo
X19OUl9zd2Fwb24sICJhbHJlYWR5dXNlZCIsIDApKSB7Ci0JCWlmIChmc190eXBlICE9IFRTVF9C
VFJGU19NQUdJQyB8fCBlcnJubyAhPSBFSU5WQUwpCi0JCQl0c3RfcmVzbShUV0FSTiB8IFRFUlJO
TywgInN3YXBvbihhbHJlYWR5dXNlZCkgZmFpbGVkIik7CisJCXRzdF9yZXNtKFRXQVJOIHwgVEVS
Uk5PLCAic3dhcG9uKGFscmVhZHl1c2VkKSBmYWlsZWQiKTsKIAl9IGVsc2UgewogCQlkb19zd2Fw
b2ZmID0gMTsKIAl9CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBv
bi9zd2Fwb24wMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMu
YwppbmRleCA5NTVhYzI0N2IuLjM5MTM5MWZiZiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3N3YXBvbi9zd2Fwb24wMy5jCkBAIC0yMTUsOSArMjE1LDYgQEAgc3RhdGljIGludCBzZXR1
cF9zd2FwKHZvaWQpCiAJCQkvKiB0dXJuIG9uIHRoZSBzd2FwIGZpbGUgKi8KIAkJCXJlcyA9IGx0
cF9zeXNjYWxsKF9fTlJfc3dhcG9uLCBmaWxlbmFtZSwgMCk7CiAJCQlpZiAocmVzICE9IDApIHsK
LQkJCQlpZiAoZnNfdHlwZSA9PSBUU1RfQlRSRlNfTUFHSUMgJiYgZXJybm8gPT0gRUlOVkFMKQot
CQkJCQlleGl0KDIpOwotCiAJCQkJaWYgKGVycm5vID09IEVQRVJNKSB7CiAJCQkJCXByaW50Zigi
U3VjY2Vzc2Z1bGx5IGNyZWF0ZWQgJWQgIgogCQkJCQkgICAgICAgInN3YXBmaWxlc1xuIiwgaik7
CkBAIC0yMzMsMTUgKzIzMCw4IEBAIHN0YXRpYyBpbnQgc2V0dXBfc3dhcCh2b2lkKQogCX0gZWxz
ZQogCQl3YWl0cGlkKHBpZCwgJnN0YXR1cywgMCk7CiAKLQlzd2l0Y2ggKFdFWElUU1RBVFVTKHN0
YXR1cykpIHsKLQljYXNlIDA6Ci0JYnJlYWs7Ci0JY2FzZSAyOgotCQl0c3RfYnJrbShUQ09ORiwg
Y2xlYW51cCwgIlN3YXBmaWxlIG9uIEJUUkZTIG5vdCBpbXBsZW1ldGVkIik7Ci0JYnJlYWs7Ci0J
ZGVmYXVsdDoKKwlpZiAoV0VYSVRTVEFUVVMoc3RhdHVzKSkgewogCQl0c3RfYnJrbShURkFJTCwg
Y2xlYW51cCwgIkZhaWxlZCB0byBzZXR1cCBzd2FwcyIpOwotCWJyZWFrOwogCX0KIAogCS8qIENy
ZWF0ZSBhbGwgbmVlZGVkIGV4dHJhIHN3YXBmaWxlcyBmb3IgdGVzdGluZyAqLwpAQCAtMzMzLDEz
ICszMjMsMTEgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAot
CXN3aXRjaCAoKGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2Ug
VFNUX05GU19NQUdJQzoKLQljYXNlIFRTVF9UTVBGU19NQUdJQzoKKwlmc190eXBlID0gdHN0X2Zz
X3R5cGUoY2xlYW51cCwgIi4iKTsKKwlpZiAodHN0X2ZpYm1hcCgpKSB7CiAJCXRzdF9icmttKFRD
T05GLCBjbGVhbnVwLAotCQkJICJDYW5ub3QgZG8gc3dhcG9uIG9uIGEgZmlsZSBvbiAlcyBmaWxl
c3lzdGVtIiwKKwkJCSAiQ2Fubm90IGRvIEZJQk1BUCBpb2N0bCBvbiBhIGZpbGUgb24gJXMgZmls
ZXN5c3RlbSIsCiAJCQkgdHN0X2ZzX3R5cGVfbmFtZShmc190eXBlKSk7Ci0JYnJlYWs7CiAJfQog
CiAJVEVTVF9QQVVTRTsKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
