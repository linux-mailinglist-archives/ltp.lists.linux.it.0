Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F3184ADB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 16:36:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0EF83C5902
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 16:36:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E4E093C58E9
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 16:36:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6026B1A0121D
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 16:36:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EE6CAD1E
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:36:32 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Mar 2020 16:36:30 +0100
Message-Id: <20200313153631.751-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Port readv01 to new LTP library
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/readv/readv01.c | 110 ++++++++--------------
 1 file changed, 38 insertions(+), 72 deletions(-)

diff --git a/testcases/kernel/syscalls/readv/readv01.c b/testcases/kernel/syscalls/readv/readv01.c
index 82fec39e1..ad0ab187b 100644
--- a/testcases/kernel/syscalls/readv/readv01.c
+++ b/testcases/kernel/syscalls/readv/readv01.c
@@ -1,22 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  *   07/2001 Ported by Wayne Boyer
- *
  * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
 /*
@@ -31,16 +17,11 @@
 #include <sys/uio.h>
 #include <fcntl.h>
 #include <memory.h>
-#include <errno.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
 #define	CHUNK		64
 
-char *TCID = "readv01";
-int TST_TOTAL = 1;
-
 static char buf[CHUNK];
 
 static struct iovec rd_iovec[] = {
@@ -51,74 +32,59 @@ static struct iovec rd_iovec[] = {
 
 static int fd;
 
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc, i, fail;
+	int i, fail;
 	char *vec;
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	SAFE_LSEEK(fd, 0, SEEK_SET);
 
-	setup();
+	if (readv(fd, rd_iovec, 0) == -1)
+		tst_res(TFAIL | TERRNO, "readv failed unexpectedly");
+	else
+		tst_res(TPASS, "readv read 0 io vectors");
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
+	memset(rd_iovec[0].iov_base, 0x00, CHUNK);
 
-		SAFE_LSEEK(cleanup, fd, 0, SEEK_SET);
+	if (readv(fd, rd_iovec, 3) != CHUNK) {
+		tst_res(TFAIL, "readv failed reading %d bytes, "
+			 "followed by two NULL vectors", CHUNK);
+	} else {
+		fail = 0;
+		vec = rd_iovec[0].iov_base;
 
-		if (readv(fd, rd_iovec, 0) == -1)
-			tst_resm(TFAIL | TERRNO, "readv failed unexpectedly");
-		else
-			tst_resm(TPASS, "readv read 0 io vectors");
-
-		memset(rd_iovec[0].iov_base, 0x00, CHUNK);
-
-		if (readv(fd, rd_iovec, 3) != CHUNK) {
-			tst_resm(TFAIL, "readv failed reading %d bytes, "
-				 "followed by two NULL vectors", CHUNK);
-		} else {
-			fail = 0;
-			vec = rd_iovec[0].iov_base;
-
-			for (i = 0; i < CHUNK; i++) {
-				if (vec[i] != 0x42)
-					fail++;
-			}
-
-			if (fail)
-				tst_resm(TFAIL, "Wrong buffer content");
-			else
-				tst_resm(TPASS, "readv passed reading %d bytes "
-				         "followed by two NULL vectors", CHUNK);
+		for (i = 0; i < CHUNK; i++) {
+			if (vec[i] != 0x42)
+				fail++;
 		}
-	}
 
-	cleanup();
-	tst_exit();
+		if (fail)
+			tst_res(TFAIL, "Wrong buffer content");
+		else
+			tst_res(TPASS, "readv passed reading %d bytes "
+			         "followed by two NULL vectors", CHUNK);
+	}
 }
 
 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	memset(buf, 0x42, sizeof(buf));
 
-	fd = SAFE_OPEN(cleanup, "data_file", O_WRONLY | O_CREAT, 0666);
-	SAFE_WRITE(cleanup, 1, fd, buf, sizeof(buf));
-	SAFE_CLOSE(cleanup, fd);
-	fd = SAFE_OPEN(cleanup, "data_file", O_RDONLY);
+	fd = SAFE_OPEN("data_file", O_WRONLY | O_CREAT, 0666);
+	SAFE_WRITE(1, fd, buf, sizeof(buf));
+	SAFE_CLOSE(fd);
+	fd = SAFE_OPEN("data_file", O_RDONLY);
 }
 
 static void cleanup(void)
 {
-	if (fd > 0)
-		close(fd);
-
-	tst_rmdir();
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_tmpdir = 1,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
