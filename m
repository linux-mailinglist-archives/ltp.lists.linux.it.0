Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CF7AD6EA
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Sep 2023 13:23:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4554E3CDD33
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Sep 2023 13:23:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C6B93CE229
 for <ltp@lists.linux.it>; Mon, 25 Sep 2023 13:22:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EF2B72001CF
 for <ltp@lists.linux.it>; Mon, 25 Sep 2023 13:22:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A1D621853;
 Mon, 25 Sep 2023 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1695640976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hJxthcYoA9cl9v8vY8dXywt+5BOGsbX/b42iAVV6KQ=;
 b=RRTODocbZt7vxSy4V8jiSb055jFu7DsO8UWKlYpP2DalrYZct0sj2pC1q6nJkeQeDbtEoS
 E0W2C7ro8GLMDi9kfmbSmc3i0i9MtFNTu9/5I0T3Q2GtQq3t0Swvh4ydSUhphmio9YFfQl
 fIMO3hA69I+5lDv3N4hAVxDXF5+gu8M=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F2D61358F;
 Mon, 25 Sep 2023 11:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qCZCCI9tEWXrRQAAMHmgww
 (envelope-from <wegao@suse.com>); Mon, 25 Sep 2023 11:22:55 +0000
To: ltp@lists.linux.it
Date: Mon, 25 Sep 2023 07:22:45 -0400
Message-Id: <20230925112245.30701-3-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230925112245.30701-1-wegao@suse.com>
References: <20230925112245.30701-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] ptrace06: Refactor the test using new LTP API
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/ptrace/ptrace06.c | 306 +++++++++++---------
 1 file changed, 175 insertions(+), 131 deletions(-)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace06.c b/testcases/kernel/syscalls/ptrace/ptrace06.c
index c0cb3b9bd..5829faea4 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace06.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace06.c
@@ -1,32 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2008 Analog Devices Inc.
+ * Copyright (c) 2023 Wei Gao <wegao@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
  * check out-of-bound/unaligned addresses given to
  *  - {PEEK,POKE}{DATA,TEXT,USER}
  *  - {GET,SET}{,FG}REGS
  *  - {GET,SET}SIGINFO
  *
- * Copyright (c) 2008 Analog Devices Inc.
- *
- * Licensed under the GPL-2 or later
  */
 
 #define _GNU_SOURCE
 
-#include <errno.h>
-#include <stdbool.h>
-#include <stdio.h>
 #include <stdlib.h>
-#include <unistd.h>
-
 #include <config.h>
-#include "ptrace.h"
 
-#include "test.h"
-#include "spawn_ptrace_child.h"
-#include "config.h"
+#include "ptrace.h"
+#include "tst_test.h"
 
 /* this should be sizeof(struct user), but that info is only found
  * in the kernel asm/user.h which is not exported to userspace.
  */
+
 #if defined(__i386__)
 #define SIZEOF_USER 284
 #elif defined(__x86_64__)
@@ -35,168 +34,213 @@
 #define SIZEOF_USER 0x1000	/* just pick a big number */
 #endif
 
