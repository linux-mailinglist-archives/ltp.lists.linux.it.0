Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E013324BE
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:10:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFC8D3C6A8E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:09:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3ECC43C4C02
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:09:54 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 91ECF1000AE9
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:09:53 +0100 (CET)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dvv9245MKzMkJC
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 20:07:34 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 20:09:39 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 9 Mar 2021 20:09:14 +0800
Message-ID: <20210309120914.711-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
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

When CommitLimit - Committed_AS < 128, there is no post processing,
and the test will report "TBROK: Test haven't reported results".

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/mem/tunable/max_map_count.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/mem/tunable/max_map_count.c b/testcases/kernel/mem/tunable/max_map_count.c
index aa70fde59..ffc53cbb5 100644
--- a/testcases/kernel/mem/tunable/max_map_count.c
+++ b/testcases/kernel/mem/tunable/max_map_count.c
@@ -162,6 +162,8 @@ static void max_map_count_test(void)
 	max_iters = memfree / sysconf(_SC_PAGESIZE) * 1024 - 64;
 	if (max_iters > MAX_MAP_COUNT)
 		max_iters = MAX_MAP_COUNT;
+	if (max_iters < 0)
+		tst_brk(TCONF, "Test nees max_iters > 0, test skipped");

 	max_maps = MAP_COUNT_DEFAULT;
 	while (max_maps <= max_iters) {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
