Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05936F49
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 11:00:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFFBC39031A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 11:00:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D0E9729879C
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:00:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 385A06019A2
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 11:00:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D09E5AF90
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 09:00:13 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Thu,  6 Jun 2019 11:00:09 +0200
Message-Id: <20190606090009.31124-2-camann@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190606090009.31124-1-camann@suse.com>
References: <20190606090009.31124-1-camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/fstat{03,05}: rewrote testcases
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

TWVyZ2VkIGZzdGF0MDMgYW5kIGZzdGF0MDU6CglCb3RoIHRlc3RjYXNlcyBoYWQgbG90cyBvZiBk
dXBsaWNhdGVkIGNvZGUgd2hpY2gKCWNvdWxkIGJlIHJlbW92ZWQgYnkgY3JlYXRpbmcgYSBzaW5n
bGUgdGVzdGNhc2UKCWZvciBib3RoIHNjZW5hcmlvcy4KUmV3cm90ZSB0ZXN0Y2FzZToKCUNsZWFu
ZWQgdXAgYW5kIHBvcnRlZCB0byBuZXcgbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBBbWFubiA8Y2FtYW5uQHN1c2UuY29tPgotLS0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiAtCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0
Ly5naXRpZ25vcmUgfCAgIDIgLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3RhdC9mc3Rh
dDAzLmMgIHwgMjA3ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mc3RhdC9mc3RhdDA1LmMgIHwgMjQ0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiA0IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDM4MCBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0L2ZzdGF0
MDUuYwoKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmlu
ZGV4IDZkODVmOWJiNy4uMDU2MDBmOWRjIDEwMDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisr
KyBiL3J1bnRlc3Qvc3lzY2FsbHMKQEAgLTMzNiw4ICszMzYsNiBAQCBmc3RhdDAyIGZzdGF0MDIK
IGZzdGF0MDJfNjQgZnN0YXQwMl82NAogZnN0YXQwMyBmc3RhdDAzCiBmc3RhdDAzXzY0IGZzdGF0
MDNfNjQKLWZzdGF0MDUgZnN0YXQwNQotZnN0YXQwNV82NCBmc3RhdDA1XzY0CiAKICNmc3RhdGF0
NjQvbmV3ZnN0YXRhdCB0ZXN0IGNhc2VzCiBmc3RhdGF0MDEgZnN0YXRhdDAxCmRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0Ly5naXRpZ25vcmUgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2ZzdGF0Ly5naXRpZ25vcmUKaW5kZXggMWM2NmJkZjEwLi45YjEwODk0
MzggMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvLmdpdGlnbm9y
ZQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0Ly5naXRpZ25vcmUKQEAgLTIs
NSArMiwzIEBACiAvZnN0YXQwMl82NAogL2ZzdGF0MDMKIC9mc3RhdDAzXzY0Ci0vZnN0YXQwNQot
L2ZzdGF0MDVfNjQKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQv
ZnN0YXQwMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3RhdC9mc3RhdDAzLmMKaW5k
ZXggMGZhNjJiODQ3Li41Njc2NjMyYWIgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZnN0YXQvZnN0YXQwMy5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0
YXQvZnN0YXQwMy5jCkBAIC0xLDE2MCArMSwxMDMgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAvKgotICogVGVzdCBOYW1lOiBmc3RhdDAzCi0gKgotICog
VGVzdCBEZXNjcmlwdGlvbjoKLSAqICAgVmVyaWZ5IHRoYXQsIGZzdGF0KDIpIHJldHVybnMgLTEg
YW5kIHNldHMgZXJybm8gdG8gRUJBREYgaWYgdGhlIGZpbGUKLSAqICAgcG9pbnRlZCB0byBieSBm
aWxlIGRlc2NyaXB0b3IgaXMgbm90IHZhbGlkLgotICoKLSAqIEV4cGVjdGVkIFJlc3VsdDoKLSAq
ICBmc3RhdCgpIHNob3VsZCBmYWlsIHdpdGggcmV0dXJuIHZhbHVlIC0xIGFuZCBzZXQgZXhwZWN0
ZWQgZXJybm8uCi0gKgotICogQWxnb3JpdGhtOgotICogIFNldHVwOgotICogICBTZXR1cCBzaWdu
YWwgaGFuZGxpbmcuCi0gKiAgIENyZWF0ZSB0ZW1wb3JhcnkgZGlyZWN0b3J5LgotICogICBQYXVz
ZSBmb3IgU0lHVVNSMSBpZiBvcHRpb24gc3BlY2lmaWVkLgotICoKLSAqICBUZXN0OgotICogICBM
b29wIGlmIHRoZSBwcm9wZXIgb3B0aW9ucyBhcmUgZ2l2ZW4uCi0gKiAgIEV4ZWN1dGUgc3lzdGVt
IGNhbGwKLSAqICAgQ2hlY2sgcmV0dXJuIGNvZGUsIGlmIHN5c3RlbSBjYWxsIGZhaWxlZCAocmV0
dXJuPS0xKQotICoJaWYgZXJybm8gc2V0ID09IGV4cGVjdGVkIGVycm5vCi0gKgkJSXNzdWUgc3lz
IGNhbGwgZmFpbHMgd2l0aCBleHBlY3RlZCByZXR1cm4gdmFsdWUgYW5kIGVycm5vLgotICoJT3Ro
ZXJ3aXNlLAotICoJCUlzc3VlIHN5cyBjYWxsIGZhaWxzIHdpdGggdW5leHBlY3RlZCBlcnJuby4K
LSAqICAgT3RoZXJ3aXNlLAotICoJSXNzdWUgc3lzIGNhbGwgcmV0dXJucyB1bmV4cGVjdGVkIHZh
bHVlLgotICoKLSAqICBDbGVhbnVwOgotICogICBQcmludCBlcnJubyBsb2cgYW5kL29yIHRpbWlu
ZyBzdGF0cyBpZiBvcHRpb25zIGdpdmVuCi0gKiAgIERlbGV0ZSB0aGUgdGVtcG9yYXJ5IGRpcmVj
dG9yeShzKS9maWxlKHMpIGNyZWF0ZWQuCi0gKgotICogVXNhZ2U6ICA8Zm9yIGNvbW1hbmQtbGlu
ZT4KLSAqICBmc3RhdDAzIFstYyBuXSBbLWVdIFstaSBuXSBbLUkgeF0gWy1QIHhdIFstdF0KLSAq
ICAgICB3aGVyZSwgIC1jIG4gOiBSdW4gbiBjb3BpZXMgY29uY3VycmVudGx5LgotICogICAgICAg
ICAgICAgLWUgICA6IFR1cm4gb24gZXJybm8gbG9nZ2luZy4KLSAqCSAgICAgICAtaSBuIDogRXhl
Y3V0ZSB0ZXN0IG4gdGltZXMuCi0gKgkgICAgICAgLUkgeCA6IEV4ZWN1dGUgdGVzdCBmb3IgeCBz
ZWNvbmRzLgotICoJICAgICAgIC1QIHggOiBQYXVzZSBmb3IgeCBzZWNvbmRzIGJldHdlZW4gaXRl
cmF0aW9ucy4KLSAqCSAgICAgICAtdCAgIDogVHVybiBvbiBzeXNjYWxsIHRpbWluZy4KLSAqCi0g
KiBISVNUT1JZCi0gKgkwNy8yMDAxIFBvcnRlZCBieSBXYXluZSBCb3llcgotICoKLSAqIFJFU1RS
SUNUSU9OUzoKLSAqICBUaGlzIHRlc3Qgc2hvdWxkIGJlIGV4ZWN1dGVkIGJ5ICdub24tc3VwZXIt
dXNlcicgb25seS4KKyAqIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNo
aW5lcyAgQ29ycC4sIDIwMDEKKyAqICAwNy8yMDAxIFBvcnRlZCBieSBXYXluZSBCb3llcgorICog
IDA1LzIwMTkgUG9ydGVkIHRvIG5ldyBsaWJyYXJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFubkBz
dXNlLmNvbT4KKyAqLworLyoKKyAqIFRlc3RzIGRpZmZlcmVudCBlcnJvciBzY2VuYXJpb3M6CiAg
KgorICogMSkgQ2FsbHMgZnN0YXQoKSB3aXRoIGNsb3NlZCBmaWxlIGRlc2NyaXB0b3IKKyAqICAg
IC0+IEVCQURGCisgKiAyKSBDYWxscyBmc3RhdCgpIHdpdGggYW4gaW52YWxpZCBhZGRyZXNzIGZv
ciBzdGF0IHN0cnVjdHVyZQorICogICAgLT4gRUZBVUxUIChvciByZWNlaXZlIHNpZ25hbCBTSUdT
RUdWKQogICovCiAKLSNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPGVycm5vLmg+CiAjaW5j
bHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0jaW5jbHVkZSA8ZmNudGwuaD4K
LSNpbmNsdWRlIDxlcnJuby5oPgotI2luY2x1ZGUgPHN0cmluZy5oPgotI2luY2x1ZGUgPHNpZ25h
bC5oPgogI2luY2x1ZGUgPHN5cy90eXBlcy5oPgogI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CisjaW5j
bHVkZSAidHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJ0c3Rfc2FmZV9tYWNyb3MuaCIKIAotI2luY2x1
ZGUgInRlc3QuaCIKLSNpbmNsdWRlICJzYWZlX21hY3Jvcy5oIgorI2RlZmluZSBURVNURklMRQki
dGVzdF9maWxlIgogCi0jZGVmaW5lIEZJTEVfTU9ERQlTX0lSVVNSIHwgU19JV1VTUiB8IFNfSVJH
UlAgfCBTX0lST1RICi0jZGVmaW5lIFRFU1RfRklMRQkidGVzdGZpbGUiCitzdGF0aWMgaW50IGZk
X29rOworc3RhdGljIGludCBmZF9lYmFkZjsKK3N0YXRpYyBzdHJ1Y3Qgc3RhdCBzdGF0X2J1ZjsK
IAotY2hhciAqVENJRCA9ICJmc3RhdDAzIjsKLWludCBUU1RfVE9UQUwgPSAxOworc3RhdGljIHN0
cnVjdCB0Y2FzZXsKKwlpbnQgKmZkOworCXN0cnVjdCBzdGF0ICpzdGF0X2J1ZjsKKwlpbnQgZXhw
X2VycjsKK30gdGNhc2VzW10gPSB7CisJeyZmZF9lYmFkZiwgJnN0YXRfYnVmLCBFQkFERn0sCisJ
eyZmZF9vaywgTlVMTCwgRUZBVUxUfSwKK307CiAKLWludCBmaWxkZXM7CQkJLyogdGVzdGZpbGUg
ZGVzY3JpcHRvciAqLwotCi12b2lkIHNldHVwKCk7CQkJLyogTWFpbiBzZXR1cCBmdW5jdGlvbiBm
b3IgdGhlIHRlc3RzICovCi12b2lkIGNsZWFudXAoKTsJCQkvKiBjbGVhbnVwIGZ1bmN0aW9uIGZv
ciB0aGUgdGVzdCAqLwotCi1pbnQgbWFpbihpbnQgYWMsIGNoYXIgKiphdikKK3N0YXRpYyB2b2lk
IHNpZ2hhbmRsZXIoaW50IHNpZyBMVFBfQVRUUklCVVRFX1VOVVNFRCkKIHsKLQlzdHJ1Y3Qgc3Rh
dCBzdGF0X2J1ZjsJLyogc3RhdCBzdHJ1Y3R1cmUgYnVmZmVyICovCi0JaW50IGxjOwotCi0JdHN0
X3BhcnNlX29wdHMoYWMsIGF2LCBOVUxMLCBOVUxMKTsKLQotCS8qCi0JICogSW52b2tlIHNldHVw
IGZ1bmN0aW9uIHRvIGNyZWF0ZSBhIHRlc3RmaWxlIHVuZGVyIHRlbXBvcmFyeQotCSAqIGRpcmVj
dG9yeS4KLQkgKi8KLQlzZXR1cCgpOworCXRzdF9yZXMoVFBBU1MsICJmc3RhdCgpIGZhaWxlZCBh
cyBleHBlY3RlZCB3aXRoIFNJR1NFR1YiKTsKKwlleGl0KDApOworfQogCi0JZm9yIChsYyA9IDA7
IFRFU1RfTE9PUElORyhsYyk7IGxjKyspIHsKK3N0YXRpYyB2b2lkIGNoZWNrX2ZzdGF0KHVuc2ln
bmVkIGludCB0Y19udW0pCit7CisJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbdGNfbnVtXTsK
IAotCQl0c3RfY291bnQgPSAwOwotCQkvKgotCQkgKiBDYWxsIGZzdGF0KDIpIHRvIGdldCB0aGUg
c3RhdHVzIGluZm9ybWF0aW9uCi0JCSAqIG9mIGEgY2xvc2VkIHRlc3RmaWxlIHBvaW50ZWQgdG8g
YnkgJ2ZkJy4KLQkJICogdmVyaWZ5IHRoYXQgZnN0YXQgZmFpbHMgd2l0aCAtMSByZXR1cm4gdmFs
dWUgYW5kCi0JCSAqIHNldHMgYXBwcm9wcmlhdGUgZXJybm8uCi0JCSAqLwotCQlURVNUKGZzdGF0
KGZpbGRlcywgJnN0YXRfYnVmKSk7CisJaWYgKHRjX251bSA9PSAxKQorCQlzaWduYWwoU0lHU0VH
ViwgJnNpZ2hhbmRsZXIpOwogCi0JCS8qIENoZWNrIHJldHVybiBjb2RlIGZyb20gZnN0YXQoMikg
Ki8KLQkJaWYgKFRFU1RfUkVUVVJOID09IC0xKSB7Ci0JCQlpZiAoVEVTVF9FUlJOTyA9PSBFQkFE
RikgewotCQkJCXRzdF9yZXNtKFRQQVNTLAotCQkJCQkgImZzdGF0KCkgZmFpbHMgd2l0aCBleHBl
Y3RlZCBlcnJvciBFQkFERiIpOwotCQkJfSBlbHNlIHsKLQkJCQl0c3RfcmVzbShURkFJTCB8IFRU
RVJSTk8sCi0JCQkJCSAiZnN0YXQoKSBkaWQgbm90IGZhaWwgd2l0aCBFQkFERiIpOwotCQkJfQor
CVRFU1QoZnN0YXQoKnRjLT5mZCwgdGMtPnN0YXRfYnVmKSk7CisJaWYgKFRTVF9SRVQgPT0gLTEp
IHsKKwkJaWYgKHRjLT5leHBfZXJyID09IFRTVF9FUlIpIHsKKwkJCXRzdF9yZXMoVFBBU1MsCisJ
CQkJICJmc3RhdCgpIGZhaWxzIHdpdGggZXhwZWN0ZWQgZXJyb3IgJXMiLAorCQkJCSB0c3Rfc3Ry
ZXJybm8odGMtPmV4cF9lcnIpKTsKIAkJfSBlbHNlIHsKLQkJCXRzdF9yZXNtKFRGQUlMLCAiZnN0
YXQoKSByZXR1cm5lZCAlbGQsIGV4cGVjdGVkIC0xIiwKLQkJCQkgVEVTVF9SRVRVUk4pOworCQkJ
dHN0X3JlcyhURkFJTCB8IFRURVJSTk8sCisJCQkJICJmc3RhdCgpIGRpZCBub3QgZmFpbCB3aXRo
ICVzLCBidXQgd2l0aCIsCisJCQkJIHRzdF9zdHJlcnJubyh0Yy0+ZXhwX2VycikpOwogCQl9CisJ
fSBlbHNlIHsKKwkJdHN0X3JlcyhURkFJTCwgImZzdGF0KCkgcmV0dXJuZWQgJWxkLCBleHBlY3Rl
ZCAtMSIsCisJCQkgVFNUX1JFVCk7CiAJfQotCi0JLyoKLQkgKiBJbnZva2UgY2xlYW51cCgpIHRv
IGRlbGV0ZSB0aGUgdGVzdCBkaXJlY3RvcnkvZmlsZShzKSBjcmVhdGVkCi0JICogaW4gdGhlIHNl
dHVwKCkuCi0JICovCi0JY2xlYW51cCgpOwotCi0JdHN0X2V4aXQoKTsKIH0KIAotLyoKLSAqIHZv
aWQKLSAqIHNldHVwKHZvaWQpIC0gcGVyZm9ybXMgYWxsIE9ORSBUSU1FIHNldHVwIGZvciB0aGlz
IHRlc3QuCi0gKglFeGl0IHRoZSB0ZXN0IHByb2dyYW0gb24gcmVjZWlwdCBvZiB1bmV4cGVjdGVk
IHNpZ25hbHMuCi0gKglDcmVhdGUgYSB0ZW1wb3JhcnkgZGlyZWN0b3J5IGFuZCBjaGFuZ2UgZGly
ZWN0b3J5IHRvIGl0LgotICogICAgICBDcmVhdGUgYSB0ZXN0ZmlsZSB1bmRlciB0ZW1wb3Jhcnkg
ZGlyZWN0b3J5LgotICogICAgICBDbG9zZSB0aGUgdGVzdGZpbGUuCi0gKi8KLXZvaWQgc2V0dXAo
dm9pZCkKK3N0YXRpYyB2b2lkIHJ1bih1bnNpZ25lZCBpbnQgdGNfbnVtKQogewotCS8qIENhcHR1
cmUgdW5leHBlY3RlZCBzaWduYWxzICovCi0JdHN0X3NpZyhOT0ZPUkssIERFRl9IQU5ETEVSLCBj
bGVhbnVwKTsKLQotCVRFU1RfUEFVU0U7Ci0KLQkvKiBNYWtlIGEgdGVtcCBkaXIgYW5kIGNkIHRv
IGl0ICovCi0JdHN0X3RtcGRpcigpOworCXBpZF90IHBpZDsKIAotCS8qIENyZWF0ZSBhIHRlc3Rm
aWxlIHVuZGVyIHRlbXBvcmFyeSBkaXJlY3RvcnkgKi8KLQlmaWxkZXMgPSBTQUZFX09QRU4oY2xl
YW51cCwgVEVTVF9GSUxFLCBPX1JEV1IgfCBPX0NSRUFULCAwNjY2KTsKLQotCVNBRkVfQ0xPU0Uo
Y2xlYW51cCwgZmlsZGVzKTsKKwlwaWQgPSBTQUZFX0ZPUksoKTsKKwlpZiAocGlkID09IDApIHsK
KwkJY2hlY2tfZnN0YXQodGNfbnVtKTsKKwkJcmV0dXJuOworCX0KKwl0c3RfcmVhcF9jaGlsZHJl
bigpOwogfQogCi0vKgotICogdm9pZAotICogY2xlYW51cCgpIC0gUGVyZm9ybXMgYWxsIE9ORSBU
SU1FIGNsZWFudXAgZm9yIHRoaXMgdGVzdCBhdAotICogICAgICAgICAgICAgY29tcGxldGlvbiBv
ciBwcmVtYXR1cmUgZXhpdC4KLSAqCVByaW50IHRlc3QgdGltaW5nIHN0YXRzIGFuZCBlcnJubyBs
b2cgaWYgdGVzdCBleGVjdXRlZCB3aXRoIG9wdGlvbnMuCi0gKglDbG9zZSB0aGUgdGVzdGZpbGUg
aWYgc3RpbGwgb3BlbmVkLgotICoJUmVtb3ZlIHRlbXBvcmFyeSBkaXJlY3RvcnkgYW5kIHN1Yi1k
aXJlY3Rvcmllcy9maWxlcyB1bmRlciBpdAotICoJY3JlYXRlZCBkdXJpbmcgc2V0dXAoKS4KLSAq
CUV4aXQgdGhlIHRlc3QgcHJvZ3JhbSB3aXRoIG5vcm1hbCBleGl0IGNvZGUuCi0gKi8KLXZvaWQg
Y2xlYW51cCh2b2lkKQorc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKKwlmZF9lYmFkZiA9IFNB
RkVfT1BFTihURVNURklMRSwgT19SRFdSIHwgT19DUkVBVCwgMDY0NCk7CisJU0FGRV9DTE9TRShm
ZF9lYmFkZik7CisJZmRfb2sgPSBTQUZFX09QRU4oVEVTVEZJTEUsIE9fUkRXUiB8IE9fQ1JFQVQs
IDA2NDQpOworfQogCi0JdHN0X3JtZGlyKCk7Ci0KK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkK
K3sKKwlpZiAoZmRfb2sgPiAwKQorCQlTQUZFX0NMT1NFKGZkX29rKTsKKwlpZiAoZmRfZWJhZGYg
PiAwKQorCQlTQUZFX0NMT1NFKGZkX2ViYWRmKTsKIH0KKworc3RhdGljIHN0cnVjdCB0c3RfdGVz
dCB0ZXN0ID0geworCS50ZXN0ID0gcnVuLAorCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAor
CS5zZXR1cCA9IHNldHVwLAorCS5jbGVhbnVwID0gY2xlYW51cCwKKwkubmVlZHNfdG1wZGlyID0g
MSwKKwkuZm9ya3NfY2hpbGQgPSAxLAorfTsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZnN0YXQvZnN0YXQwNS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mc3Rh
dC9mc3RhdDA1LmMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDIwMGRlNDEzMC4uMDAw
MDAwMDAwCi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvZnN0YXQwNS5jCisr
KyAvZGV2L251bGwKQEAgLTEsMjQ0ICswLDAgQEAKLS8qCi0gKgotICogICBDb3B5cmlnaHQgKEMp
IEJ1bGwgUy5BLiAyMDAxCi0gKiAgIENvcHlyaWdodCAoYykgSW50ZXJuYXRpb25hbCBCdXNpbmVz
cyBNYWNoaW5lcyAgQ29ycC4sIDIwMDEKLSAqCi0gKiAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyAgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogICBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxp
c2hlZCBieQotICogICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyIG9mIHRoZSBMaWNlbnNlLCBvcgotICogICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgotICoKLSAqICAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0gKiAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsg
IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogICBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUKLSAqICAgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCi0gKgotICogICBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZQotICogICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgIGlmIG5vdCwgd3JpdGUgdG8gdGhl
IEZyZWUgU29mdHdhcmUKLSAqICAgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0
LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQotICovCi0KLS8qCi0gKiBU
ZXN0IE5hbWU6IGZzdGF0MDUKLSAqCi0gKiBUZXN0IERlc2NyaXB0aW9uOgotICogICBWZXJpZnkg
dGhhdCwKLSAqICAgaWYgYnVmZmVyIHBvaW50cyBvdXRzaWRlIHVzZXIncyBhY2Nlc3NpYmxlIGFk
ZHJlc3Mgc3BhY2UgZnN0YXQoMikKLSAqCWVpdGhlciByZXR1cm5zIC0xIGFuZCBzZXRzIGVycm5v
IHRvIEVGQVVMVAotICoJb3IgU0lHU0VHViBpcyByZXR1cm5lZCBpbnN0ZWFkIG9mIEVGQVVMVAot
ICoKLSAqIEV4cGVjdGVkIFJlc3VsdDoKLSAqICAgZnN0YXQoKSBzaG91bGQgZmFpbCB3aXRoIHJl
dHVybiB2YWx1ZSAtMSBhbmQgc2V0IGV4cGVjdGVkIGVycm5vLgotICogICAgb3IKLSAqICAgZnN0
YXQoKSBzaG91bGQgZmFpbCB3aXRoIFNJR1NFR1YgcmV0dXJuZWQuCi0gKiAgIEJvdGggcmVzdWx0
cyBhcmUgY29uc2lkZXJlZCBhcyBhY2NlcHRhYmxlLgotICoKLSAqIEFsZ29yaXRobToKLSAqICBT
ZXR1cDoKLSAqICAgU2V0dXAgc2lnbmFsIGhhbmRsaW5nIFNJR1NFR1YgaW5jbHVkZWQuCi0gKiAg
IFN3aXRjaCB0byBub2JvZHkgdXNlci4KLSAqICAgUGF1c2UgZm9yIFNJR1VTUjEgaWYgb3B0aW9u
IHNwZWNpZmllZC4KLSAqICAgQ3JlYXRlIHRlbXBvcmFyeSBkaXJlY3RvcnkuCi0gKiAgIENyZWF0
ZSBhIHRlc3RmaWxlIHVuZGVyIHRlbXBvcmFyeSBkaXJlY3RvcnkuCi0gKgotICogIFRlc3Q6Ci0g
KiAgIEJ1ZmZlciBwb2ludHMgb3V0c2lkZSB1c2VyJ3MgYWNjZXNzaWJsZSBhZGRyZXNzIHNwYWNl
LgotICogICBMb29wIGlmIHRoZSBwcm9wZXIgb3B0aW9ucyBhcmUgZ2l2ZW4uCi0gKiAgIEV4ZWN1
dGUgc3lzdGVtIGNhbGwKLSAqICAgQ2hlY2sgcmV0dXJuIGNvZGUsIGlmIHN5c3RlbSBjYWxsIGZh
aWxlZCAocmV0dXJuPS0xKQotICoJaWYgZXJybm8gc2V0ID09IGV4cGVjdGVkIGVycm5vCi0gKgkJ
SXNzdWUgc3lzIGNhbGwgZmFpbHMgd2l0aCBleHBlY3RlZCByZXR1cm4gdmFsdWUgYW5kIGVycm5v
LgotICoJT3RoZXJ3aXNlLAotICoJCUlzc3VlIHN5cyBjYWxsIGZhaWxzIHdpdGggdW5leHBlY3Rl
ZCBlcnJuby4KLSAqICAgT3RoZXJ3aXNlLAotICoJSXNzdWUgc3lzIGNhbGwgcmV0dXJucyB1bmV4
cGVjdGVkIHZhbHVlLgotICoKLSAqICBTaWdoYW5kbGVyOgotICoJaWYgc2lnbmFsID09IFNJR1NF
R1YKLSAqCQlJc3N1ZSBzeXMgY2FsbCBmYWlscyB3aXRoIGV4cGVjdGVkIHNpZ25hbAotICogICAg
ICBPdGhlcndpc2UsCi0gKiAgICAgICAgICAgICAgSXNzdWUgc3lzIGNhbGwgZmFpbHMgd2l0aCB1
bmV4cGVjdGVkIHNpZ25hbC4KLSAqCi0gKiAgQ2xlYW51cDoKLSAqICAgUHJpbnQgZXJybm8gbG9n
IGFuZC9vciB0aW1pbmcgc3RhdHMgaWYgb3B0aW9ucyBnaXZlbgotICogICBDbG9zZSB0aGUgdGVz
dCBmaWxlCi0gKiAgIERlbGV0ZSB0aGUgdGVtcG9yYXJ5IGRpcmVjdG9yeShzKS9maWxlKHMpIGNy
ZWF0ZWQuCi0gKgotICogVXNhZ2U6ICA8Zm9yIGNvbW1hbmQtbGluZT4KLSAqICBmc3RhdDA1IFst
YyBuXSBbLWVdIFstaSBuXSBbLUkgeF0gWy1wIHhdIFstdF0KLSAqCXdoZXJlLCAgLWMgbiA6IFJ1
biBuIGNvcGllcyBjb25jdXJyZW50bHkuCi0gKgkJLWUgICA6IFR1cm4gb24gZXJybm8gbG9nZ2lu
Zy4KLSAqCQktaSBuIDogRXhlY3V0ZSB0ZXN0IG4gdGltZXMuCi0gKgkJLUkgeCA6IEV4ZWN1dGUg
dGVzdCBmb3IgeCBzZWNvbmRzLgotICoJCS1QIHggOiBQYXVzZSBmb3IgeCBzZWNvbmRzIGJldHdl
ZW4gaXRlcmF0aW9ucy4KLSAqCQktdCAgIDogVHVybiBvbiBzeXNjYWxsIHRpbWluZy4KLSAqCi0g
KiBIaXN0b3J5Ci0gKgkwNS8yMDAyIEphY2t5IE1hbGNsZXMKLSAqCQktUG9ydGVkCi0gKgotICog
UmVzdHJpY3Rpb25zOgotICogICAgICBUaGlzIHRlc3QgbXVzdCBiZSBydW4gYXMgcm9vdC4KLSAq
LwotCi0jaW5jbHVkZSA8c3RkaW8uaD4KLSNpbmNsdWRlIDxzdGRsaWIuaD4KLSNpbmNsdWRlIDx1
bmlzdGQuaD4KLSNpbmNsdWRlIDxmY250bC5oPgotI2luY2x1ZGUgPGVycm5vLmg+Ci0jaW5jbHVk
ZSA8c3RyaW5nLmg+Ci0jaW5jbHVkZSA8c2lnbmFsLmg+Ci0jaW5jbHVkZSA8c3lzL3R5cGVzLmg+
Ci0jaW5jbHVkZSA8c3lzL3N0YXQuaD4KLSNpbmNsdWRlIDxwd2QuaD4KLQotI2luY2x1ZGUgInRl
c3QuaCIKLSNpbmNsdWRlICJzYWZlX21hY3Jvcy5oIgotCi0jZGVmaW5lIFRFU1RfRklMRSAgICAg
ICAidGVzdGZpbGUiCi0KLWNoYXIgbm9ib2R5X3VpZFtdID0gIm5vYm9keSI7Ci1zdHJ1Y3QgcGFz
c3dkICpsdHB1c2VyOwotCi1jaGFyICpUQ0lEID0gImZzdGF0MDUiOwotaW50IFRTVF9UT1RBTCA9
IDE7Ci0KLWludCBmaWxkZXM7CQkJLyogdGVzdGZpbGUgZGVzY3JpcHRvciAqLwotCi12b2lkIHNl
dHVwKCk7CQkJLyogTWFpbiBzZXR1cCBmdW5jdGlvbiBmb3IgdGhlIHRlc3RzICovCi12b2lkIGNs
ZWFudXAoKTsJCQkvKiBjbGVhbnVwIGZ1bmN0aW9uIGZvciB0aGUgdGVzdCAqLwotdm9pZCBzaWdo
YW5kbGVyKGludCBzaWcpOwkvKiBzaWduYWxzIGhhbmRsZXIgZnVuY3Rpb24gZm9yIHRoZSB0ZXN0
ICovCi0KLWludCBzaWdsaXN0W10gPSB7IFNJR0hVUCwgU0lHSU5ULCBTSUdRVUlULCBTSUdJTEws
IFNJR1RSQVAsIFNJR0FCUlQsIFNJR0lPVCwKLQlTSUdCVVMsIFNJR0ZQRSwgU0lHVVNSMSwgU0lH
U0VHViwgU0lHVVNSMiwgU0lHUElQRSwgU0lHQUxSTSwKLQlTSUdURVJNLAotI2lmZGVmIFNJR1NU
S0ZMVAotCVNJR1NUS0ZMVCwKLSNlbmRpZgotCVNJR0NITEQsIFNJR0NPTlQsIFNJR1RTVFAsIFNJ
R1RUSU4sCi0JU0lHVFRPVSwgU0lHVVJHLCBTSUdYQ1BVLCBTSUdYRlNaLCBTSUdWVEFMUk0sIFNJ
R1BST0YsCi0JU0lHV0lOQ0gsIFNJR0lPLCBTSUdQV1IsIFNJR1NZUywKLSNpZmRlZiBTSUdVTlVT
RUQKLQlTSUdVTlVTRUQKLSNlbmRpZgotfTsKLQotaW50IFNJR19TRUVOID0gc2l6ZW9mKHNpZ2xp
c3QpIC8gc2l6ZW9mKGludCk7Ci0KLSNpZiAhZGVmaW5lZChVQ0xJTlVYKQotCi1pbnQgbWFpbihp
bnQgYWMsIGNoYXIgKiphdikKLXsKLQlzdHJ1Y3Qgc3RhdCAqcHRyX3N0ciA9IHRzdF9nZXRfYmFk
X2FkZHIoTlVMTCk7Ci0JaW50IGxjOwotCi0JdHN0X3BhcnNlX29wdHMoYWMsIGF2LCBOVUxMLCBO
VUxMKTsKLQotCS8qCi0JICogSW52b2tlIHNldHVwIGZ1bmN0aW9uCi0JICovCi0Jc2V0dXAoKTsK
LQotCWZvciAobGMgPSAwOyBURVNUX0xPT1BJTkcobGMpOyBsYysrKSB7Ci0KLQkJdHN0X2NvdW50
ID0gMDsKLQotCQkvKgotCQkgKiBDYWxsIGZzdGF0KDIpLgotCQkgKiB2ZXJpZnkgdGhhdCBpdCBm
YWlscyB3aXRoIC0xIHJldHVybiB2YWx1ZSBhbmQKLQkJICogc2V0cyBhcHByb3ByaWF0ZSBlcnJu
by4KLQkJICovCi0JCVRFU1QoZnN0YXQoZmlsZGVzLCBwdHJfc3RyKSk7Ci0KLQkJLyogQ2hlY2sg
cmV0dXJuIGNvZGUgZnJvbSBmc3RhdCgyKSAqLwotCQlpZiAoVEVTVF9SRVRVUk4gPT0gLTEpIHsK
LQkJCWlmIChURVNUX0VSUk5PID09IEVGQVVMVCkKLQkJCQl0c3RfcmVzbShUUEFTUywKLQkJCQkJ
ICJmc3RhdCBmYWlsZWQgd2l0aCBFRkFVTFQgYXMgZXhwZWN0ZWQiKTsKLQkJCWVsc2UKLQkJCQl0
c3RfcmVzbShURkFJTCB8IFRURVJSTk8sCi0JCQkJCSAiZnN0YXQgZmFpbGVkIHVuZXhwZWN0ZWRs
eSIpOwotCQl9IGVsc2UKLQkJCXRzdF9yZXNtKFRGQUlMLCAiZnN0YXQoKSByZXR1cm5lZCAlbGQg
YnV0IHdlIHdhbnRlZCAtMSIsCi0JCQkJIFRFU1RfUkVUVVJOKTsKLQotCX0KLQotCS8qCi0JICog
SW52b2tlIGNsZWFudXAoKSB0byBkZWxldGUgdGhlIHRlc3QgZGlyZWN0b3J5L2ZpbGUocykgY3Jl
YXRlZAotCSAqIGluIHRoZSBzZXR1cCgpLgotCSAqLwotCWNsZWFudXAoKTsKLQl0c3RfZXhpdCgp
OwotfQotCi0jZWxzZQotCi1pbnQgbWFpbih2b2lkKQotewotCXRzdF9icmttKFRDT05GLCBOVUxM
LCAidGVzdCBpcyBub3QgYXZhaWxhYmxlIG9uIHVDbGludXgiKTsKLX0KLQotI2VuZGlmIC8qIGlm
ICFkZWZpbmVkKFVDTElOVVgpICovCi0KLS8qCi0gKiB2b2lkCi0gKiBzZXR1cCh2b2lkKSAtIHBl
cmZvcm1zIGFsbCBPTkUgVElNRSBzZXR1cCBmb3IgdGhpcyB0ZXN0LgotICoJRXhpdCB0aGUgdGVz
dCBwcm9ncmFtIG9uIHJlY2VpcHQgb2YgdW5leHBlY3RlZCBzaWduYWxzLgotICoJQ3JlYXRlIGEg
dGVtcG9yYXJ5IGRpcmVjdG9yeSBhbmQgY2hhbmdlIGRpcmVjdG9yeSB0byBpdC4KLSAqLwotdm9p
ZCBzZXR1cCh2b2lkKQotewotCWludCBpOwotCi0JdHN0X3JlcXVpcmVfcm9vdCgpOwotCi0JLyoK
LQkgKiBDYXB0dXJlIHVuZXhwZWN0ZWQgc2lnbmFscyBTSUdTRUdWIGluY2x1ZGVkCi0JICogU0lH
U0VHViBiZWluZyBjb25zaWRlcmVkIGFzIGFjY2VwdGFibGUgYXMgcmV0dXJuZWQgdmFsdWUKLQkg
Ki8KLQlmb3IgKGkgPSAwOyBpIDwgU0lHX1NFRU47IGkrKykKLQkJc2lnbmFsKHNpZ2xpc3RbaV0s
ICZzaWdoYW5kbGVyKTsKLQotCWx0cHVzZXIgPSBnZXRwd25hbShub2JvZHlfdWlkKTsKLQlTQUZF
X1NFVFVJRChOVUxMLCBsdHB1c2VyLT5wd191aWQpOwotCi0JdHN0X3RtcGRpcigpOwotCi0JLyog
Q3JlYXRlIGEgdGVzdGZpbGUgdW5kZXIgdGVtcG9yYXJ5IGRpcmVjdG9yeSAqLwotCWZpbGRlcyA9
IFNBRkVfT1BFTihjbGVhbnVwLCBURVNUX0ZJTEUsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NjYpOwot
Ci0JVEVTVF9QQVVTRTsKLX0KLQotLyoKLSAqIHZvaWQKLSAqIGNsZWFudXAoKSAtIFBlcmZvcm1z
IGFsbCBPTkUgVElNRSBjbGVhbnVwIGZvciB0aGlzIHRlc3QgYXQKLSAqICAgICAgICAgICAgIGNv
bXBsZXRpb24gb3IgcHJlbWF0dXJlIGV4aXQuCi0gKglQcmludCB0ZXN0IHRpbWluZyBzdGF0cyBh
bmQgZXJybm8gbG9nIGlmIHRlc3QgZXhlY3V0ZWQgd2l0aCBvcHRpb25zLgotICoJUmVtb3ZlIHRl
bXBvcmFyeSBkaXJlY3RvcnkgYW5kIHN1Yi1kaXJlY3Rvcmllcy9maWxlcyB1bmRlciBpdAotICoJ
Y3JlYXRlZCBkdXJpbmcgc2V0dXAoKS4KLSAqCUV4aXQgdGhlIHRlc3QgcHJvZ3JhbSB3aXRoIG5v
cm1hbCBleGl0IGNvZGUuCi0gKi8KLXZvaWQgY2xlYW51cCh2b2lkKQotewotCi0JU0FGRV9DTE9T
RShjbGVhbnVwLCBmaWxkZXMpOwotCi0JdHN0X3JtZGlyKCk7Ci0KLX0KLQotLyoKLSAqIHNpZ2hh
bmRsZXIoKSAtIGhhbmRsZSB0aGUgc2lnbmFscwotICovCi0KLXZvaWQgc2lnaGFuZGxlcihpbnQg
c2lnKQotewotCWlmIChzaWcgPT0gU0lHU0VHVikKLQkJdHN0X3Jlc20oVFBBU1MsICJmc3RhdCBm
YWlsZWQgYXMgZXhwZWN0ZWQgd2l0aCBTSUdTRUdWIik7Ci0JZWxzZQotCQl0c3RfYnJrbShUQlJP
SywgTlVMTCwgIlVuZXhwZWN0ZWQgc2lnbmFsICVkIHJlY2VpdmVkLiIsIHNpZyk7Ci0JY2xlYW51
cCgpOwotCXRzdF9leGl0KCk7Ci19Ci0tIAoyLjE2LjQKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
