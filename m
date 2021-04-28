Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A936D2FD
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 09:21:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BF753C6270
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 09:21:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41FAA3C0B9A
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 09:21:04 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 80E812003B7
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 09:21:02 +0200 (CEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FVVNN4nrbz7xVR
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 15:18:28 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 28 Apr 2021 15:20:46 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 28 Apr 2021 15:20:16 +0800
Message-ID: <20210428072016.17556-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] ttype: Replase TINFO with TPASS or TFAIL
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

For those:
	testcases/kernel/syscalls/fcntl/fcntl16.c
	testcases/kernel/syscalls/fcntl/fcntl18.c
	testcases/kernel/syscalls/fcntl/fcntl19.c
	testcases/kernel/syscalls/fcntl/fcntl20.c
	testcases/kernel/syscalls/fcntl/fcntl21.c
	testcases/kernel/syscalls/getpgid/getpgid01.c
	testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
	testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
	testcases/kernel/syscalls/writev/writev05.c
	testcases/kernel/syscalls/writev/writev06.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/fcntl/fcntl16.c     | 12 ++---
 testcases/kernel/syscalls/fcntl/fcntl18.c     | 12 ++---
 testcases/kernel/syscalls/fcntl/fcntl19.c     | 28 ++++++------
 testcases/kernel/syscalls/fcntl/fcntl20.c     | 28 ++++++------
 testcases/kernel/syscalls/fcntl/fcntl21.c     | 44 +++++++++----------
 testcases/kernel/syscalls/getpgid/getpgid01.c | 10 ++---
 .../kernel/syscalls/modify_ldt/modify_ldt01.c | 14 +++---
 .../kernel/syscalls/modify_ldt/modify_ldt02.c | 12 ++---
 testcases/kernel/syscalls/writev/writev05.c   |  4 +-
 testcases/kernel/syscalls/writev/writev06.c   |  4 +-
 10 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c b/testcases/kernel/syscalls/fcntl/fcntl16.c
