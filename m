Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDAA32EF58
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 16:51:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAE7F3C5651
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 16:51:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 69CF83C564E
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 16:51:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BDF9C20077D
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 16:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614959501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kuu4UqfbCKvQPVl0UzuQp/k4e/3yt9yCXcQJHVthPzk=;
 b=uVX2wC7X+Dets8RxcLD3HEbjYwX2IOMDVD/3IBrjhHXlI65x1SNJ/BrgP/trubi67xFf7G
 v2MdZOVPp0uXiV9d+dViB7ey4yGfmhfImslhV57Tk2yPMaPr6eTWuCtNbE8FvfW6gs+0MG
 hoHCUfrNVldDoJ8vpEjhkt5JuZNg1Q0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29B96AD3B;
 Fri,  5 Mar 2021 15:51:41 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  5 Mar 2021 15:51:18 +0000
Message-Id: <20210305155123.18199-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305155123.18199-1-rpalethorpe@suse.com>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/6] fzsync: Add self test
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a validation test for the Fuzz Sync library. It has a range of
data races which Fuzzy Sync must reproduce. This is much easier to
setup and run than reproducing real kernel bugs.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/newlib_tests/.gitignore         |   1 +
 lib/newlib_tests/test16.c           |   2 +
 lib/newlib_tests/tst_fuzzy_sync01.c | 233 ++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync01.c

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 6c2612259..bb235f433 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -40,3 +40,4 @@ tst_bool_expr
 test_macros01
 test_macros02
 test_macros03
+tst_fuzzy_sync01
\ No newline at end of file
diff --git a/lib/newlib_tests/test16.c b/lib/newlib_tests/test16.c
index 0d74e1eae..7a9b5f20e 100644
--- a/lib/newlib_tests/test16.c
+++ b/lib/newlib_tests/test16.c
@@ -9,6 +9,8 @@
  * which they should take it in turns to update.
  */
 
+#define _GNU_SOURCE
+
 #include <stdlib.h>
 #include "tst_test.h"
 #include "tst_safe_pthread.h"
