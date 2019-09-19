Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13838B779C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 12:41:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914AD3C2112
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 12:41:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2F0A93C20A9
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 12:41:49 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6986B200D21
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 12:41:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,523,1559491200"; d="scan'208";a="75706276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 18:41:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id C44B84CE14E7;
 Thu, 19 Sep 2019 18:41:37 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 19 Sep 2019 18:41:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 19 Sep 2019 18:38:08 +0800
Message-ID: <1568889488-4032-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190919094544.GA21345@rei>
References: <20190919094544.GA21345@rei>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C44B84CE14E7.A2103
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] cgroup_regression_test.sh: Remove obselte test_5
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

test_5 is a very old regresstion test and kernel code has been
rewritten completely since 2.6. No user will use such old kernel
code to test. So I think we can remove it.

Also rename test10 as test5, modify TST_CNT.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 ...ssion_10_1.sh => cgroup_regression_5_1.sh} |   0
 ...ssion_10_2.sh => cgroup_regression_5_2.sh} |   0
 .../cgroup/cgroup_regression_test.sh          | 111 +++---------------
 3 files changed, 18 insertions(+), 93 deletions(-)
 rename testcases/kernel/controllers/cgroup/{cgroup_regression_10_1.sh => cgroup_regression_5_1.sh} (100%)
 rename testcases/kernel/controllers/cgroup/{cgroup_regression_10_2.sh => cgroup_regression_5_2.sh} (100%)

diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_10_1.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_5_1.sh
similarity index 100%
rename from testcases/kernel/controllers/cgroup/cgroup_regression_10_1.sh
rename to testcases/kernel/controllers/cgroup/cgroup_regression_5_1.sh
diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_10_2.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_5_2.sh
similarity index 100%
rename from testcases/kernel/controllers/cgroup/cgroup_regression_10_2.sh
rename to testcases/kernel/controllers/cgroup/cgroup_regression_5_2.sh
diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
index e197f5d3f..1f7f3820e 100755
--- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
+++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
@@ -7,7 +7,7 @@
 TST_TESTFUNC=test
 TST_SETUP=do_setup
 TST_CLEANUP=do_cleanup
-TST_CNT=10
+TST_CNT=9
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="awk dmesg find mountpoint rmdir"
@@ -233,77 +233,28 @@ test4()
 }
 
 #---------------------------------------------------------------------------
-# Bug:    When mount cgroup fs and the fs was busy, root_count should not be
-#         decremented in cgroup_kill_sb()
-# Kernel: 2.6.29-rcX
-# Links:  https://openvz.org/pipermail/devel/2009-January/016345.html
-#         http://lkml.org/lkml/2009/1/28/190
-# Fix:    commit 839ec5452ebfd5905b9c69b20ceb640903a8ea1a
+# Bug:    When running 2 concurrent mount/umount threads, kernel WARNING
+#         may be triggered, but it's VFS' issue but not cgroup.
+# Kernel: 2.6.24 - 2.6.29-rcX
+# Links:  http://lkml.org/lkml/2009/1/4/354
+# Fix:    commit 1a88b5364b535edaa321d70a566e358390ff0872
 #---------------------------------------------------------------------------
 test5()
 {
-	local mounted
-	local failing
-	local mntpoint
-
-	local lines=`cat /proc/cgroups | wc -l`
-	if [ $lines -le 2 ]; then
-		tst_res TCONF "require at least 2 cgroup subsystems"
-		return
-	fi
-
-	local subsys1=`tail -n 1 /proc/cgroups | awk '{ print $1 }'`
-	local subsys2=`tail -n 2 /proc/cgroups | head -1 | awk '{ print $1 }'`
-
-	# Accounting here for the fact that the chosen subsystems could
-	# have been already previously mounted at boot time: in such a
-	# case we must skip the initial co-mount step (which would
-	# fail anyway) and properly re-organize the $mntpoint and
-	# $failing params to be used in the following expected-to-fail
-	# mount action. Note that the subsysN name itself will be listed
-	# amongst mounts options.
-	get_cgroup_mountpoint $subsys1 >/dev/null && mounted=$subsys1
-	[ -z "$mounted" ] && get_cgroup_mountpoint $subsys2 >/dev/null && mounted=$subsys2
-	if [ -z "$mounted" ]; then
-		mntpoint=cgroup
-		failing=$subsys1
-		mount -t cgroup -o $subsys1,$subsys2 xxx $mntpoint/
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL "mount $subsys1 and $subsys2 failed"
-			return
-		fi
-	else
-		# Use the pre-esistent mountpoint as $mntpoint and use a
-		# co-mount with $failing: this way the 2nd mount will
-		# also fail (as expected) in this 'mirrored' configuration.
-		mntpoint=$(get_cgroup_mountpoint $mounted)
-		failing=$subsys1,$subsys2
-	fi
-
-	# This 2nd mount has been properly configured to fail
-	mount -t cgroup -o $failing xxx $mntpoint/ 2> /dev/null
-	if [ $? -eq 0 ]; then
-		tst_res TFAIL "mount $failing should fail"
-		# Do NOT unmount pre-existent mountpoints...
-		[ -z "$mounted" ] && umount $mntpoint/
-		return
-	fi
-
-	mkdir $mntpoint/0
-	# Otherwise we can't attach task
-	if [ "$subsys1" = cpuset -o "$subsys2" = cpuset ]; then
-		echo 0 > $mntpoint/0/cpuset.cpus 2> /dev/null
-		echo 0 > $mntpoint/0/cpuset.mems 2> /dev/null
-	fi
+	cgroup_regression_5_1.sh &
+	local pid1=$!
+	cgroup_regression_5_2.sh &
+	local pid2=$!
 
-	sleep 100 &
-	echo $! > $mntpoint/0/tasks
+	sleep 30
+	kill -USR1 $pid1 $pid2
+	wait $pid1 2>/dev/null
+	wait $pid2 2>/dev/null
 
-	kill -TERM $! > /dev/null
-	wait $! 2>/dev/null
-	rmdir $mntpoint/0
-	# Do NOT unmount pre-existent mountpoints...
-	[ -z "$mounted" ] && umount $mntpoint/
+	mount -t cgroup none cgroup 2> /dev/null
+	mkdir cgroup/0
+	rmdir cgroup/0
+	umount cgroup/ 2> /dev/null
 	check_kernel_bug
 }
 
@@ -488,30 +439,4 @@ test9()
 	check_kernel_bug
 }
 
-#---------------------------------------------------------------------------
-# Bug:    When running 2 concurrent mount/umount threads, kernel WARNING
-#         may be triggered, but it's VFS' issue but not cgroup.
-# Kernel: 2.6.24 - 2.6.29-rcX
-# Links:  http://lkml.org/lkml/2009/1/4/354
-# Fix:    commit 1a88b5364b535edaa321d70a566e358390ff0872
-#---------------------------------------------------------------------------
-test10()
-{
-	cgroup_regression_10_1.sh &
-	local pid1=$!
-	cgroup_regression_10_2.sh &
-	local pid2=$!
-
-	sleep 30
-	kill -USR1 $pid1 $pid2
-	wait $pid1 2>/dev/null
-	wait $pid2 2>/dev/null
-
-	mount -t cgroup none cgroup 2> /dev/null
-	mkdir cgroup/0
-	rmdir cgroup/0
-	umount cgroup/ 2> /dev/null
-	check_kernel_bug
-}
-
 tst_run
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
