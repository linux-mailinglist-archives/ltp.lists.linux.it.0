Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A995720CE46
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:41:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B7AD3C573A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:41:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 634003C2AE3
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:41:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E7C126009B3
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:40:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="95484787"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 19:41:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6BF944CE4B0B;
 Mon, 29 Jun 2020 19:31:08 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 19:41:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <jstancek@redhat.com>
Date: Mon, 29 Jun 2020 19:41:23 +0800
Message-ID: <1593430883-6131-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
 <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6BF944CE4B0B.AF323
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/2] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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

At the first, we use BLKSSZGET ioctl to get this size, but using wrong
block dev(/dev/loopN) intead of correct backing file block dev(such as /dev/sdaN).

kernel code(driver/block/loop.c  __loop_update_dio function) as below:
---------------------------------------
if (inode->i_sb->s_bdev) {
	sb_bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
	dio_align = sb_bsize - 1;
}
if (dio) {
	if (queue_logical_block_size(lo->lo_queue) >= sb_bsize &&
		!(lo->lo_offset & dio_align) &&
		mapping->a_ops->direct_IO &&!lo->transfer)
		use_dio = true;
	else
		use_dio = false;
} else {
        use_dio = false;
}
-------------------------------------

Using inode block size is also wrong because it is for filesystem io(such as we format
filesystem can specify block size for data or log or metadata), it is not suitable
for logical block size.

Using tst_find_backing_dev(path, dev)to get the correct block dev.

Also, "offset is ignored" belongs to the third test(less than logical_block_size) but not
the second test(equal to logical_block_size)

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ioctl/ioctl_loop05.c      | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index a96997823..e3c14faab 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -32,8 +32,8 @@
 #define DIO_MESSAGE "In dio mode"
 #define NON_DIO_MESSAGE "In non dio mode"
 
-static char dev_path[1024], sys_loop_diopath[1024];
-static int dev_num, dev_fd, attach_flag, logical_block_size;
+static char dev_path[1024], sys_loop_diopath[1024], backing_file_path[1024];;
+static int dev_num, dev_fd, block_devfd, attach_flag, logical_block_size;
 
 static void check_dio_value(int flag)
 {
@@ -71,7 +71,7 @@ static void verify_ioctl_loop(void)
 	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
 	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
 	if (TST_RET == 0) {
-		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded, offset is ignored");
+		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
 		check_dio_value(1);
 		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
 	} else {
@@ -84,7 +84,7 @@ static void verify_ioctl_loop(void)
 
 	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
 	if (TST_RET == 0) {
-		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
+		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded, offset is ignored");
 		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
 		return;
 	}
@@ -96,8 +96,7 @@ static void verify_ioctl_loop(void)
 
 static void setup(void)
 {
-	int fd;
-	struct stat buf;
+	char bd_path[100];
 
 	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
 		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
@@ -109,13 +108,6 @@ static void setup(void)
 	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
 	tst_fill_file("test.img", 0, 1024, 1024);
 
-	fd = SAFE_OPEN("test.img", O_RDONLY);
-	SAFE_FSTAT(fd, &buf);
-	SAFE_CLOSE(fd);
-
-	logical_block_size = buf.st_blksize;
-	tst_res(TINFO, "backing dev logical_block_size is %d", logical_block_size);
-
 	tst_attach_device(dev_path, "test.img");
 	attach_flag = 1;
 	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
@@ -130,13 +122,22 @@ static void setup(void)
 	 *   size of loop is bigger than the backing device's and the loop
 	 *   needn't transform transfer.
 	 */
-	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
+	sprintf(backing_file_path, "%s/test.img", tst_get_tmpdir());
+	tst_find_backing_dev(backing_file_path, bd_path);
+	block_devfd = SAFE_OPEN(bd_path, O_RDWR);
+	SAFE_IOCTL(block_devfd, BLKSSZGET, &logical_block_size);
+	tst_res(TINFO, "backing dev(%s) logical_block_size is %d", bd_path, logical_block_size);
+	SAFE_CLOSE(block_devfd);
+	if (logical_block_size > 512)
+		TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_BLOCK_SIZE, logical_block_size), TST_RETVAL_EQ0);
 }
 
 static void cleanup(void)
 {
 	if (dev_fd > 0)
 		SAFE_CLOSE(dev_fd);
+	if (block_devfd > 0)
+		SAFE_CLOSE(block_devfd);
 	if (attach_flag)
 		tst_detach_device(dev_path);
 }
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
