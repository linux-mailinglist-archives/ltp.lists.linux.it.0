Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 732912231FA
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 06:13:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 227CF3C2969
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 06:13:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0DB2D3C1D4B
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 06:13:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6DCEC1A00A30
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 06:13:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,361,1589212800"; d="scan'208";a="96456575"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Jul 2020 12:12:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3C9DC4CE4BD9
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 12:12:51 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Jul 2020 12:12:52 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 17 Jul 2020 12:13:11 +0800
Message-ID: <1594959191-25155-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3C9DC4CE4BD9.A1CC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/io_uring.h: Add declaration of __kernel_rwf_t
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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

U2luY2Uga2VybmVsIGNvbW1pdCBkZGVmN2VkMmI1Y2IgKCJhbm5vdGF0ZSBSV0ZfLi4uIGZsYWdz
IiksIGZzLmggaW50cm9kdWNlZAogX19rZXJuZWxfcndmX3QgZGF0YSB0eXBlIGluIDQuMTQtcmMx
LgoKRml4IGJ1aWxkIGVycm9yIG9uIG9sZCBrZXJuZWwuCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBp
b191cmluZzAxLmM6MjA6Ci4uLy4uLy4uLy4uL2luY2x1ZGUvbGFwaS9pb191cmluZy5oOjM4OiBl
cnJvcjogZXhwZWN0ZWQgc3BlY2lmaWVyLXF1YWxpZmllci1saXN0IGJlZm9yZSDigJhfX2tlcm5l
bF9yd2ZfdOKAmQppb191cmluZzAxLmM6MjY2OiB3YXJuaW5nOiBtaXNzaW5nIGluaXRpYWxpemVy
CmlvX3VyaW5nMDEuYzoyNjY6IHdhcm5pbmc6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJgo
YW5vbnltb3VzKVsxXS5wdHLigJkpCmlvX3VyaW5nMDEuYzoyNjg6IHdhcm5pbmc6IG1pc3Npbmcg
aW5pdGlhbGl6ZXIKaW9fdXJpbmcwMS5jOjI2ODogd2FybmluZzogKG5lYXIgaW5pdGlhbGl6YXRp
b24gZm9yIOKAmHRlc3QuY2Fwc+KAmSkKbWFrZTogKioqIFtpb191cmluZzAxXSBFcnJvciAxCgpT
aWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgotLS0K
IGluY2x1ZGUvbGFwaS9pb191cmluZy5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9pb191cmluZy5oIGIvaW5jbHVk
ZS9sYXBpL2lvX3VyaW5nLmgKaW5kZXggOGU0NzUwMWE1Li40YTg5NzhlODcgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGFwaS9pb191cmluZy5oCisrKyBiL2luY2x1ZGUvbGFwaS9pb191cmluZy5oCkBA
IC0xMiw2ICsxMiw3IEBACiAjaW5jbHVkZSA8dW5pc3RkLmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4K
ICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1
ZGUgPHN5cy91aW8uaD4KICNpbmNsdWRlIDxzdGRsaWIuaD4KICNpbmNsdWRlIDxsaW51eC9mcy5o
PgpAQCAtMjAsNiArMjEsMTAgQEAKIAogI2lmbmRlZiBJT1NRRV9GSVhFRF9GSUxFCiAKKyNpZm5k
ZWYgX19rZXJuZWxfcndmX3QKK3R5cGVkZWYgaW50IF9fYml0d2lzZSBfX2tlcm5lbF9yd2ZfdDsK
KyNlbmRpZgorCiAvKgogICogSU8gc3VibWlzc2lvbiBkYXRhIHN0cnVjdHVyZSAoU3VibWlzc2lv
biBRdWV1ZSBFbnRyeSkKICAqLwotLSAKMi4yMy4wCgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
