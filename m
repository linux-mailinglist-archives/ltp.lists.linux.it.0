Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73143886934
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 10:28:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3B83CC16E
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 10:28:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63CFB3CB170
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 10:28:35 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 25840617614
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 10:28:34 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C5BE38335;
 Fri, 22 Mar 2024 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711099713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Mc+lKXIjmUROVpIr9B74AnwkxgWe2gpOODZv9DdMT3E=;
 b=vsfucwbIw/Zx0cTEhKLsx7MyrULf9NOm3OuUcKXRYak+H1TuITI0oO4cAVBe/iKhh4O/QV
 LHZUeEusS5BurYhyL5yAh5eSuhp4tprXPSTPw1HzZKUjjx6t3QzQ0+Jl1bpeUKhONVNw2R
 jJx4i+WUqnC5pZJtBpi5vAq+xH4m4YQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711099713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Mc+lKXIjmUROVpIr9B74AnwkxgWe2gpOODZv9DdMT3E=;
 b=ImYNRsMrGo/tJ5QoXKQ8FA8zIVQw6nV1WnmiUC3rc33YdXeV9+C2cd7fSwan1h73Oj3KuB
 MrzsNZTCNMpnr1CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711099713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Mc+lKXIjmUROVpIr9B74AnwkxgWe2gpOODZv9DdMT3E=;
 b=vsfucwbIw/Zx0cTEhKLsx7MyrULf9NOm3OuUcKXRYak+H1TuITI0oO4cAVBe/iKhh4O/QV
 LHZUeEusS5BurYhyL5yAh5eSuhp4tprXPSTPw1HzZKUjjx6t3QzQ0+Jl1bpeUKhONVNw2R
 jJx4i+WUqnC5pZJtBpi5vAq+xH4m4YQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711099713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Mc+lKXIjmUROVpIr9B74AnwkxgWe2gpOODZv9DdMT3E=;
 b=ImYNRsMrGo/tJ5QoXKQ8FA8zIVQw6nV1WnmiUC3rc33YdXeV9+C2cd7fSwan1h73Oj3KuB
 MrzsNZTCNMpnr1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 462E5136AD;
 Fri, 22 Mar 2024 09:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bwqfDkFP/WVJRgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 22 Mar 2024 09:28:33 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 22 Mar 2024 10:28:32 +0100
Message-Id: <20240322092832.14955-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3] Refactor fork05 using new LTP API
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
simplified documentation
TST_ABI32 usage
exit(0)
check if child crashed

 testcases/kernel/syscalls/fork/fork05.c | 239 ++++++++----------------
 1 file changed, 77 insertions(+), 162 deletions(-)

diff --git a/testcases/kernel/syscalls/fork/fork05.c b/testcases/kernel/syscalls/fork/fork05.c
index 9a99cff1d..10ae5258a 100644
--- a/testcases/kernel/syscalls/fork/fork05.c
+++ b/testcases/kernel/syscalls/fork/fork05.c
@@ -1,150 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- * Portions Copyright (c) 2000 Ulrich Drepper
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com$
- *
- * For further information regarding this notice, see:$
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- *
- *
- *    Linux Test Project - Silicon Graphics, Inc.
- *    TEST IDENTIFIER	: fork05
- *    EXECUTED BY	: anyone
- *    TEST TITLE	: Make sure LDT is propagated correctly
- *    TEST CASE TOTAL	: 1
- *    CPU TYPES		: i386
- *    AUTHORS		: Ulrich Drepper
- *			  Nate Straz
- *
- *On Friday, May 2, 2003 at 09:47:00AM MST, Ulrich Drepper wrote:
- *>Robert Williamson wrote:
- *>
- *>>   I'm getting a SIGSEGV with one of our tests, fork05.c, that apparently
- *>> you wrote (attached below).  The test passes on my 2.5.68 machine running
- *>> SuSE 8.0 (glibc 2.2.5 and Linuxthreads), however it segmentation faults on
- *>> RedHat 9 running 2.5.68.  The test seems to "break" when it attempts to run
- *>> the assembly code....could you take a look at it?
- *>
- *>There is no need to look at it, I know it cannot work anymore on recent
- *>systems.  Either change all uses of %gs to %fs or skip the entire patch
- *>if %gs has a nonzero value.
- *>
- *>- --
- *>- --------------.                        ,-.            444 Castro Street
- *>Ulrich Drepper \    ,-----------------'   \ Mountain View, CA 94041 USA
- *>Red Hat         `--' drepper at redhat.com `---------------------------
- *
+ *     Author: Ulrich Drepper / Nate Straz , Red Hat
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
  *
