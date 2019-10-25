Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540EE4154
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 04:00:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F0703C2369
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 04:00:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A807E3C185E
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 04:00:12 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0E7EB600903
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 04:00:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,226,1569254400"; d="scan'208";a="77448622"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 10:00:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 064E14CE164C;
 Fri, 25 Oct 2019 09:52:13 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 25 Oct 2019 10:00:09 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <pvorel@suse.cz>
Date: Fri, 25 Oct 2019 09:59:40 +0800
Message-ID: <1571968780-4810-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 064E14CE164C.AC9D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02: skip new error tests if
 cross-fs isn't supported
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

We should not skip the whole error test if cross-fs isn't support because
old errors should be tested on all version. Even we use .mount_device = 1
and .mntpoint = MNTPOINT, the src and dest file are still in tmp directory
instead of mntpoint.

ps: I doubt whether we should skip new error test because it indeed exposed this
unreasonable copy_file_range behavior of the user.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../copy_file_range/copy_file_range02.c       | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index a55de4111..e4159cad7 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -55,6 +55,7 @@ static int need_unlink;
 
 static int chattr_i_nsup;
 static int swap_nsup;
+static int cross_sup;
 static int loop_devn;
 
 static struct tcase {
@@ -63,21 +64,22 @@ static struct tcase {
 	int	exp_err;
 	loff_t     len;
 	const char *tname;
+	int     new_error;
 } tcases[] = {
-	{&fd_rdonly,	0,	EBADF,		CONTSIZE,	"readonly file"},
-	{&fd_dir,	0,	EISDIR,		CONTSIZE,	"directory"},
-	{&fd_append,	0,	EBADF,		CONTSIZE,	"append to file"},
-	{&fd_closed,	0,	EBADF,		CONTSIZE,	"closed file descriptor"},
-	{&fd_dest,	-1,	EINVAL,		CONTSIZE,	"invalid flags"},
-	{&fd_immutable,	0,	EPERM,		CONTSIZE,	"immutable file"},
-	{&fd_swapfile,	0,	ETXTBSY,	CONTSIZE,	"swap file"},
-	{&fd_dup,	0,	EINVAL,		CONTSIZE/2,	"overlaping range"},
-	{&fd_blkdev,	0,	EINVAL,		CONTSIZE,	"block device"},
-	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device"},
-	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo"},
-	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe"},
-	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght"},
-	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size"},
+	{&fd_rdonly,	0,	EBADF,		CONTSIZE,	"readonly file",	0},
+	{&fd_dir,	0,	EISDIR,		CONTSIZE,	"directory",	0},
+	{&fd_append,	0,	EBADF,		CONTSIZE,	"append to file",	0},
+	{&fd_closed,	0,	EBADF,		CONTSIZE,	"closed file descriptor",	0},
+	{&fd_dest,	-1,	EINVAL,		CONTSIZE,	"invalid flags",	0},
+	{&fd_immutable,	0,	EPERM,		CONTSIZE,	"immutable file",	1},
+	{&fd_swapfile,	0,	ETXTBSY,	CONTSIZE,	"swap file",	1},
+	{&fd_dup,	0,	EINVAL,		CONTSIZE/2,	"overlaping range",	1},
+	{&fd_blkdev,	0,	EINVAL,		CONTSIZE,	"block device", 	0},
+	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device",	0},
+	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo", 	0},
+	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe", 	0},
+	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght", 	1},
+	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size", 	1},
 };
 
 static int run_command(char *command, char *option, char *file)
@@ -105,6 +107,11 @@ static void verify_copy_file_range(unsigned int n)
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
+	if (tc->new_error && !cross_sup) {
+		tst_res(TCONF,
+			"copy_file_range() doesn't support cross-device, skip it");
+		return;
+	}
 	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
 		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
 		return;
@@ -178,9 +185,7 @@ static void setup(void)
 	syscall_info();
 	char dev_path[1024];
 
-	if (!verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH))
-		tst_brk(TCONF,
-			"copy_file_range() doesn't support cross-device, skip it");
+	cross_sup = verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH);
 
 	if (access(FILE_DIR_PATH, F_OK) == -1)
 		SAFE_MKDIR(FILE_DIR_PATH, 0777);
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
