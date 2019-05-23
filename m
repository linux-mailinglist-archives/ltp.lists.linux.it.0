Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3827BD8
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 13:36:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A62ED3EA7AC
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 13:36:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 37EDD3EA19C
 for <ltp@lists.linux.it>; Thu, 23 May 2019 13:36:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C8D2320163C
 for <ltp@lists.linux.it>; Thu, 23 May 2019 13:35:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,502,1549900800"; d="scan'208";a="64311882"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 May 2019 19:35:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id DDC5D4C4BD33;
 Thu, 23 May 2019 19:35:54 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 23 May 2019 19:35:53 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 23 May 2019 19:35:33 +0800
Message-ID: <1558611333-10161-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190523094003.GC30616@rei.lan>
References: <20190523094003.GC30616@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: DDC5D4C4BD33.AF445
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v2] syscalls/prctl05.c: New test for prctl() with
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
bC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKwog
NCBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVz
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
MDAwMDAwMDAwLi5mYWQ1YjIzYmYKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwpAQCAtMCwwICsxLDcxIEBACisvLyBTUERYLUxpY2Vu
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
bmFtZSB3aGV0aGVyIG1hdGNoZXMgdGhlIHRocmVhZF9uYW1lLgorICovCisKKyNpbmNsdWRlIDxl
cnJuby5oPgorI2luY2x1ZGUgPHN5cy90eXBlcy5oPgorI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgor
I2luY2x1ZGUgPHN0cmluZy5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSAibGFwaS9z
eXNjYWxscy5oIgorI2luY2x1ZGUgImxhcGkvcHJjdGwuaCIKKyNpbmNsdWRlICJ0c3RfdGVzdC5o
IgorCisjZGVmaW5lIHRocmVhZF9uYW1lICJwcmN0bDA1X3Rlc3RfeHh4eHgiCisKK3N0YXRpYyB2
b2lkIHZlcmlmeV9wcmN0bCh2b2lkKQoreworCWNoYXIgYnVmWzIwXTsKKwljaGFyIGNvbW1fYnVm
WzIwXTsKKwljaGFyIFBST0NfTkFNRV9QQVRIWzQwXTsKKwlwaWRfdCB0aWQ7CisKKwlURVNUKHBy
Y3RsKFBSX1NFVF9OQU1FLCAmdGhyZWFkX25hbWUpKTsKKwlpZiAoVFNUX1JFVCA9PSAtMSkgewor
CQl0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgInByY3RsKFBSX1NFVF9OQU1FKSBmYWlsZWQiKTsK
KwkJcmV0dXJuOworCX0KKwl0c3RfcmVzKFRQQVNTLAorCQkicHJjdGwoUFJfU0VUX05BTUUpIHN1
Y2NlZWRlZCwgc2V0IHRocmVhZCBuYW1lIGFzIHByY3RsMDVfdGVzdF94eHh4eCIpOworCisJVEVT
VChwcmN0bChQUl9HRVRfTkFNRSwgJmJ1ZikpOworCWlmIChUU1RfUkVUID09IC0xKSB7CisJCXRz
dF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAicHJjdGwoUFJfR0VUX05BTUUpIGZhaWxlZCIpOworCQly
ZXR1cm47CisJfQorCisJYnVmWzE5XSA9ICdcMCc7CisJaWYgKCFzdHJuY21wKHRocmVhZF9uYW1l
LCBidWYsIDE1KSAmJiBzdHJsZW4oYnVmKSA9PSAxNSkKKwkJdHN0X3JlcyhUUEFTUywgInByY3Rs
KFBSX0dFVF9OQU1FKSBzdWNjZWVkZWQsICIKKwkJCQkidGhyZWFkIG5hbWUgaXMgJXMiLCBidWYp
OworCWVsc2UKKwkJdHN0X3JlcyhURkFJTCwKKwkJCSJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVk
IHRvIHRydW5jYXRlIHRoZSBuYW1lIGludG8gMTYgYnl0ZSBsb25nIik7CisKKwl0aWQgPSB0c3Rf
c3lzY2FsbChfX05SX2dldHRpZCk7CisKKwlzcHJpbnRmKFBST0NfTkFNRV9QQVRILCAiL3Byb2Mv
c2VsZi90YXNrLyVkL2NvbW0iLCB0aWQpOworCVNBRkVfRklMRV9TQ0FORihQUk9DX05BTUVfUEFU
SCwgIiVzIiwgY29tbV9idWYpOworCWlmIChzdHJjbXAoYnVmLCBjb21tX2J1ZikpCisJCXRzdF9y
ZXMoVEZBSUwsCisJCQkiJXMgc2V0cyBuYW1lIGZhaWxlZCwgZXhwZWN0ZWQgcHJjdGwxMDVfdGVz
dF94eCwgZ290ICVzIiwKKwkJCVBST0NfTkFNRV9QQVRILCBjb21tX2J1Zik7CisJZWxzZQorCQl0
c3RfcmVzKFRQQVNTLCAiJXMgc2V0cyB0aHJlYWQgbmFtZSBzdWNjZWVkIGFzICVzIiwKKwkJCVBS
T0NfTkFNRV9QQVRILCBjb21tX2J1Zik7CisKK30KKworc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0
ZXN0ID0geworCS50ZXN0X2FsbCA9IHZlcmlmeV9wcmN0bCwKK307Ci0tIAoyLjE4LjEKCgoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
