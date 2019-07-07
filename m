Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BA6163B
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC54F3C136C
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7A66F3C1C98
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:31 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 99CBC200CE9
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:30 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id z1so10061229wru.13
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O28efHeqxvCGwJ30gsNRbUhkR2wtUYLM1gK2ahTe8lU=;
 b=s7+Fhjado6LPcs+wNd2XrsduJLWxy3PN36CymyuKU+xEBhcICXxjF6hTR27HYs/nbI
 qQlhQ+KrwwGZxsPyNoo7/jgRZ7f7opf2LyvXKOJj8lU4lX1m46GuhOwPlOTC3keOPP8U
 nW8cxv8aPCb77WiAZOhSAxCMd4C2qzTV5lX1WYVZRQ7DmREx2uUADR5PM3rAgLnjldBe
 n3td0YpEswGYv1cWj+0h8CdKZCPDIYaWT1872Mi1cICWvZxRUskXaYJjmP75zE8Q4ryf
 3kngJ80WKEaxTxGQSgb02ULN/fWobKVIvcm3Q4xttUbl06vx9kom/m0HrWLa7PBR1JAV
 lX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O28efHeqxvCGwJ30gsNRbUhkR2wtUYLM1gK2ahTe8lU=;
 b=jyJV9Gliz4MlsB2wCDUTEKLPfzaPBSyEFUo9g8HQmTRKKxo0bVZ8nCjkjq9wzTOI47
 V1nYQ0jOYs/Xf/1XUftCoxlTKHfnYSpG7CGxuYW0b2FdoWo1J0uSSJdCiNhmRPSb4/0z
 K3nSOi1s3wnMfUvnCDISzcTqIJbT+nnXbvbPvwzBCjX+HFquSKnoTqhSNeUvdSclIDjU
 HzQ9DEKM09E+HWxEmTZU2w4aKH+VzbBpPNXJxfxE3Xjza92LWKHxFEQ/oEq4cZjIhkY6
 hI709/+g2f8qmtqR1uqauo05OFIb7A8a30gaf7ahiybf+miobTDOjQj0kOIERhy69HCS
 N/jA==
X-Gm-Message-State: APjAAAWK9aiD4Xl93yyMdDhTquA8fpTAFzECtVsskqRYIISKnjH3l+d/
 Wdjp9RIk0fToZipfReNfYLMOpmD1
X-Google-Smtp-Source: APXvYqww/lKL/TcE+PUBaoOXRZV3pqMiwCXWYsYAdPbPi+/a3nMYXyqlO2XPpddIzeNUuDvhjAqFDg==
X-Received: by 2002:adf:e446:: with SMTP id t6mr14697690wrm.115.1562526029828; 
 Sun, 07 Jul 2019 12:00:29 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:29 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:14 +0200
Message-Id: <20190707190016.27296-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707190016.27296-1-petr.vorel@gmail.com>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] setdomainname01: Convert to new API
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

Functional changes: verify result of setdomainname() with
getdomainname().

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../syscalls/setdomainname/setdomainname.h    |  58 +++++++
 .../syscalls/setdomainname/setdomainname01.c  | 162 +++---------------
 2 files changed, 82 insertions(+), 138 deletions(-)
 create mode 100644 testcases/kernel/syscalls/setdomainname/setdomainname.h

diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname.h b/testcases/kernel/syscalls/setdomainname/setdomainname.h
new file mode 100644
index 000000000..76a72df22
--- /dev/null
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname.h
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+ */
+
+#ifndef SETDOMAINNAME_H__
+#define SETDOMAINNAME_H__
+
+#include <string.h>
+#include "lapi/utsname.h"
+#include "lapi/syscalls.h"
+#include "tst_test.h"
+
+#define TST_VALID_DOMAIN_NAME "test_dom"
+
+static char backup[_UTSNAME_DOMAIN_LENGTH];
+
+#define TEST_VARIANTS 2
+
+static void setdomainname_info(void)
+{
+	switch (tst_variant) {
+	case 0:
+		tst_res(TINFO, "Testing libc setdomainname()");
+		break;
+	case 1:
+		tst_res(TINFO, "Testing __NR_setdomainname syscall");
+		break;
+	}
+}
+
+static int do_setdomainname(char *new, size_t len)
+{
+	switch (tst_variant) {
+	case 0:
+		return setdomainname(new, len);
+	break;
+	case 1:
+		return tst_syscall(__NR_setdomainname, new, len);
+	}
+
+	return -1;
+}
+
+static void setup(void)
+{
+	setdomainname_info();
+	if ((getdomainname(backup, sizeof(backup))) < 0)
+		tst_brk(TBROK | TERRNO, "getdomainname() failed");
+}
+
+static void cleanup(void)
+{
+	if ((setdomainname(backup, strlen(backup))) < 0)
+		tst_res(TWARN | TERRNO, "setdomainname() failed ('%s')", backup);
+}
+
+#endif /* SETDOMAINNAME_H__ */
diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname01.c b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
index 7288fca5c..57d58ab42 100644
--- a/testcases/kernel/syscalls/setdomainname/setdomainname01.c
+++ b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
@@ -1,149 +1,35 @@
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
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * Copyright (c) Wipro Technologies Ltd, 2002. All Rights Reserved.
+ * Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+ * Author: Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: setdomainname01
- *
- *    EXECUTED BY	: root / superuser
- *
- *    TEST TITLE	: Basic test for setdomainame(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the setdomainname(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  Save the current domainname.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- *	  Restore old domain name.
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  setdomainname01  [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
- *
- ****************************************************************/
 
-#include <errno.h>
-#include <string.h>
-#include <sys/utsname.h>
-#include "test.h"
+#include "setdomainname.h"
 
-#define MAX_NAME_LEN _UTSNAME_DOMAIN_LENGTH
-
-static void setup();
-static void cleanup();
-
-char *TCID = "setdomainname01";
-int TST_TOTAL = 1;
-
-static char *test_domain_name = "test_dom";
-static char old_domain_name[MAX_NAME_LEN];
-
-int main(int ac, char **av)
+static void do_test(void)
 {
+	char *new = TST_VALID_DOMAIN_NAME;
+	static char tmp[_UTSNAME_DOMAIN_LENGTH];
 
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	TEST(do_setdomainname(new, sizeof(new)));
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	if (TST_RET != 0)
+		tst_brk(TFAIL | TTERRNO, "setdomainname() failed: %d", TST_ERR);
 
-		tst_count = 0;
-
-		/*
-		 * Call setdomainname(2)
-		 */
-		TEST(setdomainname(test_domain_name, sizeof(test_domain_name)));
-
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "setdomainname() Failed, errno = %d :"
-				 " %s", TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TPASS, "setdomainname() returned %ld, "
-				 "Domain name set to \"%s\"", TEST_RETURN,
-				 test_domain_name);
-		}
-
-	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
+	if (getdomainname(tmp, sizeof(tmp)) != 0)
+		tst_brk(TFAIL | TERRNO, "getdomainname() failed");
 
+	if (strcmp(tmp, new))
+		tst_res(TFAIL, "getdomainname() returned wrong domainname: '%s'", tmp);
+	else
+		tst_res(TPASS, "setdomainname() succeed");
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Save current domain name */
-	if ((getdomainname(old_domain_name, sizeof(old_domain_name))) < 0) {
-		tst_brkm(TBROK, NULL, "getdomainname() failed while"
-			 " getting current domain name");
-	}
-
-	TEST_PAUSE;
-
-}
-
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-
-	/* Restore domain name */
-	if ((setdomainname(old_domain_name, strlen(old_domain_name))) < 0) {
-		tst_resm(TWARN, "setdomainname() failed while restoring"
-			 " domainname to \"%s\"", old_domain_name);
-	}
-
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = do_test,
+	.test_variants = TEST_VARIANTS,
+};
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
