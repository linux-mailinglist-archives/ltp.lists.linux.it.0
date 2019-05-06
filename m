Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C54651489C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:55:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8689F3EAE78
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:55:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 390F73EA02A
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:55:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 48FE71001718
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:55:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0106AAEBC
 for <ltp@lists.linux.it>; Mon,  6 May 2019 10:55:15 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Mon,  6 May 2019 12:54:57 +0200
Message-Id: <20190506105457.22350-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured tests
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

VGhlIGZvbGxvd2luZyB0ZXN0cyBhcmUgcnVuIGZvciB0aGUgc3lzY2FsbCBpdHNlbGYsCmFzIHdl
bGwgYXMgdGhlIGdsaWJjIGltcGxlbWVudGF0aW9uLgoKY29weV9maWxlX3JhbmdlMDE6CglyZXN0
cnVjdHVyZWQgdGVzdGNhc2UsIHJlbW92ZWQgdW5uZWNlc3NhcnkgY29kZSwKCWltcHJvdmVkIHJl
YWRhYmlsaXR5IGFuZCBzaG9ydGVuZWQgb3V0cHV0IChvbmx5CglmYWlsdXJlcyBnZXQgcHJpbnRl
ZCBub3cpLiBUaGlzIHRlc3RzIHRoZSBiYXNpYwoJZnVuY3Rpb25hbGl0eSBvZiB0aGUgc3lzY2Fs
bC4KCmNvcHlfZmlsZV9yYW5nZTAyOgoJYWRkIHRlc3RjYXNlcyB3aGljaCB0ZXN0IGJhc2ljIGVy
cm9yIGhhbmRsaW5nCglvZiB0aGUgc3lzY2FsbC4KCmNvcHlfZmlsZV9yYW5nZTAzOgoJYWRkIHRl
c3RjYXNlIHRvIGNoZWNrIGlmIHRoaXMgb3BlcmF0aW9uIHVwZGF0ZXMKCXRpbWVzdGFtcHMgYWNj
b3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNv
bT4KLS0tCiBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBtNC9sdHAtY29weV9maWxlX3JhbmdlLm00ICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNyArCiBydW50ZXN0L3N5c2NhbGxzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArCiAuLi4va2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS8uZ2l0
aWdub3JlICAgICB8ICAgMiArCiAuLi4vc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmls
ZV9yYW5nZS5oICAgICB8ICA1NyArKysrKwogLi4uL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9j
b3B5X2ZpbGVfcmFuZ2UwMS5jICAgfCAyMzkgKysrKysrKysrKystLS0tLS0tLS0tCiAuLi4vc3lz
Y2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgICB8IDExOCArKysrKysr
KysrCiAuLi4vc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAzLmMgICB8
ICA3NyArKysrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDM4NyBpbnNlcnRpb25zKCspLCAxMTYgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbTQvbHRwLWNvcHlfZmlsZV9yYW5nZS5tNAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3Jh
bmdlL2NvcHlfZmlsZV9yYW5nZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlf
ZmlsZV9yYW5nZTAzLmMKCmRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMK
aW5kZXggZmFkOGY4Mzk2Li4zZmVjNjhlZGUgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3VyZS5hYworKysg
Yi9jb25maWd1cmUuYWMKQEAgLTE5Nyw2ICsxOTcsNyBAQCBMVFBfQ0hFQ0tfQlVJTFRJTl9DTEVB
Ul9DQUNIRQogTFRQX0NIRUNLX0NBUEFCSUxJVFlfU1VQUE9SVAogTFRQX0NIRUNLX0NDX1dBUk5f
T0xEU1RZTEUKIExUUF9DSEVDS19DTE9ORV9TVVBQT1JUU183X0FSR1MKK0xUUF9DSEVDS19DT1BZ
X0ZJTEVfUkFOR0UKIExUUF9DSEVDS19DUllQVE8KIExUUF9DSEVDS19GSURFRFVQRQogTFRQX0NI
RUNLX0ZPUlRJRllfU09VUkNFCmRpZmYgLS1naXQgYS9tNC9sdHAtY29weV9maWxlX3JhbmdlLm00
IGIvbTQvbHRwLWNvcHlfZmlsZV9yYW5nZS5tNApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAuLjJkODdlODkwMAotLS0gL2Rldi9udWxsCisrKyBiL200L2x0cC1jb3B5X2ZpbGVf
cmFuZ2UubTQKQEAgLTAsMCArMSw3IEBACitkbmwgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKK2RubCBDb3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMKK2RubCBBdXRo
b3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgorCitBQ19ERUZVTihbTFRQX0NI
RUNLX0NPUFlfRklMRV9SQU5HRV0sWworQUNfQ0hFQ0tfRlVOQ1MoY29weV9maWxlX3JhbmdlLCwp
CitdKQpkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHMKaW5k
ZXggMmI4Y2E3MTliLi4zM2E3MGVlMTcgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2FsbHMKKysr
IGIvcnVudGVzdC9zeXNjYWxscwpAQCAtMTU2MSw2ICsxNTYxLDggQEAgbWVtZmRfY3JlYXRlMDMg
bWVtZmRfY3JlYXRlMDMKIG1lbWZkX2NyZWF0ZTA0IG1lbWZkX2NyZWF0ZTA0CiAKIGNvcHlfZmls
ZV9yYW5nZTAxIGNvcHlfZmlsZV9yYW5nZTAxCitjb3B5X2ZpbGVfcmFuZ2UwMiBjb3B5X2ZpbGVf
cmFuZ2UwMgorY29weV9maWxlX3JhbmdlMDMgY29weV9maWxlX3JhbmdlMDMKIAogc3RhdHgwMSBz
dGF0eDAxCiBzdGF0eDAyIHN0YXR4MDIKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvY29weV9maWxlX3JhbmdlLy5naXRpZ25vcmUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2NvcHlfZmlsZV9yYW5nZS8uZ2l0aWdub3JlCmluZGV4IDY4MDc0MjBlZi4uZTllMzVmNjBm
IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS8u
Z2l0aWdub3JlCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3Jhbmdl
Ly5naXRpZ25vcmUKQEAgLTEgKzEsMyBAQAogL2NvcHlfZmlsZV9yYW5nZTAxCisvY29weV9maWxl
X3JhbmdlMDIKKy9jb3B5X2ZpbGVfcmFuZ2UwMwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlLmggYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UuaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmQyZWYxMzQ4YgotLS0gL2Rldi9udWxsCisr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9y
YW5nZS5oCkBAIC0wLDAgKzEsNTcgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9yLWxhdGVyCisvKgorICogQ29weXJpZ2h0IChjKSAyMDE5IFNVU0UgTExDCisgKiBBdXRo
b3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgorICovCisKKyNpZm5kZWYgX19D
T1BZX0ZJTEVfUkFOR0VfSF9fCisjZGVmaW5lIF9fQ09QWV9GSUxFX1JBTkdFX0hfXworCisjaW5j
bHVkZSA8c3RkYm9vbC5oPgorI2luY2x1ZGUgPHVuaXN0ZC5oPgorI2luY2x1ZGUgImxhcGkvc3lz
Y2FsbHMuaCIKKworI2RlZmluZSBURVNUX1ZBUklBTlRTCTIKKworI2RlZmluZSBNTlRQT0lOVAki
bW50X3BvaW50IgorI2RlZmluZSBGSUxFX1NSQ19QQVRIICAgImZpbGVfc3JjIgorI2RlZmluZSBG
SUxFX0RFU1RfUEFUSCAgImZpbGVfZGVzdCIKKyNkZWZpbmUgRklMRV9SRE9OTF9QQVRIICJmaWxl
X3Jkb25sIgorI2RlZmluZSBGSUxFX0RJUl9QQVRICSJmaWxlX2RpciIKKyNkZWZpbmUgRklMRV9N
TlRFRF9QQVRICU1OVFBPSU5UIi9maWxlX21udGVkIgorCisjZGVmaW5lIENPTlRFTlQJCSJBQkNE
RUZHSElKS0xNTk9QUVJTVFVWV1hZWjEyMzQ1XG4iCisjZGVmaW5lIENPTlRTSVpFCShzaXplb2Yo
Q09OVEVOVCkgLSAxKQorCitzdGF0aWMgdm9pZCBzeXNjYWxsX2luZm8odm9pZCkKK3sKKwlzd2l0
Y2ggKHRzdF92YXJpYW50KSB7CisJY2FzZSAwOgorCQl0c3RfcmVzKFRJTkZPLCAiVGVzdGluZyBs
aWJjIGNvcHlfZmlsZV9yYW5nZSgpIik7CisJCWJyZWFrOworCWNhc2UgMToKKwkJdHN0X3JlcyhU
SU5GTywgIlRlc3RpbmcgdHN0IGNvcHlfZmlsZV9yYW5nZSgpIik7CisJfQorfQorCitzdGF0aWMg
aW50IHN5c19jb3B5X2ZpbGVfcmFuZ2UoaW50IGZkX2luLCBsb2ZmX3QgKm9mZl9pbiwKKwkJaW50
IGZkX291dCwgbG9mZl90ICpvZmZfb3V0LCBzaXplX3QgbGVuLCB1bnNpZ25lZCBpbnQgZmxhZ3Mp
Cit7CisJc3dpdGNoICh0c3RfdmFyaWFudCkgeworCisJY2FzZSAwOgorI2lmZGVmIEhBVkVfQ09Q
WV9GSUxFX1JBTkdFCisJCXJldHVybiBjb3B5X2ZpbGVfcmFuZ2UoZmRfaW4sIG9mZl9pbiwKKwkJ
CQlmZF9vdXQsIG9mZl9vdXQsIGxlbiwgZmxhZ3MpOworI2Vsc2UKKwkJdHN0X2JyayhUQ09ORiwg
ImxpYmMgY29weV9maWxlX3JhbmdlKCkgbm90IHN1cHBvcnRlZCEiKTsKKyNlbmRpZgorCQlicmVh
azsKKwljYXNlIDE6CisJCXJldHVybiB0c3Rfc3lzY2FsbChfX05SX2NvcHlfZmlsZV9yYW5nZSwg
ZmRfaW4sIG9mZl9pbiwgZmRfb3V0LAorCQkJCW9mZl9vdXQsIGxlbiwgZmxhZ3MpOworCX0KKwly
ZXR1cm4gLTE7Cit9CisKKyNlbmRpZiAvKiBfX0NPUFlfRklMRV9SQU5HRV9IX18gKi8KZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmls
ZV9yYW5nZTAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9j
b3B5X2ZpbGVfcmFuZ2UwMS5jCmluZGV4IDYxYTYwNDJkOS4uYTViZDVlN2Y3IDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFu
Z2UwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2Nv
cHlfZmlsZV9yYW5nZTAxLmMKQEAgLTEsNjYgKzEsMzAgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAvKgotICogQ29weXJpZ2h0IChjKSBMaW51eCBUZXN0
IFByb2plY3QsIDIwMTcKLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgIHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKLSAqIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Ci0gKiB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNl
bnNlLCBvcgotICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqIENvcHly
aWdodCAoYykgTGludXggVGVzdCBQcm9qZWN0LCAyMDE5CisgKi8KKworLyoKKyAqIFRoaXMgdGVz
dHMgdGhlIGZ1bmRhbWVudGFsIGZ1bmN0aW9uYWxpdGllcyBvZiB0aGUgY29weV9maWxlX3Jhbmdl
CisgKiBzeXNjYWxsLiBJdCBkb2VzIHNvIGJ5IGNvcHlpbmcgdGhlIGNvbnRlbnRzIG9mIG9uZSBm
aWxlIGludG8KKyAqIGFub3RoZXIgdXNpbmcgdmFyaW91cyBkaWZmZXJlbnQgY29tYmluYXRpb25z
IGZvciBsZW5ndGggYW5kCisgKiBpbnB1dC9vdXRwdXQgb2Zmc2V0cy4KICAqCi0gKiBUaGlzIHBy
b2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwK
LSAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlCi0gKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KKyAqIEFmdGVyIGEgY29weSBpcyBkb25lIHRoaXMgdGVzdCBjaGVja3MgaWYg
dGhlIGNvbnRlbnRzIG9mIGJvdGggZmlsZXMKKyAqIGFyZSBlcXVhbCBhdCB0aGUgZ2l2ZW4gb2Zm
c2V0cy4gSXQgaXMgYWxzbyBpbnNwZWN0ZWQgaWYgdGhlIG9mZnNldHMKKyAqIG9mIHRoZSBmaWxl
IGRlc2NyaXB0b3JzIGFyZSBhZHZhbmNlZCBjb3JyZWN0bHkuCiAgKi8KIAogI2RlZmluZSBfR05V
X1NPVVJDRQorCiAjaW5jbHVkZSA8c3RkaW8uaD4KLSNpbmNsdWRlIDxlcnJuby5oPgogI2luY2x1
ZGUgPHN0ZGxpYi5oPgogI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAjaW5jbHVkZSAidHN0X3NhZmVf
c3RkaW8uaCIKLSNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCi0KLSNkZWZpbmUgVEVTVF9GSUxF
XzEgImNvcHlfZmlsZV9yYW5nZV9sdHAwMS50eHQiCi0jZGVmaW5lIFRFU1RfRklMRV8yICJjb3B5
X2ZpbGVfcmFuZ2VfbHRwMDIudHh0IgotI2RlZmluZSBTVFIgImFiY2RlZmdoaWprbG1ub3BxcnN0
dXZ3eHl6MTIzNDVcbiIKLQotI2RlZmluZSB2ZXJib3NlIDAKLQotc3RhdGljIHNpemVfdCAqbGVu
X2FycjsKLXN0YXRpYyBsb2ZmX3QgKipvZmZfYXJyOwotc3RhdGljIGludCBsZW5fc3osIG9mZl9z
ejsKKyNpbmNsdWRlICJjb3B5X2ZpbGVfcmFuZ2UuaCIKIAotc3RhdGljIHZvaWQgc2V0dXAodm9p
ZCkKLXsKLQlpbnQgaSwgZmQsIHBhZ2Vfc2l6ZTsKLQotCXBhZ2Vfc2l6ZSA9IGdldHBhZ2VzaXpl
KCk7Ci0KLQlmZCA9IFNBRkVfT1BFTihURVNUX0ZJTEVfMSwgT19SRFdSIHwgT19DUkVBVCwgMDY2
NCk7Ci0JLyogV3JpdGluZyBwYWdlX3NpemUgKiA0IG9mIGRhdGEgaW50byB0ZXN0IGZpbGUgKi8K
LQlmb3IgKGkgPSAwOyBpIDwgKGludCkocGFnZV9zaXplICogNCk7IGkrKykKLQkJU0FGRV9XUklU
RSgxLCBmZCwgU1RSLCBzdHJsZW4oU1RSKSk7Ci0JU0FGRV9DTE9TRShmZCk7Ci0KLQlsZW5fc3og
PSA0OwotCWxlbl9hcnIgPSBtYWxsb2Moc2l6ZW9mKHNpemVfdCkgKiBsZW5fc3opOwotCWxlbl9h
cnJbMF0gPSAxMTsKLQlsZW5fYXJyWzFdID0gcGFnZV9zaXplIC0gMTsKLQlsZW5fYXJyWzJdID0g
cGFnZV9zaXplOwotCWxlbl9hcnJbM10gPSBwYWdlX3NpemUgKyAxOwotCi0Jb2ZmX3N6ID0gNjsK
LQlvZmZfYXJyID0gbWFsbG9jKHNpemVvZihsb2ZmX3QgKikgKiBvZmZfc3opOwotCWZvciAoaSA9
IDE7IGkgPCBvZmZfc3o7IGkrKykKLQkJb2ZmX2FycltpXSA9IG1hbGxvYyhzaXplb2YobG9mZl90
KSk7Ci0KLQlvZmZfYXJyWzBdID0gTlVMTDsKLQkqb2ZmX2FyclsxXSA9IDA7Ci0JKm9mZl9hcnJb
Ml0gPSAxNzsKLQkqb2ZmX2FyclszXSA9IHBhZ2Vfc2l6ZSAtIDE7Ci0JKm9mZl9hcnJbNF0gPSBw
YWdlX3NpemU7Ci0JKm9mZl9hcnJbNV0gPSBwYWdlX3NpemUgKyAxOwotfQorc3RhdGljIGludCBw
YWdlX3NpemU7CitzdGF0aWMgaW50IGVycmNvdW50LCBudW1jb3BpZXM7CitzdGF0aWMgaW50IGZk
X2luLCBmZF9vdXQ7CiAKIHN0YXRpYyBpbnQgY2hlY2tfZmlsZV9jb250ZW50KGNvbnN0IGNoYXIg
KmZuYW1lMSwgY29uc3QgY2hhciAqZm5hbWUyLAogCWxvZmZfdCAqb2ZmMSwgbG9mZl90ICpvZmYy
LCBzaXplX3QgbGVuKQpAQCAtOTAsNTIgKzU0LDM3IEBAIHN0YXRpYyBpbnQgY2hlY2tfZmlsZV9j
b250ZW50KGNvbnN0IGNoYXIgKmZuYW1lMSwgY29uc3QgY2hhciAqZm5hbWUyLAogfQogCiBzdGF0
aWMgaW50IGNoZWNrX2ZpbGVfb2Zmc2V0KGNvbnN0IGNoYXIgKm0sIGludCBmZCwgbG9mZl90IGxl
biwKLQlsb2ZmX3QgKm9mZl9vcmksIGxvZmZfdCAqb2ZmX2FmdGVyKQorCQlsb2ZmX3QgKm9mZl9i
ZWZvcmUsIGxvZmZfdCAqb2ZmX2FmdGVyKQogeworCWxvZmZfdCBmZF9vZmYgPSBTQUZFX0xTRUVL
KGZkLCAwLCBTRUVLX0NVUik7CiAJaW50IHJldCA9IDA7CiAKLQlpZiAob2ZmX29yaSkgewotCQkv
KiBGRCBzaG91bGQgc3RheSB1bnRvdWNoZWQsIGFuZCBvZmZfaW4vb3V0IGlzIHVwZGF0ZWQgKi8K
LQkJbG9mZl90IGZkX29mZiA9IFNBRkVfTFNFRUsoZmQsIDAsIFNFRUtfQ1VSKTsKLQotCQlpZiAo
ZmRfb2ZmID09IDApIHsKLQkJCWlmICh2ZXJib3NlKQotCQkJCXRzdF9yZXMoVFBBU1MsICIlcyBG
RCBvZmZzZXQgdW5jaGFuZ2VkIiwgbSk7Ci0JCX0gZWxzZSB7Ci0JCQl0c3RfcmVzKFRGQUlMLCAi
JXMgRkQgb2Zmc2V0IGNoYW5nZWQ6ICVsZCIsCisJaWYgKG9mZl9iZWZvcmUpIHsKKwkJLyoKKwkJ
ICogY29weV9maWxlX3JhbmdlIG9mZnNldCBpcyBnaXZlbjoKKwkJICogLSBmZCBvZmZzZXQgc2hv
dWxkIHN0YXkgMCwKKwkJICogLSBjb3B5X2ZpbGVfcmFuZ2Ugb2Zmc2V0IGlzIHVwZGF0ZWQKKwkJ
ICovCisJCWlmIChmZF9vZmYgIT0gMCkgeworCQkJdHN0X3JlcyhURkFJTCwKKwkJCQkiJXMgZmQg
b2Zmc2V0IHVuZXhwZWN0ZWRseSBjaGFuZ2VkOiAlbGQiLAogCQkJCW0sIChsb25nKWZkX29mZik7
CiAJCQlyZXQgPSAxOwotCQl9CiAKLQkJaWYgKCFvZmZfYWZ0ZXIpIHsKLQkJCXRzdF9yZXMoVEZB
SUwsICIlcyBvZmZzZXQgaXMgTlVMTCIsIG0pOwotCQkJcmV0ID0gMTsKLQkJfQotCi0JCWlmICgo
b2ZmX2FmdGVyKSAmJiAoKm9mZl9vcmkgKyBsZW4gPT0gKm9mZl9hZnRlcikpIHsKLQkJCWlmICh2
ZXJib3NlKSB7Ci0JCQkJdHN0X3JlcyhUUEFTUywgIiVzIG9mZnNldCBhZHZhbmNlZCBhcyIKLQkJ
CQkJIiBleHBlY3RlZDogJWxkIiwgbSwgKGxvbmcpKm9mZl9hZnRlcik7Ci0JCQl9Ci0JCX0gZWxz
ZSB7CisJCX0gZWxzZSBpZiAoKm9mZl9iZWZvcmUgKyBsZW4gIT0gKm9mZl9hZnRlcikgewogCQkJ
dHN0X3JlcyhURkFJTCwgIiVzIG9mZnNldCB1bmV4cGVjdGVkIHZhbHVlOiAlbGQiLAogCQkJCW0s
IChsb25nKSpvZmZfYWZ0ZXIpOwogCQkJcmV0ID0gMTsKIAkJfQotCX0gZWxzZSB7Ci0JCS8qIEZE
IG9mZnNldCBpcyBhZHZhbmNlZCBieSBsZW4gKi8KLQkJbG9mZl90IGZkX29mZiA9IFNBRkVfTFNF
RUsoZmQsIDAsIFNFRUtfQ1VSKTsKLQotCQlpZiAoZmRfb2ZmID09IGxlbikgewotCQkJaWYgKHZl
cmJvc2UpIHsKLQkJCQl0c3RfcmVzKFRQQVNTLCAiJXMgRkQgb2Zmc2V0IGNoYW5nZWQgYXMiCi0J
CQkJCSIgZXhwZWN0ZWQ6ICVsZCIsIG0sIChsb25nKWZkX29mZik7Ci0JCQl9Ci0JCX0gZWxzZSB7
Ci0JCQl0c3RfcmVzKFRGQUlMLCAiJXMgRkQgb2Zmc2V0IHVuZXhwZWN0ZWQgdmFsdWU6ICVsZCIs
CisJfQorCS8qCisJICogbm8gY29weV9maWxlX3JhbmdlIG9mZnNldCBnaXZlbjoKKwkgKiAtIGZk
IG9mZnNldCBhZHZhbmNlZCBieSBsZW5ndGgKKwkgKi8KKwllbHNlIGlmIChmZF9vZmYgIT0gbGVu
KSB7CisJCXRzdF9yZXMoVEZBSUwsICIlcyBmZCBvZmZzZXQgdW5leHBlY3RlZCB2YWx1ZTogJWxk
IiwKIAkJCQltLCAobG9uZylmZF9vZmYpOwotCQkJcmV0ID0gMTsKLQkJfQorCQlyZXQgPSAxOwog
CX0KIAogCXJldHVybiByZXQ7CkBAIC0xNDMsNzcgKzkyLDEzNSBAQCBzdGF0aWMgaW50IGNoZWNr
X2ZpbGVfb2Zmc2V0KGNvbnN0IGNoYXIgKm0sIGludCBmZCwgbG9mZl90IGxlbiwKIAogc3RhdGlj
IHZvaWQgdGVzdF9vbmUoc2l6ZV90IGxlbiwgbG9mZl90ICpvZmZfaW4sIGxvZmZfdCAqb2ZmX291
dCkKIHsKKwlpbnQgcmV0OwogCXNpemVfdCB0b19jb3B5ID0gbGVuOwotCWludCBmZF9pbiwgZmRf
b3V0LCByZXQ7Ci0JbG9mZl90ICpvZmZfaW5fb3JpID0gb2ZmX2luOwotCWxvZmZfdCAqb2ZmX291
dF9vcmkgPSBvZmZfb3V0OwotCWxvZmZfdCBvZmZfaW5fY29weTsKLQlsb2ZmX3Qgb2ZmX291dF9j
b3B5OworCWxvZmZfdCBvZmZfaW5fdmFsdWVfY29weSwgb2ZmX291dF92YWx1ZV9jb3B5OworCWxv
ZmZfdCAqb2ZmX25ld19pbiAgPSAmb2ZmX2luX3ZhbHVlX2NvcHk7CisJbG9mZl90ICpvZmZfbmV3
X291dCA9ICZvZmZfb3V0X3ZhbHVlX2NvcHk7CiAJY2hhciBzdHJfb2ZmX2luWzMyXSwgc3RyX29m
Zl9vdXRbMzJdOwogCiAJaWYgKG9mZl9pbikgewotCQlvZmZfaW5fY29weSA9ICpvZmZfaW47Ci0J
CW9mZl9pbiA9ICZvZmZfaW5fY29weTsKKwkJb2ZmX2luX3ZhbHVlX2NvcHkgPSAqb2ZmX2luOwog
CQlzcHJpbnRmKHN0cl9vZmZfaW4sICIlbGQiLCAobG9uZykqb2ZmX2luKTsKIAl9IGVsc2Ugewor
CQlvZmZfbmV3X2luID0gTlVMTDsKIAkJc3RyY3B5KHN0cl9vZmZfaW4sICJOVUxMIik7CiAJfQog
CiAJaWYgKG9mZl9vdXQpIHsKLQkJb2ZmX291dF9jb3B5ID0gKm9mZl9vdXQ7Ci0JCW9mZl9vdXQg
PSAmb2ZmX291dF9jb3B5OworCQlvZmZfb3V0X3ZhbHVlX2NvcHkgPSAqb2ZmX291dDsKIAkJc3By
aW50ZihzdHJfb2ZmX291dCwgIiVsZCIsIChsb25nKSpvZmZfb3V0KTsKIAl9IGVsc2UgeworCQlv
ZmZfbmV3X291dCA9IE5VTEw7CiAJCXN0cmNweShzdHJfb2ZmX291dCwgIk5VTEwiKTsKIAl9CiAK
LQlmZF9pbiA9IFNBRkVfT1BFTihURVNUX0ZJTEVfMSwgT19SRE9OTFkpOwotCWZkX291dCA9IFNB
RkVfT1BFTihURVNUX0ZJTEVfMiwgT19DUkVBVCB8IE9fV1JPTkxZIHwgT19UUlVOQywgMDY0NCk7
Ci0KIAkvKgogCSAqIGNvcHlfZmlsZV9yYW5nZSgpIHdpbGwgcmV0dXJuIHRoZSBudW1iZXIgb2Yg
Ynl0ZXMgY29waWVkIGJldHdlZW4KIAkgKiBmaWxlcy4gVGhpcyBjb3VsZCBiZSBsZXNzIHRoYW4g
dGhlIGxlbmd0aCBvcmlnaW5hbGx5IHJlcXVlc3RlZC4KIAkgKi8KIAlkbyB7Ci0JCVRFU1QodHN0
X3N5c2NhbGwoX19OUl9jb3B5X2ZpbGVfcmFuZ2UsIGZkX2luLCBvZmZfaW4sIGZkX291dCwKLQkJ
CW9mZl9vdXQsIHRvX2NvcHksIDApKTsKKwkJVEVTVChzeXNfY29weV9maWxlX3JhbmdlKGZkX2lu
LCBvZmZfbmV3X2luLCBmZF9vdXQsCisJCQkJb2ZmX25ld19vdXQsIHRvX2NvcHksIDApKTsKIAkJ
aWYgKFRTVF9SRVQgPT0gLTEpIHsKIAkJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAiY29weV9m
aWxlX3JhbmdlKCkgZmFpbGVkIik7Ci0JCQlTQUZFX0NMT1NFKGZkX2luKTsKLQkJCVNBRkVfQ0xP
U0UoZmRfb3V0KTsKKwkJCWVycmNvdW50Kys7CiAJCQlyZXR1cm47CiAJCX0KIAogCQl0b19jb3B5
IC09IFRTVF9SRVQ7CiAJfSB3aGlsZSAodG9fY29weSA+IDApOwogCi0JcmV0ID0gY2hlY2tfZmls
ZV9jb250ZW50KFRFU1RfRklMRV8xLCBURVNUX0ZJTEVfMiwKLQkJb2ZmX2luX29yaSwgb2ZmX291
dF9vcmksIGxlbik7Ci0JaWYgKHJldCkKKwlyZXQgPSBjaGVja19maWxlX2NvbnRlbnQoRklMRV9T
UkNfUEFUSCwgRklMRV9ERVNUX1BBVEgsCisJCW9mZl9pbiwgb2ZmX291dCwgbGVuKTsKKwlpZiAo
cmV0KSB7CiAJCXRzdF9yZXMoVEZBSUwsICJmaWxlIGNvbnRlbnRzIGRvIG5vdCBtYXRjaCIpOwor
CQllcnJjb3VudCsrOworCQlyZXR1cm47CisJfQogCi0JcmV0IHw9IGNoZWNrX2ZpbGVfb2Zmc2V0
KCIoaW4pIiwgZmRfaW4sIGxlbiwgb2ZmX2luX29yaSwgb2ZmX2luKTsKLQlyZXQgfD0gY2hlY2tf
ZmlsZV9vZmZzZXQoIihvdXQpIiwgZmRfb3V0LCBsZW4sIG9mZl9vdXRfb3JpLCBvZmZfb3V0KTsK
KwlyZXQgfD0gY2hlY2tfZmlsZV9vZmZzZXQoIihpbikiLCBmZF9pbiwgbGVuLCBvZmZfaW4sIG9m
Zl9uZXdfaW4pOworCXJldCB8PSBjaGVja19maWxlX29mZnNldCgiKG91dCkiLCBmZF9vdXQsIGxl
biwgb2ZmX291dCwgb2ZmX25ld19vdXQpOworCisJaWYgKHJldCAhPSAwKSB7CisJCXRzdF9yZXMo
VEZBSUwsICJvZmZfaW46ICVzLCBvZmZfb3V0OiAlcywgbGVuOiAlbGQiLAorCQkJCXN0cl9vZmZf
aW4sIHN0cl9vZmZfb3V0LCAobG9uZylsZW4pOworCQllcnJjb3VudCsrOworCX0KK30KIAotCXRz
dF9yZXMocmV0ID09IDAgPyBUUEFTUyA6IFRGQUlMLCAib2ZmX2luOiAlcywgb2ZmX291dDogJXMs
IGxlbjogJWxkIiwKLQkJCXN0cl9vZmZfaW4sIHN0cl9vZmZfb3V0LCAobG9uZylsZW4pOworc3Rh
dGljIHZvaWQgb3Blbl9maWxlcyh2b2lkKQoreworCWZkX2luICA9IFNBRkVfT1BFTihGSUxFX1NS
Q19QQVRILCBPX1JET05MWSk7CisJZmRfb3V0ID0gU0FGRV9PUEVOKEZJTEVfREVTVF9QQVRILCBP
X0NSRUFUIHwgT19XUk9OTFkgfCBPX1RSVU5DLCAwNjQ0KTsKK30KIAotCVNBRkVfQ0xPU0UoZmRf
aW4pOwotCVNBRkVfQ0xPU0UoZmRfb3V0KTsKK3N0YXRpYyB2b2lkIGNsb3NlX2ZpbGVzKHZvaWQp
Cit7CisJaWYgKGZkX291dCA+IDApCisJCVNBRkVfQ0xPU0UoZmRfb3V0KTsKKwlpZiAoZmRfaW4g
ID4gMCkKKwkJU0FGRV9DTE9TRShmZF9pbik7CiB9CiAKIHN0YXRpYyB2b2lkIGNvcHlfZmlsZV9y
YW5nZV92ZXJpZnkodm9pZCkKIHsKIAlpbnQgaSwgaiwgazsKIAotCWZvciAoaSA9IDA7IGkgPCBs
ZW5fc3o7IGkrKykKLQkJZm9yIChqID0gMDsgaiA8IG9mZl9zejsgaisrKQotCQkJZm9yIChrID0g
MDsgayA8IG9mZl9zejsgaysrKQorCWVycmNvdW50ID0gbnVtY29waWVzID0gMDsKKwlzaXplX3Qg
bGVuX2FycltdCT0gezExLCBwYWdlX3NpemUtMSwgcGFnZV9zaXplLCBwYWdlX3NpemUrMX07CisJ
bG9mZl90IG9mZl9hcnJfdmFsdWVzW10JPSB7MCwgMTcsIHBhZ2Vfc2l6ZS0xLCBwYWdlX3NpemUs
IHBhZ2Vfc2l6ZSsxfTsKKworCWludCBudW1fb2Zmc2V0cyA9IEFSUkFZX1NJWkUob2ZmX2Fycl92
YWx1ZXMpICsgMTsKKwlsb2ZmX3QgKm9mZl9hcnJbbnVtX29mZnNldHNdOworCisJb2ZmX2Fyclsw
XSA9IE5VTEw7CisJZm9yIChpID0gMTsgaSA8IG51bV9vZmZzZXRzOyBpKyspCisJCW9mZl9hcnJb
aV0gPSAmb2ZmX2Fycl92YWx1ZXNbaS0xXTsKKworCS8qIFRlc3QgYWxsIHBvc3NpYmxlIGNvYmlu
YXRpb25zIG9mIGdpdmVuIGxlbmd0aHMgYW5kIG9mZnNldHMgKi8KKwlmb3IgKGkgPSAwOyBpIDwg
KGludClBUlJBWV9TSVpFKGxlbl9hcnIpOyBpKyspCisJCWZvciAoaiA9IDA7IGogPCBudW1fb2Zm
c2V0czsgaisrKQorCQkJZm9yIChrID0gMDsgayA8IG51bV9vZmZzZXRzOyBrKyspIHsKKwkJCQlv
cGVuX2ZpbGVzKCk7CiAJCQkJdGVzdF9vbmUobGVuX2FycltpXSwgb2ZmX2FycltqXSwgb2ZmX2Fy
cltrXSk7CisJCQkJY2xvc2VfZmlsZXMoKTsKKwkJCQludW1jb3BpZXMrKzsKKwkJCX0KKworCWlm
IChlcnJjb3VudCA9PSAwKQorCQl0c3RfcmVzKFRQQVNTLAorCQkJImNvcHlfZmlsZV9yYW5nZSBj
b21wbGV0ZWQgYWxsICVkIGNvcHkgam9icyBzdWNjZXNzZnVsbHkhIiwKKwkJCW51bWNvcGllcyk7
CisJZWxzZQorCQl0c3RfcmVzKFRGQUlMLCAiY29weV9maWxlX3JhbmdlIGZhaWxlZCAlZCBvZiAl
ZCBjb3B5IGpvYnMuIiwKKwkJCQllcnJjb3VudCwgbnVtY29waWVzKTsKK30KKworc3RhdGljIHZv
aWQgc2V0dXAodm9pZCkKK3sKKwlpbnQgaSwgZmQ7CisKKwlzeXNjYWxsX2luZm8oKTsKKworCXBh
Z2Vfc2l6ZSA9IGdldHBhZ2VzaXplKCk7CisKKwlmZCA9IFNBRkVfT1BFTihGSUxFX1NSQ19QQVRI
LCBPX1JEV1IgfCBPX0NSRUFULCAwNjY0KTsKKwkvKiBXcml0aW5nIHBhZ2Vfc2l6ZSAqIDQgb2Yg
ZGF0YSBpbnRvIHRlc3QgZmlsZSAqLworCWZvciAoaSA9IDA7IGkgPCAoaW50KShwYWdlX3NpemUg
KiA0KTsgaSsrKQorCQlTQUZFX1dSSVRFKDEsIGZkLCBDT05URU5ULCBDT05UU0laRSk7CisJU0FG
RV9DTE9TRShmZCk7Cit9CisKK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKK3sKKwljbG9zZV9m
aWxlcygpOwogfQogCiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLnNldHVwID0g
c2V0dXAsCisJLmNsZWFudXAgPSBjbGVhbnVwLAogCS5uZWVkc190bXBkaXIgPSAxLAogCS50ZXN0
X2FsbCA9IGNvcHlfZmlsZV9yYW5nZV92ZXJpZnksCisJLnRlc3RfdmFyaWFudHMgPSBURVNUX1ZB
UklBTlRTLAogfTsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9m
aWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMC4uMDdjMDIwN2MyCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwpAQCAt
MCwwICsxLDExOCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKKy8qCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgU1VTRSBMTEMKKyAqIEF1dGhvcjogQ2hyaXN0
aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+CisgKi8KKworLyoKKyAqIFRlc3RzIGJhc2ljIGVy
cm9yIGhhbmRsaW5nIG9mIHRoZQorICogY29weV9maWxlX3JhbmdlIHN5c2NhbGwKKyAqCisgKiAx
KSBUcnkgdG8gY29weSBjb250ZW50cyB0byBmaWxlIG9wZW4gYXMgcmVhZG9ubHkKKyAqICAgIC0+
IEVCQURGCisgKiAyKSBUcnkgdG8gY29weSBjb250ZW50cyB0byBmaWxlIG9uIGRpZmZlcmVudCBt
b3VudGVkCisgKiAgICBmaWxlc3lzdGVtIC0+IEVYREVWCisgKiAzKSBUcnkgdG8gY29weSBjb250
ZW50cyB0byBkaXJlY3RvcnkgLT4gRUlTRElSCisgKiA0KSBUcnkgdG8gY29weSBjb250ZW50cyB0
byBhIGZpbGUgb3BlbmVkIHdpdGggdGhlCisgKiAgICBPX0FQUEVORCBmbGFnIC0+IEVCQURGCisg
KiA1KSBUcnkgdG8gY29weSBjb250ZW50cyB0byBjbG9zZWQgZmlsZWRlc2NyaXB0b3IKKyAqICAg
IC0+IEVCQURGCisgKiA2KSBUcnkgdG8gY29weSBjb250ZW50cyB3aXRoIGludmFsaWQgJ2ZsYWdz
JyB2YWx1ZQorICogICAgLT4gRUlOVkFMCisgKi8KKworI2RlZmluZSBfR05VX1NPVVJDRQorCisj
aW5jbHVkZSAidHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJjb3B5X2ZpbGVfcmFuZ2UuaCIKKworc3Rh
dGljIGludCBmZF9zcmM7CitzdGF0aWMgaW50IGZkX2Rlc3Q7CitzdGF0aWMgaW50IGZkX3Jkb25s
eTsKK3N0YXRpYyBpbnQgZmRfbW50ZWQ7CitzdGF0aWMgaW50IGZkX2RpcjsKK3N0YXRpYyBpbnQg
ZmRfY2xvc2VkOworc3RhdGljIGludCBmZF9hcHBlbmQ7CisKK3N0YXRpYyBzdHJ1Y3QgdGNhc2Ug
eworCWludAkqY29weV90b19mZDsKKwlpbnQJZmxhZ3M7CisJaW50CWV4cF9lcnI7Cit9IHRjYXNl
c1tdID0geworCXsmZmRfcmRvbmx5LAkwLAlFQkFERn0sCisJeyZmZF9tbnRlZCwJMCwJRVhERVZ9
LAorCXsmZmRfZGlyLAkwLAlFSVNESVJ9LAorCXsmZmRfYXBwZW5kLAkwLAlFQkFERn0sCisJeyZm
ZF9jbG9zZWQsCTAsCUVCQURGfSwKKwl7JmZkX2Rlc3QsCS0xLAlFSU5WQUx9LAorfTsKKworc3Rh
dGljIHZvaWQgdmVyaWZ5X2NvcHlfZmlsZV9yYW5nZSh1bnNpZ25lZCBpbnQgbikKK3sKKwlzdHJ1
Y3QgdGNhc2UgKnRjID0gJnRjYXNlc1tuXTsKKworCVRFU1Qoc3lzX2NvcHlfZmlsZV9yYW5nZShm
ZF9zcmMsIDAsICp0Yy0+Y29weV90b19mZCwKKwkJCQkwLCBDT05UU0laRSwgdGMtPmZsYWdzKSk7
CisKKwlpZiAoVFNUX1JFVCA9PSAtMSkgeworCQlpZiAodGMtPmV4cF9lcnIgPT0gVFNUX0VSUikg
eworCQkJdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8sCisJCQkJCSJjb3B5X2ZpbGVfcmFuZ2UgZmFp
bGVkIGFzIGV4cGVjdGVkIik7CisJCX0gZWxzZSB7CisJCQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJO
TywKKwkJCQkiY29weV9maWxlX3JhbmdlIGZhaWxlZCB1bmV4cGVjdGVkbHk7IGV4cGVjdGVkICVz
LCBidXQgZ290IiwKKwkJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKKwkJCXJldHVybjsK
KwkJfQorCX0gZWxzZSB7CisJCXRzdF9yZXMoVEZBSUwsCisJCQkiY29weV9maWxlX3JhbmdlIHJl
dHVybmVkIHdyb25nIHZhbHVlOiAlbGQiLCBUU1RfUkVUKTsKKwl9Cit9CisKK3N0YXRpYyB2b2lk
IGNsZWFudXAodm9pZCkKK3sKKwlpZiAoZmRfYXBwZW5kID4gMCkKKwkJU0FGRV9DTE9TRShmZF9h
cHBlbmQpOworCWlmIChmZF9kaXIgPiAwKQorCQlTQUZFX0NMT1NFKGZkX2Rpcik7CisJaWYgKGZk
X21udGVkID4gMCkKKwkJU0FGRV9DTE9TRShmZF9tbnRlZCk7CisJaWYgKGZkX3Jkb25seSA+IDAp
CisJCVNBRkVfQ0xPU0UoZmRfcmRvbmx5KTsKKwlpZiAoZmRfZGVzdCA+IDApCisJCVNBRkVfQ0xP
U0UoZmRfZGVzdCk7CisJaWYgKGZkX3NyYyA+IDApCisJCVNBRkVfQ0xPU0UoZmRfc3JjKTsKK30K
Kworc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKK3sKKwlzeXNjYWxsX2luZm8oKTsKKworCWlmIChh
Y2Nlc3MoRklMRV9ESVJfUEFUSCwgRl9PSykgPT0gLTEpCisJCVNBRkVfTUtESVIoRklMRV9ESVJf
UEFUSCwgMDc3Nyk7CisKKwlmZF9zcmMgICAgPSBTQUZFX09QRU4oRklMRV9TUkNfUEFUSCwgT19S
RFdSIHwgT19DUkVBVCwgMDY2NCk7CisJZmRfZGVzdCAgID0gU0FGRV9PUEVOKEZJTEVfREVTVF9Q
QVRILCBPX1JEV1IgfCBPX0NSRUFULCAwNjY0KTsKKwlmZF9yZG9ubHkgPSBTQUZFX09QRU4oRklM
RV9SRE9OTF9QQVRILCBPX1JET05MWSB8IE9fQ1JFQVQsIDA2NjQpOworCWZkX21udGVkICA9IFNB
RkVfT1BFTihGSUxFX01OVEVEX1BBVEgsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NjQpOworCWZkX2Rp
ciAgICA9IFNBRkVfT1BFTihGSUxFX0RJUl9QQVRILCBPX0RJUkVDVE9SWSk7CisJZmRfY2xvc2Vk
ID0gLTE7CisJZmRfYXBwZW5kID0gU0FGRV9PUEVOKEZJTEVfREVTVF9QQVRILAorCQkJT19SRFdS
IHwgT19DUkVBVCB8IE9fQVBQRU5ELCAwNjY0KTsKKworCVNBRkVfV1JJVEUoMSwgZmRfc3JjLCAg
Q09OVEVOVCwgIENPTlRTSVpFKTsKK30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0g
eworCS50ZXN0ID0gdmVyaWZ5X2NvcHlfZmlsZV9yYW5nZSwKKwkudGNudCA9IEFSUkFZX1NJWkUo
dGNhc2VzKSwKKwkuc2V0dXAgPSBzZXR1cCwKKwkuY2xlYW51cCA9IGNsZWFudXAsCisJLm5lZWRz
X3Jvb3QgPSAxLAorCS5tb3VudF9kZXZpY2UgPSAxLAorCS5tbnRwb2ludCA9IE1OVFBPSU5ULAor
CS5kZXZfZnNfdHlwZSA9ICJleHQ0IiwKKwkudGVzdF92YXJpYW50cyA9IFRFU1RfVkFSSUFOVFMs
Cit9OwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFu
Z2UvY29weV9maWxlX3JhbmdlMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9m
aWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAzLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwLi4xOGU0MTFhZjIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMy5jCkBAIC0wLDAgKzEs
NzcgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgor
ICogQ29weXJpZ2h0IChjKSAyMDE5IFNVU0UgTExDCisgKiBBdXRob3I6IENocmlzdGlhbiBBbWFu
biA8Y2FtYW5uQHN1c2UuY29tPgorICovCisKKy8qCisgKiBDb3BpZXMgdGhlIGNvbnRlbnRzIG9m
IG9uZSBmaWxlIGludG8gYW5vdGhlciBhbmQKKyAqIGNoZWNrcyBpZiB0aGUgdGltZXN0YW1wIGdl
dHMgdXBkYXRlZCBpbiB0aGUgcHJvY2Vzcy4KKyAqLworCisjZGVmaW5lIF9HTlVfU09VUkNFCisK
KyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2luY2x1ZGUgImNvcHlfZmlsZV9yYW5nZS5oIgorCitz
dGF0aWMgaW50IGZkX3NyYzsKK3N0YXRpYyBpbnQgZmRfZGVzdDsKKwordW5zaWduZWQgbG9uZyBn
ZXRfdGltZXN0YW1wKGludCBmZCkKK3sKKwlzdHJ1Y3Qgc3RhdCBmaWxlc3RhdDsKKworCWZzdGF0
KGZkLCAmZmlsZXN0YXQpOworCXJldHVybiBmaWxlc3RhdC5zdF9tdGltZTsKK30KKworc3RhdGlj
IHZvaWQgdmVyaWZ5X2NvcHlfZmlsZV9yYW5nZV90aW1lc3RhbXAodm9pZCkKK3sKKwlsb2ZmX3Qg
b2Zmc2V0OworCXVuc2lnbmVkIGxvbmcgdGltZXN0YW1wLCB1cGRhdGVkX3RpbWVzdGFtcDsKKwor
CXRpbWVzdGFtcCA9IGdldF90aW1lc3RhbXAoZmRfZGVzdCk7CisJdXNsZWVwKDEwMDAwMDApOwor
CisJb2Zmc2V0ID0gMDsKKwlURVNUKHN5c19jb3B5X2ZpbGVfcmFuZ2UoZmRfc3JjLCAmb2Zmc2V0
LAorCQkJZmRfZGVzdCwgMCwgQ09OVFNJWkUsIDApKTsKKwlpZiAoVFNUX1JFVCA9PSAtMSkKKwkJ
dHN0X2JyayhUQlJPSyB8IFRURVJSTk8sCisJCQkJImNvcHlfZmlsZV9yYW5nZSB1bmV4cGVjdGVk
bHkgZmFpbGVkIik7CisKKwl1cGRhdGVkX3RpbWVzdGFtcCA9IGdldF90aW1lc3RhbXAoZmRfZGVz
dCk7CisKKwlpZiAodGltZXN0YW1wID09IHVwZGF0ZWRfdGltZXN0YW1wKQorCQl0c3RfYnJrKFRG
QUlMLCAiY29weV9maWxlX3JhbmdlIGRpZCBub3QgdXBkYXRlIHRpbWVzdGFtcC4iKTsKKworCXRz
dF9yZXMoVFBBU1MsICJjb3B5X2ZpbGVfcmFuZ2Ugc3VjZXNzZnVsbHkgdXBkYXRlZCB0aGUgdGlt
ZXN0YW1wISIpOworfQorCitzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCit7CisJaWYgKGZkX2Rl
c3QgPiAwKQorCQlTQUZFX0NMT1NFKGZkX2Rlc3QpOworCWlmIChmZF9zcmMgID4gMCkKKwkJU0FG
RV9DTE9TRShmZF9zcmMpOworfQorCitzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQoreworCXN5c2Nh
bGxfaW5mbygpOworCisJZmRfZGVzdCA9IFNBRkVfT1BFTihGSUxFX0RFU1RfUEFUSCwgT19SRFdS
IHwgT19DUkVBVCwgMDY2NCk7CisJZmRfc3JjICA9IFNBRkVfT1BFTihGSUxFX1NSQ19QQVRILCAg
T19SRFdSIHwgT19DUkVBVCwgMDY2NCk7CisJU0FGRV9XUklURSgxLCBmZF9zcmMsICBDT05URU5U
LCAgQ09OVFNJWkUpOworCVNBRkVfQ0xPU0UoZmRfc3JjKTsKKwlmZF9zcmMgPSBTQUZFX09QRU4o
RklMRV9TUkNfUEFUSCwgT19SRE9OTFkpOworfQorCisKK3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3Qg
dGVzdCA9IHsKKwkudGVzdF9hbGwgPSB2ZXJpZnlfY29weV9maWxlX3JhbmdlX3RpbWVzdGFtcCwK
Kwkuc2V0dXAgPSBzZXR1cCwKKwkuY2xlYW51cCA9IGNsZWFudXAsCisJLm5lZWRzX3RtcGRpciA9
IDEsCisJLnRlc3RfdmFyaWFudHMgPSBURVNUX1ZBUklBTlRTLAorfTsKLS0gCjIuMTYuNAoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
