Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33244354F97
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 11:10:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0E1B3C1E0C
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 11:10:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 595393C01F4
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 11:10:20 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 68E281A008A7
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 11:10:18 +0200 (CEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF1rJ5x4jzPnXR
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 17:07:28 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 17:10:04 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 6 Apr 2021 17:27:29 +0800
Message-ID: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
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

--------------------------

1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
incorrect, because the value of Cpus_allowed_list is related 
to /sys/devices/system/cpu/possible and 
/sys/devices/system/cpu/isolated.

2. If isolcpus is configured in cmdline, the value of
Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
/sys/devices/system/cpu/isolated. In this case, $task_cpus is inconsistent
with $expect_task_cpus, test will be failed.

3. Need to change the method of obtaining $task_cpu
from /sys/devices/system/cpu/present.

4. The description of cpu_present_mask:
   Bitmap of CPUs currently present in the system. 
   Not all of them may be online. When physical hotplug is processed
   by the relevant subsystem (e.g ACPI) can change and new bit either be
   added or removed from the map depending on the event is
   hot-add/hot-remove. There are currently no locking rules as of now.
   Typical usage is to init topology during boot,
   at which time hotplug is disabled.

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
index 155e536..2c6993a 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
@@ -93,8 +93,7 @@ root_cpu_hotplug_test()
 
 	root_cpus="`cat $CPUSET/cpuset.cpus`"
 
-	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
-	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
+	task_cpus="`cat /sys/devices/system/cpu/present`"
 
 	check_result "$root_cpus" "$expect_cpus"
 	ret=$?
-- 
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
