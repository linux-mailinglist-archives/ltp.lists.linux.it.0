Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E63346091
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:57:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C2653C71EA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 14:57:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 686613C54D7
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:57:53 +0100 (CET)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F0D1F2000BE
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:57:51 +0100 (CET)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F4Xvw4Jrvzkdpg
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 21:56:12 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 21:57:41 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Mar 2021 21:57:30 +0800
Message-ID: <20210323135730.24806-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/setns: Replace libc function with safe_macros
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

For those:
	testcases/kernel/syscalls/setns/setns.h
	testcases/kernel/syscalls/setns/setns02.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/setns/setns.h   | 6 ++----
 testcases/kernel/syscalls/setns/setns02.c | 6 +++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/setns/setns.h b/testcases/kernel/syscalls/setns/setns.h
index c2097f2e5..f46a55a7b 100644
--- a/testcases/kernel/syscalls/setns/setns.h
+++ b/testcases/kernel/syscalls/setns/setns.h
@@ -19,9 +19,7 @@ static int get_ns_fd(int pid, const char *ns)

 	sprintf(tmp, "/proc/%d/ns/%s", pid, ns);
 	if (stat(tmp, &st) == 0) {
-		fd = open(tmp, O_RDONLY);
-		if (fd == -1)
-			tst_brk(TBROK|TERRNO, "failed to open %s", tmp);
+		SAFE_OPEN(tmp, O_RDONLY);
 	} else {
 		if (errno != ENOENT)
 			tst_brk(TBROK|TERRNO, "failed to stat %s", tmp);
@@ -58,5 +56,5 @@ static void close_ns_fds(void)

 	for (i = 0; i < ns_total; i++)
 		if (ns_fds[i] != -1)
-			close(ns_fds[i]);
+			SAFE_CLOSE(ns_fds[i]);
 }
diff --git a/testcases/kernel/syscalls/setns/setns02.c b/testcases/kernel/syscalls/setns/setns02.c
index 0e20c52e4..db442541b 100644
--- a/testcases/kernel/syscalls/setns/setns02.c
+++ b/testcases/kernel/syscalls/setns/setns02.c
@@ -168,11 +168,11 @@ static void setup(void)
 static void cleanup(void)
 {
 	if (ns_ipc_fd != -1)
-		close(ns_ipc_fd);
+		SAFE_CLOSE(ns_ipc_fd);
 	if (ns_uts_fd != -1)
-		close(ns_uts_fd);
+		SAFE_CLOSE(ns_uts_fd);

-	shmctl(shmid, IPC_RMID, NULL);
+	SAFE_SHMCTL(shmid, IPC_RMID, NULL);
 }

 static struct tst_test test = {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
