Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A3610E72
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Oct 2022 12:28:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBF8E3CA97E
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Oct 2022 12:28:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B64F53C6840
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 12:28:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DC5651000F59
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 12:28:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 893FB1F8AB
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666952914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F92UD9OsmjouRGs0vJRmjFAvOoBTLQEqo+5bYu8anPE=;
 b=Hn3mj8XtjICiUB56UMeTIHKtiME2fV7WtIg/ewY39JTSFzg9UqFRcATB2LACRFJfblNKhO
 sKHMxPCt4CBhENQco1QPKNxl2bse3CXlHNc2yLk//9CSf7BfC9xlVAKxirKmKr7VSdkW4n
 7J8SFO432TOOidzVK6py/CYS2AVPkJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666952914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F92UD9OsmjouRGs0vJRmjFAvOoBTLQEqo+5bYu8anPE=;
 b=zYlJ6mIKXrCY+AmSguGsam8DuNt04MoVp/kBBEGaEQupJmAQaiQYG+ESz/ttWiQ+mgw+uu
 TT+2UFGuM4DZWUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CFB813A6E
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 10:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Kh51MNGuW2OZOgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 10:28:33 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Fri, 28 Oct 2022 15:58:31 +0530
Message-Id: <20221028102831.5284-1-akumar@suse.de>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] setfsuid03: Convert to new LTP API
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

- rewrite using new API
- using caller's real user ID as fsuid when calling
setfsuid(fsuid) by non-root user
- verifying that fsuid is updated correctly, by calling
setfsuid(-1)

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 .../kernel/syscalls/setfsuid/setfsuid03.c     | 110 ++++--------------
 1 file changed, 25 insertions(+), 85 deletions(-)

diff --git a/testcases/kernel/syscalls/setfsuid/setfsuid03.c b/testcases/kernel/syscalls/setfsuid/setfsuid03.c
index 0e5f860c8..ede4a7933 100644
--- a/testcases/kernel/syscalls/setfsuid/setfsuid03.c
+++ b/testcases/kernel/syscalls/setfsuid/setfsuid03.c
@@ -2,105 +2,45 @@
  * Copyright (C) International Business Machines  Corp., 2001
  * Ported by Wayne Boyer
  * Adapted by Dustin Kirkland (k1rkland@us.ibm.com)
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
+ * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
  */
 
-/*
- * Testcase to test the basic functionality of the setfsuid(2) system
- * call when called by a user other than root.
+/*\
+ * [Description]
+ *
+ * Verify that setfsuid() correctly updates the filesystem uid
+ * when caller is a non-root user and provided fsuid matches
+ * caller's real user ID.
  */
 
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <errno.h>
 #include <pwd.h>
 
-#include "test.h"
-#include "compat_16.h"
-
-static void setup(void);
-static void cleanup(void);
+#include "tst_test.h"
+#include "compat_tst_16.h"
 
-TCID_DEFINE(setfsuid03);
-int TST_TOTAL = 1;
+static uid_t nobody_uid;
 
-static char nobody_uid[] = "nobody";
-static struct passwd *ltpuser;
-
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
-	uid_t uid;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	uid = 1;
-	while (!getpwuid(uid))
-		uid++;
+	struct passwd *nobody;
 
-	UID16_CHECK(uid, setfsuid, cleanup);
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(SETFSUID(cleanup, uid));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO,
-				"setfsuid() failed unexpectedly");
-			continue;
-		}
-
-		if (TEST_RETURN == uid) {
-			tst_resm(TFAIL,
-				 "setfsuid() returned %ld, expected anything but %d",
-				 TEST_RETURN, uid);
-		} else {
-			tst_resm(TPASS, "setfsuid() returned expected value : "
-				 "%ld", TEST_RETURN);
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	nobody = SAFE_GETPWNAM("nobody");
+	nobody_uid = nobody->pw_uid;
 }
 
-static void setup(void)
+static void run(void)
 {
-	tst_require_root();
-
-	ltpuser = getpwnam(nobody_uid);
-	if (ltpuser == NULL)
-		tst_brkm(TBROK, cleanup, "getpwnam failed for user id %s",
-			nobody_uid);
-
-	if (setuid(ltpuser->pw_uid) == -1)
-		tst_resm(TINFO | TERRNO, "setuid failed to "
-			 "to set the effective uid to %d", ltpuser->pw_uid);
+	uid_t ruid, euid, suid;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	SAFE_GETRESUID(&ruid, &euid, &suid);
+	SAFE_SETEUID(nobody_uid);
 
-	TEST_PAUSE;
+	TST_EXP_VAL_SILENT(setfsuid(ruid), nobody_uid);
+	TST_EXP_VAL(setfsuid(-1), ruid, "setfsuid(fsuid) by non-root user:");
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup,
+	.test_all = run
+};
-- 
2.38.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
