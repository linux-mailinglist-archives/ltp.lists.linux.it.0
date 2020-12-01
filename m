Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A02CA18D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 12:38:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B505D3C5928
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 12:38:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 16DB23C4D33
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 12:38:18 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 169CA600C6D
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 12:38:16 +0100 (CET)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Clg7l3J3MzLsqZ
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 19:37:39 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 19:38:04 +0800
From: Luo Fenglin <luofenglin1@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 1 Dec 2020 19:49:25 +0800
Message-ID: <1606823366-121520-2-git-send-email-luofenglin1@huawei.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1606823366-121520-1-git-send-email-luofenglin1@huawei.com>
References: <1606823366-121520-1-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] sched/sched_stress: Fixed param of sched_tc
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

Rt flag of sched_tc must like "-pfixed" or "-pvariable"

Signed-off-by: luofenglin <luofenglin1@huawei.com>
---
 .../kernel/sched/sched_stress/sched_driver.c  | 51 ++++++++++---------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
index 1bee9d130..475369b46 100644
--- a/testcases/kernel/sched/sched_stress/sched_driver.c
+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
@@ -621,25 +621,28 @@ char *execution_time;		/* runtime hours to pass to each testcase */
 		printf("long-term slots available:  %d\n",
 		       long_term_slot_total);

+	char timeparam[30];
+	sprintf(timeparam, "-t%s", execution_time);
+
 	for (i = 0; i < (long_term_slot_total / 4); i++) {
 #if defined(_IA64) && !defined(__64BIT__)
-		start_testcase("./sched_tc0.32", "sched_tc0 -t", execution_time,
-			       " -p1", NULL, NULL);
-		start_testcase("./sched_tc2.32", "sched_tc2", execution_time,
-			       "1", NULL, NULL);
-		start_testcase("./sched_tc0.32", "sched_tc0 -t", execution_time,
-			       " -p0", NULL, NULL);
-		start_testcase("./sched_tc2.32", "sched_tc2", execution_time,
-			       "0", NULL, NULL);
+		start_testcase("./sched_tc0.32", "sched_tc0", timeparam,
+			       "-pfixed", "-d", NULL);
+		start_testcase("./sched_tc2.32", "sched_tc2", timeparam,
+			       "-pfixed", "-d", NULL);
+		start_testcase("./sched_tc0.32", "sched_tc0", timeparam,
+			       "-pvariable", "-d", NULL);
+		start_testcase("./sched_tc2.32", "sched_tc2", timeparam,
+			       "-pvariable", "-d", NULL);
 #else
-		start_testcase("./sched_tc0", "sched_tc0 -t", execution_time,
-			       " -p1", NULL, NULL);
-		start_testcase("./sched_tc2", "sched_tc2", execution_time, "1",
-			       NULL, NULL);
-		start_testcase("./sched_tc0", "sched_tc0 -t", execution_time,
-			       " -p0", NULL, NULL);
-		start_testcase("./sched_tc2", "sched_tc2", execution_time, "0",
-			       NULL, NULL);
+		start_testcase("./sched_tc0", "sched_tc0", timeparam,
+			       "-pfixed", "-d", NULL);
+		start_testcase("./sched_tc2", "sched_tc2", timeparam, "-pfixed",
+			       "-d", NULL);
+		start_testcase("./sched_tc0", "sched_tc0", timeparam,
+			       "-pvariable", "-d", NULL);
+		start_testcase("./sched_tc2", "sched_tc2", timeparam, "-pvariable",
+			       "-d", NULL);
 #endif
 	}
 }
@@ -674,22 +677,22 @@ void start_short_term_testcases(int short_term_slot_total,

 	for (i = 0; i < (short_term_slots / 4); i++) {
 #if defined(_IA64) && !defined(__64BIT__)
-		start_testcase("./sched_tc1.32", "sched_tc1", "1", NULL, NULL,
+		start_testcase("./sched_tc1.32", "sched_tc1", "-pfixed", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc3.32", "sched_tc3", "1", NULL, NULL,
+		start_testcase("./sched_tc3.32", "sched_tc3", "-pfixed", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc1.32", "sched_tc1", "0", NULL, NULL,
+		start_testcase("./sched_tc1.32", "sched_tc1", "-pvariable", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc3.32", "sched_tc3", "0", NULL, NULL,
+		start_testcase("./sched_tc3.32", "sched_tc3", "-pvariable", "-d", NULL,
 			       NULL);
 #else
-		start_testcase("./sched_tc1", "sched_tc1", "1", NULL, NULL,
+		start_testcase("./sched_tc1", "sched_tc1", "-pfixed", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc3", "sched_tc3", "1", NULL, NULL,
+		start_testcase("./sched_tc3", "sched_tc3", "-pfixed", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc1", "sched_tc1", "0", NULL, NULL,
+		start_testcase("./sched_tc1", "sched_tc1", "-pvariable", "-d", NULL,
 			       NULL);
-		start_testcase("./sched_tc3", "sched_tc3", "0", NULL, NULL,
+		start_testcase("./sched_tc3", "sched_tc3", "-pvariable", "-d", NULL,
 			       NULL);
 #endif
 #if 0
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
