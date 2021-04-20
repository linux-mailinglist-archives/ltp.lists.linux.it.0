Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BD365A49
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:38:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54DE53C6D3F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 15:38:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1E3C3C2403
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:38:40 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CA411200D4C
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:38:39 +0200 (CEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FPl7D5bzDzNwqy
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 21:35:36 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 20 Apr 2021 21:38:30 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 20 Apr 2021 21:38:39 +0800
Message-ID: <20210420133839.145408-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic in
 do_child()
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

We don't need do_child() loop 'TEST_LOOPING(lc)' times to invoke the
recvfrom() function, whitch makes no sense. If we run with "-i large number",
this will slow down the program.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/sendfile/sendfile02.c | 14 ++++++++------
 testcases/kernel/syscalls/sendfile/sendfile04.c | 14 ++++++++------
 testcases/kernel/syscalls/sendfile/sendfile05.c | 14 ++++++++------
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile02.c b/testcases/kernel/syscalls/sendfile/sendfile02.c
index e5f115146..acd7a5a50 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile02.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile02.c
@@ -156,15 +156,17 @@ void do_sendfile(OFF_T offset, int i)
  */
 void do_child(void)
 {
-	int lc;
-	socklen_t length;
 	char rbuf[4096];
+	ssize_t ret = 0;
+	socklen_t length = sizeof(sin1);

-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		length = sizeof(sin1);
-		recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1,
-			 &length);
+	ret = recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1, &length);
+	if (ret < 0) {
+		tst_resm(TFAIL, "child process recvfrom failed: %s\n",
+			 strerror(errno));
+		exit(1);
 	}
+
 	exit(0);
 }

diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
index 0f315abb0..322e2b58e 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile04.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
@@ -153,15 +153,17 @@ void do_sendfile(int prot, int pass_unmapped_buffer)
  */
 void do_child(void)
 {
-	int lc;
-	socklen_t length;
 	char rbuf[4096];
+	ssize_t ret = 0;
+	socklen_t length = sizeof(sin1);

-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		length = sizeof(sin1);
-		recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1,
-			 &length);
+	ret = recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1, &length);
+	if (ret < 0) {
+		tst_resm(TFAIL, "child process recvfrom failed: %s\n",
+			 strerror(errno));
+		exit(1);
 	}
+
 	exit(0);
 }

diff --git a/testcases/kernel/syscalls/sendfile/sendfile05.c b/testcases/kernel/syscalls/sendfile/sendfile05.c
index 0f268ceb3..a8e76d91d 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile05.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile05.c
@@ -118,15 +118,17 @@ void do_sendfile(void)
  */
 void do_child(void)
 {
-	int lc;
-	socklen_t length;
 	char rbuf[4096];
+	ssize_t ret = 0;
+	socklen_t length = sizeof(sin1);

-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		length = sizeof(sin1);
-		recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1,
-			 &length);
+	ret = recvfrom(sockfd, rbuf, 4096, 0, (struct sockaddr *)&sin1, &length);
+	if (ret < 0) {
+		tst_resm(TFAIL, "child process recvfrom failed: %s\n",
+			 strerror(errno));
+		exit(1);
 	}
+
 	exit(0);
 }

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
