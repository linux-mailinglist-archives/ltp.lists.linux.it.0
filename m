Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB72A2615
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 09:28:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597613C304C
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 09:28:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5941F3C23B8
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 09:28:19 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6B3236002FD
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 09:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604305697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pERillsyvdMcylQagS7f2w5gonqqJeqGJzX5uPKa0iw=;
 b=SaBOE7GCcfsL0JXx4JQWgGTTfn679TwPGv30f7f4ZsaJ48GONrEmLWABA2Xd/9BcGxvzTV
 gcCPzxJZD9MjPvp0XJsWSd6Fa28a9KqRwFjulKDakifDEZVssxnKcTq/7sTjGCtzjTRqwI
 y0KGBN0KK0ps0a7ZmJvjhjsNZIExlxk=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-4xCtUoUHMOme8kMpoZXyYQ-1; Mon, 02 Nov 2020 09:28:16 +0100
X-MC-Unique: 4xCtUoUHMOme8kMpoZXyYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qct0T6pxQ72tQ1NLhD9yd8/Q4Saz0TfmI+fVfr049KBwqdOqsVnci7adooTBoCtXVWtos77Lwq5xF7lyMtoWtEVfzFcHGSNpVzBTZM+T+VOLn+1unJ0e84N6n7E5rVeOfA90IyYf4om/cBCFyjY0070WTghccnyM7DKkr4wI++/M34RcnMNkCGX11DasWbSRmHjTj0+4x7OL23rOYymzUwC5mSZvtJv5Ln0vl0g/VM08FRVaLPVGFU4WU4MNbG191N6hMiqev6coyn3eUAK2O/VMYLCdrOkYX0Zjn13mrEu7rmB87+x6/z8A0LYJ5KzCgHKPa+u6G7RugQWuk1s2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SeE80bMxCJI8t9H2b0dct1MRKBqT1BviTXkFcwdHsA=;
 b=i3xFkFPSJAAfQU6EwHRGx0iplQd7KddO/6xJTgN6gBywxbcOjgm+KNr5EX70ILdYpwmJRU0bV6ttZIZfyYudhRphNpl0a938PiUf87jrCmPfsvbdslwatHEBAoDxXAuzvdpoujhZn3l5aoZ64ZQcS9jmC76nGRSrg+VSzgJWDEn9Tb/JPvXje8CvJj6bmCeHsGr+R9EGHjvo8shnhRKim391PC5U6Svc6pcRjU32rk/Z9ILLTHECXdU8nxepW5hnb3wq1jCGTYVSPNvBb9kwH6rlpW/FZp/QuuoaZ6etD35Z7GY3m99qLnQQQ4ZTEuzk96RmltQRYTrYBuHgjcbdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB6877.eurprd04.prod.outlook.com
 (2603:10a6:803:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 08:28:12 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 08:28:12 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Mon,  2 Nov 2020 10:27:51 +0200
Message-ID: <20201102082751.9807-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR03CA0056.eurprd03.prod.outlook.com (2603:10a6:208::33)
 To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM0PR03CA0056.eurprd03.prod.outlook.com (2603:10a6:208::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 08:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81bc3be-b3e1-43e8-6494-08d87f093c92
X-MS-TrafficTypeDiagnostic: VI1PR04MB6877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6877A78CE2A599E5AE2B1ADBE0100@VI1PR04MB6877.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjSM20mwc/fNhkNhlWAGKpQdPyL2j3w23BuSlTwbFL3cqpyKYmsTcmwK1xIB7gjymYtqfpOICDUaIA4Gr7i8RfC4dVc2ka6Ud0XNO2UE+yzWIW6Bw1mt3V+96B3McyeZYxu39jFV57yd+QTB7Z4xTyB3WfPlFUhC9dRNTjToqHwa/yvswJxx8Ug+MBNdD/6hZ7qTsLC2k6KtEXynA+tRG8SB8dOPtFoNOC3Eh/Wy/wCUucj1PHXCWcgoChxtNNFcj4pSIusOSm4MMSAhvtbB6xY7bXLO8jm2e/VjPJneZz3z529N14kTrAe2qPyCs/j9uN71u2vzwx7I2gXshh3SoUC7LS/hMFzCx6/h+a0+boTggKUIqGxmL6h1PMx81vcXvrH1n/3PhZDS47jAF4SzZnc48s8CgHcxopNmLFMQtMKUX9bPPPltxiiB8mohGHI8uqrCOaETc0GF+V1LiIGFew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(396003)(39860400002)(346002)(1076003)(6666004)(6506007)(44832011)(6512007)(36756003)(5660300002)(966005)(66556008)(66946007)(66476007)(8936002)(52116002)(86362001)(26005)(4326008)(6486002)(956004)(6916009)(316002)(83380400001)(107886003)(2906002)(2616005)(8676002)(16526019)(186003)(478600001)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 06corBMzhQtIpikWtuS8umnQdPOjviBWuwPQmP4UWkoS08dEP1i0/vXxFny/5Lww7RYmsNz6eVb8wEYQ0kpteZsqFM/lNAnNmT0J7244R66vp1k4+GUmuekEU0gsO3qsgijb6VEP87BWQXNKaOT2/20SwHFts7oxzal2sQluhDXFJQWDCRpqjPi8JvjhDVTzno4J052sOSXwWOVRtqtjoS8uMK3bTlYfYlj3rK7m26wYLmx88iLV8eF4sGRLdpanDANLl+L+cGuxGC7M2w2P6sSDfCP28xqXl2gsZc++pJ+HEOxH09xwTVQleIy3uloYe6yEAyiPwAJNvHKwfioCXQithqu1QMLB6WUwXEl/oH+FJj3Ib8A1Dj1G20e1AYvtm9ixEQB312IATFXpVVIiouKyrL2QBdXc/ts8W8kaIVxjgfSEcseYsnL7PkBCNMPk3qFFiAWhSbgdtA04VTcUafiG0ScOIIMF12L7UFIapaLeblBf9V8zrBaOy8ni9nNRvQSP3lAjNuWo49hG8ZyrKvlbWguUC9WU9g5bcP0ccOGGJJgdu035Y/+VSGx/zxgGIywf3xJQfIyvOuC5FWrTQRjixsGmBROuIYiVEpDpJdBi1wn8as2j7SDGwzulTymX3G6KfoDg0gDJNMZcdheUhw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81bc3be-b3e1-43e8-6494-08d87f093c92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 08:28:12.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PO2yLxyyj4b0N8hWLALHOGZdOs3LcFHgxcYq5yRPjwvaS97JjpVwtNVDNLKMZ6NdE2p0sAmodCQkbnwH9S46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Convert dup01 to new API and clean up
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
 testcases/kernel/syscalls/dup/dup01.c | 197 ++++----------------------
 1 file changed, 27 insertions(+), 170 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup01.c b/testcases/kernel/syscalls/dup/dup01.c
index 5c82ebefc..cb6fe6204 100644
--- a/testcases/kernel/syscalls/dup/dup01.c
+++ b/testcases/kernel/syscalls/dup/dup01.c
@@ -1,187 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2020 SUSE LLC
  *
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
+ * 03/30/1992 AUTHOR: William Roske CO-PILOT: Dave Fenner
  *
  */
-/* $Id: dup01.c,v 1.6 2009/10/13 14:00:46 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: dup01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for dup(2)
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 1
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: William Roske
- *
- *    CO-PILOT		: Dave Fenner
- *
- *    DATE STARTED	: 03/30/92
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
- *
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
- *	This is a Phase I test for the dup(2) system call.  It is intended
- *	to provide a limited exposure of the system call, for now.  It
- *	should/will be extended when full functional tests are written for
- *	dup(2).
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
-
-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();
-void cleanup();
 
-char *TCID = "dup01";
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
-char filename[255];
-int fd;
+static int fd;
 
-int main(int ac, char **av)
+static void verify_dup(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call dup(2)
-		 */
-		TEST(dup(fd));
-
-		/* check return code */
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "dup(%s) Failed, errno=%d : %s",
-				 filename, TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TPASS, "dup(%s) returned %ld",
-				 filename, TEST_RETURN);
-
-			/* close the new file so loops do not open too many files */
-			SAFE_CLOSE(cleanup, TEST_RETURN);
-		}
-
+	TEST(dup(fd));
+	
+	if (TST_RET < -1) { 
+		tst_brk(TBROK, "Invalid dup() return value %ld", TST_RET);
+	} else if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "dup(%d) Failed", fd);
+	} else {
+		tst_res(TPASS, "dup(%d) returned %ld", fd, TST_RET);
+		SAFE_CLOSE(TST_RET);
 	}
-
-	cleanup();
-	tst_exit();
 }
 
-void setup(void)
+static void setup(void)
 {
-	fd = -1;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	sprintf(filename, "dupfile");
-	if ((fd = open(filename, O_RDWR | O_CREAT, 0700)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "open failed");
+	fd = SAFE_OPEN("dupfile", O_RDWR | O_CREAT, 0700);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	if (fd != -1)
-		if (close(fd) == -1)
-			tst_resm(TWARN | TERRNO, "closing %s failed", filename);
-
-	tst_rmdir();
-
+	if (fd > 0)
+		SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.test_all = verify_dup,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
