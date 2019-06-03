Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83587332B2
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:53:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 553BD2D016D
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 16:53:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D5158294AC4
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:52:58 +0200 (CEST)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 54B7B20109E
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 16:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=iY+eFW3c4R1RdlCwMk
 3qza2vsVRg/7cTx/c+6ychS9E=; b=A4ObTAgIgccH25csiUHmXN5iOdbJcFWqmd
 u72WjBO8+Rr6LYk5uNGJ84KX8WZJE8yMEhwZulfZ6K78rjctAlol4tXYvtXGr+99
 zGSBp97iyHD7gb5wpgMPuLv6wE++EU/VHfjSoljWbnMHR1V4S91E7F/ODAyz2LJK
 i2eb2WIqo=
Received: from RHEL7U5GA_Intel64.localdomain (unknown [114.224.173.228])
 by smtp12 (Coremail) with SMTP id EMCowADXyGMrNPVclfWUIw--.31372S3;
 Mon, 03 Jun 2019 22:52:28 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Mon,  3 Jun 2019 22:51:59 +0800
Message-Id: <1559573519-4644-2-git-send-email-ice_yangxiao@163.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559573519-4644-1-git-send-email-ice_yangxiao@163.com>
References: <1559573519-4644-1-git-send-email-ice_yangxiao@163.com>
X-CM-TRANSID: EMCowADXyGMrNPVclfWUIw--.31372S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrW8uF43AryrWFWDur4Durg_yoW5Kr17pr
 s7Xa1DAw40q3WxG3y3W3ZFvw4xtw15ArWxG34ayw45CrsrAFyDtF4qqFy5tr12qrZrGFW3
 GF4kXrsaganxX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zil1vfUUUUU=
X-Originating-IP: [114.224.173.228]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiTA-IXlSIfmd+fAAAsS
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/futex_cmp_requeue02.c: Add new test
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

