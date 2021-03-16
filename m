Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2D33D122
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 10:50:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88ABB3C55F4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 10:50:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 678503C2D4C
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 10:50:43 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 672531400C5D
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 10:50:41 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Aeslk06r3d3l9Q8WlXOi0xGsaV5rLeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItPKhHO27QX3a/YNo+oV5B9qfdSTvpW?=
 =?us-ascii?q?fAFu9fxKTvzzDqEyf9ss5xvJ0LT4FQE9v1ZGIase/fwC2VV+kt28OG9qfAv5a6?=
 =?us-ascii?q?815IQRtxY69tqydVYzzrcXFefwVNCZonGJf03KMuyAaIQ2gdbciwGxA+Lor+ju?=
 =?us-ascii?q?DM/aiHXTc2QzYj6CSryQij8aPGFXGjtSs2YndixqgD/AH+/zDE2g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,251,1610380800"; d="scan'208";a="105740387"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Mar 2021 17:50:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5DC144CEACD3
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:50:36 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 17:50:35 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 16 Mar 2021 17:50:54 +0800
Message-ID: <1615888254-31940-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5DC144CEACD3.A0333
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] pidns13: Use getpid syscall directly instead of glibc
 wrapper
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

As clone(2) man-pages said "GNU C library versions 2.3.4 up to and including
2.24 contained a wrapper function for getpid(2) that performed caching of PIDs.
This caching relied on support in the glibc wrapper for clone(), but limitations
in the implementation meant that the cache was not up to date in some circumstances".

Because of the stale-cache problem, as well as other problems noted in getpid(2), the
PID caching feature was removed in glibc 2.25

To get the truth, always use getpid syscall instead of getting value from cache.
It fixes failure on centos7.

Reported-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/containers/pidns/pidns13.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/containers/pidns/pidns13.c b/testcases/kernel/containers/pidns/pidns13.c
index 12aee917b..c27ef51b4 100644
--- a/testcases/kernel/containers/pidns/pidns13.c
+++ b/testcases/kernel/containers/pidns/pidns13.c
@@ -54,7 +54,7 @@ static void child_fn(unsigned int cinit_no)
 	pid_t pid, ppid;
 	int flags;
 
-	pid = getpid();
+	pid = tst_syscall(__NR_getpid);
 	ppid = getppid();
 	if (pid != CHILD_PID || ppid != PARENT_PID)
 		tst_brk(TBROK, "cinit%u: pidns not created.", cinit_no);
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
