Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F96349962
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74AD83C281B
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E36233C8E40
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:20:01 +0100 (CET)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 32FE3200FC0
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:20:01 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3074776pjh.1
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2kDvVnCTCoBM1B1cUjJj/X5ryW/clMiuUeNUqMQAqU=;
 b=LassDj647b8qeT0pCgnjoZ6dkKkOWwQcyZUn4QPLxdiK+XCcYAJTF8/ulr3ru4kmKr
 VS/heOO277bfFZDrha88IcAFUvpiKumMOd+aB9+xiuF2Mjfdw8GuaKiABYz6bhMwwjDf
 8UY164ikIQH3BrhqlOiK+4TjhH9oCqjOS2GbBiyvk0vupIdVUZm3lcu1UXodVaBmRAy7
 WKEma52CW3MBdM+M9y+7nbcHoGx9F5dKB0hwTnpzcneuFYQsbdnemF/pfxqqpPUrAU4f
 0YWqlRg6JZMrHWJJeYTm4rlgZjCAuazRGqSaXCrzhasOhgqv7hWFYAvrsJvPkRsP8Yuq
 TZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2kDvVnCTCoBM1B1cUjJj/X5ryW/clMiuUeNUqMQAqU=;
 b=a51NcCSyn24WRopBPvV42GyyW/4dreOzWXkbOryNmRjW4HgExW3G548JgD/h0LIxXN
 BlRdfW4paUOPxSVe+fqzyuUx6qNUtCmDmIJ6V5b0sn19pN/OXn+Ad8zfBDL4uqiBkszG
 lWFK7TO4drAavKzbprwydGCmGNrFcG/ZRXkRpRXmJtQcMlfumwtKU1uNEz/QbdunnhYi
 wR3Rw7tCR0Sh+JvYcmkN1DwFwKei5ustFXveyVvUbAZjCdEjxxgSwRDC7We96G4FP72+
 hJm6yWBg3oMOu8y1fLMknZO6PCSePToos/qM92WwgFKzFTivcX84LhsQpcpvMP266WsN
 hh1w==
X-Gm-Message-State: AOAM531kohDQR1NdLZ7i7mYs+XurrD8O6CEiXiMki4fKe/Wl0cxguJRB
 LmhEUK+wul8byUXQlCLksigP+kJt7nU=
X-Google-Smtp-Source: ABdhPJzuyd7Q1Pkeo/tkS8qgRiGnfx4gUu+X0iWMM18CpKGh7oibsnn47vnqemwCve0qgEbqFEo2VQ==
X-Received: by 2002:a17:90a:2c09:: with SMTP id
 m9mr10220568pjd.3.1616696399382; 
 Thu, 25 Mar 2021 11:19:59 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id i20sm5977597pgg.65.2021.03.25.11.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 11:19:58 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 03:19:05 +0900
Message-Id: <20210325181906.40688-4-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325181906.40688-1-qi.fuli@fujitsu.com>
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/swapon/swapon02: Convert swapon02 to the
 new API
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
 testcases/kernel/syscalls/swapon/swapon02.c | 145 +++++++-------------
 1 file changed, 52 insertions(+), 93 deletions(-)

diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
index f0f99619d..070bc648b 100644
--- a/testcases/kernel/syscalls/swapon/swapon02.c
+++ b/testcases/kernel/syscalls/swapon/swapon02.c
@@ -1,18 +1,9 @@
-/* Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  */
+
 /*
  * This test case checks whether swapon(2) system call  returns
  *  1. ENOENT when the path does not exist
@@ -21,41 +12,27 @@
  *  4. EBUSY when the specified path is already being used as a swap area
  */

-#include <unistd.h>
 #include <errno.h>
-#include <stdlib.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/stat.h>
-#include <fcntl.h>
 #include <pwd.h>
-#include <string.h>
-#include <sys/utsname.h>
-#include <signal.h>
-#include "test.h"
+
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-#include "safe_macros.h"
-#include "libswapon.h"
+#include "libswap.h"

-static void setup(void);
-static void cleanup(void);
 static void setup01(void);
 static void cleanup01(void);

-char *TCID = "swapon02";
-int TST_TOTAL = 4;
-
 static uid_t nobody_uid;
 static int do_swapoff;

