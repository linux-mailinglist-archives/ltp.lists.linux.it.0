Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A137A080
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA88D3C1D2B
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6ADFF3C1D03
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:02 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 11778200E14
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,325,1559491200"; d="scan'208";a="72503915"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 13:45:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 3DEED4CDE889;
 Tue, 30 Jul 2019 13:46:02 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 30 Jul 2019 13:45:58 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <pvorel@suse.cz>
Date: Tue, 30 Jul 2019 13:45:30 +0800
Message-ID: <1564465533-2475-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20190729144227.GA8824@dell5510>
 <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 3DEED4CDE889.AFC63
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/5] m4: remove useless ltp-time.m4
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

No testcase used these macros defined in ltp-time.m4, and these
(CLOCK_MONOTONIC_RAW, CLOCK_REALTIME_COARSE, CLOCK_MONOTONIC_COARSE)
have been defined in lapi/posix_clocks.h. Removing it is safe.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac   |  1 -
 m4/ltp-time.m4 | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 m4/ltp-time.m4

diff --git a/configure.ac b/configure.ac
index 640ba0cba..b0eddcbf8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -253,7 +253,6 @@ LTP_CHECK_SYSCALL_QUOTACTL
 LTP_CHECK_SYSCALL_SIGNALFD
 LTP_CHECK_SYSCALL_UTIMENSAT
 LTP_CHECK_TASKSTATS
-LTP_CHECK_TIME
 LTP_CHECK_TIMERFD
 test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
 LTP_CHECK_TPACKET_V3
diff --git a/m4/ltp-time.m4 b/m4/ltp-time.m4
deleted file mode 100644
index 205ba6d5a..000000000
--- a/m4/ltp-time.m4
+++ /dev/null
@@ -1,12 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Author: Ngie Cooper <yaneurabeya@gmail.com>
-
-dnl For all directly related time syscalls
-AC_DEFUN([LTP_CHECK_TIME],[
-	AC_CHECK_DECLS([CLOCK_MONOTONIC_RAW, CLOCK_REALTIME_COARSE, CLOCK_MONOTONIC_COARSE],,,[
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif
-#include <time.h>
-])
-])
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
