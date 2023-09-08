Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067079885B
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 16:14:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1954C3CC0FC
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 16:14:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 015153CB543
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 16:14:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C57E206C38
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 16:14:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3C0721CC1;
 Fri,  8 Sep 2023 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694182455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NdYM86YsxycvyImygfa7Alq47I9Ickaz886pdKZzA8=;
 b=Iu4Y2Gho943nijzeHP90TNsT1GFxE+l5ebY2osQEU8WkJx62dPrdRp+BBD3YVTUScvSljy
 6OftPhcHPjNj+nkanxOpaFG1KOjSIrfXkSIzi9QA6ZGE/ICsqiv5d11El0v0Zua72O7oGm
 sSCG6BVPo9hipOrODhVnANmV5ngQl74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694182455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NdYM86YsxycvyImygfa7Alq47I9Ickaz886pdKZzA8=;
 b=TYEpnJwCdLxQZT/6MNXklWNs9f+YW/gbA/c5lZug8EHOh10qOE5oHiYXFKHnFWG5La4vH9
 QR7S3e/DKdeKOxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 935F1132F2;
 Fri,  8 Sep 2023 14:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0AmHITcs+2RocQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 08 Sep 2023 14:14:15 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri,  8 Sep 2023 16:14:14 +0200
Message-Id: <20230908141414.28359-3-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230908141414.28359-1-andrea.cervesato@suse.de>
References: <20230908141414.28359-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Refactor getegid02 using new LTP API
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/getegid/getegid02.c | 93 +++++--------------
 1 file changed, 21 insertions(+), 72 deletions(-)

diff --git a/testcases/kernel/syscalls/getegid/getegid02.c b/testcases/kernel/syscalls/getegid/getegid02.c
index 60f09501e..2f64bd869 100644
--- a/testcases/kernel/syscalls/getegid/getegid02.c
+++ b/testcases/kernel/syscalls/getegid/getegid02.c
@@ -1,90 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) International Business Machines  Corp., 2001
- *  Ported by Wayne Boyer
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
+ * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
+ *   William Roske, Dave Fenner
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
- * Testcase to check the basic functionality of getegid().
+/*\
+ * [Description]
  *
- * For functionality test the return value from getegid() is compared to passwd
- * entry.
+ * This test checks if getegid() returns the same effective group given by
+ * passwd entry via getpwuid().
  */
 
 #include <pwd.h>
-#include <errno.h>
-
-#include "test.h"
-#include "compat_16.h"
 
-static void cleanup(void);
-static void setup(void);
+#include "tst_test.h"
+#include "compat_tst_16.h"
 
-TCID_DEFINE(getegid02);
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
 	uid_t euid;
+	gid_t egid;
 	struct passwd *pwent;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(GETEGID(cleanup));
+	UID16_CHECK((euid = geteuid()), "geteuid");
 
-		if (TEST_RETURN < 0) {
-			tst_brkm(TBROK, cleanup, "This should never happen");
-		}
+	pwent = getpwuid(euid);
+	if (!pwent)
+		tst_brk(TBROK | TERRNO, "getpwuid() error");
 
-		euid = geteuid();
-		pwent = getpwuid(euid);
+	GID16_CHECK((egid = getegid()), "getegid");
 
-		if (pwent == NULL)
-			tst_brkm(TBROK, cleanup, "geteuid() returned "
-				 "unexpected value %d", euid);
-
-		GID16_CHECK(pwent->pw_gid, getegid, cleanup);
-
-		if (pwent->pw_gid != TEST_RETURN) {
-			tst_resm(TFAIL, "getegid() return value"
-				 " %ld unexpected - expected %d",
-				 TEST_RETURN, pwent->pw_gid);
-		} else {
-			tst_resm(TPASS,
-				 "effective group id %ld "
-				 "is correct", TEST_RETURN);
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+	TST_EXP_EQ_LI(pwent->pw_gid, egid);
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
