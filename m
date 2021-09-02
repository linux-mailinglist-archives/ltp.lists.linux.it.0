Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4643FED53
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D375C3C9947
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C67833C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:10 +0200 (CEST)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C09D10009DE
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:10 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id t1so1667520pgv.3
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+YpdzuNz0yAnKn1RBc+MKWDd/enYmpSuEvgHONCdYjc=;
 b=JTC0EXrxOxJKP4d4OC8ECusmt19ghIOHJrGtedjnWaiNwhEVzO4suTcf9oUpPduXCV
 dd7Ge2iU8xdA+QNXhERgkBIhfh91U7gd5QIIPJwkRnZrdemHjJys8CU7yMoyfztRafFe
 gU4TGRazr10oHGLq6VaksttzKoeRZMUBkV1fLL4rpDH90c9tIaGjioQZr55FuLyUmj/u
 fIXT70aPqIYS6fXzyyEHak32Kg3jbZ9I1Wc1I2hQg8+2sCdaOS+qoqzw+JEyjeYX2nbQ
 w7Prk0lSh3tQWi9bdMeVdWlyUFn2fWPf/AAkKzwR9pfP/DmOSCFoEAnmoQ0ArVJLgd14
 IrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+YpdzuNz0yAnKn1RBc+MKWDd/enYmpSuEvgHONCdYjc=;
 b=eUayaXO/cTTUUzlJB25kEU2HXxpIofmnn/H8VF9BSlg840tZvUnTsFIWJrSyQrWFYS
 JmEXEBEEWo8nNjcoOocRQzCnJLTstmbv3BC7Hlwo4XHrIs+4J4Ul/9aR4U6LD8V+xQwB
 zcCqZcCJa/QssLn9Ks9qAnF3cPOe9Bs3MiBmVQzi5CN/7w6HMaJGY0tjBwW0MPCLZTQV
 Saj1yN4umZm8A7p8x11TqiltxQw8+At86HgbMkM9nQAGmJSScBY67Y4LxtSVOprLWFfs
 XfJkJO4IGOlCUwWPYd/ASLBoUYIXtmUFVc1QRlGX1dpr6fz3DybWLPBCAf4Ivxb7uD0Y
 jccg==
X-Gm-Message-State: AOAM531ZILJke94VPg86fKdt3U58MaUf0Ku6gGhRio8M8Dzaojj4WeHm
 +BcwfR2Q0BQwTCoBm1Y9W4IhZWwf4zj8qQCR
X-Google-Smtp-Source: ABdhPJy4oUzXx8uM8xVNM15y5fDil+yeDFJDrpPandnD/jzls+GfJLiY5dsiiXOYJPlyrINN+liHUA==
X-Received: by 2002:a63:3d4a:: with SMTP id k71mr2938824pga.276.1630583948921; 
 Thu, 02 Sep 2021 04:59:08 -0700 (PDT)
Received: from localhost.localdomain (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id d22sm2137490pjw.38.2021.09.02.04.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 04:59:08 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 20:58:45 +0900
Message-Id: <20210902115849.72382-2-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902115849.72382-1-qi.fuli@fujitsu.com>
References: <20210902115849.72382-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] syscalls/dup2/dup201: Convert dup201 to the new
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
 testcases/kernel/syscalls/dup2/dup201.c | 161 +++++-------------------
 1 file changed, 34 insertions(+), 127 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
index 4fa34466a..231c262bf 100644
--- a/testcases/kernel/syscalls/dup2/dup201.c
+++ b/testcases/kernel/syscalls/dup2/dup201.c
@@ -1,87 +1,30 @@
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
- *	dup201.c
+ * Copyright (c) International Business Machines  Corp., 2001
  *
- * DESCRIPTION
+ * DESCRIPTION:
  *	Negative tests for dup2() with bad fd (EBADF)
  *
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
- *
- * USAGE:  <for command-line>
- *  dup201 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	01/2002 Removed EMFILE test - Paul Larson
- *
- * RESTRICTIONS
- * 	NONE
+ * HISTORY:
+ * 	07/2001 Ported by Wayne Boyer
+ * 	01/2002 Removed EMFILE test - Paul Larson
  */
 
-#include <sys/types.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <sys/time.h>
-#include <sys/resource.h>
-#include <unistd.h>
-#include <signal.h>
-#include "test.h"
-
-void setup(void);
-void cleanup(void);
-
-char *TCID = "dup201";
-int TST_TOTAL = 4;
+#include "tst_test.h"
 
 int maxfd;
 int goodfd = 5;
 int badfd = -1;
 int mystdout = 0;
 
-struct test_case_t {
+static struct tcase {
 	int *ofd;
 	int *nfd;
 	int error;
 	void (*setupfunc) ();
-} TC[] = {
+} tcases[] = {
 	/* First fd argument is less than 0 - EBADF */
 	{&badfd, &goodfd, EBADF, NULL},
 	    /* First fd argument is getdtablesize() - EBADF */
@@ -92,72 +35,36 @@ struct test_case_t {
 	{&mystdout, &maxfd, EBADF, NULL},
 };
 
-int main(int ac, char **av)
-{
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
 void setup(void)
 {
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
+	if (tc->setupfunc)
+		tc->setupfunc();
+
+	TEST(dup2(*tc->ofd, *tc->nfd));
+
+	if (TST_RET == -1) {
+		if (TST_ERR == tc->error)
+			tst_res(TPASS, "failed as expected - errno = %d : %s",
+				TST_ERR, strerror(TST_ERR));
+		else
+			tst_res(TFAIL | TTERRNO, "failed unexpectedly; "
+				"expected %d: %s", tc->error,
+				strerror(tc->error));
+	} else
+		tst_res(TFAIL, "call succeeded unexpectedly");
 }
+
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
