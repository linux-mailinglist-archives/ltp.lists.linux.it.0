Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C543399C2C
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 09:57:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3B723C53F0
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 09:57:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 84A213C21FA
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 09:57:33 +0200 (CEST)
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B11A56008F7
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 09:57:29 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id WDI00123
 for <ltp@lists.linux.it>; Thu, 03 Jun 2021 15:57:23 +0800
Received: from localhost.localdomain (112.224.19.13) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2176.2; Thu, 3 Jun 2021 15:57:23 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 03:57:15 -0400
Message-ID: <20210603075715.23524-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [112.224.19.13]
tUid: 2021603155723d9cf381e97e20e86e9f12bcbbfbedfa5
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] ltp-aiodio/dio_append: fix dio_append()
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
Cc: dongshijiang <dongshijiang@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When running the dio_append test in the ltp-aiodiio.part4 test item, there was a problem that the file could not be created, but the test result was PASS. To this end, the following operations have been added.
1. create the directory where the file is located.
2. rewrite the dio_append API. Add relevant return values.

Signed-off-by: dongshijiang <dongshijiang@inspur.com>
---
 testcases/kernel/io/ltp-aiodio/dio_append.c | 26 +++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index 3f0ed29d5..500dfdc31 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -75,7 +75,7 @@ int read_eof(char *filename)
 	return 0;
 }
 
-void dio_append(char *filename)
+int dio_append(char *filename)
 {
 	int fd;
 	void *bufptr;
@@ -86,14 +86,14 @@ void dio_append(char *filename)
 
 	if (fd < 0) {
 		perror("cannot create file");
-		return;
+		return 1;
 	}
 
 	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
 	if (TEST_RETURN) {
 		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
 		close(fd);
-		return;
+		return 1;
 	}
 
 	memset(bufptr, 0, 64 * 1024);
@@ -102,17 +102,29 @@ void dio_append(char *filename)
 			fprintf(stderr, "write %d returned %d\n", i, w);
 		}
 	}
+	return 0;
 }
 
 int main(void)
 {
-	char filename[PATH_MAX];
+	char filename[PATH_MAX], filepath[PATH_MAX-5];
 	int pid[NUM_CHILDREN];
 	int num_children = 1;
 	int i;
+	int ret = -1;
 
-	snprintf(filename, sizeof(filename), "%s/aiodio/file",
+	snprintf(filepath, sizeof(filepath), "%s/aiodio",
 		 getenv("TMP") ? getenv("TMP") : "/tmp");
+
+	if (access(filepath, F_OK) == -1) {
+		char command[PATH_MAX + 10];
+
+		snprintf(command, sizeof(command), "mkdir -p %s", filepath);
+		if (system(command) != 0)
+			return 1;
+	}
+
+	snprintf(filename, sizeof(filename), "%s/file", filepath);
 
 	printf("Begin dio_append test...\n");
 
@@ -134,10 +146,10 @@ int main(void)
 	 * Parent appends to end of file using direct i/o
 	 */
 
-	dio_append(filename);
+	ret = dio_append(filename);
 
 	for (i = 0; i < num_children; i++) {
 		kill(pid[i], SIGTERM);
 	}
-	return 0;
+	return ret;
 }
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
