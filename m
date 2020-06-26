Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0D20AC3D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:23:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC66D3C2B6D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:23:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C1F293C583C
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:46 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C3AEC1401184
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:45 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id e9so4509413pgo.9
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8QlfqIDyKeHblS8UuX3/4BCXqCBVSs/CzOzkVisJr1U=;
 b=FuKdqzN2u1Nv0ocACa9O95wgDViLwCYOXZTng0U0LuB3Z4PdB1dnfqdz4ghTaysKcD
 dZHmxd0l02NTU7AmGiE7Wb9BJCqTbdwhQudrzXGHfMfxSE6EYKQLNLpjlV6D+qU8fVJ4
 GuSlKl80I0ulSlfNDSSQ21TDc1LCNbOWXUZyFLx7IF/UU012jYuatQNXDB3cfPIHRnW9
 fivqREmILMjhGXsZubFoEA6w/5VRuA2YEMhyMDeGRa0Sa58TvVSDNMQ6zxwCsaYdFeHo
 oscNA9vRUthdUpR3/HgJZTKr04m0zRtR8j+ZSPpa/RtrxLSBNZj7uJxw0YBTKjoPETDv
 py2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QlfqIDyKeHblS8UuX3/4BCXqCBVSs/CzOzkVisJr1U=;
 b=Rp6wpxiMhUNtzzZygQlQO3W2/NnzfJxOWpMx/GUsAyfjC2O1jR5QMbGOBmW6oVvqJD
 svLppw0tj8VdG2CxcoExHmpbGKlnh+rY2b6wo7F637fhOpA1TFMDnF3sMYEan51se4qO
 +vlmdglKc0U+Uzi+NcpHqldh2D2GwmcBcyVYVhvWxnW3a7moaSsgtu66LcrR+ljaSc3A
 U4oxTV3sNSqELF5FtZ1NYF373+Hmfd0OV4sLZJC40mz5i8DbB57JR3PIHDgsEIoS8SXz
 PYAliwEIvuhrcR9UwD/TPOhdgcAgGAiEaOqw3Rnp3N6Gkm9Xfz4upMA40S1KGDsFZoSh
 DufQ==
X-Gm-Message-State: AOAM533fzAvT9fccbiYsC0DEAEZnt77VRb0YfSUziC4+P6l+VURRb0ED
 YvrHbzR8IIUUfUD3wGOib6/RnJmyMQk=
X-Google-Smtp-Source: ABdhPJzAqJkvJBq1Nd8w4Yhf+2ufettICco2VycTH5CzfBRTpmDVu1LKcEPCH/t6hLTifU5qmm1u1g==
X-Received: by 2002:a63:7d4e:: with SMTP id m14mr1403753pgn.391.1593152563553; 
 Thu, 25 Jun 2020 23:22:43 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id o11sm9947317pjq.54.2020.06.25.23.22.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:22:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:15 +0530
Message-Id: <b5c196e5216fe30c1d828242abbc95cebcfee931.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V7 02/19] syscalls/timer_gettime: Add support for
 time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing timer_gettime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/timer_gettime/timer_gettime01.c  | 135 ++++++++----------
 1 file changed, 63 insertions(+), 72 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index 1c75f1cf0e45..f7083917317c 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -1,24 +1,10 @@
-/******************************************************************************
- * Copyright (c) Crackerjack Project., 2007                                   *
- * Porting from Crackerjack to LTP is done by:                                *
- *              Manas Kumar Nayak <maknayak@in.ibm.com>                       *
- * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>                          *
- *                                                                            *
- * This program is free software;  you can redistribute it and/or modify      *
- * it under the terms of the GNU General Public License as published by       *
- * the Free Software Foundation; either version 2 of the License, or          *
- * (at your option) any later version.                                        *
- *                                                                            *
- * This program is distributed in the hope that it will be useful,            *
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of            *
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  *
- * the GNU General Public License for more details.                           *
- *                                                                            *
- * You should have received a copy of the GNU General Public License          *
- * along with this program;  if not, write to the Free Software Foundation,   *
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA           *
- *                                                                            *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Crackerjack Project., 2007
+ * Porting from Crackerjack to LTP is done by:
+ *	Manas Kumar Nayak <maknayak@in.ibm.com>
+ * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>
+ */
 
 #include <time.h>
 #include <signal.h>
@@ -26,71 +12,76 @@
 #include <stdio.h>
 #include <errno.h>
 
-#include "test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
 
-char *TCID = "timer_gettime01";
-int TST_TOTAL = 3;
+static struct test_variants {
+	int (*func)(timer_t timer, void *its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timer_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+#if (__NR_timer_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
-static void setup(void)
-{
-	TEST_PAUSE;
-	tst_tmpdir();
-}
+static timer_t timer;
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
 	struct sigevent ev;
-	struct itimerspec spec;
-	int timer;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 
 	ev.sigev_value = (union sigval) 0;
 	ev.sigev_signo = SIGALRM;
 	ev.sigev_notify = SIGEV_SIGNAL;
-	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
-
-	if (TEST_RETURN != 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "Failed to create timer");
 
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
+	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
 
-		TEST(ltp_syscall(__NR_timer_gettime, timer, &spec));
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "timer_gettime(CLOCK_REALTIME) Passed");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(CLOCK_REALTIME) Failed");
-		}
-
-		TEST(ltp_syscall(__NR_timer_gettime, -1, &spec));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EINVAL) {
-			tst_resm(TPASS,	"timer_gettime(-1) Failed: EINVAL");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "timer_create() failed");
+		return;
+	}
+}
 
-		TEST(ltp_syscall(__NR_timer_gettime, timer, NULL));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT) {
-			tst_resm(TPASS,	"timer_gettime(NULL) Failed: EFAULT");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
+static void verify(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_its spec = {.type = tv->type, };
+
+	TEST(tv->func(timer, tst_its_get(&spec)));
+	if (TST_RET == 0) {
+		if (tst_its_get_interval_sec(spec) ||
+		    tst_its_get_interval_nsec(spec) ||
+		    tst_its_get_value_sec(spec) ||
+		    tst_its_get_value_nsec(spec))
+			tst_res(TFAIL, "timespec should have been zeroed");
+		else
+			tst_res(TPASS, "timer_gettime() Passed");
+	} else {
+		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
 	}
 
-	cleanup();
-	tst_exit();
+	TEST(tv->func((timer_t)-1, tst_its_get(&spec)));
+	if (TST_RET == -1 && TST_ERR == EINVAL)
+		tst_res(TPASS, "timer_gettime(-1) Failed: EINVAL");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
+
+	TEST(tv->func(timer, NULL));
+	if (TST_RET == -1 && TST_ERR == EFAULT)
+		tst_res(TPASS, "timer_gettime(NULL) Failed: EFAULT");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
 }
+
+static struct tst_test test = {
+	.test_all = verify,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
