Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BFB1D7080
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 07:49:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B9EE3C4F4C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 07:49:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8D54E3C20BC
 for <ltp@lists.linux.it>; Mon, 18 May 2020 07:49:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A754760079F
 for <ltp@lists.linux.it>; Mon, 18 May 2020 07:49:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,406,1583164800"; d="scan'208";a="92431241"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 May 2020 13:49:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BDA404BCC8B4
 for <ltp@lists.linux.it>; Mon, 18 May 2020 13:49:33 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 May 2020 13:49:37 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 18 May 2020 13:49:36 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 18 May 2020 13:43:35 +0800
Message-ID: <20200518054335.12017-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: BDA404BCC8B4.ADAF4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.c: Take account of
 tst_brk(TCONF)/tst_brk(TFAIL) in summary output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Current summary output doesn't take account of tst_brk(TCONF/TFAIL),
for example:
-----------------------------------------------------
[root@RHEL8U2GA_Intel64 pidfd_send_signal]# ./pidfd_send_signal01
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
../../../../include/lapi/pidfd_send_signal.h:16: CONF: syscall(424) __NR_pidfd_send_signal not supported

Summary:
passed   0
failed   0
skipped  0
warnings 0
-----------------------------------------------------

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 lib/tst_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 0e58060e0..b28521a67 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -316,6 +316,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype,
                const char *fmt, va_list va)
 {
 	print_result(file, lineno, ttype, fmt, va);
+	update_results(TTYPE_RESULT(ttype));
 
 	/*
 	 * The getpid implementation in some C library versions may cause cloned
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
