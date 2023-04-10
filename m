Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04E6DC2A3
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Apr 2023 04:21:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7EA23CC679
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Apr 2023 04:21:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3D703CA33C
 for <ltp@lists.linux.it>; Mon, 10 Apr 2023 04:21:28 +0200 (CEST)
Received: from m13115.mail.163.com (m13115.mail.163.com [220.181.13.115])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id AD5F86002A3
 for <ltp@lists.linux.it>; Mon, 10 Apr 2023 04:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=2CPNAvqUtpu/KWOiPUYKSbfrUTpQavIzGT+cQ5z7PkY=; b=U
 g0cFILvB+1cbanyel8/6Q1sk+dEZgMM3lM7nRWkBJQDSXCD/AdKxOIsf1uw12ssp
 /MsegQhD1ygHyvqYUmP6TiJ04HN10HO3ZsdT8sScEbu6K4BYUpafkVW54/3a9qqP
 rVAtXQIgUqlszmDwKSGn+jQ9MWL4AIaS84vGKhCv74=
Received: from crawler2015$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr115 (Coremail) ; Mon, 10 Apr 2023 10:21:23 +0800 (CST)
X-Originating-IP: [116.128.244.169]
Date: Mon, 10 Apr 2023 10:21:23 +0800 (CST)
From: zenghao <crawler2015@163.com>
To: ltp@lists.linux.it
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
X-NTES-SC: AL_QuyTA/ySvEoj5SSdbOkXnkoTj+Y3WsW5uPQh349XP5k0qSvT/S0gZlt8GUXL0dm3FBmBlDytXzlOwNR0Q5tqeqa7MDzQ4BBNBcAstNYpGf87
MIME-Version: 1.0
Message-ID: <3620f7c2.2af5.18768f7ce86.Coremail.crawler2015@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: c8GowAAnEuyjcjNkfYYNAA--.23122W
X-CM-SenderInfo: pfud4zthusiiqv6rljoofrz/1tbiNA1LAlaECWy9nwABsk
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] Subject: [PATCH] fs/doio:Use the snprintf function to prevent
 buffer overflow
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

