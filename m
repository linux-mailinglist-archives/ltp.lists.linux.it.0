Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 658662A0887
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 15:54:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 165953C5569
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 15:54:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AD7DC3C2467
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 15:54:04 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [51.163.158.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E74242011A9
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 15:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604069643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDz6Vu8Xir15ZUS6e3zRCIEem/b+p7BVQRXa/7LpsFY=;
 b=GWkwnq0wt44mWIMCVpLakmUFREtKLQuKyJyKIFuBtsfAQBO9W+I6iJXpbvUhKznDH0nsF3
 T0+Wt9j4/O12/VdfyUUJWWeIy9/bTBDTC1z9KQzjs9tL9hjkc2rv4wJUO4LqxR2aMp3dvj
 +uOJZtkmr5dAw0EJa/opT46hk6ffbAQ=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-2IbvbsDrPf6QRacAlq1UaA-2; Fri, 30 Oct 2020 15:54:02 +0100
X-MC-Unique: 2IbvbsDrPf6QRacAlq1UaA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVG73cYCeOomiwWbYwPS6OysNIYki7LOJB/pES3h+wxrMYhQE75Zws6zhiau/pwt1WgjlgAprIjR1l57i15tobuxN76+ARj/1fFl3gEB8ZgE4Jm5P0Y72F7DFRrsiCAf0dfzw/aPsyHVdSIoadshf21l0M6zBQ2BY1WyDp4Fc7MJSzh5XosHx0cvx3Tv18V2O1VsuBMZs8IdTK2s+DtFePqLBSQ0nf695UcfB0krOaoGZJ9cWKSQk5a2hrYWXMlEPtJS8QlNH1ZJmslslkatoocgeZ9DSZ/ovbs7TfR7vNUScqKPff3BB7t5aPJk/XiAfGHHsaNohUYbM+04HjRIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJW8YqE1DX5JaMDgdZgA9xOXP1hOrt+ZUb92KLlKBI4=;
 b=YUBod/5XrS1lqrmkTw9TGRUjpMzU4uPk5uldkkd5SpEsXBmj31yq3lRv0J0f8ve/F/EQuJmJZrlvZrQWdBtmZtfQTmE/CxPAsO8fNyj3DL4HDn3bcbv3eAbQEHn1wUAhFJP272IOz41qoGqOOYuiR95hXDrB20v15H5MMk9CpGKEBMlylpx6GTWvo6qjsd2PJMOStu9f7hhXVS4wbo+0icyDCZOF34hlcYnojVQbKFbxIZloXrjMIIOx17oKbIs3C6X+DR0wjYmtplvCekYpbO5lbZeuqJdBWYXZ83QOPilsLMhmJe7IEryj3QtPcOs9D+hVmpp2uR5E5XvmVF/aCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB4447.eurprd04.prod.outlook.com
 (2603:10a6:803:76::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 14:54:01 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 14:54:01 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Fri, 30 Oct 2020 16:53:50 +0200
Message-ID: <20201030145350.23829-2-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030145350.23829-1-radoslav.kolev@suse.com>
References: <20201030145350.23829-1-radoslav.kolev@suse.com>
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.9 via Frontend Transport; Fri, 30 Oct 2020 14:54:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74fab48c-0467-4b32-fbf2-08d87ce3a338
X-MS-TrafficTypeDiagnostic: VI1PR04MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4447FA761F2E92CD6BB55FDBE0150@VI1PR04MB4447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0Q1nxyno0sQ0gdNA6tkqR7jX8y7e6QreVg1+Gz+KUdbI9kxCWAAkudv0sXEVPKkcEd54bGyjnNCjNWlHfyjZW6TUo7L/zANS2xwjQj6SJgP3UgQi/VV2AOUJer38M/stVT+92nIqflT/chMJHY4e82t41ivmbsNDHOMzjl71h924RcxKtp8puv6uHOF6B/YULVbz060QUkCLrHV2VF3igksK+o6bKmlAMdf3IzDugTmPosin8rzSD1uym3e0Q0rY8+ZK5xDxEsAOqIkmc6BmJFTwSwgjn9SKCWI2OgDPVk9vl27HZUqg73fG1lrmj7pBfmri7VFCXZfCcwaQ9JmhiWgWc/spB7yNS63OV1te+WJKIyhiHmL62Nh1QQhhi7h97Rdrl9ouid+o862uykT9jF+/x+XyO4Y5kXWXBCHq42KEjqynLDr8VjzoH62JyvvR7Oe+JPLrGCt8VZqkURNQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(6512007)(4326008)(2906002)(478600001)(2616005)(956004)(107886003)(66556008)(66476007)(66946007)(6916009)(8936002)(186003)(8676002)(83380400001)(6486002)(52116002)(966005)(16526019)(44832011)(36756003)(26005)(6666004)(86362001)(316002)(1076003)(5660300002)(6506007)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: AH+830upkSp0B5ftQYUsur+BXBE1pPjqfUKl+xDFDW3WLCaZ5mZR97HLyx0Fe9IH4AAXHAXGZb463v1aFT/p2gEJNteG4moS1autefUhTuqUHjSxc+MJRiIhSV7Whio+wGEf/YonKf9fJqzWKt+4bXqR0NdBXGslmPuAsQog/3N48U2jNOztUepxl12pyr/ZnRHl9VqouwnhQNfKn8PTi/eVH8/CU8rIzIaZGtpEHH04UFhSjk4jyCGnXc+Zl3qoKO3kKw4J7YEj0kXFW8wT1BvJQoI2SSwV7y+b6fBCZS50vQZgZAc1FpTTXlWICB4EtirxCzeLXvHVI7L4ECDGnVsXpx9p0oW+SoVXNQyLB2wmUQD3mS2PQeCbxHU6kG1gcsLV6tM9QHh0gnBwtbo2YmH0bYuGtIYLRQdaDVwTRP3r0oRWe59cQYRwZLe4ugQmGGf/ct+zFJFTGnd8LVAdIEMS+q3l/Ecdn14/5aS9qPUycMe/pJBT5sHR2p0tL4ULoxBA1T4gUwc0HMUKxVv4086Lmqv+jTwT/Xq5DyFTdurN2TM0yxDMuM95eHADsLj1ofSMPrYhZmoShADYTBLTlNJodoBcQ7mK5fv8laWEcyI3DISB5HTxlTmI1jHWv3rG0W65iz7V2NCJ/qYhkGvKEg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fab48c-0467-4b32-fbf2-08d87ce3a338
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 14:54:01.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWbcQ70/JEXsOsWiTOIwvBck5u26ZNcfvGc3WobsPJSVn5HHrtB2zMjR7Wd066OEdJKAG7JL+NDkgRJgwJocCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4447
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Convert dup01 to new API and clean up
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

---
 testcases/kernel/syscalls/dup/dup01.c | 202 ++++----------------------
 1 file changed, 30 insertions(+), 172 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup01.c b/testcases/kernel/syscalls/dup/dup01.c
index 5c82ebefc..c3abfb14e 100644
--- a/testcases/kernel/syscalls/dup/dup01.c
+++ b/testcases/kernel/syscalls/dup/dup01.c
@@ -1,187 +1,45 @@
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
- *
+ * Copyright (c) 2020 SUSE LLC
+ * 
+ * 03/30/1992 AUTHOR: William Roske CO-PILOT: Dave Fenner
+ * 30/10/2020 Convert to new api Radoslav Kolev <radoslav.kolev@suse.com>
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
 
-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
-void setup();
-void cleanup();
+static int fd;
+static int dup_fd;
 
-char *TCID = "dup01";
-int TST_TOTAL = 1;
-
-char filename[255];
-int fd;
-
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
+	TEST(dup_fd = dup(fd));
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TERRNO, "dup(%d) Failed, %s",
+			fd);
+	} else {
+		tst_res(TPASS, "dup(%d) returned %ld",
+			fd, TST_RET);
+		SAFE_CLOSE(dup_fd);
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
