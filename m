Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483937B8A2
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F399F3C8A89
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2C293C8A8B
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:15 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 359FA1000F20
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620809535; i=@fujitsu.com;
 bh=/hWKBVlxo7L27zvEDzSqkISxPgjNrHQHx3jub3G1IxE=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=AMGJNuA/c2ZSVR/28nkJGVnTC9TqRdxOIsql+8xosfacIEY9YcYLO3B8aKZtQIlvR
 PxwbcaN9V1TJzaaQ2R2Ltn4B4t2ZDR56GgWIEewSQHDymqdRaT/mh2KwCtLrCgRugK
 bZ+5rVJZ4Gav3vKC+DDnrr0hQGTcvnUl2Ysx2SbVWpUnwK7z0D7iqHcpqIsqA573kL
 GKXxpJhd3podmxAgHsMvi7rNX1D1sM9wXhaLs/nlLCas6yBZrgOvUC+RMUzSX0PTPg
 lVh7mD77kWna3VLa+DbG69V4g3dnVa3B9EcP4EeqXAK/m3xEnuu+sblTKEZjLPo7ol
 MRNCSghhGiSxw==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 01/5D-38619-F379B906;
 Wed, 12 May 2021 08:52:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxVddu+uw
 Eg893dC1WfN/B6MDose/3OtYAxijWzLyk/IoE1ox3Uy4yFWySrXi6ahlTA+MfiS5GLg4hgRYm
 iVO/G9ghnN2MEh8PPGTuYuTkYBPQlHjWuQDMFhGQkOhoeMsOYjMLqEssn/SLqYuRg0NYIEri2
 ed0kDCLgKrEpxffGEFsXgEPiS+XD4KVSwgoSEx5+B5sDKeAp8SRB/MYQVqFgGq27ueGKBeUOD
 nzCQvEdAmJgy9eMEO0Kkpc6oAYKSFQITFjxja2CYz8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6
 uoYGBrqGhsa4ZkKWXWKWbpJdaqpucmldSlAiU1EssL9YrrsxNzknRy0st2cQIDMaUQjauHYxP
 X3/QO8QoycGkJMp70nN2ghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3rKpQDnBotT01Iq0zBxgZ
 MCkJTh4lER4G6YBpXmLCxJzizPTIVKnGHU5Ns9duohZiCUvPy9VSpz3JsgMAZCijNI8uBGwKL
 3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXGWQVT2ZeCdymV0BHMAEdcWP6LJAjShIRUlI
 NTPNfWaT8ZxOvfvuvaFPjyY/MHpknXJ6ZxizaU9T1/eGm5RqyH3Ne3UlcPjWiO21S4zseV8ZX
 ic9+/ZnjYhsmtsu6fIbMK4NpehkPuwJjN2XO5D4xTf3/q9sKGq4XtDoZJl7S3vhyIuPsqb3qX
 Mfl3Y+UZt+WWS0g8f0aN0/M3vV5TvkTvT0lmSt/7WWalX86pXNarUX590altue39pj5Vc049G
 EBp4BE1+Mfb+KOl5RMOSh/KmS1QGJ4rPeEOwlqsR1XzPx7nJ8syTc+EsrRcFrk1rEvngFTI2z
 8FmsX/YgxSWSrZV/T+UFPREqN229fuGhQywKbo07LS2/PFrF/fuOVqHtgptP2lNs7ChweKrEU
 ZyQaajEXFScCACtmJ85NAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-245.messagelabs.com!1620809534!89571!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32680 invoked from network); 12 May 2021 08:52:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-4.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2021 08:52:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14C8qBlR028217
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 12 May 2021 09:52:14 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 12 May 2021 09:52:12 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 May 2021 16:52:21 +0800
Message-ID: <1620809541-6891-4-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 4/4] syscalls/shmget06: Add test when the id of
 shm_next_id has existed
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

When the identifier of the System V shared memory segment that shm_next_id has
existed, shmget() with different key will return the another shm id. But kernel
doesn't guarantee desired id, I just compare with existed id, if not equal, the
test succeeded.

This case is similar to msgget05.c.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmget/shmget06.c     | 77 +++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 63d821e53..3a1731685 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1403,6 +1403,7 @@ shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
 shmget05 shmget05
+shmget06 shmget06
 
 sigaction01 sigaction01
 sigaction02 sigaction02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index ff0364704..b758158c3 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -68,3 +68,4 @@ shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
 shmget05 shmget05
+shmget06 shmget06
diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
index 6f08529f8..768d1c69d 100644
--- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
@@ -2,3 +2,4 @@
 /shmget03
 /shmget04
 /shmget05
+/shmget06
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget06.c b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
new file mode 100644
index 000000000..3138d4482
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * It is a basic test about shm_next_id.
+ *
+ * When the shared memory segment identifier that shm_next_id stored has
+ * existed, call shmget with different key just use another unused value in range
+ * [0,INT_MAX]. kernel doesn't guarantee the desired id.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/shm.h>
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+
+#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
+
+static int shm_id[2], pid;
+static key_t shmkey[2];
+
+static void verify_shmget(void)
+{
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", shm_id[0]);
+
+	shm_id[1] = SAFE_SHMGET(shmkey[1], SHM_SIZE, IPC_CREAT | SHM_RW);
+	if (shm_id[1] == shm_id[0])
+		tst_res(TFAIL, "shm id %d has existed, shmget() returns the"
+			" same shm id unexpectedly", shm_id[0]);
+	else
+		tst_res(TPASS, "shm id %d has existed, shmget() returns the"
+			" new shm id %d", shm_id[0], shm_id[1]);
+
+	SAFE_SHMCTL(shm_id[1], IPC_RMID, NULL);
+}
+
+static void setup(void)
+{
+	shmkey[0] = GETIPCKEY();
+	shmkey[1] = GETIPCKEY();
+	pid = getpid();
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
+	shm_id[0] = SAFE_SHMGET(shmkey[0], SHM_SIZE, IPC_CREAT | SHM_RW);
+	tst_res(TINFO, "Test shm_next_id effects on shmget(different key) "
+		"when this identifier of shared memory segment has existed");
+}
+
+static void cleanup(void)
+{
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (shm_id[i] != -1)
+			SAFE_SHMCTL(shm_id[i], IPC_RMID, NULL);
+	}
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_shmget,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_CHECKPOINT_RESTORE=y",
+		NULL
+	},
+	.needs_root = 1,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
