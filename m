Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99D34E763
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:21:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C1853C2590
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 14:21:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6EA9A3C243A
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:21:10 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 80F5E1000A48
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 14:21:08 +0200 (CEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8pQT6FdLz9tC8
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 20:18:57 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 20:20:54 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 30 Mar 2021 20:20:41 +0800
Message-ID: <20210330122041.19700-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/getdtablesize01: Add abnormal handling
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

When /etc/hosts is not exist, test would fail, actually, we chould skip the
the problem to improve maintainability.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/getdtablesize/getdtablesize01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
index d25cac261..25d10d5fb 100644
--- a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
+++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
@@ -100,6 +100,8 @@ int main(void)
 		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
 	else if (fd < 0 && errno == ENFILE)
 		tst_brkm(TCONF, cleanup, "Reached maximum number of open files for the system");
+	else if (fd == 0)
+		tst_brkm(TCONF, cleanup, "Maybe /etc/hosts is not exist");
 	else
 		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
