Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C38954C879A
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 10:16:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 645CE3CA308
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Mar 2022 10:16:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E0F23CA2DC
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 10:15:23 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F1781100118F
 for <ltp@lists.linux.it>; Tue,  1 Mar 2022 10:15:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91CE5219A5;
 Tue,  1 Mar 2022 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646126122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDKky1q8pfQwgb5icCvUGJH9F8v0B062H3oIxiawh0M=;
 b=d356pG+DvZJuyJq766wlBb6wa9xyx3eshCQiK/UsApiio6K5Yo37WzkZoH3i7GWV1TZCg4
 ua+4M0BmaPVr8m8yQy7TWeXHRJ7lvsl/uKCekgSoXhp0ncA+IOA8oovXdCoVG/6MlZ9R8d
 i03uv/UXkYXQUL8QAPAry75/RF1mYTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646126122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDKky1q8pfQwgb5icCvUGJH9F8v0B062H3oIxiawh0M=;
 b=xp3DtBe6WcK+UTQ0rDfUO7qUEafMho1toukKYEHYtdRH5RzYty3H/yXBkd6vqPOBF8WbrW
 h/DEwytwp47VijCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DFAF13B08;
 Tue,  1 Mar 2022 09:15:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eAUIOSnkHWJ3VwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 01 Mar 2022 09:15:21 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue,  1 Mar 2022 10:15:15 +0100
Message-Id: <20220301091517.11142-5-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301091517.11142-1-andrea.cervesato@suse.de>
References: <20220301091517.11142-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/6] Rewrite mountns04 test using new LTP API
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 .../kernel/containers/mountns/mountns04.c     | 109 ++++++++----------
 1 file changed, 46 insertions(+), 63 deletions(-)

diff --git a/testcases/kernel/containers/mountns/mountns04.c b/testcases/kernel/containers/mountns/mountns04.c
index 1f022a683..044c90aa7 100644
--- a/testcases/kernel/containers/mountns/mountns04.c
+++ b/testcases/kernel/containers/mountns/mountns04.c
@@ -1,89 +1,72 @@
-/* Copyright (c) 2014 Red Hat, Inc.
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of version 2 the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- ***********************************************************************
- * File: mountns04.c
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2014 Red Hat, Inc.
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
  *
  * Tests an unbindable mount: unbindable mount is an unbindable
  * private mount.
- * Description:
- * 1. Creates directories "A", "B" and files "A/A", "B/B"
- * 2. Unshares mount namespace and makes it private (so mounts/umounts
- *    have no effect on a real system)
- * 3. Bind mounts directory "A" to "A"
- * 4. Makes directory directory "A" unbindable
- * 5. Tries to bind mount unbindable "A" to "B":
- *    - if it fails, test passes
- *    - if it passes, test fails
- ***********************************************************************/
+ *
+ * [Algorithm]
+ *
+ * . Creates directories "A", "B" and files "A/A", "B/B"
+ * . Unshares mount namespace and makes it private (so mounts/umounts have no
+ *   effect on a real system)
+ * . Bind mounts directory "A" to "A"
+ * . Makes directory "A" unbindable
+ * . Tries to bind mount unbindable "A" to "B":
+ * .. if it fails, test passes
+ * .. if it passes, test fails
+ */
 
-#define _GNU_SOURCE
 #include <sys/wait.h>
 #include <sys/mount.h>
-#include <stdio.h>
-#include <errno.h>
-#include "mountns_helper.h"
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID	= "mountns04";
-int TST_TOTAL	= 1;
-
-#if defined(MS_SHARED) && defined(MS_PRIVATE) \
-    && defined(MS_REC) && defined(MS_UNBINDABLE)
+#include "mountns.h"
+#include "tst_test.h"
 
-static void test(void)
+static void run(void)
 {
 	/* unshares the mount ns */
-	if (unshare(CLONE_NEWNS) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "unshare failed");
+	SAFE_UNSHARE(CLONE_NEWNS);
+
 	/* makes sure mounts/umounts have no effect on a real system */
-	SAFE_MOUNT(cleanup, "none", "/", "none", MS_REC|MS_PRIVATE, NULL);
+	SAFE_MOUNT("none", "/", "none", MS_REC | MS_PRIVATE, NULL);
 
 	/* bind mounts DIRA to itself */
-	SAFE_MOUNT(cleanup, DIRA, DIRA, "none", MS_BIND, NULL);
+	SAFE_MOUNT(DIRA, DIRA, "none", MS_BIND, NULL);
+
 	/* makes mount DIRA unbindable */
-	SAFE_MOUNT(cleanup, "none", DIRA, "none", MS_UNBINDABLE, NULL);
+	SAFE_MOUNT("none", DIRA, "none", MS_UNBINDABLE, NULL);
 
 	/* tries to bind mount unbindable DIRA to DIRB which should fail */
 	if (mount(DIRA, DIRB, "none", MS_BIND, NULL) == -1) {
-		tst_resm(TPASS, "unbindable mount passed");
+		tst_res(TPASS, "unbindable mount passed");
 	} else {
-		SAFE_UMOUNT(cleanup, DIRB);
-		tst_resm(TFAIL, "unbindable mount faled");
+		SAFE_UMOUNT(DIRB);
+		tst_res(TFAIL, "unbindable mount faled");
 	}
 
-	SAFE_UMOUNT(cleanup, DIRA);
+	SAFE_UMOUNT(DIRA);
 }
 
-int main(int argc, char *argv[])
+static void setup(void)
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++)
-		test();
-
-	cleanup();
-	tst_exit();
+	check_newns();
+	create_folders();
 }
 
-#else
-int main(void)
+static void cleanup(void)
 {
-	tst_brkm(TCONF, NULL, "needed mountflags are not defined");
+	umount_folders();
 }
-#endif
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
