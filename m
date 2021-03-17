Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA7233EA82
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 08:27:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 012D23C6058
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 08:27:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3527A3C2D06
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 08:27:22 +0100 (CET)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D4563140110C
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 08:27:19 +0100 (CET)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F0hWl4dxfz8ydC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 15:25:23 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 15:27:07 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 17 Mar 2021 15:26:52 +0800
Message-ID: <20210317072652.26974-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/chdir01: Add umask before mkdir
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

When uid is nobody, umask is not 022, the test process might
has not permmission to access the file which created by SAFE_MKDIR
with mode 0755.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/chdir/chdir01.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/syscalls/chdir/chdir01.c b/testcases/kernel/syscalls/chdir/chdir01.c
index 60165a6cb..a378b260c 100644
--- a/testcases/kernel/syscalls/chdir/chdir01.c
+++ b/testcases/kernel/syscalls/chdir/chdir01.c
@@ -13,6 +13,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/types.h>
+#include <sys/stat.h>
 #include <unistd.h>
 #include <pwd.h>

@@ -55,6 +56,14 @@ static void setup(void)
 	sprintf(workdir, "%s/%s", cwd, MNTPOINT);
 	free(cwd);
 	SAFE_CHDIR(workdir);
+
+	/*
+	 * When uid is nobody, umask is not 022, the test process might
+	 * has not permmission to access the file which created by SAFE_MKDIR
+	 * with mode 0755.
+	 */
+	umask(022);
+
 	SAFE_MKDIR(DIR_NAME, 0755);
 	SAFE_MKDIR(BLOCKED_NAME, 0644);

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
