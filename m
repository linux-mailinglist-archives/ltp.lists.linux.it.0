Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1D3FED54
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1407C3C9977
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FEBB3C9922
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:12 +0200 (CEST)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD0A11A00ECD
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:11 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id g184so1663958pgc.6
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 04:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0Lk8MBppDCeCHtarFqtH3+OA+XA5oLnNGQrCotOH/I=;
 b=BDmfx1iMsXXRvFM6eYPerwMv6pdWYE9ZV8CAQfSmADzsc73EhEc+4MT8G1qs4uzSBV
 Lm46nKDjlHUz5ip3dWewZfZ+RwAKcmYxVzsBsq+H4ij6ECx5bwpfD9ph1GLqvno3b42R
 8WZbMPCKPi5Dht/GFHxOpWCSj/ypoHcV0BpSA/WgI5qwqs8UXwSQ87QxRC0rIkaeB4Dz
 eQ4VwPTfA2a10lgVgOK2QtvGmckUWPe8dfLl1jNj5tBLPvjWKAfTDvVtg/WtcdUGJQK/
 +vv0Lp/uS5J+aQQ9xCu4OZ7s2+2sxveFYbOZq8MvV6n9cdzAJ56+zlRZ61RQJIoaVoPk
 utNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0Lk8MBppDCeCHtarFqtH3+OA+XA5oLnNGQrCotOH/I=;
 b=Pw+/YlJMn61DZI5Ftx1Imjq8LDmkKr6MI/hNriboWSJNa3mRmbyPXpBkVettEQOlq/
 J4el0L+6cLcr9ys3LlF8A3GbnjsPVgYrZ7nxdigvGLxlulMXyP3x13caDuu9pbUYHIZO
 7HzWVr9Z0y1tWgTyMJHGntDLrBaq1mnsKqfEa4sQG7O7YyQrCVChHmeH8q+0lkg2I5uz
 Mz4AoJNgVhCCB/vL5uy1mV5Z+vI69olwv990mVGCwpZFZavjh2wjMTPMqu7ZQCuOCUxO
 BIt9Lp5NWmgmmpZAqk+bB/yZqFWMqoohXqTiekcyXBeoMJDD2tVPKC0jbTP0NmBLxLnD
 g4Tw==
X-Gm-Message-State: AOAM530hgT2+rLbU2CLWVsysfCOjdrqdj3TUFt0Dg6WYaL/0X6c0nI6V
 tXrvW76VzD8eeeik55yObRUVPXeEFZlqVYJ9
X-Google-Smtp-Source: ABdhPJzAa4xnGihJwVA5fSJCbCJyiR2nDaD50C+8oyTElUrhkSSVCjzcypZxrbB0uMLPlc5aDiSb6w==
X-Received: by 2002:a63:5f08:: with SMTP id t8mr2859949pgb.353.1630583950219; 
 Thu, 02 Sep 2021 04:59:10 -0700 (PDT)
Received: from localhost.localdomain (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id d22sm2137490pjw.38.2021.09.02.04.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 04:59:09 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 20:58:46 +0900
Message-Id: <20210902115849.72382-3-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902115849.72382-1-qi.fuli@fujitsu.com>
References: <20210902115849.72382-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] syscalls/dup2/dup202: Convert dup202 to the new
 API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/dup2/dup202.c | 175 +++++++-----------------
 1 file changed, 48 insertions(+), 127 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup202.c b/testcases/kernel/syscalls/dup2/dup202.c
index c87769fa9..16f8b2add 100644
--- a/testcases/kernel/syscalls/dup2/dup202.c
+++ b/testcases/kernel/syscalls/dup2/dup202.c
@@ -1,65 +1,22 @@
-/*
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
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
 
 /*
- * NAME
- *	dup202.c
+ * Copyright (c) International Business Machines  Corp., 2001
  *
- * DESCRIPTION
+ * DESCRIPTION:
  *	Is the access mode the same for both file descriptors?
  *		0: read only ?	"0444"
  *		1: write only ? "0222"
  *		2: read/write ? "0666"
  *
- * ALGORITHM
- *	Creat a file with each access mode; dup each file descriptor;
- *	stat each file descriptor and compare modes of each pair
- *
- * USAGE:  <for command-line>
- *  dup202 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
+ * HISTORY:
  *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	None
  */
 
