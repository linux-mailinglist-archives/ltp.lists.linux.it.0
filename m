Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPIaCby0eGlzsQEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:51:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1194820
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:51:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5495A3CA379
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 13:51:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B7313CA152
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 13:50:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C34FF60094A
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 13:50:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB7135BCFB;
 Tue, 27 Jan 2026 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769518210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IOpJdxEIMAVsgdYxdzSDsm+fggtewf7ny94ySwn/7Y=;
 b=1TpnUhBdTDmG8ZbgeBv0TJbTey0+lgMv07kXs6vZZsjqtOQlPP5NDjXCG9yVA0p1LcZDgO
 XxRF+HriIkBazE4u6Mun4WtF1+1JkZ8bcK8dLeD5dZ5S862FLDIKJTAKDiJpHvSil8mnmV
 sHcUjnqVJmpTOgB9FdtN+tlLMBEs5Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769518210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IOpJdxEIMAVsgdYxdzSDsm+fggtewf7ny94ySwn/7Y=;
 b=Co2YA9rgfAwIydnDhHgLSvywZJ0YGZudRhUoCHevKQwdo9ulJxV0JUWhOq8uzrRY9fx3Nz
 uN1UH4Ba3XD/rJBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1TpnUhBd;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Co2YA9rg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769518210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IOpJdxEIMAVsgdYxdzSDsm+fggtewf7ny94ySwn/7Y=;
 b=1TpnUhBdTDmG8ZbgeBv0TJbTey0+lgMv07kXs6vZZsjqtOQlPP5NDjXCG9yVA0p1LcZDgO
 XxRF+HriIkBazE4u6Mun4WtF1+1JkZ8bcK8dLeD5dZ5S862FLDIKJTAKDiJpHvSil8mnmV
 sHcUjnqVJmpTOgB9FdtN+tlLMBEs5Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769518210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IOpJdxEIMAVsgdYxdzSDsm+fggtewf7ny94ySwn/7Y=;
 b=Co2YA9rgfAwIydnDhHgLSvywZJ0YGZudRhUoCHevKQwdo9ulJxV0JUWhOq8uzrRY9fx3Nz
 uN1UH4Ba3XD/rJBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 862403EA63;
 Tue, 27 Jan 2026 12:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2IQkH4K0eGmaYwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 27 Jan 2026 12:50:10 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 27 Jan 2026 13:50:09 +0100
MIME-Version: 1.0
Message-Id: <20260127-fork_refactoring-v1-1-e3e21ff1a4f7@suse.com>
References: <20260127-fork_refactoring-v1-0-e3e21ff1a4f7@suse.com>
In-Reply-To: <20260127-fork_refactoring-v1-0-e3e21ff1a4f7@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769518210; l=6749;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=QvFG4FFJ+Gwq927bGmAQhe4HlesrMqXXpP4gi9K0rAs=;
 b=BtWBsp+RMGokmRH80A5saBgDbtkjFIyFnDKnuHmmDhAOO65tVeBZ0bjT+I/oOUQMHQsZg71Yv
 fivg/tXH7OdBEaFlBvdukt+xx/lOZ1UM3OzBltf1A90wqJahxsTrHRU
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/3] syscalls: refactor fork09 using new API
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: A4E1194820
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/fork/fork09.c | 218 ++++++++++----------------------
 1 file changed, 69 insertions(+), 149 deletions(-)

diff --git a/testcases/kernel/syscalls/fork/fork09.c b/testcases/kernel/syscalls/fork/fork09.c
index 32bad89b35575f1597bed1a44ef3b984bd1db3bd..7ce64b9a1188fe81e1d44d8ea5cb33a2504b8cfd 100644
--- a/testcases/kernel/syscalls/fork/fork09.c
+++ b/testcases/kernel/syscalls/fork/fork09.c
@@ -1,172 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
- *
- * NAME
- *	fork09.c
- *
- * DESCRIPTION
- *	Check that child has access to a full set of files.
- *
- * ALGORITHM
- *	Parent opens a maximum number of files
- *	Child closes one and attempts to open another, it should be
- *	available
- *
- * USAGE
- *	fork09
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- *	10/2008 Suzuki K P <suzuki@in.ibm.com>
- *		Fix maximum number of files open logic.
- *
- * RESTRICTIONS
- *	None
+ * Copyright (C) 2026 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <errno.h>
-#include <unistd.h>		/* for _SC_OPEN_MAX */
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "fork09";
-int TST_TOTAL = 1;
+/*\
+ * Verify that a forked child can close all the files which have been open by
+ * the parent process.
+ */
 
-static void setup(void);
-static void cleanup(void);
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
 
-static char filname[40], childfile[40];
-static int first;
-static FILE **fildeses;		/* file streams */
-static int mypid, nfiles;
+#define FILE_PREFIX "ltp_file"
 
-#define OPEN_MAX (sysconf(_SC_OPEN_MAX))
+static FILE **open_files;
+static long file_open_max;
 
