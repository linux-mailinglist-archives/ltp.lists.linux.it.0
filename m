Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C58227A082
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98B3A3C1D4B
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 07:46:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8F1593C1D25
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id AED321000CEF
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 07:46:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,325,1559491200"; d="scan'208";a="72503932"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 13:46:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 5869D4CDE8B9;
 Tue, 30 Jul 2019 13:46:08 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 30 Jul 2019 13:46:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <pvorel@suse.cz>
Date: Tue, 30 Jul 2019 13:45:32 +0800
Message-ID: <1564465533-2475-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20190729144227.GA8824@dell5510>
 <1564465533-2475-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 5869D4CDE8B9.AEB9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] m4: remove useless ltp-cgroupstats.m4
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

Since commit ef772539, LTP_CHECK_CGROUPSTATS has been removed. But
testcase still used it. It looks like a mistakenly deletion. Removing
ltp-cgroupstats.m4, check linux/cgroupstats.h in configure.ac.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 configure.ac          | 1 +
 m4/ltp-cgroupstats.m4 | 8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 m4/ltp-cgroupstats.m4

diff --git a/configure.ac b/configure.ac
index 70c6fef5b..6a3952622 100644
--- a/configure.ac
+++ b/configure.ac
@@ -38,6 +38,7 @@ AC_CHECK_HEADERS([ \
     linux/can.h \
     linux/dccp.h \
     linux/cryptouser.h \
+    linux/cgroupstats.h \
     linux/genetlink.h \
     linux/keyctl.h \
     linux/if_alg.h \
diff --git a/m4/ltp-cgroupstats.m4 b/m4/ltp-cgroupstats.m4
deleted file mode 100644
index 527f719ac..000000000
--- a/m4/ltp-cgroupstats.m4
+++ /dev/null
@@ -1,8 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Copyright (c) Linux Test Project, 2009
-
-AC_DEFUN([LTP_CHECK_CGROUPSTATS],
-[
-AC_CHECK_HEADERS(linux/cgroupstats.h,[LTP_CHECK_CGROUPSTATS_HEADER=yes])
-AC_SUBST(LTP_CHECK_CGROUPSTATS_HEADER)
-])
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
