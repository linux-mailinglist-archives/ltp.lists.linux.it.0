Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184485B42B
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Feb 2024 08:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708415107; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=lQFlcIcdvfsRk1pNWatQ2rH6I15yaFvhbuJ8reC6YNw=;
 b=KftIVZgF7S3xcPnuM70ULK6oaFCHWvAsL0wt0s0Wm8GJzoUN/SESp6mvBoBxa4mvJSjOP
 TEw2pY/MHcRsQrvfVnaKF5SO0rTLKgENCD/Vqi7It5AMyQL6p8h5dSlXSlGFXJ651ysJlQO
 B4vVq02uSuD50wK5ZLGRyyWXjmk35tY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B1F33CDB7F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Feb 2024 08:45:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E2D03CDB94
 for <ltp@lists.linux.it>; Tue, 20 Feb 2024 08:44:13 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=68.232.139.139;
 helo=esa6.hc1455-7.c3s2.iphmx.com; envelope-from=xuyang2018.jy@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com
 [68.232.139.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4988B14001F5
 for <ltp@lists.linux.it>; Tue, 20 Feb 2024 08:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1708415053; x=1739951053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfk48p6gULQCEfpbtHhExUfTdHB4VlvR2rDqcZhcEvo=;
 b=rIr5pXBhqCSkkSzmSTX60exxUNRKueTQM/3wiR8LBmGeT7Lor5eIQdul
 u/vgKfwUD1TTa2zQjvg4/g7VQYuMdJ3SSBbJS1cOgBEsuvtjkEmZVxF2y
 fnc0mI6g+jni688WMfwxMRp1skv6TTwjaVlAwWZ/kDk1bJuVy5guWvcxO
 IzeLFxXWWxjoaNdU/3tES25vCxrhspAqZcWyclLeDQ9tsbjZZG+UNrEHE
 5q0m6EsZjZ5wVHn+ZIv3Re7gXPK+4NrC1P5xjjUxH5Pfm4xO+PkTJgE78
 wVJMrhWDFRM/JxOMwrpAHQzKdhgM7TwkTXwUX8oZ9MEO7Rsx707QLmdUo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="151641246"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; d="scan'208";a="151641246"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 16:44:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C56D3EB2
 for <ltp@lists.linux.it>; Tue, 20 Feb 2024 16:44:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EFF7D3F29
 for <ltp@lists.linux.it>; Tue, 20 Feb 2024 16:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA53A65FEA
 for <ltp@lists.linux.it>; Tue, 20 Feb 2024 16:44:07 +0900 (JST)
Received: from rhel93GA.g08.fujitsu.local (unknown [10.167.221.71])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 565E21A006B;
 Tue, 20 Feb 2024 15:44:07 +0800 (CST)
To: ltp@lists.linux.it
Date: Tue, 20 Feb 2024 02:42:17 -0500
Message-Id: <20240220074218.13487-6-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240220074218.13487-1-xuyang2018.jy@fujitsu.com>
References: <20240220074218.13487-1-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--13.443200-10.000000
X-TMASE-MatchedRID: ivopYYUv4wOoXGwWsKbNNMQ4mpKyfkqZqf/efKFN1nAsNj/xIgdFOz13
 GoPFA1HFIvrftAIhWmLy9zcRSkKatYRiOzyn0C74DnkURiAlfT0Ea8g1x8eqF8+FtP9CIg3lGJ0
 UP0AzEBXF0OnGYU+EGEyVB8hCiPpVv7DNTciZY+u/QNwZdfw3FVf0dYIWn7J33unRG7yMq8Wsw1
 6ankSpXeLuuo8wVu5nyHMs+sHfluzHOkf2+KMD/BIRh9wkXSlFe9J6VkwneFZp2y18eTT/bUwSv
 UpzAIpVruaWnsz0aFiAMuqetGVetnyef22ep6XY4kYXbobxJbLyU/oX+tpNmPoLEnltozQnQ2R7
 v68QMcGFdvi/+2U6y6cXRlWV3iX391MqBNGmOGlLDBwYotNgRw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 6/7] syscalls/swapon03: Simply this case
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
From: Yang Xu via ltp <ltp@lists.linux.it>
Reply-To: Yang Xu <xuyang2018.jy@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

