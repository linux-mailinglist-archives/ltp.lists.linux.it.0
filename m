Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 675906163C
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 171E23C197B
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CCF683C18FD
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:32 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F3E56005E3
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:34 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id f9so14672819wre.12
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VaZJo5UmvypEjUADNcjaFynhJfiTvzzwzo5y5EYs2WA=;
 b=X0Q5BiI9GUSr3dcWKfAWv+Fd1fmorBY/pY0Z5ZQuAProzKPZZAm1AN3rT6RgLIyax/
 GSHVFgLn/oBRSBjlt5j29IHFeLoSHhZxk2G9J/X7gToKGcCyh89Q38CYTQPFibJPsK45
 0uwpH/POH9QNZsrpy0EXZxbF64WTSxmaU4oDFCZug/DECnU9yzCyq8qc5XaHhEu/DzEC
 xmQY/BIKdIHe6WbnPPBitqPmO2QXSCc94xa59WNOcHQD7cA/5lV0XIMKww6n3xNapS19
 IhCtFhtO56IowFdSKB81yQ+oxdjWhy6yP2VDQO0Ck1nCcSMIlEus0AKCWVk8XiB5QPQt
 sZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VaZJo5UmvypEjUADNcjaFynhJfiTvzzwzo5y5EYs2WA=;
 b=tkbaeSrxwI+UugQ0Sknz+Q/0C0gOYH4DzLZjYpDxozFJAqleou2REigVPIEi1MmExO
 QS8LlI0i1qHKM5OrGaOeQpkcrsp5lZcagphAYp4zKmnFl+KDjMGnvdXFEnh8do63LE/i
 xIija/9N0o78w5Bn/h7Yk3Nm4fymbs8uWdLInHE3oOqTQixpM/p9vBkpUE/CyCI+jhoD
 C5te9T0tYPixeRn8hPPW1SPVdSZG9EmjmDnJQEpfveKc0JisQT2E9HA4dctB1VXUgZRf
 wX1h3bxFEQznXDaUxsWPE8BHVxa5vdW4AnuZl10CS2WJmbf/XoT5daD+aydyonznTQTQ
 FZNA==
X-Gm-Message-State: APjAAAXH1CYmiqD6YyuViAyraRNBRhkG/5fMYbtffkO2YB9VAMeXIUmq
 bayhAWrBKZkJHEVl4O629pesOJO7
X-Google-Smtp-Source: APXvYqx33FUpJElYD9zQihDjs1Ufq9G/CzFHNQpUAcVj/eW81/CXRkd36Kwn2dzBhKh7CAv1uj8LdQ==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr9882166wrm.341.1562526031323; 
 Sun, 07 Jul 2019 12:00:31 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:30 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:15 +0200
Message-Id: <20190707190016.27296-5-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707190016.27296-1-petr.vorel@gmail.com>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] setdomainname02: Convert to new API
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../syscalls/setdomainname/setdomainname02.c  | 197 ++++--------------
 1 file changed, 35 insertions(+), 162 deletions(-)

diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname02.c b/testcases/kernel/syscalls/setdomainname/setdomainname02.c
index 6af09ca40..875ed0c44 100644
--- a/testcases/kernel/syscalls/setdomainname/setdomainname02.c
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname02.c
@@ -1,181 +1,54 @@
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
- /*******************************************************************
- *
- *    TEST IDENTIFIER   : setdomainname02
- *
- *    EXECUTED BY       : root / superuser
- *
- *    TEST TITLE        : test for checking error conditions for setdomainame(2)
- *
- *    TEST CASE TOTAL   : 3
- *
- *    AUTHOR            : Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- *      Uses SIGUSR1 to pause before test if option set.
- *      (See the parse_opts(3) man page).
- *
- * DESCRIPTION
- * 	Verify that,
- *   1) setdomainname(2) returns -1 and sets errno to EINVAL if the parameter,
- *	len is less than zero
- *   2) setdomainname(2) returns -1 and sets errno to EINVAL if value of
- *	len is greater than the maximum allowed value
- *   3) setdomainname(2) returns -1 and sets errno to EFAULT for a bad address
- *	for name
- *
- * ALGORITHM
- * Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
- *   Save current domainname
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if (system call failed (return=-1)) &
- *			   (errno set == expected errno)
- *              Issue sys call fails with expected return value and errno.
- *   Otherwise,
- *      Issue sys call returns unexpected value.
- *
- *  Cleanup:
- *        Restore old domain name.
- *        Print errno log and/or timing stats if options given
- *  Side Effects :
- *	 setdomainname() is resetting value to NULL, if an invalid address
- *	 is given for name. So, to overcome this problem, domainname is
- *	 resetting to original value as part of cleanup() routine.
- *
- * USAGE:  <for command-line>
- *  setdomainname02  [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *		where,  -c n : Run n copies concurrently.
- *			-e   : Turn on errno logging.
- *			-h   : Show help screen
- *			-f   : Turn off functional testing
- *			-i n : Execute test n times.
- *			-I x : Execute test for x seconds.
- *			-p   : Pause for SIGUSR1 before starting
- *			-P x : Pause for x seconds between iterations.
- *			-t   : Turn on syscall timing.
- *
- *********************************************************************/
 
