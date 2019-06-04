Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E0345D8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:47:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F29E03EAB68
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 13:47:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D6BF83EAB02
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:47:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 741FF1A00F9A
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 13:47:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DEFB8AFBE
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 11:47:11 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue,  4 Jun 2019 13:47:02 +0200
Message-Id: <20190604114702.28255-3-camann@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190604114702.28255-1-camann@suse.com>
References: <20190604114702.28255-1-camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] syscalls/pidfd_send_signal03
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

QWRkIHRlc3RjYXNlIHRvIGNoZWNrIGlmIHRoZSBzeXNjYWxsIHdpbGwgc2VuZCBhIHNpZ25hbAp0
byBhIHByb2Nlc3Mgd2l0aCB0aGUgc2FtZSBQSUQgYXMgdGhlIHRhcmdldGVkIHByb2Nlc3MuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KLS0tCiBydW50
ZXN0L3N5c2NhbGxzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAu
Li4va2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsLy5naXRpZ25vcmUgICB8ICAgMSAr
CiAuLi4vcGlkZmRfc2VuZF9zaWduYWwvcGlkZmRfc2VuZF9zaWduYWwwMy5jICAgICAgICB8IDE0
MiArKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3Nl
bmRfc2lnbmFsL3BpZGZkX3NlbmRfc2lnbmFsMDMuYwoKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lz
Y2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDkwYTFjZjhlNi4uNzI3NGM3NzQxIDEwMDY0
NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qvc3lzY2FsbHMKQEAgLTgzOCw2
ICs4MzgsNyBAQCBwZXJzb25hbGl0eTAyIHBlcnNvbmFsaXR5MDIKIAogcGlkZmRfc2VuZF9zaWdu
YWwwMSBwaWRmZF9zZW5kX3NpZ25hbDAxCiBwaWRmZF9zZW5kX3NpZ25hbDAyIHBpZGZkX3NlbmRf
c2lnbmFsMDIKK3BpZGZkX3NlbmRfc2lnbmFsMDMgcGlkZmRfc2VuZF9zaWduYWwwMwogCiBwaXBl
MDEgcGlwZTAxCiBwaXBlMDIgcGlwZTAyCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsLy5naXRpZ25vcmUgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsLy5naXRpZ25vcmUKaW5kZXggNmVhNjQwMWE4Li5jYmE3
ZDUwYTQgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9z
aWduYWwvLmdpdGlnbm9yZQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3Nl
bmRfc2lnbmFsLy5naXRpZ25vcmUKQEAgLTEsMiArMSwzIEBACiAvcGlkZmRfc2VuZF9zaWduYWww
MQogL3BpZGZkX3NlbmRfc2lnbmFsMDIKKy9waWRmZF9zZW5kX3NpZ25hbDAzCmRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX3NlbmRfc2lnbmFsL3BpZGZkX3NlbmRf
c2lnbmFsMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGlkZmRfc2VuZF9zaWduYWwv
cGlkZmRfc2VuZF9zaWduYWwwMy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MC4uYTA0ZDU5ZWYyCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9waWRmZF9zZW5kX3NpZ25hbC9waWRmZF9zZW5kX3NpZ25hbDAzLmMKQEAgLTAsMCArMSwxNDIg
QEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICog
Q29weXJpZ2h0IChjKSAyMDE5IFNVU0UgTExDCisgKiBBdXRob3I6IENocmlzdGlhbiBBbWFubiA8
Y2FtYW5uQHN1c2UuY29tPgorICovCisvKgorICogVGhpcyB0ZXN0IGNoZWNrcyBpZiB0aGUgcGlk
ZmRfc2VuZF9zaWduYWwgc3lzY2FsbCB3cm9uZ2Z1bGx5IHNlbmRzCisgKiBhIHNpZ25hbCB0byBh
IG5ldyBwcm9jZXNzIHdoaWNoIGluaGVyaXRlZCB0aGUgUElEIG9mIHRoZSBhY3R1YWwKKyAqIHRh
cmdldCBwcm9jZXNzLgorICogSW4gb3JkZXIgdG8gZG8gc28gaXQgaXMgbmVjZXNzYXJ5IHRvIHN0
YXJ0IGEgcHJvY2VzcyB3aXRoIGEgcHJlLQorICogZGV0ZXJtaW5lZCBQSUQuIFRoaXMgaXMgYWNj
b21wbGlzaGVkIGJ5IHdyaXRpbmcgdG8gdGhlCisgKiAvcHJvYy9zeXMva2VybmVsL25zX2xhc3Rf
cGlkIGZpbGUuCisgKiBCeSB1dGlsaXppbmcgdGhpcywgdGhpcyB0ZXN0IGZvcmtzIHR3byBjaGls
ZHJlbiB3aXRoIHRoZSBzYW1lIFBJRC4KKyAqIEl0IGlzIHRoZW4gY2hlY2tlZCwgaWYgdGhlIHN5
c2NhbGwgd2lsbCBzZW5kIGEgc2lnbmFsIHRvIHRoZSBzZWNvbmQKKyAqIGNoaWxkIHVzaW5nIHRo
ZSBwaWRmZCBvZiB0aGUgZmlyc3Qgb25lLgorICovCisKKyNkZWZpbmUgX0dOVV9TT1VSQ0UKKwor
I2luY2x1ZGUgPHNpZ25hbC5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSA8dW5pc3Rk
Lmg+CisjaW5jbHVkZSAicGlkZmRfc2VuZF9zaWduYWwuaCIKKyNpbmNsdWRlICJ0c3Rfc2FmZV9w
dGhyZWFkLmgiCisvLyNpbmNsdWRlICJ0c3Rfc2FmZV9maWxlX29wcy5oIgorCisjZGVmaW5lIFBJ
RFRSSUVTCTMKKworc3RhdGljIGNoYXIgKmxhc3RfcGlkX2ZpbGU7CitzdGF0aWMgaW50IHBpZGZk
LCBuZXdfcGlkZmQ7CitzdGF0aWMgaW50IG9sZF9pbm9kZSwgbmV3X2lub2RlOworCitzdGF0aWMg
aW50IGdldF9pbm9kZV9udW1iZXIoaW50IGZkKQoreworCXN0cnVjdCBzdGF0IGZpbGVfc3RhdDsK
KworCVNBRkVfRlNUQVQoZmQsICZmaWxlX3N0YXQpOworCXJldHVybiBmaWxlX3N0YXQuc3RfaW5v
OworfQorCitzdGF0aWMgdm9pZCB2ZXJpZnlfcGlkZmRfc2VuZF9zaWduYWwodm9pZCkKK3sKKwlw
aWRfdCBwaWQsIG5ld19waWQ7CisJY2hhciBwaWRfZmlsZW5hbWVbMzJdOworCWNoYXIgcGlkX3N0
clsxNl07CisJaW50IGksIGZhaWw7CisKKwlmYWlsID0gMTsKKwlmb3IgKGkgPSAwOyBpIDwgUElE
VFJJRVM7IGkrKykgeworCQlwaWQgPSBTQUZFX0ZPUksoKTsKKwkJaWYgKHBpZCA9PSAwKSB7CisJ
CQlUU1RfQ0hFQ0tQT0lOVF9XQUlUKDApOworCQkJcmV0dXJuOworCQl9CisKKwkJc3ByaW50Zihw
aWRfZmlsZW5hbWUsICIvcHJvYy8lZCIsIHBpZCk7CisJCXBpZGZkID0gU0FGRV9PUEVOKHBpZF9m
aWxlbmFtZSwgT19ESVJFQ1RPUlkgfCBPX0NMT0VYRUMpOworCQlvbGRfaW5vZGUgPSBnZXRfaW5v
ZGVfbnVtYmVyKHBpZGZkKTsKKworCQlUU1RfQ0hFQ0tQT0lOVF9XQUtFKDApOworCQl0c3RfcmVh
cF9jaGlsZHJlbigpOworCisJCS8qIE1hbmlwdWxhdGUgUElEIGZvciBuZXh0IHByb2Nlc3MgKi8K
KwkJc3ByaW50ZihwaWRfc3RyLCAiJWQiLCBwaWQgLSAxKTsKKwkJU0FGRV9GSUxFX1BSSU5URihs
YXN0X3BpZF9maWxlLCBwaWRfc3RyKTsKKworCQluZXdfcGlkID0gU0FGRV9GT1JLKCk7CisJCWlm
IChuZXdfcGlkID09IDApIHsKKwkJCVRTVF9DSEVDS1BPSU5UX1dBSVQoMCk7CisJCQlyZXR1cm47
CisJCX0KKworCQlpZiAobmV3X3BpZCA9PSBwaWQpIHsKKwkJCW5ld19waWRmZCA9IFNBRkVfT1BF
TihwaWRfZmlsZW5hbWUsCisJCQkJCU9fRElSRUNUT1JZIHwgT19DTE9FWEVDKTsKKwkJCW5ld19p
bm9kZSA9IGdldF9pbm9kZV9udW1iZXIobmV3X3BpZGZkKTsKKwkJCVNBRkVfQ0xPU0UobmV3X3Bp
ZGZkKTsKKwkJCWZhaWwgPSAwOworCQkJYnJlYWs7CisJCX0KKworCQlpZiAoaSA8IFBJRFRSSUVT
KSB7CisJCQl0c3RfcmVzKFRJTkZPLAorCQkJCSJGYWlsZWQgdG8gc2V0IGNvcnJlY3QgUElELCB0
cnlpbmcgYWdhaW4uLi4iKTsKKwkJfQorCQlTQUZFX0NMT1NFKHBpZGZkKTsKKwkJVFNUX0NIRUNL
UE9JTlRfV0FLRSgwKTsKKwkJdHN0X3JlYXBfY2hpbGRyZW4oKTsKKwl9CisJaWYgKGZhaWwpIHsK
KwkJdHN0X2JyayhUQlJPSywKKwkJCSJDb3VsZCBub3Qgc2V0IG5ldyBjaGlsZCB0byBzYW1lIFBJ
RCBhcyB0aGUgb2xkIG9uZSEiKTsKKwl9CisJaWYgKG9sZF9pbm9kZSA9PSBuZXdfaW5vZGUpIHsK
KwkJdHN0X3JlcyhUV0FSTiwKKwkJCSJGaWxlIGRlc2NyaXB0b3Igb2YgbmV3IHByb2Nlc3MgcG9p
bnRzIHRvIHRoZSBpbm9kZSAiCisJCQkib2YgdGhlIG9sZCBwcm9jZXNzISIpOworCX0KKworCVRF
U1QocGlkZmRfc2VuZF9zaWduYWwocGlkZmQsIFNJR1VTUjEsIE5VTEwsIDApKTsKKwlpZiAoVFNU
X1JFVCA9PSAtMSAmJiBUU1RfRVJSID09IEVTUkNIKSB7CisJCXRzdF9yZXMoVFBBU1MsCisJCQki
RGlkIG5vdCBzZW5kIHNpZ25hbCB0byB3cm9uZyBwcm9jZXNzIHdpdGggc2FtZSBQSUQhIik7CisJ
fSBlbHNlIHsKKwkJdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sCisJCQkicGlkZl9zZW5kX3NpZ25h
bCgpIGVuZGVkIHVuZXhwZWN0ZWRseSAtIHJldHVybiB2YWx1ZTogJWxkLCBlcnJvciIsCisJCQlU
U1RfUkVUKTsKKwl9CisJVFNUX0NIRUNLUE9JTlRfV0FLRSgwKTsKKwl0c3RfcmVhcF9jaGlsZHJl
bigpOworCisJU0FGRV9DTE9TRShwaWRmZCk7Cit9CisKK3N0YXRpYyB2b2lkIHNldHVwKHZvaWQp
Cit7CisJY2hlY2tfc3lzY2FsbF9zdXBwb3J0KCk7CisKKwlsYXN0X3BpZF9maWxlID0gIi9wcm9j
L3N5cy9rZXJuZWwvbnNfbGFzdF9waWQiOworCWlmIChhY2Nlc3MobGFzdF9waWRfZmlsZSwgRl9P
SykgPT0gLTEpIHsKKwkJdHN0X2JyayhUQ09ORiwgIiVzIGRvZXMgbm90IGV4aXN0LCBjYW5ub3Qg
c2V0IFBJRHMiLAorCQkJbGFzdF9waWRfZmlsZSk7CisJfQorfQorCitzdGF0aWMgdm9pZCBjbGVh
bnVwKHZvaWQpCit7CisJdHN0X3JlYXBfY2hpbGRyZW4oKTsKKwlpZiAobmV3X3BpZGZkID4gMCkK
KwkJU0FGRV9DTE9TRShuZXdfcGlkZmQpOworCWlmIChwaWRmZCA+IDApCisJCVNBRkVfQ0xPU0Uo
cGlkZmQpOworfQorCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3RfYWxs
ID0gdmVyaWZ5X3BpZGZkX3NlbmRfc2lnbmFsLAorCS5zZXR1cCA9IHNldHVwLAorCS5jbGVhbnVw
ID0gY2xlYW51cCwKKwkubmVlZHNfcm9vdCA9IDEsCisJLm5lZWRzX2NoZWNrcG9pbnRzID0gMSwK
KwkuZm9ya3NfY2hpbGQgPSAxLAorfTsKLS0gCjIuMTYuNAoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
