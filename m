Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72445349960
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 191243C2805
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 92BDD3C8E42
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:58 +0100 (CET)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 289EA601BE2
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:58 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id l123so2898348pfl.8
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUTVOUer2X3CmhQhoPtyZuzQqQ70GCwCPtwneXx3BDk=;
 b=TcRw/UbvCr4h8ap1tFNuwjndi2x3KEGLl6ZG6kIumEU1hqolqGIoMW8j2AJwx7TjJ1
 BXJiGNUx5ifDz+6PE64qxSQKb3hRRWfGkBSuysesEYqO4PBlEMh5oWHHaqn3Fy1Y4FlU
 inXAT8Tvo3FlrqsLiEeliusurYU+4qeDy0r3rk9SXh87YdFURv5e5H1qRhy+Z1nYhgzT
 44koPsccbjc4tXgE4Tm5v9dYXroKi6NT2tqvICBIvS0ALTbB6SyhDeByNw27lD0aS4Vh
 7ukjmTtD5vxQZaMe8EFMLx6f6PqE0eKSZ5wEl8sk7+435MwkPTObAaZqOuL9xvUtBDTt
 0hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUTVOUer2X3CmhQhoPtyZuzQqQ70GCwCPtwneXx3BDk=;
 b=VnKANmXRHezY36h024WZ6CQbrIjvnk+98hzOgG847+U9Y6wr/BQn5IcGhIXll6thnU
 87ByiI+90CFzt/1m1H/5PwQRasOXqCyOY4yfA7Mr5EOFZaJU254Va/aKaFqvITclA9lB
 A3JUix4VfEzDcDFwC3Rs/R0ZchEDw20qcTy2JvGmMTD5Qq07cVeBz0rkesVWJhWHiddp
 ENe6GXWHyG00lJcrZ70drxzvYBzR9JfrUg1QBaeqYiQChUjEHyB1BTpReUHPdY5moBw9
 2zbimABLbbasGKFab03zRH8oiJjc1rC3fnhiBLWt5xndxZpfDQLL/6BFnUS7vbDBRA3T
 LRsw==
X-Gm-Message-State: AOAM53221ebkhY2VLknLiTnXT3ntGtALwkA2Y5MFIeuhx2Weaxe5OIKf
 Ob0zgBALXDt6ER9URTqlkViZqUNDkHA=
X-Google-Smtp-Source: ABdhPJwYiu/qU0fGfOW1m/EwMqyEXED6zRGFnhbXbbcdnLveMQdGpDbcSsbOBn1kIAyfRpohJCg5Ww==
X-Received: by 2002:a05:6a00:1595:b029:217:49e9:2429 with SMTP id
 u21-20020a056a001595b029021749e92429mr8884401pfk.80.1616696396438; 
 Thu, 25 Mar 2021 11:19:56 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id i20sm5977597pgg.65.2021.03.25.11.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 11:19:56 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 03:19:04 +0900
Message-Id: <20210325181906.40688-3-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325181906.40688-1-qi.fuli@fujitsu.com>
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/swapon/swapon01: Convert swapon01 to the
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
