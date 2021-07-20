Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF763CFAC3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B3A33C9822
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:36:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E2283C9812
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:18 +0200 (CEST)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B38A72000BE
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:17 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id r16so31070805ljk.9
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D62JpQL7vLNHLXx0s6dDkyJyBLCWOkvqAB60Nf19B9A=;
 b=F4iE2qC7BiQBPvJW+eu2APw1TEAJ+2vLhO+G3IUlEsZlK7PujObNWHvRF3wkt+oE2R
 ApQOiLtqt+zSPrEPwKsNXJTdcllmx529jL4Q0zZACvv33cU1zsvLm4Autn5rFEEzpz8C
 7wklEWVaddbDIaoug1tkho7Hx+15fDGrYE3gI+V361fOk+3EDqnKx6JmRJGzKPHbCl3p
 7w0lNRBqARDq4ZF+hma+Fwa3FoJLY4pyBSIEiZvsVx6tOpjnyOe4lGleQ9xVitvobVrw
 EmN66wFzdu0tKsZrZAY2HXectGmyu3ER0W2Bdfld7AxJOSsmkdAfqa075sRbbE8qaASr
 OAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D62JpQL7vLNHLXx0s6dDkyJyBLCWOkvqAB60Nf19B9A=;
 b=dVkpGeQ1atd/n1Xp72Rtbg4WlzQpRH9h0pPHLXtfaj+fHnt+QnPGm520DCcf9NFrSM
 sJXNRBEYzRNFhCxH3FsEDL5C+yRJx+/nPhyZEUfuebbZ68VX7Q2Rs39Xw7kSh5dzjH3V
 ngutMpQ/vKKmCtJLrjpgNQr6MO3HEBBIAEA6ak72doqN7fHWxJ2MwBgZvQ5CXr+/rtmq
 0gQsAg/UBzJIhykJrR/AkkP1uViGwG+iZ+aq0ygCAfM22GdC/8/Qslag45GX1+oRc272
 JCo0vbJKiJ7/+XCtdmIgG7R1o9K2pHY1tsY2BcQNjtcFgWNci0lNbUy9Z/PTQFEed+yH
 gFMw==
X-Gm-Message-State: AOAM53059LUZ3sMi+G3vrijBPL82jWfUPiXgRKe/tGJiPxYR676iZTUz
 0yQwUS6qxvKjfpK1a+roOB3t/B1jMzUp
X-Google-Smtp-Source: ABdhPJyh+9HOQoJLxfI55IBIA2DL8fLDOcAhE+FfUCL4pMgDI95hwFAxD5gV/Jev93umN3OaVQEYaA==
X-Received: by 2002:a2e:321a:: with SMTP id y26mr26484860ljy.463.1626788057026; 
 Tue, 20 Jul 2021 06:34:17 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:16 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:24 +0300
Message-Id: <20210720133324.21752-17-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 16/16] syscalls/sched_getscheduler02: convert to new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 .../sched_getscheduler/sched_getscheduler02.c | 104 +++---------------
 1 file changed, 16 insertions(+), 88 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
index c43240108..73c5f58db 100644
--- a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
+++ b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
@@ -1,106 +1,34 @@
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
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
+ * Copyright (c) International Business Machines  Corp., 2001
  */
 
-/*
- * NAME
- *	sched_getscheduler02.C
- *
- * DESCRIPTION
- *	To check for the errno ESRCH
- *
- * ALGORITHM
- *	Pass an invalid pid to sched_getscheduler() and test for ESRCH.
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sched_getscheduler02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * RESTRICTION
- *	None
+ * Pass an invalid pid to sched_getscheduler() and test for ESRCH.
  */
 
 #include <stdio.h>
-#include <sched.h>
 #include <errno.h>
-#include "test.h"
 
-char *TCID = "sched_getscheduler02";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "tst_sched.h"
 
 static pid_t unused_pid;
 
-void setup(void);
-void cleanup(void);
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		TEST(sched_getscheduler(unused_pid));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "sched_getscheduler(2) passed "
-				 "unexpectedly");
-			continue;
-		}
-
-		if (errno != ESRCH) {
-			tst_resm(TFAIL, "Expected ESRCH, got %d", errno);
-		} else {
-			tst_resm(TPASS, "call failed with ESRCH");
-		}
-	}
-	cleanup();
-	tst_exit();
-
+	unused_pid = tst_get_unused_pid();
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void run(void)
 {
-	unused_pid = tst_get_unused_pid(cleanup);
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	TST_EXP_FAIL(tst_sched_getscheduler(unused_pid), ESRCH);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
