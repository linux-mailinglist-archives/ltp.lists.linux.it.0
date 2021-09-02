Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECF3FED59
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 14:00:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C1BC3C9988
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 14:00:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A36FE3C993F
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:16 +0200 (CEST)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C938B2009CE
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:15 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id d17so1010712plr.12
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aV2ZHuzGL3/h7tk4A2hqiG/h53aKG9Z3asqDlx16xU=;
 b=Cjg5YqzLhomLi8h4N9aHuOiYME0e2quAO5Zv052hOavRBBA5wdbykF40WmhkE7Xq+n
 OHYsZfYy1dYt7H2CB+hDeZ+EtBFP4HbO4SAJs9QtJe+ol+p0vRkWU/gqPlyjwUzq3X1J
 D+oIXsdNC94xXCiwJuozbsWgtVNsct+uuBAfiRv1QbiQhGkBbG9k6YhjfRt4FpQrQy2b
 vbZoDej10nXmilpECAM94nCP+cn4gl03+Zdww6FsJxig5oRhHO+CHQwkPuhwtcjpdchd
 RMU166nVTif/Te3YD4rgkHjp4bnLYzoEkmO1ochmTH4P5pnYQQlzIdWVdB2fTBOEjK/j
 pYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aV2ZHuzGL3/h7tk4A2hqiG/h53aKG9Z3asqDlx16xU=;
 b=agCknhUoZfJx7HFU5l55gnE4rVykzhuhPmsqjmWrLN5aYYSJED58QBTIepO4vdLNC2
 IEdjJjiYcfI0AN3iaR4wa4OWnWG5TFjP42FE1LKvxjm+k8lJOm9NXb0zVK7LoVYbyHzG
 guhNuPK4ooY7QMBMuxS293qjtWlAeGEVzbuNMPJrwdIDauHN1nrmOFqrCFqc7gH7GxWK
 OChBT2c5VINF8lIQ1rrZzvDerwo1jORm42yrgn+MZV8j0xkBn8vpnJVjbat3S4qyemFX
 WeATeX35kA+xvs5VGCwxO7zUbLDO/liCXwPnL8CrBclNwCAUYkW3QFfu3/LuHRYj/+fE
 qRzQ==
X-Gm-Message-State: AOAM531YuTIr/gDQyGAc7i6/aqOaOzYTmGIW14eml2YLHBjiR84bgD66
 OE0clk9aTfdF31FMxcP8qt0KkVS0SeJ59cBR
X-Google-Smtp-Source: ABdhPJyDTY1XfF9sMGzULY8BfpmlDUpJj8m6aM39TnfhX/CYNw9YtgkzEvh0gko9rzQnIYpTruFK5g==
X-Received: by 2002:a17:90a:9cd:: with SMTP id 71mr3433731pjo.62.1630583954377; 
 Thu, 02 Sep 2021 04:59:14 -0700 (PDT)
Received: from localhost.localdomain (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id d22sm2137490pjw.38.2021.09.02.04.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 04:59:13 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 20:58:49 +0900
Message-Id: <20210902115849.72382-6-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902115849.72382-1-qi.fuli@fujitsu.com>
References: <20210902115849.72382-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] syscalls/dup2/dup205: Convert dup205 to the new
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
 testcases/kernel/syscalls/dup2/dup205.c | 165 +++++++++---------------
 1 file changed, 62 insertions(+), 103 deletions(-)

diff --git a/testcases/kernel/syscalls/dup2/dup205.c b/testcases/kernel/syscalls/dup2/dup205.c
index 0b324531f..30526fda6 100644
--- a/testcases/kernel/syscalls/dup2/dup205.c
+++ b/testcases/kernel/syscalls/dup2/dup205.c
@@ -1,45 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
  *
- *   Copyright (c) International Business Machines  Corp., 2002
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
 
 /* Ported from SPIE, section2/iosuite/dup6.c, by Airong Zhang */
 
-/*======================================================================
-	=================== TESTPLAN SEGMENT ===================
->KEYS:  < dup2()
->WHAT:  < Does dup return -1 on the 21st file?
->HOW:   < Create up to _NFILE files and check for -1 return on the
-	< next attempt
-	< Should check NOFILE as well as _NFILE.  19-Jun-84 Dale.
->BUGS:  <
-======================================================================*/
-
-#include <sys/param.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <errno.h>
-#include <fcntl.h>
+#include <stdlib.h>
 #include <stdio.h>
