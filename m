Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8FE3CFAA5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 445303C9825
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 26A8A3C81AF
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:10 +0200 (CEST)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 885391400DB3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:09 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id s13so14316459lfi.12
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RJ2xBftM7w4OU7tTP/v/NCCkj7Hq9nLvMDuD0tN5Qpo=;
 b=PP/xw04XzMEXYmBpWz32WWnSZ8at8m4iqCzFKz3Yy9UKsBFA+fmwLRxJkE9gERkTNE
 HzOU+L+/Wo1D5SuzN61QvdU6bic5bM06ak6NH2MvQU8vHUmdiaOMTPYrsih/DabsgB5v
 IGn9l58WHERwzadIv9aNE0SBL07yb8xRJIF0qi/YyXPlBpO6VQPD+gHH0tdtU+1+lxAp
 vnPO2ap72ynd/uJd2hVKyKzkIlsu69owuKDsO1Cghgd/YjXWVdoNlzXyyQO0eK1j+G9B
 Jen89muDRNVwEQyIQf3Tkh32fXLeKg8iyD5z3e1gZdSMRU6TGrKuY2wJCy4iwh0/sOFw
 ftgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RJ2xBftM7w4OU7tTP/v/NCCkj7Hq9nLvMDuD0tN5Qpo=;
 b=susJ/cNlURXzjd8pHXUzWNqcAQ+tfDCKx5ByfACkbV2vhu/wKftgsFcTOEWpxMnbHz
 b2T4DUTVAsyARm0fXFzhx0bTQDL70D1EioxQ/+mes9DpcS5cHHDiboFC0BbLbzh47wuj
 /49OaufrLgcdbNDsER+Ik5XV4k5tZAmIc3cbL5wVSJJVotK6d+qAiiXpynk7PpnuA5GA
 ehLuU/n4Yd28BDrMkK3GIvZak23JrQNtyHILlFgQaaeavQEmCu4gZZ2oXQiuLbGNGDzc
 eNzNBm0l/oDVLSbS/5OGpSqC9WR4GuwVZVm1qAJhBUtuopDMNRH1p8aNNJUiy5e0yBNC
 cBnQ==
X-Gm-Message-State: AOAM532+0JUiUNnh+Ko/j5i4vS2yduwjSVKxnbWebxAzS0rUVxsiwqjO
 qahiVlBshk/EKZdPlXZodNIEaNqZkLfs
X-Google-Smtp-Source: ABdhPJzHjI9yWEWW2foQC6SaHkYItkbWJyC+6wecQQq9AqEsmTQcD8iu//gQn6cJZmnnvg9ZHVcX8A==
X-Received: by 2002:a19:fc13:: with SMTP id a19mr23169331lfi.581.1626788048828; 
 Tue, 20 Jul 2021 06:34:08 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:08 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:12 +0300
Message-Id: <20210720133324.21752-5-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 04/16] syscalls/sched_setparam01: convert to new API
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
 .../sched_setparam/sched_setparam01.c         | 135 +++---------------
 1 file changed, 18 insertions(+), 117 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c b/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
index a2272eb18..d677736a1 100644
--- a/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
+++ b/testcases/kernel/syscalls/sched_setparam/sched_setparam01.c
@@ -1,128 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
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
+ * AUTHOR: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_setparam01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for sched_setparam(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the sched_setparam(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ * [Description]
  *
- * USAGE:  <for command-line>
- *  sched_setparam01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Basic test for sched_setparam(2)
  *
- ****************************************************************/
-
-#include <errno.h>
-#include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_setparam01";
-int TST_TOTAL = 1;
-
-static struct sched_param param;
-
-int main(int ac, char **av)
-{
-
-	int lc;
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
-		 * Call sched_setparam(2) with pid=0 sothat it will
-		 * set the scheduling parameters for the calling process
-		 */
-		TEST(sched_setparam(0, &param));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "sched_setparam() returned %ld",
-				 TEST_RETURN);
-		} else {
-			tst_resm(TFAIL | TTERRNO,
-				 "Test Failed, sched_setparam()" "returned %ld",
-				 TEST_RETURN);
-		}
-	}
+ * Call sched_setparam(2) with pid=0 so that it will
+ * set the scheduling parameters for the calling process
+ */
 
-	cleanup();
-	tst_exit();
-}
+#include "tst_test.h"
+#include "tst_sched.h"
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void run(void)
 {
+	struct sched_param p = { .sched_priority = 0 };
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	param.sched_priority = 0;
-
+	TST_EXP_PASS(tst_sched_setparam(0, &p));
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
