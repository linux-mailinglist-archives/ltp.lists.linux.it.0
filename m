Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF38549F5F
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 22:34:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E963C9493
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 22:34:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 222743C93F8
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 22:33:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 436AD200073
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 22:33:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 793991F959;
 Mon, 13 Jun 2022 20:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655152432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnZXz1cVzX2gpgixfe5ecV7oD8rgU4E+RKANf+qaSwQ=;
 b=nkTMvxqyM2KrKINnX6D24qD95RQXEFzA+XIpXr47Kz9LDpx7NgyX++BpTAm5/6G8rrflRf
 yHNr4bZr4Jn/OCxfJYj89HeemJovMDRaLXeXutdVTyreBt09Ma4K0Pkij4Kw6UsGnPMxMB
 nH2CJPbm1dHkg1Z8Ck9OB1IYVyDukyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655152432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnZXz1cVzX2gpgixfe5ecV7oD8rgU4E+RKANf+qaSwQ=;
 b=yYxLcsJdILIdC+lfkk+mbYluOHluBPKv0iCi/bt2bw4o8Da0OcGPzW4cN5izXub3DCnFkb
 AVJW4k+A7XmKOKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40139134CF;
 Mon, 13 Jun 2022 20:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oJ+aDDCfp2L3QgAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 13 Jun 2022 20:33:52 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 13 Jun 2022 22:33:29 +0200
Message-Id: <20220613203333.24839-3-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613203333.24839-1-andrea.cervesato@suse.de>
References: <20220613203333.24839-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/6] Rewrite mqns_02 test using new LTP API
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
 runtest/containers                         |   5 +-
 testcases/kernel/containers/mqns/mqns_02.c | 229 +++++++--------------
 2 files changed, 72 insertions(+), 162 deletions(-)

diff --git a/runtest/containers b/runtest/containers
index 073e206d0..77785edd3 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -18,8 +18,9 @@ pidns32 pidns32
 mqns_01_none mqns_01 -m none
 mqns_01_clone mqns_01 -m clone
 mqns_01_unshare mqns_01 -m unshare
-mqns_02 mqns_02
-mqns_02_clone mqns_02 -clone
+mqns_02_none mqns_02 -m none
+mqns_02_clone mqns_02 -m clone
+mqns_02_unshare mqns_02 -m unshare
 mqns_03 mqns_03
 mqns_03_clone mqns_03 -clone
 mqns_04 mqns_04
