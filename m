Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E753A1BEE
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:36:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 936FB3C972A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:36:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C32D3C3232
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:51 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66C2D200C3C
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:36:51 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id k16so23611887ios.10
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zIktUBa92R20S2QWwUj54GDjreF3r0ISwblcl6MkyNE=;
 b=mqVam4/iIn2rF4lScQ+MnMKNYgVSZeJozTG9WmyqAYysj9evrlIwGj+vOlIE4S2C4K
 zTw/TVQmFufsxz3GW+4PxvN75qgfBLwqnylcoJAN+JN+CZhYqq+QvqnWrDZYUsaYGx8e
 ISG4AKs21uMHTnbGzoQIL+zsPLYnbdUQfxwDSSdFt6sjUTYnHv24xT6rcjfmzIxR/8+I
 8B+qQ4R27moJ5XT5n93ms//+zLCuczfYRbgBoMqfdlTgGxYiZNo+4T0FqUXQ7aRDbHnc
 +AccHU4Ws1YKOuUCpUQBZwNb0AKEVWgro8Ydjyxng3g2O9uEFpyUP27zTlbVq7XZ000y
 vKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zIktUBa92R20S2QWwUj54GDjreF3r0ISwblcl6MkyNE=;
 b=pkRyoqeIjfwYCP9izxvaozzrmuMXsyReZHZdzCXUODrVOgZdl+iUZ6QiC5HGxBSHMU
 Ms6+JCDsiEeugLEzIEkFLtlOGYwWZimsKQ0wqGvLxKyF+07GyL76XmWeNNHOuwIWtCAO
 phnojf0s9AWdZcxct/AqLsv7ORMX94Ewm4PL2cQgjrGTBlHWi6wyTbhkClNKIL6pKnMH
 eAShPSQAl/mB8MIl7pRA17UZ47q3U928fmn+8+3g39T0gKv9GRoyPlEgB7oamcYNYsxN
 RjHYt6Wef3nnbTm2NW88/uWZqNqrZSuW8dTGAE46nZAXvJrXvDJv3n+lQTn35y372Dpm
 cJPQ==
X-Gm-Message-State: AOAM531xYDQH5fbOEJPzZk7shRxNuidSQ2WcOTJwfzyaJM5CIKcErOOx
 rtE6WEQFmloao0lQ+9o6dVk=
X-Google-Smtp-Source: ABdhPJznCJlFJpnfCOOC26+t7l27irMuvmQq3+5gFUi0TA7hhvRjvI6HKtHUBb5AQ3GO6AbF/VVDTg==
X-Received: by 2002:a5d:9694:: with SMTP id m20mr416230ion.185.1623260210060; 
 Wed, 09 Jun 2021 10:36:50 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:36:49 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:52 +0530
Message-Id: <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YL/Wf51Y6V5lRnkM@pevik>
References: <YL/Wf51Y6V5lRnkM@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 01/10] getitimer02 : Convert getitimer02 to new API
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
 .../kernel/syscalls/getitimer/getitimer02.c   | 103 ++++--------------
 1 file changed, 24 insertions(+), 79 deletions(-)

diff --git a/testcases/kernel/syscalls/getitimer/getitimer02.c b/testcases/kernel/syscalls/getitimer/getitimer02.c
index b9c03143a..c2ca8880b 100644
--- a/testcases/kernel/syscalls/getitimer/getitimer02.c
+++ b/testcases/kernel/syscalls/getitimer/getitimer02.c
@@ -1,99 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * 03/2001 - Written by Wayne Boyer
  */
 
-/*
-  HISTORY
-  03/2001 - Written by Wayne Boyer
-
-  TEST ITEMS:
-  Check that a getitimer() call fails as expected
-  with an incorrect second argument.
-*/
-
-
-#include "test.h"
+/*\
+ *[Description]
+ *
+ * Check that a getitimer() call fails as expected
+ * with an incorrect second argument.
+ */
 
 #include <errno.h>
 #include <sys/time.h>
+#include "tst_test.h"
 
-char *TCID = "getitimer02";
-int TST_TOTAL = 1;
-
-#if !defined(UCLINUX)
-
-static void cleanup(void);
-static void setup(void);
-
-int main(int ac, char **av)
+static void verify_getitimer(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
 		/* call with a bad address */
 		TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));
 
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce "
-				 "expected error - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			continue;
+		if (TST_RET == 0) {
+			tst_res(TFAIL, "call failed to produce "
+				"expected error - errno = %d - %s",
+				TST_ERR, strerror(TST_ERR));
 		}
 
-		switch (TEST_ERRNO) {
+		switch (TST_ERR) {
 		case EFAULT:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
+			tst_res(TPASS, "expected failure - errno = %d - %s",
+				 TST_ERR, strerror(TST_ERR));
 			break;
 		default:
-			tst_resm(TFAIL, "call failed to produce "
-				 "expected error - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
+			tst_res(TFAIL, "call failed to produce "
+					"expected error - errno = %d - %s",
+					TST_ERR, strerror(TST_ERR));
 		}
-	}
-
-	cleanup();
-
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-static void cleanup(void)
-{
-}
-
-#else
-
-int main(void)
-{
-	tst_resm(TINFO, "test is not available on uClinux");
-	tst_exit();
 }
 
-#endif /* if !defined(UCLINUX) */
+static struct tst_test test = {
+			.test_all = verify_getitimer,
+			.needs_root = 1,
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
