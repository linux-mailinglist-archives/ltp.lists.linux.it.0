Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CFF47FC9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 12:35:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B3163EB068
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 12:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F2C643EA3FE
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 12:35:46 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1E5BA1000D94
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 12:35:42 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so943107pgj.7
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EeNS2+3NOfaxdaWUz0MeH6TGLrnNUoxlhwR/hqntrN0=;
 b=pXOlVmbEqz2jELJ0Zgz0fMSe4LlSaiPUJPAqn1+qWrByB0FoDyM1roLQHNub/JPzrD
 00og4k3slwUJ5gRUkNygYC/UL0G2xNArq/7n5ItA2MF8NRwXLGlasT9+oYY23mfO+MwA
 SriIVcKLM7abQ1h41DdAkroq0PNPD4o2+icvxQeB7ajvZAtlZK07WD0O8/221W/n4xqY
 LTVME/LDWoD0+4/pmF24nXlkPcHb/mG1TjNzeIgdpRd3WD81YRWjeLc/SQKV00g+dCMr
 78Ck8A371FC44xDBZODnH/N6ghZruYYu0NY70CQ+EwMdGBjtr6hIeWkt2+hdtVBuVrKj
 2UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EeNS2+3NOfaxdaWUz0MeH6TGLrnNUoxlhwR/hqntrN0=;
 b=X+shwCr4pWdkfKKOz5ecJSRmE0GK5vNxw4G1244VOtHYnaN5KCd0jEwf3jJZqX25pB
 1l5nFzWy1bGsF4Md/PDHIYjVM0/I8SL6VTZ/RfD9bDtkrEGyHCRT4aPScB7uzngTRYBN
 MDB08clHYz+OputImW+Vd72phnJPGGiENmKDcv2VVUjm63+Ywwc6aMMeAWRrKQbFvmOY
 Zqze0wcRgkvrt4sWnkVgI/e+AKHLuOHSAZXTBRo8D/J3cC4diHU7D+qKrP2E5QmVpVXt
 Q3G6R5meWHNHOvUV4JJTB129CXhdwBjJyHrMkDZzKxR+pmgLd9/lf+twjSKR6CyvEsgu
 otqA==
X-Gm-Message-State: APjAAAUFwl5nULXvCUqbqR6/mF5m+fAXpmL/k0VaKnUKc77sjhytQ6SS
 TzzJFcYTmc7E81oESmRwi6EFXmOaBg==
X-Google-Smtp-Source: APXvYqyAYFGn+ocb+FQjTTZRdRVR1mWL5xvor04OmCZllT2ZEfytKhczvFiPLhgK2WEV0zRcKDc34w==
X-Received: by 2002:a63:490a:: with SMTP id w10mr47921959pga.6.1560767744129; 
 Mon, 17 Jun 2019 03:35:44 -0700 (PDT)
Received: from poseidon.Home ([114.78.0.167])
 by smtp.gmail.com with ESMTPSA id y23sm13716090pfm.117.2019.06.17.03.35.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 03:35:43 -0700 (PDT)
Date: Mon, 17 Jun 2019 20:35:38 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: ltp@lists.linux.it
Message-ID: <da7801311f1da2b49ade6bc23fedf1fe1a0d5fb6.1560766652.git.mbobrowski@mbobrowski.org>
References: <cover.1560766652.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1560766652.git.mbobrowski@mbobrowski.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: jack@suse.cz
Subject: [LTP] [PATCH v4 2/3] syscalls/fanotify14: new test to validate
 FAN_REPORT_FID interface return values
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

