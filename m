Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54D7BE8A
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 12:41:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C0563C1D18
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 12:41:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0F8C33C1CF6
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 12:41:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 74BC01000A2D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 12:40:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,329,1559491200"; d="scan'208";a="72588300"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 18:40:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 794CD4CDE65E;
 Wed, 31 Jul 2019 18:40:38 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 31 Jul 2019 18:40:38 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <pvorel@suse.cz>
Date: Wed, 31 Jul 2019 18:40:28 +0800
Message-ID: <1564569629-2358-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 794CD4CDE65E.A119F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 2/3] syscalls/copy_file_range01: add cross-device
 test
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

Amir has relaxed cross-device constraint since commit[1], I think we can test it in
copy_file_range01.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../copy_file_range/copy_file_range01.c       | 58 ++++++++++++++-----
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
index a5bd5e7f7..ec55e5da1 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
@@ -24,7 +24,16 @@
 
 static int page_size;
 static int errcount, numcopies;
-static int fd_in, fd_out;
+static int fd_in, fd_out, cross_sup;
+
+static struct tcase {
+	char    *path;
+	int     flags;
+	char    *message;
+} tcases[] = {
+	{FILE_DEST_PATH,  0, "non cross-device"},
+	{FILE_MNTED_PATH, 1, "cross-device"},
+};
 
 static int check_file_content(const char *fname1, const char *fname2,
 	loff_t *off1, loff_t *off2, size_t len)
@@ -90,7 +99,7 @@ static int check_file_offset(const char *m, int fd, loff_t len,
 	return ret;
 }
 
-static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
+static void test_one(size_t len, loff_t *off_in, loff_t *off_out, char *path)
 {
 	int ret;
 	size_t to_copy = len;
@@ -131,7 +140,7 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
 		to_copy -= TST_RET;
 	} while (to_copy > 0);
 
-	ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
+	ret = check_file_content(FILE_SRC_PATH, path,
 		off_in, off_out, len);
 	if (ret) {
 		tst_res(TFAIL, "file contents do not match");
@@ -149,10 +158,10 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
 	}
 }
 
-static void open_files(void)
+static void open_files(char *path)
 {
 	fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
-	fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
+	fd_out = SAFE_OPEN(path, O_CREAT | O_WRONLY | O_TRUNC, 0644);
 }
 
 static void close_files(void)
@@ -163,9 +172,16 @@ static void close_files(void)
 		SAFE_CLOSE(fd_in);
 }
 
-static void copy_file_range_verify(void)
+static void copy_file_range_verify(unsigned int n)
 {
 	int i, j, k;
+	struct tcase *tc = &tcases[n];
+
+	if (tc->flags && !cross_sup) {
+		tst_res(TCONF,
+			"copy_file_range doesn't support cross-device, skip it");
+		return;
+	}
 
 	errcount = numcopies = 0;
 	size_t len_arr[]	= {11, page_size-1, page_size, page_size+1};
@@ -182,33 +198,41 @@ static void copy_file_range_verify(void)
 	for (i = 0; i < (int)ARRAY_SIZE(len_arr); i++)
 		for (j = 0; j < num_offsets; j++)
 			for (k = 0; k < num_offsets; k++) {
-				open_files();
-				test_one(len_arr[i], off_arr[j], off_arr[k]);
+				open_files(tc->path);
+				test_one(len_arr[i], off_arr[j], off_arr[k], tc->path);
 				close_files();
 				numcopies++;
 			}
 
 	if (errcount == 0)
 		tst_res(TPASS,
-			"copy_file_range completed all %d copy jobs successfully!",
-			numcopies);
+			"%s copy_file_range completed all %d copy jobs successfully!",
+			tc->message, numcopies);
 	else
-		tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
-				errcount, numcopies);
+		tst_res(TFAIL, "%s copy_file_range failed %d of %d copy jobs.",
+			tc->message, errcount, numcopies);
 }
 
 static void setup(void)
 {
-	int i, fd;
+	int i, fd, fd_test;
 
 	syscall_info();
 
 	page_size = getpagesize();
-
+	cross_sup = 1;
 	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
 	/* Writing page_size * 4 of data into test file */
 	for (i = 0; i < (int)(page_size * 4); i++)
 		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
+
+	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
+	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
+	if (TST_ERR == EXDEV)
+		cross_sup = 0;
+
+	SAFE_CLOSE(fd_test);
+	remove(FILE_MNTED_PATH);
 	SAFE_CLOSE(fd);
 }
 
@@ -220,7 +244,11 @@ static void cleanup(void)
 static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
 	.needs_tmpdir = 1,
-	.test_all = copy_file_range_verify,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.test = copy_file_range_verify,
 	.test_variants = TEST_VARIANTS,
 };
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
