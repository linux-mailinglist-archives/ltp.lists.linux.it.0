Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930D3E2E97
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BA7C3CA3FC
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C4E83CA3DA
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:11 +0200 (CEST)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BC6D6010F8
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:11 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id g30so14850248lfv.4
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOEkrY6l8c/COgFw6nH42b1j02k7ovbB7/K5yw+1//M=;
 b=CFmKvZdBKDnqEPZFnnUQKOA6uTJ+zny59/+A28FlQ1Xn//sUHCxcES8t0prOrcpwi0
 gqTs98IK8pWicbm+ou3YH1I32/XMuuSSA8KwSZavztE3BLyowmTqBboOMKV8WPRekKgz
 C4jXJHIlEJviV1jYAjVHQDA4gvOsPQEd9w/JGsX1W2RCEt7h/AI0VIGhhoLv/SZCOCms
 x2g9x6XYIgKLRKP3MK/0Ere0nukWFuCsZrq76haE57B94fidb1pqZjZ4iavhGG9AtU+5
 MjLrE1HnjyBnefxlkDJbmXS28KbtNe+Uezk8h9erVNwl+g4EVtd2Q91nwrF04njw+TLf
 +uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOEkrY6l8c/COgFw6nH42b1j02k7ovbB7/K5yw+1//M=;
 b=cnLwiNjTEgqjt6Q6enj/uhuoyf8u3ECgkC/Cg1ys6GAn4aAEXOBjLEQe44lDB0FyHY
 8NAdF6UdB79QGKCLKnNg6r3SfmAXveTJJPsKZMYaVJoDDDuH7LWA3rwV9rKIruKv/otC
 WPnGnbIrQkXhRZLfMRdDPOnt9oFuZiGjpgKicz0Ijfmu3AB6To7BcGSwWsp/XwPLydxZ
 +ZP95A9Y5lZA3zSM/Ei29nbCUVeRF+rYH4IsTle3rr1OGkCEZPufAdrCXkYXZq4CnnTi
 8/H9EziRzkaspMuYKgVt1vCX87/+5eFkw4/DUc7UThUq15xrGPKUz+WeVPeSyz6jCXpJ
 +U7g==
X-Gm-Message-State: AOAM530gOisOzyDFH9BUKRDobtKN9FYOUf4fLdPRSJ35EXHguD4y7N/Z
 E9MpaLaavdYz/3lu1XfnGdFrdU5PN4bL
X-Google-Smtp-Source: ABdhPJyI2/hzf/LRUGq7qE+4zZasZjuKh25GIVnEBL8nNjUVbC7PC9KfbWac8cZnKmoP+dj0xYkC4w==
X-Received: by 2002:ac2:434b:: with SMTP id o11mr8485868lfl.102.1628268490342; 
 Fri, 06 Aug 2021 09:48:10 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:10 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:30 +0300
Message-Id: <20210806164730.51040-17-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 16/16] syscalls/sched_getscheduler02: convert to
 new API
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
 .../sched_getscheduler/sched_getscheduler02.c | 109 ++++--------------
 1 file changed, 24 insertions(+), 85 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
index c43240108..effd18adb 100644
--- a/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
+++ b/testcases/kernel/syscalls/sched_getscheduler/sched_getscheduler02.c
@@ -1,106 +1,45 @@
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
+/*\
+ * [Description]
  *
- * ALGORITHM
- *	Pass an invalid pid to sched_getscheduler() and test for ESRCH.
- *
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
+static struct sched_variants variants[] = {
+	{ .sched_getscheduler = libc_sched_getscheduler, .desc = "libc" },
+	{ .sched_getscheduler = sys_sched_getscheduler, .desc = "syscall" },
+};
 
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
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 
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
+	struct sched_variants *tv = &variants[tst_variant];
 
-	TEST_PAUSE;
+	TST_EXP_FAIL(tv->sched_getscheduler(unused_pid), ESRCH,
+		     "sched_getscheduler(%d)", unused_pid);
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
+	.test_variants = ARRAY_SIZE(variants),
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
