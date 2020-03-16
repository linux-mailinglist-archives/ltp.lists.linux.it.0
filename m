Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3AD18637B
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 03:58:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CE113C578E
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 03:58:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 721443C1411
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 03:58:48 +0100 (CET)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A955A6002BD
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 03:58:46 +0100 (CET)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6BF88E163B7C792384E1
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 10:58:38 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Mar 2020 10:58:32 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 16 Mar 2020 10:58:35 +0800
Message-ID: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

pthread_cond_init/s-c.c testcase lose a #ifndef line, fix it

Reported-by: Zou Wei <zou_wei@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c b/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
index 6a5c70a..8d18484 100644
--- a/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
+++ b/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
@@ -80,6 +80,7 @@
 /***********************************    Test case   *****************************************/
 /********************************************************************************************/
+#ifndef WITHOUT_XOPEN
 typedef struct _teststruct {
 	pthread_cond_t cnd[10 * SCALABILITY_FACTOR];
 	pthread_condattr_t ca[4];
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
