Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF1A078B8
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 15:11:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF8163C262D
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 15:11:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B0563C185A
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 15:11:19 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 54FF41BD6330
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 15:11:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDA291F394;
 Thu,  9 Jan 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736431878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8fiGDjpOjdhii3rmleTZWV994d3xJeW8wDy7SjDVrY=;
 b=zEX2SquIPwCdykZbpXaLq6rOdx8cuFErJlv2CJUmDFpI+N8+0QMNz0zCLUHls5kQ8lBLuT
 5W5JRLEaF4x9Iq0ejENJqAuqPEN+ceP0SAApY4Yt02GKX3KyLGnwvqwfQjsdWbAxoulbjU
 EdCoLmnftRGaqDQqKwa30DZUHwH4OiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736431878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8fiGDjpOjdhii3rmleTZWV994d3xJeW8wDy7SjDVrY=;
 b=FIum0/CPW/0qvnVp/8IAL5uqPXxetNyIXAghy+x4e0Ks/zt1U33jEZHnkceW9J501L23q9
 gejiHqS7ieI+BtBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736431877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8fiGDjpOjdhii3rmleTZWV994d3xJeW8wDy7SjDVrY=;
 b=LtEfL3lwieOxS+18pKS8iOvtp4XHGHy655K9kEVljum7+prOBhhdD9ykPZIwyQa1HGqgYb
 TcpcVZ9qrqx/cFcN22IaI1D6YoK8zlXSWwe9j2c/XjaV+gmlqlWpZnQ4I0AthVYQRpQNwc
 gXTqIdKjGFQ84A4C2sWAeDQowS/q5CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736431877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8fiGDjpOjdhii3rmleTZWV994d3xJeW8wDy7SjDVrY=;
 b=p0yw6kcQ89qGHritvFp+jHaEGrzhtwKbXiSbGDuZdX06Ip9cBWlKuRrAh7kJ0OKEWMsZb0
 B/4m6eLYGl9rOUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2F0913876;
 Thu,  9 Jan 2025 14:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GFqDLQXZf2eVWgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 09 Jan 2025 14:11:17 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 09 Jan 2025 15:11:06 +0100
MIME-Version: 1.0
Message-Id: <20250109-fix_setsid_tests-v3-3-2ce60c904019@suse.com>
References: <20250109-fix_setsid_tests-v3-0-2ce60c904019@suse.com>
In-Reply-To: <20250109-fix_setsid_tests-v3-0-2ce60c904019@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736431876; l=14193;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=f8C07Y1HfCHY5m9xnuTealeSC1+r82JASX6sF/qJDtI=;
 b=O/ABP+se3CLBqCa6F5fpNNRTO2uzQK2fxbgsQPwf+xlPdo/gKGa0jAA6TX6oJCcvsZjTqX9Af
 CQZjEjI70u5BDBvtQsKK58lIupXVQYz5BU1DQif3/xD2iz+7xnvCYgd
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email, imap1.dmz-prg2.suse.org:helo,
 suse.com:mid, suse.com:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 03/12] Refactor ptem01 test
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

Fix test failure when running inside a new session via setsid() and
start spliting its internal tests cases implementations into multiple
files.

Fixes: https://github.com/linux-test-project/kirk/issues/28
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/pty/common.h |  68 +++++++
 testcases/kernel/pty/ptem01.c | 456 ++++--------------------------------------
 2 files changed, 105 insertions(+), 419 deletions(-)

