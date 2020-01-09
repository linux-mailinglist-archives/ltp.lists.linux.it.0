Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04E1353AD
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:26:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 905EC3C234E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:26:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 897933C2459
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:26:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 822CB100134F
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:26:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,412,1571673600"; d="scan'208";a="81523059"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 15:26:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 7C8D44CE19F6;
 Thu,  9 Jan 2020 15:17:21 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 15:26:22 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 Jan 2020 15:26:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 9 Jan 2020 15:26:05 +0800
Message-ID: <1578554765-30025-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7C8D44CE19F6.AF42C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/capget02: remove useless getpid()
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

Since pid=0 returns the capabilities for the calling thread,
we can remove getpid. Also we can cover this test point.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
-----------------
v1-v2:
remove pid = 0 assignment, because it has been initialized as 0.
add comment
-----------------
---
 testcases/kernel/syscalls/capget/capget02.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/capget/capget02.c b/testcases/kernel/syscalls/capget/capget02.c
index 42c76a011..931632e47 100644
--- a/testcases/kernel/syscalls/capget/capget02.c
+++ b/testcases/kernel/syscalls/capget/capget02.c
@@ -69,15 +69,15 @@ static void verify_capget(unsigned int n)
 
 static void setup(void)
 {
-	unsigned int i, pid;
-
-	pid = getpid();
+	unsigned int i;
 
+	/*
+	 * Don't need to assign value to header.pid and bad_version_header.pid.
+	 * Because they have been initialized as 0 that it returns the capabilities
+	 * for the calling thread, equivalently to getpid().
+	 */
 	header.version = 0x19980330;
-	header.pid = pid;
-
 	bad_version_header.version = 0;
-	bad_version_header.pid = pid;
 
 	bad_pid_header.version = 0x19980330;
 	bad_pid_header.pid = -1;
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
