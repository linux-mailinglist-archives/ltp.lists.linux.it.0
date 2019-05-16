Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E91203DB
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 12:47:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0F643EA367
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 12:47:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D6BFB3EA0B7
 for <ltp@lists.linux.it>; Thu, 16 May 2019 12:47:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4CEB61000DF4
 for <ltp@lists.linux.it>; Thu, 16 May 2019 12:47:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,476,1549900800"; d="scan'208,223";a="63325693"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 May 2019 18:47:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id B8C994CDAD75;
 Thu, 16 May 2019 18:47:18 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 16 May 2019 18:47:17 +0800
Message-ID: <5CDD3FB4.50502@cn.fujitsu.com>
Date: Thu, 16 May 2019 18:47:16 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="------------010906040209030101090809"
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: B8C994CDAD75.A0C78
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] increase quotactl01.c coverage
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--------------010906040209030101090809
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit

Hi

Current, most distros enable QFMT_V2([1]) and disable QFMT_V1.  So when we run quotaclt01.c ,it uses quota_v2 (format id 2, /mntpoint/aquota.user,/mointpoint/aquota.group)
But if we enable CONFIG_QFMT_V2 and CONFIG_QFMT_V1 in kernel, the following combinations also take effect and succeed.

1.  format id 1£¨QFMT_VFS_OLD), /mntpoint/quota.user,/mointpoint/quota.group£¬using quotacheck -ug --format=vfsold
2.  format id 2£¨QFMT_VFS_V0), /mntpoint/aquota.user,/mointpoint/aquota.group£¬using quotacheck -ug --format=vfsv0
3.  format id 4£¨QFMT_VFS_V1), /mntpoint/aquota.user,/mointpoint/aquota.group£¬using quotacheck -ug --format=vfsv1

But I don't find a good way to test the above three format in quotaclt01.c . Does anyone have a good way?
By the way, I think ltp-quota.m4 can be rewrite or remove because it is confused. I think we can only check Q_GETINFO and sys/quota.h in ltp-quota.m4.
If someone is interested in this case, you can use this attached patch. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/quota/Kconfig




--------------010906040209030101090809
Content-Type: text/plain;
	name="0001-syscalls-quotactl01.c-add-vfsold-and-vfsv1-format-ch.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-syscalls-quotactl01.c-add-vfsold-and-vfsv1-format-ch.pa";
	filename*1="tch"

