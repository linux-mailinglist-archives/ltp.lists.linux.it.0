Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D83D386A
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 12:13:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03D923C9669
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 12:13:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 22FF03C58B2
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 12:13:42 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4DDF0200FF8
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 12:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627035220; i=@fujitsu.com;
 bh=l9r7cAS0o5JGa6iKSwj6r7QvwGXmpRwQVDGEGWGOe0o=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=pN+7ERp9mpiKWR4LeRrOpasaGhliwNj++189xjYqmq6ooZZhVT/ZlejCunktSfR58
 Xxnp+dT3ICveVyI09Y5cfY2GmueAjqeklyC24Mulu/Y6iH3IOL7SqV11ef1fHK3StH
 nc+umDUuAHMuzlTaMjqrY8zLJRQFKJsRN9OnhhKyoE6Hzp7BvPvbX7u2r3IWwgihoC
 MlSJ3HmNzvbllswSKbUPYiX+yYSaTRVclkCZardu1g0NYczuOnHTUaQi+gGAeQ8iyU
 Hxa5s9K6NQmPPoDFLhHuDtHCQwH2dUmVTRPZ0N+bMbi3wsav4V3njUDmj3MFyWZEsb
 aNVqmb3h+kfMQ==
Received: from [100.112.199.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 07/62-27654-4569AF06;
 Fri, 23 Jul 2021 10:13:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxRTd42q8
 EgynHtC1WfN/B6MDose/3OtYAxijWzLyk/IoE1ozlqyewFcxQrVi9xL2B8bx8FyMXh5BAC5PE
 slcLWCGcPYwS65/MZuti5ORgE9CUeNa5gBnEFhGQkOhoeMsOYjMLqEssn/SLCcQWFrCS+DZhC
 pDNwcEioCrRuz8NJMwr4CFxqPcbWImEgILElIfvmSHighInZz5hgRgjIXHwxQtmiBpFiUsd3x
 gh7AqJGTO2sU1g5J2FpGUWkpYFjEyrGM2TijLTM0pyEzNzdA0NDHQNDY10DS3NdM1M9BKrdJP
 0Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECQyul4IjDDsb7rz/oHWKU5GBSEuVl6v+VIMSX
 lJ9SmZFYnBFfVJqTWnyIUYaDQ0mC99JkoJxgUWp6akVaZg4wzGHSEhw8SiK88VOB0rzFBYm5x
 ZnpEKlTjIpS4rwXpgAlBEASGaV5cG2w2LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3OM
 gUnsy8Erjpr4AWMwEtPtX1E2RxSSJCSqqBiYclJtjMnvnagS+Goc9CO685OgX5lK9aMp2rqIb
 dT/xOAP+Dk2e38CU85da+21G/Krr41oPq18FLVJ4lzj59asKjK/s1dz5eusnQSOvPlyPLfe65
 PFijasOe+udopEViYMQ27VUNguxfnnC9UtMomyN3oWmqNPOZXyGd7TOaTncI3nSuf/7/XNDVp
 1flBGtXXLi9r7bw4ZETXy+nx07inz33+pMFHrstM1zfhVgtf99fICO3LPziiudHXvrpmjDa1M
 W+tFkVwP9l/t6tPLn7bsxLiBasfJ+ndvle15uV8kIv70u7xHal9fQ9vKJbzfT6sGeN9Xufeaz
 HHLoDu32Wr31VtuD45td2yxojrvsq8yixFGckGmoxFxUnAgAsf6IEKAMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-3.tower-291.messagelabs.com!1627035219!140083!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30506 invoked from network); 23 Jul 2021 10:13:39 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-3.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 10:13:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16NADZTX032141
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:13:39 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 11:13:32 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Jul 2021 18:13:46 +0800
Message-ID: <1627035226-2220-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msgget*: Add docparse formatting
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

Additionally, for msgget04.c and msgget05.c, do some adjustements in description.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../kernel/syscalls/ipc/msgget/msgget01.c      |  7 ++++---
 .../kernel/syscalls/ipc/msgget/msgget02.c      |  7 +++++--
 .../kernel/syscalls/ipc/msgget/msgget03.c      |  9 +++++----
 .../kernel/syscalls/ipc/msgget/msgget04.c      | 18 +++++++++++-------
 .../kernel/syscalls/ipc/msgget/msgget05.c      | 14 ++++++++------
 5 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget01.c b/testcases/kernel/syscalls/ipc/msgget/msgget01.c
index 5b7c6e3af..2ab34ff9d 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget01.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget01.c
@@ -3,9 +3,10 @@
  * Copyright (c) International Business Machines Corp., 2001
  */
 
-/*
- * DESCRIPTION
- * create a message queue, write a message to it and
+/*\
+ * [Description]
+ *
+ * Create a message queue, write a message to it and
  * read it back.
  */
 
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget02.c b/testcases/kernel/syscalls/ipc/msgget/msgget02.c
index efd2636ca..ce59a8fb5 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget02.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget02.c
@@ -3,8 +3,11 @@
  * Copyright (c) International Business Machines Corp., 2001
  */
 
-/*
- * DESCRIPTION
+/*\
+ * [Description]
+ *
+ * Test for EEXIST, ENOENT, EACCES errors.
+ *
  * 1) msgget(2) fails if a message queue exists for key and msgflg
  *    specified both IPC_CREAT and IPC_EXCL.
  * 2) msgget(2) fails if no message queue exists for key and msgflg
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 76cf82cd3..ab5714cdc 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -3,11 +3,12 @@
  * Copyright (c) International Business Machines Corp., 2001
  */
 
-/*
- * DESCRIPTION
- * test for an ENOSPC error by using up all available
- * message queues.
+/*\
+ * [Description]
+ *
+ * Test for ENOSPC error.
  *
+ * ENOSPC -  All possible message queues have been taken (MSGMNI)
  */
 
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget04.c b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
index 72cd4497b..a01ecea85 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget04.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
@@ -1,14 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
- * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
  *
- * It is a basic test about msg_next_id.
- * msg_next_id specifies desired id for next allocated IPC message. By default
- * they are equal to -1, which means generic allocation logic. Possible values
- * to set are in range {0..INT_MAX}.
- * Toggle with non-default value will be set back to -1 by kernel after
- * successful IPC object allocation.
+ * It is a basic test for msg_next_id.
+ * msg_next_id specifies desired id for next allocated IPC message. By
+ * default it's equal to -1, which means generic allocation logic.
+ * Possible values to set are in range {0..INT_MAX}.
+ * The value will be set back to -1 by kernel after successful IPC object
+ * allocation.
  */
 
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget05.c b/testcases/kernel/syscalls/ipc/msgget/msgget05.c
index d6177bbed..817c8486e 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget05.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget05.c
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
- * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
  *
- * It is a basic test about msg_next_id.
- * When the message queue identifier that msg_next_id stored has existed,
+ * It is a basic test for msg_next_id.
+ * When the message queue identifier that msg_next_id stored is already in use,
  * call msgget with different key just use another unused value in range
- * [0,INT_MAX]. kernel doesn't guarantee the desired id.
+ * [0,INT_MAX]. Kernel doesn't guarantee the desired id.
  */
 
 #include <errno.h>
@@ -45,8 +49,6 @@ static void setup(void)
 	pid = getpid();
 	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
 	queue_id[0] = SAFE_MSGGET(msgkey[0], IPC_CREAT | MSG_RW);
-	tst_res(TINFO, "Test msg_next_id effects on msgget(different key) "
-		"when this message queue identifier has existed");
 }
 
 static void cleanup(void)
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
