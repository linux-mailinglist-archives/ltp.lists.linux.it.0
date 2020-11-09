Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AB2AB850
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:34:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E4E43C5DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:34:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A93003C0888
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:34:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 17B28600150
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:34:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; d="scan'208";a="101095615"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 20:34:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6B14C4CE3A5D
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 20:34:22 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 20:34:22 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 9 Nov 2020 07:34:13 -0500
Message-ID: <1604925253-4765-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6B14C4CE3A5D.AA78F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] sycalls: select03: Make nfds use the correct value
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

When running select03 with runltp in /opt/ltp, this case failed as below:
select03.c:52: TFAIL: Invalid readfds: select() passed unexpectedly with 0
select03.c:52: TFAIL: Invalid writefds: select() passed unexpectedly with 0
select03.c:52: TFAIL: Invalid exceptfds: select() passed unexpectedly with 0

ltp-pan will leak file descriptors for logfile, failcmdfile and tconfcmdfile, so
select() cannot monitor invalid file descriptors for test when nfds is set to 6.

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/select/select03.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
index ca1b7a5..fb52284 100644
--- a/testcases/kernel/syscalls/select/select03.c
+++ b/testcases/kernel/syscalls/select/select03.c
@@ -16,34 +16,35 @@ static fd_set readfds_reg, writefds_reg, fds_closed;
 static fd_set *preadfds_reg = &readfds_reg, *pwritefds_reg = &writefds_reg;
 static fd_set *pfds_closed = &fds_closed, *nullfds = NULL, *faulty_fds;
 static int fd_closed, fd[2];
+static int negative_nfds = -1, maxfds;
 static struct timeval timeout = {.tv_sec = 0, .tv_usec = 100000};
 
 static struct timeval *valid_to = &timeout, *invalid_to;
 
 static struct tcases {
 	char *name;
-	int nfds;
+	int *nfds;
 	fd_set **readfds;
 	fd_set **writefds;
 	fd_set **exceptfds;
 	struct timeval **timeout;
 	int exp_errno;
 } tests[] = {
-	{ "Negative nfds", -1, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
-	{ "Invalid readfds", 6, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
-	{ "Invalid writefds", 6, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
-	{ "Invalid exceptfds", 6, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
-	{ "Faulty readfds", 6, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
-	{ "Faulty writefds", 6, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
-	{ "Faulty exceptfds", 6, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
-	{ "Faulty timeout", 6, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
+	{ "Negative nfds", &negative_nfds, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
+	{ "Invalid readfds", &maxfds, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
+	{ "Invalid writefds", &maxfds, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
+	{ "Invalid exceptfds", &maxfds, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
+	{ "Faulty readfds", &maxfds, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
+	{ "Faulty writefds", &maxfds, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
+	{ "Faulty exceptfds", &maxfds, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
+	{ "Faulty timeout", &maxfds, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
 };
 
 static void run(unsigned int n)
 {
 	struct tcases *tc = &tests[n];
 
-	TEST(do_select_faulty_to(tc->nfds, *tc->readfds, *tc->writefds,
+	TEST(do_select_faulty_to(*tc->nfds, *tc->readfds, *tc->writefds,
 				 *tc->exceptfds, *tc->timeout,
 				 tc->timeout == &invalid_to));
 
@@ -81,6 +82,7 @@ static void setup(void)
 
 	SAFE_CLOSE(fd_closed);
 
+	maxfds = fd[1] + 1;
 	faulty_address = tst_get_bad_addr(NULL);
 	invalid_to = faulty_address;
 	faulty_fds = faulty_address;
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