index a77a81298..f12474f79 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl16.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
@@ -673,10 +673,10 @@ int main(int ac, char **av)
 		 */
 		tst_resm(TINFO, "Entering block 1");
 		if (run_test(O_CREAT | O_RDWR | O_TRUNC, 0777, 0, 11)) {
-			tst_resm(TINFO, "Test case 1: without mandatory "
+			tst_resm(TFAIL, "Test case 1: without mandatory "
 				 "locking FAILED");
 		} else {
-			tst_resm(TINFO, "Test case 1: without manadatory "
+			tst_resm(TPASS, "Test case 1: without manadatory "
 				 "locking PASSED");
 		}
 		tst_resm(TINFO, "Exiting block 1");
@@ -689,11 +689,11 @@ int main(int ac, char **av)
 		tst_resm(TINFO, "Entering block 2");
 		if (NO_NFS && run_test(O_CREAT | O_RDWR | O_TRUNC, S_ISGID |
 			     S_IRUSR | S_IWUSR, 0, 11)) {
-			tst_resm(TINFO, "Test case 2: with mandatory record "
+			tst_resm(TFAIL, "Test case 2: with mandatory record "
 				 "locking FAILED");
 		} else {
 			if (NO_NFS)
-				tst_resm(TINFO, "Test case 2: with mandatory"
+				tst_resm(TPASS, "Test case 2: with mandatory"
 					 " record locking PASSED");
 			else
 				tst_resm(TCONF, "Test case 2: NFS does not"
@@ -709,11 +709,11 @@ int main(int ac, char **av)
 		tst_resm(TINFO, "Entering block 3");
 		if (NO_NFS && run_test(O_CREAT | O_RDWR | O_TRUNC | O_NDELAY,
 			     S_ISGID | S_IRUSR | S_IWUSR, 0, 11)) {
-			tst_resm(TINFO, "Test case 3: mandatory locking with "
+			tst_resm(TFAIL, "Test case 3: mandatory locking with "
 				 "NODELAY FAILED");
 		} else {
 			if (NO_NFS)
-				tst_resm(TINFO, "Test case 3: mandatory"
+				tst_resm(TPASS, "Test case 3: mandatory"
 					 " locking with NODELAY PASSED");
 			else
 				tst_resm(TCONF, "Test case 3: NFS does not"
diff --git a/testcases/kernel/syscalls/fcntl/fcntl18.c b/testcases/kernel/syscalls/fcntl/fcntl18.c
index 5eefbd128..18d00ccbf 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl18.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl18.c
@@ -88,9 +88,9 @@ int main(int ac, char **av)
 		fail = 1;
 	}
 	if (fail) {
-		tst_resm(TINFO, "Block 1 FAILED");
+		tst_resm(TFAIL, "Block 1 FAILED");
 	} else {
-		tst_resm(TINFO, "Block 1 PASSED");
+		tst_resm(TPASS, "Block 1 PASSED");
 	}
 	tst_resm(TINFO, "Exit block 1");
 #else
@@ -111,9 +111,9 @@ int main(int ac, char **av)
 		fail = 1;
 	}
 	if (fail) {
-		tst_resm(TINFO, "Block 2 FAILED");
+		tst_resm(TFAIL, "Block 2 FAILED");
 	} else {
-		tst_resm(TINFO, "Block 2 PASSED");
+		tst_resm(TPASS, "Block 2 PASSED");
 	}
 	tst_resm(TINFO, "Exit block 2");
 #else
@@ -150,9 +150,9 @@ int main(int ac, char **av)
 			fail = 1;
 		}
 		if (fail) {
-			tst_resm(TINFO, "Block 3 FAILED");
+			tst_resm(TFAIL, "Block 3 FAILED");
 		} else {
-			tst_resm(TINFO, "Block 3 PASSED");
+			tst_resm(TPASS, "Block 3 PASSED");
 		}
 	}
 	tst_resm(TINFO, "Exit block 3");
diff --git a/testcases/kernel/syscalls/fcntl/fcntl19.c b/testcases/kernel/syscalls/fcntl/fcntl19.c
index 88c91d6ea..441ef00b5 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl19.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl19.c
@@ -353,9 +353,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 1: FAILED");
+			tst_resm(TFAIL, "Test block 1: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 1: PASSED");
+			tst_resm(TPASS, "Test block 1: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");

@@ -396,9 +396,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 2: FAILED");
+			tst_resm(TFAIL, "Test block 2: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 2: PASSED");
+			tst_resm(TPASS, "Test block 2: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 2");

@@ -440,9 +440,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 3: FAILED");
+			tst_resm(TFAIL, "Test block 3: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 3: PASSED");
+			tst_resm(TPASS, "Test block 3: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 3");

@@ -490,9 +490,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 4: FAILED");
+			tst_resm(TFAIL, "Test block 4: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 4: PASSED");
+			tst_resm(TPASS, "Test block 4: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 4");

@@ -534,9 +534,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 5: FAILED");
+			tst_resm(TFAIL, "Test block 5: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 5: PASSED");
+			tst_resm(TPASS, "Test block 5: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 5");

@@ -578,9 +578,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 6: FAILED");
+			tst_resm(TFAIL, "Test block 6: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 6: PASSED");
+			tst_resm(TPASS, "Test block 6: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 6");

@@ -623,9 +623,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 7: FAILED");
+			tst_resm(TFAIL, "Test block 7: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 7: PASSED");
+			tst_resm(TPASS, "Test block 7: PASSED");
 		}

 		tst_resm(TINFO, "Exit block 7");
diff --git a/testcases/kernel/syscalls/fcntl/fcntl20.c b/testcases/kernel/syscalls/fcntl/fcntl20.c
index 99fd78313..2b8b654c4 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl20.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl20.c
@@ -352,9 +352,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 1: FAILED");
+			tst_resm(TFAIL, "Test block 1: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 1: PASSED");
+			tst_resm(TPASS, "Test block 1: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");

@@ -395,9 +395,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 2: FAILED");
+			tst_resm(TFAIL, "Test block 2: FAILED");
 		else
-			tst_resm(TINFO, "Test block 2: PASSED");
+			tst_resm(TPASS, "Test block 2: PASSED");
 		tst_resm(TINFO, "Exit block 2");

 /* //block3: */
@@ -438,9 +438,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 3: FAILED");
+			tst_resm(TFAIL, "Test block 3: FAILED");
 		else
-			tst_resm(TINFO, "Test block 3: PASSED");
+			tst_resm(TPASS, "Test block 3: PASSED");
 		tst_resm(TINFO, "Exit block 3");

 /* //block4: */
@@ -487,9 +487,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 4: FAILED");
+			tst_resm(TFAIL, "Test block 4: FAILED");
 		else
-			tst_resm(TINFO, "Test block 4: PASSED");
+			tst_resm(TPASS, "Test block 4: PASSED");
 		tst_resm(TINFO, "Exit block 4");

 /* //block5: */
@@ -530,9 +530,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 5: FAILED");
+			tst_resm(TFAIL, "Test block 5: FAILED");
 		else
-			tst_resm(TINFO, "Test block 5: PASSED");
+			tst_resm(TPASS, "Test block 5: PASSED");
 		tst_resm(TINFO, "Exit block 5");

 /* //block6: */
@@ -573,9 +573,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 6: FAILED");
+			tst_resm(TFAIL, "Test block 6: FAILED");
 		else
-			tst_resm(TINFO, "Test block 6: PASSED");
+			tst_resm(TPASS, "Test block 6: PASSED");
 		tst_resm(TINFO, "Exit block 6");

 /* //block7: */
@@ -617,9 +617,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail)
-			tst_resm(TINFO, "Test block 7: FAILED");
+			tst_resm(TFAIL, "Test block 7: FAILED");
 		else
-			tst_resm(TINFO, "Test block 7: PASSED");
+			tst_resm(TPASS, "Test block 7: PASSED");

 		tst_resm(TINFO, "Exit block 7");

diff --git a/testcases/kernel/syscalls/fcntl/fcntl21.c b/testcases/kernel/syscalls/fcntl/fcntl21.c
index 8f1a67cf6..bf310ace8 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl21.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl21.c
@@ -347,9 +347,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 1: FAILED");
+			tst_resm(TFAIL, "Test block 1: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 1: PASSED");
+			tst_resm(TPASS, "Test block 1: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");

@@ -378,9 +378,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 2: FAILED");
+			tst_resm(TFAIL, "Test block 2: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 2: PASSED");
+			tst_resm(TPASS, "Test block 2: PASSED");
 		}

 		tst_resm(TINFO, "Exit block 2");
@@ -429,9 +429,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 3: FAILED");
+			tst_resm(TFAIL, "Test block 3: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 3 : PASSED");
+			tst_resm(TPASS, "Test block 3 : PASSED");
 		}
 		tst_resm(TINFO, "Exit block 3");

@@ -479,9 +479,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 4: FAILED");
+			tst_resm(TFAIL, "Test block 4: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 4: PASSED");
+			tst_resm(TPASS, "Test block 4: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 4");

@@ -529,9 +529,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 5: FAILED");
+			tst_resm(TFAIL, "Test block 5: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 5: PASSED");
+			tst_resm(TPASS, "Test block 5: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 5");

@@ -579,9 +579,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 6 FAILED");
+			tst_resm(TFAIL, "Test block 6 FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 6 PASSED");
+			tst_resm(TPASS, "Test block 6 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 6");

@@ -634,9 +634,9 @@ int main(int ac, char **av)
 		 */
 		unlock_file();
 		if (fail) {
-			tst_resm(TINFO, "Test block 7: FAILED");
+			tst_resm(TFAIL, "Test block 7: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 7: PASSED");
+			tst_resm(TPASS, "Test block 7: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 7");

@@ -686,9 +686,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 8: FAILED");
+			tst_resm(TFAIL, "Test block 8: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 8: PASSED");
+			tst_resm(TPASS, "Test block 8: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 8");

@@ -739,9 +739,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 9: FAILED");
+			tst_resm(TFAIL, "Test block 9: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 9: PASSED");
+			tst_resm(TPASS, "Test block 9: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 9");

@@ -793,9 +793,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 10: FAILED");
+			tst_resm(TFAIL, "Test block 10: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 10: PASSED");
+			tst_resm(TPASS, "Test block 10: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 10");

@@ -849,9 +849,9 @@ int main(int ac, char **av)
 		unlock_file();

 		if (fail) {
-			tst_resm(TINFO, "Test block 11: FAILED");
+			tst_resm(TFAIL, "Test block 11: FAILED");
 		} else {
-			tst_resm(TINFO, "Test block 11: PASSED");
+			tst_resm(TPASS, "Test block 11: PASSED");
 		}
 		tst_resm(TINFO, "Exit block 11");

diff --git a/testcases/kernel/syscalls/getpgid/getpgid01.c b/testcases/kernel/syscalls/getpgid/getpgid01.c
index 9af523d88..424dcd8bf 100644
--- a/testcases/kernel/syscalls/getpgid/getpgid01.c
+++ b/testcases/kernel/syscalls/getpgid/getpgid01.c
@@ -77,9 +77,9 @@ int main(int ac, char **av)
 			while ((pgid_0 = wait(&ex_stat)) != -1) ;

 			if (WEXITSTATUS(ex_stat) == 0)
-				tst_resm(TINFO, "%s PASSED", TCID);
+				tst_resm(TPASS, "%s PASSED", TCID);
 			else
-				tst_resm(TINFO, "%s FAILED", TCID);
+				tst_resm(TFAIL, "%s FAILED", TCID);

 			exit(0);
 		}
@@ -92,7 +92,7 @@ int main(int ac, char **av)
 		}

 		if (fail)
-			tst_resm(TINFO, "Test block 1: getpgid(0) FAILED");
+			tst_resm(TFAIL, "Test block 1: getpgid(0) FAILED");
 		else
 			tst_resm(TPASS, "Test block 1: getpgid(0) PASSED");
 		tst_resm(TINFO, "Exit block 1");
@@ -155,7 +155,7 @@ int main(int ac, char **av)
 		}

 		if (fail)
