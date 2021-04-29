Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902136EAED
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:54:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B6F23C6193
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:54:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68D0F3C1C13
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:54:08 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 60DD6601032
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:54:06 +0200 (CEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FWFkG4JYpz16Lcp
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 20:51:34 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 20:53:57 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 20:53:22 +0800
Message-ID: <20210429125322.31559-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] syscalls/writev: Replace TINFO with TPASS or TFAIL
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

1)remove fail flag
2)remove redundant log
3)replace TINFO with TPASS or TFAIL

For those:
	testcases/kernel/syscalls/writev/writev02.c
	testcases/kernel/syscalls/writev/writev05.c
	testcases/kernel/syscalls/writev/writev06.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/writev/writev02.c |  1 -
 testcases/kernel/syscalls/writev/writev05.c | 16 +---------------
 testcases/kernel/syscalls/writev/writev06.c | 15 +--------------
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/testcases/kernel/syscalls/writev/writev02.c b/testcases/kernel/syscalls/writev/writev02.c
index 60d9e8978..3d51733f0 100644
--- a/testcases/kernel/syscalls/writev/writev02.c
+++ b/testcases/kernel/syscalls/writev/writev02.c
@@ -87,7 +87,6 @@ void sighandler(int);
 void l_seek(int, off_t, int);
 void setup(void);
 void cleanup(void);
-int fail;

 int main(int argc, char **argv)
 {
diff --git a/testcases/kernel/syscalls/writev/writev05.c b/testcases/kernel/syscalls/writev/writev05.c
index 910fa23b8..b9c25f8de 100644
--- a/testcases/kernel/syscalls/writev/writev05.c
+++ b/testcases/kernel/syscalls/writev/writev05.c
@@ -82,7 +82,6 @@ void sighandler(int);
 long l_seek(int, long, int);
 void setup(void);
 void cleanup(void);
-int fail;

 #if !defined(UCLINUX)

@@ -154,36 +153,24 @@ int main(int argc, char **argv)
 		 * or not.
 		 */
 //block1:
-		tst_resm(TINFO, "Enter block 1");
-		fail = 0;
-
 		l_seek(fd[0], 0, 0);
 		TEST(writev(fd[0], wr_iovec, 2));
 		if (TEST_RETURN < 0) {
 			if (TEST_ERRNO == EFAULT) {
-				tst_resm(TINFO, "Received EFAULT as expected");
+				tst_resm(TPASS, "Received EFAULT as expected");
 			} else {
 				tst_resm(TFAIL, "Expected EFAULT, got %d",
 					 TEST_ERRNO);
-				fail = 1;
 			}
 			l_seek(fd[0], K_1, 0);
 			if ((nbytes = read(fd[0], buf_list[0], CHUNK)) != 0) {
 				tst_resm(TFAIL, "Expected nbytes = 0, got "
 					 "%d", nbytes);
-				fail = 1;
 			}
 		} else {
 			tst_resm(TFAIL, "Error writev returned a positive "
 				 "value");
-			fail = 1;
-		}
-		if (fail) {
-			tst_resm(TINFO, "block 1 FAILED");
-		} else {
-			tst_resm(TINFO, "block 1 PASSED");
 		}
-		tst_resm(TINFO, "Exit block 1");
 	}
 	close(fd[0]);
 	close(fd[1]);
@@ -283,7 +270,6 @@ long l_seek(int fdesc, long offset, int whence)
 {
 	if (lseek(fdesc, offset, whence) < 0) {
 		tst_resm(TFAIL, "lseek Failed : errno = %d", errno);
-		fail = 1;
 	}
 	return 0;
 }
diff --git a/testcases/kernel/syscalls/writev/writev06.c b/testcases/kernel/syscalls/writev/writev06.c
index 6fe7206e8..d8a0feb67 100644
--- a/testcases/kernel/syscalls/writev/writev06.c
+++ b/testcases/kernel/syscalls/writev/writev06.c
@@ -73,7 +73,6 @@ int TST_TOTAL = 1;
 void sighandler(int);
 void setup(void);
 void cleanup(void);
-int fail;

 int main(int argc, char **argv)
 {
@@ -117,32 +116,20 @@ int main(int argc, char **argv)
 		 * so all bytes must be successfully written.
 		 */
 //block1:
-
-		tst_resm(TINFO, "Enter block 1");
-		fail = 0;
-
 		TEST(writev(fd[0], wr_iovec, 2));
 		if (TEST_RETURN >= 0) {
 			if (TEST_RETURN == 2) {
-				tst_resm(TINFO,
+				tst_resm(TPASS,
 					 "writev returned %d as expected", 2);
 			} else {
 				tst_resm(TFAIL, "Expected nbytes = %d, got "
 					 "%ld", 2, TEST_RETURN);
-				fail = 1;
 			}
 		} else {
 			tst_resm(TFAIL | TTERRNO,
 				 "Error writev return value = %ld",
 				 TEST_RETURN);
-			fail = 1;
-		}
-		if (fail) {
-			tst_resm(TINFO, "block 1 FAILED");
-		} else {
-			tst_resm(TINFO, "block 1 PASSED");
 		}
-		tst_resm(TINFO, "Exit block 1");
 	}
 	cleanup();
 	tst_exit();
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
