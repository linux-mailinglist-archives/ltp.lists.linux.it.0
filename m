Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8DD3A9648
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817793C71BB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:36:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 737723C2DD3
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:14 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 77FA2140021C
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:36:11 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G4g3C3RKpzZhjg
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 17:33:11 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:06 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 17:36:06 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 16 Jun 2021 17:36:05 +0800
Message-ID: <20210616093606.214856-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093606.214856-1-xieziyao@huawei.com>
References: <20210616093606.214856-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/getrusage: Cleanup and bugfix for
 getrusage03
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

MS4gUmVtb3ZlIGZvcmtfbWFsbG9jKCksIHNpbmNlIHRoaXMgcG9pbnQgY2FuIGJlIGNvdmVyZWQg
YnkgaW5oZXJpdF9mb3JrMSgpIGFuZAppbmhlcml0X2ZvcmsyKCkuCjIuIFJlcGxhY2Ugc2xlZXAo
MSkgd2l0aCBUU1RfUFJPQ0VTU19TVEFURV9XQUlUKCkgYW5kIFRTVF9QUk9DRVNTX1JFTEVBU0Vf
V0FJVCgpLgozLiBSZXdyaXRlIGV4ZWNfd2l0aG91dF9mb3JrKCkgdG8gaW5oZXJpdF9leGVjKCkg
YW5kIG1ha2UgdGhlIHJlc3VsdHMgY2FuIGJlIHJlcG9ydGVkCmluIHRoZSB0ZXN0IHByb2Nlc3Mu
CjQuIEluY3JlYXNlIHRoZSBjb25zdW1lZCBhbW91bnQgYnkgMipERUxUQV9NQVguCgpTaWduZWQt
b2ZmLWJ5OiBYaWUgWml5YW8gPHhpZXppeWFvQGh1YXdlaS5jb20+Ci0tLQogLi4uL2tlcm5lbC9z
eXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDMuYyAgIHwgMzg1ICsrKysrLS0tLS0tLS0tLS0t
LQogLi4uL2tlcm5lbC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDMuaCAgIHwgIDM1ICsr
CiAuLi4vc3lzY2FsbHMvZ2V0cnVzYWdlL2dldHJ1c2FnZTAzX2NoaWxkLmMgICAgfCAxODcgKyst
LS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE4MCBpbnNlcnRpb25zKCspLCA0MjcgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRydXNh
Z2UvZ2V0cnVzYWdlMDMuaAoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
Z2V0cnVzYWdlL2dldHJ1c2FnZTAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJ1
c2FnZS9nZXRydXNhZ2UwMy5jCmluZGV4IDEyNWFjZmM2NC4uNTE4ZTg1MTBlIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJ1c2FnZS9nZXRydXNhZ2UwMy5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cnVzYWdlL2dldHJ1c2FnZTAzLmMKQEAgLTEs
MzUzICsxLDE3NiBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKIC8qCi0gKiBnZXRydXNhZ2UwMyAtIHRlc3QgcnVfbWF4cnNzIGJlaGF2aW9ycyBpbiBzdHJ1
Y3QgcnVzYWdlCi0gKgotICogVGhpcyB0ZXN0IHByb2dyYW0gaXMgYmFja3BvcnRlZCBmcm9tIHVw
c3RyZWFtIGNvbW1pdDoKLSAqIDFmMTAyMDZjZjhlOTQ1MjIwZjcyMjBhODA5ZDhiZmMxNWMyMWY5
YTUsIHdoaWNoIGZpbGxzIHJ1X21heHJzcwotICogdmFsdWUgaW4gc3RydWN0IHJ1c2FnZSBhY2Nv
cmRpbmcgdG8gcnNzIGhpd2F0ZXIgbWFyay4gVG8gbWFrZSBzdXJlCi0gKiB0aGlzIGZlYXR1cmUg
d29ya3MgY29ycmVjdGx5LCBhIHNlcmllcyBvZiB0ZXN0cyBhcmUgZXhlY3V0ZWQgaW4KLSAqIHRo
aXMgcHJvZ3JhbS4KLSAqCiAgKiBDb3B5cmlnaHQgKEMpIDIwMTEgIFJlZCBIYXQsIEluYy4KLSAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKLSAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdmVyc2lvbiAyIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMKLSAqIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGlu
IHRoZSBob3BlIHRoYXQgaXQgd291bGQgYmUgdXNlZnVsLAotICogYnV0IFdJVEhPVVQgQU5ZIFdB
UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1FUkNIQU5U
QUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyAqIENvcHlyaWdo
dCAoYykgMjAyMSBYaWUgWml5YW8gPHhpZXppeWFvQGh1YXdlaS5jb20+CisgKi8KKworLypcCisg
KiBbRGVzY3JpcHRpb25dCiAgKgotICogRnVydGhlciwgdGhpcyBzb2Z0d2FyZSBpcyBkaXN0cmli
dXRlZCB3aXRob3V0IGFueSB3YXJyYW50eSB0aGF0IGl0Ci0gKiBpcyBmcmVlIG9mIHRoZSByaWdo
dGZ1bCBjbGFpbSBvZiBhbnkgdGhpcmQgcGVyc29uIHJlZ2FyZGluZwotICogaW5mcmluZ2VtZW50
IG9yIHRoZSBsaWtlLiAgQW55IGxpY2Vuc2UgcHJvdmlkZWQgaGVyZWluLCB3aGV0aGVyCi0gKiBp
bXBsaWVkIG9yIG90aGVyd2lzZSwgYXBwbGllcyBvbmx5IHRvIHRoaXMgc29mdHdhcmUgZmlsZS4g
IFBhdGVudAotICogbGljZW5zZXMsIGlmIGFueSwgcHJvdmlkZWQgaGVyZWluIGRvIG5vdCBhcHBs
eSB0byBjb21iaW5hdGlvbnMgb2YKLSAqIHRoaXMgcHJvZ3JhbSB3aXRoIG90aGVyIHNvZnR3YXJl
LCBvciBhbnkgb3RoZXIgcHJvZHVjdCB3aGF0c29ldmVyLgorICogVGVzdCBydV9tYXhyc3MgYmVo
YXZpb3JzIGluIHN0cnVjdCBydXNhZ2UuCiAgKgotICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKLSAqIGFsb25nIHdpdGgg
dGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRoZSBGcmVlIFNvZnR3YXJlCi0gKiBGb3VuZGF0
aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BCi0g
KiAwMjExMC0xMzAxLCBVU0EuCisgKiBUaGlzIHRlc3QgcHJvZ3JhbSBpcyBiYWNrcG9ydGVkIGZy
b20gdXBzdHJlYW0gY29tbWl0OiAxZjEwMjA2Y2Y4ZTksIHdoaWNoCisgKiBmaWxscyBydV9tYXhy
c3MgdmFsdWUgaW4gc3RydWN0IHJ1c2FnZSBhY2NvcmRpbmcgdG8gcnNzIGhpd2F0ZXIgbWFyay4g
VG8KKyAqIG1ha2Ugc3VyZSB0aGlzIGZlYXR1cmUgd29ya3MgY29ycmVjdGx5LCBhIHNlcmllcyBv
ZiB0ZXN0cyBhcmUgZXhlY3V0ZWQgaW4KKyAqIHRoaXMgcHJvZ3JhbS4KICAqLwotI2luY2x1ZGUg
PHN5cy90eXBlcy5oPgotI2luY2x1ZGUgPHN5cy9tbWFuLmg+Ci0jaW5jbHVkZSA8c3lzL3Jlc291
cmNlLmg+Ci0jaW5jbHVkZSA8c3lzL3RpbWUuaD4KLSNpbmNsdWRlIDxzeXMvd2FpdC5oPgotI2lu
Y2x1ZGUgPHVuaXN0ZC5oPgotI2luY2x1ZGUgPHNpZ25hbC5oPgotI2luY2x1ZGUgPHN0ZGlvLmg+
Ci0jaW5jbHVkZSA8c3RkbGliLmg+Ci0jaW5jbHVkZSA8c3RyaW5nLmg+CgotI2luY2x1ZGUgInRl
c3QuaCIKLSNpbmNsdWRlICJzYWZlX21hY3Jvcy5oIgorI2luY2x1ZGUgPHN0ZGxpYi5oPgorI2lu
Y2x1ZGUgPHN0ZGlvLmg+CgotY2hhciAqVENJRCA9ICJnZXRydXNhZ2UwMyI7Ci1pbnQgVFNUX1RP
VEFMID0gMTsKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorI2luY2x1ZGUgImdldHJ1c2FnZTAzLmgi
CgotI2RlZmluZSBERUxUQV9NQVgJMTAyNDAKKyNkZWZpbmUgVEVTVEJJTiAiZ2V0cnVzYWdlMDNf
Y2hpbGQiCgorc3RhdGljIHBpZF90IHBpZDsKK3N0YXRpYyBpbnQgcmV0dmFsOwogc3RhdGljIHN0
cnVjdCBydXNhZ2UgcnU7CiBzdGF0aWMgbG9uZyBtYXhyc3NfaW5pdDsKLXN0YXRpYyBpbnQgcmV0
dmFsLCBzdGF0dXM7Ci1zdGF0aWMgcGlkX3QgcGlkOwoKLXN0YXRpYyB2b2lkIGluaGVyaXRfZm9y
ayh2b2lkKTsKLXN0YXRpYyB2b2lkIGluaGVyaXRfZm9yazIodm9pZCk7Ci1zdGF0aWMgdm9pZCBm
b3JrX21hbGxvYyh2b2lkKTsKLXN0YXRpYyB2b2lkIGdyYW5kY2hpbGRfbWF4cnNzKHZvaWQpOwot
c3RhdGljIHZvaWQgem9tYmllKHZvaWQpOwotc3RhdGljIHZvaWQgc2lnX2lnbih2b2lkKTsKLXN0
YXRpYyB2b2lkIGV4ZWNfd2l0aG91dF9mb3JrKHZvaWQpOwotc3RhdGljIHZvaWQgY2hlY2tfcmV0
dXJuKGludCBzdGF0dXMsIGNoYXIgKnBhc3NfbXNnLCBjaGFyICpmYWlsX21zZyk7Ci1zdGF0aWMg
aW50IGlzX2luX2RlbHRhKGxvbmcgdmFsdWUpOwotc3RhdGljIHZvaWQgY29uc3VtZShpbnQgbWVn
YSk7Ci1zdGF0aWMgdm9pZCBzZXR1cCh2b2lkKTsKLXN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCk7
CitzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgcmVzb3VyY2VbXSA9IHsKKwlURVNUQklOLAorCU5V
TEwsCit9OwoKLWludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitzdGF0aWMgdm9pZCBj
aGVja19yZXN1bHQoaW50IHJlc3VsdCwgY2hhciAqbXNnKQogewotCWludCBsYzsKLQotCXRzdF9w
YXJzZV9vcHRzKGFyZ2MsIGFyZ3YsIE5VTEwsIE5VTEwpOwotCi0Jc2V0dXAoKTsKLQotCWZvciAo
bGMgPSAwOyBURVNUX0xPT1BJTkcobGMpOyBsYysrKSB7Ci0JCXRzdF9jb3VudCA9IDA7Ci0KLQkJ
dHN0X3Jlc20oVElORk8sICJhbGxvY2F0ZSAxMDBNQiIpOwotCQljb25zdW1lKDEwMCk7Ci0KLQkJ
aW5oZXJpdF9mb3JrKCk7Ci0JCWluaGVyaXRfZm9yazIoKTsKLQkJZm9ya19tYWxsb2MoKTsKLQkJ
Z3JhbmRjaGlsZF9tYXhyc3MoKTsKLQkJem9tYmllKCk7Ci0JCXNpZ19pZ24oKTsKLQkJZXhlY193
aXRob3V0X2ZvcmsoKTsKLQl9Ci0JY2xlYW51cCgpOwotCXRzdF9leGl0KCk7CisJaWYgKHJlc3Vs
dCA9PSAxKQorCQl0c3RfcmVzKFRQQVNTLCAiJXMiLCBtc2cpOworCWVsc2UgaWYgKHJlc3VsdCA9
PSAwKQorCQl0c3RfcmVzKFRGQUlMLCAiJXMiLCBtc2cpOworCWVsc2UKKwkJdHN0X3JlcyhURkFJ
TCwgInVuZXhwZWN0ZWQgcmVzdWx077yaJWQiLCByZXN1bHQpOwogfQoKLS8qIFRlc3RjYXNlICMw
MTogZm9yayBpbmhlcml0Ci0gKiBleHBlY3Q6IGluaXRpYWwuc2VsZiB+PSBjaGlsZC5zZWxmICov
Ci1zdGF0aWMgdm9pZCBpbmhlcml0X2Zvcmsodm9pZCkKK3N0YXRpYyB2b2lkIGluaGVyaXRfZm9y
azEodm9pZCkKIHsKLQl0c3RfcmVzbShUSU5GTywgIlRlc3RjYXNlICMwMTogZm9yayBpbmhlcml0
Iik7Ci0KLQlTQUZFX0dFVFJVU0FHRShjbGVhbnVwLCBSVVNBR0VfU0VMRiwgJnJ1KTsKLQl0c3Rf
cmVzbShUSU5GTywgImluaXRpYWwuc2VsZiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7CisJU0FGRV9H
RVRSVVNBR0UoUlVTQUdFX1NFTEYsICZydSk7CisJbWF4cnNzX2luaXQgPSBydS5ydV9tYXhyc3M7
CgotCXN3aXRjaCAocGlkID0gZm9yaygpKSB7Ci0JY2FzZSAtMToKLQkJdHN0X2Jya20oVEJST0sg
fCBURVJSTk8sIGNsZWFudXAsICJmb3JrICMxIik7Ci0JY2FzZSAwOgotCQltYXhyc3NfaW5pdCA9
IHJ1LnJ1X21heHJzczsKLQkJU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX1NFTEYsICZy
dSk7Ci0JCXRzdF9yZXNtKFRJTkZPLCAiY2hpbGQuc2VsZiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7
Ci0JCWV4aXQoaXNfaW5fZGVsdGEobWF4cnNzX2luaXQgLSBydS5ydV9tYXhyc3MpKTsKLQlkZWZh
dWx0OgotCQlicmVhazsKKwlpZiAoKHBpZCA9IFNBRkVfRk9SSygpKSA9PSAwKSB7CisJCVNBRkVf
R0VUUlVTQUdFKFJVU0FHRV9TRUxGLCAmcnUpOworCQlleGl0KCFpc19pbl9kZWx0YShtYXhyc3Nf
aW5pdCAtIHJ1LnJ1X21heHJzcykpOwogCX0KCi0JU0FGRV9XQUlUUElEKGNsZWFudXAsIHBpZCwg
JnN0YXR1cywgV1VOVFJBQ0VEIHwgV0NPTlRJTlVFRCk7Ci0JY2hlY2tfcmV0dXJuKFdFWElUU1RB
VFVTKHN0YXR1cyksICJpbml0aWFsLnNlbGYgfj0gY2hpbGQuc2VsZiIsCi0JCSAgICAgImluaXRp
YWwuc2VsZiAhfj0gY2hpbGQuc2VsZiIpOworCXRzdF9yZWFwX2NoaWxkcmVuKCk7CisJdHN0X3Jl
cyhUUEFTUywgImNoZWNrIHRoYXQgaW5pdGlhbC5zZWxmIH49IGNoaWxkLnNlbGYiKTsKIH0KCi0v
KiBUZXN0Y2FzZSAjMDI6IGZvcmsgaW5oZXJpdCAoY29udC4pCi0gKiBleHBlY3Q6IGluaXRpYWwu
Y2hpbGRyZW4gfj0gMTAwTUIsIGNoaWxkLmNoaWxkcmVuID0gMCAqLwogc3RhdGljIHZvaWQgaW5o
ZXJpdF9mb3JrMih2b2lkKQogewotCXRzdF9yZXNtKFRJTkZPLCAiVGVzdGNhc2UgIzAyOiBmb3Jr
IGluaGVyaXQoY29udC4pIik7Ci0KLQlTQUZFX0dFVFJVU0FHRShjbGVhbnVwLCBSVVNBR0VfQ0hJ
TERSRU4sICZydSk7Ci0JdHN0X3Jlc20oVElORk8sICJpbml0aWFsLmNoaWxkcmVuID0gJWxkIiwg
cnUucnVfbWF4cnNzKTsKLQlpZiAoaXNfaW5fZGVsdGEocnUucnVfbWF4cnNzIC0gMTAyNDAwKSkK
LQkJdHN0X3Jlc20oVFBBU1MsICJpbml0aWFsLmNoaWxkcmVuIH49IDEwME1CIik7Ci0JZWxzZQot
CQl0c3RfcmVzbShURkFJTCwgImluaXRpYWwuY2hpbGRyZW4gIX49IDEwME1CIik7Ci0KLQlzd2l0
Y2ggKHBpZCA9IGZvcmsoKSkgewotCWNhc2UgLTE6Ci0JCXRzdF9icmttKFRCUk9LIHwgVEVSUk5P
LCBjbGVhbnVwLCAiZm9yayAjMiIpOwotCWNhc2UgMDoKLQkJU0FGRV9HRVRSVVNBR0UoY2xlYW51
cCwgUlVTQUdFX0NISUxEUkVOLCAmcnUpOwotCQl0c3RfcmVzbShUSU5GTywgImNoaWxkLmNoaWxk
cmVuID0gJWxkIiwgcnUucnVfbWF4cnNzKTsKLQkJZXhpdChydS5ydV9tYXhyc3MgPT0gMCk7Ci0J
ZGVmYXVsdDoKLQkJYnJlYWs7Ci0JfQotCi0JU0FGRV9XQUlUUElEKGNsZWFudXAsIHBpZCwgJnN0
YXR1cywgV1VOVFJBQ0VEIHwgV0NPTlRJTlVFRCk7Ci0JY2hlY2tfcmV0dXJuKFdFWElUU1RBVFVT
KHN0YXR1cyksICJjaGlsZC5jaGlsZHJlbiA9PSAwIiwKLQkJICAgICAiY2hpbGQuY2hpbGRyZW4g
IT0gMCIpOwotfQotCi0vKiBUZXN0Y2FzZSAjMDM6IGZvcmsgKyBtYWxsb2MKLSAqIGV4cGVjdDog
aW5pdGlhbC5zZWxmICsgNTBNQiB+PSBjaGlsZC5zZWxmICovCi1zdGF0aWMgdm9pZCBmb3JrX21h
bGxvYyh2b2lkKQotewotCXRzdF9yZXNtKFRJTkZPLCAiVGVzdGNhc2UgIzAzOiBmb3JrICsgbWFs
bG9jIik7Ci0KLQlTQUZFX0dFVFJVU0FHRShjbGVhbnVwLCBSVVNBR0VfU0VMRiwgJnJ1KTsKLQl0
c3RfcmVzbShUSU5GTywgImluaXRpYWwuc2VsZiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7CisJU0FG
RV9HRVRSVVNBR0UoUlVTQUdFX0NISUxEUkVOLCAmcnUpOworCWNoZWNrX3Jlc3VsdChpc19pbl9k
ZWx0YShydS5ydV9tYXhyc3MgLSAxMDI0MDApLCAiY2hlY2sgdGhhdCBpbml0aWFsLmNoaWxkcmVu
IH49IDEwME1CIik7CgotCXN3aXRjaCAocGlkID0gZm9yaygpKSB7Ci0JY2FzZSAtMToKLQkJdHN0
X2Jya20oVEJST0sgfCBURVJSTk8sIGNsZWFudXAsICJmb3JrICMzIik7Ci0JY2FzZSAwOgotCQlt
YXhyc3NfaW5pdCA9IHJ1LnJ1X21heHJzczsKLQkJdHN0X3Jlc20oVElORk8sICJjaGlsZCBhbGxv
Y2F0ZSArNTBNQiIpOwotCQljb25zdW1lKDUwKTsKLQkJU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwg
UlVTQUdFX1NFTEYsICZydSk7Ci0JCXRzdF9yZXNtKFRJTkZPLCAiY2hpbGQuc2VsZiA9ICVsZCIs
IHJ1LnJ1X21heHJzcyk7Ci0JCWV4aXQoaXNfaW5fZGVsdGEobWF4cnNzX2luaXQgKyA1MTIwMCAt
IHJ1LnJ1X21heHJzcykpOwotCWRlZmF1bHQ6Ci0JCWJyZWFrOworCWlmICgocGlkID0gU0FGRV9G
T1JLKCkpID09IDApIHsKKwkJU0FGRV9HRVRSVVNBR0UoUlVTQUdFX0NISUxEUkVOLCAmcnUpOwor
CQlleGl0KHJ1LnJ1X21heHJzcyk7CiAJfQoKLQlTQUZFX1dBSVRQSUQoY2xlYW51cCwgcGlkLCAm
c3RhdHVzLCBXVU5UUkFDRUQgfCBXQ09OVElOVUVEKTsKLQljaGVja19yZXR1cm4oV0VYSVRTVEFU
VVMoc3RhdHVzKSwgImluaXRpYWwuc2VsZiArIDUwTUIgfj0gY2hpbGQuc2VsZiIsCi0JCSAgICAg
ImluaXRpYWwuc2VsZiArIDUwTUIgIX49IGNoaWxkLnNlbGYiKTsKKwl0c3RfcmVhcF9jaGlsZHJl
bigpOworCXRzdF9yZXMoVFBBU1MsICJjaGVjayB0aGF0IGNoaWxkLmNoaWxkcmVuID09IDAiKTsK
IH0KCi0vKiBUZXN0Y2FzZSAjMDQ6IGdyYW5kY2hpbGQgbWF4cnNzCi0gKiBleHBlY3Q6IHBvc3Rf
d2FpdC5jaGlsZHJlbiB+PSAzMDBNQiAqLwogc3RhdGljIHZvaWQgZ3JhbmRjaGlsZF9tYXhyc3Mo
dm9pZCkKIHsKLQl0c3RfcmVzbShUSU5GTywgIlRlc3RjYXNlICMwNDogZ3JhbmRjaGlsZCBtYXhy
c3MiKTsKLQotCVNBRkVfR0VUUlVTQUdFKGNsZWFudXAsIFJVU0FHRV9DSElMRFJFTiwgJnJ1KTsK
LQl0c3RfcmVzbShUSU5GTywgImluaXRpYWwuY2hpbGRyZW4gPSAlbGQiLCBydS5ydV9tYXhyc3Mp
OwotCi0Jc3dpdGNoIChwaWQgPSBmb3JrKCkpIHsKLQljYXNlIC0xOgotCQl0c3RfYnJrbShUQlJP
SyB8IFRFUlJOTywgY2xlYW51cCwgImZvcmsgIzQiKTsKLQljYXNlIDA6Ci0JCXJldHZhbCA9IHN5
c3RlbSgiZ2V0cnVzYWdlMDNfY2hpbGQgLWcgMzAwIik7CisJaWYgKChwaWQgPSBTQUZFX0ZPUkso
KSkgPT0gMCkgeworCQlyZXR2YWwgPSB0c3Rfc3lzdGVtKCJnZXRydXNhZ2UwM19jaGlsZCBncmFu
ZF9jb25zdW1lIDMwMCIpOwogCQlpZiAoKFdJRkVYSVRFRChyZXR2YWwpICYmIFdFWElUU1RBVFVT
KHJldHZhbCkgIT0gMCkpCi0JCQl0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgY2xlYW51cCwgInN5
c3RlbSIpOworCQkJdHN0X2JyayhUQlJPSywgInN5c3RlbShcImdldHJ1c2FnZTAzX2NoaWxkIGdy
YW5kX2NvbnN1bWUgMzAwXCIpIik7CiAJCWV4aXQoMCk7Ci0JZGVmYXVsdDoKLQkJYnJlYWs7CiAJ
fQoKLQlTQUZFX1dBSVRQSUQoY2xlYW51cCwgcGlkLCAmc3RhdHVzLCBXVU5UUkFDRUQgfCBXQ09O
VElOVUVEKTsKLQlpZiAoV0VYSVRTVEFUVVMoc3RhdHVzKSAhPSAwKQotCQl0c3RfYnJrbShUQlJP
SyB8IFRFUlJOTywgY2xlYW51cCwgImNoaWxkIGV4aXQgc3RhdHVzIGlzIG5vdCAwIik7Ci0KLQlT
QUZFX0dFVFJVU0FHRShjbGVhbnVwLCBSVVNBR0VfQ0hJTERSRU4sICZydSk7Ci0JdHN0X3Jlc20o
VElORk8sICJwb3N0X3dhaXQuY2hpbGRyZW4gPSAlbGQiLCBydS5ydV9tYXhyc3MpOwotCWlmIChp
c19pbl9kZWx0YShydS5ydV9tYXhyc3MgLSAzMDcyMDApKQotCQl0c3RfcmVzbShUUEFTUywgImNo
aWxkLmNoaWxkcmVuIH49IDMwME1CIik7Ci0JZWxzZQotCQl0c3RfcmVzbShURkFJTCwgImNoaWxk
LmNoaWxkcmVuICF+PSAzMDBNQiIpOworCXRzdF9yZWFwX2NoaWxkcmVuKCk7CisJU0FGRV9HRVRS
VVNBR0UoUlVTQUdFX0NISUxEUkVOLCAmcnUpOworCWNoZWNrX3Jlc3VsdChpc19pbl9kZWx0YShy
dS5ydV9tYXhyc3MgLSAzMDcyMDApLCAiY2hlY2sgdGhhdCBjaGlsZC5jaGlsZHJlbiB+PSAzMDBN
QiIpOwogfQoKLS8qIFRlc3RjYXNlICMwNTogem9tYmllCi0gKiBleHBlY3Q6IGluaXRpYWwgfj0g
cHJlX3dhaXQsIHBvc3Rfd2FpdCB+PSA0MDBNQiAqLwogc3RhdGljIHZvaWQgem9tYmllKHZvaWQp
CiB7Ci0JdHN0X3Jlc20oVElORk8sICJUZXN0Y2FzZSAjMDU6IHpvbWJpZSIpOwotCi0JU0FGRV9H
RVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX0NISUxEUkVOLCAmcnUpOwotCXRzdF9yZXNtKFRJTkZP
LCAiaW5pdGlhbC5jaGlsZHJlbiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7CisJU0FGRV9HRVRSVVNB
R0UoUlVTQUdFX0NISUxEUkVOLCAmcnUpOwogCW1heHJzc19pbml0ID0gcnUucnVfbWF4cnNzOwoK
LQlzd2l0Y2ggKHBpZCA9IGZvcmsoKSkgewotCWNhc2UgLTE6Ci0JCXRzdF9icmttKFRCUk9LLCBj
bGVhbnVwLCAiZm9yayAjNSIpOwotCWNhc2UgMDoKLQkJcmV0dmFsID0gc3lzdGVtKCJnZXRydXNh
Z2UwM19jaGlsZCAtbiA0MDAiKTsKKwlpZiAoKHBpZCA9IFNBRkVfRk9SSygpKSA9PSAwKSB7CisJ
CXJldHZhbCA9IHRzdF9zeXN0ZW0oImdldHJ1c2FnZTAzX2NoaWxkIGNvbnN1bWUgNDAwIik7CiAJ
CWlmICgoV0lGRVhJVEVEKHJldHZhbCkgJiYgV0VYSVRTVEFUVVMocmV0dmFsKSAhPSAwKSkKLQkJ
CXRzdF9icmttKFRCUk9LIHwgVEVSUk5PLCBjbGVhbnVwLCAic3lzdGVtIik7CisJCQl0c3RfYnJr
KFRCUk9LLCAic3lzdGVtKFwiZ2V0cnVzYWdlMDNfY2hpbGQgY29uc3VtZSA0MDBcIikiKTsKIAkJ
ZXhpdCgwKTsKLQlkZWZhdWx0OgotCQlicmVhazsKIAl9CgotCXNsZWVwKDEpOwkJLyogY2hpbGRy
ZW4gYmVjb21lIHpvbWJpZSAqLwotCVNBRkVfR0VUUlVTQUdFKGNsZWFudXAsIFJVU0FHRV9DSElM
RFJFTiwgJnJ1KTsKLQl0c3RfcmVzbShUSU5GTywgInByZV93YWl0LmNoaWxkcmVuID0gJWxkIiwg
cnUucnVfbWF4cnNzKTsKLQlpZiAoaXNfaW5fZGVsdGEocnUucnVfbWF4cnNzIC0gbWF4cnNzX2lu
aXQpKQotCQl0c3RfcmVzbShUUEFTUywgImluaXRpYWwuY2hpbGRyZW4gfj0gcHJlX3dhaXQuY2hp
bGRyZW4iKTsKLQllbHNlCi0JCXRzdF9yZXNtKFRGQUlMLCAiaW5pdGlhbC5jaGlsZHJlbiAhfj0g
cHJlX3dhaXQuY2hpbGRyZW4iKTsKLQotCVNBRkVfV0FJVFBJRChjbGVhbnVwLCBwaWQsICZzdGF0
dXMsIFdVTlRSQUNFRCB8IFdDT05USU5VRUQpOwotCWlmIChXRVhJVFNUQVRVUyhzdGF0dXMpICE9
IDApCi0JCXRzdF9icmttKFRCUk9LIHwgVEVSUk5PLCBjbGVhbnVwLCAiY2hpbGQgZXhpdCBzdGF0
dXMgaXMgbm90IDAiKTsKKwlUU1RfUFJPQ0VTU19TVEFURV9XQUlUKHBpZCwgJ1onLCAwKTsKKwlT
QUZFX0dFVFJVU0FHRShSVVNBR0VfQ0hJTERSRU4sICZydSk7CisJY2hlY2tfcmVzdWx0KGlzX2lu
X2RlbHRhKHJ1LnJ1X21heHJzcyAtIG1heHJzc19pbml0KSwKKwkJICAgICAiY2hlY2sgdGhhdCBp
bml0aWFsLmNoaWxkcmVuIH49IHByZV93YWl0LmNoaWxkcmVuIik7CgotCVNBRkVfR0VUUlVTQUdF
KGNsZWFudXAsIFJVU0FHRV9DSElMRFJFTiwgJnJ1KTsKLQl0c3RfcmVzbShUSU5GTywgInBvc3Rf
d2FpdC5jaGlsZHJlbiA9ICVsZCIsIHJ1LnJ1X21heHJzcyk7Ci0JaWYgKGlzX2luX2RlbHRhKHJ1
LnJ1X21heHJzcyAtIDQwOTYwMCkpCi0JCXRzdF9yZXNtKFRQQVNTLCAicG9zdF93YWl0LmNoaWxk
cmVuIH49IDQwME1CIik7Ci0JZWxzZQotCQl0c3RfcmVzbShURkFJTCwgInBvc3Rfd2FpdC5jaGls
ZHJlbiAhfj0gNDAwTUIiKTsKKwl0c3RfcmVhcF9jaGlsZHJlbigpOworCVNBRkVfR0VUUlVTQUdF
KFJVU0FHRV9DSElMRFJFTiwgJnJ1KTsKKwljaGVja19yZXN1bHQoaXNfaW5fZGVsdGEocnUucnVf
bWF4cnNzIC0gNDA5NjAwKSwgImNoZWNrIHRoYXQgcG9zdF93YWl0LmNoaWxkcmVuIH49IDQwME1C
Iik7CiB9CgotLyogVGVzdGNhc2UgIzA2OiBTSUdfSUdOCi0gKiBleHBlY3Q6IGluaXRpYWwgfj0g
YWZ0ZXJfem9tYmllICovCiBzdGF0aWMgdm9pZCBzaWdfaWduKHZvaWQpCiB7Ci0JdHN0X3Jlc20o
VElORk8sICJUZXN0Y2FzZSAjMDY6IFNJR19JR04iKTsKLQotCVNBRkVfR0VUUlVTQUdFKGNsZWFu
dXAsIFJVU0FHRV9DSElMRFJFTiwgJnJ1KTsKLQl0c3RfcmVzbShUSU5GTywgImluaXRpYWwuY2hp
bGRyZW4gPSAlbGQiLCBydS5ydV9tYXhyc3MpOwotCXNpZ25hbChTSUdDSExELCBTSUdfSUdOKTsK
KwlTQUZFX0dFVFJVU0FHRShSVVNBR0VfQ0hJTERSRU4sICZydSk7CiAJbWF4cnNzX2luaXQgPSBy
dS5ydV9tYXhyc3M7CisJU0FGRV9TSUdOQUwoU0lHQ0hMRCwgU0lHX0lHTik7CgotCXN3aXRjaCAo
cGlkID0gZm9yaygpKSB7Ci0JY2FzZSAtMToKLQkJdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJm
b3JrICM2Iik7Ci0JY2FzZSAwOgotCQlyZXR2YWwgPSBzeXN0ZW0oImdldHJ1c2FnZTAzX2NoaWxk
IC1uIDUwMCIpOworCWlmICgocGlkID0gU0FGRV9GT1JLKCkpID09IDApIHsKKwkJcmV0dmFsID0g
dHN0X3N5c3RlbSgiZ2V0cnVzYWdlMDNfY2hpbGQgY29uc3VtZSA1MDAiKTsKIAkJaWYgKChXSUZF
WElURUQocmV0dmFsKSAmJiBXRVhJVFNUQVRVUyhyZXR2YWwpICE9IDApKQotCQkJdHN0X2Jya20o
VEJST0sgfCBURVJSTk8sIGNsZWFudXAsICJzeXN0ZW0iKTsKKwkJCXRzdF9icmsoVEJST0ssICJz
eXN0ZW0oXCJnZXRydXNhZ2UwM19jaGlsZCBjb25zdW1lIDUwMFwiKSIpOwogCQlleGl0KDApOwot
CWRlZmF1bHQ6Ci0JCWJyZWFrOwogCX0KCi0Jc2xlZXAoMSk7CQkvKiBjaGlsZHJlbiBiZWNvbWUg
em9tYmllICovCi0JU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX0NISUxEUkVOLCAmcnUp
OwotCXRzdF9yZXNtKFRJTkZPLCAiYWZ0ZXJfem9tYmllLmNoaWxkcmVuID0gJWxkIiwgcnUucnVf
bWF4cnNzKTsKLQlpZiAoaXNfaW5fZGVsdGEocnUucnVfbWF4cnNzIC0gbWF4cnNzX2luaXQpKQot
CQl0c3RfcmVzbShUUEFTUywgImluaXRpYWwuY2hpbGRyZW4gfj0gYWZ0ZXJfem9tYmllLmNoaWxk
cmVuIik7Ci0JZWxzZQotCQl0c3RfcmVzbShURkFJTCwgImluaXRpYWwuY2hpbGRyZW4gIX49IGFm
dGVyX3pvbWJpZS5jaGlsZHJlbiIpOwotCXNpZ25hbChTSUdDSExELCBTSUdfREZMKTsKKwlUU1Rf
UFJPQ0VTU19SRUxFQVNFX1dBSVQocGlkLCAwKTsKKwlTQUZFX0dFVFJVU0FHRShSVVNBR0VfQ0hJ
TERSRU4sICZydSk7CisJY2hlY2tfcmVzdWx0KGlzX2luX2RlbHRhKHJ1LnJ1X21heHJzcyAtIG1h
eHJzc19pbml0KSwKKwkJICAgICAiY2hlY2sgdGhhdCBpbml0aWFsLmNoaWxkcmVuIH49IGFmdGVy
X3pvbWJpZS5jaGlsZHJlbiIpOworCVNBRkVfU0lHTkFMKFNJR0NITEQsIFNJR19ERkwpOwogfQoK
LS8qIFRlc3RjYXNlICMwNzogZXhlYyB3aXRob3V0IGZvcmsKLSAqIGV4cGVjdDogaW5pdGlhbCB+
PSBmb3JrICovCi1zdGF0aWMgdm9pZCBleGVjX3dpdGhvdXRfZm9yayh2b2lkKQorc3RhdGljIHZv
aWQgaW5oZXJpdF9leGVjKHZvaWQpCiB7Ci0JY2hhciBzdHJfbWF4cnNzX3NlbGZbQlVGU0laXSwg
c3RyX21heHJzc19jaGlsZFtCVUZTSVpdOwotCWxvbmcgbWF4cnNzX3NlbGYsIG1heHJzc19jaGls
ZDsKKwlpbnQgc3RhdHVzOwoKLQl0c3RfcmVzbShUSU5GTywgIlRlc3RjYXNlICMwNzogZXhlYyB3
aXRob3V0IGZvcmsiKTsKKwlpZiAoKHBpZCA9IFNBRkVfRk9SSygpKSA9PSAwKSB7CisJCWNoYXIg
c3RyX21heHJzc19zZWxmW0JVRlNJWl0sIHN0cl9tYXhyc3NfY2hpbGRbQlVGU0laXTsKCi0JU0FG
RV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX1NFTEYsICZydSk7Ci0JbWF4cnNzX3NlbGYgPSBy
dS5ydV9tYXhyc3M7Ci0JU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX0NISUxEUkVOLCAm
cnUpOwotCW1heHJzc19jaGlsZCA9IHJ1LnJ1X21heHJzczsKLQl0c3RfcmVzbShUSU5GTywgImlu
aXRpYWwuc2VsZiA9ICVsZCwgaW5pdGlhbC5jaGlsZHJlbiA9ICVsZCIsCi0JCSBtYXhyc3Nfc2Vs
ZiwgbWF4cnNzX2NoaWxkKTsKKwkJU0FGRV9HRVRSVVNBR0UoUlVTQUdFX1NFTEYsICZydSk7CisJ
CXNwcmludGYoc3RyX21heHJzc19zZWxmLCAiJWxkIiwgcnUucnVfbWF4cnNzKTsKKwkJU0FGRV9H
RVRSVVNBR0UoUlVTQUdFX0NISUxEUkVOLCAmcnUpOworCQlzcHJpbnRmKHN0cl9tYXhyc3NfY2hp
bGQsICIlbGQiLCBydS5ydV9tYXhyc3MpOwoKLQlzcHJpbnRmKHN0cl9tYXhyc3Nfc2VsZiwgIiVs
ZCIsIG1heHJzc19zZWxmKTsKLQlzcHJpbnRmKHN0cl9tYXhyc3NfY2hpbGQsICIlbGQiLCBtYXhy
c3NfY2hpbGQpOwotCWlmIChleGVjbHAoImdldHJ1c2FnZTAzX2NoaWxkIiwgImdldHJ1c2FnZTAz
X2NoaWxkIiwgIi12IiwKLQkJICAgIi1zIiwgc3RyX21heHJzc19zZWxmLCAiLWwiLCBzdHJfbWF4
cnNzX2NoaWxkLCBOVUxMKSA9PSAtMSkKLQkJdHN0X2Jya20oVEJST0sgfCBURVJSTk8sIGNsZWFu
dXAsICJleGVjbHAiKTsKLX0KKwkJU0FGRV9FWEVDTFAoImdldHJ1c2FnZTAzX2NoaWxkIiwgImdl
dHJ1c2FnZTAzX2NoaWxkIiwgImNvbXBhcmUiLAorCQkJICAgIHN0cl9tYXhyc3Nfc2VsZiwgc3Ry
X21heHJzc19jaGlsZCwgTlVMTCk7CisJfQoKLXN0YXRpYyBpbnQgaXNfaW5fZGVsdGEobG9uZyB2
YWx1ZSkKLXsKLQlyZXR1cm4gKHZhbHVlID49IC1ERUxUQV9NQVggJiYgdmFsdWUgPD0gREVMVEFf
TUFYKTsKKwlTQUZFX1dBSVRQSUQocGlkLCAmc3RhdHVzLCAwKTsKKwljaGVja19yZXN1bHQoV0lG
RVhJVEVEKHN0YXR1cykgJiYgV0VYSVRTVEFUVVMoc3RhdHVzKSA9PSAwLAorCQkgICAgICJjaGVj
ayB0aGF0IGluaXRpYWwuc2VsZiB+PSBleGVjLnNlbGYsIGluaXRpYWwuY2hpbGRyZW4gfj0gZXhl
Yy5jaGlsZHJlbiIpOwogfQoKLXN0YXRpYyB2b2lkIGNoZWNrX3JldHVybihpbnQgc3RhdHVzLCBj
aGFyICpwYXNzX21zZywgY2hhciAqZmFpbF9tc2cpCitzdGF0aWMgdm9pZCBydW4odm9pZCkKIHsK
LQlzd2l0Y2ggKHN0YXR1cykgewotCWNhc2UgMToKLQkJdHN0X3Jlc20oVFBBU1MsICIlcyIsIHBh
c3NfbXNnKTsKLQkJYnJlYWs7Ci0JY2FzZSAwOgotCQl0c3RfcmVzbShURkFJTCwgIiVzIiwgZmFp
bF9tc2cpOwotCQlicmVhazsKLQlkZWZhdWx0OgotCQl0c3RfcmVzbShURkFJTCwgImNoaWxkIGV4
aXQgc3RhdHVzIGlzICVkIiwgc3RhdHVzKTsKLQkJYnJlYWs7Ci0JfQotfQotCi1zdGF0aWMgdm9p
ZCBjb25zdW1lKGludCBtZWdhKQotewotCXNpemVfdCBzejsKLQl2b2lkICpwdHI7Ci0KLQlzeiA9
IG1lZ2EgKiAxMDI0ICogMTAyNDsKLQlwdHIgPSBTQUZFX01BTExPQyhjbGVhbnVwLCBzeik7Ci0J
bWVtc2V0KHB0ciwgMCwgc3opOworCWluaGVyaXRfZm9yazEoKTsKKwlpbmhlcml0X2ZvcmsyKCk7
CisJZ3JhbmRjaGlsZF9tYXhyc3MoKTsKKwl6b21iaWUoKTsKKwlzaWdfaWduKCk7CisJaW5oZXJp
dF9leGVjKCk7CiB9Cgogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsKLQkvKiBEaXNhYmxlIHRl
c3QgaWYgdGhlIHZlcnNpb24gb2YgdGhlIGtlcm5lbCBpcyBsZXNzIHRoYW4gMi42LjMyICovCi0J
aWYgKCh0c3Rfa3ZlcmNtcCgyLCA2LCAzMikpIDwgMCkgewotCQl0c3RfcmVzbShUQ09ORiwgIlRo
aXMgcnVfbWF4cnNzIGZpZWxkIGlzIG5vdCBzdXBwb3J0ZWQiKTsKLQkJdHN0X2Jya20oVENPTkYs
IE5VTEwsICJiZWZvcmUga2VybmVsIDIuNi4zMiIpOwotCX0KLQotCXRzdF9zaWcoRk9SSywgREVG
X0hBTkRMRVIsIGNsZWFudXApOwotCi0JVEVTVF9QQVVTRTsKKwljb25zdW1lKDEwMCk7CiB9Cgot
c3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQotewotfQorc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0
ZXN0ID0geworCS5mb3Jrc19jaGlsZCA9IDEsCisJLmNoaWxkX25lZWRzX3JlaW5pdCA9IDEsCisJ
LnJlc291cmNlX2ZpbGVzID0gcmVzb3VyY2UsCisJLm1pbl9rdmVyID0gIjIuNi4zMiIsCisJLnRh
Z3MgPSAoY29uc3Qgc3RydWN0IHRzdF90YWdbXSkgeworCQl7ImxpbnV4LWdpdCIsICIxZjEwMjA2
Y2Y4ZTkifSwKKwl9LAorCS5zZXR1cCA9IHNldHVwLAorCS50ZXN0X2FsbCA9IHJ1biwKK307CmRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJ1c2FnZS9nZXRydXNhZ2Uw
My5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDMuaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjVmYmY1NzI3MgotLS0gL2Rldi9u
dWxsCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cnVzYWdlL2dldHJ1c2FnZTAz
LmgKQEAgLTAsMCArMSwzNSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b3ItbGF0ZXIKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMTEgIFJlZCBIYXQsIEluYy4KKyAqIENv
cHlyaWdodCAoYykgMjAyMSBYaWUgWml5YW8gPHhpZXppeWFvQGh1YXdlaS5jb20+CisgKi8KKwor
I2lmbmRlZiBMVFBfR0VUUlVTQUdFMDNfSAorI2RlZmluZSBMVFBfR0VUUlVTQUdFMDNfSAorCisj
aW5jbHVkZSAidHN0X3Rlc3QuaCIKKworI2RlZmluZSBERUxUQV9NQVggMjA0ODAKKworc3RhdGlj
IHZvaWQgY29uc3VtZShpbnQgY29uc3VtZV9ucikKK3sKKwl2b2lkKiBwdHI7CisJc2l6ZV90IHNp
emU7CisJdW5zaWduZWQgbG9uZyB2bXN3YXBfc2l6ZTsKKworCXNpemUgPSBjb25zdW1lX25yICog
MTAyNCAqIDEwMjQ7CisJcHRyID0gU0FGRV9NQUxMT0Moc2l6ZSk7CisJbWVtc2V0KHB0ciwgMCwg
c2l6ZSk7CisKKwlTQUZFX0ZJTEVfTElORVNfU0NBTkYoIi9wcm9jL3NlbGYvc3RhdHVzIiwgIlZt
U3dhcDogJWx1IiwgJnZtc3dhcF9zaXplKTsKKwlpZiAodm1zd2FwX3NpemUgPiAwKQorCQl0c3Rf
YnJrKFRCUk9LLCAiVm1Td2FwIGlzIG5vdCB6ZXJvIik7CisJdHN0X3JlcyhUSU5GTywgImFsbG9j
YXRlICVkTUIiLCBjb25zdW1lX25yKTsKK30KKworc3RhdGljIGludCBpc19pbl9kZWx0YShsb25n
IHZhbHVlKQoreworCXJldHVybiAodmFsdWUgPj0gLURFTFRBX01BWCAmJiB2YWx1ZSA8PSBERUxU
QV9NQVgpOworfQorCisjZW5kaWYgLy9MVFBfR0VUUlVTQUdFMDNfSApkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDNfY2hpbGQuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cnVzYWdlL2dldHJ1c2FnZTAzX2NoaWxkLmMKaW5k
ZXggOTcyYzM4ZTRlLi41OGRhNDgxY2IgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZ2V0cnVzYWdlL2dldHJ1c2FnZTAzX2NoaWxkLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9nZXRydXNhZ2UvZ2V0cnVzYWdlMDNfY2hpbGQuYwpAQCAtMSwxNjggKzEsNjMg
QEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAvKgotICog
Z2V0cnVzYWdlMDNfY2hpbGQuYyAtIGEgY2hpbGQgcHJvZ3JhbSBleGVjdXRlZCBieSBnZXRydXNh
Z2UwMwotICoKICAqIENvcHlyaWdodCAoQykgMjAxMSAgUmVkIEhhdCwgSW5jLgotICogVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgot
ICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB2ZXJzaW9uIDIgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYwotICogTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbi4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhv
cGUgdGhhdCBpdCB3b3VsZCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7
IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLgotICoKLSAqIEZ1cnRoZXIsIHRo
aXMgc29mdHdhcmUgaXMgZGlzdHJpYnV0ZWQgd2l0aG91dCBhbnkgd2FycmFudHkgdGhhdCBpdAot
ICogaXMgZnJlZSBvZiB0aGUgcmlnaHRmdWwgY2xhaW0gb2YgYW55IHRoaXJkIHBlcnNvbiByZWdh
cmRpbmcKLSAqIGluZnJpbmdlbWVudCBvciB0aGUgbGlrZS4gIEFueSBsaWNlbnNlIHByb3ZpZGVk
IGhlcmVpbiwgd2hldGhlcgotICogaW1wbGllZCBvciBvdGhlcndpc2UsIGFwcGxpZXMgb25seSB0
byB0aGlzIHNvZnR3YXJlIGZpbGUuICBQYXRlbnQKLSAqIGxpY2Vuc2VzLCBpZiBhbnksIHByb3Zp
ZGVkIGhlcmVpbiBkbyBub3QgYXBwbHkgdG8gY29tYmluYXRpb25zIG9mCi0gKiB0aGlzIHByb2dy
YW0gd2l0aCBvdGhlciBzb2Z0d2FyZSwgb3IgYW55IG90aGVyIHByb2R1Y3Qgd2hhdHNvZXZlci4K
LSAqCi0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZQotICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3Jp
dGUgdGhlIEZyZWUgU29mdHdhcmUKLSAqIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0
cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEKLSAqIDAyMTEwLTEzMDEsIFVTQS4KKyAqIENv
cHlyaWdodCAoYykgMjAyMSBYaWUgWml5YW8gPHhpZXppeWFvQGh1YXdlaS5jb20+CiAgKi8KLSNp
bmNsdWRlIDxzeXMvdHlwZXMuaD4KLSNpbmNsdWRlIDxzeXMvcmVzb3VyY2UuaD4KLSNpbmNsdWRl
IDxzeXMvdGltZS5oPgotI2luY2x1ZGUgPHN5cy93YWl0Lmg+Ci0jaW5jbHVkZSA8ZXJybm8uaD4K
LSNpbmNsdWRlIDx1bmlzdGQuaD4KLSNpbmNsdWRlIDxzdGRpby5oPgotI2luY2x1ZGUgPHN0ZGxp
Yi5oPgotI2luY2x1ZGUgPHN0cmluZy5oPgotI2luY2x1ZGUgPGxpbWl0cy5oPgotCi0jaW5jbHVk
ZSAidGVzdC5oIgotI2luY2x1ZGUgInNhZmVfbWFjcm9zLmgiCgotY2hhciAqVENJRCA9ICJnZXRy
dXNhZ2UwM19jaGlsZCI7Ci1pbnQgVFNUX1RPVEFMID0gMTsKLQotI2RlZmluZSBERUxUQV9NQVgJ
MTAyNDAKKy8qXAorICogW0Rlc2NyaXB0aW9uXQorICoKKyAqIENoaWxkIHByb2dyYW0gZXhlY3V0
ZWQgYnkgZ2V0cnVzYWdlMDMuCisgKi8KCi1zdGF0aWMgaW50IG9wdF9jb25zdW1lLCBvcHRfZ3Jh
bmQsIG9wdF9zaG93LCBvcHRfc2VsZiwgb3B0X2NoaWxkOwotc3RhdGljIGNoYXIgKmNvbnN1bWVf
c3RyLCAqZ3JhbmRfY29uc3VtZV9zdHIsICpzZWxmX3N0ciwgKmNoaWxkX3N0cjsKKyNkZWZpbmUg
VFNUX05PX0RFRkFVTFRfTUFJTgoKLW9wdGlvbl90IGNoaWxkX29wdGlvbnNbXSA9IHsKLQl7Im46
IiwgJm9wdF9jb25zdW1lLCAmY29uc3VtZV9zdHJ9LAotCXsiZzoiLCAmb3B0X2dyYW5kLCAmZ3Jh
bmRfY29uc3VtZV9zdHJ9LAotCXsidiIsICZvcHRfc2hvdywgTlVMTH0sCi0JeyJzOiIsICZvcHRf
c2VsZiwgJnNlbGZfc3RyfSwKLQl7Imw6IiwgJm9wdF9jaGlsZCwgJmNoaWxkX3N0cn0sCi0Je05V
TEwsIE5VTEwsIE5VTEx9Ci19OworI2luY2x1ZGUgPHN0ZGxpYi5oPgoKLXN0YXRpYyB2b2lkIHVz
YWdlKHZvaWQpOwotc3RhdGljIHZvaWQgY29uc3VtZShpbnQgbWVnYSk7Ci1zdGF0aWMgdm9pZCBz
ZXR1cCh2b2lkKTsKLXN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCk7CisjaW5jbHVkZSAidHN0X3Rl
c3QuaCIKKyNpbmNsdWRlICJnZXRydXNhZ2UwMy5oIgoKIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCiB7Ci0JaW50IGxjOworCWlmIChhcmdjIDwgMykKKwkJdHN0X2JyayhURkFJTCwg
ImFyZ2MgaXMgJWQsIGV4cGVjdGVkIG1vcmUiLCBhcmdjKTsKKwogCXBpZF90IHBpZDsKLQlsb25n
IG1heHJzc19zZWxmLCBtYXhyc3NfY2hpbGRyZW4sIGRlbHRhOworCWxvbmcgbWF4cnNzX3NlbGYs
IG1heHJzc19jaGlsZHJlbjsKIAlsb25nIGNvbnN1bWVfbnIsIGdyYW5kX2NvbnN1bWVfbnIsIHNl
bGZfbnIsIGNoaWxkX25yOwogCXN0cnVjdCBydXNhZ2UgcnU7CgotCXRzdF9wYXJzZV9vcHRzKGFy
Z2MsIGFyZ3YsIGNoaWxkX29wdGlvbnMsIHVzYWdlKTsKLQotCXNldHVwKCk7Ci0KLQlmb3IgKGxj
ID0gMDsgVEVTVF9MT09QSU5HKGxjKTsgbGMrKykgewotCQl0c3RfY291bnQgPSAwOwotCi0JCWlm
IChvcHRfY29uc3VtZSkgewotCQkJY29uc3VtZV9uciA9IFNBRkVfU1RSVE9MKGNsZWFudXAsCi0J
CQkJCQkgY29uc3VtZV9zdHIsIDAsIExPTkdfTUFYKTsKLQkJCXRzdF9yZXNtKFRJTkZPLCAiY2hp
bGQgYWxsb2NhdGUgJWxkTUIiLCBjb25zdW1lX25yKTsKLQkJCWNvbnN1bWUoY29uc3VtZV9ucik7
Ci0JCX0KKwl0c3RfcmVpbml0KCk7CgotCQlpZiAob3B0X2dyYW5kKSB7Ci0JCQlncmFuZF9jb25z
dW1lX25yID0gU0FGRV9TVFJUT0woY2xlYW51cCwKLQkJCQkJCSAgICAgICBncmFuZF9jb25zdW1l
X3N0ciwgMCwKLQkJCQkJCSAgICAgICBMT05HX01BWCk7Ci0JCQl0c3RfcmVzbShUSU5GTywgImdy
YW5kY2hpbGQgYWxsb2NhdGUgJWxkTUIiLAotCQkJCSBncmFuZF9jb25zdW1lX25yKTsKLQkJCXN3
aXRjaCAocGlkID0gZm9yaygpKSB7Ci0JCQljYXNlIC0xOgotCQkJCXRzdF9icmttKFRCUk9LLCBj
bGVhbnVwLCAiZm9yayIpOwotCQkJY2FzZSAwOgotCQkJCWNvbnN1bWUoZ3JhbmRfY29uc3VtZV9u
cik7Ci0JCQkJZXhpdCgwKTsKLQkJCWRlZmF1bHQ6Ci0JCQkJYnJlYWs7Ci0JCQl9Ci0JCQl3aGls
ZSAod2FpdHBpZCgtMSwgJnBpZCwgV1VOVFJBQ0VEIHwgV0NPTlRJTlVFRCkgPiAwKQotCQkJCWlm
IChXRVhJVFNUQVRVUyhwaWQpICE9IDApCi0JCQkJCXRzdF9icmttKFRCUk9LIHwgVEVSUk5PLCBj
bGVhbnVwLAotCQkJCQkJICJjaGlsZCBleGl0IHN0YXR1cyBpcyBub3QgMCIpOworCWlmICghc3Ry
Y21wKGFyZ3ZbMV0sICJjb25zdW1lIikpIHsKKwkJY29uc3VtZV9uciA9IFNBRkVfU1RSVE9MKGFy
Z3ZbMl0sIDAsIExPTkdfTUFYKTsKKwkJY29uc3VtZShjb25zdW1lX25yKTsKKwl9CisJZWxzZSBp
ZiAoIXN0cmNtcChhcmd2WzFdLCAiZ3JhbmRfY29uc3VtZSIpKSB7CisJCWdyYW5kX2NvbnN1bWVf
bnIgPSBTQUZFX1NUUlRPTChhcmd2WzJdLCAwLCBMT05HX01BWCk7CisKKwkJcGlkID0gZm9yaygp
OworCQlpZiAocGlkID09IC0xKQorCQkJdHN0X2JyayhUQlJPSywgImZvcmsgZmFpbGVkIik7CisJ
CWVsc2UgaWYgKHBpZCA9PSAwKSB7CisJCQljb25zdW1lKGdyYW5kX2NvbnN1bWVfbnIpOworCQkJ
ZXhpdCgwKTsKIAkJfQoKLQkJaWYgKG9wdF9zaG93KSB7Ci0JCQlTQUZFX0dFVFJVU0FHRShjbGVh
bnVwLCBSVVNBR0VfU0VMRiwgJnJ1KTsKLQkJCW1heHJzc19zZWxmID0gcnUucnVfbWF4cnNzOwot
CQkJU0FGRV9HRVRSVVNBR0UoY2xlYW51cCwgUlVTQUdFX0NISUxEUkVOLCAmcnUpOwotCQkJbWF4
cnNzX2NoaWxkcmVuID0gcnUucnVfbWF4cnNzOwotCQkJdHN0X3Jlc20oVElORk8sICJleGVjLnNl
bGYgPSAlbGQsIGV4ZWMuY2hpbGRyZW4gPSAlbGQiLAotCQkJCSBtYXhyc3Nfc2VsZiwgbWF4cnNz
X2NoaWxkcmVuKTsKLQkJCWlmIChvcHRfc2VsZikgewotCQkJCXNlbGZfbnIgPSBTQUZFX1NUUlRP
TChjbGVhbnVwLAotCQkJCQkJICAgICAgc2VsZl9zdHIsIDAsIExPTkdfTUFYKTsKLQkJCQlkZWx0
YSA9IG1heHJzc19zZWxmIC0gc2VsZl9ucjsKLQkJCQlpZiAoZGVsdGEgPj0gLURFTFRBX01BWCAm
JiBkZWx0YSA8PSBERUxUQV9NQVgpCi0JCQkJCXRzdF9yZXNtKFRQQVNTLAotCQkJCQkJICJpbml0
aWFsLnNlbGYgfj0gZXhlYy5zZWxmIik7Ci0JCQkJZWxzZQotCQkJCQl0c3RfcmVzbShURkFJTCwK
LQkJCQkJCSAiaW5pdGlhbC5zZWxmICF+PSBleGVjLnNlbGYiKTsKLQkJCX0KLQkJCWlmIChvcHRf
Y2hpbGQpIHsKLQkJCQljaGlsZF9uciA9IFNBRkVfU1RSVE9MKGNsZWFudXAsCi0JCQkJCQkgICAg
ICAgY2hpbGRfc3RyLCAwLCBMT05HX01BWCk7Ci0JCQkJZGVsdGEgPSBtYXhyc3NfY2hpbGRyZW4g
LSBjaGlsZF9ucjsKLQkJCQlpZiAoZGVsdGEgPj0gLURFTFRBX01BWCAmJiBkZWx0YSA8PSBERUxU
QV9NQVgpCi0JCQkJCXRzdF9yZXNtKFRQQVNTLAotCQkJCQkJICJpbml0aWFsLmNoaWxkcmVuIH49
IGV4ZWMuY2hpbGRyZW4iKTsKLQkJCQllbHNlCi0JCQkJCXRzdF9yZXNtKFRGQUlMLAotCQkJCQkJ
ICJpbml0aWFsLmNoaWxkcmVuICF+PSBleGVjLmNoaWxkcmVuIik7Ci0JCQl9Ci0JCX0KKwkJdHN0
X3JlYXBfY2hpbGRyZW4oKTsKIAl9CisJZWxzZSBpZiAoIXN0cmNtcChhcmd2WzFdLCAiY29tcGFy
ZSIpKSB7CisJCXNlbGZfbnIgPSBTQUZFX1NUUlRPTChhcmd2WzJdLCAwLCBMT05HX01BWCk7CisJ
CWNoaWxkX25yID0gU0FGRV9TVFJUT0woYXJndlszXSwgMCwgTE9OR19NQVgpOwoKLQljbGVhbnVw
KCk7Ci0JdHN0X2V4aXQoKTsKLX0KLQotc3RhdGljIHZvaWQgdXNhZ2Uodm9pZCkKLXsKLQlwcmlu
dGYoIiAgLW4gTlVNICBjb25zdW1lIE5VTSBNQiBzaXplXG4iKTsKLQlwcmludGYoIiAgLWcgTlVN
ICBncmFuZGNoaWxkIGNvbnN1bWUgTlVNIE1CIHNpemVcbiIpOwotCXByaW50ZigiICAtdiAgICAg
IHZlcmJvc2UgbW9kZSwgc2hvdyBydXNhZ2UgaW5mb1xuIik7Ci0JcHJpbnRmKCIgIC1zIE5VTSAg
Y29tcGFyZSBydXNhZ2Vfc2VsZi5tYXhyc3Mgd2l0aCBnaXZlbiBOVU1cbiIpOwotCXByaW50Zigi
ICAtbCBOVU0gIGNvbXBhcmUgcnVzYWdlX2NoaWxkcmVuLm1heHJzcyB3aXRoIGdpdmVuIE5VTVxu
Iik7Ci19Ci0KLXN0YXRpYyB2b2lkIGNvbnN1bWUoaW50IG1lZ2EpCi17Ci0Jc2l6ZV90IHN6Owot
CXZvaWQgKnB0cjsKKwkJU0FGRV9HRVRSVVNBR0UoUlVTQUdFX1NFTEYsICZydSk7CisJCW1heHJz
c19zZWxmID0gcnUucnVfbWF4cnNzOworCQlTQUZFX0dFVFJVU0FHRShSVVNBR0VfQ0hJTERSRU4s
ICZydSk7CisJCW1heHJzc19jaGlsZHJlbiA9IHJ1LnJ1X21heHJzczsKCi0Jc3ogPSBtZWdhICog
MTAyNCAqIDEwMjQ7Ci0JcHRyID0gU0FGRV9NQUxMT0MoY2xlYW51cCwgc3opOwotCW1lbXNldChw
dHIsIDAsIHN6KTsKLX0KLQotc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKLXsKLQl0c3Rfc2lnKEZP
UkssIERFRl9IQU5ETEVSLCBjbGVhbnVwKTsKLQotCVRFU1RfUEFVU0U7Ci19CisJCWlmICghaXNf
aW5fZGVsdGEobWF4cnNzX3NlbGYgLSBzZWxmX25yKSB8fCAhaXNfaW5fZGVsdGEobWF4cnNzX2No
aWxkcmVuIC0gY2hpbGRfbnIpKQorCQkJdHN0X2JyayhUQlJPSywgImNoZWNrIHRoYXQgaW5pdGlh
bC5zZWxmIH49IGV4ZWMuc2VsZiwgaW5pdGlhbC5jaGlsZHJlbiB+PSBleGVjLmNoaWxkcmVuIik7
CisJfQoKLXN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKLXsKKwlyZXR1cm4gMDsKIH0KLS0KMi4x
Ny4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
