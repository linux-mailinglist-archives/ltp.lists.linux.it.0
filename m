Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C743A34B613
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:24:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 037C13C8DF0
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:24:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D1A323C2791
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:24:11 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE912600660
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:24:09 +0100 (CET)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6vyv5cbrz1BGGm
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 18:21:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 18:23:52 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sat, 27 Mar 2021 18:23:44 +0800
Message-ID: <20210327102344.1620-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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

When "shmid == -1", we need print the errno with TERRNO. It must have no error in
TEST, otherwise it has return early.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index c70a76fb2..9e8ec4199 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -130,7 +130,7 @@ static void verify_shminfo(unsigned int n)
 	shmid = shmctl(TST_RET, SHM_STAT_ANY, &ds);

 	if (shmid == -1) {
-		tst_res(TFAIL | TTERRNO, "SHM_INFO haven't returned a valid index");
+		tst_res(TFAIL | TERRNO, "SHM_INFO haven't returned a valid index");
 	} else {
 		tst_res(TPASS,
 			"SHM_INFO returned valid index %li maps to shmid %i",
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
