Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B52A79A2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 09:51:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 971283C2FD9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 09:51:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5FF703C2481
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 09:50:59 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 85D561400F5C
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 09:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604566257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0PrxrDC/TQZPVbdD75Jhi1byRr4MdPsVSUTFK2HQ9og=;
 b=Ogoqn9HnKkEpfSBEegocMvKODkRh3/bcz46fMWhqmoy0atl+/+NJj/cMRmqk7FxqmKUW6Y
 YjxE6PRIgE1AyemfKUO2pP8Aw4QvBwVIqMYpPwlN37LMNuRXwyPnblyDBUOhRVQfcI1lIT
 ku0GnDjP9xlKfWKtUtayq+F6RaAY4BI=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-1x9UT5ZnMVmzERye-W4njA-1; Thu, 05 Nov 2020 09:50:56 +0100
X-MC-Unique: 1x9UT5ZnMVmzERye-W4njA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcsXKk1fjVANh9SSI7kNvxqLwB/CJQPR4oqw+N45X7jd/stHsV13jslUSCowHDhb+bJ1aZ/sdBMk0XRYYj2KpCdsAhAvXpp+YPvJnJbJx78sn7qM/0DubZhle3e4qP+HUwPtO0JR0Qz1i1PHYOZXwVY0JEg3s8wGt4f/7deE7EXs6ZzIlQHoc7nC6FXgkhzEq+ScNQj8ck0ASKq0DdHeB22KrTZphlCMrdun9/aAjy1EX6neeYw8jwSn1Fw7CHEXgg8E4G/DAl5zKaPMuJD8nMmx82vizGJFSqNCvjZ4oLoP1LerCmcnQC52TEab9agvHvtTKoqrsoEioHaHjRKhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCuMQXb9hW+6BRZtQVOcU+iyhLC0qHPg0vI282Zprgw=;
 b=J91OySw92t3Qpgpbp5A+81mBCH958BekRoIfqZViDCupnnFbnPcJ+HYY7psHGLjhEpxjR2nbidbzBPMu6KN2tLXIihkRU5fB4fo0W/gUhl2PHObi/JPEqOzX4Ebnad8yIr1AG7Wnji/VppoIv6HWxHUaI/ncCmV3n/sP1irNE4wtn+DrcsqTsNoLuy9cOmkjxIa92wNh+bO5QpX4rdoHawkaiOOBi2uJjvQytnv77i4nBEs/YtP5HGJ0+6J3ODkAGRg6hSmzBG6eQ+n/NwWFrBgqRgYF20GExN4tDsFHKhQ7l+rLs8DVsGCC6fedD/3+9Q+gp9U4tfIIUVPPn5oBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VE1PR04MB7472.eurprd04.prod.outlook.com
 (2603:10a6:800:1b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 08:50:55 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 08:50:55 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Thu,  5 Nov 2020 10:50:45 +0200
Message-ID: <20201105085045.31247-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR02CA0083.eurprd02.prod.outlook.com
 (2603:10a6:208:154::24) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM0PR02CA0083.eurprd02.prod.outlook.com (2603:10a6:208:154::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 5 Nov 2020 08:50:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9372ccbe-3004-4c10-0159-08d88167e84e
X-MS-TrafficTypeDiagnostic: VE1PR04MB7472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB74721E59174072ED5503DC91E0EE0@VE1PR04MB7472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQyBSw/E05iVCbPsYc67/+SQK+RCubBJWFrwlXeMBfec1rbecJklLtm9DqHF1qGMoUI9KumeA5mE1V2pTBkv5kGMFNYsPjU/jZXLaam198MNmxwKk4Dx7GOmCmD9dp2I0p+MbalB1uVIu6vETw4eH/BQujGocPzQHWexjriDMzUbDmO6Msi7H0qXQHc5QZmDVAyBlIRXdD+3VNSYNCrEQXyAKaxAxqevB/UWpFKetdRJlfIwQqEd3WlunvguMCoyrZwdQLkXBXd6T40/t3oMEksTntjPeGEu5K7tgGLbZ42wJe9/CjY1PqqB7WbzoK3jTRufY7o4m8bJYrp01cPYE23+B4cuPOeQvv+u90fyD+peJxXMN5spK8xqVFTAegvMwCPHZ+9wwtY+55OwS6onxlvDWel7fmLNboHJ+uCVNSUzCW7eimehozP9mv4RPdQ+ZMjWcgJHnX+BEiP81NBHKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(366004)(39860400002)(346002)(66556008)(66946007)(83380400001)(26005)(52116002)(66476007)(107886003)(6916009)(6506007)(186003)(16526019)(2906002)(8936002)(316002)(8676002)(6666004)(36756003)(5660300002)(956004)(966005)(4326008)(44832011)(2616005)(6512007)(478600001)(6486002)(86362001)(1076003)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: S5jIh4lg+hREVHqtUh+pu/u8OP4uQKrFA+ljxWJvjZfo89ZaO7PVtENcooq9dAehEbXr7K+FJ/7qAdTiDbeEh5UmDtZspD2UVcl4q6m+SdBP2bTzkpaPeyaTdmhdesoeG6z40Li3EOjmLlLcOaHRfxC6HLSHbJQp+CF6tFpRfpy+AZlJYhMnyZu6kPWMKTRMlDq+MkbOPv3qG9jon+BUawCM8/3bOZ4A/Tcmh3G3YFdRDKfYm5ouwFxOP0qTL4pA7jyHFtM000mOWLURrRB+luCIAajl2WsESIQqmyI+uE/TxrCKHVzMQSf62gJJJo5q0Rv9EkaWngcgqdSsAEfLFzilKXSq6vTuPQuPDejoKlIfYjKw9pvfsbC2SRF5G2wsQKDvPY3z+Nqds+gWT5Gc+c39PBarQKkaI2Q2Ltxnl358wVSELVnHsvwOmubuxytOW8JGtiu2lbwNltoBdm74diufx3QgEcC0hjI/TlnfyDyK1z0VCgtkgQv/aJugyOBodNJYzovKUNZZUg1+sMjuHeZVMbd3hBbrKK4TNq6KLrdmyWYk8zChIFQirF4Xu68MkqKtW0cFTnDKYpfSyh+dmfBtxqRutv4ZdrMZNYrovLvM+p3pD7/X58exlHKuI0lTWGMKFjmXyLXlJHCDzLt/lw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9372ccbe-3004-4c10-0159-08d88167e84e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 08:50:55.5763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdM/Mzj+YslKnFIEcSEPweRImTigubKUeP1O11fQ7dZuerpejYYGB70nOqdHx6AfEWEEiCnD0SIAQ+o5J61t2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Convert dup02 to new API and clean up
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
 testcases/kernel/syscalls/dup/dup02.c | 209 ++++++--------------------
 1 file changed, 44 insertions(+), 165 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup02.c b/testcases/kernel/syscalls/dup/dup02.c
index c0919ef09..c67acda43 100644
--- a/testcases/kernel/syscalls/dup/dup02.c
+++ b/testcases/kernel/syscalls/dup/dup02.c
@@ -1,179 +1,58 @@
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
+ * 03/30/1992 AUTHOR: Richard Logan CO-PILOT: William Roske
  *
  */
-/* $Id: dup02.c,v 1.6 2009/10/13 14:00:46 subrata_modak Exp $ */
-/**********************************************************
- *
- *    OS Test - Silicon Graphics, Inc.
- *
- *    TEST IDENTIFIER	: dup02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Negative test for dup(2) with bad fd.
- *
- *    PARENT DOCUMENT	: usctpl01
- *
- *    TEST CASE TOTAL	: 2
- *
- *    WALL CLOCK TIME	: 1
- *
- *    CPU TYPES		: ALL
- *
- *    AUTHOR		: Richard Logan
- *
- *    CO-PILOT		: William Roske
- *
- *    DATE STARTED	: 06/94
- *
- *    INITIAL RELEASE	: UNICOS 7.0
- *
- *    TEST CASES
- *
- * 	1-?.) dup(2) returns -1 with errno set to EBADF...(See Description)
- *
- *    INPUT SPECIFICATIONS
- * 	The standard options for system call tests are accepted.
- *	(See the parse_opts(3) man page).
- *
- *    OUTPUT SPECIFICATIONS
- *	Standard tst_res formatted output
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
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	  Loop through the test cases
- * 	   Execute system call
- *	   Check return code, if system call failed (return=-1)
- *		if doing functional check
- *		   check if errno set correctly, report results
- *	  Otherwise, Issue a FAIL message.
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
-
-char *TCID = "dup02";
-int TST_TOTAL = 2;
-
-int Fds[] = { -1, 1500 };
-
-int main(int ac, char **av)
+/*\
+ * [DESCRIPTION]
+ * Negative test for dup(2) with bad fds.
+ *
+ * [ALGORITHM]
+ * Call dup(2) with invalid argument and make sure it returns -1 with errno set
+ * to EBADF.
+\*/
+
+#include "tst_test.h"
+
+static struct tcase {
+	int fd;
+	int expected_errno;
+} tcases[] = {
+	{-1, EBADF},
+	{1500, EBADF},
+};
+
+static void run(unsigned int n)
 {
-	int lc;
-	int nfds = sizeof(Fds) / sizeof(int);
-	int ind;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	struct tcase *tc = &tcases[n];
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	TEST(dup(tc->fd));
 
-		tst_count = 0;
-
-		for (ind = 0; ind < nfds; ind++) {
-
-			TEST(dup(Fds[ind]));
-
-			if (TEST_RETURN == -1) {
-				if (TEST_ERRNO == EBADF)
-					tst_resm(TPASS,
-						 "dup failed as expected "
-						 "with EBADF");
-				else
-					tst_resm(TFAIL | TTERRNO,
-						 "dup failed unexpectedly");
-			} else {
-				tst_resm(TFAIL, "dup succeeded unexpectedly");
+	if (TST_RET < -1) {
+		tst_res(TFAIL | TERRNO, "Invalid dup() return value %ld",
+			TST_RET);
+		return;
+	}
 
-				SAFE_CLOSE(cleanup, TEST_RETURN);
-			}
+	if (TST_RET == -1) {
+		if (tc->expected_errno == TST_ERR) {
+			tst_res(TPASS | TERRNO, "dup(%d) failed as expected",
+				tc->fd);
+		} else {
+			tst_res(TFAIL | TERRNO, "dup(%d) failed unexpectedly",
+				tc->fd);
 		}
+		return;
 	}
 
-	cleanup();
-	tst_exit();
+	tst_res(TFAIL, "dup(%d) Succeeded unexpectedly", tc->fd);
+	SAFE_CLOSE(TST_RET);
 }
 
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-}
-
-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
