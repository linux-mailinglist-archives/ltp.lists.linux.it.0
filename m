Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBA310223
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 02:18:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33BAD3C7359
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 02:18:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2CF383C5E11
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 02:17:58 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 50DA11400FA9
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 02:17:56 +0100 (CET)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DWyDF32fnzlFMk
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 09:16:13 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Feb 2021 09:17:43 +0800
From: zhao gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 5 Feb 2021 09:16:35 +0800
Message-ID: <20210205011635.177469-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] ttype: using TERRNO to macth errno
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

Use TERRNO because we're not using the TEST() macro.

Signed-off-by: zhao gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/prctl/prctl06.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index d6517e6b1..21d336c07 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -50,14 +50,14 @@ static void do_prctl(void)
 	if (childpid == 0) {
 		check_no_new_privs(1, "After fork, child process", proc_flag);
 		execve(BIN_PATH, childargv, envp);
-		tst_brk(TFAIL | TTERRNO,
+		tst_brk(TFAIL | TERRNO,
 			"child process failed to execute prctl_execve");

 	} else {
 		tst_reap_children();
 		check_no_new_privs(1, "parent process", proc_flag);
 		execve(BIN_PATH, argv, envp);
-		tst_brk(TFAIL | TTERRNO,
+		tst_brk(TFAIL | TERRNO,
 			"parent process failed to execute prctl_execve");
 	}
 }
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