-int main(int ac, char **av)
+static void run(void)
 {
-	int pid, status, nf;
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	fildeses = malloc((OPEN_MAX + 10) * sizeof(FILE *));
-	if (fildeses == NULL)
-		tst_brkm(TBROK, cleanup, "malloc failed");
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		mypid = getpid();
-
-		tst_resm(TINFO, "OPEN_MAX is %ld", OPEN_MAX);
-
-		/* establish first free file */
-		sprintf(filname, "fork09.%d", mypid);
-		first = SAFE_CREAT(cleanup, filname, 0660);
-		close(first);
-
-		tst_resm(TINFO, "first file descriptor is %d ", first);
-
-		SAFE_UNLINK(cleanup, filname);
-
-		/*
-		 * now open all the files for the test
-		 */
-		for (nfiles = first; nfiles < OPEN_MAX; nfiles++) {
-			sprintf(filname, "file%d.%d", nfiles, mypid);
-			fildeses[nfiles] = fopen(filname, "a");
-			if (fildeses[nfiles] == NULL) {
-				/* Did we already reach OPEN_MAX ? */
-				if (errno == EMFILE)
-					break;
-				tst_brkm(TBROK, cleanup, "Parent: cannot open "
-					 "file %d %s errno = %d", nfiles,
-					 filname, errno);
-			}
-#ifdef DEBUG
-			tst_resm(TINFO, "filname: %s", filname);
-#endif
-		}
+	FILE *f;
+	long nfiles;
+	long totfiles;
+	char name[PATH_MAX];
 
-		tst_resm(TINFO, "Parent reporting %d files open", nfiles - 1);
-
-		pid = fork();
-		if (pid == -1)
-			tst_brkm(TBROK, cleanup, "Fork failed");
-
-		if (pid == 0) {	/* child */
-			nfiles--;
-			if (fclose(fildeses[nfiles]) == -1) {
-				tst_resm(TINFO, "Child could not close file "
-					 "#%d, errno = %d", nfiles, errno);
-				exit(1);
-			} else {
-				sprintf(childfile, "cfile.%d", getpid());
-				fildeses[nfiles] = fopen(childfile, "a");
-				if (fildeses[nfiles] == NULL) {
-					tst_resm(TINFO, "Child could not open "
-						 "file %s, errno = %d",
-						 childfile, errno);
-					exit(1);
-				} else {
-					tst_resm(TINFO, "Child opened new "
-						 "file #%d", nfiles);
-					unlink(childfile);
-					exit(0);
-				}
-			}
-		} else {	/* parent */
-			wait(&status);
-			if (status >> 8 != 0)
-				tst_resm(TFAIL, "test 1 FAILED");
-			else
-				tst_resm(TPASS, "test 1 PASSED");
-		}
+	tst_res(TINFO, "Opening files from parent");
+
+	for (nfiles = 0; nfiles < file_open_max; nfiles++) {
+		memset(name, 0, PATH_MAX);
+		snprintf(name, PATH_MAX, "%s%lu", FILE_PREFIX, nfiles);
 
-		/* clean up things in case we are looping */
-		for (nf = first; nf < nfiles; nf++) {
-			fclose(fildeses[nf]);
-			sprintf(filname, "file%d.%d", nf, mypid);
-			unlink(filname);
+		f = fopen(name, "a");
+		if (!f) {
+			if (errno == EMFILE)
+				break;
+
+			tst_brk(TBROK | TERRNO, "fopen() error");
 		}
+
+		open_files[nfiles] = f;
+	}
+
+	totfiles = nfiles;
+
+	if (!totfiles)
+		tst_brk(TBROK, "Parent couldn't open any file");
+
+	tst_res(TINFO, "Closing %lu files from child", totfiles);
+
+	if (!SAFE_FORK()) {
+		for (nfiles = nfiles - 1; nfiles >= 0; nfiles--)
+			SAFE_FCLOSE(open_files[nfiles]);
+
+		exit(0);
 	}
 
-	cleanup();
-	tst_exit();
+	tst_reap_children();
+
+	tst_res(TPASS, "Child closed all parent's files");
+
+	for (nfiles = 0; nfiles < totfiles; nfiles++) {
+		memset(name, 0, PATH_MAX);
+		snprintf(name, PATH_MAX, "%s%lu", FILE_PREFIX, nfiles);
+
+		SAFE_FCLOSE(open_files[nfiles]);
+		SAFE_UNLINK(name);
+	}
 }
 
 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	umask(0);
+	file_open_max = sysconf(_SC_OPEN_MAX);
 
-	TEST_PAUSE;
-	tst_tmpdir();
+	open_files = SAFE_MMAP(NULL, sizeof(FILE *) * file_open_max,
+			PROT_READ | PROT_WRITE,
+			MAP_ANONYMOUS | MAP_SHARED,
+			-1, 0);
 }
 
 static void cleanup(void)
 {
-	tst_rmdir();
+	if (open_files)
+		SAFE_MUNMAP(open_files, sizeof(FILE *) * file_open_max);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+};

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
