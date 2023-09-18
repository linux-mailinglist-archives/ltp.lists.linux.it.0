Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2F7A4ADC
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 15:53:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4C353CE4CA
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 15:53:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D51ED3CAB4E
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 15:53:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D6C70141658C
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 15:53:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34A1A1FF10;
 Mon, 18 Sep 2023 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695045200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fMLx1AFmILEggekuVIPtcnBgJ2wUr153nMAmuliLIh8=;
 b=CVWvjpW+PlYlBo1KGLzw9lurawFNYwsnwh+RWHRyQpYUES4/jmUebiAaJgcwXyhp4ovpNo
 m/rh3KTo+yA6fdhxF+2l7IpCg87ecVoFsLGqHa0xUntVZmAvmnZAvK9nL8f12AblzgMebn
 4Ck5e+hYVGPLtfgxvRhO8Gf28UsJXMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695045200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fMLx1AFmILEggekuVIPtcnBgJ2wUr153nMAmuliLIh8=;
 b=98x4yz6+XnXH0LnzbkfMNK8mCgBNfCGXU7KpQjzEdFM1zOD/uDwz67oCqjVRMvB2MKEXyt
 lv8N6S9MCJF9NQDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D0A313480;
 Mon, 18 Sep 2023 13:53:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gvP/BVBWCGXIJAAAMHmgww
 (envelope-from <mkittler@suse.de>); Mon, 18 Sep 2023 13:53:20 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Mon, 18 Sep 2023 15:53:18 +0200
Message-ID: <20230918135318.20793-1-mkittler@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Port getxattr01.c to new test API
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

* Utilize 'all_filesystems = 1'-mechanism to test on various file
  systems instead of relying on the temporary directory's file system
  to support xattr (which it probably does not as it is commonly a
  tmpfs)
* Improve error handling
* Simplify code and description
* Implements: #583

Signed-off-by: Marius Kittler <mkittler@suse.de>
---
 .../kernel/syscalls/getxattr/getxattr01.c     | 210 ++++++------------
 1 file changed, 71 insertions(+), 139 deletions(-)

diff --git a/testcases/kernel/syscalls/getxattr/getxattr01.c b/testcases/kernel/syscalls/getxattr/getxattr01.c
index cec802a33..ec3ddcaee 100644
--- a/testcases/kernel/syscalls/getxattr/getxattr01.c
+++ b/testcases/kernel/syscalls/getxattr/getxattr01.c
@@ -1,184 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2011  Red Hat, Inc.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of version 2 of the GNU General Public
- * License as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it
- * is free of the rightful claim of any third person regarding
- * infringement or the like.  Any license provided herein, whether
- * implied or otherwise, applies only to this software file.  Patent
- * licenses, if any, provided herein do not apply to combinations of
- * this program with other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
+ * Copyright (C) 2011 Red Hat, Inc.
+ * Copyright (c) 2023 Marius Kittler <mkittler@suse.de>
  */
 
-/*
- * Basic tests for getxattr(2) and make sure getxattr(2) handles error
- * conditions correctly.
+/*\
+ * [Description]
  *
- * There are 4 test cases:
+ * Basic tests for getxattr(2), there are 3 test cases:
  * 1. Get an non-existing attribute,
- *    getxattr(2) should return -1 and set errno to ENODATA
+ *    getxattr(2) should return -1 and set errno to ENODATA.
  * 2. Buffer size is smaller than attribute value size,
- *    getxattr(2) should return -1 and set errno to ERANGE
- * 3. Get attribute, getxattr(2) should succeed
- * 4. Verify the attribute got by getxattr(2) is same as the value we set
+ *    getxattr(2) should return -1 and set errno to ERANGE.
+ * 3. getxattr(2) should succeed and return the same value we set
+ *    before.
  */
 
 #include "config.h"
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <string.h>
-#ifdef HAVE_SYS_XATTR_H
-# include <sys/xattr.h>
-#endif
-#include "test.h"
-#include "safe_macros.h"
 
-char *TCID = "getxattr01";
+#include "tst_test.h"
 
 #ifdef HAVE_SYS_XATTR_H
+#include <sys/xattr.h>
+
+#include "tst_test_macros.h"
+
+#define MNTPOINT "mntpoint"
+#define FNAME MNTPOINT"/getxattr01testfile"
 #define XATTR_TEST_KEY "user.testkey"
 #define XATTR_TEST_VALUE "this is a test value"
 #define XATTR_TEST_VALUE_SIZE 20
 #define BUFFSIZE 64
 
