Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C478AB75E9
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 11:14:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47D043C20F7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 11:14:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5F1E73C20D2
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 11:14:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8827B6013B7
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 11:14:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75702848"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 17:14:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B2A214CE032B
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 17:14:18 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 19 Sep 2019 17:14:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 19 Sep 2019 17:10:47 +0800
Message-ID: <1568884247-2605-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B2A214CE032B.AE5FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] cgroup_regression_test.sh: Remove obselte test_5
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

test_5 is a very old regresstion test and kernel code has been
rewritten completely since 2.6. No user will use such old kernel
code to test. So I think we can remove it.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../cgroup/cgroup_regression_test.sh          | 75 -------------------
 1 file changed, 75 deletions(-)

-------------------------
a discussion about it:
https://patchwork.ozlabs.org/patch/1113680/
-------------------------

diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
index e197f5d3f..a32ed172c 100755
--- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
+++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
@@ -232,81 +232,6 @@ test4()
 	tst_res TPASS "no lockdep BUG was found"
 }
 
-#---------------------------------------------------------------------------
-# Bug:    When mount cgroup fs and the fs was busy, root_count should not be
-#         decremented in cgroup_kill_sb()
-# Kernel: 2.6.29-rcX
-# Links:  https://openvz.org/pipermail/devel/2009-January/016345.html
-#         http://lkml.org/lkml/2009/1/28/190
-# Fix:    commit 839ec5452ebfd5905b9c69b20ceb640903a8ea1a
-#---------------------------------------------------------------------------
-test5()
-{
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
-
-	sleep 100 &
-	echo $! > $mntpoint/0/tasks
-
-	kill -TERM $! > /dev/null
-	wait $! 2>/dev/null
-	rmdir $mntpoint/0
-	# Do NOT unmount pre-existent mountpoints...
-	[ -z "$mounted" ] && umount $mntpoint/
-	check_kernel_bug
-}
-
 #---------------------------------------------------------------------------
 # Bug:    There was a race between cgroup_clone and umount
 # Kernel: 2.6.24 - 2.6.28, 2.6.29-rcX
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
