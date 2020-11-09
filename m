Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B22AAF8F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 03:40:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 971403C2FD2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 03:40:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 731963C2551
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 03:40:40 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DFD28600810
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 03:40:38 +0100 (CET)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTwFx1NDszLwJV
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 10:40:21 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 9 Nov 2020 10:40:21 +0800
From: Luo Fenglin <luofenglin1@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 9 Nov 2020 10:52:09 +0800
Message-ID: <1604890331-65226-1-git-send-email-luofenglin1@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] sched/sched_stress:Modify sched driver param to
 run long term testcases
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
Cc: qiangqiang.wangqiang@huawei.com, luofenglin <luofenglin1@huawei.com>,
 claire.chenyue@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: luofenglin <luofenglin1@huawei.com>

Add sched_driver process slots param to 10, then long term testcases can run.
Additionally, add sched_driver run time 0.05 hour, long term testcases
run 1/5 of total time.

Signed-off-by: luofenglin <luofenglin1@huawei.com>
---
 testcases/kernel/sched/sched_stress/sched_driver.c  | 6 +++++-
 testcases/kernel/sched/sched_stress/sched_stress.sh | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
index 61573d788..1bee9d130 100644
--- a/testcases/kernel/sched/sched_stress/sched_driver.c
+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
@@ -202,8 +202,12 @@ int main(int argc, char **argv)

 	/*
 	 * Start the long-term testcases running
+	 * Run time set 1/5 of total
 	 */
-	start_long_term_testcases(long_term_slot_total, argv[2]);
+	char run_long_term_time[20];
+	int runlongtime = runseconds / 5;
+	sprintf(run_long_term_time, "%d", runlongtime);
+	start_long_term_testcases(long_term_slot_total, run_long_term_time);
 	short_term_slot_total = workslots / 2;
 	fflush(stdout);

diff --git a/testcases/kernel/sched/sched_stress/sched_stress.sh b/testcases/kernel/sched/sched_stress/sched_stress.sh
index 797d0601b..0205446a7 100755
--- a/testcases/kernel/sched/sched_stress/sched_stress.sh
+++ b/testcases/kernel/sched/sched_stress/sched_stress.sh
@@ -30,6 +30,7 @@ export KERNEL=./sched_datafile
 touch $KERNEL
 echo 0.000000 > sch.measure
 export RAWDEV=`df / | grep dev | awk {'print $1'}`
-sched_driver -s 0.9 -t 0.02 -p 2 > /tmp/tmp$$
+echo "Result file: /tmp/tmp$$"
+sched_driver -s 0.9 -t 0.05 -p 10 -d > /tmp/tmp$$
 tail -n 5 /tmp/tmp$$
 rm -rf /tmp/tmp$$ ./sched_datafile sch.measure
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
