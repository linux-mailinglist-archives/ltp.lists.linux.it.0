Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5A41064B
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:11:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CFFF3C8972
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:11:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75C8C3C8972
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:41 +0200 (CEST)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9D7EC10000EA
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:40 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id m26so11784260pff.3
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 05:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rq2AWAUY6w04AFc57uJgaEno/xtKfr1k2NciRcXYkrc=;
 b=SVqoTE4MirLn3/8RhuP+ljgjsKtnMg5bk6AzVKpmzjvVpnUJZsmvsvUbfUVoDTP+2M
 WGN7WRitDgBSpIOVBgR1dph31kYHNG373TaOotCoJ/Lg5LXtH9HaqCv5vAFfO8RMqvxi
 LKk/LOgKNCVnbA03w9m2NidcSHm7LzROWSyC6dKwmlOxxWocytlykQ+NkkBliGv9UADC
 nwal4csuMLM/E5LYz+8NHm26n2hp6+4yD3DwRmN5tTLZIfC5XZ0Y/8Liu+dmXMzZiHWk
 bB8kznItZcwyWt/rxGHaiGqUcJz7iH1eZxoNtUq7eRKrDgMf3pj5bb9GQyOnGxSP2txo
 dOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rq2AWAUY6w04AFc57uJgaEno/xtKfr1k2NciRcXYkrc=;
 b=B4iR/Gv5O2xi91TQF4qEAFdrM6j54uNNhg2d9pEUMHlDI/aX++D/IJVHIgIEemRS2R
 +fU67D0JGS0pAyUJT9of4C6uagIRx+Ri6opWklxuuTSJl6p3YJhZ/3b63jNp0FHk/aXS
 pelsiQ17m1VJ3pMjjdaD95xG3YsbE87M4caE3pEpm/6A0U620QfB3sdR9O1pGEx4WYRB
 NXjxPLC+7eZP1FZGWyrR+KPd/PwazqenW2EP+Kbf+MFAx7uoYRrcPR+iIrwQ57NtWYGi
 2Qzd82IwyHn1k0rXTYMTAumxx/EJMy0LbBKZAaYatl9bxiQ4iim00i37TSSZInZpoAp9
 Y81w==
X-Gm-Message-State: AOAM5328fBhwuWvHity7K6kIK+wOtV+E3QIg2xbYZ5BFlT1Bd5Hymcg4
 UTdKnL+2SxAPNEZRXawHdSTUul7wT/bjX8or
X-Google-Smtp-Source: ABdhPJy7j1eh9KMLcR7bT8V4sklVBCsiWHwR/oQXiL4pBY052okq8b13ptOfZZkUqhz+0B1s7jwLZw==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr15430570pfl.40.1631967099111; 
 Sat, 18 Sep 2021 05:11:39 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id g13sm9255556pfi.176.2021.09.18.05.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 05:11:38 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 18 Sep 2021 21:11:10 +0900
Message-Id: <20210918121114.10694-2-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918121114.10694-1-qi.fuli@fujitsu.com>
References: <20210918121114.10694-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/5] syscalls/dup2/dup201: Convert to new API
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
 testcases/kernel/syscalls/dup2/dup201.c | 174 +++++-------------------
 1 file changed, 33 insertions(+), 141 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
index 4fa34466a..cc1563115 100644
--- a/testcases/kernel/syscalls/dup2/dup201.c
+++ b/testcases/kernel/syscalls/dup2/dup201.c
@@ -1,163 +1,55 @@
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
+ * 01/2002 Removed EMFILE test - Paul Larson
  */
-
-/*
- * NAME
- *	dup201.c
- *
- * DESCRIPTION
- *	Negative tests for dup2() with bad fd (EBADF)
- *
- * ALGORITHM
- * 	Setup:
- *	a.	Setup signal handling.
- *	b.	Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	a.	Loop if the proper options are given.
- *	b.	Loop through the test cases
- * 	c.	Execute dup2() system call
- *	d.	Check return code, if system call failed (return=-1), test
- *		for EBADF.
- *
- * 	Cleanup:
- * 	a.	Print errno log and/or timing stats if options given
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  dup201 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Negative tests for dup2() with bad fd (EBADF)
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	01/2002 Removed EMFILE test - Paul Larson
+ * - First fd argument is less than 0
+ * - First fd argument is getdtablesize()
+ * - Second fd argument is less than 0
+ * - Second fd argument is getdtablesize()
  *
- * RESTRICTIONS
- * 	NONE
  */
 
-#include <sys/types.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <sys/time.h>
-#include <sys/resource.h>
 #include <unistd.h>
-#include <signal.h>
-#include "test.h"
+#include "tst_test.h"
 
-void setup(void);
-void cleanup(void);
+static int maxfd, mystdout;
+static int goodfd = 5;
+static int badfd = -1;
 
-char *TCID = "dup201";
-int TST_TOTAL = 4;
-
-int maxfd;
-int goodfd = 5;
-int badfd = -1;
-int mystdout = 0;
-
-struct test_case_t {
+static struct tcase {
 	int *ofd;
 	int *nfd;
-	int error;
-	void (*setupfunc) ();
-} TC[] = {
-	/* First fd argument is less than 0 - EBADF */
-	{&badfd, &goodfd, EBADF, NULL},
-	    /* First fd argument is getdtablesize() - EBADF */
-	{&maxfd, &goodfd, EBADF, NULL},
-	    /* Second fd argument is less than 0 - EBADF */
-	{&mystdout, &badfd, EBADF, NULL},
-	    /* Second fd argument is getdtablesize() - EBADF */
-	{&mystdout, &maxfd, EBADF, NULL},
+} tcases[] = {
+	{&badfd, &goodfd},
+	{&maxfd, &goodfd},
+	{&mystdout, &badfd},
+	{&mystdout, &maxfd},
 };
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-	int i;
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
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			/* call the test case setup routine if necessary */
-			if (TC[i].setupfunc != NULL)
-				(*TC[i].setupfunc) ();
-
-			TEST(dup2(*TC[i].ofd, *TC[i].nfd));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS,
-					 "failed as expected - errno = %d : %s",
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "failed unexpectedly; "
-					 "expected %d: %s", TC[i].error,
-					 strerror(TC[i].error));
-			}
-		}
-	}
-	cleanup();
-
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
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	/* get some test specific values */
 	maxfd = getdtablesize();
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void run(unsigned int i)
 {
-	tst_rmdir();
+	struct tcase *tc = tcases + i;
+
+	TST_EXP_FAIL2(dup2(*tc->ofd, *tc->nfd), EBADF,
+			"dup2(%d, %d)", *tc->ofd, *tc->nfd);
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
