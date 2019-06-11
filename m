Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F374E3C552
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:43:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7E613EAEBD
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 09:43:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D57E13EAEBD
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:43:51 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3480D1A0106F
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:43:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E2132F8BD9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 07:43:49 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8D635D6A9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 07:43:48 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 11 Jun 2019 09:43:40 +0200
Message-Id: <2abbf8596a01ea056f6e7c9e6c481d67093cea0c.1560238866.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 11 Jun 2019 07:43:49 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_ns01: fix crash on aarch64
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

VGVzdCBjcmFzaGVzIHdpdGggU0lHQlVTIHdoZW4gdXNpbmcgY2hpbGQgc3RhY2suIEFsaWduIHN0
YWNrIHRvIDI1NiBieXRlcywKd2hpY2ggaXMgbW9yZSB0aGFuIGVub3VnaCBmb3IgYW55IGFyY2gu
CgpOZWl0aGVyIHBhcmVudCBvciBsaWJyYXJ5IGlzIHdhaXRpbmcgZm9yIGNoaWxkIHByb2Nlc3Mu
IEFkZCBTSUdDSExEIHRvCmNsb25lIGZsYWdzLgoKQ2hlY2sgcmV0dXJuIHZhbHVlIG9mIGx0cF9j
bG9uZSgpLCBhbmQgVEJST0sgb24gZmFpbHVyZS4KCkZpeCB3YXJuaW5nIGFib3V0IHVudXNlZCAq
YXJnLgoKU2lnbmVkLW9mZi1ieTogSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+Ci0t
LQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczAxLmMgfCAxMCArKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5j
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczAxLmMKaW5kZXggZGZk
ZTRkYTZjNWQ2Li42MjVkZTliZDgzMmQgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
aW9jdGwvaW9jdGxfbnMwMS5jCkBAIC0yMyw3ICsyMyw3IEBACiAKICNkZWZpbmUgU1RBQ0tfU0la
RSAoMTAyNCAqIDEwMjQpCiAKLXN0YXRpYyBjaGFyIGNoaWxkX3N0YWNrW1NUQUNLX1NJWkVdOwor
c3RhdGljIGNoYXIgY2hpbGRfc3RhY2tbU1RBQ0tfU0laRV0gX19hdHRyaWJ1dGVfXygoYWxpZ25l
ZCgyNTYpKSk7CiAKIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiB7CkBAIC01Myw3ICs1Myw3IEBA
IHN0YXRpYyB2b2lkIHRlc3RfbnNfZ2V0X3BhcmVudCh2b2lkKQogCX0KIH0KIAotc3RhdGljIGlu
dCBjaGlsZCh2b2lkICphcmcpCitzdGF0aWMgaW50IGNoaWxkKHZvaWQgKmFyZyBMVFBfQVRUUklC
VVRFX1VOVVNFRCkKIHsKIAl0ZXN0X25zX2dldF9wYXJlbnQoKTsKIAlyZXR1cm4gMDsKQEAgLTYx
LDEwICs2MSwxNCBAQCBzdGF0aWMgaW50IGNoaWxkKHZvaWQgKmFyZykKIAogc3RhdGljIHZvaWQg
cnVuKHZvaWQpCiB7CisJaW50IGNoaWxkX3BpZDsKKwogCXRlc3RfbnNfZ2V0X3BhcmVudCgpOwog
Ci0JbHRwX2Nsb25lKENMT05FX05FV1BJRCwgJmNoaWxkLCAwLAorCWNoaWxkX3BpZCA9IGx0cF9j
bG9uZShDTE9ORV9ORVdQSUQgfCBTSUdDSExELCAmY2hpbGQsIDAsCiAJCVNUQUNLX1NJWkUsIGNo
aWxkX3N0YWNrKTsKKwlpZiAoY2hpbGRfcGlkID09IC0xKQorCQl0c3RfYnJrKFRCUk9LIHwgVEVS
Uk5PLCAibHRwX2Nsb25lIGZhaWxlZCIpOwogfQogCiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRl
c3QgPSB7Ci0tIAoxLjguMy4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
