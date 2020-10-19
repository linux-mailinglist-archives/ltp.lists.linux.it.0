Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6A29266B
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 13:36:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD1CC3C31CC
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 13:36:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6F4CC3C26D3
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 13:36:18 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4160F1000457
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 13:36:16 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,394,1596470400"; d="scan'208";a="100296264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Oct 2020 19:36:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9FD4C48990D3;
 Mon, 19 Oct 2020 19:36:09 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 19 Oct 2020 19:36:11 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <alexey.kodanev@oracle.com>
Date: Mon, 19 Oct 2020 19:36:13 +0800
Message-ID: <1603107373-20807-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
References: <71c2d6b7-5c49-96c6-f1ba-1370fd7a5dd6@oracle.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9FD4C48990D3.AD8AF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/send02: Ensure recv() succeed when not
 using MSG_MORE flag
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

In this test, we only check send()/sendto()/sendmsg() calls
with MSG_MORE flag whether get EAGAIN/EWOULDBLOCK error immediately.

For other flag, we just call recv again when meeting EAGAIN/EWOULDBLOCK
error.

Also, improve message and make this case more clean when failed.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/send/send02.c | 65 +++++++++++++++----------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/testcases/kernel/syscalls/send/send02.c b/testcases/kernel/syscalls/send/send02.c
index 5630230fa..b2ab3b79c 100644
--- a/testcases/kernel/syscalls/send/send02.c
+++ b/testcases/kernel/syscalls/send/send02.c
@@ -71,32 +71,41 @@ static void setup(void)
 	memset(sendbuf, 0x42, SENDSIZE);
 }
 
-static int check_recv(int sock, long expsize)
+static int check_recv(int sock, long expsize, int loop)
 {
 	char recvbuf[RECVSIZE] = {0};
 
-	TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
-
-	if (TST_RET == -1) {
-		/* expected error immediately after send(MSG_MORE) */
-		if (!expsize && (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK))
-			return 1;
-
-		/* unexpected error */
-		tst_res(TFAIL | TTERRNO, "recv() error");
-		return 0;
-	}
-
-	if (TST_RET < 0) {
-		tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld",
-			TST_RET);
-		return 0;
-	}
-
-	if (TST_RET != expsize) {
-		tst_res(TFAIL, "recv() read %ld bytes, expected %ld", TST_RET,
-			expsize);
-		return 0;
+	while (1) {
+		TEST(recv(sock, recvbuf, RECVSIZE, MSG_DONTWAIT));
+
+		if (TST_RET == -1) {
+			/* expected error immediately after send(MSG_MORE) */
+			if (TST_ERR == EAGAIN || TST_ERR == EWOULDBLOCK) {
+				if (expsize)
+					continue;
+				else
+					break;
+			}
+
+			/* unexpected error */
+			tst_res(TFAIL | TTERRNO, "recv() error at step %d, expsize %ld",
+				loop, expsize);
+			return 0;
+		}
+
+		if (TST_RET < 0) {
+			tst_res(TFAIL | TTERRNO, "Invalid recv() return value %ld"
+				" at step %d, expsize is %ld",
+				TST_RET, loop, expsize);
+			return 0;
+		}
+
+		if (TST_RET != expsize) {
+			tst_res(TFAIL, "recv() read %ld bytes, expected %ld"
+				" at step %d ", TST_RET, expsize, loop);
+			return 0;
+		}
+		return 1;
 	}
 
 	return 1;
@@ -120,6 +129,8 @@ static void run(unsigned int n)
 	struct test_case *tc = testcase_list + n;
 	socklen_t len = sizeof(addr);
 
+	tst_res(TINFO, "Tesing %s", tc->name);
+
 	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
 	listen_sock = SAFE_SOCKET(tc->domain, tc->type, tc->protocol);
 	dst_sock = listen_sock;
@@ -139,19 +150,19 @@ static void run(unsigned int n)
 			dst_sock = SAFE_ACCEPT(listen_sock, NULL, NULL);
 
 		tc->send(sock, sendbuf, SENDSIZE, 0);
-		ret = check_recv(dst_sock, SENDSIZE);
+		ret = check_recv(dst_sock, SENDSIZE, i + 1);
 
 		if (!ret)
 			break;
 
 		tc->send(sock, sendbuf, SENDSIZE, MSG_MORE);
-		ret = check_recv(dst_sock, 0);
+		ret = check_recv(dst_sock, 0, i + 1);
 
 		if (!ret)
 			break;
 
 		tc->send(sock, sendbuf, 1, 0);
-		ret = check_recv(dst_sock, SENDSIZE + 1);
+		ret = check_recv(dst_sock, SENDSIZE + 1, i + 1);
 
 		if (!ret)
 			break;
@@ -163,7 +174,7 @@ static void run(unsigned int n)
 	}
 
 	if (ret)
-		tst_res(TPASS, "%s(MSG_MORE) works correctly", tc->name);
+		tst_res(TPASS, "MSG_MORE works correctly");
 
 	cleanup();
 	dst_sock = -1;
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
