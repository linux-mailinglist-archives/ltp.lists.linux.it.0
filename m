Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JuyEVFFqGlOrwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 15:44:33 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3472201D75
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 15:44:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E1AF3DC6D0
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 15:44:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E9A73C5DB1
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 15:44:21 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 70996600AFC
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 15:44:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDB695BE26
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772635456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DJ8iQkpYQjRUKvh6FaESbhBvmBa5oJnsPN0eJ6CQPmc=;
 b=dq9HOQ4OcOU41OTdEAzeWwnovVbtmxtrbkTVFcwpH34n/ougcKwTsiKvBmsq4MzK7Ov+56
 JE1u0JRODeNgLIy0XSeKXZ0BDPvsENqAJooW2HWCX3l03psYSZpKRwjxPJ6lR3K3O1vwoG
 tNuMwCGatMHs0+BM/77c142BdbjuwD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772635456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DJ8iQkpYQjRUKvh6FaESbhBvmBa5oJnsPN0eJ6CQPmc=;
 b=SMvXr2aDflADUijjeKsYDIHdW6x5TgLMQwYIWTEeOiIMZxzetLIaLH0Zb1awR/Bgv76vfy
 aRR2y0+qOM7qrXBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=PrgiMQqC;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=KWKWql34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772635454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DJ8iQkpYQjRUKvh6FaESbhBvmBa5oJnsPN0eJ6CQPmc=;
 b=PrgiMQqCPFkUfQMpet5u1cjyyaTVNOag9VTNSkv7DmGvRJ7duS77p1y93BaAGU5AbKLCf/
 hv+OggQO+Yi6MYFbImDvHEBAf8t5vdQBpXy5Eav9DtNXD2H/BHuQ2bwLOIf8bqkpK26E39
 CogQDDlqGjCar6/qqtq5Ndp3+pAEqQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772635454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DJ8iQkpYQjRUKvh6FaESbhBvmBa5oJnsPN0eJ6CQPmc=;
 b=KWKWql34Nli2ON4ZsYyA0tif+oefrBwcimawMSnDCaBUtiAljixty6pEwPBQ11O51jSndX
 +cV46umlLPPis2Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD96C3EA69
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:44:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JBj6LD5FqGkQIwAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 14:44:14 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2026 15:44:24 +0100
Message-ID: <20260304144424.10101-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] syscalls: ulimit01; Convert to the new library
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
X-Rspamd-Queue-Id: E3472201D75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_SPAM(0.00)[0.091];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,suse.cz:mid,suse.cz:email,linux.it:url]
X-Rspamd-Action: no action

Linux does not implement UL_GMEMLIM, UL_GDESLIM and UL_GSHMEMLIM so we
keep only the UL_GETFSIZE and UL_SETFSIZE.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ulimit/README     |   4 -
 testcases/kernel/syscalls/ulimit/ulimit01.c | 267 ++------------------
 2 files changed, 21 insertions(+), 250 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ulimit/README

diff --git a/testcases/kernel/syscalls/ulimit/README b/testcases/kernel/syscalls/ulimit/README
deleted file mode 100644
index 87fa0d234..000000000
--- a/testcases/kernel/syscalls/ulimit/README
+++ /dev/null
@@ -1,4 +0,0 @@
-Warning:  This routine is obsolete. The include file is no
-        longer provided by glibc.  Use getrlimit(2),  setrlimit(2)
-        and sysconf(3) instead.  For the shell command ulimit, see
-        bash(1).
diff --git a/testcases/kernel/syscalls/ulimit/ulimit01.c b/testcases/kernel/syscalls/ulimit/ulimit01.c
index 74dea91cd..31c89b4c2 100644
--- a/testcases/kernel/syscalls/ulimit/ulimit01.c
+++ b/testcases/kernel/syscalls/ulimit/ulimit01.c
@@ -1,260 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
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
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
+ * Copyright (c) Linux Test Project, 2024
+ * Copyright (c) 2026 Cyril Hrubis <chrubis@suse.cz>
  */