CkZyb20gMDQ0YTk0Mjg2M2RjMGFjODQ3MDFiYzE0ZDc4ZjRkN2ZjMGJiOGRjYiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSGFvIFplbmcgPHplbmdoYW9Aa3lsaW5vcy5jbj4KRGF0ZTog
TW9uLCAxMCBBcHIgMjAyMyAwOToxNzozNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGZzL2RvaW86
VXNlIHRoZSBzbnByaW50ZiBmdW5jdGlvbiB0byBwcmV2ZW50IGJ1ZmZlciBvdmVyZmxvdwrCoFVz
ZSB0aGUgc25wcmludGYgZnVuY3Rpb24gaW5zdGVhZCBvZiBzcHJpbnRmIGluIHRoZSB3cml0ZV9s
b2cuYyBmaWxlCsKgU2lnbmVkLW9mZi1ieTogSGFvIFplbmcgPHplbmdoYW9Aa3lsaW5vcy5jbj4K
CgotLS0KwqB0ZXN0Y2FzZXMva2VybmVsL2ZzL2RvaW8vd3JpdGVfbG9nLmMgfCAyMCArKysrKysr
KysrLS0tLS0tLS0tLQrCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9mcy9kb2lvL3dyaXRlX2xv
Zy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9mcy9kb2lvL3dyaXRlX2xvZy5jCmluZGV4IGU4ZWY5Yzdj
Yi4uODYyOTdiMDFkIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2ZzL2RvaW8vd3JpdGVf
bG9nLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9mcy9kb2lvL3dyaXRlX2xvZy5jCkBAIC0xMjks
NyArMTI5LDcgQEAgaW50IHdsb2dfb3BlbihzdHJ1Y3Qgd2xvZ19maWxlICp3ZmlsZSwgaW50IHRy
dW5jLCBpbnQgbW9kZSkKwqAJdW1hc2sob21hc2spOwrCoArCoAlpZiAod2ZpbGUtPndfYWZkID09
IC0xKSB7Ci0JCXNwcmludGYoV2xvZ19FcnJvcl9TdHJpbmcsCisJCXNucHJpbnRmKFdsb2dfRXJy
b3JfU3RyaW5nLHNpemVvZihXbG9nX0Vycm9yX1N0cmluZyksCsKgCQkJIkNvdWxkIG5vdCBvcGVu
IHdyaXRlX2xvZyAtIG9wZW4oJXMsICUjbywgJSNvKSBmYWlsZWQ6wqAgJXNcbiIsCsKgCQkJd2Zp
bGUtPndfZmlsZSwgb2ZsYWdzLCBtb2RlLCBzdHJlcnJvcihlcnJubykpOwrCoAkJcmV0dXJuIC0x
OwpAQCAtMTQxLDcgKzE0MSw3IEBAIGludCB3bG9nX29wZW4oc3RydWN0IHdsb2dfZmlsZSAqd2Zp
bGUsIGludCB0cnVuYywgaW50IG1vZGUpCsKgCsKgCW9mbGFncyA9IE9fUkRXUjsKwqAJaWYgKCh3
ZmlsZS0+d19yZmQgPSBvcGVuKHdmaWxlLT53X2ZpbGUsIG9mbGFncykpID09IC0xKSB7Ci0JCXNw
cmludGYoV2xvZ19FcnJvcl9TdHJpbmcsCisJCXNucHJpbnRmKFdsb2dfRXJyb3JfU3RyaW5nLHNp
emVvZihXbG9nX0Vycm9yX1N0cmluZyksCsKgCQkJIkNvdWxkIG5vdCBvcGVuIHdyaXRlIGxvZyAt
IG9wZW4oJXMsICUjbykgZmFpbGVkOsKgICVzXG4iLArCoAkJCXdmaWxlLT53X2ZpbGUsIG9mbGFn
cywgc3RyZXJyb3IoZXJybm8pKTsKwqAJCWNsb3NlKHdmaWxlLT53X2FmZCk7CkBAIC0yMTgsMTQg
KzIxOCwxNCBAQCBpbnQgd2xvZ19yZWNvcmRfd3JpdGUoc3RydWN0IHdsb2dfZmlsZSAqd2ZpbGUs
IHN0cnVjdCB3bG9nX3JlYyAqd3JlYywKwqAJCXJlY2xlbiArPSAyOwrCoArCoAkJaWYgKHdyaXRl
KHdmaWxlLT53X2FmZCwgd2J1ZiwgcmVjbGVuKSA9PSAtMSkgewotCQkJc3ByaW50ZihXbG9nX0Vy
cm9yX1N0cmluZywKKwkJCXNucHJpbnRmKFdsb2dfRXJyb3JfU3RyaW5nLHNpemVvZihXbG9nX0Vy
cm9yX1N0cmluZyksCsKgCQkJCSJDb3VsZCBub3Qgd3JpdGUgbG9nIC0gd3JpdGUoJXMsICVzLCAl
ZCkgZmFpbGVkOsKgICVzXG4iLArCoAkJCQl3ZmlsZS0+d19maWxlLCB3YnVmLCByZWNsZW4sIHN0
cmVycm9yKGVycm5vKSk7CsKgCQkJcmV0dXJuIC0xOwrCoAkJfSBlbHNlIHsKwqAJCQlvZmZzZXQg
PSBsc2Vlayh3ZmlsZS0+d19hZmQsIDAsIFNFRUtfQ1VSKSAtIHJlY2xlbjsKwqAJCQlpZiAob2Zm
c2V0ID09IC0xKSB7Ci0JCQkJc3ByaW50ZihXbG9nX0Vycm9yX1N0cmluZywKKwkJCQlzbnByaW50
ZihXbG9nX0Vycm9yX1N0cmluZyxzaXplb2YoV2xvZ19FcnJvcl9TdHJpbmcpLArCoAkJCQkJIkNv
dWxkIG5vdCByZXBvc2l0aW9uIGZpbGUgcG9pbnRlciAtIGxzZWVrKCVzLCAwLCBTRUVLX0NVUikg
ZmFpbGVkOsKgICVzXG4iLArCoAkJCQkJd2ZpbGUtPndfZmlsZSwgc3RyZXJyb3IoZXJybm8pKTsK
wqAJCQkJcmV0dXJuIC0xOwpAQCAtMjMzLDEzICsyMzMsMTMgQEAgaW50IHdsb2dfcmVjb3JkX3dy
aXRlKHN0cnVjdCB3bG9nX2ZpbGUgKndmaWxlLCBzdHJ1Y3Qgd2xvZ19yZWMgKndyZWMsCsKgCQl9
CsKgCX0gZWxzZSB7CsKgCQlpZiAoKGxzZWVrKHdmaWxlLT53X3JmZCwgb2Zmc2V0LCBTRUVLX1NF
VCkpID09IC0xKSB7Ci0JCQlzcHJpbnRmKFdsb2dfRXJyb3JfU3RyaW5nLAorCQkJc25wcmludGYo
V2xvZ19FcnJvcl9TdHJpbmcsc2l6ZW9mKFdsb2dfRXJyb3JfU3RyaW5nKSwKwqAJCQkJIkNvdWxk
IG5vdCByZXBvc2l0aW9uIGZpbGUgcG9pbnRlciAtIGxzZWVrKCVzLCAlbGQsIFNFRUtfU0VUKSBm
YWlsZWQ6wqAgJXNcbiIsCsKgCQkJCXdmaWxlLT53X2ZpbGUsIG9mZnNldCwgc3RyZXJyb3IoZXJy
bm8pKTsKwqAJCQlyZXR1cm4gLTE7CsKgCQl9IGVsc2UgewrCoAkJCWlmICgod3JpdGUod2ZpbGUt
PndfcmZkLCB3YnVmLCByZWNsZW4pKSA9PSAtMSkgewotCQkJCXNwcmludGYoV2xvZ19FcnJvcl9T
dHJpbmcsCisJCQkJc25wcmludGYoV2xvZ19FcnJvcl9TdHJpbmcsc2l6ZW9mKFdsb2dfRXJyb3Jf
U3RyaW5nKSwKwqAJCQkJCSJDb3VsZCBub3Qgd3JpdGUgbG9nIC0gd3JpdGUoJXMsICVzLCAlZCkg
ZmFpbGVkOsKgICVzXG4iLArCoAkJCQkJd2ZpbGUtPndfZmlsZSwgd2J1ZiwgcmVjbGVuLArCoAkJ
CQkJc3RyZXJyb3IoZXJybm8pKTsKQEAgLTI3NCwxNCArMjc0LDE0IEBAIGludCB3bG9nX3NjYW5f
YmFja3dhcmQoc3RydWN0IHdsb2dfZmlsZSAqd2ZpbGUsIGludCBucmVjcywKwqAJICovCsKgCsKg
CWlmICgobHNlZWsoZmQsIDAsIFNFRUtfRU5EKSkgPT0gLTEpIHsKLQkJc3ByaW50ZihXbG9nX0Vy
cm9yX1N0cmluZywKKwkJc25wcmludGYoV2xvZ19FcnJvcl9TdHJpbmcsc2l6ZW9mKFdsb2dfRXJy
b3JfU3RyaW5nKSwKwqAJCQkiQ291bGQgbm90IHJlcG9zaXRpb24gZmlsZSBwb2ludGVyIC0gbHNl
ZWsoJXMsIDAsIFNFRUtfRU5EKSBmYWlsZWQ6wqAgJXNcbiIsCsKgCQkJd2ZpbGUtPndfZmlsZSwg
c3RyZXJyb3IoZXJybm8pKTsKwqAJCXJldHVybiAtMTsKwqAJfQrCoAlvZmZzZXQgPSBsc2Vlayhm
ZCwgMCwgU0VFS19DVVIpOwrCoAlpZiAoKG9mZnNldCA9PSAtMSkpIHsKLQkJc3ByaW50ZihXbG9n
X0Vycm9yX1N0cmluZywKKwkJc25wcmludGYoV2xvZ19FcnJvcl9TdHJpbmcsc2l6ZW9mKFdsb2df
RXJyb3JfU3RyaW5nKSwKwqAJCQkiQ291bGQgbm90IHJlcG9zaXRpb24gZmlsZSBwb2ludGVyIC0g
bHNlZWsoJXMsIDAsIFNFRUtfQ1VSKSBmYWlsZWQ6wqAgJXNcbiIsCsKgCQkJd2ZpbGUtPndfZmls
ZSwgc3RyZXJyb3IoZXJybm8pKTsKwqAJCXJldHVybiAtMTsKQEAgLTMwOSw3ICszMDksNyBAQCBp
bnQgd2xvZ19zY2FuX2JhY2t3YXJkKHN0cnVjdCB3bG9nX2ZpbGUgKndmaWxlLCBpbnQgbnJlY3Ms
CsKgCQkgKiBNb3ZlIHRvIHRoZSBwcm9wZXIgZmlsZSBvZmZzZXQsIGFuZCByZWFkIGludG8gYnVm
CsKgCQkgKi8KwqAJCWlmICgobHNlZWsoZmQsIG9mZnNldCwgU0VFS19TRVQpKSA9PSAtMSkgewot
CQkJc3ByaW50ZihXbG9nX0Vycm9yX1N0cmluZywKKwkJCXNucHJpbnRmKFdsb2dfRXJyb3JfU3Ry
aW5nLHNpemVvZihXbG9nX0Vycm9yX1N0cmluZyksCsKgCQkJCSJDb3VsZCBub3QgcmVwb3NpdGlv
biBmaWxlIHBvaW50ZXIgLSBsc2VlayglcywgJWQsIFNFRUtfU0VUKSBmYWlsZWQ6wqAgJXNcbiIs
CsKgCQkJCXdmaWxlLT53X2ZpbGUsIG9mZnNldCwgc3RyZXJyb3IoZXJybm8pKTsKwqAJCQlyZXR1
cm4gLTE7CkBAIC0zMTgsNyArMzE4LDcgQEAgaW50IHdsb2dfc2Nhbl9iYWNrd2FyZChzdHJ1Y3Qg
d2xvZ19maWxlICp3ZmlsZSwgaW50IG5yZWNzLArCoAkJbmJ5dGVzID0gcmVhZChmZCwgYnVmc3Rh
cnQsIGJ1ZmVuZCAtIGJ1ZnN0YXJ0IC0gbGVmdG92ZXIpOwrCoArCoAkJaWYgKG5ieXRlcyA9PSAt
MSkgewotCQkJc3ByaW50ZihXbG9nX0Vycm9yX1N0cmluZywKKwkJCXNucHJpbnRmKFdsb2dfRXJy
b3JfU3RyaW5nLHNpemVvZihXbG9nX0Vycm9yX1N0cmluZyksCsKgCQkJCSJDb3VsZCBub3QgcmVh
ZCBoaXN0b3J5IGZpbGUgYXQgb2Zmc2V0ICVkIC0gcmVhZCglZCwgJXAsICVkKSBmYWlsZWQ6wqAg
JXNcbiIsCsKgCQkJCW9mZnNldCwgZmQsIGJ1ZnN0YXJ0LArCoAkJCQkoaW50KShidWZlbmQgLSBi
dWZzdGFydCAtIGxlZnRvdmVyKSwKLS3CoAoyLjM3LjIKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
