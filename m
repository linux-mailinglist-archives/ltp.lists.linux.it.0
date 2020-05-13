Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E731D17D0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 16:42:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30BF23C54F9
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 16:42:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EC4133C2555
 for <ltp@lists.linux.it>; Wed, 13 May 2020 16:42:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E8B1E14011A9
 for <ltp@lists.linux.it>; Wed, 13 May 2020 16:42:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,388,1583164800"; d="scan'208";a="92014703"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 22:42:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 150964BCC8A6
 for <ltp@lists.linux.it>; Wed, 13 May 2020 22:42:21 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 22:42:20 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 13 May 2020 22:42:21 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 13 May 2020 22:36:28 +0800
Message-ID: <20200513143629.2103-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 150964BCC8A6.ADD89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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

pidfd_open(2) will set close-on-exec flag on the file descriptor
as its manpage states, so check close-on-exec flag by fcntl(2).

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/pidfd_open/pidfd_open01.c   | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
index 93bb86687..f475fe28e 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -11,12 +11,21 @@
 
 static void run(void)
 {
-	TEST(pidfd_open(getpid(), 0));
+	int pidfd, flag;
 
-	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
+	pidfd = pidfd_open(getpid(), 0);
+	if (pidfd == -1)
+		tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");
 
-	SAFE_CLOSE(TST_RET);
+	flag = fcntl(pidfd, F_GETFD);
+
+	SAFE_CLOSE(pidfd);
+
+	if (flag == -1)
+		tst_brk(TFAIL | TERRNO, "fcntl(F_GETFD) failed");
+
+	if (!(flag & FD_CLOEXEC))
+		tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");
 
 	tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
 }
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
