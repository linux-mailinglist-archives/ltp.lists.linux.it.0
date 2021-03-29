Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407534D1A2
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 15:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D03B53C7818
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 15:47:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 617C93C2649
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 15:47:08 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 041E810005C6
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 15:47:07 +0200 (CEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8DN905P4z9t5x
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 21:44:57 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 21:46:54 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Mar 2021 21:46:47 +0800
Message-ID: <20210329134647.27740-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
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

SHM_STAT_ANY is imported to linux in v4.17.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index 9e8ec4199..18ac8ba0a 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -168,6 +168,7 @@ static void cleanup(void)
 }

 static struct tst_test test = {
+	.min_kver = "4.17",
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_shminfo,
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