diff --git a/testcases/kernel/pty/common.h b/testcases/kernel/pty/common.h
new file mode 100644
index 0000000000000000000000000000000000000000..51760b1d39fa0518f3e7c4ece2281286e056cc48
--- /dev/null
+++ b/testcases/kernel/pty/common.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef PTEM_H
+#define PTEM_H
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+
+#define MASTERCLONE "/dev/ptmx"
+
+static inline int open_master(void)
+{
+	int masterfd;
+
+	if (access(MASTERCLONE, F_OK))
+		tst_brk(TCONF, "%s device doesn't exist", MASTERCLONE);
+
+	tst_res(TINFO, "opening master %s", MASTERCLONE);
+
+	masterfd = SAFE_OPEN(MASTERCLONE, O_RDWR);
+
+	if (grantpt(masterfd) == -1)
+		tst_brk(TBROK | TERRNO, "grantpt() error");
+
+	if (unlockpt(masterfd) == -1)
+		tst_brk(TBROK | TERRNO, "unlockpt() error");
+
+	return masterfd;
+}
+
+static inline int open_slave(const int masterfd)
+{
+	int slavefd;
+	char *slavename;
+
+	slavename = SAFE_PTSNAME(masterfd);
+
+	tst_res(TINFO, "opening slave %s", slavename);
+
+#ifndef __BIONIC__
+	/* grantpt() is a no-op in bionic. */
+	struct stat st;
+
+	SAFE_STAT(slavename, &st);
+
+	uid_t uid = getuid();
+
+	if (st.st_uid != uid) {
+		tst_brk(TBROK, "uid mismatch st.st_uid(%d) != getuid(%d)",
+			st.st_uid, uid);
+	}
+
+	if (st.st_mode != (S_IFCHR | 0620)) {
+		tst_brk(TBROK, "unexpected slave device permission: %o",
+			st.st_mode);
+	}
+#endif
+
+	slavefd = SAFE_OPEN(slavename, O_RDWR);
+
+	return slavefd;
+}
+
+#endif
diff --git a/testcases/kernel/pty/ptem01.c b/testcases/kernel/pty/ptem01.c
index 20ef5d0a739a55262c1c32ec03e57885dfe09787..b14e247c8ba53e098d44a3904621f8f2ec21fd1a 100644
--- a/testcases/kernel/pty/ptem01.c
+++ b/testcases/kernel/pty/ptem01.c
@@ -1,441 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) International Business Machines  Corp., 2002
- *   Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
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
+ * Copyright (c) International Business Machines  Corp., 2002
+ * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/* 12/23/2002   Port to LTP     robbiew@us.ibm.com */
-/* 06/30/2001   Port to Linux   nsharoff@us.ibm.com */
+/*\
+ * [Description]
+ *
+ * Verify that it's possible to open a pseudo-terminal via /dev/ptmx, obtain a
+ * slave device and configure termos/termios ioctls.
+ */
 
 #define _GNU_SOURCE
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <termios.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/poll.h>
-#include <sys/types.h>
-
-#include "test.h"
-#include "safe_macros.h"
-#include "lapi/ioctl.h"
 
-char *TCID = "ptem01";		/* Test program identifier.    */
-int TST_TOTAL = 6;		/* Total number of test cases. */
-/**************/
-
-/*
- * pty master clone device
- */
-#define MASTERCLONE "/dev/ptmx"
+#include <termio.h>
+#include <termios.h>
+#include "common.h"
 
-#define BUFSZ 4096
+static int masterfd = -1;
 