-/* $Id: ulimit01.c,v 1.6 2009/11/02 13:57:19 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: ulimit01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for ulimit(2)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 6
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: William Roske
- *
- *    CO-PILOT		: Dave Fenner
- *
- *    DATE STARTED	: 03/30/92
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- * 	1.) ulimit(2) returns...(See Description)
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *$
- *    DURATION
- * 	Terminates - with frequency and infinite modes.
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    RESOURCES
- * 	None
- *
- *    ENVIRONMENTAL NEEDS
- * 	The libcuts.a and libsys.a libraries must be included in
- *	the compilation of this test.
- *
- *    SPECIAL PROCEDURAL REQUIREMENTS
- * 	None
- *
- *    INTERCASE DEPENDENCIES
- * 	None
- *
- *    DETAILED DESCRIPTION
- *	This is a Phase I test for the ulimit(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	ulimit(2).
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
 
-#include <ulimit.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-
-void setup();
-void cleanup();
-
-char *TCID = "ulimit01";
-int TST_TOTAL = 6;
-
-int cmd;
-long limit;			/* saved limit */
-
-struct limits_t {
-	int cmd;
-	long newlimit;
-	int nlim_flag;		/* special flag for UL_SETFSIZE records  */
-	int exp_fail;
-} Scenarios[] = {
+/*\
+ * Tests the basic functionality of ulimit() with UL_GETFSIZE and UL_SETFSIZE.
+ */
 
-	{
-	UL_GETFSIZE, -1, 0, 0}, {
-	UL_SETFSIZE, -2, 1, 0},	/* case case: must be after UL_GETFSIZE */
-	{
-	UL_SETFSIZE, -2, 2, 0},	/* case case: must be after UL_GETFSIZE */
-#if UL_GMEMLIM
-	{
-	UL_GMEMLIM, -1, 0, 0},
-#endif
-#if UL_GDESLIM
-	{
-	UL_GDESLIM, -1, 0, 0},
-#endif
-#if UL_GSHMEMLIM
-	{
-	UL_GSHMEMLIM, -1, 0, 0},
-#endif
-};
+#include <ulimit.h>
+#include "tst_test.h"
 
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
-	int i;
-	int tmp;
-
-	TST_TOTAL = sizeof(Scenarios) / sizeof(struct limits_t);
-
-    /***************************************************************
-     * parse standard options
-     ***************************************************************/
-	tst_parse_opts(ac, av, NULL, NULL);
-
-    /***************************************************************
-     * perform global setup for test
-     ***************************************************************/
-	setup();
-
-    /***************************************************************
-     * check looping state if -c option given
-     ***************************************************************/
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
+	long current_fsize;
 
-		for (i = 0; i < TST_TOTAL; i++) {
+	TST_EXP_POSITIVE(ulimit(UL_GETFSIZE, -1));
 
-			cmd = Scenarios[i].cmd;
-			limit = Scenarios[i].newlimit;
+	if (!TST_PASS)
+		return;
 
-			/*
-			 * Call ulimit(2)
-			 */
-			TEST(ulimit(cmd, limit));
+	current_fsize = TST_RET;
 
-			/* check return code */
-			if (TEST_RETURN == -1) {
-				if (Scenarios[i].exp_fail) {
-					tst_resm(TPASS | TTERRNO,
-						 "ulimit(%d, %ld) Failed expectedly",
-						 cmd, limit);
-				} else {
-					tst_resm(TFAIL | TTERRNO,
-						 "ulimit(%d, %ld) Failed",
-						 cmd, limit);
-				}
-			} else {
-				if (Scenarios[i].exp_fail) {
-					tst_resm(TFAIL,
-						 "ulimit(%d, %ld) returned %ld, succeeded unexpectedly",
-						 cmd, limit, TEST_RETURN);
-				} else {
-					tst_resm(TPASS,
-						 "ulimit(%d, %ld) returned %ld",
-						 cmd, limit, TEST_RETURN);
-				}
-
-				/*
-				 * Save the UL_GETFSIZE return value in the newlimit field
-				 * for UL_SETFSIZE test cases.
-				 */
-				if (cmd == UL_GETFSIZE) {
-					for (tmp = i + 1; tmp < TST_TOTAL;
-					     tmp++) {
-						if (Scenarios[tmp].nlim_flag ==
-						    1) {
-							Scenarios[tmp].newlimit
-							    = TEST_RETURN;
-						}
-						if (Scenarios[tmp].nlim_flag ==
-						    2) {
-							Scenarios[tmp].newlimit
-							    = TEST_RETURN - 1;
-						}
-					}
-				}
-			}
-		}
-	}
-
-    /***************************************************************
-     * cleanup and exit
-     ***************************************************************/
-	cleanup();
-
-	tst_exit();
-}
-
-/***************************************************************
- * setup() - performs all ONE TIME setup for this test.
- ***************************************************************/
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	TST_EXP_POSITIVE(ulimit(UL_SETFSIZE, current_fsize),
+			 "ulimit(UL_SETFSIZE, %ld) (same value)", current_fsize);
 
+	TST_EXP_POSITIVE(ulimit(UL_SETFSIZE, current_fsize - 1),
+			 "ulimit(UL_SETFSIZE, %ld) (value - 1)", current_fsize - 1);
 }
 
-/***************************************************************
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- ***************************************************************/
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