Q2hlY2sgdmFyaW91cyBlcnJub3MgZm9yIGZ1dGV4KEZVVEVYX0NNUF9SRVFVRVVFKS4KClNpZ25l
ZC1vZmYtYnk6IFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2My5jb20+Ci0tLQogcnVudGVzdC9z
eXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB0ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRpZ25vcmUgICAgICAgICB8ICAxICsKIHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvTWFrZWZpbGUgICAgICAgICAgIHwgIDEgKwogLi4u
L2tlcm5lbC9zeXNjYWxscy9mdXRleC9mdXRleF9jbXBfcmVxdWV1ZTAyLmMgICAgfCA1NyArKysr
KysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4L2Z1dGV4X2Nt
cF9yZXF1ZXVlMDIuYwoKZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5
c2NhbGxzCmluZGV4IGZkNWYxZWMuLjQ1MjU3ZTcgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2Fs
bHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtMTU0Nyw2ICsxNTQ3LDcgQEAgcGVyZl9ldmVu
dF9vcGVuMDEgcGVyZl9ldmVudF9vcGVuMDEKIHBlcmZfZXZlbnRfb3BlbjAyIHBlcmZfZXZlbnRf
b3BlbjAyCiAKIGZ1dGV4X2NtcF9yZXF1ZXVlMDEgZnV0ZXhfY21wX3JlcXVldWUwMQorZnV0ZXhf
Y21wX3JlcXVldWUwMiBmdXRleF9jbXBfcmVxdWV1ZTAyCiBmdXRleF93YWl0MDEgZnV0ZXhfd2Fp
dDAxCiBmdXRleF93YWl0MDIgZnV0ZXhfd2FpdDAyCiBmdXRleF93YWl0MDMgZnV0ZXhfd2FpdDAz
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRpZ25vcmUg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4Ly5naXRpZ25vcmUKaW5kZXggNDY2NmEy
Yy4uNjhiYzIwMiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC8u
Z2l0aWdub3JlCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvLmdpdGlnbm9y
ZQpAQCAtMSw0ICsxLDUgQEAKIC9mdXRleF9jbXBfcmVxdWV1ZTAxCisvZnV0ZXhfY21wX3JlcXVl
dWUwMgogL2Z1dGV4X3dhaXQwMQogL2Z1dGV4X3dhaXQwMgogL2Z1dGV4X3dhaXQwMwpkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9NYWtlZmlsZSBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZnV0ZXgvTWFrZWZpbGUKaW5kZXggYzRkNTAzMy4uMWEwYzAwOCAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mdXRleC9NYWtlZmlsZQorKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Z1dGV4L01ha2VmaWxlCkBAIC0xOSw2ICsxOSw3
IEBACiB0b3Bfc3JjZGlyCQk/PSAuLi8uLi8uLi8uLgogCiBmdXRleF9jbXBfcmVxdWV1ZTAxOiBM
RExJQlMrPS1scnQKK2Z1dGV4X2NtcF9yZXF1ZXVlMDI6IExETElCUys9LWxydAogZnV0ZXhfd2Fp
dDAyOiBMRExJQlMrPS1scnQKIGZ1dGV4X3dha2UwMzogTERMSUJTKz0tbHJ0CiBmdXRleF93YWl0
MDM6IENGTEFHUys9LXB0aHJlYWQKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZnV0ZXgvZnV0ZXhfY21wX3JlcXVldWUwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9mdXRleC9mdXRleF9jbXBfcmVxdWV1ZTAyLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMC4uNDYwZDI1NwotLS0gL2Rldi9udWxsCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZnV0ZXgvZnV0ZXhfY21wX3JlcXVldWUwMi5jCkBAIC0wLDAgKzEsNTcgQEAKKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisvKgorICogQ29weXJpZ2h0
IChDKSAyMDE5IFhpYW8gWWFuZyA8aWNlX3lhbmd4aWFvQDE2My5jb20+CisgKgorICogRGVzY3Jp
cHRpb246CisgKiBDaGVjayB2YXJpb3VzIGVycm5vcyBmb3IgZnV0ZXgoRlVURVhfQ01QX1JFUVVF
VUUpLgorICogMSkgZnV0ZXgoRlVURVhfQ01QX1JFUVVFVUUpIHdpdGggaW52YWxpZCB2YWwgcmV0
dXJucyBFSU5WQUwuCisgKiAyKSBmdXRleChGVVRFWF9DTVBfUkVRVUVVRSkgd2l0aCBpbnZhbGlk
IHZhbDIgcmV0dXJucyBFSU5WQUwuCisgKiAzKSBmdXRleChGVVRFWF9DTVBfUkVRVUVVRSkgd2l0
aCBtaXNtYXRjaGVkIHZhbDMgcmV0dXJucyBFQUdBSU4uCisgKi8KKworI2luY2x1ZGUgPGVycm5v
Lmg+CisjaW5jbHVkZSA8bGludXgvZnV0ZXguaD4KKyNpbmNsdWRlIDxzeXMvdGltZS5oPgorCisj
aW5jbHVkZSAidHN0X3Rlc3QuaCIKKyNpbmNsdWRlICJmdXRleHRlc3QuaCIKKyNpbmNsdWRlICJm
dXRleGVzX2NvbW0uaCIKKworc3RhdGljIHN0cnVjdCB0Y2FzZSB7CisJaW50IHNldF93YWtlczsK
KwlpbnQgc2V0X3JlcXVldWVzOworCWludCBleHBfdmFsOworCWludCBleHBfZXJybm87Cit9IHRj
YXNlc1tdID0geworCXsxLCAtMSwgMCwgRUlOVkFMfSwKKwl7LTEsIDEsIDAsIEVJTlZBTH0sCisJ
ezEsIDEsIEZVVEVYX0lOSVRJQUxJWkVSICsgMSwgRUFHQUlOfSwKK307CisKK3N0YXRpYyB2b2lk
IHZlcmlmeV9mdXRleF9jbXBfcmVxdWV1ZSh1bnNpZ25lZCBpbnQgbikKK3sKKwlzdHJ1Y3QgdGNh
c2UgKnRjID0gJnRjYXNlc1tuXTsKKworCVRFU1QoZnV0ZXhfY21wX3JlcXVldWUoJmZ1dGV4ZXNb
MF0sIHRjLT5leHBfdmFsLCAmZnV0ZXhlc1sxXSwKKwkgICAgIHRjLT5zZXRfd2FrZXMsIHRjLT5z
ZXRfcmVxdWV1ZXMsIDApKTsKKwlpZiAoVFNUX1JFVCAhPSAtMSkgeworCQl0c3RfcmVzKFRGQUlM
LCAiZnV0ZXhfY21wX3JlcXVldWUoKSBzdWNjZWVkZWQgdW5leHBlY3RlZGx5Iik7CisJCXJldHVy
bjsKKwl9CisKKwlpZiAoVFNUX0VSUiAhPSB0Yy0+ZXhwX2Vycm5vKSB7CisJCXRzdF9yZXMoVEZB
SUwgfCBUVEVSUk5PLAorCQkJImZ1dGV4X2NtcF9yZXF1ZXVlKCkgZmFpbGVkIHVuZXhwZWN0ZWRs
eSwgZXhwZWN0ZWQgJXMiLAorCQkJdHN0X3N0cmVycm5vKHRjLT5leHBfZXJybm8pKTsKKwkJcmV0
dXJuOworCX0KKworCXRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLCAiZnV0ZXhfY21wX3JlcXVldWUo
KSBmYWlsZWQgYXMgZXhwZWN0ZWQiKTsKK30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0
ID0geworCS5zZXR1cCA9IHNldHVwX2Z1dGV4ZXMsCisJLmNsZWFudXAgPSBjbGVhbnVwX2Z1dGV4
ZXMsCisJLnRlc3QgPSB2ZXJpZnlfZnV0ZXhfY21wX3JlcXVldWUsCisJLnRjbnQgPSBBUlJBWV9T
SVpFKHRjYXNlcyksCit9OwotLSAKMS44LjMuMQoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
