Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0D3B26D
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:50:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B9EC3EB02B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 11:50:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 71B8E3EB01C
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:50:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CC8DE1000C24
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 11:49:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,572,1557158400"; d="scan'208";a="66738129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2019 17:49:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 822204CDD0B1
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 17:49:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.28) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 10 Jun 2019 17:50:00 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 10 Jun 2019 17:49:49 +0800
Message-ID: <1560160189-21242-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: 822204CDD0B1.ABFBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02.c: Add new check for EINVAL
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

QWRkIGEgbmV3IGNoZWNrcG9pbnQgdGhhdCBjb3B5X2ZpbGVfcmFuZ2UoKSByZXR1cm5zIEVJTlZB
TCB3aGVuCmNvcHlpbmcgY29udGVudHMgdG8gbm9uIHJlZ3VsYXIgZmlsZS4KClNpZ25lZC1vZmYt
Ynk6IEppbmh1aSBodWFuZyA8aHVhbmdqaC5qeUBjbi5mdWppdHN1LmNvbT4KLS0tCiAuLi4va2Vy
bmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jICAgIHwgMTQg
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxl
X3JhbmdlMDIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2Nv
cHlfZmlsZV9yYW5nZTAyLmMKaW5kZXggMDdjMDIwNy4uZGI5OTM0NCAxMDA2NDQKLS0tIGEvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIu
YworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2Zp
bGVfcmFuZ2UwMi5jCkBAIC0xOSw2ICsxOSwxMyBAQAogICogICAgLT4gRUJBREYKICAqIDYpIFRy
eSB0byBjb3B5IGNvbnRlbnRzIHdpdGggaW52YWxpZCAnZmxhZ3MnIHZhbHVlCiAgKiAgICAtPiBF
SU5WQUwKKyAqIDcpIFRyeSB0byBjb3B5IGNvbnRlbnRzIHRvIHBpcGUgLT5FSU5WQUwKKyAqCisg
KiBOb3RlOgorICogY29weV9maWxlX3JhbmdlKCkgcmV0dXJucyBFSVNESVIgYW5kIEVJTlZBTCB3
aGVuIGNvcHlpbmcgY29udGVudHMgdG8KKyAqIGRpcmVjdG9yeSBhbmQgYW55IG90aGVyIG5vbiBy
ZWd1YWxyIGZpbGVzIHNpbmNlIHRoZSBjb21taXQ6CisgKiAxMWNiZmIxMDc3NWEgdmZzOiBkZW55
IGNvcHlfZmlsZV9yYW5nZSgpIGZvciBub24gcmVndWxhciBmaWxlcworICoKICAqLwogCiAjZGVm
aW5lIF9HTlVfU09VUkNFCkBAIC0zMyw2ICs0MCw3IEBAIHN0YXRpYyBpbnQgZmRfbW50ZWQ7CiBz
dGF0aWMgaW50IGZkX2RpcjsKIHN0YXRpYyBpbnQgZmRfY2xvc2VkOwogc3RhdGljIGludCBmZF9h
cHBlbmQ7CitzdGF0aWMgaW50IGZkX3BpcGVbMl07CiAKIHN0YXRpYyBzdHJ1Y3QgdGNhc2Ugewog
CWludAkqY29weV90b19mZDsKQEAgLTQ1LDYgKzUzLDcgQEAgc3RhdGljIHN0cnVjdCB0Y2FzZSB7
CiAJeyZmZF9hcHBlbmQsCTAsCUVCQURGfSwKIAl7JmZkX2Nsb3NlZCwJMCwJRUJBREZ9LAogCXsm
ZmRfZGVzdCwJLTEsCUVJTlZBTH0sCisJeyZmZF9waXBlWzBdLCAgIDAsICAgICAgRUlOVkFMfSwK
IH07CiAKIHN0YXRpYyB2b2lkIHZlcmlmeV9jb3B5X2ZpbGVfcmFuZ2UodW5zaWduZWQgaW50IG4p
CkBAIC04NCw2ICs5MywxMCBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiAJCVNBRkVfQ0xP
U0UoZmRfZGVzdCk7CiAJaWYgKGZkX3NyYyA+IDApCiAJCVNBRkVfQ0xPU0UoZmRfc3JjKTsKKwlp
ZiAoZmRfcGlwZVswXSA+IDApCisJCVNBRkVfQ0xPU0UoZmRfcGlwZVswXSk7CisJaWYgKGZkX3Bp
cGVbMV0gPiAwKQorCQlTQUZFX0NMT1NFKGZkX3BpcGVbMV0pOwogfQogCiBzdGF0aWMgdm9pZCBz
ZXR1cCh2b2lkKQpAQCAtMTAxLDYgKzExNCw3IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiAJ
ZmRfY2xvc2VkID0gLTE7CiAJZmRfYXBwZW5kID0gU0FGRV9PUEVOKEZJTEVfREVTVF9QQVRILAog
CQkJT19SRFdSIHwgT19DUkVBVCB8IE9fQVBQRU5ELCAwNjY0KTsKKwlTQUZFX1BJUEUoZmRfcGlw
ZSk7CiAKIAlTQUZFX1dSSVRFKDEsIGZkX3NyYywgIENPTlRFTlQsICBDT05UU0laRSk7CiB9Ci0t
IAoxLjguMy4xCgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
