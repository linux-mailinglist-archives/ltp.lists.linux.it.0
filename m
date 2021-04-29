Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2936E693
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 10:08:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C37833C6174
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 10:08:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1F6E3C0F91
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 10:08:02 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AA7FC60029F
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 10:08:00 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FW7ML4CBfzPvWZ
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 16:04:46 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 16:07:44 +0800
From: Wang Xin <wangxin410@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 16:24:54 +0800
Message-ID: <1619684694-116827-1-git-send-email-wangxin410@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] controllers/cpuset: Restore the value of
 cpuset.sched_load_balance
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
Cc: Wang Xin <wangxin410@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When we run the cpuhotplug03 test case on the arm64 machine,
we conclude that no error occurs when the cpuhotplug03 case is executed alone,
but once the cpuset_sched_domains case is executed first,
After cpuhotplug03 is executed, the error "cpuhotplug03 1 TFAIL: No cpuhotplug_do_spin_loop processes found on" occurs.
The cpuset_sched_domains test case changes the value of cpuset.sched_load_balance in the cpuset cgroup subsystem,
but does not restore the value at the end of the test.
Modify the cpuset_funcs.sh file. The test result shows that the problem is solved successfully.

Signed-off-by: Wang Xin <wangxin410@huawei.com>
---
 v1 -> v2: modified the format

 testcases/kernel/controllers/cpuset/cpuset_funcs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index 00aad0e..f3ba1d5 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -60,6 +60,8 @@ CPUSET_TMP="/tmp/cpuset_tmp"
 CLONE_CHILDREN="/dev/cpuset/cgroup.clone_children"
 CHILDREN_VALUE="0"
 HOTPLUG_CPU="1"
+SCHED_LB="/dev/cpuset/cpuset.sched_load_balance"
+SCHED_LB_VALUE="0"

 cpuset_log()
 {
@@ -169,6 +171,7 @@ setup()
 	fi

 	CHILDREN_VALUE="`cat $CLONE_CHILDREN`"
+	SCHED_LB_VALUE="`cat $SCHED_LB`"
 }

 # Write the cleanup function
@@ -180,6 +183,7 @@ cleanup()
 	}

 	echo $CHILDREN_VALUE > $CLONE_CHILDREN
+	echo $SCHED_LB_VALUE > $SCHED_LB

 	find "$CPUSET" -type d | sort | sed -n '2,$p' | tac | while read subdir
 	do
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