By moving swapfile create stage from verify_swaopon and
test EPERM error more accurate. Also use glibc wrapper by
using swapon/swapoff instead of call syscall number directly
because glibc/musl/binoic also support them since long time ago.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/swapon/swapon03.c | 168 +++++---------------
 1 file changed, 42 insertions(+), 126 deletions(-)

diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
index b0d70b4ad..339b11c83 100644
--- a/testcases/kernel/syscalls/swapon/swapon03.c
+++ b/testcases/kernel/syscalls/swapon/swapon03.c
@@ -16,7 +16,7 @@
 #include <errno.h>
 #include <stdlib.h>
 #include <sys/wait.h>
-
+#include <sys/swap.h>
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 #include "libswap.h"
@@ -24,88 +24,13 @@
 #define MNTPOINT	"mntpoint"
 #define TEST_FILE	MNTPOINT"/testswap"
 
-static int setup_swap(void);
-static int clean_swap(void);
-static int check_and_swapoff(const char *filename);
-
 static int swapfiles;
 
-int testfiles = 3;
-static struct swap_testfile_t {
-	char *filename;
-} swap_testfiles[] = {
-	{"firstswapfile"},
-	{"secondswapfile"},
-	{"thirdswapfile"}
-};
-
-int expected_errno = EPERM;
-
-static void verify_swapon(void)
-{
-	if (setup_swap() < 0) {
-		clean_swap();
-		tst_brk(TBROK, "Setup failed, quitting the test");
-	}
-
-	TEST(tst_syscall(__NR_swapon, swap_testfiles[0].filename, 0));
-
-	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
-		tst_res(TPASS | TTERRNO, "swapon(2) got expected failure");
-	} else if (TST_RET < 0) {
-		tst_res(TFAIL | TTERRNO,
-			"swapon(2) failed to produce expected error "
-			"(%d). System reboot recommended.",
-			expected_errno);
-	} else {
-		/*
-		 * Probably the system supports MAX_SWAPFILES > 30, let's try with
-		 * MAX_SWAPFILES == 32. Call swapon sys call once again for 32
-		 * now we can't receive an error.
-		 */
-		TEST(tst_syscall(__NR_swapon, swap_testfiles[1].filename, 0));
-
-		/* Check return code (now we're expecting success) */
-		if (TST_RET < 0) {
-			tst_res(TFAIL | TTERRNO,
-				"swapon(2) got an unexpected failure");
-		} else {
-			/*
-			 * Call swapon sys call once again for 33 now we have to receive an error.
-			 */
-			TEST(tst_syscall(__NR_swapon, swap_testfiles[2].filename, 0));
-
-			/* Check return code (should be an error) */
-			if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
-				tst_res(TPASS,
-					"swapon(2) got expected failure;"
-					" Got errno = %d, probably your"
-					" MAX_SWAPFILES is 32",
-					expected_errno);
-			} else {
-				tst_res(TFAIL,
-					"swapon(2) failed to produce"
-					" expected error: %d, got %s."
-					" System reboot after execution of LTP"
-					" test suite is recommended.",
-					expected_errno, strerror(TST_ERR));
-			}
-		}
-	}
-
-	if (clean_swap() < 0)
-		tst_brk(TBROK, "Cleanup failed, quitting the test");
-}
-
-/*
- * Create 33 and activate 30 swapfiles.
- */
 static int setup_swap(void)
 {
 	pid_t pid;
 	int status;
 	int j, max_swapfiles, used_swapfiles;
-	int res = 0;
 	char filename[FILENAME_MAX];
 
 	if (seteuid(0) < 0)
@@ -127,16 +52,7 @@ static int setup_swap(void)
 			make_swapfile(filename, 10, 0);
 
 			/* turn on the swap file */
-			res = tst_syscall(__NR_swapon, filename, 0);
-			if (res != 0) {
-				if (errno == EPERM) {
-					printf("Successfully created %d swapfiles\n", j);
-					break;
-				} else {
-					printf("Failed to create swapfile: %s\n", filename);
-					exit(1);
-				}
-			}
+			TST_EXP_PASS_SILENT(swapon(filename, 0));
 		}
 		exit(0);
 	} else
