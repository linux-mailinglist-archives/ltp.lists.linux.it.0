Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039F37B8A5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC7993C8A8D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:52:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 67AC63C8A8F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:16 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 946521A0112F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620809534; i=@fujitsu.com;
 bh=wAxndSMCgK+Pq3mey2PyR6ffH46bAcS55pLTz0e0VC8=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=yNzjjiN9Ry2RNkgmsuBJNYKdlOP4LmbWgjtzw6Ecsq3kD8Frx1EWC6w7oc1bIznDN
 qMn50HCzRHKEhPJI6t8cxDmFBfxHCTA7Kh1V6f0k5Cn/5MKB1OE6C9GA2B5bkRQh4k
 weyRA23HtCD0kpqviVHV5WjMcFOlrhwUHn+x8/jeNWC0wU7uljB8oViURqBs9X7Sh0
 riiKG8sSpUu4F2K6u13RfZ2VEkzU0NoW6vWabQD6FjZSa7lWwAc8UjVjbR9EMvKkbx
 hFX1sqHoBUmvjGVd0Y9sNb/qtfmLqdDTWQxQyKHir/DGXUHu8crzLswe6+DOn7mSoY
 udMJwj9W4Vybg==
Received: from [100.112.192.143] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 65/45-45475-E379B906;
 Wed, 12 May 2021 08:52:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxVddu+uw
 Eg1t3JC1WfN/B6MDose/3OtYAxijWzLyk/IoE1oz2xn2sBV2SFXs7JrE0MK4X7WLk4hASaGGS
 WLp/EQuEs5tR4s7rRtYuRk4ONgFNiWedC5hBbBEBCYmOhrfsIDazgLrE8km/mEBsYYEQieZND
 xhBbBYBVYmpS9aD1fAKeEgsvDiLBcSWEFCQmPLwPdgcTgFPiSMP5gHVcwAt85DYup8bolxQ4u
 TMJywQ4yUkDr54wQzRqihxqeMbI4RdITFjxja2CYz8s5C0zELSsoCRaRWjeVJRZnpGSW5iZo6
 uoYGBrqGhka6hpamuiZleYpVuol5qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmAwphQc1tvB
 OOHNB71DjJIcTEqivCc9ZycI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAtmwqUEyxKTU+tSMvMA
 UYGTFqCg0dJhPfmZKA0b3FBYm5xZjpE6hSjLsfmuUsXMQux5OXnpUqJ894EmSEAUpRRmgc3Ah
 allxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ836aAjSFJzOvBG7TK6AjmICOuDF9FsgRJYk
 IKakGJqe3ny+YZV7QqD+iuXSq2z5pyStizt6Lm7+4PZC0aImZHxeubPfwVX+7z/LFyuX5n8xT
 CyWuidZKWeUIb+xT8lQ1EhDsMUn+7N6holj/ZeKVqYp7O1MO8J4/1TH7u5pS38FbaX5dYTEze
 pc+3JoiGnNb5d3MJc9vLZ7Quy/xFH/X+/wbnayPxAoeHbNNclBzndP5/kWgkGeYXeLZJvf2sK
 XTXKosO5+kbHcO2iiRGX5X32TJpN1zOroCLB4/O7OwdnOGloG3jYnc8t/eSuw3xdP2uKZ9rRH
 byvtsJqNQwPTLidmuvwVVu3TTeV8LPJBYnMGV7dmzLW+F4tOpARN9dF7k3FjXKPDgfczn1pdK
 LMUZiYZazEXFiQA2hXdTTQMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-8.tower-265.messagelabs.com!1620809534!3826!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28594 invoked from network); 12 May 2021 08:52:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-8.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2021 08:52:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14C8qBlQ028217
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 12 May 2021 09:52:13 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 12 May 2021 09:52:09 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 May 2021 16:52:20 +0800
Message-ID: <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
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
Subject: [LTP] [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
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

This case is similar to msgget04.c.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmget/shmget05.c     | 69 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 2dff25984..63d821e53 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1402,6 +1402,7 @@ shmdt02 shmdt02
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
+shmget05 shmget05
 
 sigaction01 sigaction01
 sigaction02 sigaction02
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index b3bd37923..ff0364704 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -67,3 +67,4 @@ shmdt02 shmdt02
 shmget02 shmget02
 shmget03 shmget03
 shmget04 shmget04
+shmget05 shmget05
diff --git a/testcases/kernel/syscalls/ipc/shmget/.gitignore b/testcases/kernel/syscalls/ipc/shmget/.gitignore
index c57df68f5..6f08529f8 100644
--- a/testcases/kernel/syscalls/ipc/shmget/.gitignore
+++ b/testcases/kernel/syscalls/ipc/shmget/.gitignore
@@ -1,3 +1,4 @@
 /shmget02
 /shmget03
 /shmget04
+/shmget05
diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
new file mode 100644
index 000000000..601609648
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
@@ -0,0 +1,69 @@
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
+ * shm_next_id specifies desired id for next allocated IPC shared memory. By
+ * default they are equal to -1, which means generic allocation logic.
+ * Possible values to set are in range {0..INT_MAX}.
+ * Toggle with non-default value will be set back to -1 by kernel after
+ * successful IPC object allocation.
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
+static int shm_id, pid;
+static key_t shmkey;
+
+static void verify_shmget(void)
+{
+	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
+
+	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, SHM_RW | IPC_CREAT);
+	if (shm_id == pid)
+		tst_res(TPASS, "shm_next_id succeeded, shm id %d", pid);
+	else
+		tst_res(TFAIL, "shm_next_id failed, expected id %d, but got %d", pid, shm_id);
+
+	TST_ASSERT_INT(NEXT_ID_PATH, -1);
+	SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
+	pid++;
+}
+
+static void setup(void)
+{
+	shmkey = GETIPCKEY();
+	pid = getpid();
+}
+
+static void cleanup(void)
+{
+	if (shm_id != -1)
+		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
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
