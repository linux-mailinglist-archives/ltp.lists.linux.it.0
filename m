Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FF3ECF3F
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Aug 2021 09:19:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3738C3C585F
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Aug 2021 09:19:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F25F3C1B0B
 for <ltp@lists.linux.it>; Mon, 16 Aug 2021 09:19:01 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2747D1400E14
 for <ltp@lists.linux.it>; Mon, 16 Aug 2021 09:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1629098339; i=@fujitsu.com;
 bh=DclpeAV6LOz4/k/Tbn0B7ue/hsb2lZU+ihN/szX/uVU=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=OMr327zAOdKoHSCeOBAcfxIfa+HvqiPJqe0VeU6aQZo8d0Tsdkf3vywoQ6S2EdLvA
 f77buYyY3tv6eqE6n8j7PgToCaHXVq6q9bsd9CnKTXpf3kywkMr7m9xVs7Ayj6cKnf
 gCyYyCeVoHa110h2Sm0ZTEW5U3WeA0f2NgHw3whwvBwIBeTyuO5Ck2Jgm3NY96+XwO
 U+xFKWxEiJgZ50SfYDH/7Bi2KrFem2T/SVJ1vfJ95s/0tWCknoDjgAmwf1KcYVZcqU
 aeIrvcaG3w4jIqBMtxvl2seSTYA/b7ecN7MDrNtOSgoHB4unhq/DCF9CasKhdPY8d4
 7IELsokvqIY9g==
Received: from [100.112.192.137] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 62/CB-10123-2611A116;
 Mon, 16 Aug 2021 07:18:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MRopskKJV
 osPSOhMX0F0fZLFZ838HowOSx7/c6Vo8zC46wBzBFsWbmJeVXJLBmzPuhXbA8rKL//gz2Bsbn
 Ll2MXBxCAq8ZJW507WCDcPYzSjy7foypi5GTg01AQ+La43ZmEFtEQFTi8/RzYDazgI3EvqsTw
 GxhgXCJ3T+msIPYLAKqEg+OH2MDsXkF3CQWfd0FZksIKEhMefgerJ5TQEVix+alYPVCAsoSRx
 9sY4GoF5Q4OfMJC8R8CYmDL14wQ/QqSuzfu5ERwq6QmDFjG9sERv5ZSFpmIWlZwMi0itEiqSg
 zPaMkNzEzR9fQwEDX0NBI19ASiI1N9RKrdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjEC
 QzSl4ED7DsZHrz/oHWKU5GBSEuXV+iuZKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9zKfVKKQY
 FFqempFWmYOMF5g0hIcPEoivHvYgNK8xQWJucWZ6RCpU4y6HDuPzlvELMSSl5+XKiXOaywAVC
 QAUpRRmgc3Aha7lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ83qATOHJzCuB2/QK6AgmoCN
 8DCRBjihJREhJNTAFenH8cfHpkiv3nfY8yD/S0om15GJOYjN38d5DYh8rJ3cuLuK5teT+hAPX
 m7ouVmUVGEfd2TUlsOfzSzWhye7/3pf13rX4rhVZvX57acbqhFxHrVuzlD82K9Y2PbNMcj/TH
 lmxiyk8Nkli64UtBjf0H36dHV0adUruzsx01euH4+6y7r64oV9+/bMTfonZsnafZ0y6JCYdZs
 Ik1GxnaLoyXdZ3vRsHnwDfxn8H2N75cbGoLPAK5tvPzPdhZegjV/+bM8Q8Hjp9WirFyycWO+2
 qMY/w0V3idWqu2vsu7vT7vsxLr3TV69mbdLMn2JZ/Od+qs7p9o698+TYH4fa1kfUzCqo3Z5nk
 6Oza/yZ3mRJLcUaioRZzUXEiAKynd2BYAwAA
