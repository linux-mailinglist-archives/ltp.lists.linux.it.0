Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FA3F170E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 12:07:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77AEE3C596E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 12:07:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D9C973C4BEE
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 12:07:08 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EC70C1400DB9
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 12:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1629367626; i=@fujitsu.com;
 bh=+mAhbKUFLiAZcsZUct9AeeHib90CPjx3ejv+t4H/Y54=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=eDtFut3OXYOKdN7vIrdhHKPpef55rTQbDf6M0Xeoio5uJs50U+meOj68Ygll6satq
 4VDupIgpoQiEjmyd2tiiM96QfYkoVoOL/JG3XG4tz/IzixJ7HwADxmsKUdiIsZowud
 TmKs+MvgmucN9eEmNV5YZtxRaSuuNOuCqgapOfrBYFkf4ycOwmuMl7A6E4VAqEd53K
 AYTOvWaf7e1y+Z6JKTQWppQofsDFiUKCLFJAs6vQZwcJ7l/wSQ+uEAiOCxcUae70gT
 PXq1cqKgTBAGRnk6195bKJUciNlKG8lwB56URlJ6geDB9R5NjLG1mYW+Y1PB4S8N24
 eHV+Eh9pMhABg==
Received: from [100.113.7.180] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 31/72-20707-A4D2E116;
 Thu, 19 Aug 2021 10:07:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRquupK5d
 osPgWv8WK7zsYHRg99v1exxrAGMWamZeUX5HAmnHw1gGmgsaYinmn9zM1MF726GLk4hASaGGS
 eL9xByuEs59RYt+yxcxdjJwcbAIaEtcet4PZIgISEh0Nb9lBbGYBNYndV4+xgdjCAqYSd69cZ
 gWxWQRUJW4d3wRWwyvgJvHt4yuwGgkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8wQNYoS+/duZI
 SwKyRmzNjGNoGRdxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNY107Uw10us0k3SSy3
 VTU7NKylKBErqJZYX6xVX5ibnpOjlpZZsYgQGWEohW/gOxjOvP+gdYpTkYFIS5c38KJsoxJeU
 n1KZkVicEV9UmpNafIhRhoNDSYK3R0MuUUiwKDU9tSItMwcY7DBpCQ4eJRFeD22gNG9xQWJuc
 WY6ROoUo6KUOG8WSEIAJJFRmgfXBouwS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVtApv
 Bk5pXATX8FtJgJaLGQqizI4pJEhJRUA9Mi3aCUiJAZTmKM86a0Gx7xv7Dreqx0+U1ZsX3nj1+
 Xm2l+Wp13gVvg6csPtDdf0Uvb/SaaheF+d7C/1ClVrc+Jx6/dlEr5JRDdf8mTk5f3Q5vvT5t9
 q4QnH7RJlxd0mPd48+JNwamOXGFnDHkrjU92bt2n9bfqwWu29G/7bJNFQhbWabGdWSIXeUrqN
 5fe0SkXImes/p7t73I80TTArW8H84SivFyBXcsSd3OxVHM2GNeWr7nAJvM05cGsM+ohZUu0K2
 PsZp8IXuKntX/ltr6rXQu8TKbfc+R6UORrrnfI/55qZOYDvjML2hMLszSNxNk/fvpxPS5A7v7
 NFoZ/ZxtXObKo6q/sO7dN5avCSSWW4oxEQy3mouJEALeQrlQrAwAA
X-Env-Sender: daisl.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-245.messagelabs.com!1629367624!531150!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15791 invoked from network); 19 Aug 2021 10:07:05 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-23.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Aug 2021 10:07:05 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17JA6w55025314
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 11:07:04 +0100
Received: from rhel79.g08.fujitsu.local (10.167.225.51) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 19 Aug 2021 11:06:56 +0100
From: Dai Shili <daisl.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 18 Aug 2021 09:50:57 -0400
Message-ID: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
Subject: [LTP] [PATCH] syscalls/pread01: Convert to new API
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

