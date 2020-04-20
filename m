Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 057151B05F3
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 11:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A34663C2A14
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 11:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8F0303C136F
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 11:51:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8291F1A011CF
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 11:51:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,406,1580745600"; d="scan'208";a="89275533"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 17:51:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4B50A46B5FAC
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 17:40:36 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 17:51:11 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 20 Apr 2020 17:51:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 20 Apr 2020 17:51:18 +0800
Message-ID: <1587376278-14538-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 4B50A46B5FAC.AF273
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/prctl: Use TST_ASSERT_STR/INT
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/prctl/prctl05.c | 17 ++---------------
 testcases/kernel/syscalls/prctl/prctl08.c | 16 +---------------
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl05.c b/testcases/kernel/syscalls/prctl/prctl05.c
index 1f979007f..ae390fdfc 100644
--- a/testcases/kernel/syscalls/prctl/prctl05.c
+++ b/testcases/kernel/syscalls/prctl/prctl05.c
@@ -28,18 +28,6 @@ static struct tcase {
 	{"prctl05_test_xxxxx", "prctl05_test_xx"}
 };
 
-static void check_proc_comm(char *path, char *name)
-{
-	char comm_buf[20];
-
-	SAFE_FILE_SCANF(path, "%s", comm_buf);
-	if (strcmp(name, comm_buf))
-		tst_res(TFAIL,
-			"%s has %s, expected %s", path, comm_buf, name);
-	else
-		tst_res(TPASS, "%s sets to %s", path, comm_buf);
-}
-
 static void verify_prctl(unsigned int n)
 {
 	char buf[20];
@@ -71,9 +59,8 @@ static void verify_prctl(unsigned int n)
 	tid = tst_syscall(__NR_gettid);
 
 	sprintf(comm_path, "/proc/self/task/%d/comm", tid);
-	check_proc_comm(comm_path, tc->expname);
-
-	check_proc_comm("/proc/self/comm", tc->expname);
+	TST_ASSERT_STR(comm_path, tc->expname);
+	TST_ASSERT_STR("/proc/self/comm", tc->expname);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/prctl/prctl08.c b/testcases/kernel/syscalls/prctl/prctl08.c
index fd8ccb6ad..9a1b34c17 100644
--- a/testcases/kernel/syscalls/prctl/prctl08.c
+++ b/testcases/kernel/syscalls/prctl/prctl08.c
@@ -53,19 +53,6 @@ static void check_reset_timerslack(char *message)
 	check_get_timerslack(message, origin_value);
 }
 
-static void check_proc_timerslack(char *message, unsigned long value)
-{
-	unsigned long proc_value;
-
-	SAFE_FILE_SCANF(PROC_TIMERSLACK_PATH, "%lu", &proc_value);
-	if (proc_value == value)
-		tst_res(TPASS, "%s %s  got %lu expectedly",
-				message, PROC_TIMERSLACK_PATH, proc_value);
-	else
-		tst_res(TFAIL, "%s %s expected %lu got %lu",
-				message, PROC_TIMERSLACK_PATH, value, proc_value);
-}
-
 static void check_get_timerslack(char *message, unsigned long value)
 {
 	TEST(prctl(PR_GET_TIMERSLACK));
@@ -77,8 +64,7 @@ static void check_get_timerslack(char *message, unsigned long value)
 				message, value, TST_RET);
 
 	if (proc_flag)
-		check_proc_timerslack(message, value);
-
+		TST_ASSERT_INT(PROC_TIMERSLACK_PATH, value);
 }
 
 static void check_inherit_timerslack(char *message, unsigned long value)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
