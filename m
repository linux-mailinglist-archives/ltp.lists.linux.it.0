Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042836FC81
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 16:35:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F08F3C60B0
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 16:35:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 433C43C1B10
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 16:35:26 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 381156011F8
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 16:35:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 623AC1063;
 Fri, 30 Apr 2021 07:35:23 -0700 (PDT)
Received: from e120937-lin.home (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAC773F73B;
 Fri, 30 Apr 2021 07:35:22 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: ltp@lists.linux.it
Date: Fri, 30 Apr 2021 15:35:05 +0100
Message-Id: <20210430143505.3267-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] mtest05/mmstress: fix writes operation logic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While generating tmpfiles, the map_and_thread() function does not handle
properly incomplete writes that happen to return having written fewer
bytes than requested and instead considers such condition an error straight
away: this behavior hides real errors on writes and results in far from
friendly error reports like these:

mmstress    0  TINFO  :  test1: Test case tests the race condition...
map_and_thread(): write(): Success
mmstress    1  TFAIL  :  mmstress.c:625: TEST 1 Failed

Fix the logic around such write() to allow for incomplete writes to be
properly retried till a real error condition is returned so that a more
meaningful report can be generated:

mmstress    0  TINFO  :  test1: Test case tests the race condition...
map_and_thread(): write(): No space left on device
mmstress    1  TFAIL  :  mmstress.c:625: TEST 1 Failed

While doing that, fix also a couple of minor unrelated issues in the same
map_and_thread() function (malloc retval check and redundant close())

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 testcases/kernel/mem/mtest05/mmstress.c | 30 ++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/mem/mtest05/mmstress.c b/testcases/kernel/mem/mtest05/mmstress.c
index e5d0ce867..c08d6c930 100644
--- a/testcases/kernel/mem/mtest05/mmstress.c
+++ b/testcases/kernel/mem/mtest05/mmstress.c
@@ -289,6 +289,8 @@ int map_and_thread(char *tmpfile,
 	static pthread_t pthread_ids[NUMTHREAD];
 	/* contains ids of the threads created       */
 	void * map_addr = NULL;	/* address where the file is mapped          */
+	size_t written = 0;
+	ssize_t bytes;
 
 	/* Create a file with permissions 0666, and open it with RDRW perms       */
 	/* if the name is not a NULL                                              */
@@ -299,22 +301,38 @@ int map_and_thread(char *tmpfile,
 			  S_IRWXO | S_IRWXU | S_IRWXG))
 		    == -1) {
 			perror("map_and_thread(): open()");
-			close(fd);
 			fflush(NULL);
 			return FAILED;
 		}
 
 		/* Write pagesize * pages_num bytes to the file */
 		empty_buf = malloc(pagesize * pages_num);
-		if (write(fd, empty_buf, pagesize * pages_num) !=
-		    (pagesize * pages_num)) {
-			perror("map_and_thread(): write()");
-			free(empty_buf);
-			fflush(NULL);
+		if (!empty_buf) {
+			perror("map_and_thread(): malloc()");
 			remove_files(tmpfile, NULL);
 			close(fd);
+			fflush(NULL);
 			return FAILED;
 		}
+
+		/* Writing fewer bytes than required is not an error so retry if
+		 * fewer were written; if that happened due to some permanent
+		 * error like ENOSPC the following retry will fail and a proper
+		 * errno will be reported.
+		 */
+		do {
+			bytes = write(fd, empty_buf + written,
+				      pagesize * pages_num - written);
+			if (bytes < 0) {
+				perror("map_and_thread(): write()");
+				free(empty_buf);
+				fflush(NULL);
+				close(fd);
+				remove_files(tmpfile, NULL);
+				return FAILED;
+			}
+			written += bytes;
+		} while (written < pagesize * pages_num);
 		map_type = (fault_type == COW_FAULT) ? MAP_PRIVATE : MAP_SHARED;
 
 		/* Map the file, if the required fault type is COW_FAULT map the file */
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
