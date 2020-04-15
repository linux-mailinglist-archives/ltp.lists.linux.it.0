Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C12081A9627
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 10:22:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656E83C2B04
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 10:22:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3B77D3C2AF9
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 10:22:23 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AC6806000E0
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 10:22:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,386,1580745600"; d="scan'208";a="89069416"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 16:22:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 3898A49DF134
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 16:11:47 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 16:22:17 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 15 Apr 2020 16:22:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 15 Apr 2020 16:08:54 +0800
Message-ID: <20200415080854.65971-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415080854.65971-1-yangx.jy@cn.fujitsu.com>
References: <20200415080854.65971-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3898A49DF134.A93C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/quotactl04.c: Specify inode size for
 prjquota feature
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

Background:
1) LTP uses default 256M filesystem to run test.
2) Mke2fs sets inode size to 128 bytes for small filesystem(e.g. 256M) usually.
3) Prjquota feature requires bigger inode size which is at least 256 bytes.

new mke2fs can adjust inode size to 256M automatically by commit 66aae96 in
e2fsprogs, but old mke2fs cannot do it and reports the following error:
-----------------------------------------------------------
mke2fs 1.43.4 (31-Jan-2017)
mkfs.ext4: 128 byte inodes are too small for project quota; specify larger size
-----------------------------------------------------------

Make quotactl04 with old mke2fs works by specifying inode size to 256 bytes.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/quotactl/quotactl04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index b0db8fe5d..73980d7e9 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -102,7 +102,7 @@ static struct tcase {
 
 static void setup(void)
 {
-	const char *const fs_opts[] = {"-O quota,project", NULL};
+	const char *const fs_opts[] = {"-I 256", "-O quota,project", NULL};
 
 	test_id = geteuid();
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
