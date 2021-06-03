Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 240793998A0
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:36:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B00EA3C5599
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 05:36:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C02713C7FFE
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:45 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C0DBC600572
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 05:35:44 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FwWgX3pcXzZcH2
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:32:56 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:33 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 11:35:33 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 11:36:11 +0800
Message-ID: <20210603033611.15619-4-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603033611.15619-1-xieziyao@huawei.com>
References: <20210603033611.15619-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/sendfile: Remove unnecessary header files
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

Remove unnecessary header files for sendfile{03, 04, 05, 07}

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/sendfile/sendfile03.c | 3 ---
 testcases/kernel/syscalls/sendfile/sendfile04.c | 9 ---------
 testcases/kernel/syscalls/sendfile/sendfile05.c | 9 ---------
 testcases/kernel/syscalls/sendfile/sendfile07.c | 9 ---------
 4 files changed, 30 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile03.c b/testcases/kernel/syscalls/sendfile/sendfile03.c
index 8783a6c34..3b93dc62e 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile03.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile03.c
@@ -18,9 +18,6 @@
  * - out_fd opened with O_RDONLY
  */

-#include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
 #include <sys/sendfile.h>

 #include "tst_test.h"
diff --git a/testcases/kernel/syscalls/sendfile/sendfile04.c b/testcases/kernel/syscalls/sendfile/sendfile04.c
index 67d004c74..97e79eadd 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile04.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile04.c
@@ -18,16 +18,7 @@
  * - a protected buffer is created by mmap with specifying protection
  */

-#include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/stat.h>
 #include <sys/sendfile.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <sys/mman.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>

 #include "tst_test.h"

diff --git a/testcases/kernel/syscalls/sendfile/sendfile05.c b/testcases/kernel/syscalls/sendfile/sendfile05.c
index 99c91f660..684536396 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile05.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile05.c
@@ -16,16 +16,7 @@
  * Call sendfile with offset = -1.
  */

-#include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/stat.h>
 #include <sys/sendfile.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <sys/mman.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>

 #include "tst_test.h"

diff --git a/testcases/kernel/syscalls/sendfile/sendfile07.c b/testcases/kernel/syscalls/sendfile/sendfile07.c
index e8bf022a7..c75dea768 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile07.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile07.c
@@ -12,16 +12,7 @@
  * when passing full out_fd opened with O_NONBLOCK.
  */

-#include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/stat.h>
 #include <sys/sendfile.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <sys/mman.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>

 #include "tst_test.h"

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
