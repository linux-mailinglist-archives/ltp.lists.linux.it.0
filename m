Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A583619E10
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 15:24:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74AE8294AC5
	for <lists+linux-ltp@lfdr.de>; Fri, 10 May 2019 15:24:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C948B294A8D
 for <ltp@lists.linux.it>; Fri, 10 May 2019 15:24:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9B976200D20
 for <ltp@lists.linux.it>; Fri, 10 May 2019 15:24:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0BB3AE1F
 for <ltp@lists.linux.it>; Fri, 10 May 2019 13:24:03 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Fri, 10 May 2019 15:24:00 +0200
Message-Id: <20190510132400.28963-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] syscalls/acct02: add functional testcase
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

VGhpcyBwYXRjaCBhZGRzIGEgZnVuY3Rpb25hbCB0ZXN0IHRvIHZlcmlmeSB0aGF0IHRoZSBmaWxl
CmNvbnRlbnRzIG9mIHRoZSBwcm9jZXNzIGFjY291bnRpbmcgZmlsZSBjb250YWlucyB2YWxpZCBh
bmQKY29ycmVjdCBkYXRhIHdoZW4gdHJpZ2dlcmVkIHVzaW5nIHRoZSBhY2N0KCkgc3lzY2FsbC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgotLS0KIGNv
bmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIG00L2x0cC1h
Y2N0Lm00ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiBydW50ZXN0L3N5c2Nh
bGxzICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2FjY3QvLmdpdGlnbm9yZSB8ICAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2FjY3QvYWNjdDAyLmMgICB8IDE2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgMTc2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtNC9s
dHAtYWNjdC5tNAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
YWNjdC9hY2N0MDIuYwoKZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwpp
bmRleCBmYWQ4ZjgzOTYuLjhkMWU3NGIwYyAxMDA2NDQKLS0tIGEvY29uZmlndXJlLmFjCisrKyBi
L2NvbmZpZ3VyZS5hYwpAQCAtMTkxLDYgKzE5MSw3IEBAIEFDX0NPTkZJR19TVUJESVJTKFt1dGls
cy9mZnNiLTYuMC1yYzJdKQogQUNfQ09ORklHX0NPTU1BTkRTKFtzeXNjYWxscy5oXSwgW2NkICR7
YWNfdG9wX3NyY2Rpcn0vaW5jbHVkZS9sYXBpL3N5c2NhbGxzOyAuL3JlZ2VuLnNoXSkKIAogIyBj
dXN0b20gZnVuY3Rpb25zCitMVFBfQ0hFQ0tfQUNDVAogTFRQX0NIRUNLX0FDTF9TVVBQT1JUCiBM
VFBfQ0hFQ0tfQVRPTUlDX01FTU9SWV9NT0RFTAogTFRQX0NIRUNLX0JVSUxUSU5fQ0xFQVJfQ0FD
SEUKZGlmZiAtLWdpdCBhL200L2x0cC1hY2N0Lm00IGIvbTQvbHRwLWFjY3QubTQKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi42MWJjMDE5NDcKLS0tIC9kZXYvbnVsbAorKysg
Yi9tNC9sdHAtYWNjdC5tNApAQCAtMCwwICsxLDcgQEAKK2RubCBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgorZG5sIENvcHlyaWdodCAoYykgMjAxOSBTVVNFIExMQwor
ZG5sIEF1dGhvcjogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5Ac3VzZS5jb20+CisKK0FDX0RFRlVO
KFtMVFBfQ0hFQ0tfQUNDVF0sWworQUNfQ0hFQ0tfVFlQRVMoW3N0cnVjdCBhY2N0X3YzXSwsLFsj
aW5jbHVkZSA8c3lzL2FjY3QuaD5dKQorXSkKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMg
Yi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDJiOGNhNzE5Yi4uMjUzMDU1ZGUzIDEwMDY0NAotLS0g
YS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qvc3lzY2FsbHMKQEAgLTEwLDYgKzEwLDcg
QEAgYWNjZXNzMDMgYWNjZXNzMDMKIGFjY2VzczA0IGFjY2VzczA0CiAKIGFjY3QwMSBhY2N0MDEK
K2FjY3QwMiBhY2N0MDIKIAogYWRkX2tleTAxIGFkZF9rZXkwMQogYWRkX2tleTAyIGFkZF9rZXkw
MgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0Ly5naXRpZ25vcmUg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2FjY3QvLmdpdGlnbm9yZQppbmRleCBjMmZiMTU2
MTEuLmVkNjhkMjAyYyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0
Ly5naXRpZ25vcmUKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0Ly5naXRpZ25v
cmUKQEAgLTEgKzEsMiBAQAogL2FjY3QwMQorL2FjY3QwMgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9hY2N0L2FjY3QwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9hY2N0L2FjY3QwMi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNGRk
YzQ4MmMzCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hY2N0
L2FjY3QwMi5jCkBAIC0wLDAgKzEsMTY2IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vci1sYXRlcgorCisvKgorICogIENvcHlyaWdodCAoYykgU1VTRSBMTEMsIDIwMTkK
KyAqICBBdXRob3I6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgorICovCisKKy8q
CisgKiBUaGlzIHRlc3RzIGlmIHRoZSBrZXJuZWwgd3JpdGVzIGNvcnJlY3QgZGF0YSB0byB0aGUK
KyAqIHByb2Nlc3MgYWNjb3VudGluZyBmaWxlLgorICoKKyAqIEZpcnN0LCBzeXN0ZW0td2lkZSBw
cm9jZXNzIGFjY291bnRpbmcgaXMgdHVybmVkIG9uIGFuZCB0aGUgb3V0cHV0IGdldHMKKyAqIGRp
cmVjdGVkIHRvIGEgZGVmaW5lZCBmaWxlLiBBZnRlciB0aGF0IGEgc2ltcGxlIGNvbW1hbmQgaXMg
aXNzdWVkIGluIG9yZGVyCisgKiB0byBnZW5lcmF0ZSBkYXRhIGFuZCB0aGUgcHJvY2VzcyBhY2Nv
dW50aW5nIGdldHMgdHVybmVkIG9mZiBhZ2Fpbi4KKyAqCisgKiBUbyB2ZXJpZnkgdGhlIHdyaXR0
ZW4gZGF0YSwgdGhlIGVudHJpZXMgb2YgdGhlIGFjY291bnRpbmcgZmlsZSBnZXQKKyAqIHBhcnNl
ZCBpbnRvIHRoZSBjb3JyZXNwb25kaW5nIGFjY3Qgc3RydWN0dXJlLiBTaW5jZSBpdCBjYW5ub3Qg
YmUgZ3VhcmFudGVlZAorICogdGhhdCBvbmx5IHRoZSBjb21tYW5kIGlzc3VlZCBieSB0aGlzIHRl
c3QgZ2V0cyB3cml0dGVuIGludG8gdGhlIGFjY291bnRpbmcKKyAqIGZpbGUsIHRoZSBjb250ZW50
cyBnZXQgcGFyc2VkIHVudGlsIHRoZSBjb3JyZWN0IGVudHJ5IGlzIGZvdW5kLCBvciBFT0YKKyAq
IGlzIHJlYWNoZWQuCisgKi8KKworI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CisjaW5jbHVkZSA8c3lz
L3R5cGVzLmg+CisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlIDxzdHJpbmcuaD4KKyNpbmNs
dWRlIDx0aW1lLmg+CisjaW5jbHVkZSA8dW5pc3RkLmg+CisjaW5jbHVkZSAiY29uZmlnLmgiCisj
aW5jbHVkZSAidHN0X2tjb25maWcuaCIKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorCisjaWZkZWYg
SEFWRV9TVFJVQ1RfQUNDVF9WMworI2luY2x1ZGUgPHN5cy9hY2N0Lmg+CisKKyNkZWZpbmUgQ09N
TUFORAkJImVjaG8iCisjZGVmaW5lIE9VVFBVVF9GSUxFCSJhY2N0X2ZpbGUiCisjZGVmaW5lIFNJ
WkUJCXNpemVvZihzdHJ1Y3QgYWNjdF92MykKKworc3RhdGljIGludCBmZDsKK3N0YXRpYyBpbnQg
djM7CitzdGF0aWMgdW5zaWduZWQgaW50IHJjOworc3RhdGljIHVuc2lnbmVkIGludCBzdGFydF90
aW1lOworCitzdGF0aWMgdW5pb24gYWNjdF91bmlvbiB7CisJc3RydWN0IGFjY3QJdjA7CisJc3Ry
dWN0IGFjY3RfdjMJdjM7Cit9IEFDQ1Q7CisKK3N0YXRpYyBpbnQgYWNjdF92ZXJzaW9uX2lzXzMo
dm9pZCkKK3sKKwljb25zdCBjaGFyICprY29uZmlnX2FjY3RfdjNbXSA9IHsKKwkJIkNPTkZJR19C
U0RfUFJPQ0VTU19BQ0NUX1YzIiwKKwkJTlVMTAorCX07CisKKwlzdHJ1Y3QgdHN0X2tjb25maWdf
cmVzIHJlc3VsdHNbMV07CisKKwl0c3Rfa2NvbmZpZ19yZWFkKGtjb25maWdfYWNjdF92MywgcmVz
dWx0cywgMSk7CisKKwlyZXR1cm4gcmVzdWx0c1swXS5tYXRjaCA9PSAneSc7Cit9CisKK3N0YXRp
YyB2b2lkIHJ1bl9jb21tYW5kKHZvaWQpCit7CisJY29uc3QgY2hhciAqY29uc3QgY21kW10gPSB7
Q09NTUFORCwgTlVMTH07CisKKwlyYyA9IHRzdF9ydW5fY21kKGNtZCwgTlVMTCwgTlVMTCwgMSk7
Cit9CisKK3N0YXRpYyBpbnQgdmVyaWZ5X2FjY3Qoc3RydWN0IGFjY3QgKmFjYykKK3sKKwlpZiAo
c3RyY21wKGFjYy0+YWNfY29tbSwgQ09NTUFORCkgfHwKKwkJYWNjLT5hY19idGltZSAtIHN0YXJ0
X3RpbWUgPiAxIHx8CisJCWFjYy0+YWNfdWlkICE9IGdldHVpZCgpIHx8CisJCWFjYy0+YWNfZ2lk
ICE9IGdldGdpZCgpIHx8CisJCWFjYy0+YWNfZXhpdGNvZGUgIT0gcmMpCisJCXJldHVybiAwOwor
CXJldHVybiAxOworfQorCitzdGF0aWMgaW50IHZlcmlmeV9hY2N0X3YzKHN0cnVjdCBhY2N0X3Yz
ICphY2MpCit7CisJaWYgKHN0cmNtcChhY2MtPmFjX2NvbW0sIENPTU1BTkQpIHx8CisJCWFjYy0+
YWNfYnRpbWUgLSBzdGFydF90aW1lID4gMSB8fAorCQlhY2MtPmFjX3VpZCAhPSBnZXR1aWQoKSB8
fAorCQlhY2MtPmFjX2dpZCAhPSBnZXRnaWQoKSB8fAorCQlhY2MtPmFjX2V4aXRjb2RlICE9IHJj
IHx8CisJCWFjYy0+YWNfdmVyc2lvbiAhPSAzIHx8CisJCWFjYy0+YWNfcGlkIDwgMSkKKwkJcmV0
dXJuIDA7CisJcmV0dXJuIDE7Cit9CisKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQoreworCWludCBy
ZWFkX2J5dGVzLCByZXQ7CisKKwlmZCA9IFNBRkVfT1BFTihPVVRQVVRfRklMRSwgT19SRFdSIHwg
T19DUkVBVCwgMDY0NCk7CisKKwlURVNUKGFjY3QoT1VUUFVUX0ZJTEUpKTsKKwlpZiAoVFNUX1JF
VCA9PSAtMSkKKwkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJDb3VsZCBub3Qgc2V0IGFjY3Qg
b3V0cHV0IGZpbGUiKTsKKworCXN0YXJ0X3RpbWUgPSB0aW1lKE5VTEwpOworCXJ1bl9jb21tYW5k
KCk7CisJYWNjdChOVUxMKTsKKworCWRvIHsKKwkJcmVhZF9ieXRlcyA9IFNBRkVfUkVBRCgwLCBm
ZCwgJkFDQ1QsIFNJWkUpOworCisJCWlmICh2MykKKwkJCXJldCA9IHZlcmlmeV9hY2N0X3YzKCZB
Q0NULnYzKTsKKwkJZWxzZQorCQkJcmV0ID0gdmVyaWZ5X2FjY3QoJkFDQ1QudjApOworCisJCWlm
ICghcmV0KQorCQkJdHN0X3JlcyhUSU5GTywgImFjY3QgZmlsZSBlbnRyeSBkaWQgbm90IG1hdGNo
OyAiCisJCQkJCSJ0cnlpbmcgdG8gY2hlY2sgbmV4dCBlbnRyeS4uLiIpOworCX0gd2hpbGUgKHJl
YWRfYnl0ZXMgPT0gU0laRSAmJiAhcmV0KTsKKworCWlmIChyZXQpCisJCXRzdF9yZXMoVFBBU1Ms
ICJhY2N0KCkgd3JvdGUgY29ycmVjdCBmaWxlIGNvbnRlbnRzISIpOworCWVsc2UKKwkJdHN0X3Jl
cyhURkFJTCwgImFjY3QoKSB3cm90ZSBpbmNvcnJlY3QgZmlsZSBjb250ZW50cyEiKTsKK30KKwor
c3RhdGljIHZvaWQgc2V0dXAodm9pZCkKK3sKKwlURVNUKGFjY3QoTlVMTCkpOworCWlmIChUU1Rf
UkVUID09IC0xKQorCQl0c3RfYnJrKFRCUk9LIHwgVFRFUlJOTywKKwkJCSJhY2N0KCkgc3lzdGVt
IGNhbGwgcmV0dXJuZWQgd2l0aCBlcnJvciIpOworCisJdjMgPSBhY2N0X3ZlcnNpb25faXNfMygp
OworCWlmICh2MykKKwkJdHN0X3JlcyhUSU5GTywgIlZlcmlmeWluZyB1c2luZyAnc3RydWN0IGFj
Y3RfdjMnIik7CisJZWxzZQorCQl0c3RfcmVzKFRJTkZPLCAiVmVyaWZ5aW5nIHVzaW5nICdzdHJ1
Y3QgYWNjdCciKTsKK30KKworc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQoreworCWlmIChmZCA+
IDApCisJCVNBRkVfQ0xPU0UoZmQpOworCWFjY3QoTlVMTCk7Cit9CisKK3N0YXRpYyBjb25zdCBj
aGFyICprY29uZmlnc1tdID0geworCSJDT05GSUdfQlNEX1BST0NFU1NfQUNDVCIsCisJTlVMTAor
fTsKKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS50ZXN0X2FsbCA9IHJ1biwK
KwkubmVlZHNfa2NvbmZpZ3MgPSBrY29uZmlncywKKwkuc2V0dXAgPSBzZXR1cCwKKwkuY2xlYW51
cCA9IGNsZWFudXAsCisJLm5lZWRzX3RtcGRpciA9IDEsCisJLm5lZWRzX3Jvb3QgPSAxLAorfTsK
KworI2Vsc2UKKwlUU1RfVEVTVF9UQ09ORigiVGhpcyBzeXN0ZW0gZG9lcyBub3Qgc3VwcG9ydCBh
Y2N0X3YzIHN0cnVjdHVyZSIpOworI2VuZGlmIC8qIEhBVkVfU1RSVUNUX0FDQ1RfVjMgKi8KKwot
LSAKMi4xNi40CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
