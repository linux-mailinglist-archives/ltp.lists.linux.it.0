Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E19A9A6
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 10:08:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F3633C1D47
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 10:08:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A33EE3C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 10:08:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5E77D601F66
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 10:08:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74152730"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 16:08:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 551424CE042F;
 Fri, 23 Aug 2019 16:08:06 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 23 Aug 2019 16:08:08 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <liwang@redhat.com>
Date: Fri, 23 Aug 2019 16:07:59 +0800
Message-ID: <1566547679-2771-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 551424CE042F.ABA0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/copy_file_range02: use .needs_tmpdir and
 MAX_LEN
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Since commit bc514b22, we have removed EXDEV test. all_filesystem
,mount_device and mntpoint make no sense. Remove it and use tmpdir.

As man-page said, when we plan to write at a position past the maximum
allowed offset, it will return EFBIG. We should USE tst_max_lfs_filesize 
as dst instead of (tst_max_lfs_fileszie - MIN_OFF). Also, it doesn't affect 
EOVERFLOW.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Murphy Zhou <jencce.kernel@gmail.com>
---
 .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index a08df9bdb..d6e843ee4 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -115,7 +115,7 @@ static void verify_copy_file_range(unsigned int n)
 	}
 
 	if (tc->copy_to_fd == &fd_copy)
-		dst = tst_max_lfs_filesize() - MIN_OFF;
+		dst = tst_max_lfs_filesize();
 
 	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
 				&dst, tc->len, tc->flags));
@@ -224,8 +224,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-	.mount_device = 1,
-	.mntpoint = MNTPOINT,
-	.all_filesystems = 1,
+	.needs_tmpdir = 1,
 	.test_variants = TEST_VARIANTS,
 };
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
