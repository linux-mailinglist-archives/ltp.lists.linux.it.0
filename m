Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25D154347
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 12:40:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12F1F3C2567
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Feb 2020 12:40:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A4D083C0637
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 12:40:42 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9F01620108A
 for <ltp@lists.linux.it>; Thu,  6 Feb 2020 12:40:41 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id q8so2994681pfh.7
 for <ltp@lists.linux.it>; Thu, 06 Feb 2020 03:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+vx4KnDMb9vCD1C5rh6LSKuw/c0lrao+xPwcKMyhwVo=;
 b=tn3tqknTLptDEwLAEMbQA9uzT1KKlxozcdXmJMABRyCjOVE8HSQ0LyvbAz/riogesZ
 sRS0ytiepFbayoZDR3K0wi0fQFyX0AoU+N3mhUmQ1NghTnEJS9fDWUJW5YlQXkbuysoV
 6csc9LH0CShyFlUVKJVXSsxqJS+rqGF9355EPAytHK3HMCTqRCH6pOdd3EYB8tZ1FUD0
 v2KRCGejnLWzMTntc7xp8iaWt2R0zBLtBuuGUqdUNs19CPEzqvIPHfP2dQc9g0I4Wukw
 GssvDrlJ+cxVeIMiqmtvuhVgI6Dn7juQBPXQB+RE7ZLRdze8ueS51NklHJALLASCd4kR
 GTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+vx4KnDMb9vCD1C5rh6LSKuw/c0lrao+xPwcKMyhwVo=;
 b=tYz+2SqkSmieto7tEydbHm3xQfyG/cZ/hHvSwwC0ht7ISOQduPAeESQFpL6AFg81yo
 FtRHz+lhu8VrZWMKUYH2HMuEqdh4rlkiIX/cT2ahAy4HbNN29Nc88QSb5KDoBEdcOLo3
 vx/CCp51BQxRPjLIcoYkHoNpep+sgqdMVSORq2kImsLGwGLlrR7KgOPkEQKpIX8Wgo8z
 zRE30nksS2omz9xSGn9BrdSveJCWYT+/ZsXjClrxP+RiuBa0nxbz00rDywDujlz0OfpY
 4MHkS9ad9hlF6Voh9SlK10s6ZwF9iFnH7pYhbRyLkk3+6gIm04/usPAZrh5e/6bhBBAN
 ofyA==
X-Gm-Message-State: APjAAAUFc1s1/B/oH0nwPYgYpn5Y+qPr3nKzpLxcC3IBmRKVQpW/sU0b
 1bxMoL3U8/Baf3hIzD4C1PXnQyutHlM=
X-Google-Smtp-Source: APXvYqw8ohAsLjz3a3hKzhQZ+oTg4RYz1P46b7FXJ20aYscMUR8+xdwM0QA1q4gGvosMFDbShTSVGA==
X-Received: by 2002:a63:f202:: with SMTP id v2mr3070047pgh.420.1580989239271; 
 Thu, 06 Feb 2020 03:40:39 -0800 (PST)
Received: from localhost.localdomain ([122.183.168.197])
 by smtp.gmail.com with ESMTPSA id y128sm3073567pfg.17.2020.02.06.03.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:40:38 -0800 (PST)
From: Prachi Parekh <prachiparekh20@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  6 Feb 2020 17:09:58 +0530
Message-Id: <20200206113958.11567-1-prachiparekh20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <chrubis@suse.cz>
References: <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/timer_settime: timer invokes signal handler
 using timer_settime function.
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
Cc: Prachi Parekh <prachiparekh20@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The testcase is testing signal handler getting invoked by 'periodic timer' and
'absolute timer' for various types of clocks after using timer_settime function.
This is in continuation with pull request #597.