-/*
- * test termio/termios ioctls
- */
-int test1(void)
+static void run(void)
 {
-	int masterfd, slavefd;
-	char *slavename;
+	int slavefd;
 	struct termio termio;
 	struct termios termios;
 
-	masterfd = SAFE_OPEN(NULL, MASTERCLONE, O_RDWR);
-
-	slavename = ptsname(masterfd);
-	if (slavename == NULL) {
-		tst_brkm(TBROK | TERRNO, NULL, "ptsname() call failed");
-	}
-
-	if (grantpt(masterfd) != 0) {
-		tst_brkm(TBROK | TERRNO, NULL, "grantpt() call failed");
-	}
-
-	if (unlockpt(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "unlockpt() call failed");
-	}
-
-	if ((slavefd = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TFAIL, NULL, "Could not open %s", slavename);
-	}
-
-	if (ioctl(slavefd, TCGETS, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCGETS");
-	}
-
-	if (ioctl(slavefd, TCSETS, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETS");
-	}
-
-	if (ioctl(slavefd, TCSETSW, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETSW");
-	}
-
-	if (ioctl(slavefd, TCSETSF, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETSF");
-	}
-
-	if (ioctl(slavefd, TCSETS, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETS");
-	}
-
-	if (ioctl(slavefd, TCGETA, &termio) != 0) {
-		tst_brkm(TFAIL, NULL, "TCGETA");
-	}
-
-	if (ioctl(slavefd, TCSETA, &termio) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETA");
-	}
-
-	if (ioctl(slavefd, TCSETAW, &termio) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETAW");
-	}
-
-	if (ioctl(slavefd, TCSETAF, &termio) != 0) {
-		tst_brkm(TFAIL, NULL, "TCSETAF");
-	}
-
-	if (close(slavefd) != 0) {
-		tst_brkm(TBROK, NULL, "close slave");
-	}
-
-	if (close(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "close master");
-	}
-	tst_resm(TPASS, "test1");
-
-	/** NOT REACHED **/
-	return 0;
-}
-
-/*
- * test window size setting and getting
- */
-int test2(void)
-{
-	int masterfd, slavefd;
-	char *slavename;
-	struct winsize wsz;
-	struct winsize wsz1 = { 24, 80, 5, 10 };
-	struct winsize wsz2 = { 60, 100, 11, 777 };
-
-	masterfd = SAFE_OPEN(NULL, MASTERCLONE, O_RDWR);
-
-	slavename = ptsname(masterfd);
-	if (slavename == NULL) {
-		tst_brkm(TBROK | TERRNO, NULL, "ptsname() call failed");
-	}
-
-	if (grantpt(masterfd) != 0) {
-		tst_brkm(TBROK | TERRNO, NULL, "grantpt() call failed");
-	}
-
-	if (unlockpt(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "unlockpt() call failed");
-	}
-
-	if ((slavefd = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TBROK, NULL, "Could not open %s", slavename);
-	}
-
-	if (ioctl(masterfd, TIOCSWINSZ, &wsz1) != 0) {
-		tst_brkm(TFAIL, NULL, "TIOCSWINSZ");
-	}
-
-	if (ioctl(slavefd, TIOCGWINSZ, &wsz) != 0) {
-		tst_brkm(TFAIL, NULL, "TIOCGWINSZ");
-	}
-
-	if (wsz.ws_row != wsz1.ws_row || wsz.ws_col != wsz1.ws_col ||
-	    wsz.ws_xpixel != wsz1.ws_xpixel ||
-	    wsz.ws_ypixel != wsz1.ws_ypixel) {
-		tst_brkm(TFAIL, NULL, "unexpected window size returned");
-	}
-
-	if (ioctl(masterfd, TIOCGWINSZ, &wsz) != 0) {
-		tst_brkm(TFAIL, NULL, "TIOCGWINSZ");
-	}
-
-	if (wsz.ws_row != wsz1.ws_row || wsz.ws_col != wsz1.ws_col ||
-	    wsz.ws_xpixel != wsz1.ws_xpixel ||
-	    wsz.ws_ypixel != wsz1.ws_ypixel) {
-		tst_brkm(TFAIL, NULL, "unexpected window size returned");
-	}
-
-	if (ioctl(slavefd, TIOCSWINSZ, &wsz2) != 0) {
-		tst_brkm(TFAIL, NULL, "TIOCSWINSZ");
-	}
-
-	if (ioctl(slavefd, TIOCGWINSZ, &wsz) != 0) {
-		tst_brkm(TFAIL, NULL, "TIOCGWINSZ");
-	}
-
-	if (wsz.ws_row != wsz2.ws_row || wsz.ws_col != wsz2.ws_col ||
-	    wsz.ws_xpixel != wsz2.ws_xpixel ||
-	    wsz.ws_ypixel != wsz2.ws_ypixel) {
-		tst_brkm(TFAIL, NULL, "unexpected window size returned");
-	}
-
-	if (close(slavefd) != 0) {
-		tst_brkm(TBROK, NULL, "close");
-	}
-
-	if (close(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "close");
-	}
-	tst_resm(TPASS, "test2");
-
-	/** NOT REACHED **/
-	return 0;
-}
-
-/*
- * test sending a break
- */
-int test3(void)
-{
-	int masterfd, slavefd;
-	char *slavename;
-
-	masterfd = SAFE_OPEN(NULL, MASTERCLONE, O_RDWR);
-
-	slavename = ptsname(masterfd);
-	if (slavename == NULL) {
-		tst_brkm(TBROK | TERRNO, NULL, "ptsname() call failed");
-	}
-
-	if (grantpt(masterfd) != 0) {
-		tst_brkm(TBROK | TERRNO, NULL, "grantpt() call failed");
-	}
-
-	if (unlockpt(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "unlockpt() call failed");
-	}
-
-	if ((slavefd = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TBROK, NULL, "Could not open %s", slavename);
-	}
-
-	if (tcsendbreak(masterfd, 10) != 0) {
-		tst_brkm(TFAIL, NULL, "tcsendbreak");
-	}
-
-	if (tcsendbreak(slavefd, 10) != 0) {
-		tst_brkm(TFAIL, NULL, "tcsendbreak");
-	}
-
-	if (close(slavefd) != 0) {
-		tst_brkm(TBROK, NULL, "close slave");
-	}
-
-	if (close(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "close master");
-	}
-	tst_resm(TPASS, "test3");
-
-	/** NOT REACHED **/
-	return 0;
-}
-
-/*
- * test multiple opens of slave side
- */
-int test4(void)
-{
-	int masterfd, slavefd, slavefd2, slavefd3;
-	char *slavename;
-
-	masterfd = SAFE_OPEN(NULL, MASTERCLONE, O_RDWR);
-
-	slavename = ptsname(masterfd);
-	if (slavename == NULL) {
-		tst_brkm(TBROK | TERRNO, NULL, "ptsname() call failed");
-	}
+	slavefd = open_slave(masterfd);
 
-	if (grantpt(masterfd) != 0) {
-		tst_brkm(TBROK | TERRNO, NULL, "grantpt() call failed");
-	}
+	TST_EXP_PASS(ioctl(slavefd, TCGETS, &termios));
+	TST_EXP_PASS(ioctl(slavefd, TCSETS, &termios));
+	TST_EXP_PASS(ioctl(slavefd, TCSETSW, &termios));
+	TST_EXP_PASS(ioctl(slavefd, TCSETSF, &termios));
+	TST_EXP_PASS(ioctl(slavefd, TCSETS, &termios));
+	TST_EXP_PASS(ioctl(slavefd, TCGETA, &termio));
+	TST_EXP_PASS(ioctl(slavefd, TCSETA, &termio));
+	TST_EXP_PASS(ioctl(slavefd, TCSETAW, &termio));
+	TST_EXP_PASS(ioctl(slavefd, TCSETAF, &termio));
 
-	if (unlockpt(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "unlockpt() call failed");
-	}
-
-	if ((slavefd = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TBROK, NULL, "Could not open %s", slavename);
-	}
-
-	if ((slavefd2 = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TFAIL, NULL, "Could not open %s (again)", slavename);
-	}
-
-	if ((slavefd3 = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TFAIL, NULL, "Could not open %s (once more)",
-			 slavename);
-	}
-
-	if (close(slavefd) != 0) {
-		tst_brkm(TBROK, NULL, "close slave");
-	}
-	if (close(slavefd2) != 0) {
-		tst_brkm(TBROK, NULL, "close slave again");
-	}
-	if (close(slavefd3) != 0) {
-		tst_brkm(TBROK, NULL, "close slave once more");
-	}
-	if (close(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "close master");
-	}
-	tst_resm(TPASS, "test4");
-
-	/** NOT REACHED **/
-	return 0;
+	SAFE_CLOSE(slavefd);
 }
 
-#define NUMOPENS 6
-
-/*
- * test several simultaneous opens
- */
-int test5(void)
+static void setup(void)
 {
-	static int masterfd[NUMOPENS];
-	static int slavefd[NUMOPENS];
-	char *slavename;
-	int i;
-
-	for (i = 0; i < NUMOPENS; ++i) {
-		masterfd[i] = open(MASTERCLONE, O_RDWR);
-		if (masterfd[i] < 0) {
-			tst_resm(TBROK, "%s", MASTERCLONE);
-			tst_resm(TBROK, "out of ptys");
-			for (i = 0; i < NUMOPENS; ++i) {
-				if (masterfd[i] != 0) {
-					(void)close(masterfd[i]);
-				}
-				if (slavefd[i] != 0) {
-					(void)close(slavefd[i]);
-				}
-			}
-			tst_exit();
-		}
-
-		slavename = ptsname(masterfd[i]);
-		if (slavename == NULL) {
-			tst_brkm(TBROK | TERRNO, NULL,
-				 "ptsname() call failed");
-		}
-
-		if (grantpt(masterfd[i]) != 0) {
-			tst_brkm(TBROK | TERRNO, NULL,
-				 "grantpt() call failed");
-		}
-
-		if (unlockpt(masterfd[i]) != 0) {
-			tst_brkm(TBROK, NULL, "unlockpt() call failed");
-		}
-
-		if ((slavefd[i] = open(slavename, O_RDWR)) < 0) {
-			tst_brkm(TFAIL, NULL,
-				 "Iteration %d: Could not open %s", i,
-				 slavename);
-		}
-
-	}
-
-	for (i = 0; i < NUMOPENS; ++i) {
-		if (close(slavefd[i]) != 0) {
-			tst_brkm(TBROK, NULL, "Iteration %d: close slave", i);
-		}
-		if (close(masterfd[i]) != 0) {
-			tst_brkm(TBROK, NULL, "close master");
-		}
-	}
-	tst_resm(TPASS, "test5");
-
-	/** NOT REACHED **/
-	return 0;
+	masterfd = open_master();
 }
 
-/*
- * test hangup semantics
- */
-int test6(void)
+static void cleanup(void)
 {
-	static int masterfd;
-	static int slavefd;
-	char *slavename;
-	struct termios termios;
-
-	masterfd = SAFE_OPEN(NULL, MASTERCLONE, O_RDWR);
-
-	slavename = ptsname(masterfd);
-	if (slavename == NULL) {
-		tst_brkm(TBROK | TERRNO, NULL, "ptsname() call failed");
-	}
-
-	if (grantpt(masterfd) != 0) {
-		tst_brkm(TBROK | TERRNO, NULL, "grantpt() call failed");
-	}
-
-	if (unlockpt(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "unlockpt() call failed");
-	}
-
-	if ((slavefd = open(slavename, O_RDWR)) < 0) {
-		tst_brkm(TBROK, NULL, "Could not open %s", slavename);
-	}
-
-	if (ioctl(slavefd, TCGETS, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCGETS");
-	}
-
-	termios.c_cflag &= ~CBAUD;
-	termios.c_cflag |= B0 & CBAUD;
-	if (ioctl(slavefd, TCSETS, &termios) != 0) {
-		tst_brkm(TFAIL, NULL, "TCGETS");
-	}
-
-	if (close(slavefd) != 0) {
-		tst_brkm(TBROK, NULL, "close");
-	}
-	if (close(masterfd) != 0) {
-		tst_brkm(TBROK, NULL, "close");
-	}
-	tst_resm(TPASS, "test6");
-
-	/** NOT REACHED **/
-	return 0;
+	if (masterfd != -1)
+		SAFE_CLOSE(masterfd);
 }
 
-/*
- * main test driver
- */
-int main(void)
-{
-	test1();
-	test2();
-	test3();
-	test4();
-	test5();
-	test6();
-	/*
-	 * all done
-	 */
-	tst_exit();
-}
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
