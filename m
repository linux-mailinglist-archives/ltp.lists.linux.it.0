Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9233224BA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 04:38:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C40C3C612D
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 04:38:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 38DC13C29C7
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 04:38:26 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 478D31A007E8
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 04:38:24 +0100 (CET)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dl4V45pcyz169Bv
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 11:36:44 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 11:38:10 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Feb 2021 11:37:38 +0800
Message-ID: <20210223033738.22666-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] cpu_hotplug: Add executable file's path
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

When env PATH is not include current path, run cpuhotplug_do_disk_write_loop/
cpuhotplug_do_spin_loop/cpuhotplug_do_kcompile_loop/
cpuhotplug_report_proc_interrupts will fail.

For those:
	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh     | 4 ++--
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh     | 2 +-
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh     | 2 +-
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
index 1ba937cc7..b1c8a9b97 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
@@ -137,7 +137,7 @@ cpu_states=$(get_all_cpu_states)
 CPU_COUNT=0

 # Start up a process that writes to disk; keep track of its PID
-cpuhotplug_do_disk_write_loop > /dev/null 2>&1 &
+./cpuhotplug_do_disk_write_loop > /dev/null 2>&1 &
 WRL_ID=$!

 until [ $LOOP_COUNT -gt $HOTPLUG01_LOOPS ]
@@ -181,7 +181,7 @@ do
 	# Print out a report showing the changes in IRQs
 	echo
 	echo
-	cpuhotplug_report_proc_interrupts "$IRQ_START" "$IRQ_END"
+	./cpuhotplug_report_proc_interrupts "$IRQ_START" "$IRQ_END"
 	echo

 	sleep $TM_DLY
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
index 792f8cd73..f8a1395c1 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
@@ -77,7 +77,7 @@ fi
 TST_CLEANUP=do_clean

 # Start up a process that just uses CPU cycles
-cpuhotplug_do_spin_loop > /dev/null&
+./cpuhotplug_do_spin_loop > /dev/null&
 SPIN_LOOP_PID=$!

 sleep 5
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
index 9ea49f0e1..75a05a3c9 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
@@ -102,7 +102,7 @@ until [ $LOOP_COUNT -gt $HOTPLUG03_LOOPS ]; do
 	# so we can kill them later.
 	number_of_procs=$((cpus_num*2))
 	until [ $number_of_procs -eq 0 ]; do
-		cpuhotplug_do_spin_loop > /dev/null 2>&1 &
+		./cpuhotplug_do_spin_loop > /dev/null 2>&1 &
 		echo $! >> /var/run/hotplug4_$$.pid
 		number_of_procs=$((number_of_procs-1))
 	done
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
index 278304618..e8ab78e8c 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
@@ -81,7 +81,7 @@ fi

 TST_CLEANUP=do_clean

-cpuhotplug_do_kcompile_loop $KERNEL_DIR > /dev/null 2>&1 &
+./cpuhotplug_do_kcompile_loop $KERNEL_DIR > /dev/null 2>&1 &
 KCOMPILE_LOOP_PID=$!

 tst_resm TINFO "initial CPU affinity for kernel compile is: \
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
