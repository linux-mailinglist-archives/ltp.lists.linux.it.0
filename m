Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38D79224E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:55:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4F7C3CB807
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:55:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9DBBC3CB4B6
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:55:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5F24414001F6
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:55:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEEA51FD6F;
 Tue,  5 Sep 2023 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693914911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCC6JUw1ERdmsF064X6hkqYL3EX7WA11lWS87/DU13E=;
 b=nJ8N2a0l1GMEoLU6kO4A/yoHmcr4HhjSMNr0iWQ7EHgG7gEChEqbbxsG46LzBybGLYPT3r
 d7Brpulf8xPH1dQsx2+Y8JlFRx24oTLozhSl212N2D5a+4bkKWT9vCUcihE48e/Rpik3U9
 QeyF9UPyTW2kPPDgvIxMo9LRUfiAzWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693914911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCC6JUw1ERdmsF064X6hkqYL3EX7WA11lWS87/DU13E=;
 b=G1TXXXjw4woglR+O+/bxegxhfiO1/1Iw+srlObWB7CL5jlKiWKpj3XG2s4PG22NzyHq11m
 tlM9IUQGyUPPhOAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A599A13A1B;
 Tue,  5 Sep 2023 11:55:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKB+Jx8X92SIAgAAMHmgww
 (envelope-from <mkittler@suse.de>); Tue, 05 Sep 2023 11:55:11 +0000
From: Marius Kittler <mkittler@suse.de>
To: martchus@gmx.net,
	ltp@lists.linux.it
Date: Tue,  5 Sep 2023 13:55:07 +0200
Message-ID: <20230905115508.31117-2-mkittler@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905115508.31117-1-mkittler@suse.de>
References: <20230905115508.31117-1-mkittler@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Refactor ioctl02.c to use the new test API
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

This test code itself has been kept unchanged as much as possible
(although it probably still has room for improvement).

See https://github.com/linux-test-project/ltp/issues/637 for related
discussion.

Signed-off-by: Marius Kittler <mkittler@suse.de>
---
 testcases/kernel/syscalls/ioctl/ioctl02.c | 221 +++++++++-------------
 1 file changed, 92 insertions(+), 129 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl02.c b/testcases/kernel/syscalls/ioctl/ioctl02.c
index b4d4a3594..65a00821c 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl02.c
@@ -1,6 +1,7 @@
 /*
  *   Copyright (c) International Business Machines  Corp., 2001
  *   Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ *   Copyright (c) 2023 Marius Kittler <mkittler@suse.de>
  *
  *   This program is free software;  you can redistribute it and/or modify
  *   it under the terms of the GNU General Public License as published by
@@ -64,15 +65,11 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <termios.h>
-#include "test.h"
-#include "safe_macros.h"
-#include "lapi/ioctl.h"
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 
 #define	CNUL	0
 
-char *TCID = "ioctl02";
-int TST_TOTAL = 1;
-
 static struct termio termio, save_io;
 
 static char *parenttty, *childtty;
@@ -88,108 +85,72 @@ static int run_ctest(void);
 static int chk_tty_parms();
 static void setup(void);
 static void cleanup(void);
-static void help(void);
 static void do_child(void);
 void do_child_uclinux(void);
 static void sigterm_handler(void);
 
-static int Devflag;
-static char *devname;
-
-static option_t options[] = {
-	{"D:", &Devflag, &devname},
-	{NULL, NULL, NULL}
-};
+static char *device;
 
-int main(int ac, char **av)
+static void verify_ioctl(void)
 {
-	int lc;
-	int rval;
-
-	tst_parse_opts(ac, av, options, &help);
+	parenttty = device;
+	childtty = device;
 
+	parentpid = getpid();
+	childpid = SAFE_FORK();
+	if (childpid == 0) {	/* child */
 #ifdef UCLINUX
