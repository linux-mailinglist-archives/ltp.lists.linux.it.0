Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7C450590
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 14:34:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7614A3C85FB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 14:34:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9ADE23C8113
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 14:34:17 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3A0FA6005C1
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 14:34:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36EB2217BA;
 Mon, 15 Nov 2021 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636983255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GEg8FYqpZsVg9w15Kz2P6kIk1B9y4ITtWgfEm8Tz9Uo=;
 b=i0PR5OrfOuOcCLjAL6Pkd+V7KNyj38o3mO1ay4gUOy8jUf/o7QUcijcudvMHMseHUdUOuD
 mRY6kCC+VFMm6CP44/TfMvgYGiRv4SavIe1gPBDYgXoOTFAiJU+uz/mKpfl7rGRhA1JSlT
 ICAZHyUbwcZJ0NeDIb+gK4NgZL3mAMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636983255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GEg8FYqpZsVg9w15Kz2P6kIk1B9y4ITtWgfEm8Tz9Uo=;
 b=ULAucoUzsMJaydTM3QZyek6XnrrQ64DwU2e90owtwSTub3pKsEgKIniQ2vnlf+CZGTZF0e
 cMdYi56VotUZhNAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A90413DAB;
 Mon, 15 Nov 2021 13:34:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dD4JANdhkmFLCQAAMHmgww
 (envelope-from <acervesato@suse.de>); Mon, 15 Nov 2021 13:34:14 +0000
From: Andrea Cervesato <acervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 15 Nov 2021 14:34:12 +0100
Message-Id: <20211115133412.25194-1-acervesato@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] dio_truncate.c test refactory with LTP API
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

---
 testcases/kernel/io/ltp-aiodio/dio_truncate.c | 206 +++++++-----------
 1 file changed, 79 insertions(+), 127 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 27cf01525..9c8da539e 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -1,7 +1,7 @@
-
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2004 Daniel McNeil <daniel@osdl.org>
- *               2004 Open Source Development Lab
+ * Copyright (c) 2021 Andrea Cervesato <andrea.cervesato@suse.com>
+ *			   2021 SUSE Enterprise Linux
  *   This program is free software;  you can redistribute it and/or modify
  *   it under the terms of the GNU General Public License as published by
  *   the Free Software Foundation; either version 2 of the License, or
@@ -19,159 +19,111 @@
  * Module: .c
  */
 
-/*
- * Change History:
- *
- * 2/2004  Marty Ridgeway (mridge@us.ibm.com) Changes to adapt to LTP
- *
- */
 #define _GNU_SOURCE
 
 #include <stdlib.h>
+#include <stdio.h>
+#include <sys/stat.h>
 #include <sys/types.h>
-#include <signal.h>
-#include <errno.h>
 #include <fcntl.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <memory.h>
-#include <string.h>
-#include <limits.h>
-
-#include "test.h"
+#include "tst_test.h"
 
-#define NUM_CHILDREN 8
+static char *FILENAME = "file.bin";
+static long FILESIZE = 64 * 1024;
+static int STARTING_CHARS = 10;
 
