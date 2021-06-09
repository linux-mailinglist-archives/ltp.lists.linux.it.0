Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAF3A1BF0
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 635973C8FCC
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD4C03C9A50
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:58 +0200 (CEST)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 25DF91A00CBB
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:58 +0200 (CEST)
Received: by mail-io1-xd2b.google.com with SMTP id k22so23669984ioa.9
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uUdBnS2Pg6TlZsuxAuNzHs2PiKJjTnK02JvQaGM5cRY=;
 b=D+wl6Rgqip0r+yLwTsCG+NaIC6E8wdbS5Jur/q7YJ0U12xx/uvh2AQZzXlVaxsCo4c
 sNVkdfHKAXGVuDyBzswLx6h0Ko+o8uEHjkJG78wXknZgLCYs8L6x/I9uB3CS3MidkN/4
 7mmU0P8MXo9hmq+NM8opqvKtFQdnDooiMbsLRRdM9Q6Br4XiTsk5Cjk+pgC8d9tq5kew
 a7nR+cIy5ZSM2uDovxgkONY5ZMG2kTBcHXkRyQam9tMXpRHJg2BC7pe9ARAkovBHiDXL
 OOE14DkYsaRMfzek74UTS99nhsE8A9YTiSoeDSbzpYMAh6Q0TiyKdYf4YiLJ3qCi6I9S
 Yt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uUdBnS2Pg6TlZsuxAuNzHs2PiKJjTnK02JvQaGM5cRY=;
 b=CgkoBaySI9308Jx0L8YbzcTH4yy8b79UI6WcJhnEHCx/iNTJCn7vOjgj6YOo08afFc
 uKXYgWCQIvSmvrE+gsehJ0ip7udt+qiHBvUMyRzzujtRT+Shq9MKwMmEM4Qr+ithf4P7
 s1qTrjiur+G6s+mUrWd2JO4sLIpxlG/PDM/8wKrvWSAeh+Ap1IrTEB7cj8zjUCbUVEMK
 Au008MHy4gxA2vA7Zn2VF6ES1K8k7PWvBR71cp2YKYYGK3nsKK43ZAefWk4fkQMLJz1u
 Uh5v/GQdRDdbZdBl0FxxhyQTCJuf1XSLTqojqEDYNOImJ9vcR4nWNi/Yr2s7Hvvg6dKk
 KN7A==
X-Gm-Message-State: AOAM531NuvwOBr0nJCtR9YF/dsttysn3cpMpXZbRbvSciyi9bHGm3Ojh
 icRDDgqhhklvtuhtuCfBPkY=
X-Google-Smtp-Source: ABdhPJzI0T1aRA0fB+SJ168SUtHuK5pYpfB8a0zP65cCGFVrwyjTaV6B+V+wcWECYdeYBLsKLKebPQ==
X-Received: by 2002:a5e:8d02:: with SMTP id m2mr454427ioj.9.1623260216699;
 Wed, 09 Jun 2021 10:36:56 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:36:56 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:54 +0530
Message-Id: <20210609173601.29352-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 03/10] getrusage02: Convert getrusage02 to new API
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
Cc: metan@ucw.cz, umesh.kalappa0@gmail.com, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getrusage/getrusage02.c   | 142 ++++--------------
 1 file changed, 27 insertions(+), 115 deletions(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c b/testcases/kernel/syscalls/getrusage/getrusage02.c
index 8077606a2..c4b3f0f69 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -1,86 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
+ * AUTHOR : Saji Kumar.V.R <saji.kumar@wipro.com>
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: getrusage02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Tests for error conditions
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that
- *	1) getrusage() fails with errno EINVAL when an invalid value
- *	   is given for who
- *	2) getrusage() fails with errno EFAULT when an invalid address
- *	   is given for usage
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  if call failed with expected errno,
- *		Test Passed
- *	  else
- *		Test Failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ *[Description]
  *
- * USAGE:  <for command-line>
- *  getrusage02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f]
- * 			     [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Verify that
+ * 1) getrusage() fails with errno EINVAL when an invalid value
+ *   is given for who
+ * 2) getrusage() fails with errno EFAULT when an invalid address
+ *   is given for usage
  *
- ****************************************************************/
+ */
 
 #include <errno.h>
 #include <sched.h>
 #include <sys/resource.h>
-#include "test.h"
+#include "tst_test.h"
 
 #ifndef RUSAGE_BOTH		/* Removed from user space on RHEL4 */
 #define RUSAGE_BOTH (-2)	/* still works on SuSE      */
 #endif /* so this is a work around */
 
-static void setup();
-static void cleanup();
-
-char *TCID = "getrusage02";
-
 static struct rusage usage;
 
 struct test_cases_t {
@@ -90,56 +33,25 @@ struct test_cases_t {
 } test_cases[] = {
 	{
 	RUSAGE_BOTH, &usage, EINVAL},
-#ifndef UCLINUX
 	{
 	RUSAGE_SELF, (struct rusage *)-1, EFAULT}
-#endif
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-int main(int ac, char **av)
+static void verify_getrusage(unsigned int i)
 {
-
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(getrusage(test_cases[i].who, test_cases[i].usage));
-
-			if (TEST_RETURN == -1 &&
-			    TEST_ERRNO == test_cases[i].exp_errno)
-				tst_resm(TPASS | TTERRNO,
-					 "getrusage failed as expected");
-			else
-				tst_resm(TFAIL | TTERRNO,
-					 "getrusage failed unexpectedly");
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
-
+		TEST(getrusage(test_cases[i].who, test_cases[i].usage));
+
+		if (TST_RET == -1 &&
+		    TST_ERR == test_cases[i].exp_errno)
+			tst_res(TPASS | TTERRNO,
+				"getrusage failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO,
+				"getrusage failed unexpectedly");
 }
 
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test = verify_getrusage,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.needs_root = 1,
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
