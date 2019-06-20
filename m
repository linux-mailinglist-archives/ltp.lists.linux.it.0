Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 720454D033
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:18:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4895C298934
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:18:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 207FE2987AF
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:18:11 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9C4D601A99
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:18:10 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id 207so3280673wma.1
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+kQmCOseqLv6Jl2b+T9jD3YQ8itIJxPX1X7+U80daGE=;
 b=cWYSjMpeUIEpJzurGb+55YR160OfdD21SWzXBjinOc+Z1Q81K2BhRVMPpbKMLh7Cho
 WPzA/qfTHgByCya/tfGQrSpC7MgJIqYjcOINeFcWCVYLmTT7zmcCrQhmDD3DqDEOt897
 8rPDHVsJIeYOoydBYrw1ehxsy81f5IHMGxpojPWGPljp5pghlx9H8Me0l6T2n+WcmfvA
 abQ+BKQJrPVM1calgDuDwYIHQUIerB2i/kj6UKNDRlSKiFFkjIk8Ntl5hqIbImH031C1
 vTcPbMk6dqEs+2bXLiPI6KRs04JZr66LgSaO2G0Aq0++2NmVYh45I7wFFId8zN8iTjWH
 GSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+kQmCOseqLv6Jl2b+T9jD3YQ8itIJxPX1X7+U80daGE=;
 b=dMhWPNAQvTzMiGWno2b/sHnvmzqyEP9a62MfUgdBK3ODqZRu9pSYmJYzS0y1EZykVc
 DDEfIZfEAwemhrE/NpuJM6NyErkY/rr23mRz/MZhK8sxYskE+XOC2Pj3/ac2r/gREayl
 WfeKSpflKeIDDlKbQxV7K9goZR26fxZW4olkwjDXOO8HwPvOEgQFoaJxQwIuUgxT2q2z
 o666NR8MbliklIUTMv26hFUTnTnJW4FttgBZDGDGgb9x2dg6ACNwzilkitJszH8T4KGQ
 OZyZescAACCufRt+PU6dj/kNRkxslc3/KB7cVDd2ocxtgT6if0+MjnuLvgqDh1iTUdk/
 7z8w==
X-Gm-Message-State: APjAAAWhVl/1NqGBnBgkkkbERcvODx4MugGmRk56b4zrwjLCCGv90GEX
 gDyFyuXJraRvaI5Wa9dPyTdRqZ5/
X-Google-Smtp-Source: APXvYqyRwi1SA2xJZWZ+q/VvtSRX3/m6uSMlS2kxJhLoxk9r1cjFI0mF+JZNXSLrpm4V3NtMPY5Jxw==
X-Received: by 2002:a1c:ef10:: with SMTP id n16mr2832126wmh.134.1561040290189; 
 Thu, 20 Jun 2019 07:18:10 -0700 (PDT)
Received: from amir-ThinkPad-T480.ctera.local
 (bzq-166-168-31-246.red.bezeqint.net. [31.168.166.246])
 by smtp.gmail.com with ESMTPSA id q12sm18946525wrp.50.2019.06.20.07.18.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 07:18:09 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 20 Jun 2019 17:18:04 +0300
Message-Id: <20190620141804.20902-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Subject: [LTP] [PATCH] syscalls/fanotify: fix build errors on centos 6
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

