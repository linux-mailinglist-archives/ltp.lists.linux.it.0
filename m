Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C932388E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:25:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC15E3C4E74
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:25:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9E00F3C2AA4
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:25:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BAE0B1A01116
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614155107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gKw3n2kb/PGB9UlTX9OMJGwK+VgGbKpsM1G7Bo5hL8c=;
 b=PZd6hDnjCIUiQWLv1+hq8ToX3Ek9e0UZEunckfWT/TQAt2xz+o/RIF3DUMLXYL9OZMRVUo
 MZdzxMDEIz2FlO1UO/jncvViXcAhDx4dUrlhsyRutjGon64/wEjyCP4i32NWnythy5G8nN
 MjuV3Lq0e5N3FJZg6NJRhFWEsoLpQ/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-HM6yxFlyNMGAvlcRkP0OBQ-1; Wed, 24 Feb 2021 03:25:04 -0500
X-MC-Unique: HM6yxFlyNMGAvlcRkP0OBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C567B1936B73;
 Wed, 24 Feb 2021 08:25:03 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 256A219C79;
 Wed, 24 Feb 2021 08:25:01 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 24 Feb 2021 08:25:00 +0000
Message-Id: <20210224082500.18106-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] swapping01: check memory swap usage per process
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

SXNzdWU6CgpDdXJyZW50bHkgdGVzdCBzd2FwcGluZzAxIHJlYWQgdGhlIHN5c3RlbSBGcmVlU3dh
cCBmb3IgY291bnRpbmcgdXNhZ2Ugb2YKc3dhcC1zaXplLCB0aGF0J3Mgbm90IHByZWNpc2Ugb24g
c3lzdGVtIGVzcGVjaWFsbHkgd2l0aCBlYXRpbmctbWVtb3J5IGRhZW1vbgppbiB0aGUgYmFja2dy
b3VuZC4KCkltcHJvdmVtZW50OgoKQ29uc2lkZXJpbmcgdGhhdCBzd2FwIG91dCB1bnJlZmVyZW5j
ZWQgcGFnZXMgYWxzbyBjb3VsZCBiZSBvY2N1cnJlZCBpbiBhCnNpbmdsZSBwcm9jZXNzLiBTbyB0
aGF0IHdlIGVuY2Fwc3VsYXRlIGFsbCBvZiB0aGUgbWVhbnMgaW4gYSBzaW5nbGUgcHJvY2Vzcwp0
byBhdm9pZCBpbnZvbHZpbmcgdGhlIHdob2xlIHN5c3RlbSBzd2FwLWNvdW50aW5nLiBUaGVuIG9u
bHkgdHJ5IHRvIGNoZWNrIHRoZQonVm1Td2FwJyBpbiBwcm9jL1BJRC9zdGF0dXPCoHBlciBwcm9j
ZXNzLCB0byBnZXQgcmlkIG9mwqB0aGUgcG90ZW50aWFsIGluZmx1ZW5jZQpmcm9twqBvdGhlciBw
cm9jZXNzZXPCoHdoaWNoIGVhc2lseSBsZWFkcyB0byBmYWxzZSBwb3NpdGl2ZS4gIGUuZy4KCkNo
aWxkOgogICAgICAgICB0b3VjaCB1bnJlZmVyZW5jZWQgcGFnZXMgKHZpYSBhbGxvYyZ3cml0ZSZm
cmVlIDEuMypNZW1BdmFpbGFibGUpIFsxXQogICAgICAgICBhbGxvYyZ3aXJ0ZSAxLjMqTWVtQXZh
aWxhYmxlCiAgICAgICAgIHJhaXNlKFNJR1NUT1ApCiAgICAgICAgIC4uLgpQYXJlbnQ6CiAgICAg
ICAgIHdhaXRpbmcgZm9yIGNoaWxkIHN1c3BlbnNpb24KICAgICAgICAgY2hlY2sgY2hpbGQncyBW
bVN3YXAgdG8gc2VlIGlmIGhlYXZ5LXN3YXAgb2NjdXJzIGluIGEgcHJvY2VzcwogICAgICAgICAu
Li4KClsxXSBBcyB0byBwZXJmb3JtIGFsbG9jJndyaXRlJmZyZWUsIHRoZSBzeXN0ZW0gcGFnZXMg
d2lsbCBnbyB0aHJvdWdoIGEKY29tcGxldGVkIGxpZmUgY3ljbGUgZnJvbSBidWRkeS1zeXN0ZW0g
dG8gYWN0aXZlLWxpc3QgdG8gaW5hY3RpdmUtbGlzdAp0aGVuIGJhY2sgdG8gYnVkZHktc3lzdGVt
LCB3aGljaCByZWZsZWN0IHRvIGEgcGFnZSBzdGF0dXMgaXMgdGhlb3JldGljYWxseSBsaWtlOgoi
aW5hY3RpdmUsdW5yZWZlcmVuY2VkIC0+IGFjdGl2ZSxyZWZlcmVuY2VkIC0+IC4uLiAtPmluYWN0
aXZlLHVucmVmZXJlbmNlZCIKc28gdGhhdCB3aWxsIGhlbHBmdWwgdG8gcHJvZHVjZSB3aGF0IHRo
ZSBrZXJuZWwgdGFyZ2V0IGNvbW1pdCBmaXhlZCBzaXR1YXRpb24uCgpOZXcgcmVwcm9kdWNlciB3
b3JrcyB3ZWxsIHdpdGggdW5maXgta2VybmVsOgoKICAjIHVuYW1lICAtcgogIDIuNi4zOQoKICAj
IC4vc3dhcHBpbmcwMQogIHRzdF90ZXN0LmM6MTI2MzogVElORk86IFRpbWVvdXQgcGVyIHJ1biBp
cyAwaCAwNW0gMDBzCiAgc3dhcHBpbmcwMS5jOjExMDogVElORk86IGF2YWlsYWJsZSBwaHlzaWNh
bCBtZW1vcnk6IDE4OTYgTUIKICBzd2FwcGluZzAxLmM6MTEzOiBUSU5GTzogdHJ5IHRvIGFsbG9j
YXRlOiAyNDY2IE1CCiAgc3dhcHBpbmcwMS5jOjE0ODogVEZBSUw6IGhlYXZ5IHN3YXBwaW5nIGRl
dGVjdGVkOiAxOTA1IE1CIHN3YXBwZWQuCgpTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdA
cmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL21lbS9zd2FwcGluZy9zd2FwcGluZzAx
LmMgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9t
ZW0vc3dhcHBpbmcvc3dhcHBpbmcwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc3dhcHBpbmcv
c3dhcHBpbmcwMS5jCmluZGV4IDgxMDZmNjQ2Ni4uNjZmYzY1Y2JlIDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL21lbS9zd2FwcGluZy9zd2FwcGluZzAxLmMKKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9tZW0vc3dhcHBpbmcvc3dhcHBpbmcwMS5jCkBAIC01Myw3ICs1Myw3IEBACiAjZGVmaW5l
IENPRV9TTElHSFRfT1ZFUiAwLjMKIAogc3RhdGljIHZvaWQgaW5pdF9tZW1pbmZvKHZvaWQpOwot
c3RhdGljIHZvaWQgZG9fYWxsb2Modm9pZCk7CitzdGF0aWMgdm9pZCBkb19hbGxvYyhpbnQgYWxs
b3dfcmFpc2UpOwogc3RhdGljIHZvaWQgY2hlY2tfc3dhcHBpbmcodm9pZCk7CiAKIHN0YXRpYyBs
b25nIG1lbV9hdmFpbGFibGVfaW5pdDsKQEAgLTcyLDcgKzcyLDggQEAgc3RhdGljIHZvaWQgdGVz
dF9zd2FwcGluZyh2b2lkKQogCiAJc3dpdGNoIChwaWQgPSBTQUZFX0ZPUksoKSkgewogCQljYXNl
IDA6Ci0JCQlkb19hbGxvYygpOworCQkJZG9fYWxsb2MoMCk7CisJCQlkb19hbGxvYygxKTsKIAkJ
CWV4aXQoMCk7CiAJCWRlZmF1bHQ6CiAJCQljaGVja19zd2FwcGluZygpOwpAQCAtOTksMjAgKzEw
MCwyMyBAQCBzdGF0aWMgdm9pZCBpbml0X21lbWluZm8odm9pZCkKIAkJCQlzd2FwX2ZyZWVfaW5p
dCwgbWVtX292ZXJfbWF4KTsKIH0KIAotc3RhdGljIHZvaWQgZG9fYWxsb2Modm9pZCkKK3N0YXRp
YyB2b2lkIGRvX2FsbG9jKGludCBhbGxvd19yYWlzZSkKIHsKIAlsb25nIG1lbV9jb3VudDsKIAl2
b2lkICpzOwogCi0JdHN0X3JlcyhUSU5GTywgImF2YWlsYWJsZSBwaHlzaWNhbCBtZW1vcnk6ICVs
ZCBNQiIsCi0JCW1lbV9hdmFpbGFibGVfaW5pdCAvIDEwMjQpOworCWlmIChhbGxvd19yYWlzZSA9
PSAxKQorCQl0c3RfcmVzKFRJTkZPLCAiYXZhaWxhYmxlIHBoeXNpY2FsIG1lbW9yeTogJWxkIE1C
IiwKKwkJCQltZW1fYXZhaWxhYmxlX2luaXQgLyAxMDI0KTsKIAltZW1fY291bnQgPSBtZW1fYXZh
aWxhYmxlX2luaXQgKyBtZW1fb3ZlcjsKLQl0c3RfcmVzKFRJTkZPLCAidHJ5IHRvIGFsbG9jYXRl
OiAlbGQgTUIiLCBtZW1fY291bnQgLyAxMDI0KTsKKwlpZiAoYWxsb3dfcmFpc2UgPT0gMSkKKwkJ
dHN0X3JlcyhUSU5GTywgInRyeSB0byBhbGxvY2F0ZTogJWxkIE1CIiwgbWVtX2NvdW50IC8gMTAy
NCk7CiAJcyA9IFNBRkVfTUFMTE9DKG1lbV9jb3VudCAqIDEwMjQpOwogCW1lbXNldChzLCAxLCBt
ZW1fY291bnQgKiAxMDI0KTsKLQl0c3RfcmVzKFRJTkZPLCAibWVtb3J5IGFsbG9jYXRlZDogJWxk
IE1CIiwgbWVtX2NvdW50IC8gMTAyNCk7Ci0JaWYgKHJhaXNlKFNJR1NUT1ApID09IC0xKQorCWlm
ICgoYWxsb3dfcmFpc2UgPT0gMSkgJiYgKHJhaXNlKFNJR1NUT1ApID09IC0xKSkgeworCQl0c3Rf
cmVzKFRJTkZPLCAibWVtb3J5IGFsbG9jYXRlZDogJWxkIE1CIiwgbWVtX2NvdW50IC8gMTAyNCk7
CiAJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sICJraWxsIik7CisJfQogCWZyZWUocyk7CiB9CiAK
QEAgLTEzNyw4ICsxNDEsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19zd2FwcGluZyh2b2lkKQogCQlp
Kys7CiAJfQogCi0Jc3dhcF9mcmVlX25vdyA9IFNBRkVfUkVBRF9NRU1JTkZPKCJTd2FwRnJlZToi
KTsKLQlzd2FwcGVkID0gc3dhcF9mcmVlX2luaXQgLSBzd2FwX2ZyZWVfbm93OworCXN3YXBwZWQg
PSBTQUZFX1JFQURfUFJPQ19TVEFUVVMocGlkLCAiVm1Td2FwOiIpOwogCWlmIChzd2FwcGVkID4g
bWVtX292ZXJfbWF4KSB7CiAJCWtpbGwocGlkLCBTSUdDT05UKTsKIAkJdHN0X2JyayhURkFJTCwg
ImhlYXZ5IHN3YXBwaW5nIGRldGVjdGVkOiAiCi0tIAoyLjIxLjMKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
