Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A80783A59BC
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:13:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A14A3C4D3F
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:13:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 72E373C2F29
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:13:26 +0200 (CEST)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D308A100024A
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:13:25 +0200 (CEST)
Received: by mail-il1-x12d.google.com with SMTP id h3so10180668ilc.9
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UBUky2UVsBgM7axFqqHds+S7TFHUn3D6bn5fNMwQeuc=;
 b=ShPji68qkQzrv7863vlO6Zf5qYF/SHjffrCXSILRZD2d3hvOVUI3vWNR0W1o96bVrp
 APtUS+VmAL/ue3IYm7yATNLDNPClFwMDOtYhIf0oRohLX2CcNAbX11d2TfipTJlsWf8n
 ljCfRM2I4l23/GvjmpTQqnGdjWjghbWIHF5rkKF6zSNpZJg4sqabmYUzM4Vpnfs9xUFS
 WIMfRivJz6GgCK+DaRmlAg0m/RpF0dUk6WVJICYgtl4mjOq2AOLGvLgJaW+9mXGCCSMn
 IbIcI6IR53nqjkYA/QbhKaEB9yqa/lZkCRuGUcdP8ucqBR4416pTrqsPhd/yvBbTZstI
 ix2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UBUky2UVsBgM7axFqqHds+S7TFHUn3D6bn5fNMwQeuc=;
 b=bdTP5F1rwALaRiSYO0VcZPYt09TWbcHmNUFdh8LYdkKbThbsE6oLKTuE6m8FYHpffL
 5V+HPEwrI6haNsyNi5LQ3/Ie0JpeKq/zcFXeZ/8GYE90kPvliN2jWSXGibPbOCxWDeBW
 TAyRJyitL+3z4q6llg5a5Fzru0470maFvbaMFAlWqQAYdgv7y5eBXcaDFd35rT9Os+z5
 IdhMMw1jFAawNB72YF9TrIXM4hXe2YMcGscUAASw1mhcN7lKNKZYWnGnn/QMUoWEkPSO
 2dXQ2ieIsA25irLHeklFzi4+a7AjUch4Aapk3MuG2bH4ENWZ0lzwm1p33aeyj6+nwaLS
 cB9Q==
X-Gm-Message-State: AOAM531LrjOKfaIhrgo9CFdetPvMlImP6aTznNtd+ITYHKYDspuX9yUs
 bebiHbW0VGgKiGfDwxyFPKM=
X-Google-Smtp-Source: ABdhPJxLY6wpor25G15LLtFRiBX+GrbR/iQhrn2OcE+HVwGskqxVhMycf/jxcknvXz+53xMgmY3XQw==
X-Received: by 2002:a92:c5d2:: with SMTP id s18mr9913120ilt.127.1623604404499; 
 Sun, 13 Jun 2021 10:13:24 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id l6sm7049914iok.9.2021.06.13.10.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 10:13:24 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 22:42:59 +0530
Message-Id: <20210613171259.7550-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNp8tAdF1usM1LM@yuki>
References: <YMNp8tAdF1usM1LM@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] getrusage02: Convert getrusage02 to new API
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
 .../kernel/syscalls/getrusage/getrusage02.c   | 140 +++---------------
 1 file changed, 20 insertions(+), 120 deletions(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c b/testcases/kernel/syscalls/getrusage/getrusage02.c
index 8077606a2..9fc5d7dbb 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -1,85 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * AUTHOR : Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: getrusage02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Tests for error conditions
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that
- *	1) getrusage() fails with errno EINVAL when an invalid value
- *	   is given for who
- *	2) getrusage() fails with errno EFAULT when an invalid address
- *	   is given for usage
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  if call failed with expected errno,
- *		Test Passed
- *	  else
- *		Test Failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ *[Description]
  *
- * USAGE:  <for command-line>
- *  getrusage02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f]
- * 			     [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Verify that
+ * 1) getrusage() fails with errno EINVAL when an invalid value
+ *   is given for who
+ * 2) getrusage() fails with errno EFAULT when an invalid address
+ *   is given for usage
  *
- ****************************************************************/
+ */
 
 #include <errno.h>
 #include <sched.h>
 #include <sys/resource.h>
-#include "test.h"
-
-#ifndef RUSAGE_BOTH		/* Removed from user space on RHEL4 */
-#define RUSAGE_BOTH (-2)	/* still works on SuSE      */
-#endif /* so this is a work around */
-
-static void setup();
-static void cleanup();
-
-char *TCID = "getrusage02";
+#include "tst_test.h"
 
 static struct rusage usage;
 
@@ -89,57 +28,18 @@ struct test_cases_t {
 	int exp_errno;
 } test_cases[] = {
 	{
-	RUSAGE_BOTH, &usage, EINVAL},
-#ifndef UCLINUX
+	-2, &usage, EINVAL},
 	{
 	RUSAGE_SELF, (struct rusage *)-1, EFAULT}
-#endif
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-int main(int ac, char **av)
+static void verify_getrusage(unsigned int i)
 {
-
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(getrusage(test_cases[i].who, test_cases[i].usage));
-
-			if (TEST_RETURN == -1 &&
-			    TEST_ERRNO == test_cases[i].exp_errno)
-				tst_resm(TPASS | TTERRNO,
-					 "getrusage failed as expected");
-			else
-				tst_resm(TFAIL | TTERRNO,
-					 "getrusage failed unexpectedly");
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
-
+	TST_EXP_FAIL(getrusage(test_cases[i].who, test_cases[i].usage),
+		test_cases[i].exp_errno, "getrusage failed as expected");
 }
 
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test = verify_getrusage,
+	.tcnt = ARRAY_SIZE(test_cases),
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