diff --git a/lib/newlib_tests/tst_fuzzy_sync01.c b/lib/newlib_tests/tst_fuzzy_sync01.c
new file mode 100644
index 000000000..22b78977a
--- /dev/null
+++ b/lib/newlib_tests/tst_fuzzy_sync01.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "tst_fuzzy_sync.h"
+
+enum race_window_state {
+	/* We are in a race window which will cause behaviour that has
+	 * very different timings to the target. We must avoid these
+	 * race windows. */
+	TOO_EARLY,
+	TOO_LATE,
+	/* We are not in the target race window, but the timings of
+	 * this behaviour are similar to those of the target. */
+	EARLY_OR_LATE,
+	/* We in the target race window */
+	CRITICAL,
+};
+
+enum wait_with {
+	SPIN,
+	SLEEP,
+};
+
+struct window {
+	const enum wait_with type;
+	const int time;
+};
+
+struct race_shape {
+	const struct window too_early;
+	const struct window early;
+	const struct window critical;
+	const struct window late;
+	const struct window too_late;
+};
+
+struct scenario {
+	const char *const name;
+	const struct race_shape a;
+	const struct race_shape b;
+};
+
+static struct tst_fzsync_pair pair;
+
+static volatile enum race_window_state state;
+
+static const struct scenario races[] = {
+	{ "No delay",
+	  {{SPIN, 0 }, {SPIN, 0 }, {SPIN, 100 }, {SPIN, 0 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SPIN, 0 }, {SPIN, 100 }, {SPIN, 0 }, {SPIN, 0 }},
+	},
+	{ "Exit aligned",
+	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 10 }, {SPIN, 0 }},
+	},
+	{ "Entry aligned",
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SLEEP, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SLEEP, 1 }, {SPIN, 0 }},
+	},
+	{ "delay A entry",
+	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
+	},
+	{ "delay B entry",
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
+	},
+	{ "delay A exit",
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SLEEP, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
+	},
+	{ "delay B exit",
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
+	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SLEEP, 1 }, {SPIN, 0 }},
+	},
+	{ "too early",
+	  {{SPIN, 10 }, {SLEEP, 1 }, {SPIN, 100 }, {SPIN, 100 }, {SPIN, 0 }},
+	  {{SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 10 }, {SPIN, 0 }},
+	},
+	{ "too late",
+	  {{SPIN, 10000 }, {SLEEP, 1 }, {SPIN, 100 }, {SPIN, 100 }, {SPIN, 10 }},
+	  {{SPIN, 0 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 10 }},
+	},
+};
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&pair);
+}
+
+static void setup(void)
+{
+	pair.min_samples = 10000;
+
+	tst_fzsync_pair_init(&pair);
+}
+
+static void delay(struct window w)
+{
+	struct timespec ts = { 0, w.time };
+	volatile int time = w.time;
+
+	if (pair.yield_in_wait)
+		time /= 100;
+
+	switch(w.type) {
+	case SPIN:
+		while (time--) {
+			if (pair.yield_in_wait)
+				sched_yield();
+		}
+		break;
+	case SLEEP:
+		nanosleep(&ts, NULL);
+		break;
+	}
+}
+
+static void *worker(void *v)
+{
+	unsigned int i = *(unsigned int *)v;
+	const struct race_shape *r = &races[i].b;
+
+	while (tst_fzsync_run_b(&pair)) {
+		state = EARLY_OR_LATE;
+
+		tst_fzsync_start_race_b(&pair);
+		if (r->too_early.time) {
+			state = TOO_EARLY;
+			delay(r->too_early);
+		}
+
+		state = EARLY_OR_LATE;
+		delay(r->early);
+
+		state = CRITICAL;
+		delay(r->critical);
+
+		state = EARLY_OR_LATE;
+		delay(r->late);
+
+		if (r->too_late.time) {
+			state = TOO_LATE;
+			delay(r->too_late);
+		}
+		tst_fzsync_end_race_b(&pair);
+	}
+
+	return NULL;
+}
+
+static void run(unsigned int i)
+{
+	const struct race_shape *r = &races[i].a;
+	struct tst_fzsync_run_thread wrap_run_b = {
+		.func = worker,
+		.arg = &i,
+	};
+	int too_early = 0, early_or_late = 0, critical = 0, too_late = 0;
+	enum race_window_state state_copy;
+
+
+	tst_fzsync_pair_reset(&pair, NULL);
+	SAFE_PTHREAD_CREATE(&pair.thread_b, 0, tst_fzsync_thread_wrapper,
+			    &wrap_run_b);
+
+	while (tst_fzsync_run_a(&pair)) {
+		tst_fzsync_start_race_a(&pair);
+
+		delay(r->too_early);
+		state_copy = state;
+
+		switch(state_copy) {
+		case TOO_EARLY:
+		case TOO_LATE:
+			break;
+		default:
+			delay(r->early);
+			state_copy = state;
+		}
+
+		switch(state_copy) {
+		case TOO_EARLY:
+			too_early++;
+			break;
+		case EARLY_OR_LATE:
+			early_or_late++;
+			delay(r->late);
+			break;
+		case CRITICAL:
+			critical++;
+			delay(r->critical);
+			break;
+		case TOO_LATE:
+			too_late++;
+			delay(r->too_late);
+			break;
+		default:
+			tst_brk(TBROK, "enum is not atomic?");
+		}
+		tst_fzsync_end_race_a(&pair);
+
+		switch(state_copy) {
+		case TOO_EARLY:
+			tst_fzsync_pair_add_bias(&pair, -10);
+			break;
+		case TOO_LATE:
+			tst_fzsync_pair_add_bias(&pair, 10);
+			break;
+		default:
+			;
+		}
+
+		if (critical > 100) {
+			tst_fzsync_pair_cleanup(&pair);
+			break;
+		}
+	}
+
+	tst_res(critical ? TPASS : TFAIL, "%20s) =%-4d ~%-4d -%-4d +%-4d",
+		races[i].name, critical, early_or_late, too_early, too_late);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(races),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
