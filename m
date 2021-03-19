Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19D341BE3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:59:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A1C13C5FC0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:59:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 753503C2CE4
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:59:55 +0100 (CET)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E7CFC600700
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:59:54 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id v8so2854101plz.10
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25QexHNfP+C+zzF/DPFKxKapJg13wYskh336gtlfgZA=;
 b=lw5cewdWBoRbWX4s7P5CsMWJrDY2QzoRzVpkY13pgBf7pXTCcMQk53Mnn0iRyAm28t
 iB+2pwfh0ckrR1KSZ83oPstMBseaVIbGd6DHLQgOmGmV7cCY9vS3ytJVFp6Av8ERhMJr
 2JRrbwzp22HZ6TvKL10J8CM0AdnguZ9mPQye2QFB/PeDUK/xkpEZoJjArmuhmGWjLEAF
 GDzqKVFISazzOpJUYuRzrOxcibx9aKsIMk1PT2u55gRH32dvkUurAY/kwW0Gl94XhJPv
 xsTuxMZ3QdysYx9JhFlCL5+IXOg+PEebYocLWX2IFeCj+RO0ygcZGsSY2pCC5B6TClqR
 DIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25QexHNfP+C+zzF/DPFKxKapJg13wYskh336gtlfgZA=;
 b=lWO2nlq5BV2Ta17LeglSG1s9bRCTB8MRyx4EYFQqP9Z3qqOtQWM8vBjEtdWWZbnagM
 PhU8m4TUcKUTqA2+PX2uHWrTV/oH0tvXXnmTfF3OhdizBoYnBQz9GrRI1IS8C2d+hVdf
 /XlEOjphuJfKodeLMTZHtugE9WCpr7SiJT3Z3umyFm4hFZ3739QcRmx/FfOqOzLm8faf
 nwRk4vSXnaDzfC4m85+2rNoPR5OXjhPXx7Z9jafKoD2gJaba7Ye7TUWbRSbyeJYTtnbV
 bE9hsa4AVpetTV2NEwBp+KLwb6EuF7ZTz+gqec7CZbFwy1Kw00BLoCSMEyRzSFzTWy0W
 lJQA==
X-Gm-Message-State: AOAM532rppoe+CMh5asOr2XA1EnLpiQwtZuSliyh9e1mjyYso0YDINEm
 DIZTps/x5+zP3Vw3N9mzXxtdiU+wQg0=
X-Google-Smtp-Source: ABdhPJyCaD42LHYOUwoZEEqTr7ydQhotoYY3mYWwnuSrp+mCEYzQwHeJm0OuOOyP/5J6Q3oaLPhyEA==
X-Received: by 2002:a17:90a:e614:: with SMTP id
 j20mr9303677pjy.184.1616155193140; 
 Fri, 19 Mar 2021 04:59:53 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id w26sm5200123pfn.33.2021.03.19.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:59:52 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 20:59:34 +0900
Message-Id: <20210319115934.1801692-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/swapon/swapon0{1..3}: remove checking if fs
 type is BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

remove redundant tasks as BTRFS is checked in is_swap_supported()
Fixes: caf453532("syscalls/swapon/swapon0{1..3}: use helpers to check
	support status")

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/swapon/swapon01.c |  7 -------
 testcases/kernel/syscalls/swapon/swapon02.c |  5 -----
 testcases/kernel/syscalls/swapon/swapon03.c | 15 +--------------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
index f95ce0ab2..aff842e4c 100644
--- a/testcases/kernel/syscalls/swapon/swapon01.c
+++ b/testcases/kernel/syscalls/swapon/swapon01.c
@@ -32,18 +32,11 @@ static void cleanup(void);
 char *TCID = "swapon01";
 int TST_TOTAL = 1;

-static long fs_type;
-
 static void verify_swapon(void)
 {
 	TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));

 	if (TEST_RETURN == -1) {
-		if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
-			tst_brkm(TCONF, cleanup,
-			         "Swapfile on BTRFS not implemeted");
-			return;
-		}
 		tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
 	} else {
 		tst_resm(TPASS, "Succeeded to turn on swapfile");
diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
index 3d49d0c6b..653b1f33e 100644
--- a/testcases/kernel/syscalls/swapon/swapon02.c
+++ b/testcases/kernel/syscalls/swapon/swapon02.c
@@ -81,11 +81,6 @@ static void verify_swapon(struct test_case_t *test)
 		return;
 	}

-	if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
-		tst_resm(TCONF, "Swapfile on BTRFS not implemeted");
-			return;
-	}
-
 	tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
 	         " %d, errno: %s and got %d.", test->exp_errno,
 	         test->exp_errval, TEST_ERRNO);
diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
index cef57150c..19455bfe6 100644
--- a/testcases/kernel/syscalls/swapon/swapon03.c
+++ b/testcases/kernel/syscalls/swapon/swapon03.c
@@ -52,8 +52,6 @@ int TST_TOTAL = 1;

 static int swapfiles;

-static long fs_type;
-
 int testfiles = 3;
 static struct swap_testfile_t {
 	char *filename;
@@ -215,9 +213,6 @@ static int setup_swap(void)
 			/* turn on the swap file */
 			res = ltp_syscall(__NR_swapon, filename, 0);
 			if (res != 0) {
-				if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL)
-					exit(2);
-
 				if (errno == EPERM) {
 					printf("Successfully created %d "
 					       "swapfiles\n", j);
@@ -233,16 +228,8 @@ static int setup_swap(void)
 	} else
 		waitpid(pid, &status, 0);

-	switch (WEXITSTATUS(status)) {
-	case 0:
-	break;
-	case 2:
-		tst_brkm(TCONF, cleanup, "Swapfile on BTRFS not implemeted");
-	break;
-	default:
+	if (WEXITSTATUS(status) == 1)
 		tst_brkm(TFAIL, cleanup, "Failed to setup swaps");
-	break;
-	}

 	/* Create all needed extra swapfiles for testing */
 	for (j = 0; j < testfiles; j++)
--
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
