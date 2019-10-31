Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F27EAAB4
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 07:45:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B653C234B
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 07:45:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 33F8C3C229C
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 07:45:16 +0100 (CET)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id BAF4E140149C
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 07:45:13 +0100 (CET)
Received: by atcsqa06.andestech.com (Postfix, from userid 5362)
 id E8FB5C0B08; Thu, 31 Oct 2019 14:45:08 +0800 (CST)
From: Eric Lin <tesheng@andestech.com>
To: ltp@lists.linux.it,
	petr.vorel@gmail.com,
	wangli.ahau@gmail.com
Date: Thu, 31 Oct 2019 14:44:51 +0800
Message-Id: <20191031064451.14966-1-tesheng@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.7 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS,TO_NO_BRKTS_DYNIP autolearn=disabled version=3.4.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] hugetlb: Initialize orig_shmmax and orig_shmmni value
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
Cc: alankao@andestech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When doing save_nr_hugepages() in setup() and there
is no Huge page support in system, it will call
cleanup() and write wrong orig_shmmax and orig_shmmni
value back to file.

To fix it, we initialize the orig_shmmax and
orig_shmmni to -1 and check it in cleanup().

Signed-off-by: Eric Lin <tesheng@andestech.com>
---
 testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c   | 5 +++--
 testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
index d375810cb..c76e4167f 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
@@ -38,7 +38,7 @@
 static long huge_free;
 static long huge_free2;
 static long hugepages;
-static long orig_shmmax, new_shmmax;
+static long orig_shmmax = -1, new_shmmax;
 
 static void shared_hugepage(void);
 
@@ -106,7 +106,8 @@ static void setup(void)
 static void cleanup(void)
 {
 	restore_nr_hugepages();
-	SAFE_FILE_PRINTF(PATH_SHMMAX, "%ld", orig_shmmax);
+	if (orig_shmmax != -1)
+		SAFE_FILE_PRINTF(PATH_SHMMAX, "%ld", orig_shmmax);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
index d5255228b..f2ecc465d 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
@@ -39,7 +39,7 @@ static int num_shms;
 static int shm_id_arr[MAXIDS];
 
 static long hugepages = 128;
-static long orig_shmmni;
+static long orig_shmmni = -1;
 static struct tst_option options[] = {
 	{"s:", &nr_opt, "-s   num  Set the number of the been allocated hugepages"},
 	{NULL, NULL, NULL}
@@ -105,7 +105,8 @@ static void cleanup(void)
 	for (i = 0; i < num_shms; i++)
 		rm_shm(shm_id_arr[i]);
 
-	FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
+	if (orig_shmmni != -1)
+		FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
 	restore_nr_hugepages();
 }
 
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
