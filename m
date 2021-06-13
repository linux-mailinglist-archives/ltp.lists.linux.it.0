Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E104A3A59AF
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:43:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 954D13C4D41
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:43:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 593D03C2819
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:43:48 +0200 (CEST)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8328160006E
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:43:48 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id 11so5313819plk.12
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mq3E1fkxDuWyXwRDfVW0WZO6XgeTes3SUfPuCsmWAKo=;
 b=J9//iLxnTyQFKNKT8VKFnzTHBw15Ibu1D3JMC6JWZz/K1iJXNzQDrD+ehcZIgFDNnF
 MYpgAIctxh/xg3uiPEmCoifRyvE+IAMQnpCYCMH9hTlTpfWOuvg0hh6r/Z+KrPk4L4TN
 Lqz5BgdAhLpjYvymcvDVwNdYG9xuseGCS22lRxUbiYTFlSrBQTVmc5l2NdXsTpA1suvv
 xy3A82u6Fy6zaWNQKO3krot2xVCTQUzbRGKfrt2kPoVU4JHb0GQK/KhFMdjrEsrKRp4s
 fSSPoDzouz622NA5yijJ5igiRPkW2BtPcTeduuIO9AqvkECRPMZFzFb/5u13fU09GS0n
 6A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mq3E1fkxDuWyXwRDfVW0WZO6XgeTes3SUfPuCsmWAKo=;
 b=mPAjtLL+TbXArK78oQ9BFObLwq32SYvD7FMsx2IfZLMIyhv9zjzwn/4sbFHA1vfgzo
 QIsf6psGphy9TiO4db5HB93QFu7GUlHS8912YfN4160i8PMPloTI6PuzPB34anhpAP0y
 f2Hd8A8OR7t79LTjiLX5mZU6y525QihTp/99ADdBi1ftgoJpxixbDVmQq8S3tsFhEP2M
 ZMD7Po9ql4uZoA/r2M/K7jSzpBSXh7HfSaOBqBXGRGLjynDGfLeWGtd/YG60aM1cU2yS
 eP5pNR6t5QHudLkUmPLmal3PvsxgyxupBR3r99wJqN23OiBpY5pJ4uur50c0BZ278v2l
 i9YA==
X-Gm-Message-State: AOAM5326QfoGr6ljyr6Jq2Pb9xyoJeITQj1a1k4B0UtDpcirCe55xf4V
 8Rb45kIJXdN6w4LUTvkEYEI=
X-Google-Smtp-Source: ABdhPJz1hTqoFbmGIW/o4Tc3+j+Q44+ZkuTcIJmlRFigSVSPTFGS3Bw8oTopIsFBN8OUwQTrtFJ9ig==
X-Received: by 2002:a17:902:ee8c:b029:fe:dc5f:564 with SMTP id
 a12-20020a170902ee8cb02900fedc5f0564mr13314550pld.71.1623602626654; 
 Sun, 13 Jun 2021 09:43:46 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id z6sm6089022pgs.24.2021.06.13.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 09:43:45 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 22:13:35 +0530
Message-Id: <20210613164335.6035-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNoFyN89L6/VhP3@yuki>
References: <YMNoFyN89L6/VhP3@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] getitimer02: Convert getitimer02 to new API
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getitimer/getitimer02.c   | 104 +++---------------
 1 file changed, 16 insertions(+), 88 deletions(-)

diff --git a/testcases/kernel/syscalls/getitimer/getitimer02.c b/testcases/kernel/syscalls/getitimer/getitimer02.c
index b9c03143a..2eb3f3a94 100644
--- a/testcases/kernel/syscalls/getitimer/getitimer02.c
+++ b/testcases/kernel/syscalls/getitimer/getitimer02.c
@@ -1,99 +1,27 @@
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
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		/* call with a bad address */
-		TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce "
-				 "expected error - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			continue;
-		}
-
-		switch (TEST_ERRNO) {
-		case EFAULT:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed to produce "
-				 "expected error - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		}
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
+static void verify_getitimer(void)
 {
-	tst_resm(TINFO, "test is not available on uClinux");
-	tst_exit();
+	/* call with a bad address */
+	TST_EXP_FAIL(getitimer(ITIMER_REAL, (struct itimerval *)-1),
+		EFAULT, "expected failure - errno = %d - %s", TST_ERR, strerror(TST_ERR));
 }
 
-#endif /* if !defined(UCLINUX) */
+static struct tst_test test = {
+	.test_all = verify_getitimer,
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