QSBuZXdseSBkZWZpbmVkIHRlc3QgZmlsZSBoYXMgYmVlbiBpbnRyb2R1Y2VkIHRvIHZhbGlkYXRl
IHRoYXQgdGhlCmZhbm90aWZ5IGludGVyZmFjZSByZXR1cm5zIHRoZSBjb3JyZWN0IGVycm9yIHZh
bHVlcyB1cG9uIHNwZWNpZnlpbmcKaW52YWxpZCBmbGFncyBhbmQgbWFza3MgaW4gY29uanVuY3Rp
b24gd2l0aCBGQU5fUkVQT1JUX0ZJRC4gQSBuZXcgbGluZQplbnRyeSB3aXRoaW4gcnVudGVzdC9z
eXNjYWxscyBmb3IgdGhpcyBuZXcgdGVzdCBmaWxlLgoKU2lnbmVkLW9mZi1ieTogTWF0dGhldyBC
b2Jyb3dza2kgPG1ib2Jyb3dza2lAbWJvYnJvd3NraS5vcmc+ClJldmlld2VkLWJ5OiBBbWlyIEdv
bGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgotLS0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2Zhbm90aWZ5Ly5naXRpZ25vcmUgfCAgIDEgKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
YW5vdGlmeS9mYW5vdGlmeS5oIHwgIDI1ICsrKwogLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlm
eS9mYW5vdGlmeTE0LmMgICAgIHwgMTcxICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFu
Z2VkLCAxOTggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNC5jCgpkaWZmIC0tZ2l0IGEvcnVudGVzdC9z
eXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHMKaW5kZXggZTY4MmY1MDg3Li41NmY4NDgyNGEgMTAw
NjQ0Ci0tLSBhL3J1bnRlc3Qvc3lzY2FsbHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtNTM1
LDYgKzUzNSw3IEBAIGZhbm90aWZ5MTAgZmFub3RpZnkxMAogZmFub3RpZnkxMSBmYW5vdGlmeTEx
CiBmYW5vdGlmeTEyIGZhbm90aWZ5MTIKIGZhbm90aWZ5MTMgZmFub3RpZnkxMworZmFub3RpZnkx
NCBmYW5vdGlmeTE0CiAKIGlvcGVybTAxIGlvcGVybTAxCiBpb3Blcm0wMiBpb3Blcm0wMgpkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS8uZ2l0aWdub3JlIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS8uZ2l0aWdub3JlCmluZGV4IDE2YmRk
OTllNS4uYmYzODljOTZhIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5Ly5naXRpZ25vcmUKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlm
eS8uZ2l0aWdub3JlCkBAIC0xMSw0ICsxMSw1IEBACiAvZmFub3RpZnkxMQogL2Zhbm90aWZ5MTIK
IC9mYW5vdGlmeTEzCisvZmFub3RpZnkxNAogL2Zhbm90aWZ5X2NoaWxkCmRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmggYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmgKaW5kZXggYTVhYzE0YWNiLi5mOTgw
M2MxY2MgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFu
b3RpZnkuaAorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5
LmgKQEAgLTY5LDYgKzY5LDMxIEBAIHN0YXRpYyBsb25nIGZhbm90aWZ5X21hcmsoaW50IGZkLCB1
bnNpZ25lZCBpbnQgZmxhZ3MsIHVpbnQ2NF90IG1hc2ssCiAjaWZuZGVmIEZBTl9NQVJLX0ZJTEVT
WVNURU0KICNkZWZpbmUgRkFOX01BUktfRklMRVNZU1RFTQkweDAwMDAwMTAwCiAjZW5kaWYKKy8q
IE5ldyBkaXJlbnQgZXZlbnQgbWFza3MgKi8KKyNpZm5kZWYgRkFOX0FUVFJJQgorI2RlZmluZSBG
QU5fQVRUUklCCQkweDAwMDAwMDA0CisjZW5kaWYKKyNpZm5kZWYgRkFOX01PVkVEX0ZST00KKyNk
ZWZpbmUgRkFOX01PVkVEX0ZST00JCTB4MDAwMDAwNDAKKyNlbmRpZgorI2lmbmRlZiBGQU5fTU9W
RURfVE8KKyNkZWZpbmUgRkFOX01PVkVEX1RPCQkweDAwMDAwMDgwCisjZW5kaWYKKyNpZm5kZWYg
RkFOX0NSRUFURQorI2RlZmluZSBGQU5fQ1JFQVRFCQkweDAwMDAwMTAwCisjZW5kaWYKKyNpZm5k
ZWYgRkFOX0RFTEVURQorI2RlZmluZSBGQU5fREVMRVRFCQkweDAwMDAwMjAwCisjZW5kaWYKKyNp
Zm5kZWYgRkFOX0RFTEVURV9TRUxGCisjZGVmaW5lIEZBTl9ERUxFVEVfU0VMRgkJMHgwMDAwMDQw
MAorI2VuZGlmCisjaWZuZGVmIEZBTl9NT1ZFX1NFTEYKKyNkZWZpbmUgRkFOX01PVkVfU0VMRgkJ
MHgwMDAwMDgwMAorI2VuZGlmCisjaWZuZGVmIEZBTl9NT1ZFCisjZGVmaW5lIEZBTl9NT1ZFCQko
RkFOX01PVkVEX0ZST00gfCBGQU5fTU9WRURfVE8pCisjZW5kaWYKICNpZm5kZWYgRkFOX09QRU5f
RVhFQwogI2RlZmluZSBGQU5fT1BFTl9FWEVDCQkweDAwMDAxMDAwCiAjZW5kaWYKZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNC5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE0LmMKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4yZTE4NzhhYzAKLS0tIC9kZXYvbnVsbAorKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTQuYwpAQCAtMCwwICsx
LDE3MSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKy8qCisgKiBDb3B5
cmlnaHQgKGMpIDIwMTggTWF0dGhldyBCb2Jyb3dza2kuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisg
KgorICogU3RhcnRlZCBieSBNYXR0aGV3IEJvYnJvd3NraSA8bWJvYnJvd3NraUBtYm9icm93c2tp
Lm9yZz4KKyAqCisgKiBERVNDUklQVElPTgorICoJVGhpcyB0ZXN0IGZpbGUgaGFzIGJlZW4gZGVz
aWduZWQgdG8gZW5zdXJlIHRoYXQgdGhlIGZhbm90aWZ5CisgKglzeXN0ZW0gY2FsbHMgZmFub3Rp
ZnlfaW5pdCgyKSBhbmQgZmFub3RpZnlfbWFyaygyKSByZXR1cm4gdGhlCisgKgljb3JyZWN0IGVy
cm9yIGNvZGUgdG8gdGhlIGNhbGxpbmcgcHJvY2VzcyB3aGVuIGFuIGludmFsaWQgZmxhZyBvcgor
ICoJbWFzayB2YWx1ZSBoYXMgYmVlbiBzcGVjaWZpZWQgaW4gY29uanVuY3Rpb24gd2l0aCBGQU5f
UkVQT1JUX0ZJRC4KKyAqLworI2RlZmluZSBfR05VX1NPVVJDRQorI2luY2x1ZGUgInRzdF90ZXN0
LmgiCisjaW5jbHVkZSAiZmFub3RpZnkuaCIKKworI2luY2x1ZGUgPGVycm5vLmg+CisKKyNpZiBk
ZWZpbmVkKEhBVkVfU1lTX0ZBTk9USUZZX0gpCisjaW5jbHVkZSA8c3lzL2Zhbm90aWZ5Lmg+CisK
KyNkZWZpbmUgTU5UUE9JTlQgIm1udHBvaW50IgorI2RlZmluZSBGSUxFMSBNTlRQT0lOVCIvZmls
ZTEiCisKKy8qIExpc3Qgb2YgaW5vZGUgZXZlbnRzIHRoYXQgYXJlIG9ubHkgYXZhaWxhYmxlIHdo
ZW4gbm90aWZpY2F0aW9uIGdyb3VwIGlzCisgKiBzZXQgdG8gcmVwb3J0IGZpZAorICovCisjZGVm
aW5lIElOT0RFX0VWRU5UUyAoRkFOX0FUVFJJQiB8IEZBTl9DUkVBVEUgfCBGQU5fREVMRVRFIHwg
RkFOX01PVkUgfCBcCisJCSAgICAgIEZBTl9ERUxFVEVfU0VMRiB8IEZBTl9NT1ZFX1NFTEYpCisK
K3N0YXRpYyBpbnQgZmFub3RpZnlfZmQ7CisKKy8qIEVhY2ggdGVzdCBjYXNlIGhhcyBiZWVuIGRl
c2lnbmVkIGluIGEgbWFubmVyIHdoZXJlYnkgdGhlIHZhbHVlcyBkZWZpbmVkCisgKiB3aXRoaW4g
c2hvdWxkIHJlc3VsdCBpbiB0aGUgaW50ZXJmYWNlIHRvIHJldHVybiBhbiBlcnJvciB0byB0aGUg
Y2FsbGluZworICogcHJvY2Vzcy4KKyAqLworc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2VfdCB7CisJ
dW5zaWduZWQgaW50IGluaXRfZmxhZ3M7CisJdW5zaWduZWQgaW50IG1hcmtfZmxhZ3M7CisJdW5z
aWduZWQgbG9uZyBsb25nIG1hc2s7Cit9IHRlc3RfY2FzZXNbXSA9IHsKKwl7CisJCUZBTl9DTEFT
U19DT05URU5UIHwgRkFOX1JFUE9SVF9GSUQsIDAsIDAKKwl9LAorCXsKKwkJRkFOX0NMQVNTX1BS
RV9DT05URU5UIHwgRkFOX1JFUE9SVF9GSUQsIDAsIDAKKwl9LAorCXsKKwkJRkFOX0NMQVNTX05P
VElGLCAwLCBJTk9ERV9FVkVOVFMKKwl9LAorCXsKKwkJRkFOX0NMQVNTX05PVElGIHwgRkFOX1JF
UE9SVF9GSUQsIEZBTl9NQVJLX01PVU5ULCBJTk9ERV9FVkVOVFMKKwl9Cit9OworCitzdGF0aWMg
dm9pZCBkb19zZXR1cCh2b2lkKQoreworCWludCBmZDsKKworCS8qIENoZWNrIGZvciBrZXJuZWwg
ZmFub3RpZnkgc3VwcG9ydCAqLworCWZkID0gU0FGRV9GQU5PVElGWV9JTklUKEZBTl9DTEFTU19O
T1RJRiwgT19SRE9OTFkpOworCVNBRkVfQ0xPU0UoZmQpOworCisJLyogQ3JlYXRlIHRlbXBvcmFy
eSB0ZXN0IGZpbGUgdG8gcGxhY2UgbWFya3Mgb24gKi8KKwlTQUZFX0ZJTEVfUFJJTlRGKEZJTEUx
LCAiMCIpOworfQorCitzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBudW1iZXIpCit7
CisJaW50IHJldDsKKwlzdHJ1Y3QgdGVzdF9jYXNlX3QgKnRjID0gJnRlc3RfY2FzZXNbbnVtYmVy
XTsKKworCWZhbm90aWZ5X2ZkID0gZmFub3RpZnlfaW5pdCh0Yy0+aW5pdF9mbGFncywgT19SRE9O
TFkpOworCisJaWYgKGZhbm90aWZ5X2ZkIDwgMCkgeworCQkvKiBFSU5WQUwgaXMgdG8gYmUgcmV0
dXJuZWQgdG8gdGhlIGNhbGxpbmcgcHJvY2VzcyB3aGVuCisJCSAqIGFuIGludmFsaWQgbm90aWZp
Y2F0aW9uIGNsYXNzIGlzIHNwZWNpZmllZCBpbgorCQkgKiBjb25qdW5jdGlvbiB3aXRoIEZBTl9S
RVBPUlRfRklECisJCSAqLworCQlpZiAoZXJybm8gPT0gRUlOVkFMKSB7CisJCQl0c3RfcmVzKFRQ
QVNTLAorCQkJCSJmYW5vdGlmeV9mZD0lZCwgZmFub3RpZnlfaW5pdCgleCwgT19SRE9OTFkpICIK
KwkJCQkiZmFpbGVkIHdpdGggZXJyb3IgRUlOVkFMIGFzIGV4cGVjdGVkIiwKKwkJCQlmYW5vdGlm
eV9mZCwKKwkJCQl0Yy0+aW5pdF9mbGFncyk7CisJCQlyZXR1cm47CisJCX0KKwkJdHN0X2JyayhU
QlJPSyB8IFRFUlJOTywKKwkJCSJmYW5vdGlmeV9mZD0lZCwgZmFub3RpZnlfaW5pdCgleCwgT19S
RE9OTFkpIGZhaWxlZCIsCisJCQlmYW5vdGlmeV9mZCwKKwkJCXRjLT5pbml0X2ZsYWdzKTsKKwl9
CisKKwkvKiBBIHRlc3QgY2FzZSB3aXRoIGEgbWFzayBzZXQgdG8gemVybyBpbmRpY2F0ZSB0aGF0
IHRoZXkndmUgYmVlbgorCSAqIHNwZWNpZmljYWxseSBkZXNpZ25lZCB0byB0ZXN0IGFuZCBmYWls
IG9uIHRoZSBmYW5vdGlmeV9pbml0KCkKKwkgKiBzeXN0ZW0gY2FsbC4KKwkgKi8KKwlpZiAodGMt
Pm1hc2sgPT0gMCkgeworCQl0c3RfcmVzKFRGQUlMLAorCQkJImZhbm90aWZ5X2ZkPSVkIGZhbm90
aWZ5X2luaXQoJXgsIE9fUkRPTkxZKSAiCisJCQkidW5leHBlY3RlZGx5IHN1Y2NlZWRlZCB3aGVu
IHRlc3RzIHdpdGggbWFzayAwIGFyZSIKKwkJCSJleHBlY3RlZCB0byBmYWlsIHdoZW4gY2FsbGlu
ZyBmYW5vdGlmeV9pbml0KCkiLAorCQkJZmFub3RpZnlfZmQsCisJCQl0Yy0+aW5pdF9mbGFncyk7
CisJCXJldHVybjsKKwl9CisKKwlyZXQgPSBmYW5vdGlmeV9tYXJrKGZhbm90aWZ5X2ZkLCBGQU5f
TUFSS19BREQgfCB0Yy0+bWFya19mbGFncywKKwkJCQl0Yy0+bWFzaywgQVRfRkRDV0QsIEZJTEUx
KTsKKworCWlmIChyZXQgPCAwKSB7CisJCS8qIEVJTlZBTCBpcyB0byBiZSByZXR1cm5lZCB0byB0
aGUgY2FsbGluZyBwcm9jZXNzIHdoZW4KKwkJICogYXR0ZW1wdGluZyB0byB1c2UgSU5PREVfRVZF
TlRTIHdpdGhvdXQgRkFOX1JFUE9SVF9GSUQKKwkJICogc3BlY2lmaWVkIG9uIHRoZSBub3RpZmlj
YXRpb24gZ3JvdXAsIG9yIHVzaW5nCisJCSAqIElOT0RFX0VWRU5UUyB3aXRoIG1hcmsgdHlwZSBG
QU5fTUFSS19NT1VOVC4KKwkJICovCisJCWlmIChlcnJubyA9PSBFSU5WQUwpIHsKKwkJCXRzdF9y
ZXMoVFBBU1MsCisJCQkJInJldD0lZCwgZmFub3RpZnlfbWFyayglZCwgRkFOX01BUktfQUREIHwg
JXgsICIKKwkJCQkiJWxseCwgQVRfRkRDV0QsICVzKSBmYWlsZWQgd2l0aCBlcnJvciBFSU5WQUwg
IgorCQkJCSJhcyBleHBlY3RlZCIsCisJCQkJcmV0LAorCQkJCWZhbm90aWZ5X2ZkLAorCQkJCXRj
LT5tYXJrX2ZsYWdzLAorCQkJCXRjLT5tYXNrLAorCQkJCUZJTEUxKTsKKwkJCXJldHVybjsKKwkJ
fQorCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLAorCQkJInJldD0lZCwgZmFub3RpZnlfbWFyaygl
ZCwgRkFOX01BUktfQUREIHwgJXgsICVsbHgsICIKKwkJCSJBVF9GRENXRCwgJXMpIGZhaWxlZCIs
CisJCQlyZXQsCisJCQlmYW5vdGlmeV9mZCwKKwkJCXRjLT5tYXJrX2ZsYWdzLAorCQkJdGMtPm1h
c2ssCisJCQlGSUxFMSk7CisJfQorCisJdHN0X3JlcyhURkFJTCwKKwkJImZhbm90aWZ5X2ZkPSVk
LCByZXQ9JWQsIGZhbm90aWZ5X2luaXQoJXgsIE9fUkRPTkxZKSBhbmQgIgorCQkiZmFub3RpZnlf
bWFyayglZCwgRkFOX01BUktfQUREIHwgJXgsICVsbHgsIEFUX0ZEQ1dELCAlcykgZGlkICIKKwkJ
Im5vdCByZXR1cm4gYW55IGVycm9ycyBhcyBleHBlY3RlZCIsCisJCWZhbm90aWZ5X2ZkLAorCQly
ZXQsCisJCXRjLT5pbml0X2ZsYWdzLAorCQlmYW5vdGlmeV9mZCwKKwkJdGMtPm1hcmtfZmxhZ3Ms
CisJCXRjLT5tYXNrLAorCQlGSUxFMSk7Cit9CisKK3N0YXRpYyB2b2lkIGRvX2NsZWFudXAodm9p
ZCkKK3sKKwlpZiAoZmFub3RpZnlfZmQgPiAwKQorCQlTQUZFX0NMT1NFKGZhbm90aWZ5X2ZkKTsK
K30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS5uZWVkc19yb290ID0gMSwK
Kwkuc2V0dXAgPSBkb19zZXR1cCwKKwkudGVzdCA9IGRvX3Rlc3QsCisJLnRjbnQgPSBBUlJBWV9T
SVpFKHRlc3RfY2FzZXMpLAorCS5jbGVhbnVwID0gZG9fY2xlYW51cCwKKwkubW91bnRfZGV2aWNl
ID0gMSwKKwkubW50cG9pbnQgPSBNTlRQT0lOVCwKKwkuYWxsX2ZpbGVzeXN0ZW1zID0gMQorfTsK
KworI2Vsc2UKKwlUU1RfVEVTVF9DT05GKCJTeXN0ZW0gZG9lcyBub3QgaGF2ZSByZXF1aXJlZCBm
YW5vdGlmeSBzdXBwb3J0IikKKyNlbmRpZgotLSAKMi4yMS4wCgoKLS0gCk1hdHRoZXcgQm9icm93
c2tpCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
