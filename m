Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E99290226
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:46:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ADFD3C3238
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Oct 2020 11:46:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 847AF3C3230
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:39:53 +0200 (CEST)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A95416011D4
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 11:39:52 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1B2E937EF7109881F300
 for <ltp@lists.linux.it>; Fri, 16 Oct 2020 17:39:46 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 17:39:36 +0800
From: Luo Fenglin <luofenglin1@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Oct 2020 17:51:16 +0800
Message-ID: <1602841876-91490-3-git-send-email-luofenglin1@huawei.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
References: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 16 Oct 2020 11:46:29 +0200
Subject: [LTP] [PATCH v3] sched/sched_stress:Bugfix for setting real time
 priority
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

When real time flag is set, setpriority function is used for user-time
policy setting, here use sched_setscheduler to set real time policy RR
instead

--------

Upxxxx

Signed-off-by: luofenglin <luofenglin1@huawei.com>
---
 testcases/kernel/sched/sched_stress/sched.h     |  2 ++
 testcases/kernel/sched/sched_stress/sched_tc0.c | 10 ++++++----
 testcases/kernel/sched/sched_stress/sched_tc1.c | 10 ++++++----
 testcases/kernel/sched/sched_stress/sched_tc2.c | 10 ++++++----
 testcases/kernel/sched/sched_stress/sched_tc3.c | 10 ++++++----
 testcases/kernel/sched/sched_stress/sched_tc4.c |  9 +++++----
 testcases/kernel/sched/sched_stress/sched_tc5.c |  9 +++++----
 testcases/kernel/sched/sched_stress/sched_tc6.c |  8 +++++---
 8 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/testcases/kernel/sched/sched_stress/sched.h b/testcases/kernel/sched/sched_stress/sched.h
index 8ed941eba..bcdecacc5 100644
--- a/testcases/kernel/sched/sched_stress/sched.h
+++ b/testcases/kernel/sched/sched_stress/sched.h
@@ -46,8 +46,10 @@
 #include <time.h>
 #include <errno.h>
 #include <stdio.h>
+#include <sched.h>
 
 #define DEFAULT_PRIORITY 70
+#define SET_RT_SCHEDULER(paraA, paraB, paraC) sched_setscheduler(paraA, paraB, paraC)
 
 #if 0
 int  openlog (char *);
diff --git a/testcases/kernel/sched/sched_stress/sched_tc0.c b/testcases/kernel/sched/sched_stress/sched_tc0.c
index 9acbc2f58..290ad1e63 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc0.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc0.c
@@ -90,7 +90,9 @@ int verbose = 0;
 int debug = 0;
 long execution_time = DEFAULT_EXECUTION_TIME;
 char *priority = DEFAULT_PRIORITY_TYPE;
