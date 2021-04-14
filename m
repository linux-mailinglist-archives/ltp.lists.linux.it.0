Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDC35F06D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:07:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CFCC3C7102
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:07:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8343F3C1B0E
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:07:17 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A9B4100041D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:07:15 +0200 (CEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKxNy5m3ZzpXj8
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 17:04:18 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 14 Apr 2021 17:07:01 +0800
From: Wang Xin <wangxin410@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 14 Apr 2021 17:24:19 +0800
Message-ID: <1618392259-35501-1-git-send-email-wangxin410@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] openposix/conformance/interfaces: Correct typos
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
Cc: Wang Xin <wangxin410@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Types in the name of the temporary files: For example, in aio_cancel/8-1.c file,
pts_aio_cancel_1_1 -> pts_aio_cancel_8_1.
Others like this have been modified.

Signed-off-by: Wang Xin <wangxin410@huawei.com>
---
 v2->v1: rebase this patch on the latest main branch

 testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/8-1.c  | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c    | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c  | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/aio_suspend/3-1.c | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/aio_write/7-1.c   | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/lio_listio/5-1.c  | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/lio_listio/7-1.c  | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/mmap/11-6.c       | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/mmap/32-1.c       | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/mmap/6-3.c        | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/munmap/1-2.c      | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/munmap/3-1.c      | 2 +-
 testcases/open_posix_testsuite/conformance/interfaces/munmap/9-1.c      | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/8-1.c
index 139e9b5..f11e067 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/8-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/8-1.c
@@ -50,7 +50,7 @@ int main(void)
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		return PTS_UNSUPPORTED;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_1_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_8_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c
index 5b980be..e1ae59e 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c
@@ -55,7 +55,7 @@ int main(void)
 	    || sysconf(_SC_AIO_MAX) == -1)
 		return PTS_UNSUPPORTED;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_write_4_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_read_9_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
index f380531..a243b3e 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
@@ -50,7 +50,7 @@ int main(void)
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		return PTS_UNSUPPORTED;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_return_2_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_return_4_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend/3-1.c
index ed8173e..615b97d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend/3-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend/3-1.c
@@ -53,7 +53,7 @@ int main(void)
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		return PTS_UNSUPPORTED;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_suspend_2_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_suspend_3_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_write/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_write/7-1.c
index 5311a4a..277573a 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_write/7-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_write/7-1.c
@@ -55,7 +55,7 @@ int main(void)
 	    || sysconf(_SC_AIO_MAX) == -1)
 		return PTS_UNSUPPORTED;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_write_4_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_write_7_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/5-1.c b/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/5-1.c
index e445773..7eb6448 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/5-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/5-1.c
@@ -55,7 +55,7 @@ int main(void)
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		exit(PTS_UNSUPPORTED);
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_lio_listio_4_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_lio_listio_5_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/7-1.c
index 444555e..4e8afb6 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/7-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/lio_listio/7-1.c
@@ -73,7 +73,7 @@ int main(void)
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		exit(PTS_UNSUPPORTED);
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_lio_listio_4_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_lio_listio_7_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-6.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-6.c
index 2aea927..d1f8991 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-6.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/11-6.c
@@ -59,7 +59,7 @@ int main(void)
 	/* mmap will create a partial page */
 	len = page_size / 2;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_11_5");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_11_6");
 	child = fork();
 	switch (child) {
 	case 0:
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/32-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/32-1.c
index bb3ab74..d58fc8c 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/32-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/32-1.c
@@ -31,7 +31,7 @@ int main(void)
 	void *pa;
 	int fd;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_31_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_32_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/6-3.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/6-3.c
index b38833b..9aef16c 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/6-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/6-3.c
@@ -53,7 +53,7 @@ int main(void)
 	int status;
 	int sig_num;
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_6_2");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_mmap_6_3");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munmap/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/munmap/1-2.c
index 9d0f918..31f2109 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munmap/1-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munmap/1-2.c
@@ -73,7 +73,7 @@ int main(void)
 	len = page_size + 1;
 	/* Create tmp file */
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_1_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_1_2");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munmap/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munmap/3-1.c
index 53e89de..1879719 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munmap/3-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munmap/3-1.c
@@ -54,7 +54,7 @@ int main(void)
 	len = page_size + 1;
 	/* Create tmp file */
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_1_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_3_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munmap/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munmap/9-1.c
index 0280a0e..371e3b0 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/munmap/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/munmap/9-1.c
@@ -49,7 +49,7 @@ int main(void)
 	len = page_size + 1;
 	/* Create tmp file */
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_1_1");
+	PTS_GET_TMP_FILENAME(tmpfname, "pts_munmap_9_1");
 	unlink(tmpfname);
 	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
 	if (fd == -1) {
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
