Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB6290225
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:46:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 766453C57C1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:46:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 321F33C3230
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:39:35 +0200 (CEST)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9B60F1A001F4
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:39:34 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DB7CE348456D605F4EC0
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 17:39:30 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 17:39:23 +0800
From: Luo Fenglin <luofenglin1@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Oct 2020 17:51:15 +0800
Message-ID: <1602841876-91490-2-git-send-email-luofenglin1@huawei.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
References: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 16 Oct 2020 11:46:29 +0200
Subject: [LTP] [PATCH v2] sched/sched_stress:Fixed param of sched_tc
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