signed-off-by: Prachi Parekh <prachiparekh20@gmail.com>
---
 .../syscalls/timer_settime/timer_settime03.c  | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 testcases/kernel/syscalls/timer_settime/timer_settime03.c

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime03.c b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
new file mode 100644
index 000000000..563f2de3a
--- /dev/null
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime03.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) HCL Technologies Ltd,.  All Rights Reserved.
+ *
+ * Author:	Prachi Parekh <prachi.r@hcl.com>
+ *
+ */
+/*
+ * This tests the timer_settime(2) syscall under various conditions:
+ *
+ * 1) Using a periodic timer invoking signal handler
+ * 2) Using absolute timer invoking signal handler
+ *
+ * All of these tests are supposed to be successful.
+ */
+
+#include <stdlib.h>
+#include <errno.h>
+#include <time.h>
+#include <signal.h>
+#include <stdio.h>
+#include "lapi/common_timers.h"
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+
+#define SIG SIGALRM
+
+static struct timespec timenow;
+static struct itimerspec new_set, old_set;
+static kernel_timer_t timer;
+static volatile int handler_var;
+
+static struct testcase {
+	struct itimerspec	*old_ptr;
+	int			it_value_tv_sec;
+	int			it_value_tv_nsec;
+	int			it_interval_tv_sec;
+	int	         	it_interval_tv_nsec;
+	int			flag;
+	char			*description;
+} tcases[] = {
+	{&old_set, 0, 5, 0, 5, TIMER_ABSTIME, "using absolute timer"},
+	{NULL,     0, 5, 0, 5, 0, "using periodic timer"},
+};
+
+
+static void handler(int sig, siginfo_t *si, void *uc)
+{
+	handler_var = 1;
+}
+
+static void run(unsigned int n)
+{
+	unsigned int i;
+	struct testcase *tc = &tcases[n];
+	tst_res(TINFO, "n = %d", n);
+	unsigned int u_secs = 10000;
+	struct sigevent evp;
+	struct sigaction sa;
+
+	tst_res(TINFO, "Testing for %s:", tc->description);
+
+	for (i = 0; i < CLOCKS_DEFINED; ++i) {
+		clock_t clock = clock_list[i];
+
+		tst_res(TINFO, "i= %d:", i);
+
+		/* Establish handler for timer signal */
+
+		tst_res(TINFO, "Establishing handler for siganl %d:", SIG);
+		sa.sa_flags = SA_SIGINFO;
+		sa.sa_sigaction = handler;
+		sigemptyset(&sa.sa_mask);
+		if (sigaction(SIG, &sa, NULL) == -1)
+			continue;
+
+		evp.sigev_value  = (union sigval) 0;
+		evp.sigev_signo  = SIG;
+		evp.sigev_notify = SIGEV_SIGNAL;
+
+		if (clock == CLOCK_PROCESS_CPUTIME_ID ||
+				clock == CLOCK_THREAD_CPUTIME_ID) {
+			if (!have_cputime_timers())
+				continue;
+		}
+
+		TEST(tst_syscall(__NR_timer_create, clock, &evp, &timer));
+
+		if (TST_RET != 0) {
+			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
+				tst_res(TPASS | TTERRNO,
+						"%s unsupported, failed as expected",
+						get_clock_str(clock));
+			} else {
+				tst_res(TBROK | TTERRNO,
+						"timer_create(%s) failed",
+						get_clock_str(clock));
+			}
+			continue;
+		}
+
+		memset(&new_set, 0, sizeof(new_set));
+		memset(&old_set, 0, sizeof(old_set));
+
+		new_set.it_value.tv_sec = tc->it_value_tv_sec;
+		new_set.it_value.tv_nsec = tc->it_value_tv_sec * 1000000;
+		new_set.it_interval.tv_sec = tc->it_interval_tv_sec;
+		new_set.it_interval.tv_nsec = tc->it_interval_tv_nsec * 1000000;
+
+		if (tc->flag & TIMER_ABSTIME) {
+			if (clock_gettime(clock, &timenow) < 0) {
+				tst_res(TBROK,
+						"clock_gettime(%s) failed - skipping the test",
+						get_clock_str(clock));
+				continue;
+			}
+			new_set.it_value.tv_sec += timenow.tv_sec;
+		}
+
+		TEST(tst_syscall(__NR_timer_settime, timer,
+					tc->flag, &new_set, tc->old_ptr));
+
+		/* sleep for sometime so periodic timer expires in that time*/
+		usleep(u_secs);
+
+		if (handler_var == 0) {
+			tst_res(TFAIL | TTERRNO, "%s failed",
+					get_clock_str(clock));
+		} else {
+			tst_res(TPASS, "%s was successful",
+					get_clock_str(clock));
+
+			handler_var = 0;
+			tst_res(TINFO, "Caught signal %d\n", SIG);
+		}
+	}
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
