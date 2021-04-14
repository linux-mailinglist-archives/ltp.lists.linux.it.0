Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF835F0E4
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:37:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A02993C7104
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:37:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79C473C1B0E
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:37:27 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8D54E600067
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:37:25 +0200 (CEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FKy4S35glzB0l5
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 17:35:04 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 14 Apr 2021 17:37:15 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 14 Apr 2021 17:37:10 +0800
Message-ID: <20210414093710.6365-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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

Typos in the name of the temporary files:
mmap/24-1.c: pts_mmap_24_1_* -> pts_mmap_25_1_*
sem_unlink/2-2.c: sem_unlink_9_1 -> sem_unlink_2_2

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../open_posix_testsuite/conformance/interfaces/mmap/24-1.c     | 2 +-
 .../conformance/interfaces/sem_unlink/2-2.c                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-1.c
index 3d9e4b180..6cc8349e1 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-1.c
@@ -43,7 +43,7 @@ int main(void)

 	size_t mapped_size = 0;

-	snprintf(tmpfname, sizeof(tmpfname), "pts_mmap_25_1_%d", getpid());
+	snprintf(tmpfname, sizeof(tmpfname), "pts_mmap_24_1_%d", getpid());

 	/* Create shared object */
 	shm_unlink(tmpfname);
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/2-2.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/2-2.c
index dae871d89..1e9096b23 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/2-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink/2-2.c
@@ -76,7 +76,7 @@
 #define VERBOSE 1
 #endif

-#define SEM_NAME  "/sem_unlink_9_1"
+#define SEM_NAME  "/sem_unlink_2_2"

 /******************************************************************************/
 /***************************    Test case   ***********************************/
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
