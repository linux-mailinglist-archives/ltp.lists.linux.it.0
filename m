Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09E187A4D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:26:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F7663C55CD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:26:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A5EF13C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:26:55 +0100 (CET)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD05B1000CC6
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:26:54 +0100 (CET)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 417C019324C7BB122FB3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 15:26:49 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Mar 2020 15:26:38 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Mar 2020 15:33:20 +0800
Message-ID: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] open_posix_testsuite: Enable the testsuite
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Enable open posix testsuite compilation by default

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 testcases/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/testcases/Makefile b/testcases/Makefile
index b04e630..ae1cafc 100644
--- a/testcases/Makefile
+++ b/testcases/Makefile
@@ -30,10 +30,6 @@ include $(top_srcdir)/include/mk/env_pre.mk
 #    run).
 FILTER_OUT_DIRS		:= kdump

-ifneq ($(WITH_OPEN_POSIX_TESTSUITE),yes)
-FILTER_OUT_DIRS		+= open_posix_testsuite
-endif
-
 ifneq ($(WITH_REALTIME_TESTSUITE),yes)
 FILTER_OUT_DIRS		+= realtime
 endif
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