-#include <unistd.h>
-#include "test.h"
+#include "tst_test.h"
 
-char *TCID = "dup205";
-int TST_TOTAL = 1;
 int *fildes;
 int min;
 int local_flag;
@@ -47,88 +18,76 @@ int local_flag;
 #define PASSED 1
 #define FAILED 0
 
-static void setup(void);
-static void cleanup(void);
+static void setup(void)
+{
+	min = getdtablesize();	/* get number of files allowed open */
+	fildes = malloc((min + 10) * sizeof(int));
+	if (fildes == NULL)
+		tst_brk(TBROK | TERRNO, "malloc error");
+}
+
+static void cleanup(void)
+{
+	if (fildes != NULL)
+		free(fildes);
+}
 
-int main(int ac, char *av[])
+static void run(void)
 {
 	int ifile;
 	char pfilname[40];
 	int serrno;
 
-	int lc;
-
 	ifile = -1;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
 	local_flag = PASSED;
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		sprintf(pfilname, "./dup205.%d\n", getpid());
-		unlink(pfilname);
-		serrno = 0;
-		if ((fildes[0] = creat(pfilname, 0666)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "creat failed");
-		else {
-			fildes[fildes[0]] = fildes[0];
-			for (ifile = fildes[0] + 1; ifile < min + 10; ifile++) {
-				if ((fildes[ifile] = dup2(fildes[ifile - 1],
-							  ifile)) == -1) {
-					serrno = errno;
-					break;
-				} else {
-					if (fildes[ifile] != ifile) {
-						tst_brkm(TFAIL, cleanup,
-							 "got wrong descriptor "
-							 "number back (%d != %d)",
-							 fildes[ifile], ifile);
-					}
-				}
-			}	/* end for */
-			if (ifile < min) {
-				tst_resm(TFAIL, "Not enough files duped");
-				local_flag = FAILED;
-			} else if (ifile > min) {
-				tst_resm(TFAIL, "Too many files duped");
-				local_flag = FAILED;
-			}
-			if (serrno != EBADF && serrno != EMFILE &&
-			    serrno != EINVAL) {
-				tst_resm(TFAIL, "bad errno on dup2 failure");
-				local_flag = FAILED;
+	sprintf(pfilname, "./dup205.%d\n", getpid());
+	unlink(pfilname);
+	serrno = 0;
+
+	fildes[0] = creat(pfilname, 0666);
+	if (fildes[0] == -1)
+		tst_brk(TBROK | TERRNO, "creat failed");
+	else {
+		fildes[fildes[0]] = fildes[0];
+		for (ifile = fildes[0] + 1; ifile < min + 10; ifile++) {
+			fildes[ifile] = dup2(fildes[ifile - 1], ifile);
+			if (fildes[ifile] == -1) {
+				serrno = errno;
+				break;
 			}
+			if (fildes[ifile] != ifile)
+				tst_brk(TFAIL, "got wrong descriptor "
+					"number back (%d != %d)",
+					fildes[ifile], ifile);
+		}	/* end for */
+		if (ifile < min) {
+			tst_res(TFAIL, "Not enough files duped");
+			local_flag = FAILED;
+		} else if (ifile > min) {
+			tst_res(TFAIL, "Too many files duped");
+			local_flag = FAILED;
 		}
-		unlink(pfilname);
-		for (ifile = fildes[0]; ifile < min + 10; ifile++)
-			close(fildes[ifile]);
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed.");
-		} else {
-			tst_resm(TFAIL, "Test failed.");
+		if (serrno != EBADF && serrno != EMFILE &&
+			    serrno != EINVAL) {
+			tst_res(TFAIL, "bad errno on dup2 failure");
+			local_flag = FAILED;
 		}
-
 	}
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_tmpdir();
-
-	min = getdtablesize();	/* get number of files allowed open */
-	fildes = malloc((min + 10) * sizeof(int));
-	if (fildes == NULL)
-		tst_brkm(TBROK | TERRNO, cleanup, "malloc error");
+	unlink(pfilname);
+	for (ifile = fildes[0]; ifile < min + 10; ifile++)
+		close(fildes[ifile]);
+	if (local_flag == PASSED) {
+		tst_res(TPASS, "Test passed.");
+	} else {
+			tst_res(TFAIL, "Test failed.");
+	}
 }
 
-static void cleanup(void)
-{
-	if (fildes != NULL)
-		free(fildes);
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