-char *check_zero(unsigned char *buf, int size)
-{
-	unsigned char *p;
-
-	p = buf;
-
-	while (size > 0) {
-		if (*buf != 0) {
-			fprintf(stderr,
-				"non zero buffer at buf[%d] => 0x%02x,%02x,%02x,%02x\n",
-				buf - p, (unsigned int)buf[0],
-				size > 1 ? (unsigned int)buf[1] : 0,
-				size > 2 ? (unsigned int)buf[2] : 0,
-				size > 3 ? (unsigned int)buf[3] : 0);
-			fprintf(stderr, "buf %p, p %p\n", buf, p);
-			return buf;
-		}
-		buf++;
-		size--;
-	}
-	return 0;		/* all zeros */
-}
-
-int dio_read(char *filename)
+int dio_append(const char *path, char pattern, size_t bs, size_t bcount)
 {
 	int fd;
-	int r;
-	void *bufptr = NULL;
 
-	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
-	if (TEST_RETURN) {
-		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
+	fd = SAFE_OPEN(path, O_CREAT|O_WRONLY|O_DIRECT, 0666);
+
+	if (tst_fill_fd(fd, pattern, bs, bcount)) {
+		SAFE_CLOSE(fd);
 		return -1;
 	}
 
-	while ((fd = open(filename, O_DIRECT | O_RDONLY)) < 0) {
-	}
-	fprintf(stderr, "dio_truncate: child reading file\n");
-	while (1) {
-		off_t offset;
-		char *bufoff;
-
-		/* read the file, checking for zeros */
-		offset = lseek(fd, SEEK_SET, 0);
-		do {
-			r = read(fd, bufptr, 64 * 1024);
-			if (r > 0) {
-				if ((bufoff = check_zero(bufptr, r))) {
-					fprintf(stderr,
-						"non-zero read at offset %p\n",
-						offset + bufoff);
-					exit(1);
-				}
-				offset += r;
-			}
-		} while (r > 0);
-	}
+	SAFE_CLOSE(fd);
+
 	return 0;
 }
 
-void dio_append(char *filename, int fill)
+int dio_get_zeros(const char *path, size_t bs)
 {
-	int fd;
+	int i = 0;
+	int fd = 0;
+	int zeros = 0;
 	void *bufptr = NULL;
-	int i;
-	int w;
 
-	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
+	fd = SAFE_OPEN(path, O_RDONLY|O_DIRECT, 0666);
 
-	if (fd < 0) {
-		perror("cannot create file");
-		return;
-	}
+	bufptr = SAFE_MALLOC(bs * sizeof(void));
+	SAFE_READ(0, fd, bufptr, bs);
 
-	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
-	if (TEST_RETURN) {
-		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
-		close(fd);
-		return;
+	for (i = 0; i < (int)bs; i++) {
+		if (*(char *)bufptr == 0)
+			zeros++;
+		bufptr++;
 	}
 
-	memset(bufptr, fill, 64 * 1024);
+	SAFE_CLOSE(fd);
 
-	for (i = 0; i < 1000; i++) {
-		if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
-			fprintf(stderr, "write %d returned %d\n", i, w);
-		}
-	}
-	close(fd);
+	return zeros;
 }
 
-int main(void)
+off_t getsize(const char *filename)
 {
-	char filename[PATH_MAX];
-	int pid[NUM_CHILDREN];
-	int num_children = 1;
-	int i;
-
-	snprintf(filename, sizeof(filename), "%s/aiodio/file",
-		 getenv("TMP") ? getenv("TMP") : "/tmp");
-
-	for (i = 0; i < num_children; i++) {
-		if ((pid[i] = fork()) == 0) {
-			/* child */
-			return dio_read(filename);
-		} else if (pid[i] < 0) {
-			/* error */
-			perror("fork error");
-			break;
-		} else {
-			/* Parent */
-			continue;
-		}
-	}
+	struct stat st;
 
-	/*
-	 * Parent creates a zero file using DIO.
-	 * Truncates it to zero
-	 * Create another file with '0xaa'
-	 */
-	for (i = 0; i < 100; i++) {
-		dio_append(filename, 0);
-		truncate(filename, 0);
-		dio_append("junkfile", 0xaa);
-		truncate("junkfile", 0);
-	}
+	if (SAFE_STAT(filename, &st) == 0)
+		return st.st_size;
+
+	return -1;
+}
+
+static void run(void)
+{
+	int charnum = 0;
+	long empty_ch = FILESIZE - STARTING_CHARS;
+
+	tst_res(TINFO, "Create %s filled with %d chars", FILENAME, STARTING_CHARS);
+	dio_append(FILENAME, 'a', STARTING_CHARS, 1);
 
-	for (i = 0; i < num_children; i++) {
-		kill(pid[i], SIGTERM);
+	/* Truncate to a bigger file and check if it's filled with empty chars */
+	tst_res(TINFO, "Truncate to %ld", FILESIZE);
+	TST_EXP_POSITIVE(truncate(FILENAME, FILESIZE), "truncate(%s, %lu)", FILENAME, FILESIZE);
+	if (!TST_PASS)
+		return;
+
+	TEST(getsize(FILENAME));
+
+	if (TST_RET == FILESIZE) {
+		tst_res(TPASS, "Truncated file has %ld length", TST_RET);
+
+		charnum = dio_get_zeros(FILENAME, FILESIZE);
+
+		if (charnum == empty_ch)
+			tst_res(TPASS, "Truncated file provides %ld empty chars at the end", empty_ch);
+		else
+			tst_res(TFAIL, "Truncated file isn't filled with %i chars", charnum);
+	} else {
+		tst_res(TFAIL, "Truncated file doesn't have %ld length but %ld", FILESIZE, TST_RET);
 	}
 
-	return 0;
+	/* Truncate to zero: file must be empty */
+	tst_res(TINFO, "Truncate to zero");
+	TST_EXP_POSITIVE(truncate(FILENAME, 0), "truncate(%s, 0)", FILENAME);
+	if (!TST_PASS)
+		return;
+
+	TEST(getsize(FILENAME));
+	if (TST_RET == 0)
+		tst_res(TPASS, "Truncated file has zero length");
+	else
+		tst_res(TFAIL, "Truncated file doesn't have zero length");
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = run,
+};
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