-static void setup(void);
-static void cleanup(void);
-
-char filename[BUFSIZ];
-
-struct test_case {
-	char *fname;
+static struct test_case {
 	char *key;
-	char *value;
+	char value[BUFFSIZE];
 	size_t size;
 	int exp_err;
-};
-struct test_case tc[] = {
-	{			/* case 00, get non-existing attribute */
-	 .fname = filename,
+} tcases[] = {
+	{ /* case 00, get non-existing attribute */
 	 .key = "user.nosuchkey",
-	 .value = NULL,
+	 .value = {0},
 	 .size = BUFFSIZE - 1,
 	 .exp_err = ENODATA,
-	 },
-	{			/* case 01, small value buffer */
-	 .fname = filename,
+	},
+	{ /* case 01, small value buffer */
 	 .key = XATTR_TEST_KEY,
-	 .value = NULL,
+	 .value = {0},
 	 .size = 1,
 	 .exp_err = ERANGE,
-	 },
-	{			/* case 02, get existing attribute */
-	 .fname = filename,
+	},
+	{ /* case 02, get existing attribute */
 	 .key = XATTR_TEST_KEY,
-	 .value = NULL,
+	 .value = {0},
 	 .size = BUFFSIZE - 1,
 	 .exp_err = 0,
-	 },
+	},
 };
 
-int TST_TOTAL = sizeof(tc) / sizeof(tc[0]) + 1;
-
-int main(int argc, char *argv[])
+static void run(unsigned int i)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < (int)ARRAY_SIZE(tc); i++) {
-			TEST(getxattr(tc[i].fname, tc[i].key, tc[i].value,
-				      tc[i].size));
-
-			if (TEST_ERRNO == tc[i].exp_err) {
-				tst_resm(TPASS | TTERRNO, "expected behavior");
-			} else {
-				tst_resm(TFAIL | TTERRNO, "unexpected behavior"
-					 "- expected errno %d - Got",
-					 tc[i].exp_err);
-			}
-		}
-
-		if (TEST_RETURN != XATTR_TEST_VALUE_SIZE) {
-			tst_resm(TFAIL,
-				 "getxattr() returned wrong size %ld expected %d",
-				 TEST_RETURN, XATTR_TEST_VALUE_SIZE);
-			continue;
-		}
-
-		if (memcmp(tc[i - 1].value, XATTR_TEST_VALUE, XATTR_TEST_VALUE_SIZE))
-			tst_resm(TFAIL, "Wrong value, expect \"%s\" got \"%s\"",
-				 XATTR_TEST_VALUE, tc[i - 1].value);
-		else
-			tst_resm(TPASS, "Got the right value");
+	struct test_case *tc = &tcases[i];
+
+	/* read xattr back */
+	TEST(getxattr(FNAME, tc->key, tc->value, tc->size));
+	if (TST_ERR == tc->exp_err) {
+		tst_res(TPASS | TTERRNO, "expected getxattr() return code");
+	} else {
+		tst_res(TFAIL | TTERRNO, "unexpected getxattr() return code"
+				" - expected errno %d", tc->exp_err);
 	}
 
-	cleanup();
-	tst_exit();
+	/* verify the value for non-error test cases */
+	if (tc->exp_err)
+		return;
+	TST_EXP_EQ_LI(TST_RET, XATTR_TEST_VALUE_SIZE);
+	if (memcmp(tc->value, XATTR_TEST_VALUE, XATTR_TEST_VALUE_SIZE))
+		tst_res(TFAIL, "wrong value, expected \"%s\" got \"%s\"",
+				XATTR_TEST_VALUE, tc->value);
+	else
+		tst_res(TPASS, "right value");
 }
 
 static void setup(void)
 {
-	int fd;
-	unsigned int i;
-
-	tst_require_root();
-
-	tst_tmpdir();
-
-	/* Create test file and setup initial xattr */
-	snprintf(filename, BUFSIZ, "getxattr01testfile");
-	fd = SAFE_CREAT(cleanup, filename, 0644);
-	close(fd);
-	if (setxattr(filename, XATTR_TEST_KEY, XATTR_TEST_VALUE,
-		     strlen(XATTR_TEST_VALUE), XATTR_CREATE) == -1) {
-		if (errno == ENOTSUP) {
-			tst_brkm(TCONF, cleanup, "No xattr support in fs or "
-				 "mount without user_xattr option");
-		}
-	}
-
-	/* Prepare test cases */
-	for (i = 0; i < ARRAY_SIZE(tc); i++) {
-		tc[i].value = malloc(BUFFSIZE);
-		if (tc[i].value == NULL) {
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "Cannot allocate memory");
-		}
-	}
-
-	TEST_PAUSE;
+	SAFE_TOUCH(FNAME, 0644, NULL);
+	SAFE_SETXATTR(FNAME, XATTR_TEST_KEY, XATTR_TEST_VALUE,
+				  strlen(XATTR_TEST_VALUE), 0);
 }
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
-#else /* HAVE_SYS_XATTR_H */
-int main(int argc, char *argv[])
-{
-	tst_brkm(TCONF, NULL, "<sys/xattr.h> does not exist.");
-}
+static struct tst_test test = {
+	.all_filesystems = 1,
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.mount_device = 1,
+	.skip_filesystems = (const char *const []) {
+			"exfat",
+			"tmpfs",
+			"ramfs",
+			"nfs",
+			"vfat",
+			NULL
+	},
+	.setup = setup,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases)
+};
+
+#else
+TST_TEST_TCONF("System doesn't have <sys/xattr.h>");
 #endif
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
