Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3762A82A3
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 16:50:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2553C5409
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 16:50:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 544F13C23B1
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 16:50:40 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 84F886009D4
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 16:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604591439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jDeCkvNE7Xxj0G6w6mkXiAZI+o+YVYejkUgUVYgHWUM=;
 b=aDb7rbxJ/WUGiL0UqeVC//sMOo0rDAIpRyZFFf2cZm+JBzGiuCwZdbnfXSpLR1M95MUn3g
 ofl6QyUskH1CrDk8yR8GJGY145j67YAZQTYyt88MLMhxq0hhcPBs9XzZ0O0e6rD44OmjFO
 UsOL0N4brtHgC4W0UrTDdqYMdkAMh5s=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-xko7vCk6MKOIMnOldm0sqw-1; Thu, 05 Nov 2020 16:50:37 +0100
X-MC-Unique: xko7vCk6MKOIMnOldm0sqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPQqFt/DfFE4a5fX9VSy5dmJKA00HeQtA6hiFjCGGcU+z0SFh8nIGOL1w4CmlgiXCwvBO2Ri3/98YvMsbrvcs81DEEQJ1l8DgPdwKGMV5RR8TOzp8ZjCMbiDjQ6OurPm76mVjgTrzvbAeYqy48J46tklEQQE9+curiLdLwcsb0b36NP1qPt/O5nMerPSNqkLBbiuf3p3z63cZpjFVFjLNE4Epg+I/YmwO0IDYVXOAKCsum6r9G6dooRssomG+2X6KbwDd3hkGg+hyTHYpaew324Z1gjVGG+Qq94CkLplpnoFcTHFP4gDFEOPb6ZzpLZB/pcHWoVw9BjiaVJWyTQc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8KwmUYSJoqkzcH3aJvTXweBTipcrgaGwJk5afv5BN4=;
 b=Z0y03JfROt9k+d6qnb2f5f/ZCi27GCcT0Hbug/cMvYab0h3IhtHRDN53C+qUEoqcrXQrGoCzpeKRsVWhk+tjG5eu1EN3gPBKU2MSINosDHM/oXzeZXLZvmBFPnxrbwI+m5T9uPA47N67kyRCKU2TasKQJC4LHDESC6qriTAPq/aLMrOzJqKGRNsGi3Yw27bSZlm6wxQKVprLyAqXu1fv8oA/qRasTKgRaJE9WstW+p5TyvRVX6n71Fqotu+Otbt4CUObzujk4KwXmHCxFnc9w5j1kw7Pk9bIlvT3AdYNAFNDxDzuzkWdqXzkM6XQn8y+7JxYKAO1D4TrSTyKw5QwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR0402MB3600.eurprd04.prod.outlook.com
 (2603:10a6:803:7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 15:50:36 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 15:50:36 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Thu,  5 Nov 2020 17:50:20 +0200
Message-ID: <20201105155020.16898-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 15:50:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a98728f-85da-446b-4485-08d881a28932
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3600D7E7B7110FDF1E5915E9E0EE0@VI1PR0402MB3600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/HIm7RL32f5x38baYlyvXZEPLWcFjn5D4wjkxCrtnlQ0R391fSCHffAkoKDr/j3k4R8wNhUGOWHNXY0trYzN4qKnvTkZKu7wwS+EAE9Z45sONzDUHV/amVuyMntBuEk2ErxJJ4j2bqKSKblWAMi6/+LzSlksX0LuKzeCPd7BHI49aoYTk7dcuhV6X4dqrox546IqCtH0T7CYrq/m0iwCYkL59DA1UcoZZVPqwtkZKBXECHdYyJP2eH+waFh4k9COzSb/2FLHUPo6luWvle5AIsVDCQPY/cmj9CZAbxYFgag9hHu0r8y29joiV/qkeg+PmNpNOjA7UBYkqLzIifYJ9GIWI+ZyqbAfc2VOXSe2cVbgP4RYfnPFn/NJNW8tOsKB5OlzCWfQ2IUr7RLbUi2RqEQwJHlPgRzVguD82xBcfW6HgL1JfPhlJavmnCmrU0dBgxZ09AY6xHZne3qUam8Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(39860400002)(136003)(16526019)(5660300002)(478600001)(1076003)(186003)(26005)(956004)(2616005)(6486002)(44832011)(966005)(6506007)(66946007)(107886003)(316002)(52116002)(86362001)(6512007)(8676002)(2906002)(6666004)(8936002)(66556008)(6916009)(66476007)(36756003)(83380400001)(4326008)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gCsdQDD8CNn5TLfR+a06yNb9x1YPb5XJTF0nFUzEe09unbCPNzkeFEVe+iCFmFAsiR28AHEHZRzaxJBJQ1IwTj38IW7PKmkID/BPPeBGTroD6BKoz0/DaLcxdHuTLHkzENtFfKRDtvsp79A0HOb8+kUot34bZEp4O6N6mLD8S5dLHeVQ60fgfYG5wHH34SbknIuSkrXeyhtbfsPb/0UvUzxViz1n+GJcWE55SwZZPrJosxyQeMepWFAI5Y+g2h6QN7o3tNbcnk1jkvaQPiO8OgnFeg/a32imezngQYG50TXShUv/HGB/lZNSjxDPTzcrlBmR+q80xad8GzQGojzQi5c9QYgjbczN/PGKnrtHFXrb0g8DwCc6SlAHB+153OrasxqN5uYKgpJNB1iL7Yj4Or/LFewC1Il27hG3grAsOSRbl/h6hwJiEEVyUv+YGuLEd4z1rAfb4gXcVj+B+D7+4BzGgMlXL1kCRz8mShpySeuHJZrmWZbpkbm8xRFQmGPlA2iiku5pc6wMtvUcyFFkbYXYk0oF02ZLw41kH1gK8JuZfDbMEedhhWFcXbXDxB/n0fd40WadzHjJW00h05W+d1UyqpJAiEfIcW74oMETsDJPBYgM7Q+TjQAZzIqSHoYrlUSx2XcWZMwLkMaxCuQFKg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a98728f-85da-446b-4485-08d881a28932
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 15:50:36.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJNH6bOZGuO68YpPQtJXNFzRbP8O0VwBJItpVROnq/CGaneiuyEIhDZuUhQKFYCowCTjAxyo7acP7QIgdzLdwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3600
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] Convert dup03 to new API and clean up
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

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/kernel/syscalls/dup/dup03.c | 224 +++++---------------------
 1 file changed, 43 insertions(+), 181 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup03.c b/testcases/kernel/syscalls/dup/dup03.c
