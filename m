Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837C356543
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:33:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3EE43C1DF3
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:33:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 536F53C1DDE
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:32:59 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 470EF10009C7
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:32:58 +0200 (CEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFbfD3bLPzrdJF
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 15:30:44 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 15:32:44 +0800
From: Wang Xin <wangxin410@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 7 Apr 2021 15:50:08 +0800
Message-ID: <1617781808-82555-1-git-send-email-wangxin410@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/cpuset: Fix bug for type of variable c in
 checkopt
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
Cc: Wang Xin <wangxin410@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is the result of running the cpuset_load_balance test case on the ARM64 physical machine:
cpuset_load_balance 1 TFAIL: There is something wrong with test tasks
...
cpuset_load_balance 3 TFAIL: There is something wrong with test tasks
...
cpuset_load_balance 5 TFAIL: There is something wrong with test tasks
...
The analysis shows that on the ARM64-based machine, the getopt performs a while operation.
In addition, the value of char is 0 instead of 1 when it is extended to the left during comparison with the integer type,
resulting in a failure at while ((c = getopt(argc, argv, "p:h")) != -1).
Change the type of variable c to int to fix the problem.

Signed-off-by: Wang Xin <wangxin410@huawei.com>
---
 .../kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog.c b/testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog.c
index 8a6ec26..125ebd1 100644
--- a/testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog.c
+++ b/testcases/kernel/controllers/cpuset/cpuset_load_balance_test/cpuset_cpu_hog.c
@@ -111,7 +111,7 @@ void usage(char *prog_name, int status)
 void checkopt(int argc, char **argv)
 {
-	char c = '\0';
+	int c = '\0';
 	char *endptr = NULL;
 	long nr_cpus = 0;
 	long opt_value = 0;
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
