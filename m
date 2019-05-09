Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6B18990
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 14:20:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE9EA3EAC07
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 14:20:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CF88A3EABC1
 for <ltp@lists.linux.it>; Thu,  9 May 2019 14:20:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B57C7200B34
 for <ltp@lists.linux.it>; Thu,  9 May 2019 14:20:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,449,1549900800"; d="scan'208";a="62258079"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 May 2019 20:20:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id CC57F4CDB77A
 for <ltp@lists.linux.it>; Thu,  9 May 2019 20:20:25 +0800 (CST)
Received: from localhost.localdomain (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 May 2019 20:20:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 9 May 2019 20:20:14 +0800
Message-ID: <1557404414-3797-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: CC57F4CDB77A.A05BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/prctl05.c: New test for prctl() with PR_{SET,
	GET}_NAME
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
CiBpbmNsdWRlL2xhcGkvcHJjdGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKIHJ1
bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvLmdpdGlnbm9yZSB8ICAxICsKIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5jICB8IDUxICsrKysrKysrKysrKysrKysrKysrKysK
IDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5jCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9sYXBpL3ByY3RsLmggYi9pbmNsdWRlL2xhcGkvcHJjdGwuaAppbmRleCBjMzYxMmU2NDMu
LjkxZGE5YzJkNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9sYXBpL3ByY3RsLmgKKysrIGIvaW5jbHVk
ZS9sYXBpL3ByY3RsLmgKQEAgLTksNiArOSwxMSBAQAogCiAjaW5jbHVkZSA8c3lzL3ByY3RsLmg+
CiAKKyNpZm5kZWYgUFJfU0VUX05BTUUKKyMgZGVmaW5lIFBSX1NFVF9OQU1FIDE1CisjIGRlZmlu
ZSBQUl9HRVRfTkFNRSAxNgorI2VuZGlmCisKICNpZm5kZWYgUFJfU0VUX0NISUxEX1NVQlJFQVBF
UgogIyBkZWZpbmUgUFJfU0VUX0NISUxEX1NVQlJFQVBFUgkzNgogIyBkZWZpbmUgUFJfR0VUX0NI
SUxEX1NVQlJFQVBFUgkzNwpkaWZmIC0tZ2l0IGEvcnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qv
c3lzY2FsbHMKaW5kZXggNTFiZmYyOTkwLi45NTA2MTViZWYgMTAwNjQ0Ci0tLSBhL3J1bnRlc3Qv
c3lzY2FsbHMKKysrIGIvcnVudGVzdC9zeXNjYWxscwpAQCAtODY0LDYgKzg2NCw3IEBAIHByY3Rs
MDEgcHJjdGwwMQogcHJjdGwwMiBwcmN0bDAyCiBwcmN0bDAzIHByY3RsMDMKIHByY3RsMDQgcHJj
dGwwNAorcHJjdGwwNSBwcmN0bDA1CiAKIHByZWFkMDEgcHJlYWQwMQogcHJlYWQwMV82NCBwcmVh
ZDAxXzY0CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsLy5naXRp
Z25vcmUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsLy5naXRpZ25vcmUKaW5kZXgg
MWMzZGEzMDUyLi45ZWNhZjk4NTQgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvcHJjdGwvLmdpdGlnbm9yZQorKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3Rs
Ly5naXRpZ25vcmUKQEAgLTIsMyArMiw0IEBACiAvcHJjdGwwMgogL3ByY3RsMDMKIC9wcmN0bDA0
CisvcHJjdGwwNQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9w
cmN0bDA1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjhhMGVhMmViMwotLS0gL2Rldi9udWxs
CisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvcHJjdGwwNS5jCkBAIC0wLDAg
KzEsNTEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisv
KgorICogQ29weXJpZ2h0IChjKSAyMDE5IEZVSklUU1UgTElNSVRFRC4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyAqIEF1dGhvcjogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4K
KyAqCisgKiBUZXN0IFBSX0dFVF9OQU1FIGFuZCBQUl9TRVRfTkFNRSBvZiBwcmN0bCgyKS4KKyAq
IDEpU2V0IHRoZSBuYW1lIG9mIHRoZSBjYWxsaW5nIHRocmVhZCwgdGhlIG5hbWUgY2FuIGJlIHVw
IHRvIDE2IGJ5dGVzCisgKiAgIGxvbmcsIGluY2x1ZGluZyB0aGUgdGVybWluYXRpbmcgbnVsbCBi
eXRlLiBJZiBleGNlZWRzIDE2IGJ5dGVzLCB0aGUKKyAqICAgc3RyaW5nIGlzIHNpbGVudGx5IHRy
dW5jYXRlZC4KKyAqIDIpUmV0dXJuIHRoZSBuYW1lIG9mIHRoZSBjYWxsaW5nIHRocmVhZCwgdGhl
IGJ1ZmZlciBzaG91bGQgYWxsb3cgc3BhY2UKKyAqICAgZm9yIHVwIHRvIDE2IGJ5dGVzLCB0aGUg
cmV0dXJuZWQgc3RyaW5nIHdpbGwgYmUgbnVsbC10ZXJtaW5hdGVkLgorICovCisKKyNpbmNsdWRl
IDxlcnJuby5oPgorI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgorI2luY2x1ZGUgPHN0cmluZy5oPgor
I2luY2x1ZGUgPGxhcGkvcHJjdGwuaD4KKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorCisjZGVmaW5l
IHRocmVhZF9uYW1lICJwcmN0bDA1X3Rlc3RfeHh4eHgiCisKK3N0YXRpYyB2b2lkIHZlcmlmeV9w
cmN0bCh2b2lkKQoreworCWNoYXIgYnVmWzIwXTsKKworCVRFU1QocHJjdGwoUFJfU0VUX05BTUUs
ICZ0aHJlYWRfbmFtZSkpOworCWlmIChUU1RfUkVUID09IC0xKSB7CisJCXRzdF9yZXMoVEZBSUwg
fCBUVEVSUk5PLCAicHJjdGwoUFJfU0VUX05BTUUpIGZhaWxlZCIpOworCQlyZXR1cm47CisJfQor
CXRzdF9yZXMoVFBBU1MsICJwcmN0bChQUl9TRVRfTkFNRSkgc3VjY2VlZGVkLCBzZXQgdGhyZWFk
IG5hbWUgYXMgIgorCQkJInByY3RsMDVfdGVzdF94eHh4eCIpOworCisJVEVTVChwcmN0bChQUl9H
RVRfTkFNRSwgJmJ1ZikpOworCWlmIChUU1RfUkVUID09IC0xKSB7CisJCXRzdF9yZXMoVEZBSUwg
fCBUVEVSUk5PLCAicHJjdGwoUFJfR0VUX05BTUUpIGZhaWxlZCIpOworCQlyZXR1cm47CisJfQor
CisJaWYgKCFzdHJuY21wKHRocmVhZF9uYW1lLCBidWYsIDE1KSAmJiBzdHJsZW4oYnVmKSA9PSAx
NSkKKwkJdHN0X3JlcyhUUEFTUywgInByY3RsKFBSX0dFVF9OQU1FKSBzdWNjZWVkZWQsICIKKwkJ
CQkidGhyZWFkIG5hbWUgaXMgJXMiLCBidWYpOworCWVsc2UKKwkJdHN0X3JlcyhURkFJTCwKKwkJ
CSJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkIHRvIHRydW5jYXRlIHRoZSBuYW1lIGludG8gIgor
CQkJIjE2IGJ5dGUgbG9uZyIpOworfQorCitzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7
CisJLnRlc3RfYWxsID0gdmVyaWZ5X3ByY3RsLAorfTsKLS0gCjIuMTguMQoKCgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
