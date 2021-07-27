Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC23D6E94
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 08:01:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F72B3C6538
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 08:01:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D49853C1C82
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 08:01:14 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0C7541000D07
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 08:01:13 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 16R60mJb009343;
 Tue, 27 Jul 2021 14:00:48 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 27 Jul 2021 14:00:46 +0800
Date: Tue, 27 Jul 2021 14:00:44 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210727060029.GA16474@atcfdc88>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 16R60mJb009343
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The test sequence
	mount -t cgroup -o <controllers> <path>
	mkdir <path>/<dir>
	rmdir <path>/<dir>
	umount <path>
	mount -t cgroup -o <controllers> <path>
would easily fail at the last mount with -EBUSY on certain platform.

The reason is that this test sequence would have the chance of
missing a release code path when doing rmdir and umount.

Adding a little delay between "rmdir" and "umount" could fix the problem,
so use tst_umount API instead of umount in "rmdir, umount" sequence.

Fixes: #839

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 .../controllers/cgroup/cgroup_regression_test.sh       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
index 1f7f3820e..bc4dbe151 100755
--- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
+++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
@@ -145,7 +145,7 @@ test2()
 	fi
 
 	rmdir cgroup/0 cgroup/1
-	umount cgroup/
+	tst_umount cgroup/	# Avoid possible EBUSY error
 }
 
 #---------------------------------------------------------------------------
@@ -193,7 +193,7 @@ test3()
 	wait $pid2 2>/dev/null
 
 	rmdir $cpu_subsys_path/0 2> /dev/null
-	umount cgroup/ 2> /dev/null
+	tst_umount cgroup/		# Avoid possible EBUSY error
 	check_kernel_bug
 }
 
@@ -222,7 +222,7 @@ test4()
 	mount -t cgroup -o none,name=foo cgroup cgroup/
 	mkdir cgroup/0
 	rmdir cgroup/0
-	umount cgroup/
+	tst_umount cgroup/		# Avoid possible EBUSY error
 
 	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
 		tst_res TFAIL "lockdep BUG was found"
@@ -254,7 +254,7 @@ test5()
 	mount -t cgroup none cgroup 2> /dev/null
 	mkdir cgroup/0
 	rmdir cgroup/0
-	umount cgroup/ 2> /dev/null
+	tst_umount cgroup/		# Avoid possible EBUSY error
 	check_kernel_bug
 }
 
@@ -290,7 +290,7 @@ test6()
 
 	mount -t cgroup -o ns xxx cgroup/ > /dev/null 2>&1
 	rmdir cgroup/[1-9]* > /dev/null 2>&1
-	umount cgroup/
+	tst_umount cgroup/		# Avoid possible EBUSY error
 	check_kernel_bug
 }
 
-- 
2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
