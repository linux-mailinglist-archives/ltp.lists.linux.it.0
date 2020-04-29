Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6D1BE06B
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 16:13:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAE8C3C28FE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 16:13:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D03513C27FA
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 16:13:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F05B91400994
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 16:13:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CD03AF77;
 Wed, 29 Apr 2020 14:13:51 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Apr 2020 16:14:11 +0200
Message-Id: <20200429141411.9051-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_loop05: Do not fail on success
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

The code in __loop_update_dio() uses inode->i_sb->s_bdev to get the
logical block size for the backing file for the loop device. If that
pointer is NULL, which happens to be the case for Btrfs, the checks for
alignment and block size are ignored and direct I/O can be turned on
regardless of the offset and logical block size.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index 3a028ba2c..d26fa61bf 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -71,7 +71,7 @@ static void verify_ioctl_loop(void)
 
 	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
 	if (TST_RET == 0) {
-		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
+		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
 		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
 		return;
 	}
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