+ * This test verifies that LDT is propagated correctly from parent process to
+ * the child process.
  *
- *On Sat, Aug 12, 2000 at 12:47:31PM -0700, Ulrich Drepper wrote:
- *> Ever since the %gs handling was fixed in the 2.3.99 series the
- *> appended test program worked.  Now with 2.4.0-test6 it's not working
- *> again.  Looking briefly over the patch from test5 to test6 I haven't
- *> seen an immediate candidate for the breakage.  It could be missing
- *> propagation of the LDT to the new process (and therefore an invalid
- *> segment descriptor) or simply clearing %gs.
- *>
- *> Anyway, this is what you should see and what you get with test5:
- *>
- *> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *> a = 42
- *> %gs = 0x0007
- *> %gs = 0x0007
- *> a = 99
- *> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *>
- *> This is what you get with test6:
- *>
- *> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *> a = 42
- *> %gs = 0x0007
- *> %gs = 0x0000
- *> <SEGFAULT>
- *> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *>
- *> If somebody is actually creating a test suite for the kernel, please
- *> add this program.  It's mostly self-contained.  The correct handling
- *> of %gs is really important since glibc 2.2 will make heavy use of it.
- *>
- *> - --
- *> - ---------------.                          ,-.   1325 Chesapeake Terrace
- *> Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
- *> Red Hat          `--' drepper at redhat.com   `------------------------
- *>
- *> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * On Friday, May 2, 2003 at 09:47:00AM MST, Ulrich Drepper wrote:
+ * >Robert Williamson wrote:
+ * >
+ * >>   I'm getting a SIGSEGV with one of our tests, fork05.c, that apparently
+ * >> you wrote (attached below).  The test passes on my 2.5.68 machine running
+ * >> SuSE 8.0 (glibc 2.2.5 and Linuxthreads), however it segmentation faults on
+ * >> RedHat 9 running 2.5.68.  The test seems to "break" when it attempts to run
+ * >> the assembly code....could you take a look at it?
+ * >
+ * >There is no need to look at it, I know it cannot work anymore on recent
+ * >systems.  Either change all uses of %gs to %fs or skip the entire patch
+ * >if %gs has a nonzero value.
+ * >
  *
+ * On Sat, Aug 12, 2000 at 12:47:31PM -0700, Ulrich Drepper wrote:
+ * > Ever since the %gs handling was fixed in the 2.3.99 series the
+ * > appended test program worked.  Now with 2.4.0-test6 it's not working
+ * > again.  Looking briefly over the patch from test5 to test6 I haven't
+ * > seen an immediate candidate for the breakage.  It could be missing
+ * > propagation of the LDT to the new process (and therefore an invalid
+ * > segment descriptor) or simply clearing %gs.
+ * >
+ * > Anyway, this is what you should see and what you get with test5:
+ * >
+ * > a = 42
+ * > %gs = 0x0007
+ * > %gs = 0x0007
+ * > a = 99
+ * >
+ * > This is what you get with test6:
+ * >
+ * > a = 42
+ * > %gs = 0x0007
+ * > %gs = 0x0000
+ * > <SEGFAULT>
+ * >
+ * > If somebody is actually creating a test suite for the kernel, please
+ * > add this program.  It's mostly self-contained.  The correct handling
+ * > of %gs is really important since glibc 2.2 will make heavy use of it.
+ * >
  */
 