Signed-off-by: Dai Shili <daisl.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/pwrite/pwrite01.c | 336 +++++-----------------------
 1 file changed, 57 insertions(+), 279 deletions(-)

diff --git a/testcases/kernel/syscalls/pwrite/pwrite01.c b/testcases/kernel/syscalls/pwrite/pwrite01.c
index 937160a..83b0bdf 100644
--- a/testcases/kernel/syscalls/pwrite/pwrite01.c
+++ b/testcases/kernel/syscalls/pwrite/pwrite01.c
@@ -1,86 +1,23 @@
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
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
  */
 
-/*
- * Test Name: pwrite01
+/*\
+ * [Description]
  *
- * Test Description:
  *  Verify the functionality of pwrite() by writing known data using pwrite()
  *  to the file at various specified offsets and later read from the file from
  *  various specified offsets, comparing the data written aganist the data
  *  read using read().
- *
- * Expected Result:
- *  pwrite() should succeed to write the expected no. of bytes of data and
- *  the data written at specified offsets should match aganist the data read
- *  from that offset.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *   	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *   	Verify the Functionality of system call
- *      if successful,
- *      	Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *   Delete the temporary directory created.
- *
- * Usage:  <for command-line>
- *  pwrite01 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  None.
  */
 
-#define _XOPEN_SOURCE 500
-
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
 #include <stdlib.h>
-#include <string.h>
 #include <inttypes.h>
+#include "tst_test.h"
+#include "tst_safe_prw.h"
 
-#include "test.h"
-#include "safe_macros.h"
-
-#define _XOPEN_SOURCE 500
 #define TEMPFILE	"pwrite_file"
 #define K1              1024
 #define K2              (K1 * 2)
@@ -88,249 +25,90 @@
 #define K4              (K1 * 4)
 #define NBUFS           4
 
