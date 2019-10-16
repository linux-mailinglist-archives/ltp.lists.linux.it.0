Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08010D8A6B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:01:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3C4B3C2095
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:01:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8D4853C14F6
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:01:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 62D37200B39
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:01:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C08373001571;
 Wed, 16 Oct 2019 08:01:51 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6997760166;
 Wed, 16 Oct 2019 08:01:50 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 16:01:46 +0800
Message-Id: <20191016080146.18657-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 16 Oct 2019 08:01:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] include: undefine _LINUX_TYPES_H if including old
 sys/capability.h
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SW4gc29tZSBvZiB0aGUgbGliY2FwLWRldmVsKDEuOTZ+Mi4xNikgdmVyc2lvbnMsIGl0IGRlZmlu
ZXMgdGhlIF9MSU5VWF9UWVBFU19ICm1hY3JvIHRoYXQgbWFrZXMgbHRwLWxpYiBjYW4gbm90IGlu
Y2x1ZGUgbGludXgvdHlwZXMuaCBlc3NlbnRpYWxseS4KCiAgICAjIGNhdCAtbiAvdXNyL2luY2x1
ZGUvc3lzL2NhcGFiaWxpdHkuaAogICAgLi4uCiAgICAyNSAgLyoKICAgIDI2ICAgKiBNYWtlIHN1
cmUgd2UgY2FuIGJlIGluY2x1ZGVkIGZyb20gdXNlcmxhbmQgYnkgcHJldmVudGluZwogICAgMjcg
ICAqIGNhcGFiaWxpdHkuaCBmcm9tIGluY2x1ZGluZyBvdGhlciBrZXJuZWwgaGVhZGVycwogICAg
MjggICAqLwogICAgMjkgICNkZWZpbmUgX0xJTlVYX1RZUEVTX0gKClRvIGdldCByaWQgb2YgdGhp
cyBjb21waWxpbmcgZXJyb3JzIG9uIHJoZWw2KGxpYmNhcC1kZXZlbC0yLjE2KSBzZXJpZXMgcGxh
dGZvcm0sCmhlcmUgdW5kZWZpbmUgX0xJTlVYX1RZUEVTX0ggaWYgdGVzdCBpbmNsdWRlZCB0aGF0
IG9sZCBzeXMvY2FwYWJpbGl0eS5oLgoKICA9PSBFcnJvciBsb2cgPT0KICBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gLi4vaW5jbHVkZS90c3RfbmV0bGluay5oOjI2LAogICAgICAgICAgICAgICAgIGZy
b20gdHN0X2NyeXB0by5jOjEzOgogIC91c3IvaW5jbHVkZS9saW51eC9uZXRsaW5rLmg6NDU6IGVy
cm9yOiBleHBlY3RlZCBzcGVjaWZpZXItcXVhbGlmaWVyLWxpc3QgYmVmb3JlIOKAmF9fdTE24oCZ
CiAgL3Vzci9pbmNsdWRlL2xpbnV4L25ldGxpbmsuaDoxMzU6IGVycm9yOiBleHBlY3RlZCBzcGVj
aWZpZXItcXVhbGlmaWVyLWxpc3QgYmVmb3JlIOKAmF9fdTE24oCZCiAgdHN0X2NyeXB0by5jOiBJ
biBmdW5jdGlvbiDigJh0c3RfY3J5cHRvX3JlY3ZfYWNr4oCZOgogIHRzdF9jcnlwdG8uYzo0Njog
ZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNn
X3NlceKAmQogIHRzdF9jcnlwdG8uYzo0NzogZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBo
YXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3R5cGXigJkKICB0c3RfY3J5cHRvLmM6NDc6IGVy
cm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhubG1zZ19z
ZXHigJkKICB0c3RfY3J5cHRvLmM6NTU6IGVycm9yOiDigJhzdHJ1Y3Qgbmxtc2doZHLigJkgaGFz
IG5vIG1lbWJlciBuYW1lZCDigJhubG1zZ190eXBl4oCZCiAgdHN0X2NyeXB0by5jOjU4OiBlcnJv
cjog4oCYc3RydWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYbmxtc2dfdHlw
ZeKAmQogIHRzdF9jcnlwdG8uYzo1ODogZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBoYXMg
bm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3NlceKAmQogIHRzdF9jcnlwdG8uYzogSW4gZnVuY3Rp
b24g4oCYdHN0X2NyeXB0b19hZGRfYWxn4oCZOgogIC4uLgogIG1ha2U6ICoqKiBbdHN0X2NyeXB0
by5vXSBFcnJvciAxCgpSZXBvcnRlZC1ieTogUGluZyBGYW5nIDxwaWZhbmdAcmVkaGF0LmNvbT4K
U2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CkNjOiBQaW5nIEZhbmcg
PHBpZmFuZ0ByZWRoYXQuY29tPgpDYzogUmljaGFyZCBQYWxldGhvcnBlIDxycGFsZXRob3JwZUBz
dXNlLmNvbT4KQWNrZWQtYnk6IFJpY2hhcmQgUGFsZXRob3JwZSA8cnBhbGV0aG9ycGVAc3VzZS5j
b20+Ci0tLQogaW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaCB8ICA4ICsrKysrKysrCiBtNC9sdHAt
Y2FwLm00ICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGFwaS9jYXBhYmlsaXR5LmggYi9pbmNsdWRlL2xhcGkvY2FwYWJpbGl0eS5oCmluZGV4IGRhYzIz
M2Q4NC4uODgzM2YwNjA1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xhcGkvY2FwYWJpbGl0eS5oCisr
KyBiL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmgKQEAgLTEwLDYgKzEwLDE0IEBACiAKICNpZmRl
ZiBIQVZFX1NZU19DQVBBQklMSVRZX0gKICMgaW5jbHVkZSA8c3lzL2NhcGFiaWxpdHkuaD4KKy8q
KgorICogU29tZSBvbGQgbGliY2FwLWRldmVsKDEuOTZ+Mi4xNikgZGVmaW5lIF9MSU5VWF9UWVBF
U19IIGluCisgKiBzeXMvY2FwYWJpbGl0eS5oIHRoYXQgbWFrZXMgbHRwLWxpYiBjYW5uJ3QgaW5j
bHVkZSBsaW51eC90eXBlcy5oCisgKiBlc3NlbnRpYWxseS4gSGVyZSB1bmRlZmluZSBpdCBpZiBp
bmNsdWRlIHN1Y2ggb2xkIGhlYWRlci1maWxlLgorICovCisjIGlmbmRlZiBIQVZFX05FV0VSX0xJ
QkNBUAorIyAgdW5kZWYgX0xJTlVYX1RZUEVTX0gKKyMgZW5kaWYKICNlbmRpZgogCiAjaWZuZGVm
IENBUF9ORVRfUkFXCmRpZmYgLS1naXQgYS9tNC9sdHAtY2FwLm00IGIvbTQvbHRwLWNhcC5tNApp
bmRleCAwMmQzY2FjOGMuLjQ5ODFlODQzZCAxMDA2NDQKLS0tIGEvbTQvbHRwLWNhcC5tNAorKysg
Yi9tNC9sdHAtY2FwLm00CkBAIC0xLDYgKzEsNiBAQAogZG5sIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCiBkbmwgQ29weXJpZ2h0IChjKSBDaXNjbyBTeXN0ZW1zIElu
Yy4sIDIwMDkKLWRubCBDb3B5cmlnaHQgKGMpIExpbnV4IFRlc3QgUHJvamVjdCwgMjAxMAorZG5s
IENvcHlyaWdodCAoYykgTGludXggVGVzdCBQcm9qZWN0LCAyMDE5CiBkbmwgQXV0aG9yOiBOZ2ll
IENvb3BlciA8eWFuZXVyYWJleWFAZ21haWwuY29tPgogCiBBQ19ERUZVTihbTFRQX0NIRUNLX0NB
UEFCSUxJVFlfU1VQUE9SVF0sWwpAQCAtMTQsNCArMTQsMTkgQEAgaWYgdGVzdCAieCRjYXBfbGli
cyIgIT0geDsgdGhlbgogCUFDX0RFRklORShIQVZFX0xJQkNBUCkKIGZpCiBBQ19TVUJTVChDQVBf
TElCUywkY2FwX2xpYnMpCisKK0FIX1RFTVBMQVRFKEhBVkVfTkVXRVJfTElCQ0FQLAorW0RlZmlu
ZSB0byAxIGlmIHlvdSBoYXZlIG5ld2VyIGxpYmNhcC0yIGluc3RhbGxlZC5dKQorQUNfQ09NUElM
RV9JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFsKKyNpbmNsdWRlIDxzeXMvY2FwYWJpbGl0eS5oPgor
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CitpbnQgbWFpbih2b2lkKSB7CisJX191MTYgYTsKKwlf
X3UzMiBiOworCXJldHVybiAwOworfV0pXSxbaGFzX25ld2VyX2xpYmNhcD0ieWVzIl0pCisKK2lm
IHRlc3QgIngkaGFzX25ld2VyX2xpYmNhcCIgPSB4eWVzOyB0aGVuCisJQUNfREVGSU5FKEhBVkVf
TkVXRVJfTElCQ0FQKQorZmkKIF0pCi0tIAoyLjIwLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
