Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 987346F722
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 04:29:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 267BB3C1D1D
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 04:29:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 859F23C134D
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 04:29:18 +0200 (CEST)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7FE5E140075E
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 04:29:16 +0200 (CEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4371228180E20BB15148
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 10:29:12 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Mon, 22 Jul 2019 10:29:05 +0800
From: Song Jian <songjian15@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 22 Jul 2019 10:29:01 +0800
Message-ID: <1563762541-89314-1-git-send-email-songjian15@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH]syscalls/ioctl: bugfix for syscalls/ioctl/ioctl_ns05.c
 syscalls/ioctl/ioctl_ns06.c
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

fix ioctl_ns05, ioctl_ns06 timeout.
signal() will return 0 if success, so it have no chance to equal
nr_wake=1, use another api to to repalce the current api to ensure that
nr_wark = 0.

Signed-off-by: Song Jian <songjian15@huawei.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 2 +-
 testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
index a8dee07..8162012 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
@@ -80,7 +80,7 @@ static void run(void)
 	SAFE_CLOSE(my_fd);
 	SAFE_CLOSE(child_fd);
 	SAFE_CLOSE(parent_fd);
-	TST_CHECKPOINT_WAKE(0);
+	TST_CHECKPOINT_WAKE2(0, 0);
 }
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
index 805a0a0..d5010d0 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
@@ -75,7 +75,7 @@ static void run(void)
 	SAFE_CLOSE(my_fd);
 	SAFE_CLOSE(parent_fd);
 	SAFE_CLOSE(child_fd);
-	TST_CHECKPOINT_WAKE(0);
+	TST_CHECKPOINT_WAKE2(0, 0);
 }
 static struct tst_test test = {
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
