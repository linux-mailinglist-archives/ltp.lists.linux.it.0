Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A44E673
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:51:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AEDD3EAFF0
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:51:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6E9DC3EA20C
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:51:18 +0200 (CEST)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B9BD8601CEA
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 12:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Btx7jz/aggn1xeBIFC
 F+9nqIcjPhrHcB9XvLYcV6TKA=; b=OqQ2nFK/9epbCCFp0G/dHJjWyhbhlhi1xD
 rhbFHwn+ao9l+N6sRtsxwa9d8M13vR7vyUr2bNAQnWwtAfgcjpZTQW8TgfdhmncI
 7+O+2Ii10aJn3z5Sp4CGkqXFSc0qJv3KwyWE5cvW+gKzSwA4HyxFPro159nIf1vj
 4eYheqzKQ=
Received: from RHEL7U5GA_Intel64.localdomain (unknown [112.25.212.39])
 by smtp7 (Coremail) with SMTP id C8CowAAnFeaitgxdoPNCBA--.13123S3;
 Fri, 21 Jun 2019 18:51:14 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Fri, 21 Jun 2019 18:51:11 +0800
Message-Id: <1561114271-8351-2-git-send-email-ice_yangxiao@163.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561114271-8351-1-git-send-email-ice_yangxiao@163.com>
References: <1561114271-8351-1-git-send-email-ice_yangxiao@163.com>
X-CM-TRANSID: C8CowAAnFeaitgxdoPNCBA--.13123S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrW5Wr4fGFW7XrW3tw47urg_yoWrAr13pr
 Z7Xa1DAw48tF1xG3y3G3W7Za18Jw1rJr4fG34ayw43CFs3JFWDtF4qqFy5tr12qrW7GFW3
 GF4kXrsaga9xZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhNVkUUUUU=
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqALaXlc7I6OLWwAAsS
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/futex_cmp_requeue02.c: Add new test
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

