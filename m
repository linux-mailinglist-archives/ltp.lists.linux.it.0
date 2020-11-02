Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 163732A2A74
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 13:13:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7A6A3C3035
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 13:13:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 906C33C262E
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 13:13:18 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [62.140.7.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E077960090E
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 13:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1604319197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f3QJaCG3SL4N7+APTxbwmZTznVB41/cBGdqAj9IRSAg=;
 b=CqtpfXSgVdIhf08JmhFOQLIEOY9cxRQj6EP2Shnn1SOfmKrake8UjVCzmhTrHPnXZLvGvd
 Y3J3gonolLf/OoWrJICUD0vmnjYvbAk3rXeZGK/CWJJTpYwWbvdpz27pnGKrRmFZN75RaB
 DOtH2JG/uU+hotzOKHjp2iqZSs1qal0=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-bVqqpetqP2WkH43n6Poa9g-1; Mon, 02 Nov 2020 13:13:14 +0100
X-MC-Unique: bVqqpetqP2WkH43n6Poa9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvuPrjRUrtKPNnHdJ1uvAcBoMCFg29SJPDip2GiKCf0KrnQWQdDyuPzXHFWTkk+BPh5EDkMMspuyPNySG6u2QS96Den/zImAa3MWuOEzDQCc5OTkQV/0sM12hHu/TeRFCiqXQur4W5cPk5kA5MPA6zLPV+QPnZQiMzu+ZXNbuf1jKqRayOfUA7DmTo46vwNS6h0nk/Qu6pBsWru43Ts5B30AdY9IQZjJXbGTwjzFQeKSnK7xpkQ8wEwK5h5kcSkjZY0v42Sr5IBFYpB8Q5EzM5UnILAegrTNsRuDGZQH0C0B/Pg+zV0GKLxUBovZOl7QTdqKhtLmV3Pzvp4awpnYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYt8Tj3tw+YykISYm/CsOc4M5f7uBXgZnloDMO5SsR8=;
 b=HiZNwpE8Z4FNKPGfPWyEv6QoriKwjiCNUBqyo1wcpqpQQ/Zchxe5c1UXmI1//TOg6SYfM6C+33SL3nC9tld3h6DDTYz71/q5X5Ykrk+VNg38W/4beUJtT7iI3UYw7WcycJ2saje+KJ3aVCNV82IPLgsf+Mriu+VSHptjW7v0nwYji2688teShFzHjlHu5O+3axqQeRlnlzXujKpc9DnKjz7IFvBxrh6uVelRs0Axnb008WL/WOO4/qVeuvzpaauzCHiidcmmKwZREvyWzlSlyejR/GRbyBP4jJqppxNKSo861D8eYJ+Gjtvib+scMxZ1qJ2GU+jA/Jx0AfEGlZ8Vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VE1PR04MB7263.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 12:13:12 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 12:13:12 +0000
From: Radoslav Kolev <radoslav.kolev@suse.com>
To: ltp@lists.linux.it
Date: Mon,  2 Nov 2020 14:13:01 +0200
Message-ID: <20201102121301.23890-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM3PR07CA0090.eurprd07.prod.outlook.com
 (2603:10a6:207:6::24) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.suse.de (85.196.172.93) by
 AM3PR07CA0090.eurprd07.prod.outlook.com (2603:10a6:207:6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.10 via Frontend Transport; Mon, 2 Nov 2020 12:13:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42fd2a4f-3e63-40b0-906b-08d87f28ab78
X-MS-TrafficTypeDiagnostic: VE1PR04MB7263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7263CF4C956755A2C4901EDBE0100@VE1PR04MB7263.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Yy+n/a1YfnbqUvaL/OCVNq7bchaXFpzutyZgNaiy2x3pQaxK+jfneHLd08jRcmE7RtUsWk0UWkq6bzEUmmo2pOsZhSbUHEGKhulrQnJDD4myUjfL4JxTYk+k/SPNgV+dMxM4St7I226qEXT1osMiId6OsE02ekqxNXwgm5jloQhM3xxoS214bnHMwemfTkQlrzjFMGjmAt16hKZbODa9YLnDNZHqfMNoKxX3oqCx9jXkO+tnVAkTAXDqRoC8tECK4j2A26fb5hF5K1PhWNZgOv2wo+mWj+GrNuYA+xU105vz/L2ECpWeUsLv9s55zY13J/neqIcR7dU11rwMBtr0wLNSZyfXAlJyrN3WMURmKM55Dt2NoGDveFSEzgh+Ce2dmV5q4EterBl35RBF74U2gxDRTf24sWwb3h7kSrD3dtPbBOdi1/b2aQfWSxTo9ypDAzw06ExEnohaYOgiNByWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(52116002)(16526019)(26005)(44832011)(6506007)(6666004)(4326008)(478600001)(6486002)(316002)(966005)(6916009)(956004)(2616005)(186003)(66476007)(66946007)(2906002)(83380400001)(36756003)(8676002)(1076003)(5660300002)(107886003)(8936002)(66556008)(6512007)(86362001)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MkwOKySF7nBEjAZRV3mENBnb0Qr+LN52O0ady7Q7QrTG6MtX5BxfntLSWPdv64+L8e4zXAuHQDOx/oRMf81vxgTYQZZX/xqze0Awt8IpPNyoajGWc+pxj/bTkGaIG5c/cWDxeY6+/xJ268vYdf+7Nxths8nwOMT2AX1ui3ut48gBQJLHxbx69cV0cpLrDor3WMltb65gc6zJGZy02M7cnNV+w7nJ9Gj80KYFeYIm14jIzd6Tm75gToWWmP3nEDmirkhAv6WZzSMxBjgRli5BxDtwT8F8AW9qrzOt+F/87BmsZEk2KOrtYQU4GMLhi/RcOV1qD84lX7FWdAHLqq5m+zXXJzbdXHmBzUOGZtxJi0q2gC+o0sE84sBCDNXslsIAiBp3MDz7+5NmBll5U0oZjHGseyIH1bkHFDj5zRGC+iPDe0k1IbaCwU1T5Rj1p4lijjvBXdzFOvCUaRkAg6ITVFV59gJ4UX/UFH4ilBEHR4Pn4vo4i2WNC6G/2qxrezvji7pmoS2FrUezYem5qIES4jr0eW/7jR5HDaq4wVV1DJpickI7NgMNt+sqSnohgCwo9R4ghm0+PzAL6fh5GjBbJqr+ecUROQhDRO6TkSQIKXfBfXuxZycG7Opig9ch2KEmUIwgrYyiqe7Q4mGqYMqcGQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fd2a4f-3e63-40b0-906b-08d87f28ab78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 12:13:12.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9T8XHFb2W9Y4Um2PFpdYm2tu8c9sks+BGoCydw01AuJ9vV2JyMNUdhI8BHIT05DAFjsVhdg4A5Q8G9+KO9Y6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Convert dup01 to new API and clean up
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
index 5c82ebefc..b4523cbd6 100644
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
+		tst_res(TFAIL, "Invalid dup() return value %ld", TST_RET);
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