X-Env-Sender: daisl.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-265.messagelabs.com!1629098338!248803!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30418 invoked from network); 16 Aug 2021 07:18:58 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-22.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Aug 2021 07:18:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17G7IjhZ006186
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 16 Aug 2021 08:18:51 +0100
Received: from rhel79.g08.fujitsu.local (10.167.225.51) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 16 Aug 2021 08:18:42 +0100
From: Dai Shili <daisl.fnst@fujitsu.com>
To: <chrubis@suse.cz>
Date: Sun, 15 Aug 2021 07:02:43 -0400
Message-ID: <1629025363-21885-1-git-send-email-daisl.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YQlIFagVIrWXjmgY@yuki>
References: <YQlIFagVIrWXjmgY@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.51]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/readv02: Convert to new API and merge
 readv03 into readv02
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1) merge readv03 into readv02
2) use tst_get_bad_addr() API
3) use TST_EXP_FAIL2 macro

Signed-off-by: Dai Shili <daisl.fnst@fujitsu.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/readv/.gitignore |   1 -
 testcases/kernel/syscalls/readv/readv02.c  | 327 +++++++----------------------
 testcases/kernel/syscalls/readv/readv03.c  |  53 -----
 4 files changed, 79 insertions(+), 303 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/readv/readv03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 9af5aa5..cb04a88 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1085,7 +1085,6 @@ readlinkat02 readlinkat02
 
 readv01 readv01
 readv02 readv02
-readv03 readv03
 
 realpath01 realpath01
 
diff --git a/testcases/kernel/syscalls/readv/.gitignore b/testcases/kernel/syscalls/readv/.gitignore
index c4aa61e..a532741 100644
--- a/testcases/kernel/syscalls/readv/.gitignore
+++ b/testcases/kernel/syscalls/readv/.gitignore
@@ -1,3 +1,2 @@
 /readv01
 /readv02
-/readv03
diff --git a/testcases/kernel/syscalls/readv/readv02.c b/testcases/kernel/syscalls/readv/readv02.c
index aa40e2c..9a26e50 100644
--- a/testcases/kernel/syscalls/readv/readv02.c
+++ b/testcases/kernel/syscalls/readv/readv02.c
@@ -1,284 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (C) Bull S.A. 2001
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * 05/2002 Ported by Jacky Malcles
  */
 
-/*
- * NAME
- * 	readv02.c
- *
+/*\
  * DESCRIPTION
- *	Testcase to check the error conditions of the readv(2) system call.
+ *  test 1:
+ *  The sum of the iov_len values overflows an ssize_t value, expect an EINVAL.
  *
- * CALLS
- * 	readv()
+ *  test 2:
+ *  Buf is outside the accessible address space, expect an EFAULT.
  *
- * ALGORITHM
- *	Create a IO vector, and attempt to readv() various components of it.
+ *  test 3:
+ *  The vector count iovcnt is less than zero, expect an EINVAL.
  *
- * USAGE
- *	readv02
+ *  test 4:
+ *  The parameter passed to read is a directory, check if the errno is
+ *  set to EISDIR.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- * 	None
+ *  test 5:
+ *  Read with an invalid file descriptor, and expect an EBADF.
  */
-#include <sys/types.h>
-#include <sys/uio.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-#include <memory.h>
-#include <errno.h>
 