-	maybe_run_child(&do_child_uclinux, "dS", &parentpid, &childtty);
-#endif
-
-	if (!Devflag)
-		tst_brkm(TBROK, NULL, "You must specify a tty device with "
-			 "the -D option.");
-
-	tst_require_root();
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		parenttty = devname;
-		childtty = devname;
-
-		parentpid = getpid();
-
-		childpid = FORK_OR_VFORK();
-		if (childpid < 0)
-			tst_brkm(TBROK, cleanup, "fork failed");
-
-		if (childpid == 0) {	/* child */
-#ifdef UCLINUX
-			if (self_exec(av[0], "dS", parentpid, childtty) < 0)
-				tst_brkm(TBROK, cleanup, "self_exec failed");
+		if (self_exec(av[0], "dS", parentpid, childtty) < 0)
+			tst_brkm(TBROK, cleanup, "self_exec failed");
 #else
-			do_child();
+		do_child();
 #endif
-		}
-
-		while (!sigusr1)
-			sleep(1);
-
-		sigusr1 = 0;
-
-		parentfd = do_parent_setup();
-		if (parentfd < 0) {
-			kill(childpid, SIGTERM);
-			waitpid(childpid, NULL, 0);
-			cleanup();
-		}
+	}
 
-		/* run the parent test */
-		rval = run_ptest();
-		if (rval == -1) {
-			/*
-			 * Parent cannot set/get ioctl parameters.
-			 * SIGTERM the child and cleanup.
-			 */
-			kill(childpid, SIGTERM);
-			waitpid(childpid, NULL, 0);
-			cleanup();
-		}
+	while (!sigusr1)
+		sleep(1);
 
-		if (rval != 0)
-			tst_resm(TFAIL, "TCGETA/TCSETA tests FAILED with "
-				 "%d %s", rval, rval > 1 ? "errors" : "error");
-		else
-			tst_resm(TPASS, "TCGETA/TCSETA tests SUCCEEDED");
+	sigusr1 = 0;
 
-		/* FIXME: check return codes. */
-		(void)kill(childpid, SIGTERM);
-		(void)waitpid(childpid, NULL, 0);
+	parentfd = do_parent_setup();
+	if (parentfd < 0) {
+		kill(childpid, SIGTERM);
+		waitpid(childpid, NULL, 0);
+		cleanup();
+	}
 
+	/* run the parent test */
+	int rval = run_ptest();
+	if (rval == -1) {
 		/*
-		 * Clean up things from the parent by restoring the
-		 * tty device information that was saved in setup()
-		 * and closing the tty file descriptor.
+		 * Parent cannot set/get ioctl parameters.
+		 * SIGTERM the child and cleanup.
 		 */
-		if (ioctl(parentfd, TCSETA, &save_io) == -1)
-			tst_resm(TINFO, "ioctl restore failed in main");
-		SAFE_CLOSE(cleanup, parentfd);
-
-		closed = 1;
+		kill(childpid, SIGTERM);
+		waitpid(childpid, NULL, 0);
+		cleanup();
 	}
-	cleanup();
 
-	tst_exit();
+	if (rval != 0)
+		tst_res(TFAIL, "TCGETA/TCSETA tests FAILED with "
+				"%d %s", rval, rval > 1 ? "errors" : "error");
+	else
+		tst_res(TPASS, "TCGETA/TCSETA tests SUCCEEDED");
+
+	/* FIXME: check return codes. */
+	(void)kill(childpid, SIGTERM);
+	(void)waitpid(childpid, NULL, 0);
+
+	/*
+	 * Clean up things from the parent by restoring the
+	 * tty device information that was saved in setup()
+	 * and closing the tty file descriptor.
+	 */
+	if (ioctl(parentfd, TCSETA, &save_io) == -1)
+		tst_res(TINFO, "ioctl restore failed in main");
+	SAFE_CLOSE(parentfd);
+
+	closed = 1;
 }
 
 static void do_child(void)
