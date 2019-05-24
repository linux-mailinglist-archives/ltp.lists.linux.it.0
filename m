Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FB29212
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:51:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CFC3294AC6
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:51:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4DB0B3EA1A9
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:51:02 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0A94B20165C
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:50:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,506,1549900800"; d="scan'208";a="64432461"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 May 2019 15:50:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 4BAA44CDB2E5;
 Fri, 24 May 2019 15:50:55 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 May 2019 15:50:51 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ice_yangxiao@163.com>
Date: Fri, 24 May 2019 15:50:46 +0800
Message-ID: <1558684246-2658-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
References: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 4BAA44CDB2E5.A12C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v3] syscalls/prctl05.c: New test for prctl() with
	PR_{SET, GET}_NAME
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

U2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KLS0t
CiBpbmNsdWRlL2xhcGkvcHJjdGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKwogcnVu
dGVzdC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlIHwgIDEgKwogdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMgIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKwog
NCBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xhcGkvcHJjdGwuaCBiL2luY2x1ZGUvbGFwaS9wcmN0bC5oCmluZGV4IGY0MmJkNjQ1OS4u
YWQwYjEyYmNlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xhcGkvcHJjdGwuaAorKysgYi9pbmNsdWRl
L2xhcGkvcHJjdGwuaApAQCAtOSw2ICs5LDExIEBACiAKICNpbmNsdWRlIDxzeXMvcHJjdGwuaD4K
IAorI2lmbmRlZiBQUl9TRVRfTkFNRQorIyBkZWZpbmUgUFJfU0VUX05BTUUgMTUKKyMgZGVmaW5l
IFBSX0dFVF9OQU1FIDE2CisjZW5kaWYKKwogI2lmbmRlZiBQUl9TRVRfU0VDQ09NUAogIyBkZWZp
bmUgUFJfR0VUX1NFQ0NPTVAgIDIxCiAjIGRlZmluZSBQUl9TRVRfU0VDQ09NUCAgMjIKZGlmZiAt
LWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDA0NTU4YTU4
MC4uZDJkY2QyMTUyIDEwMDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qv
c3lzY2FsbHMKQEAgLTg2Miw2ICs4NjIsNyBAQCBwcmN0bDAxIHByY3RsMDEKIHByY3RsMDIgcHJj
dGwwMgogcHJjdGwwMyBwcmN0bDAzCiBwcmN0bDA0IHByY3RsMDQKK3ByY3RsMDUgcHJjdGwwNQog
CiBwcmVhZDAxIHByZWFkMDEKIHByZWFkMDFfNjQgcHJlYWQwMV82NApkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlCmluZGV4IDFjM2RhMzA1Mi4uOWVjYWY5ODU0IDEw
MDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsLy5naXRpZ25vcmUKKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC8uZ2l0aWdub3JlCkBAIC0yLDMgKzIs
NCBAQAogL3ByY3RsMDIKIC9wcmN0bDAzCiAvcHJjdGwwNAorL3ByY3RsMDUKZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5jIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwLi5lMTI4N2FiZGYKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwpAQCAtMCwwICsxLDc2IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorLyoKKyAqIENvcHlyaWdodCAoYykgMjAx
OSBGVUpJVFNVIExJTUlURUQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisgKiBBdXRob3I6IFlhbmcg
WHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+CisgKgorICogVGVzdCBQUl9HRVRfTkFN
RSBhbmQgUFJfU0VUX05BTUUgb2YgcHJjdGwoMikuCisgKiAxKVNldCB0aGUgbmFtZSBvZiB0aGUg
Y2FsbGluZyB0aHJlYWQsIHRoZSBuYW1lIGNhbiBiZSB1cCB0byAxNiBieXRlcworICogICBsb25n
LCBpbmNsdWRpbmcgdGhlIHRlcm1pbmF0aW5nIG51bGwgYnl0ZS4gSWYgZXhjZWVkcyAxNiBieXRl
cywgdGhlCisgKiAgIHN0cmluZyBpcyBzaWxlbnRseSB0cnVuY2F0ZWQuCisgKiAyKVJldHVybiB0
aGUgbmFtZSBvZiB0aGUgY2FsbGluZyB0aHJlYWQsIHRoZSBidWZmZXIgc2hvdWxkIGFsbG93IHNw
YWNlCisgKiAgIGZvciB1cCB0byAxNiBieXRlcywgdGhlIHJldHVybmVkIHN0cmluZyB3aWxsIGJl
IG51bGwtdGVybWluYXRlZC4KKyAqIDMpQ2hlY2sgL3Byb2Mvc2VsZi90YXNrL1t0aWRdL2NvbW0g
bmFtZSB3aGV0aGVyIG1hdGNoZXMgdGhlIHRocmVhZCBuYW1lLgorICovCisKKyNpbmNsdWRlIDxz
eXMvcHJjdGwuaD4KKyNpbmNsdWRlIDxzdHJpbmcuaD4KKyNpbmNsdWRlIDxzdGRpby5oPgorI2lu
Y2x1ZGUgImxhcGkvc3lzY2FsbHMuaCIKKyNpbmNsdWRlICJsYXBpL3ByY3RsLmgiCisjaW5jbHVk
ZSAidHN0X3Rlc3QuaCIKKworc3RhdGljIHN0cnVjdCB0Y2FzZSB7CisJY2hhciBzZXRuYW1lWzIw
XTsKKwljaGFyIGV4cG5hbWVbMjBdOworfSB0Y2FzZXNbXSA9IHsKKwl7InByY3RsMDVfdGVzdCIs
ICJwcmN0bDA1X3Rlc3QifSwKKwl7InByY3RsMDVfdGVzdF94eHh4eCIsICJwcmN0bDA1X3Rlc3Rf
eHgifQorfTsKKworc3RhdGljIHZvaWQgdmVyaWZ5X3ByY3RsKHVuc2lnbmVkIGludCBuKQorewor
CWNoYXIgYnVmWzIwXTsKKwljaGFyIGNvbW1fYnVmWzIwXTsKKwljaGFyIFBST0NfTkFNRV9QQVRI
WzQwXTsKKwlwaWRfdCB0aWQ7CisJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07CisKKwlU
RVNUKHByY3RsKFBSX1NFVF9OQU1FLCB0Yy0+c2V0bmFtZSkpOworCWlmIChUU1RfUkVUID09IC0x
KSB7CisJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAicHJjdGwoUFJfU0VUX05BTUUpIGZhaWxl
ZCIpOworCQlyZXR1cm47CisJfQorCXRzdF9yZXMoVFBBU1MsCisJCSJwcmN0bChQUl9TRVRfTkFN
RSkgc3VjY2VlZGVkLCBzZXQgdGhyZWFkIG5hbWUgYXMgJXMiLCB0Yy0+c2V0bmFtZSk7CisKKwlU
RVNUKHByY3RsKFBSX0dFVF9OQU1FLCBidWYpKTsKKwlpZiAoVFNUX1JFVCA9PSAtMSkgeworCQl0
c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgInByY3RsKFBSX0dFVF9OQU1FKSBmYWlsZWQiKTsKKwkJ
cmV0dXJuOworCX0KKworCWlmIChzdHJjbXAodGMtPmV4cG5hbWUsIGJ1ZikpCisJCXRzdF9yZXMo
VEZBSUwsCisJCQkicHJjdGwoUFJfR0VUX05BTUUpIGZhaWxlZCAsZXhwZWN0ZWQgJXMsIGdvdCAl
cyIsIHRjLT5leHBuYW1lLCBidWYpOworCWVsc2UKKwkJdHN0X3JlcyhUUEFTUywKKwkJCSJwcmN0
bChQUl9HRVRfTkFNRSkgc3VjY2VlZGVkLCB0aHJlYWQgbmFtZSBpcyAlcyIsIGJ1Zik7CisKKwl0
aWQgPSB0c3Rfc3lzY2FsbChfX05SX2dldHRpZCk7CisKKwlzcHJpbnRmKFBST0NfTkFNRV9QQVRI
LCAiL3Byb2Mvc2VsZi90YXNrLyVkL2NvbW0iLCB0aWQpOworCVNBRkVfRklMRV9TQ0FORihQUk9D
X05BTUVfUEFUSCwgIiVzIiwgY29tbV9idWYpOworCWlmIChzdHJjbXAodGMtPmV4cG5hbWUsIGNv
bW1fYnVmKSkKKwkJdHN0X3JlcyhURkFJTCwKKwkJCSIlcyBzZXRzIHRocmVhZCBuYW1lIGZhaWxl
ZCwgZXhwZWN0ZWQgJXMsIGdvdCAlcyIsCisJCQlQUk9DX05BTUVfUEFUSCwgdGMtPmV4cG5hbWUs
IGNvbW1fYnVmKTsKKwllbHNlCisJCXRzdF9yZXMoVFBBU1MsICIlcyBzZXRzIHRocmVhZCBuYW1l
IHN1Y2NlZWQgYXMgJXMiLAorCQkJUFJPQ19OQU1FX1BBVEgsIGNvbW1fYnVmKTsKKworfQorCitz
dGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CisJLnRlc3QgPSB2ZXJpZnlfcHJjdGwsCisJ
LnRjbnQgPSBBUlJBWV9TSVpFKHRjYXNlcyksCit9OwotLSAKMi4xOC4xCgoKCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