Q2hlY2sgdmFyaW91cyBlcnJub3MgZm9yIGZ1dGV4KEZVVEVYX0NNUF9SRVFVRVVFKS4KCkl0J3Mg
YWxzbyBhIHJlZ3Jlc3Npb24gdGVzdCBmb3IgQ1ZFLTIwMTgtNjkyNzoKZmJlMGU4MzlkMWUyICgi
ZnV0ZXg6IFByZXZlbnQgb3ZlcmZsb3cgYnkgc3RyZW5ndGhlbiBpbnB1dCB2YWxpZGF0aW9uIikK
ClNpZ25lZC1vZmYtYnk6IFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2My5jb20+Ci0tLQogcnVu
dGVzdC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRpZ25vcmUgICAgICAgICB8ICAxICsK
IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvTWFrZWZpbGUgICAgICAgICAgIHwgIDEg
KwogLi4uL2tlcm5lbC9zeXNjYWxscy9mdXRleC9mdXRleF9jbXBfcmVxdWV1ZTAyLmMgICAgfCA3
NiArKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4L2Z1
dGV4X2NtcF9yZXF1ZXVlMDIuYwoKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50
ZXN0L3N5c2NhbGxzCmluZGV4IGFmNWVkYTUuLmZmM2UyMGUgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qv
c3lzY2FsbHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtMTU1MCw2ICsxNTUwLDcgQEAgcGVy
Zl9ldmVudF9vcGVuMDEgcGVyZl9ldmVudF9vcGVuMDEKIHBlcmZfZXZlbnRfb3BlbjAyIHBlcmZf
ZXZlbnRfb3BlbjAyCiAKIGZ1dGV4X2NtcF9yZXF1ZXVlMDEgZnV0ZXhfY21wX3JlcXVldWUwMQor
ZnV0ZXhfY21wX3JlcXVldWUwMiBmdXRleF9jbXBfcmVxdWV1ZTAyCiBmdXRleF93YWl0MDEgZnV0
ZXhfd2FpdDAxCiBmdXRleF93YWl0MDIgZnV0ZXhfd2FpdDAyCiBmdXRleF93YWl0MDMgZnV0ZXhf
d2FpdDAzCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRp
Z25vcmUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRpZ25vcmUKaW5kZXgg
NDY2NmEyYy4uNjhiYzIwMiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
dXRleC8uZ2l0aWdub3JlCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvLmdp
dGlnbm9yZQpAQCAtMSw0ICsxLDUgQEAKIC9mdXRleF9jbXBfcmVxdWV1ZTAxCisvZnV0ZXhfY21w
X3JlcXVldWUwMgogL2Z1dGV4X3dhaXQwMQogL2Z1dGV4X3dhaXQwMgogL2Z1dGV4X3dhaXQwMwpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9NYWtlZmlsZSBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvTWFrZWZpbGUKaW5kZXggYzRkNTAzMy4uMWEw
YzAwOCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9NYWtlZmls
ZQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4L01ha2VmaWxlCkBAIC0xOSw2
ICsxOSw3IEBACiB0b3Bfc3JjZGlyCQk/PSAuLi8uLi8uLi8uLgogCiBmdXRleF9jbXBfcmVxdWV1
ZTAxOiBMRExJQlMrPS1scnQKK2Z1dGV4X2NtcF9yZXF1ZXVlMDI6IExETElCUys9LWxydAogZnV0
ZXhfd2FpdDAyOiBMRExJQlMrPS1scnQKIGZ1dGV4X3dha2UwMzogTERMSUJTKz0tbHJ0CiBmdXRl
eF93YWl0MDM6IENGTEFHUys9LXB0aHJlYWQKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZnV0ZXgvZnV0ZXhfY21wX3JlcXVldWUwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mdXRleC9mdXRleF9jbXBfcmVxdWV1ZTAyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMC4uM2VhMTk0MgotLS0gL2Rldi9udWxsCisrKyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZnV0ZXgvZnV0ZXhfY21wX3JlcXVldWUwMi5jCkBAIC0wLDAgKzEsNzYgQEAK
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICogQ29w
eXJpZ2h0IChDKSAyMDE5IFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2My5jb20+CisgKgorICog
RGVzY3JpcHRpb246CisgKiBDaGVjayB2YXJpb3VzIGVycm5vcyBmb3IgZnV0ZXgoRlVURVhfQ01Q
X1JFUVVFVUUpLgorICogMSkgZnV0ZXgoRlVURVhfQ01QX1JFUVVFVUUpIHdpdGggaW52YWxpZCB2
YWwgcmV0dXJucyBFSU5WQUwuCisgKiAyKSBmdXRleChGVVRFWF9DTVBfUkVRVUVVRSkgd2l0aCBp
bnZhbGlkIHZhbDIgcmV0dXJucyBFSU5WQUwuCisgKiAzKSBmdXRleChGVVRFWF9DTVBfUkVRVUVV
RSkgd2l0aCBtaXNtYXRjaGVkIHZhbDMgcmV0dXJucyBFQUdBSU4uCisgKgorICogSXQncyBhbHNv
IGEgcmVncmVzc2lvbiB0ZXN0IGZvciBDVkUtMjAxOC02OTI3OgorICogZmJlMGU4MzlkMWUyICgi
ZnV0ZXg6IFByZXZlbnQgb3ZlcmZsb3cgYnkgc3RyZW5ndGhlbiBpbnB1dCB2YWxpZGF0aW9uIikK
KyAqLworCisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlIDxsaW51eC9mdXRleC5oPgorI2lu
Y2x1ZGUgPHN5cy90aW1lLmg+CisKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2luY2x1ZGUgImZ1
dGV4dGVzdC5oIgorCitzdGF0aWMgZnV0ZXhfdCAqZnV0ZXhlczsKKworc3RhdGljIHN0cnVjdCB0
Y2FzZSB7CisJaW50IHNldF93YWtlczsKKwlpbnQgc2V0X3JlcXVldWVzOworCWludCBleHBfdmFs
OworCWludCBleHBfZXJybm87Cit9IHRjYXNlc1tdID0geworCXsxLCAtMSwgRlVURVhfSU5JVElB
TElaRVIsIEVJTlZBTH0sCisJey0xLCAxLCBGVVRFWF9JTklUSUFMSVpFUiwgRUlOVkFMfSwKKwl7
MSwgMSwgRlVURVhfSU5JVElBTElaRVIgKyAxLCBFQUdBSU59LAorfTsKKworc3RhdGljIHZvaWQg
dmVyaWZ5X2Z1dGV4X2NtcF9yZXF1ZXVlKHVuc2lnbmVkIGludCBuKQoreworCXN0cnVjdCB0Y2Fz
ZSAqdGMgPSAmdGNhc2VzW25dOworCisJVEVTVChmdXRleF9jbXBfcmVxdWV1ZSgmZnV0ZXhlc1sw
XSwgdGMtPmV4cF92YWwsICZmdXRleGVzWzFdLAorCSAgICAgdGMtPnNldF93YWtlcywgdGMtPnNl
dF9yZXF1ZXVlcywgMCkpOworCWlmIChUU1RfUkVUICE9IC0xKSB7CisJCXRzdF9yZXMoVEZBSUws
ICJmdXRleF9jbXBfcmVxdWV1ZSgpIHN1Y2NlZWRlZCB1bmV4cGVjdGVkbHkiKTsKKwkJcmV0dXJu
OworCX0KKworCWlmIChUU1RfRVJSICE9IHRjLT5leHBfZXJybm8pIHsKKwkJdHN0X3JlcyhURkFJ
TCB8IFRURVJSTk8sCisJCQkiZnV0ZXhfY21wX3JlcXVldWUoKSBmYWlsZWQgdW5leHBlY3RlZGx5
LCBleHBlY3RlZCAlcyIsCisJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnJubykpOworCQlyZXR1
cm47CisJfQorCisJdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8sICJmdXRleF9jbXBfcmVxdWV1ZSgp
IGZhaWxlZCBhcyBleHBlY3RlZCIpOworfQorCitzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQorewor
CWZ1dGV4ZXMgPSBTQUZFX01NQVAoTlVMTCwgc2l6ZW9mKGZ1dGV4X3QpICogMiwgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSwKKwkJCSAgICBNQVBfQU5PTllNT1VTIHwgTUFQX1NIQVJFRCwgLTEsIDAp
OworCisJZnV0ZXhlc1swXSA9IEZVVEVYX0lOSVRJQUxJWkVSOworCWZ1dGV4ZXNbMV0gPSBGVVRF
WF9JTklUSUFMSVpFUiArIDE7Cit9CisKK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKK3sKKwlp
ZiAoZnV0ZXhlcykKKwkJU0FGRV9NVU5NQVAoKHZvaWQgKilmdXRleGVzLCBzaXplb2YoZnV0ZXhf
dCkgKiAyKTsKK30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS5zZXR1cCA9
IHNldHVwLAorCS5jbGVhbnVwID0gY2xlYW51cCwKKwkudGVzdCA9IHZlcmlmeV9mdXRleF9jbXBf
cmVxdWV1ZSwKKwkudGNudCA9IEFSUkFZX1NJWkUodGNhc2VzKSwKK307Ci0tIAoxLjguMy4xCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