@@ -221,8 +182,6 @@ void do_child_uclinux(void)
  */
 static int run_ptest(void)
 {
-	int i, rval;
-
 	/* Use "old" line discipline */
 	termio.c_line = 0;
 
@@ -230,7 +189,7 @@ static int run_ptest(void)
 	termio.c_cflag = B50 | CS7 | CREAD | PARENB | PARODD | CLOCAL;
 
 	/* Set control chars. */
-	for (i = 0; i < NCC; i++) {
+	for (int i = 0; i < NCC; i++) {
 		if (i == VEOL2)
 			continue;
 		termio.c_cc[i] = CSTART;
@@ -250,16 +209,10 @@ static int run_ptest(void)
 
 	TEST(ioctl(parentfd, TCSETA, &termio));
 
-	if (TEST_RETURN < 0) {
-		tst_resm(TFAIL, "ioctl TCSETA failed : "
-			 "errno = %d", TEST_ERRNO);
-		return -1;
-	}
-
 	/* Get termio and see if all parameters actually got set */
-	rval = ioctl(parentfd, TCGETA, &termio);
+	int rval = ioctl(parentfd, TCGETA, &termio);
 	if (rval < 0) {
-		tst_resm(TFAIL, "ioctl TCGETA failed.  Ending test.");
+		tst_res(TFAIL, "ioctl TCGETA failed.  Ending test.");
 		return -1;
 	}
 
@@ -276,10 +229,10 @@ static int run_ctest(void)
 
 	sigterm = 0;
 
-	tst_resm(TINFO, "child: Got SIGTERM from parent.");
+	tst_res(TINFO, "child: Got SIGTERM from parent.");
 
 	if (close(childfd) == -1)
-		tst_resm(TINFO, "close() in run_ctest() failed");
+		tst_res(TINFO, "close() in run_ctest() failed");
 	return 0;
 }
 
@@ -288,7 +241,7 @@ static int chk_tty_parms(void)
 	int i, flag = 0;
 
 	if (termio.c_line != 0) {
-		tst_resm(TINFO, "line discipline has incorrect value %o",
+		tst_res(TINFO, "line discipline has incorrect value %o",
 			 termio.c_line);
 		flag++;
 	}
@@ -301,7 +254,7 @@ static int chk_tty_parms(void)
 	 */
 #if 0
 	if (termio.c_cflag != (B50 | CS7 | CREAD | PARENB | PARODD | CLOCAL)) {
-		tst_resm(TINFO, "cflag has incorrect value. %o",
+		tst_res(TINFO, "cflag has incorrect value. %o",
 			 termio.c_cflag);
 		flag++;
 	}
@@ -312,7 +265,7 @@ static int chk_tty_parms(void)
 			if (termio.c_cc[VEOL2] == CNUL) {
 				continue;
 			} else {
-				tst_resm(TINFO, "control char %d has "
+				tst_res(TINFO, "control char %d has "
 					 "incorrect value %d %d", i,
 					 termio.c_cc[i], CNUL);
 				flag++;
@@ -321,7 +274,7 @@ static int chk_tty_parms(void)
 		}
 
 		if (termio.c_cc[i] != CSTART) {
-			tst_resm(TINFO, "control char %d has incorrect "
+			tst_res(TINFO, "control char %d has incorrect "
 				 "value %d.", i, termio.c_cc[i]);
 			flag++;
 		}
@@ -330,7 +283,7 @@ static int chk_tty_parms(void)
 	if (!
 	    (termio.c_lflag
 	     && (ISIG | ICANON | XCASE | ECHO | ECHOE | NOFLSH))) {
-		tst_resm(TINFO, "lflag has incorrect value. %o",
+		tst_res(TINFO, "lflag has incorrect value. %o",
 			 termio.c_lflag);
 		flag++;
 	}
@@ -339,34 +292,32 @@ static int chk_tty_parms(void)
 	    (termio.c_iflag
 	     && (BRKINT | IGNPAR | INPCK | ISTRIP | ICRNL | IUCLC | IXON | IXANY
 		 | IXOFF))) {
-		tst_resm(TINFO, "iflag has incorrect value. %o",
+		tst_res(TINFO, "iflag has incorrect value. %o",
 			 termio.c_iflag);
 		flag++;
 	}
 
 	if (!(termio.c_oflag && (OPOST | OLCUC | ONLCR | ONOCR))) {
-		tst_resm(TINFO, "oflag has incorrect value. %o",
+		tst_res(TINFO, "oflag has incorrect value. %o",
 			 termio.c_oflag);
 		flag++;
 	}
 
 	if (!flag)
-		tst_resm(TINFO, "termio values are set as expected");
+		tst_res(TINFO, "termio values are set as expected");
 
 	return flag;
 }
 
 static int do_parent_setup(void)
 {
-	int pfd;
-
-	pfd = SAFE_OPEN(cleanup, parenttty, O_RDWR, 0777);
+	int pfd = SAFE_OPEN(parenttty, O_RDWR, 0777);
 
 	/* unset the closed flag */
 	closed = 0;
 
 	/* flush tty queues to remove old output */
-	SAFE_IOCTL(cleanup, pfd, TCFLSH, 2);
+	SAFE_IOCTL(pfd, TCFLSH, 2);
 	return pfd;
 }
 
@@ -376,7 +327,7 @@ static int do_child_setup(void)
 
 	cfd = open(childtty, O_RDWR, 0777);
 	if (cfd < 0) {
-		tst_resm(TINFO, "Could not open %s in do_child_setup(), errno "
+		tst_res(TINFO, "Could not open %s in do_child_setup(), errno "
 			 "= %d", childtty, errno);
 		/* signal the parent so we don't hang the test */
 		kill(parentpid, SIGUSR1);
@@ -385,7 +336,7 @@ static int do_child_setup(void)
 
 	/* flush tty queues to remove old output */
 	if (ioctl(cfd, TCFLSH, 2) < 0) {
-		tst_resm(TINFO, "ioctl TCFLSH failed. : errno = %d", errno);
+		tst_res(TINFO, "ioctl TCFLSH failed. : errno = %d", errno);
 		/* signal the parent so we don't hang the test */
 		kill(parentpid, SIGUSR1);
 		return -1;
@@ -415,24 +366,26 @@ static void sigusr2_handler(void)
 	sigusr2 = 1;
 }
 
-static void help(void)
-{
-	printf("  -D <tty device> : for example, /dev/tty[0-9]\n");
-}
-
 static void setup(void)
 {
+#ifdef UCLINUX
+	do_child_uclinux();
+#endif
+
+	if (!device)
+		tst_brk(TBROK, "You must specify a tty device with -D option");
+
 	int fd;
 	struct sigaction act;
 
 	/* XXX: TERRNO required all over the place */
-	fd = SAFE_OPEN(NULL, devname, O_RDWR, 0777);
+	fd = SAFE_OPEN(device, O_RDWR, 0777);
 
 	/* Save the current device information - to be restored in cleanup() */
-	SAFE_IOCTL(cleanup, fd, TCGETA, &save_io);
+	SAFE_IOCTL(fd, TCGETA, &save_io);
 
 	/* Close the device */
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_CLOSE(fd);
 
 	/* Set up the signal handlers */
 	act.sa_handler = (void *)sigterm_handler;
@@ -453,16 +406,26 @@ static void setup(void)
 	(void)sigaction(SIGTTOU, &act, 0);
 
 	sigterm = sigusr1 = sigusr2 = 0;
-
-	TEST_PAUSE;
 }
 
 static void cleanup(void)
 {
 	if (!closed) {
 		if (ioctl(parentfd, TCSETA, &save_io) == -1)
-			tst_resm(TINFO, "ioctl restore failed in cleanup()");
+			tst_res(TINFO, "ioctl restore failed in cleanup()");
 		if (close(parentfd) == -1)
-			tst_resm(TINFO, "close() failed in cleanup()");
+			tst_res(TINFO, "close() failed in cleanup()");
 	}
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.forks_child = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_ioctl,
+	.options = (struct tst_option[]) {
+		{"D:", &device, "Tty device. For example, /dev/tty[0-9]"},
+		{}
+	}
+};
\ No newline at end of file
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
