Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DEA4E549
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:01:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67EEA2989D7
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 12:01:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 759643EA251
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 11:51:40 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0DAE11401A46
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 11:51:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B547330833BE
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 09:51:38 +0000 (UTC)
Received: from dhcp-0-148.nay.redhat.com (dhcp-0-148.nay.redhat.com
 [10.66.0.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A42CD5D9D2;
 Fri, 21 Jun 2019 09:51:37 +0000 (UTC)
From: Ping Fang <pifang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 21 Jun 2019 17:51:34 +0800
Message-Id: <20190621095134.12604-1-pifang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 21 Jun 2019 09:51:38 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 21 Jun 2019 12:01:16 +0200
Cc: liwan@redhat.com
Subject: [LTP] [PATCH] syscalls/clock_adjtime: Fix unsupported WARN
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

V2hlbiBjbG9ja19hZGp0aW1lIGlzIG5vdCBpbXBsZW1lbnRlZCwgY2xlYW51cCB3aWxsCnN0aWxs
IHRyeSB0aGlzIGNhbGwsIHRoZW4gZW50ZXIgdHN0X2N2cmVzIFdBUk4gaGFuZGxlci4KCnRzdF90
ZXN0LmM6MTA5NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKLi4vLi4vLi4v
Li4vaW5jbHVkZS90c3Rfc2FmZV9jbG9ja3MuaDo1NzogQ09ORjogc3lzY2FsbCgtMSkKX19OUl9j
bG9ja19hZGp0aW1lIG5vdCBzdXBwb3J0ZWQKLi4vLi4vLi4vLi4vaW5jbHVkZS90c3Rfc2FmZV9j
bG9ja3MuaDo1NzogQ09ORjogc3lzY2FsbCgtMSkKX19OUl9jbG9ja19hZGp0aW1lIG5vdCBzdXBw
b3J0ZWQKLi4vLi4vLi4vLi4vaW5jbHVkZS90c3Rfc2FmZV9jbG9ja3MuaDo2MDogV0FSTjogY2xv
Y2tfYWRqdGltZTAyLmM6MjExCmNsb2NrX2FkanRpbWUoKSBmYWlsZWQgLTE6IEVOT1NZUwoKU3Vt
bWFyeToKcGFzc2VkICAgMApmYWlsZWQgICAwCnNraXBwZWQgIDEKd2FybmluZ3MgMQoKU2lnbmVk
LW9mZi1ieTogUGluZyBGYW5nIDxwaWZhbmdAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2Nsb2NrX2FkanRpbWUvY2xvY2tfYWRqdGltZTAxLmMgfCA0ICsrKysKIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY2xvY2tfYWRqdGltZS9jbG9ja19hZGp0aW1lMDIuYyB8
IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Nsb2NrX2FkanRpbWUvY2xvY2tfYWRqdGltZTAxLmMg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Nsb2NrX2FkanRpbWUvY2xvY2tfYWRqdGltZTAx
LmMKaW5kZXggNmVhYzFmMjVjLi4yYzQyMTg5ZTAgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvY2xvY2tfYWRqdGltZS9jbG9ja19hZGp0aW1lMDEuYworKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Nsb2NrX2FkanRpbWUvY2xvY2tfYWRqdGltZTAxLmMKQEAgLTU4
LDYgKzU4LDcgQEAKIAogc3RhdGljIGxvbmcgaHo7CiBzdGF0aWMgc3RydWN0IHRpbWV4IHNhdmVk
LCB0dHhjOworc3RhdGljIGludCBzdXBwb3J0ID0gMDsKIAogc3RydWN0IHRlc3RfY2FzZSB7CiAJ
dW5zaWduZWQgaW50IG1vZGVzOwpAQCAtMTY4LDYgKzE2OSw3IEBAIHN0YXRpYyB2b2lkIHNldHVw
KHZvaWQpCiAJaW50IHJ2YWw7CiAKIAlydmFsID0gU0FGRV9DTE9DS19BREpUSU1FKENMT0NLX1JF
QUxUSU1FLCAmc2F2ZWQpOworCXN1cHBvcnQgPSAxOwogCiAJaWYgKHJ2YWwgIT0gVElNRV9PSyAm
JiBydmFsICE9IFRJTUVfRVJST1IpIHsKIAkJdGltZXhfc2hvdygiU0FWRV9TVEFUVVMiLCBzYXZl
ZCk7CkBAIC0xOTcsNiArMTk5LDggQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAogc3RhdGlj
IHZvaWQgY2xlYW51cCh2b2lkKQogeworCWlmIChzdXBwb3J0ID09IDApCisJCXJldHVybjsKIAlz
YXZlZC5tb2RlcyA9IEFESl9BTEw7CiAKIAkvKiByZXN0b3JlIGNsb2NrIHJlc29sdXRpb24gYmFz
ZWQgb24gb3JpZ2luYWwgc3RhdHVzIGZsYWcgKi8KZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvY2xvY2tfYWRqdGltZS9jbG9ja19hZGp0aW1lMDIuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvY2xvY2tfYWRqdGltZS9jbG9ja19hZGp0aW1lMDIuYwppbmRleCAxY2U5
MzZmOTYuLjAyMjQwODllMSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9j
bG9ja19hZGp0aW1lL2Nsb2NrX2FkanRpbWUwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvY2xvY2tfYWRqdGltZS9jbG9ja19hZGp0aW1lMDIuYwpAQCAtNTksNiArNTksNyBAQAog
CiBzdGF0aWMgbG9uZyBoejsKIHN0YXRpYyBzdHJ1Y3QgdGltZXggc2F2ZWQsIHR0eGM7CitzdGF0
aWMgaW50IHN1cHBvcnQgPSAwOwogCiBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpOwogCkBAIC0x
NzYsNiArMTc3LDcgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAlpbnQgcnZhbDsKIAogCXJ2
YWwgPSBTQUZFX0NMT0NLX0FESlRJTUUoQ0xPQ0tfUkVBTFRJTUUsICZzYXZlZCk7CisJc3VwcG9y
dCA9IDE7CiAKIAlpZiAocnZhbCAhPSBUSU1FX09LICYmIHJ2YWwgIT0gVElNRV9FUlJPUikgewog
CQl0aW1leF9zaG93KCJTQVZFX1NUQVRVUyIsIHNhdmVkKTsKQEAgLTE5Nyw2ICsxOTksOCBAQCBz
dGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogCiBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiB7CisJ
aWYgKHN1cHBvcnQgPT0gMCkKKwkJcmV0dXJuOwogCXNhdmVkLm1vZGVzID0gQURKX0FMTDsKIAog
CS8qIHJlc3RvcmUgY2xvY2sgcmVzb2x1dGlvbiBiYXNlZCBvbiBvcmlnaW5hbCBzdGF0dXMgZmxh
ZyAqLwotLSAKMi4yMC4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
