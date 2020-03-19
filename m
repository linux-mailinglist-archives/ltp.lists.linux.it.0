Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C318AADD
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 03:49:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29BB73C5547
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 03:49:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E7BD83C231A
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 03:49:24 +0100 (CET)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EE7C1140053A
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 03:49:22 +0100 (CET)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4F97E64ECEE206BBB49E
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 10:49:17 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Mar 2020 10:49:09 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 19 Mar 2020 10:55:50 +0800
Message-ID: <1584586550-11668-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] aio_error/3-1.c: Call write before aio_error
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In the case, if there is no write/read operation before aio_error,
aio_error will judge that the current asynchronous I/O has been successfully
completed, then return 0, case failed.

After the write/read operation is added, because aiocb.aio_reqprio is -1,
the write/read operation will return -1, so aio_error will also return EINVAL
because it detects that the asynchronous I/O has not completed successfully.

ps:
http://man7.org/linux/man-pages/man3/aio_error.3.html
RETURN VALUE
       This function returns one of the following:
       *  EINPROGRESS, if the request has not been completed yet.
       *  ECANCELED, if the request was canceled.
       *  0, if the request completed successfully.
       *  A positive error number, if the asynchronous I/O operation failed.
          This is the same value that would have been stored in the errno
          variable in the case of a synchronous read(2), write(2), fsync(2),
          or fdatasync(2) call.
ERRORS
       EINVAL aiocbp does not point at a control block for an asynchronous
              I/O request of which the return status (see aio_return(3)) has
              not been retrieved yet.

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 .../open_posix_testsuite/conformance/interfaces/aio_error/3-1.c      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
index 9ccda05..2b2c65b 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
@@ -64,6 +64,11 @@ int main(void)
 	aiocb.aio_reqprio = -1;
 	aiocb.aio_nbytes = BUF_SIZE;

+	if (aio_write(&aiocb) != -1) {
+                printf(TNAME " Error at aio_write(): %s\n", strerror(errno));
+                return PTS_FAIL;
+        }
+
 	ret = aio_error(&aiocb);

 	if (ret != EINVAL) {
--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