-#include "test.h"
-#include "safe_macros.h"
-
-#define	K_1	1024
-#define	M_1	K_1 * K_1
-#define	G_1	M_1 * K_1
-
-#define	NBUFS		4
-#define	CHUNK		64
-#define	MAX_IOVEC	16
-#define DATA_FILE	"readv_data_file"
-
-char buf1[K_1], buf2[K_1], buf3[K_1];
-
-struct iovec rd_iovec[MAX_IOVEC] = {
-	/* iov_base *//* iov_len */
+#include <sys/uio.h>
+#include "tst_test.h"
 
-	/* Test case #1 */
-	{buf2, -1},
-	{(buf2 + CHUNK), CHUNK},
-	{(buf2 + CHUNK * 2), CHUNK},
+#define K_1     1024
+#define MODES   0700
 
-	/* Test case #2 */
-	{(buf2 + CHUNK * 3), G_1},
-	{(buf2 + CHUNK * 4), G_1},
-	{(buf2 + CHUNK * 5), G_1},
+#define CHUNK           64
 
-	/* Test case #3 */
-	{(caddr_t) - 1, CHUNK},
-	{(buf2 + CHUNK * 6), CHUNK},
-	{(buf2 + CHUNK * 8), CHUNK},
+static int badfd = -1;
+static int fd[2] = {-1, -1};
+static char buf1[K_1];
+const char *TEST_DIR = "test_dir";
+const char *TEST_FILE = "test_file";
 
-	/* Test case #4 */
-	{(buf2 + CHUNK * 9), CHUNK}
+static struct iovec invalid_iovec[] = {
+	{buf1, -1},
+	{buf1 + CHUNK, CHUNK},
+	{buf1 + 2*CHUNK, CHUNK},
 };
 
-char f_name[K_1];
-
-int fd[4];
-char *buf_list[NBUFS];
+static struct iovec large_iovec[] = {
+	{buf1, K_1},
+	{buf1 + CHUNK, K_1},
+	{buf1 + CHUNK*2, K_1},
+};
 
-char *TCID = "readv02";
-int TST_TOTAL = 1;
+static struct iovec efault_iovec[] = {
+	{NULL, CHUNK},
+	{buf1 + CHUNK, CHUNK},
+	{buf1 + 2*CHUNK, CHUNK},
+};
 
-char *bad_addr = 0;
+static struct iovec valid_iovec[] = {
+	{buf1, CHUNK},
+};
 
-int init_buffs(char **);
-int fill_mem(char *, int, int);
-long l_seek(int, long, int);
-char *getenv();
-void setup();
-void cleanup();
+static struct tcase {
+	int *fd;
+	void *buf;
+	int count;
+	int exp_error;
+} tcases[] = {
+	{&fd[0], invalid_iovec, 1, EINVAL},
+	{&fd[0], efault_iovec, 3, EFAULT},
+	{&fd[0], large_iovec, -1, EINVAL},
+	{&fd[1], valid_iovec, 1, EISDIR},
+	{&badfd, valid_iovec, 3, EBADF},
+};
 
-int main(int ac, char **av)
+static void verify_readv(unsigned int n)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-//test1:
-		if (readv(fd[0], rd_iovec, 1) < 0) {
-			if (errno != EINVAL) {
-				tst_resm(TFAIL, "readv() set an illegal errno:"
-					 " expected: EINVAL, got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EINVAL");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
-
-//test2:
-		l_seek(fd[0], CHUNK * 6, 0);
-		if (readv(fd[0], (rd_iovec + 6), 3) < 0) {
-			if (errno != EFAULT) {
-				tst_resm(TFAIL, "expected errno = EFAULT, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EFAULT");
-			}
-			if (memcmp((buf_list[0] + CHUNK * 6),
-				   (buf_list[1] + CHUNK * 6), CHUNK * 3) != 0) {
-				tst_resm(TFAIL, "Error: readv() partially "
-					 "overlaid buf[2]");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
-
-//test3:
-		if (readv(fd[1], (rd_iovec + 9), 1) < 0) {
-			if (errno != EBADF) {
-				tst_resm(TFAIL, "expected errno = EBADF, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EBADF");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
-
-//test4:
-		l_seek(fd[0], CHUNK * 10, 0);
-		if (readv(fd[0], (rd_iovec + 10), -1) < 0) {
-			if (errno != EINVAL) {
-				tst_resm(TFAIL, "expected errno = EINVAL, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EINVAL");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
-
-	}
-	close(fd[0]);
-	close(fd[1]);
-	cleanup();
-	tst_exit();
+	struct tcase *tc = &tcases[n];
 
+	TST_EXP_FAIL2(readv(*tc->fd, tc->buf, tc->count), tc->exp_error,
+		"readv(%d, %p, %d)", *tc->fd, tc->buf, tc->count);
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	int nbytes;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
+	fd[0] = SAFE_OPEN(TEST_FILE, O_WRONLY | O_CREAT, 0666);
+	SAFE_WRITE(1, fd[0], buf1, CHUNK);
+	SAFE_CLOSE(fd[0]);
 
-	buf_list[0] = buf1;
-	buf_list[1] = buf2;
-	buf_list[2] = buf3;
-	buf_list[3] = NULL;
-
-	init_buffs(buf_list);
-
-	sprintf(f_name, "%s.%d", DATA_FILE, getpid());
-
-	if ((fd[0] = open(f_name, O_WRONLY | O_CREAT, 0666)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
-			 "errno = %d", f_name, errno);
-	} else {
-		if ((nbytes = write(fd[0], buf_list[2], K_1)) != K_1) {
-			tst_brkm(TBROK, cleanup, "write failed: nbytes "
-				 "= %d " "errno = %d", nbytes, errno);
-		}
-	}
+	fd[0] = SAFE_OPEN(TEST_FILE, O_RDONLY, 0666);
 
-	SAFE_CLOSE(cleanup, fd[0]);
+	efault_iovec[0].iov_base = tst_get_bad_addr(NULL);
 
-	if ((fd[0] = open(f_name, O_RDONLY, 0666)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
-			 "errno = %d", f_name, errno);
-	}
-
-	fd[1] = -1;		/* Invalid file descriptor */
-
-	bad_addr = mmap(0, 1, PROT_NONE,
-			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
-	if (bad_addr == MAP_FAILED) {
-		tst_brkm(TBROK, cleanup, "mmap failed");
-	}
-	rd_iovec[6].iov_base = bad_addr;
+	SAFE_MKDIR(TEST_DIR, MODES);
+	fd[1] = SAFE_OPEN(TEST_DIR, O_RDONLY);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-	SAFE_UNLINK(NULL, f_name);
-	tst_rmdir();
-
-}
-
-int init_buffs(char *pbufs[])
+static void cleanup(void)
 {
 	int i;
 
-	for (i = 0; pbufs[i] != NULL; i++) {
-		switch (i) {
-		case 0:
-		 /*FALLTHROUGH*/ case 1:
-			fill_mem(pbufs[i], 0, 1);
-			break;
-
-		case 2:
-			fill_mem(pbufs[i], 1, 0);
-			break;
-
-		default:
-			tst_brkm(TBROK, cleanup, "Error in init_buffs()");
-		}
-	}
-	return 0;
-}
-
-int fill_mem(char *c_ptr, int c1, int c2)
-{
-	int count;
-
-	for (count = 1; count <= K_1 / CHUNK; count++) {
-		if (count & 0x01) {	/* if odd */
-			memset(c_ptr, c1, CHUNK);
-		} else {	/* if even */
-			memset(c_ptr, c2, CHUNK);
-		}
+	for (i = 0; i < 2; i++) {
+		if (fd[i] > 0)
+			SAFE_CLOSE(fd[i]);
 	}
-	return 0;
 }
 
-long l_seek(int fdesc, long offset, int whence)
-{
-	SAFE_LSEEK(cleanup, fdesc, offset, whence);
-	return 0;
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_readv,
+};
diff --git a/testcases/kernel/syscalls/readv/readv03.c b/testcases/kernel/syscalls/readv/readv03.c
deleted file mode 100644
index 8f5cddf..0000000
--- a/testcases/kernel/syscalls/readv/readv03.c
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) Bull S.A. 2001
- * Copyright (c) International Business Machines  Corp., 2001
- * 05/2002 Ported by Jacky Malcles
- */
-
-/*\
- * [Description]
- *
- * Testcase to check EISDIR error when fd refers to a directory.
- */
-
-#include <sys/uio.h>
-#include <fcntl.h>
-#include "tst_test.h"
-
-#define K_1     1024
-#define MODES   S_IRWXU
-
-static char buf1[K_1];
-
-static struct iovec rd_iovec[1] = {
-        {buf1, K_1}
-};
-
-const char *TEST_DIR = "alpha";
-static int fd;
-
-static void verify_readv(void)
-{
-        TST_EXP_FAIL2(readv(fd, rd_iovec, 1), EISDIR,
-                     "readv() got EISDIR");
-}
-
-void setup(void)
-{
-        SAFE_MKDIR(TEST_DIR, MODES);
-        fd = SAFE_OPEN(TEST_DIR, O_RDONLY);
-}
-
-static void cleanup(void)
-{
-        if (fd > 0)
-                SAFE_CLOSE(fd);
-}
-
-static struct tst_test test = {
-        .needs_tmpdir = 1,
-        .setup = setup,
-        .cleanup = cleanup,
-        .test_all = verify_readv,
-};
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