-static struct test_case_t {
+static struct tcase {
 	char *err_desc;
 	int exp_errno;
 	char *exp_errval;
 	char *path;
 	void (*setup)(void);
 	void (*cleanup)(void);
-} testcases[] = {
+} tcases[] = {
 	{"Path does not exist", ENOENT, "ENOENT", "./doesnotexist", NULL, NULL},
 	{"Invalid path", EINVAL, "EINVAL", "./notswap", NULL, NULL},
 	{"Permission denied", EPERM, "EPERM", "./swapfile01",
@@ -63,87 +40,69 @@ static struct test_case_t {
 	{"File already used", EBUSY, "EBUSY", "./alreadyused", NULL, NULL},
 };

-static void verify_swapon(struct test_case_t *test)
-{
-	if (test->setup)
-		test->setup();
-
-	TEST(ltp_syscall(__NR_swapon, test->path, 0));
-
-	if (test->cleanup)
-		test->cleanup();
-
-	if (TEST_RETURN == -1 && TEST_ERRNO == test->exp_errno) {
-		tst_resm(TPASS, "swapon(2) expected failure;"
-			 " Got errno - %s : %s",
-			 test->exp_errval, test->err_desc);
-		return;
-	}
-
-	tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
-	         " %d, errno: %s and got %d.", test->exp_errno,
-	         test->exp_errval, TEST_ERRNO);
-}
-
-int main(int ac, char **av)
-{
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		for (i = 0; i < TST_TOTAL; i++)
-			verify_swapon(testcases + i);
-	}
-
-	cleanup();
-	tst_exit();
-}
-
 static void setup01(void)
 {
-	SAFE_SETEUID(cleanup, nobody_uid);
+	SAFE_SETEUID(nobody_uid);
 }

 static void cleanup01(void)
 {
-	SAFE_SETEUID(cleanup, 0);
+	SAFE_SETEUID(0);
 }

 static void setup(void)
 {
 	struct passwd *nobody;

-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	nobody = SAFE_GETPWNAM(cleanup, "nobody");
+	nobody = SAFE_GETPWNAM("nobody");
 	nobody_uid = nobody->pw_uid;

-	tst_tmpdir();
-
-	is_swap_supported(cleanup, "./tstswap");
+	is_swap_supported("./tstswap");

-	SAFE_TOUCH(cleanup, "notswap", 0777, NULL);
-	make_swapfile(cleanup, "swapfile01", 0);
-	make_swapfile(cleanup, "alreadyused", 0);
+	SAFE_TOUCH("notswap", 0777, NULL);
+	make_swapfile("swapfile01", 0);
+	make_swapfile("alreadyused", 0);

-	if (ltp_syscall(__NR_swapon, "alreadyused", 0))
-		tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
+	if (tst_syscall(__NR_swapon, "alreadyused", 0))
+		tst_res(TWARN | TERRNO, "swapon(alreadyused) failed");
 	else
 		do_swapoff = 1;
-
-	TEST_PAUSE;
 }

 void cleanup(void)
 {
-	if (do_swapoff && ltp_syscall(__NR_swapoff, "alreadyused"))
-		tst_resm(TWARN | TERRNO, "swapoff(alreadyused) failed");
+	if (do_swapoff && tst_syscall(__NR_swapoff, "alreadyused"))
+		tst_res(TWARN | TERRNO, "swapoff(alreadyused) failed");
+}

-	tst_rmdir();
+static void verify_swapon(unsigned int i)
+{
+	struct tcase *tc = tcases + i;
+	if (tc->setup)
+		tc->setup();
+
+	TEST(tst_syscall(__NR_swapon, tc->path, 0));
+
+	if (tc->cleanup)
+		tc->cleanup();
+
+	if (TST_RET == -1 && TST_ERR == tc->exp_errno) {
+		tst_res(TPASS, "swapon(2) expected failure;"
+			 " Got errno - %s : %s",
+			 tc->exp_errval, tc->err_desc);
+		return;
+	}
+
+	tst_res(TFAIL, "swapon(2) failed to produce expected error:"
+	         " %d, errno: %s and got %d.", tc->exp_errno,
+	         tc->exp_errval, TST_ERR);
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.test = verify_swapon,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.cleanup = cleanup
+};
--
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
