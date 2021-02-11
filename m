Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CA31915D
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 18:46:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94A263C6D0D
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 18:46:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 979EB3C5DDB
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 18:46:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 13C9E600C20
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 18:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613065562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TEhYW2cAWG2iWcVoy+JyyBlFaMzwfMAAZts0WR3QXA=;
 b=HLbhgJ5Xs3tRcHB8f6gXKfzpkio5jTielkDy7QKuf4yBRTZwubNGwjEWBff7DlpxpF87yS
 F7/tgsASn/WRv/dagLeI9TOV3uiNujGj7S1aSvvaYNPNtsKjHy+T5tGBxdrxglA4smSsXj
 FhbgmjExG4LCbTbj09cdMIzdYHfQ/F4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6724B12E;
 Thu, 11 Feb 2021 17:46:02 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 17:45:42 +0000
Message-Id: <20210211174543.25003-5-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211174543.25003-1-rpalethorpe@suse.com>
References: <20210211174543.25003-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] API: Add tst_clone
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

The raw clone system call and clone3 have relatively simple interfaces
if the stack pointer is set to NULL. The libc wrapper complicates
things hugely. So introduce an interface similar to clone3, but that
falls back to clone.

Not all features of clone3 are implemented in clone, but we could
either return TCONF or implement them in user land.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/test-writing-guidelines.txt | 27 +++++++++++++++----
 include/tst_clone.h             | 28 ++++++++++++++++++++
 include/tst_test.h              |  2 +-
 lib/tst_clone.c                 | 46 +++++++++++++++++++++++++++++++++
 lib/tst_test.c                  | 25 ++++++++++++++++++
 5 files changed, 122 insertions(+), 6 deletions(-)
 create mode 100644 lib/tst_clone.c

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index f3a55cf26..dd1911ceb 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -547,9 +547,9 @@ void tst_flush(void);
 Flush output streams, handling errors appropriately.
 
 This function is rarely needed when you have to flush the output streams
-before calling 'fork()' or 'clone()'. Note that the 'SAFE_FORK()' calls this
-function automatically. See 3.4 FILE buffers and fork() for explanation why is
-this needed.
+before calling 'fork()' or 'clone()'. Note that the 'SAFE_FORK()' and 'SAFE_CLONE()'
+calls this function automatically. See 3.4 FILE buffers and fork() for explanation
+why is this needed.
 
 2.2.3 Test temporary directory
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -732,10 +732,10 @@ This happens when 'stdout' gets redirected to a file. In this case, the
 'stdout' is not line buffered, but block buffered. Hence after a fork content
 of the buffers will be printed by the parent and each of the children.
 
-To avoid that you should use 'SAFE_FORK()'.
+To avoid that you should use 'SAFE_FORK()', 'SAFE_CLONE()' or 'tst_clone()'.
 
 IMPORTANT: You have to set the '.forks_child' flag in the test structure
-           if your testcase forks.
+           if your testcase forks or calls 'SAFE_CLONE()'.
 
 2.2.8 Doing the test in the child process
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -769,6 +769,23 @@ The 'tst_reap_children()' function makes the process wait for all of its
 children and exits with 'tst_brk(TBROK, ...)' if any of them returned
 a non zero exit code.
 
+When using 'SAFE_CLONE' or 'tst_clone', this may not work depending on
+the parameters passed to clone. The following call to 'SAFE_CLONE' is
+identical to 'fork()', so will work as expected.
+
+[source,c]
+--------------------------------------------------------------------------------
+const struct tst_clone_args args = {
+	.exit_signal = SIGCHLD,
+};
+
+SAFE_CLONE(&args);
+--------------------------------------------------------------------------------
+
+If 'exit_signal' is set to something else, then this will break
+'tst_reap_children'. It's not expected that all parameters to clone will
+work with the LTP library unless specific action is taken by the test code.
+
 .Using 'tst_res()' from binaries started by 'exec()'
 [source,c]
 -------------------------------------------------------------------------------
diff --git a/include/tst_clone.h b/include/tst_clone.h
index 88188525d..9ffdc68d1 100644
--- a/include/tst_clone.h
+++ b/include/tst_clone.h
@@ -5,6 +5,34 @@
 #ifndef TST_CLONE_H__
 #define TST_CLONE_H__
 
