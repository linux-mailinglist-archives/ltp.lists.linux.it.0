Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E073D37D5
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:42:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61D393C6956
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:42:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C41F3C58F0
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:42:11 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7B56B6234A7
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627033329; i=@fujitsu.com;
 bh=pHetDQoKxrLlTDWjZEitnNCV4B8y8rjgSieCeKw8Ekc=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=e3FlkS3Z/yybUv+wGkpthgpIBopl58fqWIr8LN0XSeNMW1hVwKIHDJC+zF6XHjTo4
 uC/bpn1z9kzfq+kHHX7PPu8c6ralEqOOy2IQcXalHAn5kOQ7YcuHEB/DdWA5HPuyAN
 q7Pth4Pg6XwfRrplzwFzzO4+InJIKcU8WyRcIqjiB68mJ5GEywYGdeAVuQjPvKlFZ2
 v6nngCn8KUHpKsV/lOHAYiIca/QSy1L1mLqQ6g8jETPUlpUNb2T7AjP2FFzO5YL0+o
 OrP0Bpsi2drADtREXW/Q3MuSZhCHNqYHWq+MzrITbyi4DetkxXuogOiq0QXJAJ99N5
 tnFCFruq7On4A==
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 2A/44-07211-1FE8AF06;
 Fri, 23 Jul 2021 09:42:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MRqvux71e
 CwbJrjBbTXxxls1jxfQejA5PHvt/rWD3OLDjCHsAUxZqZl5RfkcCaseDfUtaCOZIVf/43MDUw
 HhDtYuTiEBJ4zSjxoukJO4Szh1Fi37x1LF2MnBxsApoSzzoXMIPYIgKiEp+nnwOzmQVsJZ4/v
 MQGYgsLhEhcX9rBDmKzCKhK3Lh4mhHE5hXwkDi/bxpYXEJAQWLKw/dgvZwCKhLXv35jBbGFBJ
 Ql3szbzA5RLyhxcuYTFoj5EhIHX7xghuhVlLjU8Y0Rwq6QmDFjG9sERv5ZSFpmIWlZwMi0itE
 yqSgzPaMkNzEzR9fQwEDX0NBY10DXyNRIL7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeX
 WrKJERimKYUMf3Ywrn7zQe8QoyQHk5Ior7j5rwQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErybg
 IEvJFiUmp5akZaZA4wZmLQEB4+SCK8SSJq3uCAxtzgzHSJ1ilGXY/PcpYuYhVjy8vNSpcR5p/
 cCFQmAFGWU5sGNgMXvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGYgq3gy80rgNr0COoI
 J6IhTXT9BjihJREhJNTBpNIe7fv5z6ZDMWX/3G56Pra0dH+5wKg66oi3NoJPdtTG4JOXeNF9t
 069zGThV+Tivae1Z3XFhz8nXAv4GKxcu/sd8LZxzr5/kw0xTzq9et1MruBm2RE4uX2xnOqngS
 lD9k/wvcwUV62d877vhHb//4I3gb5MiVLPtXaflX9K4oLl90dqajeLtcTKl232d3xo/yp5wwP
 qn1c/Deq7bmWtTClrlfhaXmZ48tc7CW3TP8cLbqywt1NI+HXZ1vKMs9+OE/hHuLxH9R/Qf6SS
 7HT7zh5H3kUv2tyDPOh4Vnf9TFAK72uez8udUzHq3sjfpyOHWxAcHXTrn7Atz/cbiNFNgl+cD
 2YCEDK+Jvye6VCuxFGckGmoxFxUnAgAWJgFVWgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-21.tower-232.messagelabs.com!1627033328!241609!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26632 invoked from network); 23 Jul 2021 09:42:08 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-21.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 09:42:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N9fvZM022062
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 23 Jul 2021 10:42:03 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 10:41:55 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 23 Jul 2021 17:41:59 +0800
Message-ID: <1627033320-1584-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YPlftOtF7QxjjDnX@yuki>
References: <YPlftOtF7QxjjDnX@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/shmget05: Add test for
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This case is similar to msgget04.c.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |  1 +
 runtest/syscalls-ipc                          |  1 +
 .../kernel/syscalls/ipc/shmget/.gitignore     |  1 +
 .../kernel/syscalls/ipc/shmget/shmget05.c     | 69 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ipc/shmget/shmget05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 1deb6118f..b65b18c32 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1412,6 +1412,7 @@ shmdt02 shmdt02
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
index 000000000..42a115474
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
+ * It is a basic test for shm_next_id.
+ *
+ * shm_next_id specifies desired id for next allocated IPC shared memory. By
+ * default it's equal to -1, which means generic allocation logic.
+ * Possible values to set are in range {0..INT_MAX}.
+ * The value will be set back to -1 by kernel after successful IPC object
+ * allocation.
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
