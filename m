Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1446B49
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 22:54:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF187294B1F
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 22:54:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8056A294B21
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 22:54:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E5EF91A00E06
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 22:54:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE24688302
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 20:54:14 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F185C5DF
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 20:54:14 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 14 Jun 2019 22:54:03 +0200
Message-Id: <5a3aa7c62c69fdd2de19adf97ec070cd87ba6ce8.1560545529.git.jstancek@redhat.com>
In-Reply-To: <67bee9aca637a86b8101b122d149094b50397553.1560545529.git.jstancek@redhat.com>
References: <67bee9aca637a86b8101b122d149094b50397553.1560545529.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 14 Jun 2019 20:54:14 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] mtest06: fix timestamp in output
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

UHJldmlvdXMgdmVyc2lvbiBhc3N1bWVkIHRoYXQgZWFjaCBpdGVyYXRpb24gaXMgfjMgc2Vjb25k
cyBsb25nLApldmVuIGlmIGl0IHRha2VzIGEgbG90IGxvbmdlci4KClNpZ25lZC1vZmYtYnk6IEph
biBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvbWVt
L210ZXN0MDYvbW1hcDEuYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvbWVtL210ZXN0MDYvbW1hcDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL210
ZXN0MDYvbW1hcDEuYwppbmRleCA1MGQyZGFmYmQ5NTIuLmUxNjM1N2UzYzc5NSAxMDA2NDQKLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vbXRlc3QwNi9tbWFwMS5jCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvbWVtL210ZXN0MDYvbW1hcDEuYwpAQCAtMjE4LDkgKzIxOCw5IEBAIHN0YXRpYyB2b2lk
IHNldHVwKHZvaWQpCiBzdGF0aWMgdm9pZCBydW4odm9pZCkKIHsKIAlwdGhyZWFkX3QgdGhpZFsy
XTsKLQlpbnQgcmVtYWluaW5nID0gdHN0X3RpbWVvdXRfcmVtYWluaW5nKCk7Ci0JaW50IGVsYXBz
ZWQgPSAwOworCWludCBzdGFydCwgbGFzdF91cGRhdGU7CiAKKwlzdGFydCA9IGxhc3RfdXBkYXRl
ID0gdHN0X3RpbWVvdXRfcmVtYWluaW5nKCk7CiAJd2hpbGUgKHRzdF90aW1lb3V0X3JlbWFpbmlu
ZygpID4gU1RPUF9USFJFU0hPTEQpIHsKIAkJaW50IGZkID0gbWtmaWxlKGZpbGVfc2l6ZSk7CiAK
QEAgLTIzNiwxNCArMjM2LDE1IEBAIHN0YXRpYyB2b2lkIHJ1bih2b2lkKQogCiAJCWNsb3NlKGZk
KTsKIAotCQlpZiAocmVtYWluaW5nIC0gdHN0X3RpbWVvdXRfcmVtYWluaW5nKCkgPiBQUk9HUkVT
U19TRUMpIHsKLQkJCXJlbWFpbmluZyA9IHRzdF90aW1lb3V0X3JlbWFpbmluZygpOwotCQkJZWxh
cHNlZCArPSBQUk9HUkVTU19TRUM7Ci0JCQl0c3RfcmVzKFRJTkZPLCAiWyVkXSBtYXBwZWQ6ICVs
dSwgc2lnc2VndiBoaXQ6ICVsdSwgIgotCQkJCSJ0aHJlYWRzIHNwYXduZWQ6ICVsdSIsCWVsYXBz
ZWQsIG1hcF9jb3VudCwKLQkJCQltYXBwZWRfc2lnc2Vndl9jb3VudCwgdGhyZWFkc19zcGF3bmVk
KTsKLQkJCXRzdF9yZXMoVElORk8sICJbJWRdIHJlcGVhdGVkX3JlYWRzOiAlbGQsICIKLQkJCQki
ZGF0YV9tYXRjaGVkOiAlbHUiLCBlbGFwc2VkLCByZXBlYXRlZF9yZWFkcywKKwkJaWYgKGxhc3Rf
dXBkYXRlIC0gdHN0X3RpbWVvdXRfcmVtYWluaW5nKCkgPj0gUFJPR1JFU1NfU0VDKSB7CisJCQls
YXN0X3VwZGF0ZSA9IHRzdF90aW1lb3V0X3JlbWFpbmluZygpOworCQkJdHN0X3JlcyhUSU5GTywg
IlslMDNkXSBtYXBwZWQ6ICVsdSwgc2lnc2VndiBoaXQ6ICVsdSwgIgorCQkJCSJ0aHJlYWRzIHNw
YXduZWQ6ICVsdSIsCisJCQkJc3RhcnQgLSB0c3RfdGltZW91dF9yZW1haW5pbmcoKSwKKwkJCQlt
YXBfY291bnQsIG1hcHBlZF9zaWdzZWd2X2NvdW50LAorCQkJCXRocmVhZHNfc3Bhd25lZCk7CisJ
CQl0c3RfcmVzKFRJTkZPLCAiICAgICAgcmVwZWF0ZWRfcmVhZHM6ICVsZCwgIgorCQkJCSJkYXRh
X21hdGNoZWQ6ICVsdSIsIHJlcGVhdGVkX3JlYWRzLAogCQkJCWRhdGFfbWF0Y2hlZCk7CiAJCX0K
IAl9Ci0tIAoxLjguMy4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
