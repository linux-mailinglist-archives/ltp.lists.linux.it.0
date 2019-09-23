Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE2BB49D
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 14:59:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E4983C2015
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 14:59:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6A97F3C1809
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 14:59:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 522CF601D0C
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 14:59:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84FECACA4;
 Mon, 23 Sep 2019 12:59:23 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Mon, 23 Sep 2019 14:59:14 +0200
Message-Id: <20190923125914.2572-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] fzsync: Add reproducing race-conditions section to
 docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Give people some hint about how to do this with the Fuzzy Sync library. This
is really just a pointer. A full explanation would require way too much detail
for this document.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/test-writing-guidelines.txt | 79 +++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index a735b43bb..49cc92a27 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1854,6 +1854,85 @@ However a lot of problems can be solved by using 'tst_cap_action(struct
 tst_cap  *cap)' directly which can be called at any time. This also helps if
 you wish to drop a capability at the begining of setup.
 
+2.2.33 Reproducing race-conditions
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If a bug is caused by two tasks in the kernel racing and you wish to create a
+regression test (or bug-fix validation test). The 'tst_fuzzy_sync.h' library
+should be used.
+
+It allows you to specify, in your code, two race windows. One window in each
+thread's loop (triggering a race usually requires many iterations). These
+windows show fuzzy-sync where the race can happen. They don't need to be
+exact, hence the 'fuzzy' part. If the race condition is not immediately
+triggered then the library will begin experimenting with different timings.
+
+[source,c]
+--------------------------------------------------------------------------------
+#include "tst_fuzzy_sync.h"
+
+static struct tst_fzsync_pair fzsync_pair;
+
+static void setup(void)
+{
+        tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+}
+
+static void *thread_b(void *arg)
+{
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+
+		tst_fzsync_start_race_b(&fzsync_pair);
+
+                /* This is the race window for thread B */
+
+                tst_fzsync_end_race_b(&fzsync_pair);
+	}
+
+	return arg;
+}
+
+static void thread_a(void)
+{
+	tst_fzsync_pair_reset(&fzsync_pair, thread_b);
+
+        while (tst_fzsync_run_a(&fzsync_pair)) {
+
+		tst_fzsync_start_race_a(&fzsync_pair);
+
+		/* This is the race window for thread A */
+
+                tst_fzsync_end_race_a(&fzsync_pair);
+	}
+}
+
+static struct tst_test test = {
+	.test_all = thread_a,
+	.setup = setup,
+	.cleanup = cleanup,
+};
+--------------------------------------------------------------------------------
+
+Above is a minimal template for a test using fuzzy-sync. In a simple case, you
+just need to put the bits you want to race inbetween 'start_race' and
+'end_race'. Meanwhile, any setup you need to do per-iteration goes outside the
+windows.
+
+Fuzzy sync synchronises 'run_a' and 'run_b', which act as barriers, so that
+niether thread can progress until the other has caught up with it. There is
+also the 'pair_wait' function which can be used to add barriers in other
+locations. Of course 'start/end_race_a/b' are also a barriers.
+
+The library decides how long the test should run for based on the timeout
+specified by the user plus some other heuristics.
+
+For full documentation see the comments in 'include/tst_fuzzy_sync.h'.
+
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
