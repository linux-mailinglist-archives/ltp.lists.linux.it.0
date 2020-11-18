Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C50582B7614
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 07:00:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A3503C30AA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 07:00:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7C7323C280C
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 07:00:22 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B167C200E07
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 07:00:21 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,486,1596470400"; d="scan'208";a="101501356"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2020 14:00:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 10EDC4CE5450
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 14:00:17 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 18 Nov 2020 14:00:16 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 18 Nov 2020 14:00:23 +0800
Message-ID: <1605679223-6665-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 10EDC4CE5450.AE1A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/madvise06: Add check for
 /proc/sys/vm/stat_refresh file
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

On older kernel(ie centos 7.8ga), when we write 1 to /proc/sys/vm/stat_refresh,
it failed to write because this file[1] was not introdued into centos7 kernel.
It triggers a warnging. So do_exit() in tst_test.c will report TWARN(4) to ltp-pan and
ltp-pan think this case failed.

......
safe_file_ops.c:238: TWARN: Failed to open FILE '/proc/sys/vm/stat_refresh' at madvise06.c:78
......
Summary:
passed   2
failed   0
skipped  0
warnings 7
<<<execution_status>>>
initiation_status="ok"
duration=6 termination_type=exited termination_id=4 corefile=no
cutime=4 cstime=66
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL

I don't want to modify do_exit() logic(such as use "if (results->warning && !results->passed)" for TWARN)
because TWARN indeeds reports something goes wrong. So just add a check for this stat_refresh file
before write.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=52b6f46bc

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/madvise/madvise06.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 7e9e9ef84..962554163 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -54,7 +54,7 @@
 #define GROUP_NAME "madvise06"
 
 static const char drop_caches_fname[] = "/proc/sys/vm/drop_caches";
-static int pg_sz;
+static int pg_sz, stat_refresh_sup;
 
 static long init_swap, init_swap_cached, init_cached;
 
@@ -75,7 +75,9 @@ static void meminfo_diag(const char *point)
 {
 	long rval;
 
-	FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
+	if (stat_refresh_sup)
+		SAFE_FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
+
 	tst_res(TINFO, "%s", point);
 	tst_res(TINFO, "\tSwap: %ld Kb",
 		SAFE_READ_MEMINFO("SwapTotal:") - SAFE_READ_MEMINFO("SwapFree:") - init_swap);
@@ -143,6 +145,9 @@ static void setup(void)
 	init_swap_cached = SAFE_READ_MEMINFO("SwapCached:");
 	init_cached = SAFE_READ_MEMINFO("Cached:");
 
+	if (!access("/proc/sys/vm/stat_refresh", W_OK))
+		stat_refresh_sup = 1;
+
 	tst_res(TINFO, "mapping %ld Kb (%ld pages), limit %ld Kb, pass threshold %ld Kb",
 		CHUNK_SZ / 1024, CHUNK_SZ / pg_sz, MEM_LIMIT / 1024, PASS_THRESHOLD_KB);
 }
@@ -203,7 +208,8 @@ static void test_advice_willneed(void)
 	do {
 		loops--;
 		usleep(100000);
-		FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
+		if (stat_refresh_sup)
+			SAFE_FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
 		SAFE_FILE_LINES_SCANF("/proc/meminfo", "SwapCached: %ld",
 			&swapcached);
 	} while (swapcached < swapcached_start + PASS_THRESHOLD_KB && loops > 0);
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
