Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209F3CF67C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:58:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD0BD3C81A8
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:58:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E27D3C22F1
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:58:39 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 60CD51400C43
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626771516; i=@fujitsu.com;
 bh=ZrhxFmLAWbLATrtxKPlIQFqTt+JhsRE8usJNUD53qZg=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=dvl6pobdu+dlqCH/OvURmKXleMHTU3EeDQHgeYY6NfNpc1veIGsGHTdFVsGKM3lND
 Uvt6EaFkZ+wa7lmLf8/Ltwnxw911pl9uyiOEVGg+I4M/WbG5LDwxR0VjG59LXz4kxk
 +aKdHEA7EppK1p+SMH8omzGCn+mEO+YMcwuZJH4t2zAekRFf46WHXE4GvRRJtMw54p
 SMCWPJGNPm46AcwkVlRWvUzxm60alSbJIqX7g5ZGmoiBvD9GkEO+38nWm83f4rlnMa
 UIwQ7XNFcq3YCvr7UVZjKJWMiXogIGbMr1YEeeroGDT9I/RF0E9OOsTOrBI36qh+ac
 VzYZK3Igkowsg==
Received: from [100.113.6.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id FB/1A-03281-C3096F06;
 Tue, 20 Jul 2021 08:58:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqms94Vu
 CQW+TkcWK7zsYHRg99v1exxrAGMWamZeUX5HAmnFoHUfBVaWKkwufMjUwvpXqYuTiEBKYzyTR
 d+ggM4RzgFHiaHs3WxcjJwebgIbEtcftzCC2iICEREfDW3YQm1lATWL31WNANRwcwgKmEjc/W
 YKYLAKqEst+i4FU8Aq4Saz5fxOsU0JAQWLKw/fMEHFBiZMzn7BATJGQOPjiBVSNosT+vRsZQc
 ZICFRK3HicOoGRdxaSjllIOhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11zUyNtRLrNJN0ks
 t1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEhlZKIfvzHYyr3nzQO8QoycGkJMp7lu1bghBf
 Un5KZUZicUZ8UWlOavEhRhkODiUJ3pR+oJxgUWp6akVaZg4wzGHSEhw8SiK8ft1Aad7igsTc4
 sx0iNQpRkUpcd7OPqCEAEgiozQPrg0WW5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN+6Q
 WawpOZVwI3/RXQYiagxbumfQVZXJKIkJJqYAr8osd+69CebxEsZrUeik2r7aVWZF1Mqn6122J
 5Vb7btNyCYrW+I0HVq2PNPvK91A5T7r3YoxRe7bhyr9XVP0+238ieFLl+Tc0HC90rquY9ki+P
 dVbnqRd5m4QbT9ra+O3XC6fAvIutoREBLTW+L4oMPxz+tfD/zIyt+iYPQ/5MsAif1ra+0nf1m
 p3tVk7OW56zW3pcSTpgz3139fR3at9etq9wKFwhlNDOoW3iZLfi25GkAO1S65uXfm91kpZd8f
 Ca+Rr54LWvTauvcC3//Dxr08mH976J7/K9eDl776/5CV8v7+a9m2fWVS70b1l56ByrXqOw0Fl
 3Q7/O/Jn0y96d+7o6y9cql7nLEhfOSVJiKc5INNRiLipOBAB4TIb/KAMAAA==
X-Env-Sender: daisl.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-245.messagelabs.com!1626771515!126678!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5369 invoked from network); 20 Jul 2021 08:58:35 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-8.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jul 2021 08:58:35 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16K8wTmX015992
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 09:58:35 +0100
Received: from rhel79.g08.fujitsu.local (10.167.225.51) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 20 Jul 2021 09:58:27 +0100
From: Dai Shili <daisl.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 20 Jul 2021 04:58:17 -0400
Message-ID: <1626771497-20281-1-git-send-email-daisl.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.51]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/readv03: Convert to new API
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

Signed-off-by: Dai Shili <daisl.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/readv/readv03.c | 150 ++++++------------------------
 1 file changed, 27 insertions(+), 123 deletions(-)

diff --git a/testcases/kernel/syscalls/readv/readv03.c b/testcases/kernel/syscalls/readv/readv03.c
index 09a2ce4..c31d74a 100644
--- a/testcases/kernel/syscalls/readv/readv03.c
+++ b/testcases/kernel/syscalls/readv/readv03.c
@@ -1,148 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (C) Bull S.A. 2001
- *   Copyright (c) International Business Machines  Corp., 2001
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
+ * Copyright (C) Bull S.A. 2001
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 05/2002 Ported by Jacky Malcles
  */
 
-/*
- * NAME
- * 	readv03.c
- *
- * DESCRIPTION
- *	Testcase to check the error condition of the readv(2) system call
- *	when fd refers to a directory.
- *
- * CALLS
- * 	readv()
- *
- * ALGORITHM
- *      loop if that option was specified
- *      call readv() when fd refers to a directory.
- *      check the errno value
- *        issue a PASS message if we get EISDIR - errno 21
- *      otherwise, the tests fails
- *        issue a FAIL message
- *      call cleanup
- *
- * USAGE$
- *	readv03
- *
- * HISTORY
- *	05/2002 Ported by Jacky Malcles
- *
- * RESTRICTIONS
- * 	None
+/*\
+ * [Description]
+ *      Testcase to check EISDIR error when fd refers to a directory.
  */
-#include <sys/types.h>
+
 #include <sys/uio.h>
 #include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <sys/stat.h>
+#include "tst_test.h"
 
-#include "test.h"
-#include "safe_macros.h"
-
-#define	K_1	1024
+#define K_1     1024
 #define MODES   S_IRWXU
 
 char buf1[K_1];
 
 struct iovec rd_iovec[1] = {
-	{buf1, K_1}
+        {buf1, K_1}
 };
 
 const char *TEST_DIR = "alpha";
-int r_val;
-int fd;
-
-char *TCID = "readv03";
-int TST_TOTAL = 1;
+static int fd;
 
-void setup();
-void cleanup();
-
-int main(int ac, char **av)
+static void verify_readv(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		if (readv(fd, rd_iovec, 1) < 0) {
-			if (errno != EISDIR) {
-				tst_resm(TFAIL, "expected errno = EISDIR, "
-					 "got %d", errno);
-			} else {
-				tst_resm(TPASS, "got EISDIR");
-			}
-		} else {
-			tst_resm(TFAIL, "Error: readv returned a positive "
-				 "value");
-		}
-
-	}
-	cleanup();
-	tst_exit();
-
+        TST_EXP_FAIL2(readv(fd, rd_iovec, 1), EISDIR,
+                     "readv() got EISDIR");
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
 void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
-
-	/*
-	 * create a new directory and open it
-	 */
-
-	if ((r_val = mkdir(TEST_DIR, MODES)) == -1) {
-		tst_brkm(TBROK, cleanup, "%s - mkdir() in main() "
-			 "failed", TCID);
-	}
-
-	if ((fd = open(TEST_DIR, O_RDONLY)) == -1) {
-		tst_brkm(TBROK, cleanup, "open of directory failed");
-	}
-
+        SAFE_MKDIR(TEST_DIR, MODES);
+        fd = SAFE_OPEN(TEST_DIR, O_RDONLY);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	SAFE_CLOSE(cleanup, fd);
-	tst_rmdir();
-
+        if (fd > 0)
+                SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+        .needs_tmpdir = 1,
+        .setup = setup,
+        .cleanup = cleanup,
+        .test_all = verify_readv,
+};
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