index e41c9e445..bc7555590 100644
--- a/testcases/kernel/syscalls/dup/dup03.c
+++ b/testcases/kernel/syscalls/dup/dup03.c
@@ -1,212 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
+ * Copyright (c) 2020 SUSE LLC
  *
  */
-/* $Id: dup03.c,v 1.5 2009/10/13 14:00:46 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: dup03
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Negative test for dup(2) (too many fds)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 1
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *
- *    DATE STARTED	: 06/94
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- * 	1.) dup(2) returns...(See Description)
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *$
- *    DURATION
- * 	Terminates - with frequency and infinite modes.
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
+/*\
+ * [DESCRIPTION]
+ * Negative test for dup(2) (too many fds).
  *
- *    RESOURCES
- * 	None
- *
- *    ENVIRONMENTAL NEEDS
- *      No run-time environmental needs.
- *
- *    SPECIAL PROCEDURAL REQUIREMENTS
- * 	None
- *
- *    INTERCASE DEPENDENCIES
- * 	None
- *
- *    DETAILED DESCRIPTION
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- *
- *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
+ * [ALGORITHM]
+ * Open the maximum allowed number of file descriptors and then try to call
+ * dup() once more and verify it fails with EMFILE.
+\*/
 
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif
-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
 #include <stdlib.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
-void setup();
-void cleanup();
+int *fd;
+int nfds;
 
-char *TCID = "dup03";
-int TST_TOTAL = 1;
-
-char filename[255];
-int *fd = NULL;
-int nfds = 0;
-
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
+	TEST(dup(fd[0]));
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(dup(fd[0]));
-
-		if (TEST_RETURN == -1) {
-			if (TEST_ERRNO == EMFILE)
-				tst_resm(TPASS,
-					 "dup failed as expected with "
-					 "EMFILE");
-			else
-				tst_resm(TFAIL | TTERRNO,
-					 "dup failed unexpectedly");
-		} else {
-			tst_resm(TFAIL, "dup succeeded unexpectedly");
-
-			SAFE_CLOSE(cleanup, TEST_RETURN);
-		}
+	if (TST_RET < -1) {
+		tst_res(TFAIL, "Invalid dup() return value %ld", TST_RET);
+		return;
+	}
 
+	if (TST_RET == -1) {
+		if (TST_ERR == EMFILE)
+			tst_res(TPASS | TERRNO, "dup() failed as expected");
+		else
+			tst_res(TFAIL | TERRNO, "dup() failed unexpectedly");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
+	tst_res(TFAIL, "dup() succeeded unexpectedly");
+	SAFE_CLOSE(TST_RET);
 }
 
-void setup(void)
+static void setup(void)
 {
 	long maxfds;
 
 	maxfds = sysconf(_SC_OPEN_MAX);
-	/*
-	 * Read the errors section if you're so inclined to determine
-	 * why == -1 matters for errno.
-	 */
-	if (maxfds < 1)
-		tst_brkm((maxfds == -1 ? TBROK | TERRNO : TBROK), NULL,
-			 "sysconf(_SC_OPEN_MAX) failed");
+	if (maxfds == -1)
+		tst_brk(TBROK, "sysconf(_SC_OPEN_MAX) failed");
 
 	fd = malloc(maxfds * sizeof(int));
 	if (fd == NULL)
-		tst_brkm(TBROK | TERRNO, NULL, "malloc failed");
-	fd[0] = -1;
+		tst_brk(TBROK | TERRNO, "malloc failed");
 
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	fd[0] = SAFE_OPEN("dupfile", O_RDWR | O_CREAT, 0700);
 
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	sprintf(filename, "dupfile");
-	for (nfds = 1; nfds <= maxfds; nfds++)
-		if ((fd[nfds - 1] =
-		     open(filename, O_RDWR | O_CREAT, 0700)) == -1) {
-			if (errno == EMFILE)
-				break;
-			else
-				tst_brkm(TBROK | TBROK, cleanup, "open failed");
-			nfds--;
-		}
-
-	if (nfds == 0)
-		tst_brkm(TBROK, cleanup, "unable to open at least one file");
-	if (nfds > maxfds)
-		tst_brkm(TBROK, cleanup,
-			 "unable to open enough files to use all file descriptors, "
-			 "tried %ld", maxfds);
+	for (nfds = 1; fd[nfds-1] < maxfds-1; nfds++)
+		fd[nfds] = SAFE_DUP(fd[0]);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
 	int i;
 
-	for (i = 0; i <= nfds; i++)
-		close(fd[i]);
-
-	tst_rmdir();
+	for (i = 0; i < nfds; i++)
+		SAFE_CLOSE(fd[i]);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
