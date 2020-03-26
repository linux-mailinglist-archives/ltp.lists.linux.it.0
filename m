Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E21936A0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 04:17:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE36D3C4C04
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 04:17:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3106D3C4BA6
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 04:17:39 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A4FF71400BE0
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 04:17:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,306,1580745600"; d="scan'208";a="87323007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Mar 2020 11:17:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id BD6F350A9960
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 11:07:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Mar 2020 11:17:31 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 26 Mar 2020 11:17:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 26 Mar 2020 11:17:27 +0800
Message-ID: <1585192647-16105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: BD6F350A9960.AB2FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] runtest/syscalls: add sendmsg03
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

Also, fix a possible warning in cleanup when SAFE_UNSHARE(CLONE_NEWUSER)
failed on 3.10.0-1049.el7.x86_64. as below:

sendmsg03.c:43: CONF: unshare(268435456) unsupported: EINVAL (22)
safe_macros.c:67: WARN: sendmsg03.c:65: close(-1) failed: EBADF (9)

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              | 1 +
 testcases/kernel/syscalls/sendmsg/sendmsg03.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/runtest/syscalls b/runtest/syscalls
index b797fb828..0ad66ca5e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1176,6 +1176,7 @@ sendfile09_64 sendfile09_64
 
 sendmsg01 sendmsg01
 sendmsg02 sendmsg02
+sendmsg03 sendmsg03
 
 sendmmsg01 sendmmsg01
 
diff --git a/testcases/kernel/syscalls/sendmsg/sendmsg03.c b/testcases/kernel/syscalls/sendmsg/sendmsg03.c
index dcabfbb00..7dc491f75 100644
--- a/testcases/kernel/syscalls/sendmsg/sendmsg03.c
+++ b/testcases/kernel/syscalls/sendmsg/sendmsg03.c
@@ -62,7 +62,8 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	SAFE_CLOSE(sockfd);
+	if (sockfd > 0)
+		SAFE_CLOSE(sockfd);
 	tst_fzsync_pair_cleanup(&fzsync_pair);
 }
 
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
