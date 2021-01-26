Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9C303162
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 02:42:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F8C63C7AF5
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 02:42:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 150053C0752
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 02:41:56 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3C2B91A001D3
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 02:41:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="103825797"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Jan 2021 09:41:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 707CF4CE67AC
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 09:41:49 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 Jan 2021 09:41:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 26 Jan 2021 09:41:38 +0800
Message-ID: <1611625298-2425-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 707CF4CE67AC.AD17B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/msync: Assgin value for page_sz
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

Since the previous patch, it removes useless getpagesize()
check because this function never fail. But it also remove
the page_size assignment and it lead case fail as below:

msync02     1  TBROK  :  msync02.c:133: mmap failed: errno=EINVAL(22): Invalid argument
msync02     2  TBROK  :  msync02.c:133: Remaining cases broken
msync02     3  TBROK  :  msync02.c:147: munmap failed: errno=EINVAL(22): Invalid argument

Fix this and also fix compiler warning by using size_t data type instead of int.

Fixes: 60f4b01194ca ("syscalls/msync01: Remove useless getpagesize() check")
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/msync/msync01.c | 4 +++-
 testcases/kernel/syscalls/msync/msync02.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/msync/msync01.c b/testcases/kernel/syscalls/msync/msync01.c
index 121fd86e8..cb740565d 100644
--- a/testcases/kernel/syscalls/msync/msync01.c
+++ b/testcases/kernel/syscalls/msync/msync01.c
@@ -153,12 +153,14 @@ int main(int ac, char **av)
  */
 void setup(void)
 {
-	int c_total = 0, nwrite = 0;	/* no. of bytes to be written */
+	size_t c_total = 0, nwrite = 0;	/* no. of bytes to be written */
 
 	tst_sig(NOFORK, DEF_HANDLER, cleanup);
 
 	TEST_PAUSE;
 
+	page_sz = (size_t)getpagesize();
+
 	tst_tmpdir();
 
 	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0)
diff --git a/testcases/kernel/syscalls/msync/msync02.c b/testcases/kernel/syscalls/msync/msync02.c
index c7b7e9e9c..11ed29e3b 100644
--- a/testcases/kernel/syscalls/msync/msync02.c
+++ b/testcases/kernel/syscalls/msync/msync02.c
@@ -106,13 +106,15 @@ int main(int ac, char **av)
 
 void setup(void)
 {
-	int c_total = 0, nwrite = 0;	/* no. of bytes to be written */
+	size_t c_total = 0, nwrite = 0;	/* no. of bytes to be written */
 	char tst_buf[BUF_SIZE];
 
 	tst_sig(NOFORK, DEF_HANDLER, cleanup);
 
 	TEST_PAUSE;
 
+	page_sz = (size_t)getpagesize();
+
 	tst_tmpdir();
 
 	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
