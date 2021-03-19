Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B15341EA6
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:45:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60EF53C5FC3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:45:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1AC673C2EBC
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:45:41 +0100 (CET)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9079F2010AB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:45:40 +0100 (CET)
Received: by mail-pg1-x52a.google.com with SMTP id u19so3712855pgh.10
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GzqVR4Gq8NbJ8ju1rYU1kAgQ1I3wGH5JFGAtbdx4wGY=;
 b=YckI1UB615zJW5Bf/NGIwB/NldVsGlr+7Le+C0GUo9gKtcnpA/RZzcAcoU9VGfCRDK
 hBnyeIlFDspgBJ5+xbT1Eb21ttFZ6i7e1x9AlmkewzgmZCeFDpe2g0SApGa/nfJPSrpy
 DFXYjQb5TLDNsIBusBxyljQUp8eucu8Po+NDx2R6vHVnmZdqLE9GjO74UfsQnBpaOHh3
 B37qVEonh3Et8/nXib05H9hoVHQiDK5yKzoMqLZP/2h+nPNU5hK4E/Q5HewyZUvI2luL
 deXUpk1hIWfBURAGWgFdMsmoquFSgctou35QSAlPkNFCsEx5ss/JyCIMLGiaj+5vu+i2
 OdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GzqVR4Gq8NbJ8ju1rYU1kAgQ1I3wGH5JFGAtbdx4wGY=;
 b=TLiw79r7ens8TKnB3nzOiVzuAKJ1ODVHI5EUG3J6Ngb2CjAN25wx7ucPnQjtKAy5sU
 ie4uqiD2EYb+aB26sn8l546GlKKIsyz7L45A7xn2vOB4MvA2ESgEUb3J6PMaxGdI65/h
 gcRw5/aAHoAHSGG2rpmCa4Xo20CiR0UcoV0XLM0qnzWIhoiJdS6gYP9/7LwOuHbZU07R
 NtCSxjMHs4xVLWUpYOnMWQNEpLVH/Xo4w7eMxNNfX0pl1jeLpqiHS84sFAYSASFmb3Zj
 HBgmJbvpwIta7cjxhqzgD2YgpOHuMgkAF3wZgSrh9DvpdpH+55gqpj3CgayTRoPldvDI
 LkqQ==
X-Gm-Message-State: AOAM531b+g/5y7yhXoYnAmzunfQNtfUer3c4rqbxcl6PSsVKIHCG9U5r
 FX7/3dmRn5dRIC06hjBAhrYNoBS2Pq2K1g==
X-Google-Smtp-Source: ABdhPJze2vRLzWJgbziKT4Zs/LLeviSGBda/53lJAzq/30ZZeOJ37v+RW0b9KsLxsC5CEtNHKHsC2g==
X-Received: by 2002:a63:d242:: with SMTP id t2mr11325711pgi.431.1616161538680; 
 Fri, 19 Mar 2021 06:45:38 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id 82sm5650019pfv.19.2021.03.19.06.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:45:38 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 22:45:11 +0900
Message-Id: <20210319134511.1844348-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/swapon/swapon0{1..3}: Remove the check
 for BTRFS
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
 testcases/kernel/syscalls/swapon/swapon02.c | 14 +++-----------
 testcases/kernel/syscalls/swapon/swapon03.c | 15 +--------------
 3 files changed, 4 insertions(+), 32 deletions(-)

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
index 3d49d0c6b..f0f99619d 100644
--- a/testcases/kernel/syscalls/swapon/swapon02.c
+++ b/testcases/kernel/syscalls/swapon/swapon02.c
@@ -47,7 +47,6 @@ int TST_TOTAL = 4;

 static uid_t nobody_uid;
 static int do_swapoff;
-static long fs_type;

 static struct test_case_t {
 	char *err_desc;
@@ -81,11 +80,6 @@ static void verify_swapon(struct test_case_t *test)
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
@@ -138,12 +132,10 @@ static void setup(void)
 	make_swapfile(cleanup, "swapfile01", 0);
 	make_swapfile(cleanup, "alreadyused", 0);

-	if (ltp_syscall(__NR_swapon, "alreadyused", 0)) {
-		if (fs_type != TST_BTRFS_MAGIC || errno != EINVAL)
-			tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
-	} else {
+	if (ltp_syscall(__NR_swapon, "alreadyused", 0))
+		tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
+	else
 		do_swapoff = 1;
-	}

 	TEST_PAUSE;
 }
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
