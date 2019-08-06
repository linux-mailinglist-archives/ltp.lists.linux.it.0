Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E282E73
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:11:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB0573C1C9A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 11:11:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AA4FC3C1C8A
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4EB36200C78
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 11:11:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEF6EAE6D;
 Tue,  6 Aug 2019 09:11:24 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  6 Aug 2019 11:10:40 +0200
Message-Id: <20190806091040.26448-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806091040.26448-1-pvorel@suse.cz>
References: <20190806091040.26448-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/copy_file_range02: Add test description
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

to increase readability as all_filesystems flag prolonged output a lot.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../copy_file_range/copy_file_range02.c       | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index 472dffdc6..56797f639 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -13,14 +13,14 @@
  * 2) Try to copy contents to directory -> EISDIR
  * 3) Try to copy contents to a file opened with the
  *    O_APPEND flag -> EBADF
- * 4) Try to copy contents to closed filedescriptor
+ * 4) Try to copy contents to closed file descriptor
  *    -> EBADF
  * 5) Try to copy contents with invalid 'flags' value
  *    -> EINVAL
  * 6) Try to copy contents to a file chattred with +i
  *    flag -> EPERM
  * 7) Try to copy contents to a swapfile ->ETXTBSY
- * 8) Try to copy contents to the samefile with overlapping
+ * 8) Try to copy contents to the same file with overlapping
  *    ->EINVAL
  * 9) Try to copy contents to a blkdev ->EINVAL
  * 10) Try to copy contents to a chardev ->EINVAL
@@ -60,20 +60,21 @@ static struct tcase {
 	int	exp_err;
 	loff_t  dst;
 	loff_t     len;
+	const char *tname;
 } tcases[] = {
-	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE},
-	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE},
-	{&fd_append,	0,   EBADF,      0,     CONTSIZE},
-	{&fd_closed,	0,   EBADF,      0,     CONTSIZE},
-	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE},
-	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE},
-	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE},
-	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2},
-	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE},
-	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
-	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
-	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
-	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
+	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE, "readonly file"},
+	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE, "directory"},
+	{&fd_append,	0,   EBADF,      0,     CONTSIZE, "append to file"},
+	{&fd_closed,	0,   EBADF,      0,     CONTSIZE, "closed file descriptor"},
+	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE, "invalid flags"},
+	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE, "immutable file"},
+	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE, "swap file"},
+	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2, "overlaping"},
+	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
+	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "charr device"},
+	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
+	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
+	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
 };
 
 static int run_command(char *command, char *option, char *file)
@@ -97,6 +98,8 @@ static int run_command(char *command, char *option, char *file)
 static void verify_copy_file_range(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
 	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
 		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
 		return;
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
