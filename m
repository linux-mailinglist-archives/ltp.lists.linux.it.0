Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99A10C60E
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 10:36:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE3843C23FE
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 10:36:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 17FB23C220D
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 10:36:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1152F1417266
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 10:36:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B7C6B189
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:36:10 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 10:36:10 +0100
Message-Id: <20191128093610.6903-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128093610.6903-1-mdoucha@suse.cz>
References: <20191128093610.6903-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Use real FS block size in fallocate05
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

fallocate() behavior depends on whether the file range is aligned to full
blocks. Make sure that the test always uses aligned file range so that
the test is consistent across platforms.

Also use the TEST() macro to prevent errno pollution and add notes about
some file system quirks that may or may not be bugs.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/syscalls/fallocate/fallocate05.c   | 75 ++++++++++++-------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c b/testcases/kernel/syscalls/fallocate/fallocate05.c
index 17034e5b1..040f176b9 100644
--- a/testcases/kernel/syscalls/fallocate/fallocate05.c
+++ b/testcases/kernel/syscalls/fallocate/fallocate05.c
@@ -11,65 +11,87 @@
 
 #include <stdio.h>
 #include <stdlib.h>
-#include <errno.h>
 #include <fcntl.h>
 #include "tst_test.h"
 #include "lapi/fallocate.h"
 
 #define MNTPOINT "mntpoint"
-#define FALLOCATE_SIZE (1024*1024)
+#define FALLOCATE_BLOCKS 16
 #define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
 
 static int fd;
+static char *buf = NULL;
 
 static void run(void)
 {
-	char buf[FALLOCATE_SIZE];
-	ssize_t ret;
+	size_t bufsize, i;
+	struct stat statbuf;
 
 	fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT);
 
-	if (fallocate(fd, 0, 0, FALLOCATE_SIZE)) {
-		if (errno == EOPNOTSUPP) {
-			tst_res(TCONF | TERRNO, "fallocate() not supported");
+	// Use real FS block size, otherwise fallocate() call will test
+	// different things on different platforms
+	SAFE_FSTAT(fd, &statbuf);
+	bufsize = FALLOCATE_BLOCKS * statbuf.st_blksize;
+	buf = realloc(buf, bufsize);
+
+	if (!buf) {
+		tst_brk(TBROK, "Buffer allocation failed");
+		SAFE_CLOSE(fd);
+		return;
+	}
+
+	TEST(fallocate(fd, 0, 0, bufsize));
+
+	if (TST_RET) {
+		if (errno == ENOTSUP) {
+			tst_res(TCONF | TTERRNO, "fallocate() not supported");
 			SAFE_CLOSE(fd);
 			return;
 		}
 
-		tst_brk(TBROK | TERRNO,
-			"fallocate(fd, 0, 0, %i)", FALLOCATE_SIZE);
+		tst_brk(TBROK | TTERRNO, "fallocate(fd, 0, 0, %i)", bufsize);
 	}
 
 	tst_fill_fs(MNTPOINT, 1);
 
-	ret = write(fd, buf, sizeof(buf));
+	TEST(write(fd, buf, bufsize));
 
-	if (ret < 0)
-		tst_res(TFAIL | TERRNO, "write() failed unexpectedly");
+	if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO, "write() failed unexpectedly");
+	else if (TST_RET != bufsize)
+		tst_res(TFAIL,
+			"Short write(): %ld bytes (expected %zu)",
+			TST_RET, bufsize);
 	else
-		tst_res(TPASS, "write() wrote %zu bytes", ret);
+		tst_res(TPASS, "write() wrote %ld bytes", TST_RET);
 
-	ret = fallocate(fd, 0, FALLOCATE_SIZE, FALLOCATE_SIZE);
-	if (ret != -1)
+	// fallocate(1 block) may pass here on XFS. Original test allocated
+	// 8KB (2 blocks on x86) so keep the original behavior.
+	TEST(fallocate(fd, 0, bufsize, 2 * statbuf.st_blksize));
+	if (TST_RET != -1)
 		tst_brk(TFAIL, "fallocate() succeeded unexpectedly");
 
-	if (errno != ENOSPC)
-		tst_brk(TFAIL | TERRNO, "fallocate() should fail with ENOSPC");
+	if (TST_ERR != ENOSPC)
+		tst_brk(TFAIL | TTERRNO, "fallocate() should fail with ENOSPC");
 
-	tst_res(TPASS | TERRNO, "fallocate() on full FS");
+	tst_res(TPASS | TTERRNO, "fallocate() on full FS");
 
-	ret = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, FALLOCATE_SIZE);
-	if (ret == -1) {
-		if (errno == EOPNOTSUPP)
+	// btrfs won't release any space unless the whole file has been
+	// deallocated. Original test did that, keep the original behavior.
+	TEST(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
+		bufsize));
+	if (TST_RET == -1) {
+		if (TST_ERR == ENOTSUP)
 			tst_brk(TCONF, TESTED_FLAGS);
 
-		tst_brk(TBROK | TERRNO, TESTED_FLAGS);
+		tst_brk(TBROK | TTERRNO, TESTED_FLAGS);
 	}
 	tst_res(TPASS, TESTED_FLAGS);
 
-	ret = write(fd, buf, 10);
-	if (ret == -1)
-		tst_res(TFAIL | TERRNO, "write()");
+	TEST(write(fd, buf, 10));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "write()");
 	else
 		tst_res(TPASS, "write()");
 
@@ -80,6 +102,9 @@ static void cleanup(void)
 {
 	if (fd > 0)
 		SAFE_CLOSE(fd);
+
+	if (buf)
+		free(buf);
 }
 
 static struct tst_test test = {
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