-#include <stdio.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <sys/wait.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-#include "test.h"
-
-char *TCID = "fork05";
-
-static char *environ_list[] = { "TERM", "NoTSetzWq", "TESTPROG" };
-
-#define NUMBER_OF_ENVIRON (sizeof(environ_list)/sizeof(char *))
-int TST_TOTAL = NUMBER_OF_ENVIRON;
+#include <asm/ldt.h>
 
-#if defined(linux) && defined(__i386__)
+#if TST_ABI32
 
-struct modify_ldt_ldt_s {
-	unsigned int entry_number;
-	unsigned long int base_addr;
-	unsigned int limit;
-	unsigned int seg_32bit:1;
-	unsigned int contents:2;
-	unsigned int read_exec_only:1;
-	unsigned int limit_in_pages:1;
-	unsigned int seg_not_present:1;
-	unsigned int useable:1;
-	unsigned int empty:25;
-};
-
-static int a = 42;
-
-static void modify_ldt(int func, struct modify_ldt_ldt_s *ptr, int bytecount)
-{
-	tst_syscall(__NR_modify_ldt, func, ptr, bytecount);
-}
-
-int main(void)
+static void run(void)
 {
-	struct modify_ldt_ldt_s ldt0;
-	int lo;
+	struct user_desc ldt0;
+	int base_addr = 42;
+	int status;
 	pid_t pid;
-	int res;
+	int lo;
 
 	ldt0.entry_number = 0;
-	ldt0.base_addr = (long)&a;
+	ldt0.base_addr = (long)&base_addr;
 	ldt0.limit = 4;
 	ldt0.seg_32bit = 1;
 	ldt0.contents = 0;
@@ -154,49 +78,40 @@ int main(void)
 	ldt0.useable = 1;
 	ldt0.empty = 0;
 
-	modify_ldt(1, &ldt0, sizeof(ldt0));
+	tst_syscall(__NR_modify_ldt, 1, &ldt0, sizeof(ldt0));
 
 	asm volatile ("movw %w0, %%fs"::"q" (7));
-
 	asm volatile ("movl %%fs:0, %0":"=r" (lo));
-	tst_resm(TINFO, "a = %d", lo);
+	tst_res(TINFO, "a = %d", lo);
 
 	asm volatile ("pushl %%fs; popl %0":"=q" (lo));
-	tst_resm(TINFO, "%%fs = %#06hx", lo);
+	tst_res(TINFO, "%%fs = %#06hx", lo);
 
 	asm volatile ("movl %0, %%fs:0"::"r" (99));
 
-	pid = fork();
-
-	if (pid == 0) {
+	pid = SAFE_FORK();
+	if (!pid) {
 		asm volatile ("pushl %%fs; popl %0":"=q" (lo));
-		tst_resm(TINFO, "%%fs = %#06hx", lo);
+		tst_res(TINFO, "%%fs = %#06hx", lo);
 
 		asm volatile ("movl %%fs:0, %0":"=r" (lo));
-		tst_resm(TINFO, "a = %d", lo);
-
-		if (lo != 99)
-			tst_resm(TFAIL, "Test failed");
-		else
-			tst_resm(TPASS, "Test passed");
-		exit(lo != 99);
-	} else {
-		waitpid(pid, &res, 0);
-	}
+		tst_res(TINFO, "a = %d", lo);
 
-	return WIFSIGNALED(res);
-}
+		TST_EXP_EQ_LI(lo, 99);
 
-#else /* if defined(linux) && defined(__i386__) */
+		exit(0);
+	}
 
-int main(void)
-{
-	tst_resm(TINFO, "%%fs test only for ix86");
+	SAFE_WAITPID(pid, &status, 0);
 
-	/*
-	 * should be successful on all non-ix86 platforms.
-	 */
-	tst_exit();
+	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
+		tst_res(TFAIL, "Child crashed with SIGSEGV");
 }
 
-#endif /* if defined(linux) && defined(__i386__) */
+static struct tst_test test = {
+	.run_all = run
+};
+
+#else
+	TST_TEST_TCONF("Test only supports linux 32 bits");
+#endif
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
