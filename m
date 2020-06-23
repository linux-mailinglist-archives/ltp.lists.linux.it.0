Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C0204A33
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 08:50:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA63C3C5E02
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 08:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C78BC3C2239
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:50:30 +0200 (CEST)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CF8E3200395
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:50:28 +0200 (CEST)
IronPort-SDR: CXrfYnsyYsAnlEf2aYu9uPUoob+s2LR00pibDFDa9hCBREDZua0cQF9kKAWdFrL3/+Z+GWQ1if
 tbZ/ZaU1bzJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142238376"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="142238376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 23:50:25 -0700
IronPort-SDR: DQD1I1pkEJJbPU88OSzGhNmY2BHqWY3vBB3ulvx/JeSv/nWNda1eGTMeGACmxItCDXEMV4aILh
 uLwPm8ctZqwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="353714416"
Received: from yixin-dev.sh.intel.com ([10.239.161.27])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2020 23:50:24 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Tue, 23 Jun 2020 14:44:24 +0800
Message-Id: <20200623064424.15273-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] lib/newlib_tests: add test21 into .gitignore
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add newly added test21 into .gitignore.

Fixes: 3b716981bd54 ("lib: add new cgroup test API")
Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 lib/newlib_tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index fee8795b6bc0..44bc6526fea6 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -24,6 +24,7 @@ test17
 test18
 test19
 test20
+test21
 tst_expiration_timer
 test_assert
 test_timer
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
