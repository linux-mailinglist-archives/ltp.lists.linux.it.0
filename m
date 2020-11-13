Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D02B176E
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 09:40:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA39F3C4FBC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 09:40:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2BED03C2EC7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 09:40:47 +0100 (CET)
Received: from de-smtp-delivery-52.mimecast.com
 (de-smtp-delivery-52.mimecast.com [51.163.158.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D3A81A0176A
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 09:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605256845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3i5fjnZJtuBUsC+ofE/BbX69eg4ENX0xXqr8yE9F/Vk=;
 b=RJqbSsxvV3iPgZzQPhlaY4lJTly7fdpS9r+jP6fiYmp9CPCnazaxgL7YGy0yl1CTvaiIKj
 RggohHKFUucCslptmRDKmdKeRK5QfociNruyyBCyaYkQ/GiIOmLIHAFgLbIOfBhgZ1tpyZ
 QDd18TLUHf0594pp5UrCNJqb+3ZdsOs=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-AyfJH2J1MP2fPxpkV51kMQ-1; Fri, 13 Nov 2020 09:40:43 +0100
X-MC-Unique: AyfJH2J1MP2fPxpkV51kMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0+02mYRYAvuTfN40/170dYwMXSwu8Ov+DtJuZ6VvlyaEiuz4f04zNl3wdji2GSUolEkz0qzT1jW/WNsfSlfvcIx5kSX4p85x9+KeWpI6yFIasihQovG20wKjJ7zWF8tvT97Sx0OEk3DOUAMO3HWsYulTiNsbZAAyItLenwZ4jmF1QIXO9IdtxG8DC9yCCAFqmQIkI1Vw6dWbR27dnfeRUZy7MYmr9ylzfb6JYelAODPxLFQToq0T0DuHDxLp4HUb3dv5unJRhbdfOzpzSB49NIBq9hGRjtBatVeP7KVatcaL1eBPwog0rrPd1PttGywcMWEkC7/3waVHgj/jUXI1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbCI2R6qWss6ClX+4YRFIx93KCp8vbxDvB/g4Cg8Fcs=;
 b=RfKNR3e0FNQDF99rKvkqBIcT6rbY53fjynNQahhkMDqqUzZ+ysBvubtL1Z7WwNVDPXrUvR/xeaQnquF0ZeUdA9KM3tz5HlxLW0W55LJYUZY2Sk+NBlKoD72Y6inFpjd/kqHqCwpIx44EFTLiqV/axwH7/fCgnqI01aH4BLmsay3KDzJYskZ2EpkP3VA7lVCabzikwtfKPnbKu6ElTe5bI8IMajHmZIsupCpAVQInm1UlZMzvw55OgygSs+bzSQ0Fe8bbqKhpG5KA4BYoE3DV9U37BRYcKRm4lp3RAzsrDKL1e/kHCUtIGCiZ1zoHe6hQ39wxkE0VsQXaVHy7ffQkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24) by VI1PR04MB4110.eurprd04.prod.outlook.com
 (2603:10a6:803:42::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 08:40:41 +0000
Received: from VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224]) by VI1PR0402MB3663.eurprd04.prod.outlook.com
 ([fe80::e807:2ec4:9ad1:d224%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 08:40:40 +0000
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 10:40:30 +0200
Message-ID: <20201113084030.19317-1-radoslav.kolev@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [85.196.172.93]
X-ClientProxiedBy: AM0PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:208:be::35) To VI1PR0402MB3663.eurprd04.prod.outlook.com
 (2603:10a6:803:1f::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.cz (85.196.172.93) by
 AM0PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:208:be::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Fri, 13 Nov 2020 08:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d35ccfa5-00cb-46de-4ec8-08d887afcd09
X-MS-TrafficTypeDiagnostic: VI1PR04MB4110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB41100E848C8A149A011E5B1CE0E60@VI1PR04MB4110.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HiPqWs7sWY2kbFk3K5n2lSEv6nfBsVUPSGxhMBp4dL3GqZr5Sc7atTb2vs17bRaMwG1FUtmvri4yUBY97hdb8Biny6YyU/vC8i6fjs3ugWG/cKeDCGUkxpqSW6FxggxgvUjsKbXyNXuL1kziD9qSVhM9LnDcmbd50ZJcAweCi1oCli4Z+q9doB37lIMxLk2S/yBiSViTdGGCIYXKPexmFEggQvU7CM9r4osfBuVjHWwZYhoon1OHkdTKn5tHFxBP5Ju/1Nilojf/Zx7GupmvcjRdtOWZgFCZxP/nySK9lQUlfironKSI4BN7evIssmhgl2pue8u5lh45BjkCymxVOpQFEV4IRjx8PnlaSS/x5w1yJnQMSmtDYwEpddXbkqtIQYEBqADVlRYWHoYgVDRSzON/Vtkou/WrtgjQuKtvSvjDOUq9sxZ+87Uu6UllTVhfbTz8HVFg5fS4/0hbNl9fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3663.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(136003)(396003)(39860400002)(66476007)(2906002)(478600001)(86362001)(6486002)(6512007)(8676002)(956004)(107886003)(966005)(316002)(26005)(2616005)(83380400001)(52116002)(66946007)(8936002)(5660300002)(44832011)(6916009)(6506007)(36756003)(8886007)(66556008)(16526019)(1076003)(186003)(6666004)(4326008)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zK9dxJhZUx7mt/SfMiDzJKvFbvEdKYGb4wiMDBuSArTe40BUe0/sVjmf2PS/5g5OkfENHrBllgqZu4F5iFhhsqKUUgBrqCpjN4HUKm/vW4waTFtYyUQD2ivVVwXKc8NCqaMD2Z9dewcICzyOjPpO/t+9p7aUEJcgR4yXk3qXbC4MEs5LwEEBR7ZdceuJmG7B+vVMviSXHpkhjsNjZ5w4QV4/MIACKzjxv0DifaMRtPbyFyDbG2m7lr/irnNyXP0F6Zry9kChgTAOkFmUh6Itfn810EijH/2iBxYOTnKzdLg9GJ8qdAqoxlTuq2bVjEfMTfrGc70lOZx9pFFNc/oqpHBZQ/z+frYxttblWwgkJ7bXqRFRvO5aaJnNezot9dxl1jAfTma9Hqobg3Md58mGmMm1ezwxiKjKexuL+FhHPQDW80gV201HepitX/wICyi78Z0hgEjcOPVPle5AxhPLlpHX3MZmhUudHea/2JpQcVHws0046egxJWX6LMB5KqHXXRlE4lXVqhdF9Hu8SauKHuLXC595C8elInlBklPTtCXs6Ezg4wgQqLr+7gPFcJUIf0HNuu0cdlj05DDndxF+ka8TtfoCZbs1Njoa10oebvfNTfBi6saXCFa+MspHEYB+Yh4ZFSMjwtFyF9KwZFuing==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35ccfa5-00cb-46de-4ec8-08d887afcd09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3663.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 08:40:40.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+e5AIGlc5qZzkuD/R9YvU59f8a72ioGyqqNLmxMNv93F/cHJjIbQniZMDeDb8hpjmvYXTAnmrbFkb1qRJlUYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4110
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Convert dup03 to new API and clean up
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
From: Radoslav Kolev via ltp <ltp@lists.linux.it>
Reply-To: Radoslav Kolev <radoslav.kolev@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
---
 testcases/kernel/syscalls/dup/dup03.c | 229 ++++++--------------------
 1 file changed, 47 insertions(+), 182 deletions(-)

diff --git a/testcases/kernel/syscalls/dup/dup03.c b/testcases/kernel/syscalls/dup/dup03.c
index e41c9e445..950c390a1 100644
--- a/testcases/kernel/syscalls/dup/dup03.c
+++ b/testcases/kernel/syscalls/dup/dup03.c
@@ -1,212 +1,77 @@
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
 
-	fd = malloc(maxfds * sizeof(int));
+	fd = SAFE_MALLOC(maxfds * sizeof(int));
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
+	for (nfds = 1; nfds < maxfds; nfds++) {
+		fd[nfds] = SAFE_DUP(fd[0]);
+		if (fd[nfds] >= maxfds - 1)
+			break;
+	}
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