RG8gbm90IHRyeSB0byBidWlsZCBmYW5vdGlmeTFbMzVdIGFuZCBoZWxwZXJzIHdoZW4gc3lzdGVt
IGRvZXMgbm90CnN1cHBvcnQgbmFtZV90b19oYW5kbGVfYXQoKS4KClNpZ25lZC1vZmYtYnk6IEFt
aXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+Ci0tLQoKUGV0ciwKClRoaXMgcGF0Y2gg
aXMgb24gdG9wIG9mIE1hdHRoZXcncyBzZXJpZXMuClBsZWFzZSBzZWUgaWYgaXQgZml4ZWQgYnVp
bGQgZXJyb3JzIHlvdSByZXBvcnRlZCBpbiBjZW50b3MgNi4KClRoYW5rcywKQW1pci4KCiB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmggICB8IDE2ICsrKysrKyst
LS0tLS0tLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxMy5j
IHwgIDQgKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1
LmMgfCAgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9m
YW5vdGlmeS5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5o
CmluZGV4IGY5ODAzYzFjYy4uMWM3NjIzZDNiIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oCkBAIC0xMjUsMjEgKzEyNSwyMiBAQCBzdHJ1Y3QgZmFu
b3RpZnlfZXZlbnRfaW5mb19oZWFkZXIgewogCXVpbnQxNl90IGxlbjsKIH07CiAKKyNpZmRlZiBI
QVZFX05BTUVfVE9fSEFORExFX0FUCiBzdHJ1Y3QgZmFub3RpZnlfZXZlbnRfaW5mb19maWQgewog
CXN0cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2hlYWRlciBoZHI7CiAJX19rZXJuZWxfZnNpZF90
IGZzaWQ7CiAJdW5zaWduZWQgY2hhciBoYW5kbGVbMF07CiB9OwotCisjZW5kaWYKICNlbmRpZgog
CisjaWZkZWYgSEFWRV9OQU1FX1RPX0hBTkRMRV9BVAogLyoKLSAqIEhlbHBlciBmdW5jdGlvbiB1
c2VkIHRvIG9idGFpbiBfX2tlcm5lbF9mc2lkX3QgYW5kIGZpbGVfaGFuZGxlIG9iamVjdHMKLSAq
IGZvciBhIGdpdmVuIHBhdGguIFVzZWQgYnkgdGVzdCBmaWxlcyBjb3JyZWxhdGVkIHRvIEZBTl9S
RVBPUlRfRklECi0gKiBmdW5jdGlvbmFsaXR5LgorICogSGVscGVyIGZ1bmN0aW9uIHVzZWQgdG8g
b2J0YWluIGZzaWQgYW5kIGZpbGVfaGFuZGxlIGZvciBhIGdpdmVuIHBhdGguCisgKiBVc2VkIGJ5
IHRlc3QgZmlsZXMgY29ycmVsYXRlZCB0byBGQU5fUkVQT1JUX0ZJRCBmdW5jdGlvbmFsaXR5Lgog
ICovCiBzdGF0aWMgaW5saW5lIHZvaWQgZmFub3RpZnlfZ2V0X2ZpZChjb25zdCBjaGFyICpwYXRo
LCBfX2tlcm5lbF9mc2lkX3QgKmZzaWQsCi0JCQlzdHJ1Y3QgZmlsZV9oYW5kbGUgKmhhbmRsZSkK
KwkJCQkgICAgc3RydWN0IGZpbGVfaGFuZGxlICpoYW5kbGUpCiB7CiAJaW50IG1vdW50X2lkOwog
CXN0cnVjdCBzdGF0ZnMgc3RhdHM7CkBAIC0xNDksNyArMTUwLDYgQEAgc3RhdGljIGlubGluZSB2
b2lkIGZhbm90aWZ5X2dldF9maWQoY29uc3QgY2hhciAqcGF0aCwgX19rZXJuZWxfZnNpZF90ICpm
c2lkLAogCQkJInN0YXRmcyglcywgLi4uKSBmYWlsZWQiLCBwYXRoKTsKIAltZW1jcHkoZnNpZCwg
JnN0YXRzLmZfZnNpZCwgc2l6ZW9mKHN0YXRzLmZfZnNpZCkpOwogCi0jaWZkZWYgSEFWRV9OQU1F
X1RPX0hBTkRMRV9BVAogCWlmIChuYW1lX3RvX2hhbmRsZV9hdChBVF9GRENXRCwgcGF0aCwgaGFu
ZGxlLCAmbW91bnRfaWQsIDApID09IC0xKSB7CiAJCWlmIChlcnJubyA9PSBFT1BOT1RTVVBQKSB7
CiAJCQl0c3RfYnJrKFRDT05GLApAQCAtMTU5LDEwICsxNTksOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgZmFub3RpZnlfZ2V0X2ZpZChjb25zdCBjaGFyICpwYXRoLCBfX2tlcm5lbF9mc2lkX3QgKmZz
aWQsCiAJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sCiAJCQkibmFtZV90b19oYW5kbGVfYXQoQVRf
RkRDV0QsICVzLCAuLi4pIGZhaWxlZCIsIHBhdGgpOwogCX0KLSNlbHNlCi0JdHN0X2JyayhUQ09O
RiwgIm5hbWVfdG9faGFuZGxlX2F0KCkgaXMgbm90IGltcGxtZW50ZWQiKTsKLSNlbmRpZiAvKiBI
QVZFX05BTUVfVE9fSEFORExFX0FUICovCiB9CisjZW5kaWYgLyogSEFWRV9OQU1FX1RPX0hBTkRM
RV9BVCAqLwogCiAjZGVmaW5lIElOSVRfRkFOT1RJRllfTUFSS19UWVBFKHQpIFwKIAl7IEZBTl9N
QVJLXyAjIyB0LCAiRkFOX01BUktfIiAjdCB9CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZmFub3RpZnkvZmFub3RpZnkxMy5jCmluZGV4IDhmOWJhYWNmYS4uZTU2ODFjODA0IDEwMDY0
NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYwor
KysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYwpAQCAt
MzgsNiArMzgsNyBAQAogI2RlZmluZSBGSUxFX1BBVEhfT05FIE1PVU5UX1BBVEgiLyJGSUxFX09O
RQogI2RlZmluZSBGSUxFX1BBVEhfVFdPIE1PVU5UX1BBVEgiLyJGSUxFX1RXTwogCisjaWYgZGVm
aW5lZChIQVZFX05BTUVfVE9fSEFORExFX0FUKQogc3RydWN0IGV2ZW50X3QgewogCXVuc2lnbmVk
IGxvbmcgbG9uZyBleHBlY3RlZF9tYXNrOwogCV9fa2VybmVsX2ZzaWRfdCBmc2lkOwpAQCAtMzIz
LDYgKzMyNCw5IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKIAkuYWxsX2ZpbGVz
eXN0ZW1zID0gMQogfTsKIAorI2Vsc2UKKwlUU1RfVEVTVF9UQ09ORigiU3lzdGVtIGRvZXMgbm90
IGhhdmUgcmVxdWlyZWQgbmFtZV90b19oYW5kbGVfYXQoKSBzdXBwb3J0Iik7CisjZW5kaWYKICNl
bHNlCiAJVFNUX1RFU1RfVENPTkYoIlN5c3RlbSBkb2VzIG5vdCBoYXZlIHJlcXVpcmVkIGZhbm90
aWZ5IHN1cHBvcnQiKTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5L2Zhbm90aWZ5MTUuYwppbmRleCA2OTgxYjc4OTEuLmU5ZTkyNjA3OCAxMDA2NDQKLS0t
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKQEAgLTM1LDYg
KzM1LDcgQEAKICNkZWZpbmUgRklMRTEgVEVTVF9ESVIiL2ZpbGUxIgogI2RlZmluZSBGSUxFMiBU
RVNUX0RJUiIvZmlsZTIiCiAKKyNpZiBkZWZpbmVkKEhBVkVfTkFNRV9UT19IQU5ETEVfQVQpCiBz
dHJ1Y3QgZXZlbnRfdCB7CiAJdW5zaWduZWQgbG9uZyBsb25nIG1hc2s7CiAJX19rZXJuZWxfZnNp
ZF90IGZzaWQ7CkBAIC0yNDEsNiArMjQyLDkgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0
ID0gewogCS5jbGVhbnVwID0gZG9fY2xlYW51cAogfTsKIAorI2Vsc2UKKwlUU1RfVEVTVF9UQ09O
RigiU3lzdGVtIGRvZXMgbm90IGhhdmUgcmVxdWlyZWQgbmFtZV90b19oYW5kbGVfYXQoKSBzdXBw
b3J0Iik7CisjZW5kaWYKICNlbHNlCiAJVFNUX1RFU1RfVENPTkYoIlN5c3RlbSBkb2VzIG5vdCBo
YXZlIHJlcXVpcmVkIGZhbm90aWZ5IHN1cHBvcnQiKTsKICNlbmRpZgotLSAKMi4xNy4xCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