+#ifdef TST_TEST_H__
+
+/* The parts of clone3's clone_args we support */
+struct tst_clone_args {
+	uint64_t flags;
+	uint64_t exit_signal;
+};
+
+/* clone3 with fallbacks to clone when possible. Be aware that it
+ * returns -1 if clone3 fails (except ENOSYS), but -2 if clone fails.
+ *
+ * Without CLONE_VM this acts like fork so you may want to set
+ * tst_test.forks_child (safe_clone requires this).
+ *
+ * You should set exit_signal to SIGCHLD for
+ * tst_reap_children. Otherwise you must call wait with the
+ * appropriate parameters.
+ */
+pid_t tst_clone(const struct tst_clone_args *args);
+
+pid_t safe_clone(const char *file, const int lineno,
+		 const struct tst_clone_args *args);
+
+/* "Safe" version of tst_clone */
+#define SAFE_CLONE(args) safe_clone(__FILE__, __LINE__, args)
+
+#endif	/* TST_TEST_H__ */
+
 /* Functions from lib/cloner.c */
 int ltp_clone(unsigned long flags, int (*fn)(void *arg), void *arg,
 		size_t stack_size, void *stack);
diff --git a/include/tst_test.h b/include/tst_test.h
index c87251870..7dab5f761 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -29,7 +29,6 @@
 #include "tst_process_state.h"
 #include "tst_atomic.h"
 #include "tst_kvercmp.h"
-#include "tst_clone.h"
 #include "tst_kernel.h"
 #include "tst_minmax.h"
 #include "tst_get_bad_addr.h"
@@ -94,6 +93,7 @@ pid_t safe_fork(const char *filename, unsigned int lineno);
 #include "tst_safe_macros.h"
 #include "tst_safe_file_ops.h"
 #include "tst_safe_net.h"
+#include "tst_clone.h"
 
 /*
  * Wait for all children and exit with TBROK if
diff --git a/lib/tst_clone.c b/lib/tst_clone.c
new file mode 100644
index 000000000..07e7f0767
--- /dev/null
+++ b/lib/tst_clone.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 SUSE LLC
+ * Richard Palethorpe <rpalethorpe@suse.com>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+
+#include <stddef.h>
+
+#include "tst_test.h"
+#include "lapi/clone.h"
+
+pid_t tst_clone(const struct tst_clone_args *tst_args)
+{
+	struct clone_args args = {
+		.flags = tst_args->flags,
+		.exit_signal = tst_args->exit_signal,
+	};
+	int flags;
+	pid_t pid = -1;
+
+	tst_flush();
+
+	errno = ENOSYS;
+	if (__NR_clone3 != __LTP__NR_INVALID_SYSCALL)
+		pid = syscall(__NR_clone3, &args, sizeof(args));
+
+	if (pid == -1 && errno != ENOSYS)
+		return -1;
+
+	if (pid != -1)
+		return pid;
+
+	flags = args.exit_signal | args.flags;
+
+#ifdef __s390x__
+	pid = syscall(__NR_clone, NULL, flags);
+#else
+	pid = syscall(__NR_clone, flags, NULL);
+#endif
+
+	if (pid == -1)
+		return -2;
+
+	return pid;
+}
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 0714f0a0e..6bbee030b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -424,6 +424,31 @@ pid_t safe_fork(const char *filename, unsigned int lineno)
 	return pid;
 }
 
+pid_t safe_clone(const char *file, const int lineno,
+		 const struct tst_clone_args *args)
+{
+	pid_t pid;
+
+	if (!tst_test->forks_child)
+		tst_brk(TBROK, "test.forks_child must be set!");
+
+	pid = tst_clone(args);
+
+	switch (pid) {
+	case -1:
+		tst_brk_(file, lineno, TBROK | TERRNO, "clone3 failed");
+		break;
+	case -2:
+		tst_brk_(file, lineno, TBROK | TERRNO, "clone failed");
+		return -1;
+	}
+
+	if (!pid)
+		atexit(tst_free_all);
+
+	return pid;
+}
+
 static struct option {
 	char *optstr;
 	char *help;
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
