Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CB6163E
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:01:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9BBA3C18FD
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:01:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0125C3C1D04
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:35 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8648D1A00E67
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:34 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id f9so14672878wre.12
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4HYBxlOybXKQVP2iNeqVFst2n2tPhRJThNX+8BEq2yI=;
 b=Aa+tx16jw0G/vlLf8jTQfTYAOGkWDZJNLrQIRuzce8vkvluZMs4wE4RGaTw9sSk9gQ
 v5sY3RoPUA3HJMFwdSPspvIjaZoWS3PsxYkFrnev6WeyZ5VEiysgvuVa795/y3WPnTRq
 fnhHCaAJgolLm/0+pg0FfaLI7fDPwUW/YXiDe7N+rdBvitHWmIRruxv//BryiA19WSgg
 v15KXBgEJgrQZGmyfhSKZ5EyRo3fAEnfr3qZryEDQbAIJSbN97BMfOQgRdXwT8EF1u7U
 qM8aKNWvC74h1W0bwN7ogZd+f3vFbarD8zqJvnBp/nXui5YP9ESHW3Y438n//Zo2uszI
 IZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4HYBxlOybXKQVP2iNeqVFst2n2tPhRJThNX+8BEq2yI=;
 b=FkA3dWyc+F4ZdNeYBYuaYZYjjLz6RtvmwcDApl0L0j3doIN6A6KISm1nY0Kc5g0vu6
 6MHRwQGwmRCk/D8TpXyOqYaMYhJ6/CtiotCutQqeqUKklxKtd1gLnWL1Wo0OjRNRZFZ1
 TnTctXM9ir811fKl5KL4s0tF4iXN+USCPMm9W/ri1wlQYtrYuh9a54bIRKaQdRmG1hht
 fC2tOP7BBLoAkFKg7+6gGwvRWoAuUN68WdFa3O4ddeDNHaq/6Ch2pMQbihdKjTRDtefw
 WaLWhad6/s+jk75xMBVq+gmmpht1lkunTMztm4Ue/XC2W6PguaC3CyudjgcC2/aHMgbr
 25CQ==
X-Gm-Message-State: APjAAAXIu4K1cIWbMKltIz26ybHNF0kf3H9KREtlXK/OwG8B8boLvQvk
 s3yEjcB4c+LIN6Bbyn6cdUQf0fId
X-Google-Smtp-Source: APXvYqyG+SsoqpkBvL73b9bTSdRC6XftyBE/8Tbq0HPJvQkt3htHp3AhHjmu2/q1BqA3c9HW9gp3rw==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr5800719wro.193.1562526033784; 
 Sun, 07 Jul 2019 12:00:33 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:32 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:16 +0200
Message-Id: <20190707190016.27296-6-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707190016.27296-1-petr.vorel@gmail.com>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] setdomainname03: Convert to new API
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

Use _UTSNAME_LENGTH (65), which is defined in lapi/utsname.h
instead of __NEW_UTS_LEN (64).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../syscalls/setdomainname/setdomainname03.c  | 195 +++---------------
 1 file changed, 32 insertions(+), 163 deletions(-)

diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname03.c b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
index 82793b878..e53ea8806 100644
--- a/testcases/kernel/syscalls/setdomainname/setdomainname03.c
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
@@ -1,185 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- *
+ * Copyright (c) Wipro Technologies Ltd, 2002. All Rights Reserved.
+ * Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+ * Author: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER   : setdomainname03
- *
- *    EXECUTED BY       : root / superuser
- *
- *    TEST TITLE        : test for EPERM error value when run as non superuser
- *
- *    TEST CASE TOTAL   : 1
- *
- *    AUTHOR            : Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- *      Uses SIGUSR1 to pause before test if option set.
- *      (See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- * 	Verify that, setdomainname(2) returns -1 and sets errno to EPERM
- * 	if the effective user id of the caller is not super-user.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
- *   save current domainname
- *   change effective user id to "nobody" user
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, Check return code, if (system call failed (return=-1)) &
- *			(errno set == expected errno)
- *   		Issue sys call fails with expected return value and errno.
- *   	Otherwise,
- *		Issue sys call fails with unexpected errno.
- *   Otherwise,
- *	Issue sys call returns unexpected value.
- *
- *  Cleanup:
- *   Change effective user id to root
- *   Restore old domainname
- *   Print errno log and/or timing stats if options given
- *
- * Usage:  <for command-line>
- *  setdomainname03 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *	where,  -c n : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-h   : Show help screen
- *		-f   : Turn off functional testing
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-p   : Pause for SIGUSR1 before starting
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- ****************************************************************/
 
-#include <string.h>
 #include <errno.h>
 #include <pwd.h>
-#include <linux/utsname.h>
 
-#include "test.h"
+#include "setdomainname.h"
 
-#define MAX_NAME_LEN __NEW_UTS_LEN
-
-char *TCID = "setdomainname03";
-int TST_TOTAL = 1;
-
-static char nobody_uid[] = "nobody";
 struct passwd *ltpuser;
 
-static char test_domain_name[MAX_NAME_LEN] = "test_dom";
-static char old_domain_name[MAX_NAME_LEN];
-
-static void setup();		/* setup function for the tests */
-static void cleanup();		/* cleanup function for the tests */
-
-int main(int ac, char **av)
+static void do_test(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	/*
-	 * Invoke setup function to call individual test setup functions
-	 * for the test which run as root/super-user.
-	 */
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	char *new = TST_VALID_DOMAIN_NAME;
 
-		tst_count = 0;
-
-		/*
-		 * Call setdomainname(2)
-		 */
-		TEST(setdomainname(test_domain_name, MAX_NAME_LEN));
-		if ((TEST_RETURN == -1) && (TEST_ERRNO == EPERM)) {
-			tst_resm(TPASS, "expected failure; Got EPERM");
-		} else {
-			tst_resm(TFAIL, "Call failed to produce "
-				 "expected error;  Expected errno: %d "
-				 "Got : %d, %s", EPERM, TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		}
+	TEST(do_setdomainname(new, sizeof(new)));
 
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "unexpected exit code: %ld", TST_RET);
+		return;
 	}
 
-	/*
-	 * Invoke cleanup() to delete the test directories created
-	 * in the setup().
-	 */
-	cleanup();
-	tst_exit();
+	if (TST_ERR != EPERM) {
+		tst_res(TFAIL | TTERRNO, "unexpected errno: %d, expected: EPERM",
+			TST_ERR);
+		return;
+	}
 
+	tst_res(TPASS | TTERRNO, "expected failure");
 }
 
-/*
- * setup(void) - performs all ONE TIME setup for this test.
- */
-void setup(void)
+void setup_setuid(void)
 {
-	tst_require_root();
-
-	/* Capture unexpected signals */
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Switch to nobody user for correct error code collection */
-	if ((ltpuser = getpwnam(nobody_uid)) == NULL) {
-		tst_brkm(TBROK, NULL, "\"nobody\" user not present");
-	}
-	if (seteuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TWARN, "seteuid failed to "
-			 "to set the effective uid to %d", ltpuser->pw_uid);
-		perror("seteuid");
-	}
-
-	/* Save current domainname */
-	if ((getdomainname(old_domain_name, MAX_NAME_LEN)) < 0) {
-		tst_brkm(TBROK, NULL, "getdomainname() failed while"
-			 " getting current domain name");
-	}
-
-	TEST_PAUSE;
-
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
+	setup();
 }
 
-/*
- * cleanup() - Performs all ONE TIME cleanup for this test at
- */
-void cleanup(void)
+static void cleanup_setuid(void)
 {
-
-	/* Set effective user id back to root */
-	if (seteuid(0) == -1) {
-		tst_resm(TWARN, "seteuid failed to "
-			 "to set the effective uid to root");
-		perror("seteuid");
-	}
-
-	/* Restore domain name */
-	if ((setdomainname(old_domain_name, strlen(old_domain_name)))
-	    < 0) {
-		tst_resm(TWARN, "setdomainname() failed while restoring"
-			 " domainname to \"%s\"", old_domain_name);
-	}
-
+	SAFE_SETEUID(0);
+	cleanup();
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup_setuid,
+	.cleanup = cleanup_setuid,
+	.test_all = do_test,
+	.test_variants = TEST_VARIANTS,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
