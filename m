Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7C3D37D7
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:42:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D6AB3C6908
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:42:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1B6F03C9507
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:42:15 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 405EE601064
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627033334; i=@fujitsu.com;
 bh=RjKHkD5aI/JPPkeE6MUTCTDgkOU4VdGdS7JWv9Uj1KA=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=WHtjZIZolK+zcKIWHN0i+lEklkn+xEdbUYPuwlEWAS36kDWKC56VT8umsDK7JHq3w
 yaWdeD6zDo1b0Uf5b5d/BUqZUsIMRcBGUp3QO7l6FQpyU95Aw4O0LYrk2EiFGR5l+G
 qRatnAzULyjMImDutupqgQwq7BF35IveXUbe9sEZjk6GBfV60UcpPD7azDZaV5BQcl
 ocrA8LeVKAqy6ZSOkThBo3rgJfagEVfwA2d7B8t8tyeUO1X7xJw585FRbvWtPHmPlp
 78+iabbFWMBcAXcX//T1h7YGwhIVReFrIYUZKhHd6FFNKCsP33YJXLC/8/AkJGIxGS
 N7V3c95rUWJfg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 25/FA-07223-6FE8AF06;
 Fri, 23 Jul 2021 09:42:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxRfdr368
 Eg5vHLCymvzjKZrHi+w5GByaPfb/XsXqcWXCEPYApijUzLym/IoE1Y8PxG2wFr2Uqns/fy9rA
 uF+ii5GLQ0jgNaPEtitLWCGcPYwSi2e0MHYxcnKwCWhKPOtcwAxiiwiISnyefg7MZhawlXj+8
 BIbiC0sECYx+W0nWJxFQFVi4/c2dhCbV8BD4mT7FiYQW0JAQWLKw/dANRwcnAKeEg1vckHCQg
 KJEsv7lkCVC0qcnPmEBWK8hMTBFy+YIVoVJS51fGOEsCskZszYxjaBkX8WkpZZSFoWMDKtYrR
 MKspMzyjJTczM0TU0MNA1NDTWNdQ1MjbTS6zSTdRLLdVNTs0rKUoEyuollhfrFVfmJuek6OWl
 lmxiBAZpSiHjmx2MX19/0DvEKMnBpCTKK27+K0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO8mY
 NgLCRalpqdWpGXmACMGJi3BwaMkwqsEkuYtLkjMLc5Mh0idYtTl2Dx36SJmIZa8/LxUKXHe6b
 1ARQIgRRmleXAjYNF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw78ceoCk8mXklcJteAR3
 BBHTEqa6fIEeUJCKkpBqYwu+dVQh4cGsPt8BLgXjXuv/TvCRDA1+WLJm33G+NmaC03E1Dpi8c
 rJf79knGLtvk15y+tC/onfHc7dNKOE5PiVNfeDL867OGd7fuyFZPWPq8wCViqeWfovK3rZ9NX
 9wWWuV8wHjB7+bjmqU162ddvJXfZeG412TKhqcN6veY/+q3l6fd+dodrsPvdDC2auF9qa+1TU
 dWpC8/HLJn9QXzW6UxXzqS+5gZrn6pE5FOmKXsXqx2xoxLTOLdrO79jD8NyyU72i0CfDLz/Od
 7sb6N4JVZ6+ileYr9uu82g6S/90OqW1mNpVXEzxW+6SwVlSvetvDJm9LeF6qv11an8j/Jct36
 veLN5PDwKHnVOe+VWIozEg21mIuKEwGgrrvyWQMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-14.tower-226.messagelabs.com!1627033333!71225!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22436 invoked from network); 23 Jul 2021 09:42:13 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-14.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 09:42:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N9g84S011735
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 23 Jul 2021 10:42:08 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 10:42:03 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 23 Jul 2021 17:42:00 +0800
Message-ID: <1627033320-1584-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627033320-1584-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <YPlftOtF7QxjjDnX@yuki>
 <1627033320-1584-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/shmget06: Add test when shm_next_id
 is already in use
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

When the identifier of the System V shared memory segment that shm_next_id stored
is already in use, shmget() with different key will return the another shm id. But
kernel doesn't guarantee desired id, I just compare with the existed id, if not
equal, the test succeeds.

This case is similar to msgget05.c.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmget/shmget06.c     | 75 +++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index b65b18c32..b379b2d90 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1413,6 +1413,7 @@ shmget02 shmget02
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
index 000000000..d91b7b635
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * It is a basic test for shm_next_id.
+ *
+ * When the shared memory segment identifier that shm_next_id stored is already
+ * in use, call shmget with different key just use another unused value in range
+ * [0,INT_MAX]. Kernel doesn't guarantee the desired id.
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
