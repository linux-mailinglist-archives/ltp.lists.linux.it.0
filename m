Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 911671C7A7
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 13:18:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 659393EA2ED
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 13:18:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 538FC3EA1D3
 for <ltp@lists.linux.it>; Tue, 14 May 2019 13:18:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C738014019D8
 for <ltp@lists.linux.it>; Tue, 14 May 2019 13:18:02 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,468,1549900800"; d="scan'208";a="62986018"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 May 2019 19:17:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id 454F54CDC844
 for <ltp@lists.linux.it>; Tue, 14 May 2019 19:17:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.28) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 May 2019 19:17:58 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 13 May 2019 09:46:05 +0800
Message-ID: <1557711965-11638-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.28]
X-yoursite-MailScanner-ID: 454F54CDC844.AFDA2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.5 required=7.0 tests=DATE_IN_PAST_24_48
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscall/ioctl: fix compiler error
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

IkNMT05FX05FV1BJRCIgYW5kICJDTE9ORV9ORVdVU0VSIiBhcmUgbm90IGRlZmluZWQgb24gc29t
ZSBvbGQgZGlzdHJvcywKc28gaW5jbHVkZSAibGFwaS9uYW1lc3BhY2VzX2NvbnN0YW50cy5oIiB0
byBmaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBKaW5odWkgaHVhbmcgPGh1YW5namguanlAY24uZnVq
aXRzdS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczAx
LmMgfCAxICsKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNS5jIHwg
MSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDYuYyB8IDEgKwog
MyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCmluZGV4IDU5YjIxNWYuLmYyYzc3YTAgMTAwNjQ0Ci0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCisrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwMS5jCkBAIC0xOSw2ICsxOSw3
IEBACiAjaW5jbHVkZSA8c2NoZWQuaD4KICNpbmNsdWRlICJ0c3RfdGVzdC5oIgogI2luY2x1ZGUg
ImxhcGkvaW9jdGxfbnMuaCIKKyNpbmNsdWRlICJsYXBpL25hbWVzcGFjZXNfY29uc3RhbnRzLmgi
CiAKICNkZWZpbmUgU1RBQ0tfU0laRSAoMTAyNCAqIDEwMjQpCiAKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbnMwNS5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczA1LmMKaW5kZXggYWRkNjk4MC4uYmRlZjRkNiAxMDA2
NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczA1LmMKKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczA1LmMKQEAgLTE4LDYg
KzE4LDcgQEAKICNpbmNsdWRlIDxzY2hlZC5oPgogI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAjaW5j
bHVkZSAibGFwaS9pb2N0bF9ucy5oIgorI2luY2x1ZGUgImxhcGkvbmFtZXNwYWNlc19jb25zdGFu
dHMuaCIKIAogI2RlZmluZSBTVEFDS19TSVpFICgxMDI0ICogMTAyNCkKIApkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9uczA2LmMgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDYuYwppbmRleCBmMDc3YTNiLi5lYWJiN2U0
IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDYu
YworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX25zMDYuYwpAQCAt
MTksNiArMTksNyBAQAogI2luY2x1ZGUgPHNjaGVkLmg+CiAjaW5jbHVkZSAidHN0X3Rlc3QuaCIK
ICNpbmNsdWRlICJsYXBpL2lvY3RsX25zLmgiCisjaW5jbHVkZSAibGFwaS9uYW1lc3BhY2VzX2Nv
bnN0YW50cy5oIgogCiAjZGVmaW5lIFNUQUNLX1NJWkUgKDEwMjQgKiAxMDI0KQogCi0tIAoxLjgu
My4xCgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