-			tst_resm(TINFO, "Test block 4: getpgid(1) FAILED");
+			tst_resm(TFAIL, "Test block 4: getpgid(1) FAILED");
 		else
 			tst_resm(TPASS, "Test block 4: getpgid(1) PASSED");
 		tst_resm(TINFO, "Exit block 4");
@@ -170,7 +170,7 @@ int main(int ac, char **av)
 		}

 		if (fail)
-			tst_resm(TINFO, "Test block 5: getpgid(1) FAILED");
+			tst_resm(TFAIL, "Test block 5: getpgid(1) FAILED");
 		else
 			tst_resm(TPASS, "Test block 5: getpgid(1) PASSED");
 		tst_resm(TINFO, "Exit block 5");
diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c b/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
index 248111814..dc489988d 100644
--- a/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
+++ b/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
@@ -134,9 +134,9 @@ int main(int ac, char **av)
 		}

 		if (flag) {
-			tst_resm(TINFO, "block 1 FAILED");
+			tst_resm(TFAIL, "block 1 FAILED");
 		} else {
-			tst_resm(TINFO, "block 1 PASSED");
+			tst_resm(TPASS, "block 1 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");
 		free(ptr);
@@ -165,9 +165,9 @@ int main(int ac, char **av)
 		}

 		if (flag) {
-			tst_resm(TINFO, "block 2 FAILED");
+			tst_resm(TFAIL, "block 2 FAILED");
 		} else {
-			tst_resm(TINFO, "block 2 PASSED");
+			tst_resm(TPASS, "block 2 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 2");

@@ -177,7 +177,7 @@ int main(int ac, char **av)
 		 * Create a new LDT segment.
 		 */
 		if (create_segment(seg, sizeof(seg)) == -1) {
-			tst_brkm(TINFO, cleanup, "Creation of segment failed");
+			tst_brkm(TBROK, cleanup, "Creation of segment failed");
 		}

 		/*
@@ -200,9 +200,9 @@ int main(int ac, char **av)
 		}

 		if (flag) {
-			tst_resm(TINFO, "block 3 FAILED");
+			tst_resm(TFAIL, "block 3 FAILED");
 		} else {
-			tst_resm(TINFO, "block 3 PASSED");
+			tst_resm(TPASS, "block 3 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 3");

diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
index c953ac420..d5b56aa9c 100644
--- a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
+++ b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
@@ -113,7 +113,7 @@ int main(int ac, char **av)

 		seg[0] = 12345;
 		if (create_segment(seg, sizeof(seg)) == -1) {
-			tst_brkm(TINFO, cleanup, "Creation of segment failed");
+			tst_brkm(TBROK, cleanup, "Creation of segment failed");
 		}

 		val = read_segment(0);
@@ -125,9 +125,9 @@ int main(int ac, char **av)
 		}

 		if (flag) {
-			tst_resm(TINFO, "block 1 FAILED");
+			tst_resm(TFAIL, "block 1 FAILED");
 		} else {
-			tst_resm(TINFO, "block 1 PASSED");
+			tst_resm(TPASS, "block 1 PASSED");
 		}

 		tst_resm(TINFO, "Exit block 1");
@@ -137,7 +137,7 @@ int main(int ac, char **av)
 		flag = 0;

 		if (create_segment(0, 10) == -1) {
-			tst_brkm(TINFO, cleanup, "Creation of segment failed");
+			tst_brkm(TBROK, cleanup, "Creation of segment failed");
 		}

 		tst_old_flush();
@@ -155,9 +155,9 @@ int main(int ac, char **av)
 		}

 		if (flag) {
-			tst_resm(TINFO, "block 2 FAILED");
+			tst_resm(TFAIL, "block 2 FAILED");
 		} else {
-			tst_resm(TINFO, "block 2 PASSED");
+			tst_resm(TPASS, "block 2 PASSED");
 		}
 	}
 	cleanup();
diff --git a/testcases/kernel/syscalls/writev/writev05.c b/testcases/kernel/syscalls/writev/writev05.c
index 910fa23b8..8fc3c9967 100644
--- a/testcases/kernel/syscalls/writev/writev05.c
+++ b/testcases/kernel/syscalls/writev/writev05.c
@@ -179,9 +179,9 @@ int main(int argc, char **argv)
 			fail = 1;
 		}
 		if (fail) {
-			tst_resm(TINFO, "block 1 FAILED");
+			tst_resm(TFAIL, "block 1 FAILED");
 		} else {
-			tst_resm(TINFO, "block 1 PASSED");
+			tst_resm(TPASS, "block 1 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");
 	}
diff --git a/testcases/kernel/syscalls/writev/writev06.c b/testcases/kernel/syscalls/writev/writev06.c
index 6fe7206e8..3cab2ef05 100644
--- a/testcases/kernel/syscalls/writev/writev06.c
+++ b/testcases/kernel/syscalls/writev/writev06.c
@@ -138,9 +138,9 @@ int main(int argc, char **argv)
 			fail = 1;
 		}
 		if (fail) {
-			tst_resm(TINFO, "block 1 FAILED");
+			tst_resm(TFAIL, "block 1 FAILED");
 		} else {
-			tst_resm(TINFO, "block 1 PASSED");
+			tst_resm(TPASS, "block 1 PASSED");
 		}
 		tst_resm(TINFO, "Exit block 1");
 	}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
