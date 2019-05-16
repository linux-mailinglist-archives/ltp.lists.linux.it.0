Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C96691FFDE
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 08:53:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9676E3EA2F8
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 08:53:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E24013EA2DC
 for <ltp@lists.linux.it>; Thu, 16 May 2019 08:53:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DA3401000DD6
 for <ltp@lists.linux.it>; Thu, 16 May 2019 08:53:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,475,1549900800"; d="scan'208";a="63298648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 May 2019 14:53:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id 4A31F4CDC83C;
 Thu, 16 May 2019 14:53:33 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 16 May 2019 14:53:33 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
Date: Thu, 16 May 2019 14:52:59 +0800
Message-ID: <1557989579-3661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190515143746.GA7507@dell5510>
References: <20190515143746.GA7507@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 4A31F4CDC83C.A0B0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v2] security: add missing
	PR_CAPBSET_READ/PR_CAPBSET_DROP check
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UFJfQ0FQQlNFVF9SRUFEL1BSX0NBUE5TRVRfRFJPUCB3YXMgYWRkZWQgc2luY2UgbGludXgyLjYu
MjUsCmN1cnJlbnQgbHRwIGRldGVjdGVkIHRoZW0gaW4gbHRwLXByY3RsLm00LCBidXQgdGhyZWUg
cGxhY2VzCm1pc3NlZCB0aGlzIGNoZWNrLiBTbyBhZGQgaXQsIGZpeCBwb3NzaWJsZSBjb21waWxl
ciBlcnJvcgpvbiBzb21lIG9sZCBkaXJ0cm9zIHdpdGhvdXQgUFJfQ0FQQlNFVF9SRUFEL1BSX0NB
UE5TRVRfRFJPUCBmbGFnLgoKU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBj
bi5mdWppdHN1LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2NhcF9ib3VuZC9l
eGVjX3dpdGhfaW5oLmMgICAgfCA0ICsrKysKIHRlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvY2Fw
X2JvdW5kL2V4ZWNfd2l0aG91dF9pbmguYyB8IDQgKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zZWN1
cml0eS9maWxlY2Fwcy92ZXJpZnlfY2Fwc19leGVjLmMgIHwgNSArKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zZWN1
cml0eS9jYXBfYm91bmQvZXhlY193aXRoX2luaC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0
eS9jYXBfYm91bmQvZXhlY193aXRoX2luaC5jCmluZGV4IGRkOWRkYjU3NC4uMTM4MTQ3OThlIDEw
MDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2NhcF9ib3VuZC9leGVjX3dpdGhf
aW5oLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9jYXBfYm91bmQvZXhlY193aXRo
X2luaC5jCkBAIC00MSw2ICs0MSw3IEBAIGludCBUU1RfVE9UQUwgPSAxOwogaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKICNpZiBIQVZFX1NZU19DQVBBQklMSVRZX0gKKyNpZiBI
QVZFX0RFQ0xfUFJfQ0FQQlNFVF9EUk9QCiAjaWZkZWYgSEFWRV9MSUJDQVAKIAlpbnQgcmV0ID0g
MTsKIAljYXBfZmxhZ192YWx1ZV90IGY7CkBAIC04NCw2ICs4NSw5IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiAjZWxzZSAvKiBIQVZFX0xJQkNBUCAqLwogCXRzdF9yZXNtKFRD
T05GLCAiU3lzdGVtIGRvZXNuJ3QgaGF2ZSBQT1NJWCBjYXBhYmlsaXRpZXMuIik7CiAjZW5kaWYK
KyNlbHNlIC8qIEhBVkVfREVDTF9QUl9DQVBCU0VUX0RST1AqLworCXRzdF9yZXNtKFRDT05GLCAi
U3lzdGVtIGRvZXNuJ3QgaGF2ZSBDQVBCU0VUIHByY3RscyIpOworI2VuZGlmCiAjZWxzZSAvKiBI
QVZFX1NZU19DQVBBQklMSVRZX0ggKi8KIAl0c3RfcmVzbShUQ09ORiwgIlN5c3RlbSBkb2Vzbid0
IGhhdmUgc3lzL2NhcGFiaWxpdHkuaC4iKTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2tlcm5lbC9zZWN1cml0eS9jYXBfYm91bmQvZXhlY193aXRob3V0X2luaC5jIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zZWN1cml0eS9jYXBfYm91bmQvZXhlY193aXRob3V0X2luaC5jCmluZGV4IDI5YjMx
MjM4YS4uMGQxM2Q0OGMzIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2Nh
cF9ib3VuZC9leGVjX3dpdGhvdXRfaW5oLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0
eS9jYXBfYm91bmQvZXhlY193aXRob3V0X2luaC5jCkBAIC00MSw2ICs0MSw3IEBAIGludCBUU1Rf
VE9UQUwgPSAxOwogaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKICNpZiBIQVZF
X1NZU19DQVBBQklMSVRZX0gKKyNpZiBIQVZFX0RFQ0xfUFJfQ0FQQlNFVF9EUk9QCiAjaWZkZWYg
SEFWRV9MSUJDQVAKIAlpbnQgcmV0ID0gMTsKIAljYXBfZmxhZ192YWx1ZV90IGY7CkBAIC04MSw2
ICs4Miw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAjZWxzZSAvKiBsaWJj
YXAgKi8KIAl0c3RfcmVzbShUQ09ORiwgIlN5c3RlbSBkb2Vzbid0IGhhdmUgUE9TSVggY2FwYWJp
bGl0aWVzLiIpOwogI2VuZGlmCisjZWxzZSAvKiBIQVZFX0RFQ0xfUFJfQ0FQQlNFVF9EUk9QICov
CisJdHN0X3Jlc20oVENPTkYsICJTeXN0ZW0gZG9lc24ndCBoYXZlIENBUEJTRVQgcHJjdGxzIik7
CisjZW5kaWYKICNlbHNlIC8qIGNhcGFiaWxpdHlfaCAqLwogCXRzdF9yZXNtKFRDT05GLCAiU3lz
dGVtIGRvZXNuJ3QgaGF2ZSBzeXMvY2FwYWJpbGl0eS5oLiIpOwogI2VuZGlmCmRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ZpbGVjYXBzL3ZlcmlmeV9jYXBzX2V4ZWMuYyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvZmlsZWNhcHMvdmVyaWZ5X2NhcHNfZXhlYy5jCmlu
ZGV4IDA5MGFjNWM5MC4uM2U2Nzk0MTAyIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3Nl
Y3VyaXR5L2ZpbGVjYXBzL3ZlcmlmeV9jYXBzX2V4ZWMuYworKysgYi90ZXN0Y2FzZXMva2VybmVs
L3NlY3VyaXR5L2ZpbGVjYXBzL3ZlcmlmeV9jYXBzX2V4ZWMuYwpAQCAtMjI2LDcgKzIyNiwxMiBA
QCBzdGF0aWMgaW50IGNhcHNfYWN0dWFsbHlfc2V0X3Rlc3Qodm9pZCkKIAlpbnQgbnVtX2NhcHM7
CiAKIAlmb3IgKG51bV9jYXBzID0gMDs7IG51bV9jYXBzKyspIHsKKyNpZiBIQVZFX0RFQ0xfUFJf
Q0FQQlNFVF9SRUFECiAJCXJldCA9IHByY3RsKFBSX0NBUEJTRVRfUkVBRCwgbnVtX2NhcHMpOwor
I2Vsc2UKKwkJdHN0X3Jlc20oVENPTkYsICJTeXN0ZW0gZG9lc24ndCBoYXZlIENBUEJTRVQgcHJj
dGxzIik7CisJCXJldCA9IC0xOworI2VuZGlmCiAJCS8qCiAJCSAqIEJyZWFrIGZyb20gdGhlIGxv
b3AgaW4gdGhpcyBtYW5uZXIgdG8gYXZvaWQgaW5jcmVtZW50aW5nLAogCQkgKiB0aGVuIGhhdmlu
ZyB0byBkZWNyZW1lbnQgdmFsdWUuCi0tIAoyLjE4LjEKCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