@@ -145,13 +61,40 @@ static int setup_swap(void)
 	if (WEXITSTATUS(status))
 		tst_brk(TFAIL, "Failed to setup swaps");
 
-	/* Create all needed extra swapfiles for testing */
-	for (j = 0; j < testfiles; j++)
-		make_swapfile(swap_testfiles[j].filename, 10, 0);
+	tst_res(TINFO, "Successfully created %d swapfiles", swapfiles);
+	make_swapfile(TEST_FILE, 10, 0);
 
 	return 0;
 }
 
+/*
+ * Check if the file is at /proc/swaps and remove it giving swapoff
+ */
+static int check_and_swapoff(const char *filename)
+{
+	char cmd_buffer[256];
+	int rc = -1;
+
+	if (snprintf(cmd_buffer, sizeof(cmd_buffer),
+		"grep -q '%s.*file' /proc/swaps", filename) < 0) {
+		tst_res(TWARN, "sprintf() failed to create the command string");
+	} else {
+		rc = 0;
+		if (system(cmd_buffer) == 0) {
+			/* now we need to swapoff the file */
+			if (swapoff(filename) != 0) {
+				tst_res(TWARN, "Failed to turn off swap "
+					"file. system reboot after "
+					"execution of LTP test suite "
+					"is recommended");
+				rc = -1;
+			}
+		}
+	}
+
+	return rc;
+}
+
 /*
  * Turn off all swapfiles previously turned on
  */
@@ -169,49 +112,17 @@ static int clean_swap(void)
 		}
 	}
 
-	for (j = 0; j < testfiles; j++) {
-		if (check_and_swapoff(swap_testfiles[j].filename) != 0) {
-			tst_res(TWARN, "Failed to turn off swap file %s.",
-				 swap_testfiles[j].filename);
-			return -1;
-		}
+	if (check_and_swapoff("testfile") != 0) {
+		tst_res(TWARN, "Failed to turn off swap file testfile");
+		return -1;
 	}
 
 	return 0;
 }
 
-/*
- * Check if the file is at /proc/swaps and remove it giving swapoff
- */
-static int check_and_swapoff(const char *filename)
+static void verify_swapon(void)
 {
-	char cmd_buffer[256];
-	int rc = -1;
-
-	if (snprintf(cmd_buffer, sizeof(cmd_buffer),
-		     "grep -q '%s.*file' /proc/swaps", filename) < 0) {
-		tst_res(TWARN, "sprintf() failed to create the command string");
-	} else {
-
-		rc = 0;
-
-		if (system(cmd_buffer) == 0) {
-
-			/* now we need to swapoff the file */
-			if (tst_syscall(__NR_swapoff, filename) != 0) {
-
-				tst_res(TWARN, "Failed to turn off swap "
-					 "file. system reboot after "
-					 "execution of LTP test suite "
-					 "is recommended");
-				rc = -1;
-
-			}
-
-		}
-	}
-
-	return rc;
+	TST_EXP_FAIL(swapon(TEST_FILE, 0), EPERM, "swapon(%s, 0)", TEST_FILE);
 }
 
 static void setup(void)
@@ -220,6 +131,11 @@ static void setup(void)
 		tst_brk(TCONF, "swap not supported by kernel");
 
 	is_swap_supported(TEST_FILE);
+
+	if (setup_swap() < 0) {
+		clean_swap();
+		tst_brk(TBROK, "Setup failed, quitting the test");
+	}
 }
 
 static void cleanup(void)
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
