Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D20045F89D7
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Oct 2022 08:55:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE2C83CAE4A
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Oct 2022 08:55:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 139943C4EB7
 for <ltp@lists.linux.it>; Sun,  9 Oct 2022 08:55:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C21742009AA
 for <ltp@lists.linux.it>; Sun,  9 Oct 2022 08:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665298526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vDRq6eZQtDDzjBeTEuywum69Rqu59oS1S5ZdGJETUg=;
 b=E+GXHO4Oz8oM5Qixg7TKYk02pvphT0bManZLrAk/TXw22X94UpFqPFoV9RdA+lO/N8kLh0
 SUma7lLy4/0YGpOJDY1c2mOW9XMQrl3udX7m6CZwMyHWQulZnfYp4oigdpXMRpYzwP7E9b
 8o9rSb/s5tejjnd8bCURKjhdtN7udiI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-6gG71vbuMLiaUrGSYawdkQ-1; Sun, 09 Oct 2022 02:55:25 -0400
X-MC-Unique: 6gG71vbuMLiaUrGSYawdkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F073A3C01DE5
 for <ltp@lists.linux.it>; Sun,  9 Oct 2022 06:55:24 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 047F140C9559
 for <ltp@lists.linux.it>; Sun,  9 Oct 2022 06:55:23 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sun,  9 Oct 2022 14:55:20 +0800
Message-Id: <20221009065520.3236525-2-liwang@redhat.com>
In-Reply-To: <20221009065520.3236525-1-liwang@redhat.com>
References: <20221009065520.3236525-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] setitimer03: convert to new API
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

Combine this EINVAL test into setitimer02 and add one additional
ITIMER_VIRTUAL verification.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 runtest/syscalls                              |   1 -
 .../kernel/syscalls/setitimer/.gitignore      |   1 -
 .../kernel/syscalls/setitimer/setitimer02.c   |  30 +++-
 .../kernel/syscalls/setitimer/setitimer03.c   | 158 ------------------
 4 files changed, 24 insertions(+), 166 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/setitimer/setitimer03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 61a7b7677..2d673836d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1325,7 +1325,6 @@ sethostname03 sethostname03
 
 setitimer01 setitimer01
 setitimer02 setitimer02
-setitimer03 setitimer03
 
 setns01 setns01
 setns02 setns02
diff --git a/testcases/kernel/syscalls/setitimer/.gitignore b/testcases/kernel/syscalls/setitimer/.gitignore
index 048db9b31..35779a32c 100644
--- a/testcases/kernel/syscalls/setitimer/.gitignore
+++ b/testcases/kernel/syscalls/setitimer/.gitignore
@@ -1,3 +1,2 @@
 /setitimer01
 /setitimer02
-/setitimer03
diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 9ac9ce1fa..ccba231c9 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -18,17 +18,33 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
-static struct itimerval *value;
+static struct itimerval *value, *ovalue;
+
+static struct tcase {
+       int which;
+       struct itimerval **val;
+       struct itimerval **oval;
+       int exp_errno;
+} tcases[] = {
+       {ITIMER_REAL,    &value, &ovalue, EFAULT},
+       {ITIMER_VIRTUAL, &value, &ovalue, EFAULT},
+       {-ITIMER_PROF,   &value, &ovalue, EINVAL},
+};
 
 static int sys_setitimer(int which, void *new_value, void *old_value)
 {
 	return tst_syscall(__NR_setitimer, which, new_value, old_value);
 }
 
-static void verify_setitimer(void)
+static void verify_setitimer(unsigned int i)
 {
-	TST_EXP_FAIL(sys_setitimer(ITIMER_REAL, value, (struct itimerval *)-1),
-	             EFAULT);
+        struct tcase *tc = &tcases[i];
+
+	if (tc->exp_errno == EFAULT)
+		*(tc->oval) = (struct itimerval *)-1;
+
+	TST_EXP_FAIL(sys_setitimer(tc->which, *(tc->val), *(tc->oval)),
+			tc->exp_errno);
 }
 
 static void setup(void)
@@ -40,10 +56,12 @@ static void setup(void)
 }
 
 static struct tst_test test = {
-	.test_all = verify_setitimer,
+        .tcnt = ARRAY_SIZE(tcases),
+	.test = verify_setitimer,
 	.setup = setup,
 	.bufs = (struct tst_buffers[]) {
-		{&value, .size = sizeof(struct itimerval)},
+		{&value,  .size = sizeof(struct itimerval)},
+		{&ovalue, .size = sizeof(struct itimerval)},
 		{}
 	}
 };
diff --git a/testcases/kernel/syscalls/setitimer/setitimer03.c b/testcases/kernel/syscalls/setitimer/setitimer03.c
deleted file mode 100644
index 418ec71f0..000000000
--- a/testcases/kernel/syscalls/setitimer/setitimer03.c
+++ /dev/null
@@ -1,158 +0,0 @@
-/*
- *
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
- */
-
-/*
- * NAME
- *	setitimer03.c
- *
- * DESCRIPTION
- *	setitimer03 - check that a setitimer() call fails as expected
- *		      with incorrect values.
- *
- * ALGORITHM
- *	loop if that option was specified
- *	allocate needed space and set up needed values
- *	issue the system call
- *	check the errno value
- *	  issue a PASS message if we get EINVAL
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	  break any remaining tests
- *	  call cleanup
- *
- * USAGE:  <for command-line>
- *  setitimer03 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	none
- */
-
-#include "test.h"
-
-#include <errno.h>
-#include <sys/time.h>
-
-void cleanup(void);
-void setup(void);
-
-char *TCID = "setitimer03";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
-{
-	int lc;
-	struct itimerval *value, *ovalue;
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
-
-		/* allocate some space for timer structures */
-
-		if ((value = malloc((size_t)sizeof(struct itimerval))) ==
-		    NULL) {
-			tst_brkm(TBROK, cleanup, "value malloc failed");
-		}
-
-		if ((ovalue = malloc((size_t)sizeof(struct itimerval))) ==
-		    NULL) {
-			tst_brkm(TBROK, cleanup, "value malloc failed");
-		}
-
-		/* set up some reasonable values */
-
-		value->it_value.tv_sec = 30;
-		value->it_value.tv_usec = 0;
-		value->it_interval.tv_sec = 0;
-		value->it_interval.tv_usec = 0;
-
-		/*
-		 * issue the system call with the TEST() macro
-		 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
-		 */
-
-		/* make the first value negative to get a failure */
-		TEST(setitimer(-ITIMER_PROF, value, ovalue));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce expected error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EINVAL:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed to produce expected error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		}
-
-		/*
-		 * clean up things in case we are looping
-		 */
-		free(value);
-		free(ovalue);
-		value = NULL;
-		ovalue = NULL;
-	}
-
-	cleanup();
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
-
-}
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