-
+struct sched_param param = {
+		.sched_priority = DEFAULT_PRIORITY
+};
 /*---------------------------------------------------------------------+
 |                                 main                                 |
 | ==================================================================== |
@@ -127,10 +129,10 @@ int main(int argc, char **argv)
 	if (!strcmp(priority, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	}
 
diff --git a/testcases/kernel/sched/sched_stress/sched_tc1.c b/testcases/kernel/sched/sched_stress/sched_tc1.c
index c771ef421..cd6b14a09 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc1.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc1.c
@@ -72,7 +72,9 @@
 void process_file(char *);
 void parse_args(int, char **);
 void signal_handler();
-
+struct sched_param param = {
+	                .sched_priority = DEFAULT_PRIORITY
+};
 /*
  * Global variables:
  *
@@ -128,10 +130,10 @@ int main(int argc, char **argv)
 	if (!strcmp(priority, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	}
 
diff --git a/testcases/kernel/sched/sched_stress/sched_tc2.c b/testcases/kernel/sched/sched_stress/sched_tc2.c
index 1e2e3e629..166efc726 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc2.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc2.c
@@ -47,7 +47,9 @@
 #include <sys/time.h>
 #include <sys/resource.h>
 #include   "sched.h"
-
+struct sched_param param = {
+	                .sched_priority = DEFAULT_PRIORITY
+};
 /*
  * Defines:
  *
@@ -129,10 +131,10 @@ int main(int argc, char **argv)
 	if (!strcmp(priority, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	}
 
diff --git a/testcases/kernel/sched/sched_stress/sched_tc3.c b/testcases/kernel/sched/sched_stress/sched_tc3.c
index 8064e9eda..ca13e9929 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc3.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc3.c
@@ -95,7 +95,9 @@ int verbose = 0;
 int debug = 0;
 int signaled = 0;
 char *priority = DEFAULT_PRIORITY_TYPE;
-
+struct sched_param param = {
+	                .sched_priority = DEFAULT_PRIORITY
+};
 /*---------------------------------------------------------------------+
 |                                 main                                 |
 | ==================================================================== |
@@ -131,10 +133,10 @@ int main(int argc, char **argv)
 	if (!strcmp(priority, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	}
 
diff --git a/testcases/kernel/sched/sched_stress/sched_tc4.c b/testcases/kernel/sched/sched_stress/sched_tc4.c
index 5bffb6478..81a8e170c 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc4.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc4.c
@@ -99,7 +99,7 @@ int debug = 0;
 int priority = DEFAULT_PRIORITY;
 char *logfile = DEFAULT_LOGFILE;
 char *priority_type = DEFAULT_PRIORITY_TYPE;
-
+struct sched_param param;
 /*---------------------------------------------------------------------+
 |                                 main                                 |
 | ==================================================================== |
@@ -133,10 +133,11 @@ int main(int argc, char **argv)
 	if (!strcmp(priority_type, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		param.sched_priority = priority;
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	} else {
 		if (nice((priority - 50) - (nice(0) + 20)) < 0 && errno != 0)
diff --git a/testcases/kernel/sched/sched_stress/sched_tc5.c b/testcases/kernel/sched/sched_stress/sched_tc5.c
index db5ce963c..c315f9ade 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc5.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc5.c
@@ -95,7 +95,7 @@ int debug = 0;
 int priority = DEFAULT_PRIORITY;
 char *logfile = DEFAULT_LOGFILE;
 char *priority_type = DEFAULT_PRIORITY_TYPE;
-
+struct sched_param param;
 /*---------------------------------------------------------------------+
 |                                 main                                 |
 | ==================================================================== |
@@ -130,10 +130,11 @@ int main(int argc, char **argv)
 	if (!strcmp(priority_type, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		param.sched_priority = priority;
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	} else {
 		if (nice((priority - 50) - (nice(0) + 20)) < 0 && errno != 0)
diff --git a/testcases/kernel/sched/sched_stress/sched_tc6.c b/testcases/kernel/sched/sched_stress/sched_tc6.c
index e70e8f250..20987f571 100644
--- a/testcases/kernel/sched/sched_stress/sched_tc6.c
+++ b/testcases/kernel/sched/sched_stress/sched_tc6.c
@@ -117,6 +117,7 @@ char *logfile = DEFAULT_LOGFILE;
 char *priority_type = DEFAULT_PRIORITY_TYPE;
 struct flock flock_struct;
 struct flock *flock_ptr = &flock_struct;
+struct sched_param param;
 
 int open_file(char *, int);
 
@@ -163,10 +164,11 @@ int main(int argc, char **argv)
 	if (!strcmp(priority_type, "fixed")) {
 #ifndef __linux__
 		if (setpri(0, DEFAULT_PRIORITY) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #else
-		if (setpriority(PRIO_PROCESS, 0, 0) < 0)
-			sys_error("setpri failed", __FILE__, __LINE__);
+		param.sched_priority = priority;
+		if (SET_RT_SCHEDULER(0, SCHED_RR, &param) < 0)
+			sys_error("set rt pri failed", __FILE__, __LINE__);
 #endif
 	} else {
 		if (nice((priority - 50) - (nice(0) + 20)) < 0 && errno != 0)
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
