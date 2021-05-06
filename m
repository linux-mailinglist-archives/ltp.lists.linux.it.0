Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D716374EC2
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 07:01:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5AA33C5686
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 07:01:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0CB573C0BAF
 for <ltp@lists.linux.it>; Thu,  6 May 2021 07:01:42 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6027160148C
 for <ltp@lists.linux.it>; Thu,  6 May 2021 07:01:39 +0200 (CEST)
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FbLsy0y4SzWdvN
 for <ltp@lists.linux.it>; Thu,  6 May 2021 12:57:26 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 13:01:33 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 6 May 2021 13:00:47 +0800
Message-ID: <20210506050047.935-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeml753-chm.china.huawei.com (10.1.199.152)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4 v2] syscalls/fcntl: Replace TINFO with TPASS or
 TFAIL
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

1)remove redundant variable
2)remove redundant log
3)replace TINFO with TPASS or TFAIL

For those:
	testcases/kernel/syscalls/fcntl/fcntl16.c
	testcases/kernel/syscalls/fcntl/fcntl18.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v1->v2:
	1)correct the patch's format error
	2)remove the useless//block1: comments
 testcases/kernel/syscalls/fcntl/fcntl16.c | 73 +++++++----------------
 testcases/kernel/syscalls/fcntl/fcntl18.c | 43 ++-----------
 2 files changed, 27 insertions(+), 89 deletions(-)

diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c b/testcases/kernel/syscalls/fcntl/fcntl16.c
index a77a81298..c5c49284a 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl16.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
@@ -441,7 +441,7 @@ void setup(void)
 	sigaction(SIGALRM, &sact, NULL);
 }

-int run_test(int file_flag, int file_mode, int start, int end)
+static void run_test(int file_flag, int file_mode, int start, int end)
 {
 	int child_count;
 	int child;
@@ -468,7 +468,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 				 errno);
 			close(fd);
 			unlink(tmpname);
-			return 1;
+			goto err;
 		}

 		/* Initialize second parent lock structure */
@@ -482,7 +482,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 					 test + 1, errno);
 				close(fd);
 				unlink(tmpname);
-				return 1;
+				goto err;
 			}
 		}

@@ -502,7 +502,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 					if (self_exec(argv0, "ddddd", i, parent,
 						      test, thislock, fd) < 0) {
 						perror("self_exec failed");
-						return 1;
+						goto err;
 					}
 #else
 					dochild(i);
@@ -510,7 +510,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 				}
 				if (child < 0) {
 					perror("Fork failed");
-					return 1;
+					goto err;
 				}
 				child_count++;
 				child_pid[i] = child;
@@ -553,7 +553,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 				 test + 1, errno);
 			close(fd);
 			unlink(tmpname);
-			return 1;
+			goto err;
 		}

 		/* Initialize fourth parent lock structure */
@@ -567,7 +567,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
 					 test + 1, errno);
 				close(fd);
 				unlink(tmpname);
-				return 1;
+				goto err;
 			}
 		}

@@ -640,12 +640,16 @@ int run_test(int file_flag, int file_mode, int start, int end)
 		close(fd);
 	}
 	unlink(tmpname);
-	if (fail) {
-		return 1;
-	} else {
-		return 0;
+
+	if (!fail) {
+		tst_resm(TPASS, "locking test successed");
+		return;
 	}
-	return 0;
+err:
+	if (file_mode & S_ISGID && !NO_NFS)
+		tst_resm(TCONF, "NFS does not support mandatory locking");
+	else
+		tst_resm(TFAIL, "locking test failed");
 }

 int main(int ac, char **av)
@@ -666,60 +670,25 @@ int main(int ac, char **av)
 		/* reset tst_count in case we are looping */
 		tst_count = 0;

-/* //block1: */
 		/*
 		 * Check file locks on an ordinary file without
 		 * mandatory locking
 		 */
-		tst_resm(TINFO, "Entering block 1");
-		if (run_test(O_CREAT | O_RDWR | O_TRUNC, 0777, 0, 11)) {
-			tst_resm(TINFO, "Test case 1: without mandatory "
-				 "locking FAILED");
-		} else {
-			tst_resm(TINFO, "Test case 1: without manadatory "
-				 "locking PASSED");
-		}
-		tst_resm(TINFO, "Exiting block 1");
+		run_test(O_CREAT | O_RDWR | O_TRUNC, 0777, 0, 11);

-/* //block2: */
 		/*
 		 * Check the file locks on a file with mandatory record
 		 * locking
 		 */
-		tst_resm(TINFO, "Entering block 2");
-		if (NO_NFS && run_test(O_CREAT | O_RDWR | O_TRUNC, S_ISGID |
-			     S_IRUSR | S_IWUSR, 0, 11)) {
-			tst_resm(TINFO, "Test case 2: with mandatory record "
-				 "locking FAILED");
-		} else {
-			if (NO_NFS)
-				tst_resm(TINFO, "Test case 2: with mandatory"
-					 " record locking PASSED");
-			else
-				tst_resm(TCONF, "Test case 2: NFS does not"
-					 " support mandatory locking");
-		}
-		tst_resm(TINFO, "Exiting block 2");
+		run_test(O_CREAT | O_RDWR | O_TRUNC,
+			S_ISGID | S_IRUSR | S_IWUSR, 0, 11);

