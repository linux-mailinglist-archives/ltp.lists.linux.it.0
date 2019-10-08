Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76897CFD59
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 17:16:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07B393C14BB
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 17:16:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1CF7C3C0151
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 17:16:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D958814016A0
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 17:16:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19F25AE03;
 Tue,  8 Oct 2019 15:16:25 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  8 Oct 2019 17:16:24 +0200
Message-Id: <20191008151624.19815-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02: Add check for pipe
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

The original patch that was adding this fell under a table:

http://patchwork.ozlabs.org/patch/1112976/

I guess there is no harm checking that we get EINVAL for pipe as well,
or does anyone disagree?

Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Amir Goldstein <amir73il@gmail.com>
---
 .../syscalls/copy_file_range/copy_file_range02.c   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index 6e385adbd..a55de4111 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -25,9 +25,10 @@
  * 9) Try to copy contents to a blkdev ->EINVAL
  * 10) Try to copy contents to a chardev ->EINVAL
  * 11) Try to copy contents to a FIFO ->EINVAL
- * 12) Try to copy contents to a file with length beyond
+ * 12) Try to copy contenst to a PIPE ->EINVAL
+ * 13) Try to copy contents to a file with length beyond
  *     16EiB wraps around 0 -> EOVERFLOW
- * 13) Try to copy contents to a file with target file range
+ * 14) Try to copy contents to a file with target file range
  *     beyond maximum supported file size ->EFBIG
  */
 
@@ -48,6 +49,7 @@ static int fd_dup;
 static int fd_blkdev;
 static int fd_chrdev;
 static int fd_fifo;
+static int fd_pipe[2];
 static int fd_copy;
 static int need_unlink;
 
@@ -73,6 +75,7 @@ static struct tcase {
 	{&fd_blkdev,	0,	EINVAL,		CONTSIZE,	"block device"},
 	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device"},
 	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo"},
+	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe"},
 	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght"},
 	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size"},
 };
@@ -163,6 +166,11 @@ static void cleanup(void)
 		SAFE_CLOSE(fd_copy);
 	if (need_unlink > 0)
 		SAFE_UNLINK(FILE_FIFO);
+
+	if (fd_pipe[0] > 0) {
+		SAFE_CLOSE(fd_pipe[0]);
+		SAFE_CLOSE(fd_pipe[1]);
+	}
 }
 
 static void setup(void)
@@ -201,6 +209,8 @@ static void setup(void)
 	fd_chrdev = SAFE_OPEN(FILE_CHRDEV, O_RDWR, 0600);
 	fd_fifo = SAFE_OPEN(FILE_FIFO, O_RDWR, 0600);
 
+	SAFE_PIPE(fd_pipe);
+
 	SAFE_WRITE(1, fd_src, CONTENT, CONTSIZE);
 	close(fd_src);
 	fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY, 0664);
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
