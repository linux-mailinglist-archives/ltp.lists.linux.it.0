Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77D3A1BF3
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D82D3C9E9E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 761533C8F09
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:05 +0200 (CEST)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA72914002A7
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:04 +0200 (CEST)
Received: by mail-io1-xd36.google.com with SMTP id d9so23654493ioo.2
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4v1LsUxz9jt+e5i7keMND9qNvgxIocrUgDlwurG+qJc=;
 b=EtxHoS2qv9lpILxwkk4jWeE0saPXvA6uckprWALXJjCFsKEIJWBAySL9y+JveN/AI1
 MgDL/5hDlgK/8W291AcsNA9pn0pMTIf/UcuoZPj4DoUKnOUbAJhgBeL1ktYlU3zS0p6q
 HshFmwFZMgFgXKvq/0/D1EN2MoTAeI9JT0FdOqlFSUk3IpsoxdydA3qS/dGqZ+tMofSh
 bpO+Pxj8ElQjl07bjUHTIqmLiBlhkhmeny+ZYAr+7XieNlFdI9Y/EqdgZ/6cbncgmgrX
 IsIgnjR9MnzmPwTYvzQ3hO+mTfpnUtV9ZdgSZEROlamN4j7/MgQ1rXnBbTxqYfY1LBom
 dhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4v1LsUxz9jt+e5i7keMND9qNvgxIocrUgDlwurG+qJc=;
 b=MwWU8qnBE2AopOUB5pKPMfNsvca8Fbux3P2fHr9wKNui5ief4XvHyMh7yWKIzKdLJo
 BoPoWIuavAukZxrPH2LZCSr9RJ6ShqKA/bT5VnJGskXHl+lqUlqi5D0e0IUY3Ye3lJWb
 q05uH3UVREtYiy38zagJBP8hyFuP1clI4M3jiLaQCom7IR2+0Kv8TIbTZ4oU/g5VQatC
 qIYLNICcSxfjjGZ6DxEn9piqPAqQAspXTfcg60yuLeRjvAi0VwUANrS5N11ewgtg1Zfb
 uy3TuFffUvf78V6iA3DJF2TftJdrI1jPPVluAVYXoiR9/sWYmtdpwg4BpvAq28P9jUuG
 wC0g==
X-Gm-Message-State: AOAM533nkSA1JO6jG/rD+SA9Q56dBO+sOmWzPDFoH5Pa+UhnXvWCri8v
 4PmN853txb+ODsNJoqjoHnY=
X-Google-Smtp-Source: ABdhPJzmNBC9GFl1FK2arH3B2Bed2igzDZ43LXr8t8PHwZzfD+E1ZWGDsPEb4N60z9mzsrG+nnNglQ==
X-Received: by 2002:a05:6638:1682:: with SMTP id
 f2mr660056jat.139.1623260223411; 
 Wed, 09 Jun 2021 10:37:03 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:02 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:56 +0530
Message-Id: <20210609173601.29352-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 05/10] setitimer02: Convert setitimer02 to new API
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
 .../kernel/syscalls/setitimer/setitimer02.c   | 192 +++++-------------
 1 file changed, 51 insertions(+), 141 deletions(-)

diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 4d13cd1e0..656cf7d6a 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -1,161 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 03/2001 - Written by Wayne Boyer
  *
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
  */
 
-/*
- * NAME
- *	setitimer02.c
- *
- * DESCRIPTION
- *	setitimer02 - check that a setitimer() call fails as expected
- *		      with incorrect values.
+/*\
+ * [Description]
  *
- * ALGORITHM
- *	loop if that option was specified
- *	allocate needed space and set up needed values
- *	issue the system call
- *	check the errno value
- *	  issue a PASS message if we get EFAULT
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	  break any remaining tests
- *	  call cleanup
- *
- * USAGE:  <for command-line>
- *  setitimer02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
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
+ * setitimer02 - check that a setitimer() call fails as expected
+ *	 with incorrect values.
  */
 
-#include "test.h"
-
 #include <errno.h>
 #include <sys/time.h>
+#include <stdlib.h>
+#include "tst_test.h"
 
-void cleanup(void);
-void setup(void);
-
-char *TCID = "setitimer02";
-int TST_TOTAL = 1;
-
-#if !defined(UCLINUX)
-
-int main(int ac, char **av)
+static void verify_setitimer(void)
 {
-	int lc;
 	struct itimerval *value;
 
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
-		/* allocate some space for a timer structure */
-		if ((value = malloc((size_t)sizeof(struct itimerval))) ==
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
-		/*
-		 * issue the system call with the TEST() macro
-		 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
-		 */
-
-		/* call with a bad address */
-		TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EFAULT:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		}
-
-		/*
-		 * clean up things in case we are looping
-		 */
-		free(value);
-		value = NULL;
+	/* allocate some space for a timer structure */
+	if ((value = malloc((size_t)sizeof(struct itimerval))) ==
+		NULL) {
+		tst_brk(TBROK, "value malloc failed");
 	}
 
-	cleanup();
-	tst_exit();
-
-}
-
-#else
-
-int main(void)
-{
-	tst_resm(TINFO, "test is not available on uClinux");
-	tst_exit();
-}
-
-#endif /* if !defined(UCLINUX) */
-
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
-{
+	/* set up some reasonable values */
+	value->it_value.tv_sec = 30;
+	value->it_value.tv_usec = 0;
+	value->it_interval.tv_sec = 0;
+	value->it_interval.tv_usec = 0;
+	/*
+	 * issue the system call with the TEST() macro
+	 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
+	 */
+
+	/* call with a bad address */
+	TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
+
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "call failed to produce EFAULT error "
+			"- errno = %d - %s", TST_ERR,
+			strerror(TST_ERR));
+	}
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	switch (TST_ERR) {
+	case EFAULT:
+		tst_res(TPASS, "expected failure - errno = %d - %s",
+			TST_ERR, strerror(TST_ERR));
+		break;
+	default:
+		tst_res(TFAIL, "call failed to produce EFAULT error "
+			"- errno = %d - %s", TST_ERR,
+			strerror(TST_ERR));
+	}
 
-	TEST_PAUSE;
+	/*
+	 * clean up things in case we are looping
+	 */
+	free(value);
+	value = NULL;
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
-{
+static struct tst_test test = {
+	.test_all = verify_setitimer,
+	.needs_root = 1,
+};
 
-}
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