-/* //block3: */
 		/*
 		 * Check file locks on a file with mandatory record locking
 		 * and no delay
 		 */
-		tst_resm(TINFO, "Entering block 3");
-		if (NO_NFS && run_test(O_CREAT | O_RDWR | O_TRUNC | O_NDELAY,
-			     S_ISGID | S_IRUSR | S_IWUSR, 0, 11)) {
-			tst_resm(TINFO, "Test case 3: mandatory locking with "
-				 "NODELAY FAILED");
-		} else {
-			if (NO_NFS)
-				tst_resm(TINFO, "Test case 3: mandatory"
-					 " locking with NODELAY PASSED");
-			else
-				tst_resm(TCONF, "Test case 3: NFS does not"
-					 " support mandatory locking");
-		}
-		tst_resm(TINFO, "Exiting block 3");
+		run_test(O_CREAT | O_RDWR | O_TRUNC | O_NDELAY,
+			S_ISGID | S_IRUSR | S_IWUSR, 0, 11);
 	}
 	cleanup();
 	tst_exit();
diff --git a/testcases/kernel/syscalls/fcntl/fcntl18.c b/testcases/kernel/syscalls/fcntl/fcntl18.c
index 5eefbd128..8592f30ed 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl18.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl18.c
@@ -69,14 +69,10 @@ int main(int ac, char **av)

 	setup();		/* global setup */

-/* //block1: */
 #ifndef UCLINUX
 	/* Skip since uClinux does not implement memory protection */
-	tst_resm(TINFO, "Enter block 1");
-	fail = 0;
 	if ((fd = open("temp.dat", O_CREAT | O_RDWR, 0777)) < 0) {	//mode must be specified when O_CREATE is in the flag
 		tst_resm(TFAIL, "file opening error");
-		fail = 1;
 	}

 	/* Error condition if address is bad */
@@ -84,45 +80,25 @@ int main(int ac, char **av)
 	if (errno == EFAULT) {
 		tst_resm(TPASS, "Test F_GETLK: for errno EFAULT PASSED");
 	} else {
-		tst_resm(TFAIL, "Test F_GETLK: for errno EFAULT FAILED");
-		fail = 1;
+		tst_resm(TFAIL | TERRNO, "Test F_GETLK: for errno EFAULT FAILED");
 	}
-	if (fail) {
-		tst_resm(TINFO, "Block 1 FAILED");
-	} else {
-		tst_resm(TINFO, "Block 1 PASSED");
-	}
-	tst_resm(TINFO, "Exit block 1");
 #else
 	tst_resm(TINFO, "Skip block 1 on uClinux");
 #endif

-/* //block2: */
 #ifndef UCLINUX
 	/* Skip since uClinux does not implement memory protection */
-	tst_resm(TINFO, "Enter block 2");
-	fail = 0;
 	/* Error condition if address is bad */
 	retval = fcntl(fd, F_GETLK64, (struct flock *)INVAL_FLAG);
 	if (errno == EFAULT) {
 		tst_resm(TPASS, "Test F_GETLK64: for errno EFAULT PASSED");
 	} else {
-		tst_resm(TFAIL, "Test F_GETLK64: for errno EFAULT FAILED");
-		fail = 1;
-	}
-	if (fail) {
-		tst_resm(TINFO, "Block 2 FAILED");
-	} else {
-		tst_resm(TINFO, "Block 2 PASSED");
+		tst_resm(TFAIL | TERRNO, "Test F_GETLK64: for errno EFAULT FAILED");
 	}
-	tst_resm(TINFO, "Exit block 2");
 #else
 	tst_resm(TINFO, "Skip block 2 on uClinux");
 #endif

-/* //block3: */
-	tst_resm(TINFO, "Enter block 3");
-	fail = 0;
 	if ((pid = FORK_OR_VFORK()) == 0) {	/* child */
 		fail = 0;
 		pass = getpwnam("nobody");
@@ -138,24 +114,17 @@ int main(int ac, char **av)
 		if (errno == EINVAL) {
 			tst_resm(TPASS, "Test for errno EINVAL PASSED");
 		} else {
-			tst_resm(TFAIL, "Test for errno EINVAL FAILED, "
-				 "got: %d", errno);
+			tst_resm(TFAIL | TERRNO, "Test for errno EINVAL FAILED");
 			fail = 1;
 		}
 		exit(fail);
 	} else {		/* parent */
 		waitpid(pid, &status, 0);
-		if (WEXITSTATUS(status) != 0) {
+		if (WEXITSTATUS(status) != 0)
 			tst_resm(TFAIL, "child returned bad exit status");
-			fail = 1;
-		}
-		if (fail) {
-			tst_resm(TINFO, "Block 3 FAILED");
-		} else {
-			tst_resm(TINFO, "Block 3 PASSED");
-		}
+		else
+			tst_resm(TPASS, "child returned as expected");
 	}
-	tst_resm(TINFO, "Exit block 3");

 	cleanup();
 	tst_exit();
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
