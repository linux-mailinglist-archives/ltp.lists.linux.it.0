Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7347C39F223
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 11:17:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43D453C4DA4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 11:17:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A35E73C1C6B
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 11:17:25 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5915D14010E4
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 11:17:23 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id CHA00120
 for <ltp@lists.linux.it>; Tue, 08 Jun 2021 17:17:20 +0800
Received: from localhost.localdomain (10.72.58.101) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 8 Jun 2021 17:17:16 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 05:17:14 -0400
Message-ID: <20210608091714.62930-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.72.58.101]
tUid: 2021608171720aa93097fc88bec6d3da0e70109a1d5a7
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
Cc: liubo03 <liubo03@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: liubo03 <liubo03@inspur.com>

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