diff --git a/testcases/kernel/containers/mqns/mqns_02.c b/testcases/kernel/containers/mqns/mqns_02.c
index d4e785b59..b2130b624 100644
--- a/testcases/kernel/containers/mqns/mqns_02.c
+++ b/testcases/kernel/containers/mqns/mqns_02.c
@@ -1,180 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
-* Copyright (c) International Business Machines Corp., 2009
-* Copyright (c) Nadia Derbey, 2009
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-* Author: Nadia Derbey <Nadia.Derbey@bull.net>
-*
-* Check mqns isolation: child mqns cannot be accessed from father
-*
-* Mount mqueue fs
-* unshare
-* In unshared process:
-*    Mount newinstance mqueuefs
-*    Create a posix mq -->mq1
-* Check that mq1 is not readable from father
-*
-* Changelog:
-*	Dec 16: accomodate new mqns semantics (Serge Hallyn)
-
-***************************************************************************/
-
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif
-#include <sys/wait.h>
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include "mqns.h"
-#include "mqns_helper.h"
-
-char *TCID = "posixmq_namespace_02";
-int TST_TOTAL = 1;
-
-int p1[2];
-int p2[2];
-
-int check_mqueue(void *vtest)
+ * Copyright (c) International Business Machines Corp., 2009
+ * Copyright (c) Nadia Derbey, 2009 <Nadia.Derbey@bull.net>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Create a mqueue with the same name in both father and isolated/forked child,
+ * then check namespace isolation.
+ */
+
+#include <mqueue.h>
+#include "common.h"
+
+#define MQNAME "/MQ1"
+
+static mqd_t mqd;
+static char *str_op;
+static int use_clone;
+
+static int check_mqueue(LTP_ATTRIBUTE_UNUSED void *vtest)
 {
-	char buf[30];
-	mqd_t mqd;
+	mqd_t mqd1;
 
-	(void) vtest;
+	mqd1 = mq_open(MQNAME, O_RDWR | O_CREAT | O_EXCL, 0777, NULL);
 
-	close(p1[1]);
-	close(p2[0]);
+	if (use_clone == T_NONE) {
+		if (mqd1 == -1)
+			tst_res(TPASS, "Can't create queue from plain cloned process");
+		else
+			tst_res(TFAIL, "Queue has been created form plain cloned process");
 
-	if (read(p1[0], buf, 3) < 0) {
-		perror("read(p1[0], ..) failed");
-		exit(1);
-	} else {
+		return 0;
+	}
 
-		mqd =
-		    tst_syscall(__NR_mq_open, NOSLASH_MQ1,
-			    O_RDWR | O_CREAT | O_EXCL, 0777, NULL);
-		if (mqd == -1) {
-			if (write(p2[1], "mqfail", strlen("mqfail") + 1) < 0) {
-				perror("write(p2[1], \"mqfail\", ..) failed");
-				exit(1);
-			}
-		} else {
-
-			if (write(p2[1], "mqopen", strlen("mqopen") + 1) < 0) {
-				perror("write(p2[1], \"mqopen\", ..) failed");
-				exit(1);
-			} else {
-
-				if (read(p1[0], buf, 5) < 0) {
-					perror("read(p1[0], ..) failed");
-					exit(1);
-				} else {
-
-					/* destroy the mqueue */
-					if (mq_close(mqd) < 0) {
-						perror("mq_close(mqd) failed");
-						exit(1);
-					} else if (tst_syscall(__NR_mq_unlink,
-							   NOSLASH_MQ1) < 0) {
-						perror("mq_unlink(" NOSLASH_MQ1
-						       ") failed");
-						exit(1);
-					} else if (write(p2[1], "done",
-							 strlen("done") + 1)
-						   < 0) {
-						perror("write(p2[1], "
-						       "\"done\", ..) failed");
-						exit(1);
-					}
-
-				}
-
-			}
-
-		}
+	if (mqd1 == -1) {
+		tst_res(TFAIL, "Queue hasn't been created from isolated process");
+	} else {
+		tst_res(TPASS, "Created queue from isolated process");
 
+		mq_close(mqd1);
+		mq_unlink(MQNAME);
 	}
-	exit(0);
 
+	return 0;
 }
 
-static void setup(void)
+static void run(void)
 {
-	tst_require_root();
-	check_mqns();
+	tst_res(TINFO, "Checking namespaces isolation from parent to child");
+
+	clone_unshare_test(use_clone, CLONE_NEWIPC, check_mqueue, NULL);
 }
 
-int main(int argc, char *argv[])
+static void setup(void)
 {
-	int r;
-	mqd_t mqd;
-	char buf[30];
-	int use_clone = T_UNSHARE;
-
-	setup();
-
-	if (argc == 2 && strcmp(argv[1], "-clone") == 0) {
-		tst_resm(TINFO,
-			 "Testing posix mq namespaces through clone(2).");
-		use_clone = T_CLONE;
-	} else
-		tst_resm(TINFO,
-			 "Testing posix mq namespaces through unshare(2).");
-
-	if (pipe(p1) == -1 || pipe(p2) == -1) {
-		tst_brkm(TBROK | TERRNO, NULL, "pipe");
-	}
+	use_clone = get_clone_unshare_enum(str_op);
 
-	/* fire off the test */
-	r = do_clone_unshare_test(use_clone, CLONE_NEWIPC, check_mqueue, NULL);
-	if (r < 0) {
-		tst_brkm(TFAIL, NULL, "failed clone/unshare");
-	}
+	if (use_clone != T_NONE)
+		check_newipc();
 
-	tst_resm(TINFO, "Checking namespaces isolation (child to parent)");
-
-	close(p1[0]);
-	close(p2[1]);
-	if (write(p1[1], "go", strlen("go") + 1) < 0) {
-		tst_brkm(TBROK, NULL, "write(p1[1], \"go\", ..) failed");
-	}
+	mqd = mq_open(MQNAME, O_RDWR | O_CREAT | O_EXCL, 0777, NULL);
+	if (mqd == -1)
+		tst_brk(TBROK | TERRNO, "mq_open failed");
+}
 
-	if (read(p2[0], buf, 7) < 0) {
-		tst_resm(TBROK | TERRNO, "read(p2[0], ..) failed");
-	} else if (!strcmp(buf, "mqfail")) {
-		tst_resm(TFAIL, "child process could not create mqueue");
-		umount(DEV_MQUEUE);
-	} else if (strcmp(buf, "mqopen")) {
-		tst_resm(TFAIL, "child process could not create mqueue");
-		umount(DEV_MQUEUE);
-	} else {
-		mqd = tst_syscall(__NR_mq_open, NOSLASH_MQ1, O_RDONLY);
-		if (mqd == -1) {
-			tst_resm(TPASS,
-				 "Parent process can't see the mqueue");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-				 "Parent process found mqueue");
-			mq_close(mqd);
-		}
-		if (write(p1[1], "cont", 5) < 0) {
-			tst_resm(TBROK | TERRNO, "write(p1[1], ..) failed");
-		}
-		read(p2[0], buf, 7);
+static void cleanup(void)
+{
+	if (mqd != -1) {
+		mq_close(mqd);
+		mq_unlink(MQNAME);
 	}
-
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.min_kver = "2.6.30",
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Test execution mode <clone|unshare|none>" },
+		{},
+	},
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
