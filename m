Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 643862A64F3
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 14:21:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 107BA3C2FFD
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 14:21:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A4FD3C2462
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 14:21:35 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B5A021A014AB
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 14:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604496094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CUnmP906YZeko+kVg7NyR44guUzpaXtdxztlkMJv+ok=;
 b=Whpv6ANF21SlHy8diysnJXmYTSZY2Jv7+FzoS2S1v67WRtt3Bk/dlshyJCZeB2sKJeRjpj
 e3UiqQYzNcVYFCk5UfLG21+8q28gaBic+HKp6+ZbFuxnYZwiv+g1WpQgCaGO7EDMe0Hckq
 toLPpGqVqpPZzqlputVcgja+NmrD5cg=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-V9_A6u5yMyeUB_hpZylrQQ-1;
 Wed, 04 Nov 2020 14:21:32 +0100
X-MC-Unique: V9_A6u5yMyeUB_hpZylrQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWbPP2FxkENKIJ6BfsM0qNdXfXXV8jkyOBdyjeHt7VDESEsnQypZwcjhiuhLG5gcOxZmR0x88TYkGpHM3cr4+xb2RNbSeuFyjf56tVcMSEr1ClYQV+kF0rqE0kIUH113yY+phSUMAWRFMgmmyv7rNKxe9KaIR68vrNE9o3rlMtppVjWfumkY9ewkoijecj8C8hdMICP2r+u7cIAs+ZM4KLLWhpGZeHQi57d0RFlwCEzb8WP4GG3qEmvCMP4ZcqAm5FCwC3NLH09Lav1tEXibsrg/nmdIo54gbMpKbNGK+eeP7rF42U5k1CqAqEDQFYNMf2Dc8ynVbG5QfXwm1wB0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSjIjlBjLZo3wkkbDppRqnAMJSsGxfq00kbpbaSdDfU=;
 b=V7lqkBmle2/i3J3gxMivzSgI+QhZCFcFFMuAfDVOwAYswOfSbFxQOuokD2ml28Y7GYRkAALedJ65cyeO9rWrj7v6pYSN/L5Uux8DOVVTtH+hg+sfqAP96SbzHS9NrG4AgcYE6MgzIijtUZwiwk85sUsKn9Xrm62GLy8X8RmC7hHM4PxtG3UpX3tEAPV0B1JQgnYeUwhRmJPSEQRP/CRhG7EgMQWOl/YN7I6A57IbOsHeFKzcUIVPnXAQ9JhEWjFCwSK7rErH5RMuPMJZzgb1gmWKbAZ1BeQhsvqhNTY31kvZbSpEPFFR59dvQ74rLcyVqy6KJ/O7OTfJEKCYqpSiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VE1PR04MB7472.eurprd04.prod.outlook.com
 (2603:10a6:800:1b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 13:21:30 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 13:21:30 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Wed,  4 Nov 2020 15:21:16 +0200
Message-ID: <20201104132116.20712-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM8P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::15) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM8P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 13:21:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64bc552a-2b4b-427e-a364-08d880c48a38
X-MS-TrafficTypeDiagnostic: VE1PR04MB7472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7472CFFB6871B6E5745FE64EE0EF0@VE1PR04MB7472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWe8d/8p3EZiaz+eSnQGS7W+9n1YEadS673hu9eRgjW60/AP0hV4NT7AKYSUesAe3jrAFqa7OurAJaZ9wMuAOHNE2v5/SrBgqFWxNeVcoIUU1Yp8xAKyowtGFRyTgZQ7sTy5kt3LJvwxEplCh2htm7eNykdDguqQE/MK295I0qPGBLcoDXLrw3VJZadc4asAszxDMbcdATGXc6ToDHkhk2/nOg+iGExqq+TI/SlLQQCcskiidpw2gFAQmuiOKSnIhB53FY8HxaEnc6JcCzGGX5ao+DSL36xEvvJNRRmAQKKayNhWTDBGj7yUhTdqUfh1mpFMB4tx//1eXp7kn8L/E56dxJUNmcnzwKWjrdte+sAnKhVQwxe1A2SMO3WEALVQm6yPbIin+dGGNn/vRIYuhF/3cp8q7/Q0Zy+QXvC5DaU0bfEt2sf/dLnljF/TYp4YwBvDXyHCnZjMkVBRQLFtEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(6916009)(66556008)(83380400001)(52116002)(26005)(8936002)(6506007)(66476007)(66946007)(107886003)(16526019)(186003)(2906002)(6486002)(8676002)(44832011)(36756003)(956004)(5660300002)(4326008)(966005)(6666004)(316002)(478600001)(6512007)(86362001)(2616005)(1076003)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9yMxcZRPASh/wDkspWthhaARKjcI3lKZUMGHHzlCdLaBcb9KPUiv9Z/oMdik4oL/lR6sBV8b9y7xOk2CzHKboD7+3NwWXhRxK81U/q0JDVmrgXwmbFSftNVtore2H0NzllVurQv+tYgIyvYhzvIdi/q9b77xK/bxjzLCypJswYv0QVkNDjCpkbcr/tVo6OkdZtqQmFJuHJbp3qx4Gw/c0oW/pe9x1VlhxfUcASfR6xESGpzJkYugOHSSJ38wko+jhBfumZgl6oV+5v9n5/P/eq+VNDUzUfP+n5YUBHZAEqK30OOExAmNBtBRKKy4v1CHgzhvgMPEjmiKxCleYnRQ0UjL0hEzk8wuyRCkYmNa34dbyTmwbXNsGUX7ejC7D+3+6yjFAVGdnf5+iWulB5Ki9810I1zDeZgOQ1v6nFutbtfLfp2Zw0bmy3bp0vWoR92WhA9Jf7juxcOFvlN+iqhjhlkU441bGrmSetQx+8URnM0AVjH57GefPQPZ+mvNL/5hLpj6+qBbi1Ep9yOF/Emy0nuHcxmZNTMgXyNudLzaQVScyU2ewoUlJkLyz6jIlQs05/+n9z9ZDERIBAoiedlP0f48lvjUvhpPhY5ZJpLNiVX39psWJFFd8rszcOtnxAhOgE2UZDA+W1sxxgmpZ60Zmw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bc552a-2b4b-427e-a364-08d880c48a38
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 13:21:30.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iACYtxGNbYoJLvnb6+BdsNwrd1JYKsCcmqWynHlv2lWtX7mVorRDXvXEXBSgpf6d3at9Evr4EvyqcU7WApfjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Convert dup02 to new API and clean up
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
 testcases/kernel/syscalls/dup/dup02.c | 212 ++++++--------------------
 1 file changed, 43 insertions(+), 169 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup02.c b/testcases/kernel/syscalls/dup/dup02.c
index c0919ef09..55ba288f6 100644
--- a/testcases/kernel/syscalls/dup/dup02.c
+++ b/testcases/kernel/syscalls/dup/dup02.c
@@ -1,179 +1,53 @@
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
+} testcases[] = {
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
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
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
-
-				SAFE_CLOSE(cleanup, TEST_RETURN);
-			}
+	struct tcase *testcase = &testcases[n];
+
+	TEST(dup(testcase->fd));
+
+	if (TST_RET < -1) {
+		tst_res(TFAIL, "Invalid dup() return value %ld", TST_RET);
+	} else if (TST_RET == -1) {
+		if (TST_ERR == testcase->expected_errno) {
+			tst_res(TPASS | TERRNO, "dup(%d) failed as expected",
+				testcase->fd);
+		} else {
+			tst_res(TFAIL | TERRNO, "dup(%d) Failed unexpectedly",
+				testcase->fd);
 		}
+	} else {
+		tst_res(TFAIL, "dup(%d) Succeeded unexpectedly", testcase->fd);
+		SAFE_CLOSE(TST_RET);
 	}
-
-	cleanup();
-	tst_exit();
-}
-
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 }
 
-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(testcases),
+};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