-char *TCID = "ptrace06";
-
 struct test_case_t {
 	int request;
 	long addr;
 	long data;
 } test_cases[] = {
 	{
-	PTRACE_PEEKDATA,.addr = 0}, {
-	PTRACE_PEEKDATA,.addr = 1}, {
-	PTRACE_PEEKDATA,.addr = 2}, {
-	PTRACE_PEEKDATA,.addr = 3}, {
-	PTRACE_PEEKDATA,.addr = -1}, {
-	PTRACE_PEEKDATA,.addr = -2}, {
-	PTRACE_PEEKDATA,.addr = -3}, {
-	PTRACE_PEEKDATA,.addr = -4}, {
-	PTRACE_PEEKTEXT,.addr = 0}, {
-	PTRACE_PEEKTEXT,.addr = 1}, {
-	PTRACE_PEEKTEXT,.addr = 2}, {
-	PTRACE_PEEKTEXT,.addr = 3}, {
-	PTRACE_PEEKTEXT,.addr = -1}, {
-	PTRACE_PEEKTEXT,.addr = -2}, {
-	PTRACE_PEEKTEXT,.addr = -3}, {
-	PTRACE_PEEKTEXT,.addr = -4}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 1}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 2}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 3}, {
-	PTRACE_PEEKUSER,.addr = SIZEOF_USER + 4}, {
-	PTRACE_PEEKUSER,.addr = -1}, {
-	PTRACE_PEEKUSER,.addr = -2}, {
-	PTRACE_PEEKUSER,.addr = -3}, {
-	PTRACE_PEEKUSER,.addr = -4}, {
-	PTRACE_POKEDATA,.addr = 0}, {
-	PTRACE_POKEDATA,.addr = 1}, {
-	PTRACE_POKEDATA,.addr = 2}, {
-	PTRACE_POKEDATA,.addr = 3}, {
-	PTRACE_POKEDATA,.addr = -1}, {
-	PTRACE_POKEDATA,.addr = -2}, {
-	PTRACE_POKEDATA,.addr = -3}, {
-	PTRACE_POKEDATA,.addr = -4}, {
-	PTRACE_POKETEXT,.addr = 0}, {
-	PTRACE_POKETEXT,.addr = 1}, {
-	PTRACE_POKETEXT,.addr = 2}, {
-	PTRACE_POKETEXT,.addr = 3}, {
-	PTRACE_POKETEXT,.addr = -1}, {
-	PTRACE_POKETEXT,.addr = -2}, {
-	PTRACE_POKETEXT,.addr = -3}, {
-	PTRACE_POKETEXT,.addr = -4}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 1}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 2}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 3}, {
-	PTRACE_POKEUSER,.addr = SIZEOF_USER + 4}, {
-	PTRACE_POKEUSER,.addr = -1}, {
-	PTRACE_POKEUSER,.addr = -2}, {
-	PTRACE_POKEUSER,.addr = -3}, {
-	PTRACE_POKEUSER,.addr = -4},
+	PTRACE_PEEKDATA, .addr = 0}, {
+	PTRACE_PEEKDATA, .addr = 1}, {
+	PTRACE_PEEKDATA, .addr = 2}, {
+	PTRACE_PEEKDATA, .addr = 3}, {
+	PTRACE_PEEKDATA, .addr = -1}, {
+	PTRACE_PEEKDATA, .addr = -2}, {
+	PTRACE_PEEKDATA, .addr = -3}, {
+	PTRACE_PEEKDATA, .addr = -4}, {
+	PTRACE_PEEKTEXT, .addr = 0}, {
+	PTRACE_PEEKTEXT, .addr = 1}, {
+	PTRACE_PEEKTEXT, .addr = 2}, {
+	PTRACE_PEEKTEXT, .addr = 3}, {
+	PTRACE_PEEKTEXT, .addr = -1}, {
+	PTRACE_PEEKTEXT, .addr = -2}, {
+	PTRACE_PEEKTEXT, .addr = -3}, {
+	PTRACE_PEEKTEXT, .addr = -4}, {
+	PTRACE_PEEKUSER, .addr = SIZEOF_USER + 1}, {
+	PTRACE_PEEKUSER, .addr = SIZEOF_USER + 2}, {
+	PTRACE_PEEKUSER, .addr = SIZEOF_USER + 3}, {
+	PTRACE_PEEKUSER, .addr = SIZEOF_USER + 4}, {
+	PTRACE_PEEKUSER, .addr = -1}, {
+	PTRACE_PEEKUSER, .addr = -2}, {
+	PTRACE_PEEKUSER, .addr = -3}, {
+	PTRACE_PEEKUSER, .addr = -4}, {
+	PTRACE_POKEDATA, .addr = 0}, {
+	PTRACE_POKEDATA, .addr = 1}, {
+	PTRACE_POKEDATA, .addr = 2}, {
+	PTRACE_POKEDATA, .addr = 3}, {
+	PTRACE_POKEDATA, .addr = -1}, {
+	PTRACE_POKEDATA, .addr = -2}, {
+	PTRACE_POKEDATA, .addr = -3}, {
+	PTRACE_POKEDATA, .addr = -4}, {
+	PTRACE_POKETEXT, .addr = 0}, {
+	PTRACE_POKETEXT, .addr = 1}, {
+	PTRACE_POKETEXT, .addr = 2}, {
+	PTRACE_POKETEXT, .addr = 3}, {
+	PTRACE_POKETEXT, .addr = -1}, {
+	PTRACE_POKETEXT, .addr = -2}, {
+	PTRACE_POKETEXT, .addr = -3}, {
+	PTRACE_POKETEXT, .addr = -4}, {
+	PTRACE_POKEUSER, .addr = SIZEOF_USER + 1}, {
+	PTRACE_POKEUSER, .addr = SIZEOF_USER + 2}, {
+	PTRACE_POKEUSER, .addr = SIZEOF_USER + 3}, {
+	PTRACE_POKEUSER, .addr = SIZEOF_USER + 4}, {
+	PTRACE_POKEUSER, .addr = -1}, {
+	PTRACE_POKEUSER, .addr = -2}, {
+	PTRACE_POKEUSER, .addr = -3}, {
+	PTRACE_POKEUSER, .addr = -4},
 #ifdef PTRACE_GETREGS
 	{
-	PTRACE_GETREGS,.data = 0}, {
-	PTRACE_GETREGS,.data = 1}, {
-	PTRACE_GETREGS,.data = 2}, {
-	PTRACE_GETREGS,.data = 3}, {
-	PTRACE_GETREGS,.data = -1}, {
-	PTRACE_GETREGS,.data = -2}, {
-	PTRACE_GETREGS,.data = -3}, {
-	PTRACE_GETREGS,.data = -4},
+	PTRACE_GETREGS, .data = 0}, {
+	PTRACE_GETREGS, .data = 1}, {
+	PTRACE_GETREGS, .data = 2}, {
+	PTRACE_GETREGS, .data = 3}, {
+	PTRACE_GETREGS, .data = -1}, {
+	PTRACE_GETREGS, .data = -2}, {
+	PTRACE_GETREGS, .data = -3}, {
+	PTRACE_GETREGS, .data = -4},
 #endif
 #ifdef PTRACE_GETFGREGS
 	{
-	PTRACE_GETFGREGS,.data = 0}, {
-	PTRACE_GETFGREGS,.data = 1}, {
-	PTRACE_GETFGREGS,.data = 2}, {
-	PTRACE_GETFGREGS,.data = 3}, {
-	PTRACE_GETFGREGS,.data = -1}, {
-	PTRACE_GETFGREGS,.data = -2}, {
-	PTRACE_GETFGREGS,.data = -3}, {
-	PTRACE_GETFGREGS,.data = -4},
+	PTRACE_GETFGREGS, .data = 0}, {
+	PTRACE_GETFGREGS, .data = 1}, {
+	PTRACE_GETFGREGS, .data = 2}, {
+	PTRACE_GETFGREGS, .data = 3}, {
+	PTRACE_GETFGREGS, .data = -1}, {
+	PTRACE_GETFGREGS, .data = -2}, {
+	PTRACE_GETFGREGS, .data = -3}, {
+	PTRACE_GETFGREGS, .data = -4},
 #endif
 #ifdef PTRACE_SETREGS
 	{
-	PTRACE_SETREGS,.data = 0}, {
-	PTRACE_SETREGS,.data = 1}, {
-	PTRACE_SETREGS,.data = 2}, {
-	PTRACE_SETREGS,.data = 3}, {
-	PTRACE_SETREGS,.data = -1}, {
-	PTRACE_SETREGS,.data = -2}, {
-	PTRACE_SETREGS,.data = -3}, {
-	PTRACE_SETREGS,.data = -4},
+	PTRACE_SETREGS, .data = 0}, {
+	PTRACE_SETREGS, .data = 1}, {
+	PTRACE_SETREGS, .data = 2}, {
+	PTRACE_SETREGS, .data = 3}, {
+	PTRACE_SETREGS, .data = -1}, {
+	PTRACE_SETREGS, .data = -2}, {
+	PTRACE_SETREGS, .data = -3}, {
+	PTRACE_SETREGS, .data = -4},
 #endif
 #ifdef PTRACE_SETFGREGS
 	{
-	PTRACE_SETFGREGS,.data = 0}, {
-	PTRACE_SETFGREGS,.data = 1}, {
-	PTRACE_SETFGREGS,.data = 2}, {
-	PTRACE_SETFGREGS,.data = 3}, {
-	PTRACE_SETFGREGS,.data = -1}, {
-	PTRACE_SETFGREGS,.data = -2}, {
-	PTRACE_SETFGREGS,.data = -3}, {
-	PTRACE_SETFGREGS,.data = -4},
+	PTRACE_SETFGREGS, .data = 0}, {
+	PTRACE_SETFGREGS, .data = 1}, {
+	PTRACE_SETFGREGS, .data = 2}, {
+	PTRACE_SETFGREGS, .data = 3}, {
+	PTRACE_SETFGREGS, .data = -1}, {
+	PTRACE_SETFGREGS, .data = -2}, {
+	PTRACE_SETFGREGS, .data = -3}, {
+	PTRACE_SETFGREGS, .data = -4},
 #endif
 #if HAVE_DECL_PTRACE_GETSIGINFO
 	{
-	PTRACE_GETSIGINFO,.data = 0}, {
-	PTRACE_GETSIGINFO,.data = 1}, {
-	PTRACE_GETSIGINFO,.data = 2}, {
-	PTRACE_GETSIGINFO,.data = 3}, {
-	PTRACE_GETSIGINFO,.data = -1}, {
-	PTRACE_GETSIGINFO,.data = -2}, {
-	PTRACE_GETSIGINFO,.data = -3}, {
-	PTRACE_GETSIGINFO,.data = -4},
+	PTRACE_GETSIGINFO, .data = 0}, {
+	PTRACE_GETSIGINFO, .data = 1}, {
+	PTRACE_GETSIGINFO, .data = 2}, {
+	PTRACE_GETSIGINFO, .data = 3}, {
+	PTRACE_GETSIGINFO, .data = -1}, {
+	PTRACE_GETSIGINFO, .data = -2}, {
+	PTRACE_GETSIGINFO, .data = -3}, {
+	PTRACE_GETSIGINFO, .data = -4},
 #endif
 #if HAVE_DECL_PTRACE_SETSIGINFO
 	{
-	PTRACE_SETSIGINFO,.data = 0}, {
-	PTRACE_SETSIGINFO,.data = 1}, {
-	PTRACE_SETSIGINFO,.data = 2}, {
-	PTRACE_SETSIGINFO,.data = 3}, {
-	PTRACE_SETSIGINFO,.data = -1}, {
-	PTRACE_SETSIGINFO,.data = -2}, {
-	PTRACE_SETSIGINFO,.data = -3}, {
-	PTRACE_SETSIGINFO,.data = -4},
+	PTRACE_SETSIGINFO, .data = 0}, {
+	PTRACE_SETSIGINFO, .data = 1}, {
+	PTRACE_SETSIGINFO, .data = 2}, {
+	PTRACE_SETSIGINFO, .data = 3}, {
+	PTRACE_SETSIGINFO, .data = -1}, {
+	PTRACE_SETSIGINFO, .data = -2}, {
+	PTRACE_SETSIGINFO, .data = -3}, {
+	PTRACE_SETSIGINFO, .data = -4},
+#endif
+};
+
+#define SPT(x) [PTRACE_##x] = #x,
+static char *strings[] = {
+	SPT(TRACEME)
+	SPT(PEEKTEXT)
+	SPT(PEEKDATA)
+	SPT(PEEKUSER)
+	SPT(POKETEXT)
+	SPT(POKEDATA)
+	SPT(POKEUSER)
+#ifdef PTRACE_GETREGS
+	SPT(GETREGS)
+#endif
+#ifdef PTRACE_SETREGS
+	SPT(SETREGS)
+#endif
+#ifdef PTRACE_GETSIGINFO
+	SPT(GETSIGINFO)
+#endif
+#ifdef PTRACE_SETSIGINFO
+	SPT(SETSIGINFO)
+#endif
+#ifdef PTRACE_GETFGREGS
+	SPT(GETFGREGS)
+#endif
+#ifdef PTRACE_SETFGREGS
+	SPT(SETFGREGS)
 #endif
+	SPT(KILL)
+	SPT(SINGLESTEP)
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
+static inline char *strptrace(int request)
+{
+	return strings[request];
+}
+
+static void child(void)
+{
+	SAFE_PTRACE(PTRACE_TRACEME, 0, NULL, NULL);
+	execl("/bin/echo", "/bin/echo", NULL);
+	exit(0);
+}
 
-int main(int argc, char *argv[])
+static void run(void)
 {
 	size_t i;
-	long ret;
-	int saved_errno;
+	int pid;
+	int status;
 
-	tst_parse_opts(argc, argv, NULL, NULL);
+	pid = SAFE_FORK();
 
-	make_a_baby(argc, argv);
+	if (!pid)
+		child();
+
+	SAFE_WAIT(&status);
+
+	if (!WIFSTOPPED(status))
+		tst_brk(TBROK, "child %d was not stopped", pid);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); ++i) {
 		struct test_case_t *tc = &test_cases[i];
 
-		errno = 0;
-		ret =
-		    ptrace(tc->request, pid, (void *)tc->addr,
-			   (void *)tc->data);
-		saved_errno = errno;
-		if (ret != -1)
-			tst_resm(TFAIL,
+		TEST(ptrace(tc->request, pid, (void *)tc->addr,
+					(void *)tc->data));
+		if (TST_RET != -1)
+			tst_brk(TFAIL | TERRNO,
 				 "ptrace(%s, ..., %li, %li) returned %li instead of -1",
 				 strptrace(tc->request), tc->addr, tc->data,
-				 ret);
-		else if (saved_errno != EIO && saved_errno != EFAULT)
-			tst_resm(TFAIL,
+				 TST_RET);
+		else if (TST_ERR != EIO && TST_ERR != EFAULT)
+			tst_brk(TFAIL | TERRNO,
 				 "ptrace(%s, ..., %li, %li) expected errno EIO or EFAULT; actual: %i (%s)",
 				 strptrace(tc->request), tc->addr, tc->data,
-				 saved_errno, strerror(saved_errno));
+				 TST_ERR, strerror(TST_ERR));
 		else
-			tst_resm(TPASS,
+			tst_res(TPASS,
 				 "ptrace(%s, ..., %li, %li) failed as expected",
 				 strptrace(tc->request), tc->addr, tc->data);
 	}
 
-	/* hopefully this worked */
-	ptrace(PTRACE_KILL, pid, NULL, NULL);
+	SAFE_PTRACE(PTRACE_CONT, pid, NULL, NULL);
 
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
