Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63B197870
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 181D43C3144
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 12:12:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8CD103C3133
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 46759100054C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 12:12:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EE237AEFD
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 10:12:39 +0000 (UTC)
From: Jozef Pupava <jpupava@suse.com>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 12:12:22 +0200
Message-Id: <20200330101222.25371-3-jpupava@suse.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200330101222.25371-1-jpupava@suse.com>
References: <20200330101222.25371-1-jpupava@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Fix calculations and defined constants
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

-define BUF_SIZE as BUFSIZ is defined in glibc and can be different
 on different systems
-BUF_SIZE is smaller than BLOCKSIZE to ensure correct offset
-smaller MAXBLKS will keep short test run (10-13s)
-fix data_blocks calculation to avoid zero value
-calculate f_bavail with f_bsize as filesystems which don't support
 tail packing have f_frsize == f_bsize

Acked-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Jozef Pupava <jpupava@suse.com>
---
 testcases/kernel/syscalls/fsync/fsync02.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/fsync/fsync02.c b/testcases/kernel/syscalls/fsync/fsync02.c
index 9506b4868..fcdc14f89 100644
--- a/testcases/kernel/syscalls/fsync/fsync02.c
+++ b/testcases/kernel/syscalls/fsync/fsync02.c
@@ -20,11 +20,12 @@
 #include "tst_test.h"
 
 #define BLOCKSIZE 8192
-#define MAXBLKS 262144
+#define MAXBLKS 65536
 #define TIME_LIMIT 120
+#define BUF_SIZE 2048
 
 char tempfile[40] = "";
-char pbuf[BUFSIZ];
+char pbuf[BUF_SIZE];
 int fd;
 off_t max_blks = MAXBLKS;
 
@@ -40,14 +41,14 @@ static void setup(void) {
 		tst_brk(TBROK, "fstatvfs failed");
 	}
 
-	f_bavail = (stat_buf.f_bavail * stat_buf.f_frsize) / BLOCKSIZE;
+	f_bavail = (stat_buf.f_bavail * stat_buf.f_bsize) / BLOCKSIZE;
 	if (f_bavail && (f_bavail < MAXBLKS)) {
 		max_blks = f_bavail;
 	}
 
 #ifdef LARGEFILE
 	SAFE_FCNTL(fd, F_SETFL, O_LARGEFILE);
-	SAFE_WRITE(1, fd, pbuf, BUFSIZ);
+	SAFE_WRITE(1, fd, pbuf, BUF_SIZE);
 #endif
 }
 
@@ -60,17 +61,15 @@ static void run(void) {
 	double time_delta;
 	long int random_number;
 
-	while (max_block <= data_blocks) {
-		random_number = rand();
-		max_block = random_number % max_blks;
-		data_blocks = random_number % 1000 + 1;
-	}
+	random_number = rand();
+	max_block = random_number % max_blks + 1;
+	data_blocks = random_number % max_block;
 
 	for (i = 1; i <= data_blocks; i++) {
 		offset = i * ((BLOCKSIZE * max_block) / data_blocks);
-		offset -= BUFSIZ;
+		offset -= BUF_SIZE;
 		SAFE_LSEEK(fd, offset, SEEK_SET);
-		SAFE_WRITE(1, fd, pbuf, BUFSIZ);
+		SAFE_WRITE(1, fd, pbuf, BUF_SIZE);
 	}
 	time_start = time(0);
 
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
