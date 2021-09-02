Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C33FED56
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 492F03C998B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F32BB3C995A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:14 +0200 (CEST)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6840D1A0122C
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:14 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id q21so1025743plq.3
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JXmzH6OpwVSaf6kMgtDSnVKqLL0o/cFf6NG9LmheO4=;
 b=WtpQiIqkaNB6V22fLw8WQdgVWWLuT6zuYGAienQabBBKIzd1Cglja80tgY2WIH9HD+
 Sh22WEXrh2sqH0CnoTZVWo23Ljjh94S5Z4QqLi8O0nBuYq/pzNxxudqrQImP8Qvp39Vr
 qcYxRBZZEtAWRkJwQc+70I2aKQAoIUbeFrQOIoOag4HnR5l8Nra9FTC8g5j1SzGR7Cf0
 Q58AS1V1w3jNM7DqNM96OdLWT1FN2H6rmi01xxJxnnaGXI9bob6C0ejm+ojBtpJjDdsi
 +KsaTm1gUS4WeDXisu1PWdh5Xr5aYjOt2xhhiSuhBrq4hdeMNIc3MfDrR95TzyH5v1SW
 gl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JXmzH6OpwVSaf6kMgtDSnVKqLL0o/cFf6NG9LmheO4=;
 b=mFFd5Dc0ONwBGMqMkuKnFuMvpi53ewFU+FwGsbIKRKDpYB9WUnM5lgFc31019lE/+t
 cxsa/wpQZaAmLwbl6leq1VIPx8kRr9ag1A0NUYGTB4dQTc4kpypb27xacDNO1AEGLims
 +vvBFPut0ROgHkvrQgcjpWGXWV7CPMEwS/vEwHwkhWvvd640S4Kt0qCVshFREg0Xp2QU
 pxKi4KdFBmiDi170tOidfpNvSrIRCfpqZPMbIEuIXL5ut4LPdpP0juGo3PPJc9xrJ6ws
 A/t923FDfPfUxKgxQBiHwPggH43ls4ajJdE10Qvsw9Z0U4pb05JYDnA62jIct7fNN+O2
 nNJQ==
X-Gm-Message-State: AOAM531pZVebm/O6qGQXd4LbKEFFPTifRyZIoBY693tfCik74JKbE7fU
 BbwOaeb+C64laLWNX2GxxWX59SU0mLXCPZbM
X-Google-Smtp-Source: ABdhPJxqlHJc4MykuONDxSA9sJbA3Crs37X7R6ySao/hfNBRnkTCwa1UtY99nPX6mGcS4sSl9cSEAA==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr3537137pjg.75.1630583952974; 
 Thu, 02 Sep 2021 04:59:12 -0700 (PDT)
Received: from localhost.localdomain (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id d22sm2137490pjw.38.2021.09.02.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 04:59:12 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 20:58:48 +0900
Message-Id: <20210902115849.72382-5-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902115849.72382-1-qi.fuli@fujitsu.com>
References: <20210902115849.72382-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] syscalls/dup2/dup204: Convert dup204 to the new
 API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/dup2/dup204.c | 135 ++++++------------------
 1 file changed, 35 insertions(+), 100 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup204.c b/testcases/kernel/syscalls/dup2/dup204.c
index a357bc17e..3fd6b0832 100644
--- a/testcases/kernel/syscalls/dup2/dup204.c
+++ b/testcases/kernel/syscalls/dup2/dup204.c
@@ -1,118 +1,25 @@
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
+// SPDX-License-Identifier: GPL-2.0-or-later
 
 /*
- * NAME
- *	dup204.c
+ * Copyright (c) International Business Machines  Corp., 2001
  *
- * DESCRIPTION
+ * DESCRIPTION:
  *	Testcase to check the basic functionality of dup2(2).
- *
- * ALGORITHM
- *	attempt to call dup2() on read/write ends of a pipe
- *
- * USAGE:  <for command-line>
- *  dup204 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * RESTRICTION
- *	NONE
  */
 
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
-#include <sys/types.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <errno.h>
-#include <signal.h>
-#include <string.h>
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();
-void cleanup();
-
-char *TCID = "dup204";
-int TST_TOTAL = 2;
+#include "tst_test.h"
+#include "tst_safe_macros.h"
 
 int fd[2];
 int nfd[2];
 
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-	struct stat oldbuf, newbuf;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(dup2(fd[i], nfd[i]));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "call failed unexpectedly");
-				continue;
-			}
-
-			SAFE_FSTAT(cleanup, fd[i], &oldbuf);
-			SAFE_FSTAT(cleanup, nfd[i], &newbuf);
-
-			if (oldbuf.st_ino != newbuf.st_ino)
-				tst_resm(TFAIL, "original and duped "
-					 "inodes do not match");
-			else
-				tst_resm(TPASS, "original and duped "
-					 "inodes are the same");
-
-			SAFE_CLOSE(cleanup, TEST_RETURN);
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
 void setup(void)
 {
 	fd[0] = -1;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	SAFE_PIPE(cleanup, fd);
+	SAFE_PIPE(fd);
 }
 
 void cleanup(void)
@@ -123,6 +30,34 @@ void cleanup(void)
 		close(fd[i]);
 		close(nfd[i]);
 	}
+}
+
+static void run(unsigned int i)
+{
+	struct stat oldbuf, newbuf;
+
+	TEST(dup2(fd[i], nfd[i]));
 
-	tst_rmdir();
+	if (TST_RET == -1) {
+		tst_res(TFAIL, "call failed unexpectedly");
+		return;
+	}
+
+	SAFE_FSTAT(fd[i], &oldbuf);
+	SAFE_FSTAT(nfd[i], &newbuf);
+
+	if (oldbuf.st_ino != newbuf.st_ino)
+		tst_res(TFAIL, "original and duped inodes do not match");
+	else
+		tst_res(TPASS, "original and duped inodes are the same");
+
+	SAFE_CLOSE(TST_RET);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.tcnt = 2,
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
