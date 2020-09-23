Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D32753EC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:02:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2529D3C4D5F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:02:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C704E3C29CE
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:02:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E861B1000A47
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:02:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,293,1596470400"; d="scan'208";a="99538162"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Sep 2020 17:02:49 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id CA33F48990FC
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 17:02:48 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Sep 2020 17:02:48 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 23 Sep 2020 17:02:46 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 23 Sep 2020 16:44:22 +0800
Message-ID: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CA33F48990FC.A9021
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/recvmmsg01.c: Fix a compiler error
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

VXNlIGNvcnJlY3QgdHMudHlwZSB0byBmaXggdGhlIGZvbGxvd2luZyBjb21waWxlciBlcnJvcjoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcmVjdm1tc2cwMS5j
Ojg2Ojk6IGVycm9yOiByZXF1ZXN0IGZvciBtZW1iZXIg4oCYdHlwZeKAmSBpbiBzb21ldGhpbmcg
bm90IGEgc3RydWN0dXJlIG9yIHVuaW9uCiAgdGltZW91dC50eXBlID0gdHYtPnRzX3R5cGU7Ci0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpGaXhlczogMTM1YWY4
ZWRlZGQ0ICgic3lzY2FsbHMve3NlbmR8cmVjdn1tbXNnOiBhZGQgYSB0ZXN0IGNhc2UgZm9yIHRp
bWVvdXQgYW5kIGVycm5vIHRlc3QiKQpTaWduZWQtb2ZmLWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5
QGNuLmZ1aml0c3UuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcmVjdm1tc2cv
cmVjdm1tc2cwMS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9yZWN2bW1z
Zy9yZWN2bW1zZzAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3JlY3ZtbXNnL3JlY3Zt
bXNnMDEuYwppbmRleCBmZTYzNzQzMGIuLmQzZjJkZjZkOSAxMDA2NDQKLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2bW1zZzAxLmMKKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9yZWN2bW1zZy9yZWN2bW1zZzAxLmMKQEAgLTgzLDcgKzgzLDcgQEAgc3Rh
dGljIHZvaWQgZG9fdGVzdCh1bnNpZ25lZCBpbnQgaSkKIAltZW1zZXQocmN2MS0+aW92X2Jhc2Us
IDAsIHJjdjEtPmlvdl9sZW4pOwogCW1lbXNldChyY3YyLT5pb3ZfYmFzZSwgMCwgcmN2Mi0+aW92
X2xlbik7CiAKLQl0aW1lb3V0LnR5cGUgPSB0di0+dHNfdHlwZTsKKwl0cy50eXBlID0gdHYtPnRz
X3R5cGU7CiAJdHN0X3RzX3NldF9zZWMoJnRzLCB0Yy0+dHZfc2VjKTsKIAl0c3RfdHNfc2V0X25z
ZWMoJnRzLCB0Yy0+dHZfbnNlYyk7CiAKLS0gCjIuMjUuMQoKCgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
