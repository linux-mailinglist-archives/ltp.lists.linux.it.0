Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4424D21C
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 12:18:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92FEC3C2F77
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 12:18:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2BDC43C12A1
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 12:18:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2A18C6007A3
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 12:18:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98387573"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 18:18:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 691AB48990CB
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 18:18:02 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 18:18:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 21 Aug 2020 18:18:39 +0800
Message-ID: <1598005119-2147-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 691AB48990CB.AC298
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_af_alg: fix build error when
 ALG_SET_AEAD_ASSOCLEN undefined
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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

T24gb2xkZXIga2VybmVsIHN1Y2ggYXMgMy4xMC4wLTExMzYuZWw3Lng4Nl82NCwgY29tcGlsZSBm
YWlsZWQgYXMgYmVsb3c6CnRzdF9hZl9hbGcuYzogSW4gZnVuY3Rpb24g4oCYdHN0X2FsZ19zZW5k
bXNn4oCZOgp0c3RfYWZfYWxnLmM6MjA1OjIxOiBlcnJvcjog4oCYQUxHX1NFVF9BRUFEX0FTU09D
TEVO4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICBjbXNnLT5j
bXNnX3R5cGUgPSBBTEdfU0VUX0FFQURfQVNTT0NMRU47CiAgICAgICAgICAgICAgICAgICAgIF4K
dHN0X2FmX2FsZy5jOjIwNToyMTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMg
cmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KbWFrZTog
KioqIFt0c3RfYWZfYWxnLm9dIEVycm9yIDEKCkl0IGNvbXBpbGUgZmFpbGVkIGJlY2F1c2UgbHRw
IGxhcGkvaWZfYWxnLmggY2FuJ3QgaGFuZGxlIGZhbGxiYWNrIGxvZ2ljLCBzbyBjb3JyZXQgaXQu
CgpUaGUgQUxHX1NFVF9BRUFEX0FTU09DTEVOIGZsYWcgd2FzIGludHJvZHVjZWQgc2luY2Uga2Vy
bmVsIGNvbW1pdCBhZjhlODA3MzFhCigiY3J5cHRvOiBhZl9hbGcgLSBhZGQgdXNlciBzcGFjZSBp
bnRlcmZhY2UgZm9yIEFFQUQiKSBpbiAyMDE0LgoKRml4ZXM6IDNjYmI5NjNhYmIgKCJsaWIvdHN0
X2FmX2FsZzogYWRkIHRzdF9hbGdfc2VuZG1zZygpIikKU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8
eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KLS0tCiBjb25maWd1cmUuYWMgICAgICAgICAg
fCAgNiArKysrKysKIGluY2x1ZGUvbGFwaS9pZl9hbGcuaCB8IDM5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5h
YwppbmRleCAzODI5NjNkOGIuLmY3MTFhYzEyMyAxMDA2NDQKLS0tIGEvY29uZmlndXJlLmFjCisr
KyBiL2NvbmZpZ3VyZS5hYwpAQCAtMTkzLDYgKzE5MywxMiBAQCBBQ19DSEVDS19UWVBFUyhbc3Ry
dWN0IHh0X2VudHJ5X21hdGNoLCBzdHJ1Y3QgeHRfZW50cnlfdGFyZ2V0XSwsLFsKICNpbmNsdWRl
IDxsaW51eC9uZXRmaWx0ZXJfaXB2NC9pcF90YWJsZXMuaD4KIF0pCiAKK0FDX0NIRUNLX1RZUEVT
KFtzdHJ1Y3Qgc29ja2FkZHJfYWxnLCBzdHJ1Y3QgYWZfYWxnX2l2XSwsLFsKKyNpZmRlZiBIQVZF
X0xJTlVYX0lGX0FMR19ICisjIGluY2x1ZGUgPGxpbnV4L2lmX2FsZy5oPgorI2VuZGlmCitdKQor
CiAjIFRvb2xzIGtub2JzCiAKICMgRXhwZWN0CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xhcGkvaWZf
YWxnLmggYi9pbmNsdWRlL2xhcGkvaWZfYWxnLmgKaW5kZXggNWE3NGRmOTliLi45YzA0YTQ0NGMg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGFwaS9pZl9hbGcuaAorKysgYi9pbmNsdWRlL2xhcGkvaWZf
YWxnLmgKQEAgLTgsOSArOCwxMCBAQAogCiAjaWZkZWYgSEFWRV9MSU5VWF9JRl9BTEdfSAogIyAg
aW5jbHVkZSA8bGludXgvaWZfYWxnLmg+Ci0jZWxzZQorI2VuZGlmCiAjICBpbmNsdWRlIDxzdGRp
bnQuaD4KIAorI2lmbmRlZiBIQVZFX1NUUlVDVF9TT0NLQUREUl9BTEcKIHN0cnVjdCBzb2NrYWRk
cl9hbGcgewogCXVpbnQxNl90CXNhbGdfZmFtaWx5OwogCXVpbnQ4X3QJCXNhbGdfdHlwZVsxNF07
CkBAIC0xOCwyMSArMTksNDEgQEAgc3RydWN0IHNvY2thZGRyX2FsZyB7CiAJdWludDMyX3QJc2Fs
Z19tYXNrOwogCXVpbnQ4X3QJCXNhbGdfbmFtZVs2NF07CiB9OworI2VuZGlmCiAKKyNpZm5kZWYg
SEFWRV9TVFJVQ1RfQUZfQUxHX0lWCiBzdHJ1Y3QgYWZfYWxnX2l2IHsKIAl1aW50MzJfdAlpdmxl
bjsKIAl1aW50OF90CQlpdlswXTsKIH07CisjZW5kaWYKIAotI2RlZmluZSBBTEdfU0VUX0tFWQkJ
MQotI2RlZmluZSBBTEdfU0VUX0lWCQkyCi0jZGVmaW5lIEFMR19TRVRfT1AJCTMKLSNkZWZpbmUg
QUxHX1NFVF9BRUFEX0FTU09DTEVOCTQKLSNkZWZpbmUgQUxHX1NFVF9BRUFEX0FVVEhTSVpFCTUK
KyNpZm5kZWYgQUxHX1NFVF9LRVkKKyMgZGVmaW5lIEFMR19TRVRfS0VZCQkxCisjZW5kaWYKIAot
I2RlZmluZSBBTEdfT1BfREVDUllQVAkJMAotI2RlZmluZSBBTEdfT1BfRU5DUllQVAkJMQorI2lm
bmRlZiBBTEdfU0VUX0lWCisjIGRlZmluZSBBTEdfU0VUX0lWCQkyCisjZW5kaWYKIAotI2VuZGlm
IC8qICFIQVZFX0xJTlVYX0lGX0FMR19IICovCisjaWZuZGVmIEFMR19TRVRfT1AKKyMgZGVmaW5l
IEFMR19TRVRfT1AJCTMKKyNlbmRpZgorCisjaWZuZGVmIEFMR19TRVRfQUVBRF9BU1NPQ0xFTgor
IyBkZWZpbmUgQUxHX1NFVF9BRUFEX0FTU09DTEVOCTQKKyNlbmRpZgorCisjaWZuZGVmIEFMR19T
RVRfQUVBRF9BVVRIU0laRQorIyBkZWZpbmUgQUxHX1NFVF9BRUFEX0FVVEhTSVpFCTUKKyNlbmRp
ZgorCisjaWZuZGVmIEFMR19PUF9ERUNSWVBUCisjIGRlZmluZSBBTEdfT1BfREVDUllQVAkJMAor
I2VuZGlmCisKKyNpZm5kZWYgQUxHX09QX0VOQ1JZUFQKKyMgZGVmaW5lIEFMR19PUF9FTkNSWVBU
CQkxCisjZW5kaWYKIAogI2VuZGlmIC8qIElGX0FMR19IX18gKi8KLS0gCjIuMjMuMAoKCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
