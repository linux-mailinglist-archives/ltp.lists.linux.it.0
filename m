Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F274713A91C
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:18:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D74E3C2352
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:18:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 886B03C12E6
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:18:52 +0100 (CET)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C6C8C1A01538
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:18:50 +0100 (CET)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 64936E008ACD1DABE7CC
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 20:18:45 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 Jan 2020 20:18:38 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 14 Jan 2020 20:19:16 +0800
Message-ID: <1579004356-19797-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/madvise06: Change drop_caches file checking
 mode
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

The madvise06 case will be failed if merge the linux kernel lts patch on the below:

https://lore.kernel.org/linux-mm/20191031221602.9375-1-hannes@cmpxchg.org/
Currently, the drop_caches proc file and sysctl read back the last
value written, suggesting this is somehow a stateful setting instead
of a one-time command. Make it write-only, like e.g. compact_memory.

The commit id of the lts patch is: 204cb79ad42f015312a5bbd7012d09c93d9b46fb

Reported-by: Zou Wei <zou_wei@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 testcases/kernel/syscalls/madvise/madvise06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 37840d0..329f558 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -49,7 +49,7 @@ static void setup(void)

 	pg_sz = getpagesize();

-	check_path(drop_caches_fname);
+	access(drop_caches_fname, W_OK);
 	tst_res(TINFO, "dropping caches");
 	sync();
 	SAFE_FILE_PRINTF(drop_caches_fname, "3");
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
