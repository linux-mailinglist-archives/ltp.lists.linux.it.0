Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3C34B63F
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 356FD3C7842
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8B0943C8DED
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:10 +0100 (CET)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0EEF21A006E9
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:10 +0100 (CET)
Received: by mail-pf1-x42b.google.com with SMTP id c204so6599321pfc.4
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgRjo4C2jupd/Pem+upgROWtyXiXeQj4CpgHhecLq68=;
 b=bu+vGPowv/Olov/ieYDJxkrmrHep90Jtt8Gl4AQApVEb52VqcrXRbcaSfD+YG9JTT/
 K9vjf6IE2RtNyAWe01jIVHXlbE3rxqaemYw7u0lR281SiViv0YwaaIAZWHXQdpPONCkn
 OuwoQHt43lTiSVh8ZtPMxy6MxEPtu9shzD7ZQGSbLuSV4jWgp6xHLyaOpruQMvzcEbq7
 hkJJ8U5PtlQEuGxZlUuAB9PsGQs1Bl2FbJ60t9ig9WG6bSjyw8RfWD+OQHGl+zizhncF
 cTEc6VqQOrM9B852S32w7RpiSBZ5hFi4PTjlIbncX3xdXRdDtOjn0SicqlZSgAQdsRqk
 q9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgRjo4C2jupd/Pem+upgROWtyXiXeQj4CpgHhecLq68=;
 b=H5UZmH48y6ywtwLtiyqrWrPiBLzrxlZ/7Oi3O+FptrNeJPpCDBhZgl9y9wmvTP8x9T
 iX2KL2hIliY1G01bs4B7hhE9SLNTlNvFjatE45yGvVCjidOeywaZw/kH0pl/jPvVG8ju
 7+jcDNskcCRIpjjFaOCSiPVDWzAwPf9j7/jPOFqob9BmmhdPSCMXgGCKAsxpcHaxm5dX
 2Aa6DOR1R5j2MSCnmmP+AogMOzoJpWGxp2Cv1b7iRl7WmM/mf+altelUnLY6ypQCkJuF
 FgdkmiYvY6QNYL3SZnMxPa+00+xdDL/gZT45mxbVGajC3eIdJ+Wath6AEdJpoatKexKR
 WVEQ==
X-Gm-Message-State: AOAM533eeAx0XDGwwPAWUTKDY0PVHkISmBQ4BFhVgliVJDnFYpG9sgBp
 yvdX0C1GZSYmPQqPf8WUkgF8skQaIQ5olg==
X-Google-Smtp-Source: ABdhPJxAS1wxVZRdfWynKWTuMBF9VEB3cwxu/rv1cn1t115/HavJw3apltff7s17bPmy20IwZakw0g==
X-Received: by 2002:a05:6a00:cc7:b029:203:6bc9:3edf with SMTP id
 b7-20020a056a000cc7b02902036bc93edfmr16472168pfv.23.1616841188341; 
 Sat, 27 Mar 2021 03:33:08 -0700 (PDT)
Received: from localhost.localdomain (softbank060103061185.bbtec.net.
 [60.103.61.185])
 by smtp.gmail.com with ESMTPSA id q184sm11890097pfc.78.2021.03.27.03.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 03:33:07 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 27 Mar 2021 19:32:25 +0900
Message-Id: <20210327103226.99073-6-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327103226.99073-1-qi.fuli@fujitsu.com>
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/6] syscalls/swapoff/swapoff01: Convert swapoff01 to
 the new API
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
 testcases/kernel/syscalls/swapoff/Makefile    |  4 +-
 testcases/kernel/syscalls/swapoff/swapoff01.c | 94 +++++--------------
 2 files changed, 27 insertions(+), 71 deletions(-)

diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
index a74374605..6954112a8 100644
--- a/testcases/kernel/syscalls/swapoff/Makefile
+++ b/testcases/kernel/syscalls/swapoff/Makefile
@@ -3,10 +3,10 @@
 
 top_srcdir		?= ../../../..
 
-LTPLIBS = ltpswapon
+LTPLIBS = ltpswap
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LTPLDLIBS  = -lltpswapon
+LTPLDLIBS  = -lltpswap
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
index 1a707625a..6ef01c7be 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
@@ -1,18 +1,6 @@
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
  */
 
 /*
@@ -20,81 +8,49 @@
  */
 
 #include <unistd.h>
-#include "test.h"
 #include <errno.h>
 #include <stdlib.h>
-#include "config.h"
-#include "lapi/syscalls.h"
-#include "libswapon.h"
-
-static void setup(void);
-static void cleanup(void);
-static void verify_swapoff(void);
-
-char *TCID = "swapoff01";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
-{
-	int lc;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		verify_swapoff();
-	}
-
-	cleanup();
-	tst_exit();
-}
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "libswap.h"
 
 static void verify_swapoff(void)
 {
-	if (ltp_syscall(__NR_swapon, "./swapfile01", 0) != 0) {
-		tst_resm(TBROK, "Failed to turn on the swap file"
+	if (tst_syscall(__NR_swapon, "./swapfile01", 0) != 0) {
+		tst_res(TFAIL, "Failed to turn on the swap file"
 			 ", skipping test iteration");
 		return;
 	}
 
-	TEST(ltp_syscall(__NR_swapoff, "./swapfile01"));
+	TEST(tst_syscall(__NR_swapoff, "./swapfile01"));
 
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "Failed to turn off swapfile,"
-		         " system reboot after execution of LTP "
-			 "test suite is recommended.");
-	} else {
-		tst_resm(TPASS, "Succeeded to turn off swapfile");
-	}
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "Failed to turn off swapfile,"
+			" system reboot after execution of LTP "
+			"test suite is recommended.");
+	else
+		tst_res(TPASS, "Succeeded to turn off swapfile");
 }
 
 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	is_swap_supported("./tstswap");
 
-	is_swap_supported(cleanup, "./tstswap");
-
-	if (!tst_fs_has_free(NULL, ".", 64, TST_MB)) {
-		tst_brkm(TBROK, cleanup,
-			 "Insufficient disk space to create swap file");
-	}
+	if (!tst_fs_has_free(".", 64, TST_MB))
+		tst_brk(TBROK,
+			"Insufficient disk space to create swap file");
 
 	if (tst_fill_file("swapfile01", 0x00, 1024, 65536))
-		tst_brkm(TBROK, cleanup, "Failed to create file for swap");
+		tst_brk(TBROK, "Failed to create file for swap");
 
 	if (system("mkswap swapfile01 > tmpfile 2>&1") != 0)
-		tst_brkm(TBROK, cleanup, "Failed to make swapfile");
+		tst_brk(TBROK, "Failed to make swapfile");
 }
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.test_all = verify_swapoff,
+	.setup = setup
+};
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
