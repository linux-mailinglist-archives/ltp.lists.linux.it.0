Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C32B002
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 10:19:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15E413EA9E1
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 10:19:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5E6403EA506
 for <ltp@lists.linux.it>; Mon, 27 May 2019 10:19:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8E17A600713
 for <ltp@lists.linux.it>; Mon, 27 May 2019 10:19:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,518,1549900800"; d="scan'208";a="64780776"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 May 2019 16:19:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 8F7494CD9DA3;
 Mon, 27 May 2019 16:19:48 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 27 May 2019 16:19:48 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ice_yangxiao@163.com>, <chrubis@suse.cz>
Date: Mon, 27 May 2019 16:19:31 +0800
Message-ID: <1558945171-2252-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <7113d89a-3eb8-5671-bb6a-26cc4cbb69bf@163.com>
References: <7113d89a-3eb8-5671-bb6a-26cc4cbb69bf@163.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 8F7494CD9DA3.A1D5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v4] syscalls/prctl05.c: New test for prctl() with
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
bC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMgIHwgODEgKysrKysrKysrKysrKysrKysrKysrKwog
NCBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVz
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
MDAwMDAwMDAwLi5iYmQyYTljOTgKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwpAQCAtMCwwICsxLDgxIEBACisvLyBTUERYLUxpY2Vu
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
YW5kIC9wcm9jL3NlbGYvY29tbSBuYW1lIHdoZXRoZXIKKyAqICAgbWF0Y2hlcyB0aGUgdGhyZWFk
IG5hbWUuCisgKi8KKworI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgorI2luY2x1ZGUgPHN0cmluZy5o
PgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgorI2luY2x1
ZGUgImxhcGkvcHJjdGwuaCIKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorCitzdGF0aWMgc3RydWN0
IHRjYXNlIHsKKwljaGFyIHNldG5hbWVbMjBdOworCWNoYXIgZXhwbmFtZVsyMF07Cit9IHRjYXNl
c1tdID0geworCXsicHJjdGwwNV90ZXN0IiwgInByY3RsMDVfdGVzdCJ9LAorCXsicHJjdGwwNV90
ZXN0X3h4eHh4IiwgInByY3RsMDVfdGVzdF94eCJ9Cit9OworCitzdGF0aWMgdm9pZCBjaGVja19w
cm9jX2NvbW0oY2hhciAqcGF0aCwgY2hhciAqbmFtZSkKK3sKKwljaGFyIGNvbW1fYnVmWzIwXTsK
KworCVNBRkVfRklMRV9TQ0FORihwYXRoLCAiJXMiLCBjb21tX2J1Zik7CisJaWYgKHN0cmNtcChu
YW1lLCBjb21tX2J1ZikpCisJCXRzdF9yZXMoVEZBSUwsCisJCQkiJXMgaGFzICVzLCBleHBlY3Rl
ZCAlcyIsIHBhdGgsIGNvbW1fYnVmLCBuYW1lKTsKKwllbHNlCisJCXRzdF9yZXMoVFBBU1MsICIl
cyBzZXRzIHRvICVzIiwgcGF0aCwgY29tbV9idWYpOworfQorCitzdGF0aWMgdm9pZCB2ZXJpZnlf
cHJjdGwodW5zaWduZWQgaW50IG4pCit7CisJY2hhciBidWZbMjBdOworCWNoYXIgY29tbV9wYXRo
WzQwXTsKKwlwaWRfdCB0aWQ7CisJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07CisKKwlU
RVNUKHByY3RsKFBSX1NFVF9OQU1FLCB0Yy0+c2V0bmFtZSkpOworCWlmIChUU1RfUkVUID09IC0x
KSB7CisJCXRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAicHJjdGwoUFJfU0VUX05BTUUpIGZhaWxl
ZCIpOworCQlyZXR1cm47CisJfQorCXRzdF9yZXMoVFBBU1MsICJwcmN0bChQUl9TRVRfTkFNRSwg
JyVzJykgc3VjY2VlZGVkIiwgdGMtPnNldG5hbWUpOworCisJVEVTVChwcmN0bChQUl9HRVRfTkFN
RSwgYnVmKSk7CisJaWYgKFRTVF9SRVQgPT0gLTEpIHsKKwkJdHN0X3JlcyhURkFJTCB8IFRURVJS
Tk8sICJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkIik7CisJCXJldHVybjsKKwl9CisKKwlpZiAo
c3RyY21wKHRjLT5leHBuYW1lLCBidWYpKSB7CisJCXRzdF9yZXMoVEZBSUwsCisJCQkicHJjdGwo
UFJfR0VUX05BTUUpIGZhaWxlZCwgZXhwZWN0ZWQgJXMsIGdvdCAlcyIsIHRjLT5leHBuYW1lLCBi
dWYpOworCQlyZXR1cm47CisJfQorCXRzdF9yZXMoVFBBU1MsICJwcmN0bChQUl9HRVRfTkFNRSkg
c3VjY2VlZGVkLCB0aHJlYWQgbmFtZSBpcyAlcyIsIGJ1Zik7CisKKwl0aWQgPSB0c3Rfc3lzY2Fs
bChfX05SX2dldHRpZCk7CisKKwlzcHJpbnRmKGNvbW1fcGF0aCwgIi9wcm9jL3NlbGYvdGFzay8l
ZC9jb21tIiwgdGlkKTsKKwljaGVja19wcm9jX2NvbW0oY29tbV9wYXRoLCB0Yy0+ZXhwbmFtZSk7
CisKKwljaGVja19wcm9jX2NvbW0oIi9wcm9jL3NlbGYvY29tbSIsIHRjLT5leHBuYW1lKTsKK30K
Kworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS50ZXN0ID0gdmVyaWZ5X3ByY3Rs
LAorCS50Y250ID0gQVJSQVlfU0laRSh0Y2FzZXMpLAorfTsKLS0gCjIuMTguMQoKCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
