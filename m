Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F563B6C19
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 03:40:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 466143C6E8C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 03:40:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A9143C1A4B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:40:27 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 709921A00A56
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 03:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624930825; i=@fujitsu.com;
 bh=c842CsMxuleaZHC/txYlOcyAp+nHtAC85ErLdgik/+Y=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=soQCaIZxrtiQE/jBBdJHDL8kOgJnHfmltEj9qrvHeR+nz3VTYOJ+i7uXNDuDZkSz7
 Hy4WqlvmB+lyWIj93MFW67mJuONOCrPOfHyKghGx1ORnNNXKTKvvFlgubpehbP5d+n
 xzqRPfyoIrDrRHh2qPDcjhc9z3ubroPsUYwvvyt3UT7q3voWU7riIXQFF3rDvIGNsS
 enrKT5sMa3aLVF3vXnDia96DUly7qLtjgQFNdn2lF1t/1Cld1KxfR3PLwknJUSXGIZ
 SeiWEyjENCffHVltesj33TVY2aIARvhx08odK508z9jmMiB8cHxT4QWnqHRt7EMaXw
 w5twY/Dga5GuQ==
Received: from [100.112.195.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 77/E2-45811-90A7AD06;
 Tue, 29 Jun 2021 01:40:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxRZej6la
 CwZel2hab96xjsVjxfQejA5PHvt/rWD3e77vKFsAUxZqZl5RfkcCa0fHhLlPBN8GK7bv3sjcw
 NvB3MXJxCAm8ZpSY/+QLI4Szh1Giu201SxcjJwebgKbEs84FzF2MHBwiAuISE+cngISZBWwln
 j+8xAZiCwukSHy5eocVxGYRUJXovf+NEcTmFfCU2NbUClYjIaAgMeXhe7AxnAKBEg8uW4CYQg
 IBEkuP6EFUC0qcnPmEBWK6hMTBFy+YIToVJS51QEyUEKiQmDFjG9sERv5ZSFpmIWlZwMi0itE
 8qSgzPaMkNzEzR9fQwEDX0NBI19DSSNfERC+xSjdRL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1
 ZBMjMDhTCg7o7GD8+eqD3iFGSQ4mJVHem3m3EoT4kvJTKjMSizPii0pzUosPMcpwcChJ8E6tA
 MoJFqWmp1akZeYAIwUmLcHBoyTC+70cKM1bXJCYW5yZDpE6xWjJsfPovEXMHE0flgDJzXOXLm
 IWYsnLz0uVEueNAZknANKQUZoHNw4WzZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMqVwJ
 N4cnMK4Hb+groICaggxY9uQlyUEkiQkqqgSkn9Ambmu/5NwU/e5Y26d61vsmvq/ooo/cew3yF
 xyqLZMyS5cyU9ud/SeVo/39mSvT+q6e6VD7ODN/233PVvfrdX6eeetXSnsFVqTYhU8vOYKrgF
 5GOVdskE5weZmlf2B/Vo6W5fWfFObesiBeKxW8ncKz2s6509Ug5pa/8LHTl64UmTms6Rcqv+g
 ZUntnlt/55pXS+hua/XSvY+FTqDj2K31ClonCztIJl8eO9if8nLBTe+Ehx8h3R4P/haypVDcQ
 FF24KKfj6afMTq77M0C+yNsIrjrGmvqqzVhaPT99ft6X7SfHyW08bww/V1OoEcbe5q3Swfti6
 cMWELd9DllavXvPU8m/b1C3e0tXsV5VYijMSDbWYi4oTAbWgTfZhAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-267.messagelabs.com!1624930824!70428!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14873 invoked from network); 29 Jun 2021 01:40:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-4.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 01:40:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15T1eHtA019527
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 29 Jun 2021 02:40:24 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 02:40:14 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <liwang@redhat.com>
Date: Tue, 29 Jun 2021 09:40:18 +0800
Message-ID: <1624930818-31474-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
References: <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] ipc/msgget03: Make sure we get ENOSPC error after
 creating MSGMNI message queues
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Even msgget() failed, this for loop in setup phase still continues. So we can't know
whether system creates actual MSGMNI message queues and then fail with ENOSPC. Fix this by
reporting fail if msgget failed in setup.

Also make use of TST_EXP_FAIL2 macro. It has been introduced in the previous commit
95f518efe ("include/tst_test_macro.h: Add TST_EXP_FAIL2 macros").

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
v1->v2: Remove check for -1 and pre-initialize the array
 .../kernel/syscalls/ipc/msgget/msgget03.c     | 27 ++++++-------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 8fa620855..76cf82cd3 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -20,22 +20,14 @@
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
 
-static int maxmsgs;
+static int maxmsgs, queue_cnt;
 static int *queues;
 static key_t msgkey;
 
 static void verify_msgget(void)
 {
-	TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL));
-	if (TST_RET != -1)
-		tst_res(TFAIL, "msgget() succeeded unexpectedly");
-
-	if (TST_ERR == ENOSPC) {
-		tst_res(TPASS | TTERRNO, "msgget() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
-			" expected ENOSPC");
-	}
+	TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
+		"msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
 }
 
 static void setup(void)
@@ -49,11 +41,10 @@ static void setup(void)
 	queues = SAFE_MALLOC(maxmsgs * sizeof(int));
 
 	for (num = 0; num < maxmsgs; num++) {
-		queues[num] = -1;
-
 		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
-		if (res != -1)
-			queues[num] = res;
+		if (res == -1)
+			tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
+		queues[queue_cnt++] = res;
 	}
 
 	tst_res(TINFO, "The maximum number of message queues (%d) reached",
@@ -67,10 +58,8 @@ static void cleanup(void)
 	if (!queues)
 		return;
 
-	for (num = 0; num < maxmsgs; num++) {
-		if (queues[num] != -1)
-			SAFE_MSGCTL(queues[num], IPC_RMID, NULL);
-	}
+	for (num = 0; num < queue_cnt; num++)
+		SAFE_MSGCTL(queues[num], IPC_RMID, NULL);
 
 	free(queues);
 }
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
