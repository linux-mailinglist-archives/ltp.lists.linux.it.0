Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31551345D9
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:47:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75F2C3EABA4
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:47:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6BB9C3EAB0D
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:47:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32728601645
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:47:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3838AFBB
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 11:47:08 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue,  4 Jun 2019 13:47:00 +0200
Message-Id: <20190604114702.28255-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] syscalls/pidfd_send_signal01
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

QWRkIHRlc3RjYXNlIHRvIGNoZWNrIGlmIHBpZGZkX3NlbmRfc2lnbmFsKCkgY2FuIHByb3ZpZGUK
dGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBhcyBydF9zaWdxdWV1ZWluZm8oKS4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgotLS0KIGNvbmZpZ3VyZS5hYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIHJ1bnRlc3Qvc3lz
Y2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi9rZXJu
ZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvLmdpdGlnbm9yZSAgIHwgICAxICsKIC4uLi9r
ZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvTWFrZWZpbGUgICAgIHwgIDE0ICsrKwog
Li4uL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL3BpZGZkX3NlbmRfc2lnbmFsLmggfCAgMjcg
KysrKysrCiAuLi4vcGlkZmRfc2VuZF9zaWduYWwvcGlkZmRfc2VuZF9zaWduYWwwMS5jICAgICAg
ICB8IDEwOCArKysrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Bp
ZGZkX3NlbmRfc2lnbmFsLy5naXRpZ25vcmUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9zZW5kX3NpZ25hbC9waWRmZF9z
ZW5kX3NpZ25hbC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9waWRmZF9zZW5kX3NpZ25hbC9waWRmZF9zZW5kX3NpZ25hbDAxLmMKCmRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKaW5kZXggNWEzZGM1YjYyLi5iM2UxMDgzMDYgMTAw
NjQ0Ci0tLSBhL2NvbmZpZ3VyZS5hYworKysgYi9jb25maWd1cmUuYWMKQEAgLTcxLDYgKzcxLDcg
QEAgQUNfQ0hFQ0tfRlVOQ1MoWyBcCiAgICAgbWtkaXJhdCBcCiAgICAgbWtub2RhdCBcCiAgICAg
b3BlbmF0IFwKKyAgICBwaWRmZF9zZW5kX3NpZ25hbCBcCiAgICAgcHJlYWR2IFwKICAgICBwcmVh
ZHYyIFwKICAgICBwcm9maWwgXApAQCAtMjM3LDYgKzIzOCw3IEBAIGVsc2UKIGZpCiBBQ19ERUZJ
TkVfVU5RVU9URUQoTlVNQV9FUlJPUl9NU0csIFsiJG51bWFfZXJyb3JfbXNnIl0sIFtFcnJvciBt
ZXNzYWdlIHdoZW4gbm8gTlVNQSBzdXBwb3J0XSkKIAorCiBMVFBfQ0hFQ0tfU1lTQ0FMTF9QRVJG
X0VWRU5UX09QRU4KIExUUF9DSEVDS19TWVNDQUxMX1FVT1RBQ1RMCiBMVFBfQ0hFQ0tfU1lTQ0FM
TF9TSUdOQUxGRApkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2Fs
bHMKaW5kZXggNzYyYjE1YjFmLi5iZDcxYTEyZjggMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2Fs
bHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtODM2LDYgKzgzNiw4IEBAIHBhdXNlMDMgcGF1
c2UwMwogcGVyc29uYWxpdHkwMSBwZXJzb25hbGl0eTAxCiBwZXJzb25hbGl0eTAyIHBlcnNvbmFs
aXR5MDIKIAorcGlkZmRfc2VuZF9zaWduYWwwMSBwaWRmZF9zZW5kX3NpZ25hbDAxCisKIHBpcGUw
MSBwaXBlMDEKIHBpcGUwMiBwaXBlMDIKIHBpcGUwMyBwaXBlMDMKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvLmdpdGlnbm9yZSBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvLmdpdGlnbm9yZQpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjdjY2JmMmQ4MAotLS0gL2Rldi9udWxsCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvLmdpdGlnbm9y
ZQpAQCAtMCwwICsxIEBACisvcGlkZmRfc2VuZF9zaWduYWwwMQpkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9waWRmZF9zZW5kX3NpZ25hbC9NYWtlZmlsZSBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwvTWFrZWZpbGUKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4yM2U0ZWM0NzgKLS0tIC9kZXYvbnVsbAorKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL01ha2VmaWxlCkBAIC0w
LDAgKzEsMTQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
CisjCisjICAgQ29weXJpZ2h0IChjKSAyMDE5IFNVU0UgTExDCisjCisjICAgQXV0aG9yOiBDaHJp
c3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KKyMKKwordG9wX3NyY2RpcgkJPz0gLi4vLi4v
Li4vLi4KKworaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvdGVzdGNhc2VzLm1rCisK
K2luY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2dlbmVyaWNfbGVhZl90YXJnZXQubWsK
KworcGlkZmRfc2VuZF9zaWduYWwwMTogQ0ZMQUdTICs9IC1wdGhyZWFkCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL3BpZGZkX3NlbmRfc2ln
bmFsLmggYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL3BpZGZk
X3NlbmRfc2lnbmFsLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5hYTg4
M2M5MzIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZk
X3NlbmRfc2lnbmFsL3BpZGZkX3NlbmRfc2lnbmFsLmgKQEAgLTAsMCArMSwyNyBAQAorLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKy8qCisgKiBDb3B5cmlnaHQg
KGMpIDIwMTkgU1VTRSBMTEMKKyAqIEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3Vz
ZS5jb20+CisgKi8KKworI2lmbmRlZiBQSURGRF9TRU5EX1NJR05BTF9ICisjZGVmaW5lIFBJREZE
X1NFTkRfU0lHTkFMX0gKKworI2luY2x1ZGUgInRzdF90ZXN0LmgiCisjaW5jbHVkZSAibGFwaS9z
eXNjYWxscy5oIgorCitzdGF0aWMgdm9pZCBjaGVja19zeXNjYWxsX3N1cHBvcnQodm9pZCkKK3sK
KwkvKiBhbGxvdyB0aGUgdGVzdHMgdG8gZmFpbCBlYXJseSAqLworCXRzdF9zeXNjYWxsKF9fTlJf
cGlkZmRfc2VuZF9zaWduYWwpOworfQorCisjaWZuZGVmIEhBVkVfUElERkRfU0VORF9TSUdOQUwK
K3N0YXRpYyBpbnQgcGlkZmRfc2VuZF9zaWduYWwoaW50IHBpZGZkLCBpbnQgc2lnLCBzaWdpbmZv
X3QgKmluZm8sCisJCQkJIHVuc2lnbmVkIGludCBmbGFncykKK3sKKwlyZXR1cm4gdHN0X3N5c2Nh
bGwoX19OUl9waWRmZF9zZW5kX3NpZ25hbCwgcGlkZmQsIHNpZywgaW5mbywgZmxhZ3MpOworfQor
I2VuZGlmIC8qIEhBVkVfUElERkRfU0VORF9TSUdOQUwgKi8KKworI2VuZGlmIC8qIFBJREZEX1NF
TkRfU0lHTkFMX0ggKi8KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlk
ZmRfc2VuZF9zaWduYWwvcGlkZmRfc2VuZF9zaWduYWwwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9waWRmZF9zZW5kX3NpZ25hbC9waWRmZF9zZW5kX3NpZ25hbDAxLmMKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5mNDRmY2UwMTMKLS0tIC9kZXYvbnVsbAorKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL3BpZGZkX3NlbmRf
c2lnbmFsMDEuYwpAQCAtMCwwICsxLDEwOCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb3ItbGF0ZXIKKy8qCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMKKyAq
IEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+CisgKi8KKy8qCisgKiBU
ZXN0cyBpZiB0aGUgcGlkZmRfc2VuZF9zaWduYWwgc3lzY2FsbCBiZWhhdmVzCisgKiBsaWtlIHJ0
X3NpZ3F1ZXVlaW5mbyB3aGVuIGEgcG9pbnRlciB0byBhIHNpZ2luZm9fdAorICogc3RydWN0IGlz
IHBhc3NlZC4KKyAqLworCisjZGVmaW5lIF9HTlVfU09VUkNFCisKKyNpbmNsdWRlIDxzaWduYWwu
aD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlICJ0c3Rfc2FmZV9wdGhyZWFkLmgiCisj
aW5jbHVkZSAicGlkZmRfc2VuZF9zaWduYWwuaCIKKworI2RlZmluZSBTSUdOQUwgIFNJR1VTUjEK
KyNkZWZpbmUgREFUQQk3NzcKKworc3RhdGljIHN0cnVjdCBzaWdhY3Rpb24gKnNpZ19hY3Rpb247
CitzdGF0aWMgaW50IHNpZ19yZWM7CitzdGF0aWMgc2lnaW5mb190ICp1aW5mbzsKK3N0YXRpYyBp
bnQgcGlkZmQ7CisKK3N0YXRpYyB2b2lkIHJlY2VpdmVkX3NpZ25hbChpbnQgc2lnLCBzaWdpbmZv
X3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQoreworCWlmIChpbmZvICYmIHVjb250ZXh0KSB7CisJ
CWlmIChzaWcgPT0gU0lHTkFMICYmIHVpbmZvLT5zaV92YWx1ZS5zaXZhbF9pbnQgPT0gREFUQSkg
eworCQkJdHN0X3JlcyhUUEFTUywgIlJlY2VpdmVkIGNvcnJlY3Qgc2lnbmFsIGFuZCBkYXRhISIp
OworCQkJc2lnX3JlYyA9IDE7CisJCX0gZWxzZSB7CisJCQl0c3RfcmVzKFRGQUlMLCAiUmVjZWl2
ZWQgd3Jvbmcgc2lnbmFsIGFuZC9vciBkYXRhISIpOworCQl9CisJfSBlbHNlIHsKKwkJdHN0X3Jl
cyhURkFJTCwgIlNpZ25hbCBoYW5kbGluZyB3ZW50IHdyb25nISIpOworCX0KK30KKworc3RhdGlj
IHZvaWQgKmhhbmRsZV90aHJlYWQodm9pZCAqYXJnKQoreworCVNBRkVfU0lHQUNUSU9OKFNJR05B
TCwgc2lnX2FjdGlvbiwgTlVMTCk7CisJVFNUX0NIRUNLUE9JTlRfV0FLRV9BTkRfV0FJVCgwKTsK
KwlyZXR1cm4gYXJnOworfQorCitzdGF0aWMgdm9pZCB2ZXJpZnlfcGlkZmRfc2VuZF9zaWduYWwo
dm9pZCkKK3sKKwlwdGhyZWFkX3QgdGhyOworCisJU0FGRV9QVEhSRUFEX0NSRUFURSgmdGhyLCBO
VUxMLCBoYW5kbGVfdGhyZWFkLCBOVUxMKTsKKworCVRTVF9DSEVDS1BPSU5UX1dBSVQoMCk7CisK
KwlURVNUKHBpZGZkX3NlbmRfc2lnbmFsKHBpZGZkLCBTSUdOQUwsIHVpbmZvLCAwKSk7CisJaWYg
KFRTVF9SRVQgIT0gMCkgeworCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgInBpZGZkX3NlbmRf
c2lnbmFsKCkgZmFpbGVkIik7CisJCXJldHVybjsKKwl9CisKKwlUU1RfQ0hFQ0tQT0lOVF9XQUtF
KDApOworCVNBRkVfUFRIUkVBRF9KT0lOKHRociwgTlVMTCk7CisKKwlpZiAoc2lnX3JlYykgewor
CQl0c3RfcmVzKFRQQVNTLAorCQkJInBpZGZkX3NlbmRfc2lnbmFsKCkgYmVoYXZlZCBsaWtlIHJ0
X3NpZ3F1ZXVlaW5mbygpIik7CisJfQorfQorCitzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQorewor
CWNoZWNrX3N5c2NhbGxfc3VwcG9ydCgpOworCisJcGlkZmQgPSBTQUZFX09QRU4oIi9wcm9jL3Nl
bGYiLCBPX0RJUkVDVE9SWSB8IE9fQ0xPRVhFQyk7CisKKwlzaWdfYWN0aW9uID0gU0FGRV9NQUxM
T0Moc2l6ZW9mKHN0cnVjdCBzaWdhY3Rpb24pKTsKKworCW1lbXNldChzaWdfYWN0aW9uLCAwLCBz
aXplb2YoKnNpZ19hY3Rpb24pKTsKKwlzaWdfYWN0aW9uLT5zYV9zaWdhY3Rpb24gPSByZWNlaXZl
ZF9zaWduYWw7CisJc2lnX2FjdGlvbi0+c2FfZmxhZ3MgPSBTQV9TSUdJTkZPOworCisJdWluZm8g
PSBTQUZFX01BTExPQyhzaXplb2Yoc2lnaW5mb190KSk7CisKKwltZW1zZXQodWluZm8sIDAsIHNp
emVvZigqdWluZm8pKTsKKwl1aW5mby0+c2lfc2lnbm8gPSBTSUdOQUw7CisJdWluZm8tPnNpX2Nv
ZGUgPSBTSV9RVUVVRTsKKwl1aW5mby0+c2lfcGlkID0gZ2V0cGlkKCk7CisJdWluZm8tPnNpX3Vp
ZCA9IGdldHVpZCgpOworCXVpbmZvLT5zaV92YWx1ZS5zaXZhbF9pbnQgPSBEQVRBOworCisJc2ln
X3JlYyA9IDA7Cit9CisKK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKK3sKKwlmcmVlKHVpbmZv
KTsKKwlmcmVlKHNpZ19hY3Rpb24pOworCWlmIChwaWRmZCA+IDApCisJCVNBRkVfQ0xPU0UocGlk
ZmQpOworfQorCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxsID0g
dmVyaWZ5X3BpZGZkX3NlbmRfc2lnbmFsLAorCS5zZXR1cCA9IHNldHVwLAorCS5jbGVhbnVwID0g
Y2xlYW51cCwKKwkubmVlZHNfY2hlY2twb2ludHMgPSAxLAorfTsKLS0gCjIuMTYuNAoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