-char *TCID = "pwrite01";
-int TST_TOTAL = 1;
-int fildes;			/* file descriptor for tempfile */
-char *write_buf[NBUFS];		/* buffer to hold data to be written */
+static int fildes;
+char *write_buf[NBUFS];
+char *read_buf[NBUFS];
 
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
-void l_seek(int, off_t, int, off_t);	/* function to call lseek() */
-void init_buffers();		/* function to initialize/allocate buffers */
-void check_file_contents();	/* function to verify the contents of file */
-
-int main(int ac, char **av)
+static void l_seek(int fdesc, off_t offset, int whence, off_t checkoff)
 {
-	int lc;
-	int nwrite;		/* no. of bytes written by pwrite() */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call pwrite() to write K1 bytes of data (0's) at offset 0
-		 * of temporary file
-		 */
-		nwrite = pwrite(fildes, write_buf[0], K1, 0);
+	off_t offloc;
 
-		/* Check for the return value of pwrite() */
-		if (nwrite != K1) {
-			tst_resm(TFAIL, "pwrite() at offset 0 failed, errno=%d "
-				 ": %s", errno, strerror(errno));
-			continue;
-		}
-
-		/* We should still be at offset 0. */
-		l_seek(fildes, 0, SEEK_CUR, 0);
-
-		/*
-		 * Now, lseek() to a non K boundary,
-		 * just to be different.
-		 */
-		l_seek(fildes, K1 / 2, SEEK_SET, K1 / 2);
-
-		/*
-		 * Again, pwrite() K1 of data (2's) at offset K2 of
-		 * temporary file.
-		 */
-		nwrite = pwrite(fildes, write_buf[2], K1, K2);
-		if (nwrite != K1) {
-			tst_resm(TFAIL, "pwrite() failed to "
-				 "write at %d off. on %s, errno=%d : %s",
-				 K2, TEMPFILE, errno, strerror(errno));
-			continue;
-		}
-
-		/* We should still be at our non K boundary. */
-		l_seek(fildes, 0, SEEK_CUR, K1 / 2);
+	offloc = SAFE_LSEEK(fdesc, offset, whence);
+	if (offloc != checkoff) {
+		tst_res(TFAIL, "return = %" PRId64 ", expected %" PRId64,
+			(int64_t) offloc, (int64_t) checkoff);
+	}
+}
 
-		/* lseek() to an offset of K3. */
-		l_seek(fildes, K3, SEEK_SET, K3);
+static void check_file_contents(void)
+{
+	int count, err_flg = 0;
 
-		/*
-		 * Using write(), write of K1 of data (3's) which
-		 * should take place at an offset of K3,
-		 * moving the file pointer to K4.
-		 */
-		nwrite = write(fildes, write_buf[3], K1);
-		if (nwrite != K1) {
-			tst_resm(TFAIL, "write() failed: nwrite=%d, errno=%d : "
-				 "%s", nwrite, errno, strerror(errno));
-			continue;
-		}
+	for (count = 0; count < NBUFS; count++) {
+		l_seek(fildes, count * K1, SEEK_SET, count * K1);
 
-		/* We should be at offset K4. */
-		l_seek(fildes, 0, SEEK_CUR, K4);
+		SAFE_READ(1, fildes, read_buf[count], K1);
 
-		/* Again, pwrite() K1 of data (1's) at offset K1. */
-		nwrite = pwrite(fildes, write_buf[1], K1, K1);
-		if (nwrite != K1) {
-			tst_resm(TFAIL, "pwrite() failed to write at "
-				 "%d off. on %s, errno=%d : %s",
-				 K1, TEMPFILE, errno, strerror(errno));
-			continue;
+		if (memcmp(write_buf[count], read_buf[count], K1) != 0) {
+			tst_res(TFAIL, "read/write buffer[%d] data mismatch", count);
+			err_flg++;
 		}
-
-		/*
-		 * Check the contents of temporary file
-		 * to which data written using pwrite().
-		 * Compare the data read with the original
-		 * write_buf[] contents.
-		 */
-		check_file_contents();
-
-		/* reset to offset 0 in case we are looping */
-		l_seek(fildes, 0, SEEK_SET, 0);
-
 	}
 
-	cleanup();
-	tst_exit();
+	if (!err_flg)
+		tst_res(TPASS, "Functionality of pwrite() successful");
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- *
- *  Initialize/allocate read/write buffers.
- *  Create a temporary directory and a file under it and
- */
-void setup(void)
+static void verify_pwrite(void)
 {
+	SAFE_PWRITE(1, fildes, write_buf[0], K1, 0);
+	l_seek(fildes, 0, SEEK_CUR, 0);
+	l_seek(fildes, K1 / 2, SEEK_SET, K1 / 2);
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	SAFE_PWRITE(1, fildes, write_buf[2], K1, K2);
+	l_seek(fildes, 0, SEEK_CUR, K1 / 2);
+	l_seek(fildes, K3, SEEK_SET, K3);
 
-	TEST_PAUSE;
+	SAFE_WRITE(1, fildes, write_buf[3], K1);
+	l_seek(fildes, 0, SEEK_CUR, K4);
 
-	/* Allocate/Initialize the write buffer with known data */
-	init_buffers();
+	SAFE_PWRITE(1, fildes, write_buf[1], K1, K1);
 
-	tst_tmpdir();
+	check_file_contents();
 
-	/* Creat a temporary file used for mapping */
-	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0) {
-		tst_brkm(TBROK, cleanup, "open() on %s Failed, errno=%d : %s",
-			 TEMPFILE, errno, strerror(errno));
-	}
+	l_seek(fildes, 0, SEEK_SET, 0);
 }
 
-/*
- * init_buffers() - allocate/Initialize write_buf array.
- *
- *  Allocate write buffer.
- *  Fill the write buffer with the following data like,
- *    write_buf[0] has 0's, write_buf[1] has 1's, write_buf[2] has 2's
- *    write_buf[3] has 3's.
- */
-void init_buffers(void)
+static void setup(void)
 {
-	int count;		/* counter variable for loop */
+	int count;
 
-	/* Allocate and Initialize write buffer with known data */
 	for (count = 0; count < NBUFS; count++) {
-		write_buf[count] = malloc(K1);
-
-		if (write_buf[count] == NULL) {
-			tst_brkm(TBROK, NULL, "malloc() failed ");
-		}
+		write_buf[count] = SAFE_MALLOC(K1);
+		read_buf[count] = SAFE_MALLOC(K1);
 		memset(write_buf[count], count, K1);
 	}
-}
 
-/*
- * l_seek() - local front end to lseek().
- *
- *  "checkoff" is the offset at which we believe we should be at.
- *  Used to validate pread/pwrite don't move the offset.
- */
-void l_seek(int fdesc, off_t offset, int whence, off_t checkoff)
-{
-	off_t offloc;		/* offset ret. from lseek() */
-
-	if ((offloc = lseek(fdesc, offset, whence)) != checkoff) {
-		tst_resm(TWARN, "lseek returned %" PRId64 ", expected %" PRId64,
-			 (int64_t) offloc, (int64_t) checkoff);
-		tst_brkm(TBROK | TERRNO, cleanup, "lseek() on %s Failed",
-			 TEMPFILE);
-	}
+	fildes = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT, 0666);
 }
 
-/*
- * check_file_contents() - Check the contents of the file we wrote with
- *			   pwrite()'s.
- *  The contents of the file are verified by using a plain read() and
- *  Compare the data read with the original write_buf[] contents.
- */
-void check_file_contents(void)
-{
-	int count, err_flg = 0;	/* index variable and error flag */
-	int nread;		/* return value of read() */
-	off_t offloc;		/* offset. ret. by lseek() */
-	char *read_buf;		/* buffer to hold read data */
-
-	/* Allocate space for read buffer */
-	read_buf = malloc(K1);
-	if (read_buf == NULL) {
-		tst_brkm(TBROK, cleanup, "malloc() failed on read buffer");
-	}
-
-	/* Seek to app. location of file and read the data, compare it */
-	for (count = 0; count < NBUFS; count++) {
-		/* Seek to specified offset position from beginning */
-		offloc = lseek(fildes, count * K1, SEEK_SET);
-		if (offloc != (count * K1)) {
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "lseek() failed: offloc=%" PRId64,
-				 (int64_t) offloc);
-		}
-
-		/* Read the data from file into a buffer */
-		nread = read(fildes, read_buf, K1);
-		if (nread != K1) {
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "read() failed: nread=%d", nread);
-		}
-
-		/* Compare the read data with the data written using pwrite */
-		if (memcmp(write_buf[count], read_buf, K1) != 0) {
-			tst_resm(TFAIL, "read/write buffer data mismatch");
-			err_flg++;
-		}
-	}
-
-	/* If no erros, Test successful */
-	if (!err_flg) {
-		tst_resm(TPASS, "Functionality of pwrite() successful");
-	}
-
-	/* Release the memory allocated before return */
-	free(read_buf);
-}
-
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- *
- * Deallocate the memory allocated to write buffer.
- * Close the temporary file.
- * Remove the temporary directory created.
- */
-void cleanup(void)
+static void cleanup(void)
 {
 	int count;
 
-	/* Free the memory allocated for the write buffer */
 	for (count = 0; count < NBUFS; count++) {
 		free(write_buf[count]);
+		free(read_buf[count]);
 	}
 
-	/* Close the temporary file */
-	SAFE_CLOSE(NULL, fildes);
-
-	tst_rmdir();
+	if (fildes > 0)
+		SAFE_CLOSE(fildes);
 
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_pwrite,
+};
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
