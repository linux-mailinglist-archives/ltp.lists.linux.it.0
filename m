Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10539B390
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 09:07:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57E233C4EE0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 09:07:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 85B6F3C2800
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 09:07:08 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E5A4114001EC
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 09:07:06 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id XDL00001
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 15:07:01 +0800
Received: from localhost.localdomain.localdomain (10.48.96.29) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2176.2; Fri, 4 Jun 2021 15:07:00 +0800
From: liubo03 <liubo03@inspur.com>
To: <ltp@lists.linux.it>
Date: Fri, 4 Jun 2021 03:06:58 -0400
Message-ID: <1622790418-36793-1-git-send-email-liubo03@inspur.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.48.96.29]
tUid: 2021604150701872bd52ae6861cf6eb1fe8fdd28abc10
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] io/ltp-aiodio: fix function return value
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

Function return value is determined using tst_resm (TFAIL,) and tst_exit function

Signed-off-by: liubo03 <liubo03@inspur.com>
---
 testcases/kernel/io/ltp-aiodio/aiodio_append.c | 9 ++++-----
 testcases/kernel/io/ltp-aiodio/dio_append.c    | 7 ++++---
 testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
index 5d97ed9..5490bd5 100644
--- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
@@ -93,7 +93,7 @@ void aiodio_append(char *filename)
 
 	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
 	if (fd < 0) {
-		perror("cannot create file");
+		tst_resm(TFAIL, "cannot create file %s", filename);
 		return;
 	}
 
@@ -116,7 +116,7 @@ void aiodio_append(char *filename)
 	 * Start the 1st NUM_AIO requests
 	 */
 	if ((w = io_submit(myctx, NUM_AIO, iocbs)) < 0) {
-		fprintf(stderr, "io_submit write returned %d\n", w);
+		tst_resm(TFAIL, "io_submit write returned %d", w);
 	}
 
 	/*
@@ -135,8 +135,7 @@ void aiodio_append(char *filename)
 					       AIO_SIZE, offset);
 				offset += AIO_SIZE;
 				if ((w = io_submit(myctx, 1, &iocbp)) < 0) {
-					fprintf(stderr,
-						"write %d returned %d\n", i, w);
+					tst_resm(TFAIL, "write %d returned %d", i, w);
 				}
 			}
 		}
@@ -176,7 +175,7 @@ int main(int argc, char **argv)
 		kill(pid[i], SIGTERM);
 	}
 
-	return 0;
+	tst_exit();
 }
 #else
 int main(void)
diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index 3f0ed29..585847f 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -85,7 +85,7 @@ void dio_append(char *filename)
 	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
 
 	if (fd < 0) {
-		perror("cannot create file");
+		tst_resm(TFAIL, "cannot create file %s", filename);
 		return;
 	}
 
@@ -99,7 +99,7 @@ void dio_append(char *filename)
 	memset(bufptr, 0, 64 * 1024);
 	for (i = 0; i < 1000; i++) {
 		if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
-			fprintf(stderr, "write %d returned %d\n", i, w);
+			tst_resm(TFAIL, "write %d returned %d", i, w);
 		}
 	}
 }
@@ -139,5 +139,6 @@ int main(void)
 	for (i = 0; i < num_children; i++) {
 		kill(pid[i], SIGTERM);
 	}
-	return 0;
+
+	tst_exit();
 }
diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 7d466dc..0b67f7b 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -112,7 +112,7 @@ void dio_append(char *filename, int fill)
 	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
 
 	if (fd < 0) {
-		perror("cannot create file");
+		tst_resm(TFAIL, "cannot create file %s", filename);
 		return;
 	}
 
@@ -127,7 +127,7 @@ void dio_append(char *filename, int fill)
 
 	for (i = 0; i < 1000; i++) {
 		if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
-			fprintf(stderr, "write %d returned %d\n", i, w);
+			tst_resm(TFAIL, "write %d returned %d", i, w);
 		}
 	}
 	close(fd);
@@ -173,5 +173,5 @@ int main(void)
 		kill(pid[i], SIGTERM);
 	}
 
-	return 0;
+	tst_exit();
 }
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