RnJvbSBhNDkzZDg0YzAwODVmYjg3ZDc0N2JlYmVjMDhlZTAxNGUzMmZjODFh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5nIFh1IDx4dXlh
bmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgpEYXRlOiBUaHUsIDE2IE1heSAy
MDE5IDE4OjM1OjE5ICswODAwClN1YmplY3Q6IFtQQVRDSF0gc3lzY2FsbHMv
cXVvdGFjdGwwMS5jOiBhZGQgdmZzb2xkIGFuZCB2ZnN2MSBmb3JtYXQgY2hl
Y2sKClNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24u
ZnVqaXRzdS5jb20+Ci0tLQogbTQvbHRwLXF1b3RhLm00ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjkgKystLS0tLS0tLQogLi4uL2tlcm5l
bC9zeXNjYWxscy9xdW90YWN0bC9xdW90YWN0bDAxLmMgICAgIHwgNTQgKysr
KysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCA1NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tNC9sdHAt
cXVvdGEubTQgYi9tNC9sdHAtcXVvdGEubTQKaW5kZXggYTI1ZTM0YTgzLi41
NjE4Yzc2OWUgMTAwNjQ0Ci0tLSBhL200L2x0cC1xdW90YS5tNAorKysgYi9t
NC9sdHAtcXVvdGEubTQKQEAgLTIwLDkgKzIwLDEwIEBAIGRubAogZG5sIExU
UF9DSEVDS19TWVNDQUxMX1FVT1RBQ1RMCiBkbmwgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogZG5sCi1BQ19ERUZVTihbTFRQX0NIRUNLX1NZU0NB
TExfUVVPVEFDVExdLFtkbmwKK0FDX0RFRlVOKFtMVFBfQ0hFQ0tfU1lTQ0FM
TF9RVU9UQUNUTF0sWworQUNfQ0hFQ0tfSEVBREVSUyhbc3lzL3F1b3RhLmhd
LFtxdW90YV9oZWFkZXJfcHJlZml4PSJzeXMiXSkKK2lmIHRlc3QgIngkcXVv
dGFfaGVhZGVyX3ByZWZpeCIgIT0geDsgdGhlbgogCUFDX0xJTktfSUZFTFNF
KFtBQ19MQU5HX1NPVVJDRShbCi0jZGVmaW5lIF9MSU5VWF9RVU9UQV9WRVJT
SU9OIDIKICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KICNpbmNsdWRlIDxzeXMv
cXVvdGEuaD4KICNpbmNsdWRlIDx1bmlzdGQuaD4KQEAgLTMxLDI4ICszMiw4
IEBAIGludCBtYWluKHZvaWQpIHsKIAlyZXR1cm4gcXVvdGFjdGwoUUNNRChR
X0dFVElORk8sIFVTUlFVT1RBKSwgKGNvbnN0IGNoYXIgKikgIi9kZXYvbnVs
bCIsCiAJCQlnZXRldWlkKCksIChjYWRkcl90KSAmZHEpOwogfV0pXSxbaGFz
X3F1b3RhdjI9InllcyJdKQotCitmaQogaWYgdGVzdCAieCRoYXNfcXVvdGF2
MiIgPSB4eWVzOyB0aGVuCi0JQUNfREVGSU5FKEhBVkVfUVVPVEFWMiwxLFtE
ZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSBxdW90YSB2Ml0pCi1lbHNlCi0KLQkj
IGdvdCBxdW90YSB2MT8KLQlBQ19MSU5LX0lGRUxTRShbQUNfTEFOR19TT1VS
Q0UoWwotI2RlZmluZSBfTElOVVhfUVVPVEFfVkVSU0lPTiAxCi0jaW5jbHVk
ZSA8c3lzL3R5cGVzLmg+Ci0jaW5jbHVkZSA8c3lzL3F1b3RhLmg+Ci0jaW5j
bHVkZSA8dW5pc3RkLmg+Ci1pbnQgbWFpbih2b2lkKSB7Ci0Jc3RydWN0IGRx
YmxrIGRxOwotCXJldHVybiBxdW90YWN0bChRQ01EKFFfR0VUUVVPVEEsIFVT
UlFVT1RBKSwgKGNvbnN0IGNoYXIgKikgIi9kZXYvbnVsbCIsCi0JCQlnZXRl
dWlkKCksIChjYWRkcl90KSAmZHEpOwotfV0pXSxbaGFzX3F1b3RhdjE9Inll
cyJdKQotCi0JaWYgdGVzdCAieCRoYXNfcXVvdGF2MSIgPSB4eWVzOyB0aGVu
Ci0JCUFDX0RFRklORShIQVZFX1FVT1RBVjEsMSxbRGVmaW5lIHRvIDEgaWYg
eW91IGhhdmUgcXVvdGEgdjFdKQotCWVsc2UKLQkJQUNfTVNHX1dBUk4oQ291
bGRuJ3QgZGV0ZXJtaW5lIHF1b3RhIHZlcnNpb24gKHBsZWFzZSBzdWJtaXQg
Y29uZmlnLmxvZyBhbmQgbWFucGFnZSB0byBsdHBAbGlzdHMubGludXguaXQp
KQotCWZpCi0KKwlBQ19ERUZJTkUoSEFWRV9RVU9UQV9RX0dFVElORk8sMSxb
RGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgcXVvdGEgUV9HRVRJTkZPXSkKIGZp
CiBdKQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9x
dW90YWN0bC9xdW90YWN0bDAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3F1b3RhY3RsL3F1b3RhY3RsMDEuYwppbmRleCA5MmI2NTRlYmEuLjdj
NWExYzQwMSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9xdW90YWN0bC9xdW90YWN0bDAxLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9xdW90YWN0bC9xdW90YWN0bDAxLmMKQEAgLTU1LDQ0ICs1
NSwyOSBAQAogCiAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKIAotI2lmIGRlZmlu
ZWQoSEFWRV9RVU9UQVYyKSB8fCBkZWZpbmVkKEhBVkVfUVVPVEFWMSkKLSMg
aW5jbHVkZSA8c3lzL3F1b3RhLmg+Ci0KLSMgaWYgZGVmaW5lZChIQVZFX1FV
T1RBVjIpCi0jICBkZWZpbmUgX0xJTlVYX1FVT1RBX1ZFUlNJT04gIDIKLSMg
IGlmbmRlZiBRRk1UX1ZGU19WMAotIyAgIGRlZmluZSBRRk1UX1ZGU19WMCAg
ICAgMgotIyAgZW5kaWYKLSMgIGRlZmluZSBVU1JQQVRIIE1OVFBPSU5UICIv
YXF1b3RhLnVzZXIiCi0jICBkZWZpbmUgR1JQUEFUSCBNTlRQT0lOVCAiL2Fx
dW90YS5ncm91cCIKLSMgIGRlZmluZSBGTVRJRAlRRk1UX1ZGU19WMAotIyBl
bHNlCi0jICBkZWZpbmUgX0xJTlVYX1FVT1RBX1ZFUlNJT04gIDEKLSMgIGlm
bmRlZiBRRk1UX1ZGU19PTEQKLSMgICBkZWZpbmUgUUZNVF9WRlNfT0xEICAg
IDEKLSMgIGVuZGlmCi0jICBkZWZpbmUgVVNSUEFUSCBNTlRQT0lOVCAiL3F1
b3RhLnVzZXIiCi0jICBkZWZpbmUgR1JQUEFUSCBNTlRQT0lOVCAiL3F1b3Rh
Lmdyb3VwIgotIyAgZGVmaW5lIEZNVElECVFGTVRfVkZTX09MRAotIyBlbmRp
ZgorI2lmIEhBVkVfU1lTX1FVT1RBX0gKKyNpbmNsdWRlIDxzeXMvcXVvdGEu
aD4KIAotIyBkZWZpbmUgTU5UUE9JTlQJIm1udHBvaW50IgorI2RlZmluZSBN
TlRQT0lOVCAibW50cG9pbnQiCiAKLXN0YXRpYyBpbnQzMl90IGZtdF9pZCA9
IEZNVElEOworY2hhciBVU1JQQVRIWzMyXTsKK2NoYXIgR1JQUEFUSFszMl07
CitzdGF0aWMgaW50MzJfdCBmbXRfaWQ7CiBzdGF0aWMgaW50IHRlc3RfaWQ7
CiBzdGF0aWMgc3RydWN0IGRxYmxrIHNldF9kcSA9IHsKIAkuZHFiX2Jzb2Z0
bGltaXQgPSAxMDAsCiAJLmRxYl92YWxpZCA9IFFJRl9CTElNSVRTCiB9Owog
c3RhdGljIHN0cnVjdCBkcWJsayByZXNfZHE7Ci0jIGlmIGRlZmluZWQoSEFW
RV9RVU9UQVYyKQorCisjIGlmIEhBVkVfUVVPVEFfUV9HRVRJTkZPCiBzdGF0
aWMgc3RydWN0IGRxaW5mbyBzZXRfcWYgPSB7CiAJLmRxaV9iZ3JhY2UgPSA4
MCwKIAkuZHFpX3ZhbGlkID0gSUlGX0JHUkFDRQogfTsKIHN0YXRpYyBzdHJ1
Y3QgZHFpbmZvIHJlc19xZjsKIHN0YXRpYyBpbnQzMl90IGZtdF9idWY7Ci0j
IGVuZGlmCisjZW5kaWYKIAogc3RhdGljIHN0cnVjdCB0Y2FzZSB7CiAJaW50
IGNtZDsKQEAgLTExMiw3ICs5Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGNhc2Ug
ewogCXtRQ01EKFFfR0VUUVVPVEEsIFVTUlFVT1RBKSwgJnRlc3RfaWQsICZy
ZXNfZHEsCiAJJnNldF9kcS5kcWJfYnNvZnRsaW1pdCwgJnJlc19kcS5kcWJf
YnNvZnRsaW1pdCwKIAlzaXplb2YocmVzX2RxLmRxYl9ic29mdGxpbWl0KSwg
ImdldCBkaXNrIHF1b3RhIGxpbWl0IGZvciB1c2VyIn0sCi0jIGlmIGRlZmlu
ZWQoSEFWRV9RVU9UQVYyKQorIyBpZiBIQVZFX1FVT1RBX1FfR0VUSU5GTwog
CXtRQ01EKFFfU0VUSU5GTywgVVNSUVVPVEEpLCAmdGVzdF9pZCwgJnNldF9x
ZiwKIAlOVUxMLCBOVUxMLCAwLCAic2V0IGluZm9ybWF0aW9uIGFib3V0IHF1
b3RhZmlsZSBmb3IgdXNlciJ9LAogCkBAIC0xMzksNyArMTI0LDcgQEAgc3Rh
dGljIHN0cnVjdCB0Y2FzZSB7CiAJe1FDTUQoUV9HRVRRVU9UQSwgR1JQUVVP
VEEpLCAmdGVzdF9pZCwgJnJlc19kcSwgJnNldF9kcS5kcWJfYnNvZnRsaW1p
dCwKIAkmcmVzX2RxLmRxYl9ic29mdGxpbWl0LCBzaXplb2YocmVzX2RxLmRx
Yl9ic29mdGxpbWl0KSwKIAkic2V0IGRpc2sgcXVvdGEgbGltaXQgZm9yIGdy
b3VwIn0sCi0jIGlmIGRlZmluZWQoSEFWRV9RVU9UQVYyKQorIyBpZiAgSEFW
RV9RVU9UQV9RX0dFVElORk8KIAl7UUNNRChRX1NFVElORk8sIEdSUFFVT1RB
KSwgJnRlc3RfaWQsICZzZXRfcWYsCiAJTlVMTCwgTlVMTCwgMCwgInNldCBp
bmZvcm1hdGlvbiBhYm91dCBxdW90YWZpbGUgZm9yIGdyb3VwIn0sCiAKQEAg
LTE1OSwxOCArMTQ0LDIyIEBAIHN0YXRpYyBzdHJ1Y3QgdGNhc2UgewogCiBz
dGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogewotCWNvbnN0IGNoYXIgKmNvbnN0
IGNtZFtdID0geyJxdW90YWNoZWNrIiwgIi11ZyIsIE1OVFBPSU5ULCBOVUxM
fTsKKwljb25zdCBjaGFyICpjb25zdCBjbWRbXSA9IHsicXVvdGFjaGVjayIs
ICItdWciLCAiLS1mb3JtYXQ9dmZzdjAiLCBNTlRQT0lOVCwgTlVMTH07CiAJ
aW50IHJldDsKIAotCiAJcmV0ID0gdHN0X3J1bl9jbWQoY21kLCBOVUxMLCBO
VUxMLCAxKTsKIAlzd2l0Y2ggKHJldCkgewogCWNhc2UgMjU1OgotCQl0c3Rf
YnJrKFRDT05GLCAicXVvdGFjaGVjayBiaW5hcnkgbm90IGluc3RhbGxlZCIp
OworCQl0c3RfYnJrKFRCUk9LLCAicXVvdGFjaGVjayBiaW5hcnkgbm90IGlu
c3RhbGxlZCIpOworCWNhc2UgMDoKKwkJc3ByaW50ZihVU1JQQVRILCAiJXMv
YXF1b3RhLnVzZXIiLCBNTlRQT0lOVCk7CisJCXNwcmludGYoR1JQUEFUSCwg
IiVzL2FxdW90YS5ncm91cCIsIE1OVFBPSU5UKTsKKwkJZm10X2lkID0gMjsK
KwkJdHN0X3JlcyhUSU5GTywgIiVzICVzICVkIiwgVVNSUEFUSCwgR1JQUEFU
SCwgZm10X2lkKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJdHN0X2JyayhU
QlJPSywgInF1b3RhY2hlY2sgZXhpdGVkIHdpdGggJWkiLCByZXQpOwotCWNh
c2UgMDoKLQlicmVhazsKKwkJYnJlYWs7CiAJfQogCiAJdGVzdF9pZCA9IGdl
dGV1aWQoKTsKQEAgLTE4Nyw5ICsxNzYsMTAgQEAgc3RhdGljIHZvaWQgdmVy
aWZ5X3F1b3RhKHVuc2lnbmVkIGludCBuKQogCXN0cnVjdCB0Y2FzZSAqdGMg
PSAmdGNhc2VzW25dOwogCiAJcmVzX2RxLmRxYl9ic29mdGxpbWl0ID0gMDsK
KyMgaWYgSEFWRV9RVU9UQV9RX0dFVElORk8KIAlyZXNfcWYuZHFpX2lncmFj
ZSA9IDA7CiAJZm10X2J1ZiA9IDA7Ci0KKyNlbmRpZgogCVRFU1QocXVvdGFj
dGwodGMtPmNtZCwgdHN0X2RldmljZS0+ZGV2LCAqdGMtPmlkLCB0Yy0+YWRk
cikpOwogCWlmIChUU1RfUkVUID09IC0xKSB7CiAJCXRzdF9yZXMoVEZBSUwg
fCBUVEVSUk5PLCAicXVvdGFjdGwgZmFpbGVkIHRvICVzIiwgdGMtPmRlcyk7
Ci0tIAoyLjE4LjEKCg==

--------------010906040209030101090809
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--------------010906040209030101090809--
