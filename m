Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CA3E2E92
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC9783CA3BA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B1B273CA3ED
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:09 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2FB7A60080F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:09 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id p38so19223471lfa.0
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dv0ShxFN7373uHK6KASChBK7d403loSYz0pCuDeYGwA=;
 b=Q4Gjhj+ibGhdz456Lw9mFgRvM6Fe6SUvt2f0kkdjMeaL0zl7Uj7PuK1++BFU160PN8
 i7jmI3tlohF5jgrCvgGdYdXx2h7AuhmlTGl/49VOdlSBJ+JxoUIFwt+EtMWJYYleZDJa
 KTtNy9sVM2Gu6K/0lbZAQ8wLTIYgJIUB+9HR9ZjQ+RcN70o/50EGS70jTF8DmfWV8TT/
 v8Fkaym7BEYDhvsL1cvm7XVRXqA1FQ15+aECXcJHUe2AYIk2gtNmhwmp8RwaM/b/et9v
 WmNKLsW3S9iaNpc7zm9RBbs0SKK7xs16glKKBnowOAB/FZREo+7RM56myUkAR6hw2CVe
 BNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dv0ShxFN7373uHK6KASChBK7d403loSYz0pCuDeYGwA=;
 b=XSM/6vhJY9oDspy1MhQfIDB3vbDT8uaCxJQpE8omPkGHd/b0drHhiiTIk5PjNnPzFv
 B67ojwugzymQYejOV0BZFuXW+5IV005wq3ZoMlQTjT7QMRDRUCq6SIHcWdhDVeqVjaxO
 VauxAkw38eW/WIKXoAluKOvT3lw4BFccfLO0h6NuF1n+z1KHU6P+Mu21248CyNFhC2Zq
 /gAMb5c8qfrul+uhbbxwkOe9KpxBaege27akg4Bmi/xpjUm1JL3/yBClQEXZK+0Bpf8n
 xmmeuqlZedUk6lS97uMSMVm/2f3gD2elcdJr4FM7e5kdreHA3TTEoj482oH9PDhjeXqq
 UEuQ==
X-Gm-Message-State: AOAM5325oL9xWAJNWsB+tniWUFczKjwbSmd+yXEdGceLeM+aMuUGTNBs
 4qOX+bdvSr6y/y+7vZ60999dVv39YBd5
X-Google-Smtp-Source: ABdhPJwNtBPdSl/+IX0B6QGgOVzp+/mCglbFzkujHvlQiUqyZYJwuNwxgDt58aRQPLRFG8UzLyNn8A==
X-Received: by 2002:a05:6512:33b9:: with SMTP id
 i25mr8434895lfg.634.1628268488422; 
 Fri, 06 Aug 2021 09:48:08 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:08 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:27 +0300
Message-Id: <20210806164730.51040-14-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 13/16] syscalls/sched_setscheduler02: convert to
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
 .../sched_setscheduler/sched_setscheduler02.c | 165 +++++-------------
 1 file changed, 44 insertions(+), 121 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
index 36952d9cb..ddebdac94 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler02.c
@@ -1,148 +1,71 @@
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
- *	sched_setscheduler01.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	Testcase to test whether sched_setscheduler(2) sets the errnos
- *	correctly.
+ * Testcase to test whether sched_setscheduler(2) sets the errnos
+ * correctly.
  *
- * ALGORITHM
- *	1.	Call sched_setscheduler as a non-root uid, and expect EPERM
- *	to be returned.
+ * [Algorithm]
  *
- * USAGE:  <for command-line>
- *  sched_setscheduler02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Call sched_setscheduler as a non-root uid, and expect EPERM
+ * to be returned.
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	Must run test as root.
  */
-#include <stdio.h>
+
+#include <stdlib.h>
 #include <errno.h>
-#include <sched.h>
 #include <pwd.h>
 #include <sys/types.h>
-#include <sys/wait.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "tst_sched.h"
 
 #define SCHED_INVALID	99
 #define INVALID_PID	999999
 
-char *TCID = "sched_setscheduler02";
-int TST_TOTAL = 1;
-
-void setup(void);
-void cleanup(void);
-
 static uid_t nobody_uid;
 
-int main(int ac, char **av)
-{
-	int lc;
-	pid_t pid;
-	struct sched_param param;
-	int status;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		if ((pid = FORK_OR_VFORK()) == -1) {
-			tst_brkm(TBROK, cleanup, "fork failed");
-		}
-
-		if (pid == 0) {	/* child */
-			param.sched_priority = 1;
-
-			SAFE_SETEUID(cleanup, nobody_uid);
+static struct sched_variants variants[] = {
+	{ .sched_setscheduler = libc_sched_setscheduler, .desc = "libc" },
+	{ .sched_setscheduler = sys_sched_setscheduler, .desc = "syscall" },
+};
 
-			TEST(sched_setscheduler(pid, SCHED_FIFO, &param));
-
-			if (TEST_ERRNO) {
-			}
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "sched_setscheduler(2) passed "
-					 "with non root priveledges");
-			} else if (TEST_ERRNO != EPERM) {
-				tst_resm(TFAIL, "Expected EPERM, got %d",
-					 TEST_ERRNO);
-			} else {
-				tst_resm(TPASS, "got EPERM");
-			}
-		} else {	/* parent */
-			/* let the child carry on */
-			wait(&status);
-			if (WIFEXITED(status) != 0) {	/* Exit with errors */
-				exit(WEXITSTATUS(status));
-			} else {
-				exit(0);
-			}
-		}
-
-		SAFE_SETEUID(cleanup, 0);
-	}
-	cleanup();
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	struct passwd *pw;
+	struct passwd *pw = SAFE_GETPWNAM("nobody");
 
-	tst_require_root();
+	tst_res(TINFO, "Testing %s variant", variants[tst_variant].desc);
 
-	pw = SAFE_GETPWNAM(NULL, "nobody");
 	nobody_uid = pw->pw_uid;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void run(void)
 {
-
+	struct sched_variants *tv = &variants[tst_variant];
+	pid_t pid = SAFE_FORK();
+
+	if (!pid) {
+		struct sched_param p = { .sched_priority = 1 };
+
+		SAFE_SETEUID(nobody_uid);
+		TST_EXP_FAIL(tv->sched_setscheduler(0, SCHED_FIFO, &p), EPERM,
+			     "sched_setscheduler(0, SCHED_FIFO, %d)",
+			     p.sched_priority);
+		SAFE_SETEUID(0);
+		exit(0);
+	}
+	tst_reap_children();
 }
+
+static struct tst_test test = {
+	.forks_child = 1,
+	.needs_root = 1,
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.test_all = run,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
