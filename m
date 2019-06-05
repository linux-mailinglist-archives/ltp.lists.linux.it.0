Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94335F3C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:28:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CD5C3EA6FE
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:28:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BC0A03EA678
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:28:30 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A374460084B
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:28:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 775CBAE84;
 Wed,  5 Jun 2019 14:28:29 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  5 Jun 2019 16:28:24 +0200
Message-Id: <20190605142824.28921-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/preadv203: Fix two bugs
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

U2luY2UgY29tbWl0OgoKY29tbWl0IGQ3ZGRiZTExMzRjZjgyNTE2Mzk5MmE2YTc2MTM2MGQzZWQ5
ODk3ZTIKQXV0aG9yOiBNdXJwaHkgWmhvdSA8amVuY2NlLmtlcm5lbEBnbWFpbC5jb20+CkRhdGU6
ICAgV2VkIEp1biA1IDEzOjMzOjEyIDIwMTkgKzA4MDAKCiAgICBzeXNjYWxscy9wcmVhZHYyL3By
ZWFkdjIwMzogc2V0IG1vdW50X2RldmljZSBmbGFnCgpUaGUgdGVzdCB3b3VsZCBmYWlsIGluIHR3
byBkaWZmZXJlbnQgd2F5cy4KCkZpcnN0IG9mIGFsbCBvbiBzdWJzZXQgb2YgZmlsZXN5c3RlbSB0
aGUgdGVzdCB3aWxsIGVuZCB1cCB3aXRoIFRCUk9LCmJlY2F1c2UgcHJlYWR2MiByZXR1cm5zIEVP
UE5PVFNVUCBmb3IgdGhlIFJXRl9OT1dBSVQgZmxhZy4KClNlY29uZGx5IHRoZSBzaXplIG9mIHRo
ZSB3cml0dGVuIGRhdGEgaXMgdG9vIGNsb3NlIHRvIHRoZSBkZWZhdWx0CnRlc3QgYmxvY2sgZGV2
aWNlIHNpemUgYW5kIGRvZXMgbm90IGxlYXZlIGVub3VnaCBzcGFjZSBmb3IgbWV0YWRhdGEuIFdl
CmVzY2FwZWQgdGhhdCBsaW1pdGF0aW9uIGJ5IHVzaW5nIHRoZSAvdG1wLyBpbnN0ZWFkIHByZXZp
b3VzbHkuCgpBbnl3YXlzIHRoaXMgaXMgaW50ZW5kZWQgYXMgZmFzdCBmaXggZm9yIHRoZSB0ZXN0
LCBJIG5lZWQgdG8gcmVldmFsdWF0ZQppdCBsYXRlciBvbiwgYmVjYXVzZSBJJ3ZlIGJlZW4gdGVz
dGluZyB0aGUgY2FsbCBvbmx5IG9uIGV4dDQgZHVlIHRvIG15CnNpbGx5IG1pc3Rha2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4KQ0M6IE11cnBoeSBaaG91
IDxqZW5jY2Uua2VybmVsQGdtYWlsLmNvbT4KQ0M6IFhpYW8gWWFuZyA8eWFuZ3guanlAY24uZnVq
aXRzdS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIw
My5jIHwgMTggKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvcHJlYWR2Mi9wcmVhZHYyMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2
Mi9wcmVhZHYyMDMuYwppbmRleCBlNGY2OGE1MWIuLjkxNjE4ZjVmNSAxMDA2NDQKLS0tIGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jCisrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwpAQCAtNTAsNyArNTAsNyBAQAog
I2RlZmluZSBDSFVOS19TWiA0MTIzCiAjZGVmaW5lIENIVU5LUyA2MAogI2RlZmluZSBNTlRQT0lO
VCAibW50cG9pbnQiCi0jZGVmaW5lIEZJTEVTIDEwMDAKKyNkZWZpbmUgRklMRVMgNTAwCiAKIHN0
YXRpYyBpbnQgZmRzW0ZJTEVTXTsKIApAQCAtMjI1LDYgKzIyNSwxOSBAQCBzdGF0aWMgdm9pZCB2
ZXJpZnlfcHJlYWR2Mih2b2lkKQogCQl0c3RfcmVzKFRGQUlMLCAiSGF2ZW4ndCBnb3QgRUFHQUlO
Iik7CiB9CiAKK3N0YXRpYyB2b2lkIGNoZWNrX3ByZWFkdjJfbm93YWl0KGludCBmZCkKK3sKKwlj
aGFyIGJ1ZlsxXTsKKwlzdHJ1Y3QgaW92ZWMgaW92ZWNbXSA9IHsKKwkJe2J1Ziwgc2l6ZW9mKGJ1
Zil9LAorCX07CisKKwlURVNUKHByZWFkdjIoZmQsIGlvdmVjLCAxLCAwLCBSV0ZfTk9XQUlUKSk7
CisKKwlpZiAoVFNUX0VSUiA9PSBFT1BOT1RTVVBQKQorCQl0c3RfYnJrKFRDT05GIHwgVEVSUk5P
LCAicHJlYWR2MigpIik7Cit9CisKIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiB7CiAJY2hhciBw
YXRoWzEwMjRdOwpAQCAtMjM3LDYgKzI1MCw5IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiAK
IAkJZmRzW2ldID0gU0FGRV9PUEVOKHBhdGgsIE9fUkRXUiB8IE9fQ1JFQVQsIDA2NDQpOwogCisJ
CWlmIChpID09IDApCisJCQljaGVja19wcmVhZHYyX25vd2FpdChmZHNbaV0pOworCiAJCWZvciAo
aiA9IDA7IGogPCBDSFVOS1M7IGorKykgewogCQkJbWVtc2V0KGJ1ZiwgJzAnICsgaiwgc2l6ZW9m
KGJ1ZikpOwogCQkJU0FGRV9XUklURSgxLCBmZHNbaV0sIGJ1Ziwgc2l6ZW9mKGJ1ZikpOwotLSAK
Mi4xOS4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
