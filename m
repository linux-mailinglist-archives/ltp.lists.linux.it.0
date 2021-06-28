Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C340A3B57D8
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:30:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8470D3C76D7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:30:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 747EE3C291C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:30:40 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EE847200939
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:30:38 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 15S3U9g8090510;
 Mon, 28 Jun 2021 11:30:09 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 28 Jun 2021
 11:30:08 +0800
Date: Mon, 28 Jun 2021 11:30:02 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210628033002.GA1469@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 15S3U9g8090510
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, metan@ucw.cz, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From a151d48235629a125d5db57dd76c96fd951d5293 Mon Sep 17 00:00:00 2001
From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 28 Jun 2021 11:05:54 +0800
Subject: [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount failure

The test sequence
	mount -t cgroup -o <controllers> <path>
	mkdir <path>/<dir>
	rmdir <path>/<dir>
	umount <path>
	mount -t cgroup -o <controllers> <path>
would easily fail at the last mount with -EBUSY.

The reason is that this test sequence have the chance of
missing a release code path when doing rmdir and umount.

Add sync between every "rmdir, umount" pair to fix the problem.

Fixes: #839

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 .../kernel/controllers/cgroup/cgroup_regression_test.sh    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
index 1f7f3820e..9a00df101 100755
--- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
+++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
@@ -145,6 +145,7 @@ test2()
 	fi
 
 	rmdir cgroup/0 cgroup/1
+	sync
 	umount cgroup/
 }
 
@@ -193,6 +194,7 @@ test3()
 	wait $pid2 2>/dev/null
 
 	rmdir $cpu_subsys_path/0 2> /dev/null
+	sync
 	umount cgroup/ 2> /dev/null
 	check_kernel_bug
 }
@@ -222,6 +224,7 @@ test4()
 	mount -t cgroup -o none,name=foo cgroup cgroup/
 	mkdir cgroup/0
 	rmdir cgroup/0
+	sync
 	umount cgroup/
 
 	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
@@ -254,6 +257,7 @@ test5()
 	mount -t cgroup none cgroup 2> /dev/null
 	mkdir cgroup/0
 	rmdir cgroup/0
+	sync
 	umount cgroup/ 2> /dev/null
 	check_kernel_bug
 }
@@ -290,6 +294,7 @@ test6()
 
 	mount -t cgroup -o ns xxx cgroup/ > /dev/null 2>&1
 	rmdir cgroup/[1-9]* > /dev/null 2>&1
+	sync
 	umount cgroup/
 	check_kernel_bug
 }
@@ -324,6 +329,7 @@ test_7_1()
 	mkdir $subsys_path/0
 	sleep 100 < $subsys_path/0 &	# add refcnt to this dir
 	rmdir $subsys_path/0
+	sync
 
 	# remount with new subsystems added
 	# since 2.6.28, this remount will fail
@@ -349,6 +355,7 @@ test_7_2()
 	mkdir cgroup/0
 	sleep 100 < cgroup/0 &	# add refcnt to this dir
 	rmdir cgroup/0
+	sync
 
 	# remount with some subsystems removed
 	# since 2.6.28, this remount will fail
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
