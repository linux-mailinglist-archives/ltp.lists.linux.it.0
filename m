Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC53A0FD0
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 11:48:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242143C5531
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 11:48:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 741233C29E8
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 11:48:52 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A0DA6007BB
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 11:48:50 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G0Mg82zVgzZdrZ
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 17:45:56 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 17:48:46 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 17:48:46 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 9 Jun 2021 17:49:24 +0800
Message-ID: <20210609094924.145262-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609094924.145262-1-xieziyao@huawei.com>
References: <20210609094924.145262-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/chown: format output and delete
 duplicate header files
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

1. Print values not variable names in the TST_EXP_PASS().
2. Delete duplicate header files.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/chown/chown01.c |  8 +-------
 testcases/kernel/syscalls/chown/chown02.c |  9 +++------
 testcases/kernel/syscalls/chown/chown03.c |  9 ---------
 testcases/kernel/syscalls/chown/chown04.c | 20 +++++++++++---------
 4 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown01.c b/testcases/kernel/syscalls/chown/chown01.c
index 767a2ad5c..7fbb116bd 100644
--- a/testcases/kernel/syscalls/chown/chown01.c
+++ b/testcases/kernel/syscalls/chown/chown01.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  * AUTHOR: William Roske
  * CO-PILOT: Dave Fenner
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 /*\
@@ -11,13 +12,6 @@
  * Basic test for chown(). Calls chown() on a file and expects it to pass.
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-
 #include "tst_test.h"
 #include "compat_tst_16.h"

diff --git a/testcases/kernel/syscalls/chown/chown02.c b/testcases/kernel/syscalls/chown/chown02.c
index a92a1fd2d..7c96832a4 100644
--- a/testcases/kernel/syscalls/chown/chown02.c
+++ b/testcases/kernel/syscalls/chown/chown02.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  * 07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

 /*\
@@ -12,11 +13,6 @@
  *  - preserves setgid bit set on a non-group-executable file
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-
 #include "tst_test.h"
 #include "compat_tst_16.h"
 #include "tst_safe_macros.h"
@@ -46,7 +42,8 @@ static void run(unsigned int i)

 	SAFE_CHMOD(tc[i].filename, tc[i].set_mode);

-	TST_EXP_PASS(CHOWN(tc[i].filename, uid, gid));
+	TST_EXP_PASS(CHOWN(tc[i].filename, uid, gid), "chown(%s, %d, %d)",
+		     tc[i].filename, uid, gid);

 	struct stat stat_buf;
 	SAFE_STAT(tc[i].filename, &stat_buf);
diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
index ff6e904be..b4ca3af73 100644
--- a/testcases/kernel/syscalls/chown/chown03.c
+++ b/testcases/kernel/syscalls/chown/chown03.c
@@ -17,15 +17,6 @@
  * Also verify that chown() clears the setuid/setgid bits set on the file.
  */

-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <grp.h>
 #include <pwd.h>

 #include "tst_test.h"
diff --git a/testcases/kernel/syscalls/chown/chown04.c b/testcases/kernel/syscalls/chown/chown04.c
index e7afa1422..4e9188567 100644
--- a/testcases/kernel/syscalls/chown/chown04.c
+++ b/testcases/kernel/syscalls/chown/chown04.c
@@ -54,15 +54,16 @@ static char long_path[PATH_MAX + 2] = {[0 ... PATH_MAX + 1] = 'a'};
 static struct test_case_t {
 	char *pathname;
 	int exp_errno;
+	char *desc;
 } tc[] = {
-	{TEST_FILE1, EPERM},
-	{TEST_FILE2, EACCES},
-	{(char *)-1, EFAULT},
-	{long_path, ENAMETOOLONG},
-	{"", ENOENT},
-	{TEST_FILE3, ENOTDIR},
-	{TEST_FILE4, ELOOP},
-	{TEST_FILE5, EROFS}
+	{TEST_FILE1, EPERM, "without permissions"},
+	{TEST_FILE2, EACCES, "without full permissions of the path prefix"},
+	{(char *)-1, EFAULT, "with unaccessible pathname points"},
+	{long_path, ENAMETOOLONG, "when pathname is too long"},
+	{"", ENOENT, "when file does not exist"},
+	{TEST_FILE3, ENOTDIR, "when the path prefix is not a directory"},
+	{TEST_FILE4, ELOOP, "with too many symbolic links"},
+	{TEST_FILE5, EROFS, "when the named file resides on a read-only filesystem"}
 };

 static void run(unsigned int i)
@@ -73,7 +74,8 @@ static void run(unsigned int i)
 	UID16_CHECK((uid = geteuid()), "chown");
 	GID16_CHECK((gid = getegid()), "chown");

-	TST_EXP_FAIL(CHOWN(tc[i].pathname, uid, gid), tc[i].exp_errno);
+	TST_EXP_FAIL(CHOWN(tc[i].pathname, uid, gid), tc[i].exp_errno,
+		     "chown() %s", tc[i].desc);
 }

 static void setup(void)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
