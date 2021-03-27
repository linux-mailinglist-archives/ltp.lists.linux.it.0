Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57834B63B
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B00403C2C31
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E06F13C2E48
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:03 +0100 (CET)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4337C200763
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:03 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso3655660pjb.3
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUTVOUer2X3CmhQhoPtyZuzQqQ70GCwCPtwneXx3BDk=;
 b=k3PHSnG9XnAnXbe2OSmXxHObvqNvrx6G1cBQdQiRdqGWgnEzgTvEHxyCwZA9paAlTH
 +d+pGOJTW92r9tqKEwyDfNGxRNxb/NTdQ4owX+kIKIq4My//swttic7gGkmSbcT6aAir
 osS3RvakJzNP3WbMHkHhyQWNoinKC1Gremu50H8pEFZNsi6rCWVEL0GU9zGgG3tz5f5R
 ATkPfE11soyhvo0HaGsiym+BY8TvV7MdcogtY1KSsbEutiRk49CdK1hQTl5Yg6nvZRrT
 BE+nGH5PVtF9NpLxY+0B8VX917TJRjCWwbttsfh7JGejFyfzUTYOcpF3y1oCQo7bngAF
 3qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUTVOUer2X3CmhQhoPtyZuzQqQ70GCwCPtwneXx3BDk=;
 b=mq94xMMwWuTNLdPAD8skSI4SHYM6gIpO/bXKvMJ5ZbCjdifX9YJRQGPKjxIpY9kNMs
 u9CZ7LkawSYE224cdQ3Abb2yGerciSuk9R2oeCp5IEAgMxzeEJaWDcMOgsUqEFjXTq8E
 /DE1yfkOlCE6ijybJYxEe80d3smBKnBZC6aF+3QExn+4zvhVj5RzOBSYdqTyzsRSJII7
 xnOf0lL1O2HdojIVHl+lkf36DY+QKsKi9ydFHJh30AmdXNEKM2BIfOjtwwdII6FS/LvZ
 +YhrkOLJJpRnQaPkhx9SPOb9elytsM1IZG09gDlhSjq0sr6ZsZ4muENLxd1Ju02A8tSZ
 H+gg==
X-Gm-Message-State: AOAM531uI21bRTfBDwprn6MtbZcBFvs543BTXqFvcCEMQCVqWM+Cwcjj
 qU5ib0ag1JKhnovj9D2FPx/Kos65Kp3IQw==
X-Google-Smtp-Source: ABdhPJx+RFpduGbd68CMoO6RWrvSQgdyrv8pyfrD2FZDF9nVVyEg/sg4XOLkiFDNOxpbwI+LavtsWA==
X-Received: by 2002:a17:902:a9c2:b029:e7:147f:76a1 with SMTP id
 b2-20020a170902a9c2b02900e7147f76a1mr14894263plr.5.1616841181529; 
 Sat, 27 Mar 2021 03:33:01 -0700 (PDT)
Received: from localhost.localdomain (softbank060103061185.bbtec.net.
 [60.103.61.185])
 by smtp.gmail.com with ESMTPSA id q184sm11890097pfc.78.2021.03.27.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 03:33:01 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 27 Mar 2021 19:32:22 +0900
Message-Id: <20210327103226.99073-3-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327103226.99073-1-qi.fuli@fujitsu.com>
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/6] syscalls/swapon/swapon01: Convert swapon01 to the
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
 testcases/kernel/syscalls/swapon/Makefile   |  4 +-
 testcases/kernel/syscalls/swapon/swapon01.c | 83 +++++----------------
 2 files changed, 22 insertions(+), 65 deletions(-)

diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
index 57ec45d48..53c795090 100644
--- a/testcases/kernel/syscalls/swapon/Makefile
+++ b/testcases/kernel/syscalls/swapon/Makefile
@@ -8,10 +8,10 @@ endif
 
 top_srcdir		?= ../../../..
 
-LTPLIBS = ltpswapon
+LTPLIBS = ltpswap
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LTPLDLIBS  = -lltpswapon
+LTPLDLIBS  = -lltpswap
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
index aff842e4c..332e139b3 100644
--- a/testcases/kernel/syscalls/swapon/swapon01.c
+++ b/testcases/kernel/syscalls/swapon/swapon01.c
@@ -1,88 +1,45 @@
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
 
- /*
-  * Checks that swapon() succeds with swapfile.
-  */
+/*
+ * Checks that swapon() succeds with swapfile.
+ */
 
 #include <unistd.h>
 #include <errno.h>
 #include <stdlib.h>
-#include "test.h"
-#include "lapi/syscalls.h"
-#include "libswapon.h"
 
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "swapon01";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "libswap.h"
 
 static void verify_swapon(void)
 {
-	TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));
+	TEST(tst_syscall(__NR_swapon, "./swapfile01", 0));
 
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "Failed to turn on swapfile");
 	} else {
-		tst_resm(TPASS, "Succeeded to turn on swapfile");
+		tst_res(TPASS, "Succeeded to turn on swapfile");
 		/*we need to turn this swap file off for -i option */
-		if (ltp_syscall(__NR_swapoff, "./swapfile01") != 0) {
-			tst_brkm(TBROK, cleanup, "Failed to turn off swapfile,"
+		if (tst_syscall(__NR_swapoff, "./swapfile01") != 0) {
+			tst_brk(TBROK, "Failed to turn off swapfile,"
 			         " system reboot after execution of LTP "
 				 "test suite is recommended.");
 		}
 	}
 }
 
-int main(int ac, char **av)
-{
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		verify_swapon();
-	}
-
-	cleanup();
-	tst_exit();
-}
-
 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	is_swap_supported(cleanup, "./tstswap");
-
-	make_swapfile(cleanup, "swapfile01", 0);
+	is_swap_supported("./tstswap");
+	make_swapfile("swapfile01", 0);
 }
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = verify_swapon,
+	.setup = setup
+};
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