-#include "test.h"
+#include "setdomainname.h"
 
-#include <errno.h>
-#include <sys/utsname.h>
+#define ERRNO_DESC(x) .exp_errno = x, .errno_desc = #x
 
-#define MAX_NAME_LEN _UTSNAME_DOMAIN_LENGTH - 1
+#define MAX_NAME_LENGTH _UTSNAME_DOMAIN_LENGTH - 1
 
-static void cleanup(void);
-static void setup(void);
-
-char *TCID = "setdomainname02";
-int TST_TOTAL = 3;
-
-static char old_domain_name[MAX_NAME_LEN];
-static struct test_case_t {
+struct test_case {
 	char *desc;
 	char *name;
 	int len;
 	int exp_errno;
-	char err_desc[10];
-} test_cases[] = {
-	{
-	"test with len = -1", "test_dom", -1, EINVAL, "EINVAL"}, {
-	"test with len > allowed maximum", "test_dom", MAX_NAME_LEN + 1,
-		    EINVAL, "EINVAL"}, {
-"test with name = NULL", NULL, MAX_NAME_LEN, EFAULT, "EFAULT"},};
-
-int main(int ac, char **av)
+	char *errno_desc;
+} tcases[] = {
+	{ "len == -1", TST_VALID_DOMAIN_NAME, -1, ERRNO_DESC(EINVAL) },
+	{ "len > allowed maximum", TST_VALID_DOMAIN_NAME, MAX_NAME_LENGTH + 1, ERRNO_DESC(EINVAL) },
+	{ "name == NULL", NULL, MAX_NAME_LENGTH, ERRNO_DESC(EFAULT) }
+};
+
+void verify_setdomainname(unsigned int nr)
 {
-	int lc, ind;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
+	struct test_case *tcase = &tcases[nr];
 
-		for (ind = 0; ind < TST_TOTAL; ind++) {
+	TEST(do_setdomainname(tcase->name, (size_t) tcase->len));
 
-			/*
-			 * call the system call with the TEST() macro
-			 */
-			TEST(setdomainname(test_cases[ind].name,
-					   (size_t) test_cases[ind].len));
-
-			if ((TEST_RETURN == -1) &&
-			    (TEST_ERRNO == test_cases[ind].exp_errno)) {
-				tst_resm(TPASS, "expected failure; Got %s",
-					 test_cases[ind].err_desc);
-			} else {
-				tst_resm(TFAIL, "Call failed to produce "
-					 "expected error;  Expected errno: %d "
-					 "Got : %d, %s",
-					 test_cases[ind].exp_errno,
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			}
-		}
+	tst_res(TINFO, "testing %s", tcase->desc);
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "unexpected exit code: %ld", TST_RET);
+		return;
 	}
 
-	cleanup();
-
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Save current domainname */
-	if ((getdomainname(old_domain_name, MAX_NAME_LEN)) < 0) {
-		tst_brkm(TBROK, NULL, "getdomainname() failed while"
-			 " getting current domain name");
+	if (TST_ERR != tcase->exp_errno) {
+		tst_res(TFAIL | TTERRNO, "unexpected errno: %d, expected: %d",
+			TST_ERR, tcase->exp_errno);
+		return;
 	}
 
-	TEST_PAUSE;
-
+	tst_res(TPASS | TTERRNO, "expected failure");
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-
-	/* Restore domain name */
-	if ((setdomainname(old_domain_name, sizeof(old_domain_name)))
-	    < 0) {
-		tst_resm(TWARN, "setdomainname() failed while restoring"
-			 " domainname to \"%s\"", old_domain_name);
-	}
-
-}
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_setdomainname,
+	.test_variants = TEST_VARIANTS,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