-#include <sys/types.h>
-#include <sys/stat.h>
 #include <errno.h>
-#include <fcntl.h>
 #include <stdio.h>
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "dup202";
-int TST_TOTAL = 3;
-
-void setup(void);
-void cleanup(void);
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 
 char testfile[40];
 int fail;
@@ -68,100 +25,64 @@ int newfd;
 /* set these to a known index into our local file descriptor table */
 int duprdo = 10, dupwro = 20, duprdwr = 30;
 
-struct test_case_t {
+static struct tcase {
 	int *nfd;
 	mode_t mode;
-} TC[] = {
+} tcases[]= {
 	/* The first test creat(es) a file with mode 0444 */
-	{
-	&duprdo, (S_IRUSR | S_IRGRP | S_IROTH)},
+	{&duprdo, (S_IRUSR | S_IRGRP | S_IROTH)},
 	    /* The second test creat(es) a file with mode 0222 */
-	{
-	&dupwro, (S_IWUSR | S_IWGRP | S_IWOTH)},
+	{&dupwro, (S_IWUSR | S_IWGRP | S_IWOTH)},
 	    /* The third test creat(es) a file with mode 0666 */
-	{
-	&duprdwr,
-		    (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH)}
+	{&duprdwr, (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH)},
 };
 
-int main(int ac, char **av)
+void setup(void)
 {
-	int lc;
-	int i, ofd;
-	struct stat oldbuf, newbuf;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			if ((ofd = creat(testfile, TC[i].mode)) == -1)
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "creat failed");
-
-			TEST(dup2(ofd, *TC[i].nfd));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "call failed unexpectedly");
-				continue;
-			}
+	(void)umask(0);
+	sprintf(testfile, "dup202.%d", getpid());
+}
 
-			/* stat the original file */
-			SAFE_FSTAT(cleanup, ofd, &oldbuf);
+static void run(unsigned int i)
+{
+	int ofd;
+	struct stat oldbuf, newbuf;
+	struct tcase *tc = tcases + i;
 
-			/* stat the duped file */
-			SAFE_FSTAT(cleanup, *TC[i].nfd, &newbuf);
+	ofd = creat(testfile, tc->mode);
+	if (ofd == -1)
+		tst_brk(TBROK | TERRNO, "creat failed");
 
-			if (oldbuf.st_mode != newbuf.st_mode)
-				tst_resm(TFAIL, "original and dup "
-					 "modes do not match");
-			else
-				tst_resm(TPASS, "fstat shows new and "
-					 "old modes are the same");
+	TEST(dup2(ofd, *tc->nfd));
 
-			/* remove the file so that we can use it again */
-			if (close(*TC[i].nfd) == -1)
-				perror("close failed");
-			if (close(ofd) == -1)
-				perror("close failed");
-			if (unlink(testfile) == -1)
-				perror("unlink failed");
-		}
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "call failed unexpectedly");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	/* stat the original file */
+	SAFE_FSTAT(ofd, &oldbuf);
 
-	TEST_PAUSE;
+	/* stat the duped file */
+	SAFE_FSTAT(*tc->nfd, &newbuf);
 
-	tst_tmpdir();
+	if (oldbuf.st_mode != newbuf.st_mode)
+		tst_res(TFAIL, "original and dup modes do not match");
+	else
+		tst_res(TPASS, "fstat shows new and old modes are the same");
 
-	(void)umask(0);
-
-	sprintf(testfile, "dup202.%d", getpid());
+	/* remove the file so that we can use it again */
+	if (close(*tc->nfd) == -1)
+		perror("close failed");
+	if (close(ofd) == -1)
+		perror("close failed");
+	if (unlink(testfile) == -1)
+		perror("unlink failed");
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
