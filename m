Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B33332F0
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 03:04:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 559943C6A94
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 03:04:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 787E63C4BF0
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 03:04:25 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8CAF6140111C
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 03:04:24 +0100 (CET)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DwFhS50FszrTFB
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 10:02:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 10:04:09 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 10 Mar 2021 10:03:48 +0800
Message-ID: <20210310020348.2077-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

When max_iters < max_maps, there is no post processing,
and the test will report "TBROK: Test haven't reported results".

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---------------
v1->v2: modify comparison span of the judgment.
---------------

---
 testcases/kernel/mem/tunable/max_map_count.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/mem/tunable/max_map_count.c b/testcases/kernel/mem/tunable/max_map_count.c
index aa70fde59..cf2df338a 100644
--- a/testcases/kernel/mem/tunable/max_map_count.c
+++ b/testcases/kernel/mem/tunable/max_map_count.c
@@ -164,6 +164,9 @@ static void max_map_count_test(void)
 		max_iters = MAX_MAP_COUNT;

 	max_maps = MAP_COUNT_DEFAULT;
+	if (max_iters < max_maps)
+		tst_brk(TCONF, "test requires more free memory");
+
 	while (max_maps <= max_iters) {
 		set_sys_tune("max_map_count", max_maps, 1);

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
