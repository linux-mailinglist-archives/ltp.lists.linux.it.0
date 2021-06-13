Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C383A59DE
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:30:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D4B73C4F76
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:30:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 321E03C2F2C
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:30:51 +0200 (CEST)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 43C73100043B
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:30:51 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 w14-20020a17090aea0eb029016e9e0e7983so2167407pjy.4
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4QuIFQHh6MMR7u4qE5Po8E+h3djc7d9sidP7gWLn6vg=;
 b=oAAjmJ/bbojJ2i4pq6iF3pJdcETO3R9YCIZHJK5N/JDt8iabt/JuBDp4N+GhS/mzZl
 WV5JLO0uR8R2QXh9sH3EqjzpBNrBOtXXP3jmx/kUiETsjVOJ8acg6Zb1UrmsI5czgPfy
 Bjsr5I4kf9bozgxV/bh8GDAT+6tQ3yNh+6Y2hpO2ZQcbhvKI1+4q5E6IVL1RcP9nySbD
 srVt4/1EYkr0ltdnCsW8HLiHjzTn01qbsplGapoBk+Ht4maumz+/J6EG2gxatiuyUcKT
 J41aOfTfI9SbnEHPYFeism0HhL3B5EZy0XPcG+/bK2rbW9GUilqFTQW2YUeJO191LfAM
 VvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4QuIFQHh6MMR7u4qE5Po8E+h3djc7d9sidP7gWLn6vg=;
 b=S4t6dmoAW9e7XK7R5rcwutK81c203n7EeNdvoN6xV6rMTAYSv0/Cbff5tRVGiHtBGK
 zCd9vwIkryJR2aBBOEFoPt7Ew/MPQfdyHwz+Ehuez3PkGGqGKfHI5bUfxgxvVYSLHhqH
 rIlFNWlr1zBIc5YVIRCrD9nBnxWJQST6K5QDtEke0L9nemboCxTAKf5Wtn7QbFntEGGH
 mkh17WaVgG212cYVFI9E3AM2PVbJBV07G7mCXEWs9Vqcgx3/Npvp89A5s7NVN4oQPTup
 udO33wDFuUk91OrvT8x+Olsm7uGuPkmAd/HrzY+kBWxCLAS/n8wKvyrTToHQZgOTbifN
 r2Sg==
X-Gm-Message-State: AOAM531062FlVEVTPJR7QohrsR9daKtrxzC6E3JRWfW3N1jEDwrTwDev
 Todw4z8o6YhCjWhUZ5IwYuGwSzQwiQtygA==
X-Google-Smtp-Source: ABdhPJz/5SB8BkINH3UrqdKEOkXjGyH5AR681MN2lmTyUIAJQ/4fcdRxLvFAC3RB0v7+TQXxJ0RtIg==
X-Received: by 2002:a17:90a:fa04:: with SMTP id
 cm4mr8753028pjb.111.1623605449657; 
 Sun, 13 Jun 2021 10:30:49 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id x2sm10197718pfp.155.2021.06.13.10.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 10:30:49 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 23:00:43 +0530
Message-Id: <20210613173043.8797-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNrt8TxrxhNjFPN@yuki>
References: <YMNrt8TxrxhNjFPN@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] setitimer02: Convert setitimer02 to new API
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/setitimer/setitimer02.c   | 167 +++---------------
 1 file changed, 24 insertions(+), 143 deletions(-)

diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 4d13cd1e0..59da87e8d 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -1,161 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 03/2001 - Written by Wayne Boyer
  *
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
  */
 
-/*
- * NAME
- *	setitimer02.c
- *
- * DESCRIPTION
- *	setitimer02 - check that a setitimer() call fails as expected
- *		      with incorrect values.
+/*\
+ * [Description]
  *
- * ALGORITHM
- *	loop if that option was specified
- *	allocate needed space and set up needed values
- *	issue the system call
- *	check the errno value
- *	  issue a PASS message if we get EFAULT
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	  break any remaining tests
- *	  call cleanup
- *
- * USAGE:  <for command-line>
- *  setitimer02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	none
+ * setitimer02 - check that a setitimer() call fails as expected
+ *	 with incorrect values.
  */
 
-#include "test.h"
-
 #include <errno.h>
 #include <sys/time.h>
+#include <stdlib.h>
+#include "tst_test.h"
 
-void cleanup(void);
-void setup(void);
-
-char *TCID = "setitimer02";
-int TST_TOTAL = 1;
+struct itimerval *value;
 
-#if !defined(UCLINUX)
-
-int main(int ac, char **av)
+static void verify_setitimer(void)
 {
-	int lc;
-	struct itimerval *value;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		/* allocate some space for a timer structure */
-		if ((value = malloc((size_t)sizeof(struct itimerval))) ==
-		    NULL) {
-			tst_brkm(TBROK, cleanup, "value malloc failed");
-		}
-
-		/* set up some reasonable values */
-
-		value->it_value.tv_sec = 30;
-		value->it_value.tv_usec = 0;
-		value->it_interval.tv_sec = 0;
-		value->it_interval.tv_usec = 0;
-		/*
-		 * issue the system call with the TEST() macro
-		 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
-		 */
-
-		/* call with a bad address */
-		TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EFAULT:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		}
-
-		/*
-		 * clean up things in case we are looping
-		 */
-		free(value);
-		value = NULL;
-	}
-
-	cleanup();
-	tst_exit();
-
-}
-
-#else
-
-int main(void)
-{
-	tst_resm(TINFO, "test is not available on uClinux");
-	tst_exit();
+  /* call with a bad address */
+	TST_EXP_FAIL(setitimer(ITIMER_REAL, value, (struct itimerval *)-1),
+		EFAULT, "expected failure - errno = %d - %s", TST_ERR, strerror(TST_ERR));
 }
 
-#endif /* if !defined(UCLINUX) */
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
+	value = tst_alloc((size_t)sizeof(struct itimerval));
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	value->it_value.tv_sec = 30;
+	value->it_value.tv_usec = 0;
+	value->it_interval.tv_sec = 0;
+	value->it_interval.tv_usec = 0;
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test_all = verify_setitimer,
+	.setup = setup,
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
