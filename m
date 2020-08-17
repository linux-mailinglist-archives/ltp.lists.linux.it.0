Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4B246467
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:23:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E5363C300F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:23:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D8F283C58E7
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:53 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50100.outbound.protection.outlook.com [40.107.5.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 50C1A601D76
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:53 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZixdzuxPxmGnAqVpte/ZD7hZtStUlEwd6XrBQalALUzs4fwduEiKyE0MdP9K6Di08tMrIFkyvHQkPqq/JMBXj1uY0rpEU14WTy3Y9sQTmdYN+bCCpUsMbEba0rBf3W9cSWE0/o1bqVcZ2aPFsnAc7HElPRDDrCXXBP2Ik+hqhjx3+BcobuRoQQ6KH5ik3YHD96Mgtd62wS8llZ67OdoziAx8Lyf8N8/QfOZFuyH1lEoGNY6bRQSY0bkUxj3nluQsXDV01oPLaIsMwyetzLPF5ZN5DsoAtgII5JgLVPkZ7hfUODXjtIj3QTPD1mjF+Np2zWczxjS+tnhfQ+d9dR0bNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F54sZf7brzvnCM9eTPBaBH61EDRzTeE0dmUct8zQuOo=;
 b=Ov+lzGZoEwM9YLdqj0kLqfdk9e9PvDsVM1skFKPRN//pZFj1jJusJOVPm2APzd7pfqlZRTP2UJCvGp93natbiQXUvqQ3mjK6Dk4y0OYMe4R0UI8vLerOQV7qQF680QPyLV6E+6Z2CwWsAuSM/jQAiNKfgjDoDv9lcSCitFf6jypnC7eeIeMB/incGz3J75k6JAYJJtlWAOoCDLLLmMP/a1cd9Ipu/5W5bJAecuTUHnXMK/2ZDGhwPRV1dU057zvaBpszqRnJBMovkByGPI6ARLiJ0vkfqKUODIvqQhcIskmlwdH78TK2FIWl58p2HqAsBqK7h6bbmnwkby6e3YznSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F54sZf7brzvnCM9eTPBaBH61EDRzTeE0dmUct8zQuOo=;
 b=IHGHZ/YROalLdF+b1VJiueIkxR5bRGm0TWTWyk49SnEG/OXOwJYCHz+00KwBl6jIKcatpSBXFiSDECdGO43BYIr51XNNDULwMeGUqx16McY8sosWYYrgp9klcbqKX6zT9OmyE6JH1js30Vw3dbTUoeCFx2of3zNXzGhZ1XJ6DLk=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VE1PR03MB5966.eurprd03.prod.outlook.com (2603:10a6:803:10c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 10:22:47 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Mon, 17 Aug 2020
 10:22:47 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Mon, 17 Aug 2020 12:22:32 +0200
Message-Id: <20200817102232.5902-3-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
References: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::14) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.238) by
 GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:29::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Mon, 17 Aug 2020 10:22:46 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.238]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6affd907-5145-4292-24ea-08d842977c93
X-MS-TrafficTypeDiagnostic: VE1PR03MB5966:
X-Microsoft-Antispam-PRVS: <VE1PR03MB59666B72016C07857A0C4069EB5F0@VE1PR03MB5966.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fO8RI+HtAG3hT4/FFHksuBZYOT0oCcDsw9ASyI6x3xxHl5ilekE1G4NpmZpwf+hPqfMENT5p3b7rgVlVMj7ROFsGwBeLqywqCCvsCFX8w+VwrK6gnS15910iwIjkBVfCKkNujrS9qSWix9Hz/u14387I3e7Rw+0718up8CvHl46WgcVdv8KSO1N6k/EZ6OPTMyxyrGGo5Bs/ERKIX9uRMKfoE4KCBJ2JElZJyKy0o0kfyICRM/MGRQy2P45AkY3qevSMWiCoVeAiI9HlCJSUMzZgVbSrU5cLb9PE5gIt4AYPKHhruSG8W8Sl9C2pWakn/KVGaGZEw68MjjOK8cL0awXDhNuPJu1Zz68UuiKAJhuL/YO9eycjiHqs3V4auob+m0T7C8fknl8nrPFT3g6wMcLd8CW0p5mdAWUmlm6pjNxrHM8ZwT9iEkWvMgalW7YmjK6yMjlDzs9obSO9c7BJWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(376002)(39830400003)(6486002)(2906002)(316002)(69590400007)(16526019)(6506007)(26005)(186003)(6916009)(4326008)(83380400001)(478600001)(966005)(52116002)(8676002)(2616005)(6666004)(66476007)(36756003)(6512007)(8936002)(1076003)(30864003)(66946007)(5660300002)(956004)(86362001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ceqs04DRwuUxsw3JDGhHsJQtiLJ5hy9O2D0NJ1OHTVlkZw8ZAFZ0BKTFERAsdf13Q75Acp6KY/7VC+Vm4Zquhz8a6C8Q1XHYwBLGrEwy36DVgi97DtkuV6C56glE4BECNOBz9jDU0FUL64wVsR9GMy+imbxZtQdxdTXta550H768y7VT2QMGMRDnrVGhtXOlgxnd2lHPOx6SsfisB07cAbuzy4V/AW2L2IKYXMPcX6SPAE2k6QMxy+tHa76ZEiGNdHJMODaUhqsJdjvzLKUAZoFBPMFuklYYDqjk+sVeM0+RHCIFkDJELCb8Qr1Fjn6oVboQxSNsXLoSRMWSbfY7Rg3a5K8q6FkvuS4L3RJkEhhYUmrn7JkWu5phpvUtu04HD+0eCL/VdYzDxuCuXdIPdWhPT8T8Z0tunqFSnHCsf1B4odoZ6auiKAvU3C2Kt0pHcGo82LhbgcNzDRfc0dnR2slK2HRNRXrvaVOwNSgxM2bN/mnvU1ibztKOfGzmqfHxaOLBiPLe8wpJ5IQY9eB5VwMl24fnOTnx5LEV1mC2En7l2YoEGSVu3Bp0nGQjDiH8Ap50+dsMGRPUxwjORGRKAqaG4VoomzhVCBpBFE9w5au9FFUYNkqV9gr3vtp36g/rDlnJ+z1tUIsw/gs5tkFXiQ==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6affd907-5145-4292-24ea-08d842977c93
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 10:22:47.3256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dp2O7FKSGUD8Q+WaBT1V09Kt1GbhgREQpYhbdXuhwOf4I5A9Z5uptSmWBFmIsYImDK7Z68ex40ftxnNtF5p9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5966
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] syscalls/{send|recv}mmsg: add a test case for
 timeout and errno test
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
Cc: laurent@vivier.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch introduces a test case for the already existing test for
syscalls 'sendmmsg()' and 'recvmmsg()' (sendmmsg01). This test
case is meant to check whether the timeout is reached aproppriately
after the first message is received. The timeout is set to 1 nsec as to
make sure that it has to be reached. In this case the expected return
value is 1 as the second message is not supposed be received after the
timeout is reached.

* Note: No matter how small the timeout is, one message is always gonna
have to be received because the timeout is checked only after a received
message. This is an existing bug for syscall 'recvmmsg()':
https://man7.org/linux/man-pages/man2/recvmmsg.2.html#BUGS

This patch introduces a new test file for these syscalls (sendmmsg02.c).
This test file is meant to check whether the aproppriate errno is set in
some sitautions when these syscalls fail. These situations include:
bad socket file descriptor (EBADF), bad message vector address (EFAULT),
bad timeout value (EINVAL), bad timeout address (EFAULT).

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 +++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 235 ++++++++++++++++++
 4 files changed, 290 insertions(+), 15 deletions(-)
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index c2bfc6df3..7c2f71e0c 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1200,6 +1200,7 @@ sendmsg02 sendmsg02
 sendmsg03 sendmsg03
 
 sendmmsg01 sendmmsg01
+sendmmsg02 sendmmsg02
 
 sendto01 sendto01
 sendto02 sendto02
diff --git a/testcases/kernel/syscalls/sendmmsg/.gitignore b/testcases/kernel/syscalls/sendmmsg/.gitignore
index b703ececd..42693c44d 100644
--- a/testcases/kernel/syscalls/sendmmsg/.gitignore
+++ b/testcases/kernel/syscalls/sendmmsg/.gitignore
@@ -1 +1,2 @@
 sendmmsg01
+sendmmsg02
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 54febf661..d7d5d33cc 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -24,6 +24,36 @@ static int receive_sockfd;
 static struct mmsghdr *snd_msg, *rcv_msg;
 static struct iovec *snd1, *snd2, *rcv1, *rcv2;
 
+enum test_type {
+	NORMAL,
+	TIMEOUT,
+};
+
+#define TYPE_NAME(x) .ttype = x, .desc = #x
+
+struct test_case {
+	int ttype;
+	const char *desc;
+	long tv_sec;
+	long tv_nsec;
+	int exp_ret;
+};
+
+static struct test_case tcase[] = {
+	{
+		TYPE_NAME(NORMAL),
+		.tv_sec = 1,
+		.tv_nsec = 0,
+		.exp_ret = 2,
+	},
+	{
+		TYPE_NAME(TIMEOUT),
+		.tv_sec = 0,
+		.tv_nsec = 1,
+		.exp_ret = 1,
+	},
+};
+
 static struct test_variants {
 	int (*receive)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
 		       unsigned int flags, void *timeout);
@@ -43,14 +73,17 @@ static struct test_variants {
 #endif
 };
 
-static void run(void)
+static void do_test(unsigned int i)
 {
 	struct test_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
 	struct tst_ts timeout;
-	int retval;
 
-	retval = tv->send(send_sockfd, snd_msg, VLEN, 0);
-	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
+	tst_res(TINFO, "case %s", tc->desc);
+
+	TEST(tv->send(send_sockfd, snd_msg, VLEN, 0));
+
+	if (TST_RET < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
 		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
 		return;
 	}
@@ -59,18 +92,18 @@ static void run(void)
 	memset(rcv2->iov_base, 0, rcv2->iov_len);
 
 	timeout.type = tv->type;
-	tst_ts_set_sec(&timeout, 1);
-	tst_ts_set_nsec(&timeout, 0);
+	tst_ts_set_sec(&timeout, tc->tv_sec);
+	tst_ts_set_nsec(&timeout, tc->tv_nsec);
 
-	retval = tv->receive(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
+	TEST(tv->receive(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout)));
 
-	if (retval == -1) {
+	if (TST_RET == -1) {
 		tst_res(TFAIL | TERRNO, "recvmmsg() failed");
 		return;
 	}
-	if (retval != 2) {
+	if (tc->exp_ret != TST_RET) {
 		tst_res(TFAIL, "Received unexpected number of messages (%d)",
-			retval);
+			TST_RET);
 		return;
 	}
 
@@ -79,10 +112,14 @@ static void run(void)
 	else
 		tst_res(TPASS, "First message received successfully");
 
-	if (memcmp(rcv2->iov_base, "three", 5))
-		tst_res(TFAIL, "Error in second received message");
-	else
-		tst_res(TPASS, "Second message received successfully");
+	if (tc->ttype == NORMAL) {
+		if (memcmp(rcv2->iov_base, "three", 5))
+			tst_res(TFAIL, "Error in second received message");
+		else
+			tst_res(TPASS, "Second message received successfully");
+	} else {
+		tst_res(TPASS, "Timeout successfully reached before second message");
+	}
 }
 
 static void setup(void)
@@ -128,7 +165,8 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.test_all = run,
+	.tcnt = ARRAY_SIZE(tcase),
+	.test = do_test,
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_variants = ARRAY_SIZE(variants),
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
new file mode 100644
index 000000000..37e6ea66e
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define _GNU_SOURCE
+#include <netinet/ip.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+
+#include "tst_test.h"
+#include "lapi/socket.h"
+#include "tst_safe_macros.h"
+#include "sendmmsg_var.h"
+
+#define BUFSIZE 16
+#define VLEN 2
+
+static int send_sockfd;
+static int receive_sockfd;
+static struct mmsghdr *snd_msg, *rcv_msg;
+static struct iovec *snd1, *snd2, *rcv1, *rcv2;
+static struct tst_ts ts;
+
+enum test_type {
+	BAD_SEND_FD,
+	BAD_RECV_FD,
+	BAD_SEND_MSGVEC,
+	BAD_RECV_MSGVEC,
+	BAD_TS_VALUE_1,
+	BAD_TS_VALUE_2,
+	BAD_TS_ADDR,
+};
+
+#define TYPE_NAME(x) .ttype = x, .desc = #x
+
+static void *bad_addr;
+
+struct test_case {
+	int ttype;
+	const char *desc;
+	int send_fd;
+	int recv_fd;
+	long tv_sec;
+	long tv_nsec;
+	int exp_send_ret;
+	int exp_send_errno;
+	int exp_recv_errno;
+};
+
+static struct test_case tcase[] = {
+	{
+		TYPE_NAME(BAD_SEND_FD),
+		.send_fd = -1,
+		.exp_send_ret = -1,
+		.exp_send_errno = EBADF,
+	},
+	{
+		TYPE_NAME(BAD_RECV_FD),
+		.exp_send_ret = VLEN,
+		.recv_fd = -1,
+		.exp_recv_errno = EBADF,
+	},
+	{
+		TYPE_NAME(BAD_SEND_MSGVEC),
+		.exp_send_ret = -1,
+		.exp_send_errno = EFAULT,
+	},
+	{
+		TYPE_NAME(BAD_RECV_MSGVEC),
+		.exp_send_ret = VLEN,
+		.exp_recv_errno = EFAULT,
+	},
+	{
+		TYPE_NAME(BAD_TS_VALUE_1),
+		.exp_send_ret = VLEN,
+		.tv_sec = -1,
+		.tv_nsec = 0,
+		.exp_recv_errno = EINVAL,
+	},
+	{
+		TYPE_NAME(BAD_TS_VALUE_2),
+		.exp_send_ret = VLEN,
+		.tv_sec = 1,
+		.tv_nsec = 1000000001,
+		.exp_recv_errno = EINVAL,
+	},
+	{
+		TYPE_NAME(BAD_TS_ADDR),
+		.exp_send_ret = VLEN,
+		.exp_recv_errno = EFAULT,
+	}
+};
+
+static struct test_variants {
+	int (*receive)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		       unsigned int flags, void *timeout);
+	int (*send)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		    unsigned int flags);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .receive = libc_recvmmsg, .send = libc_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
+	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .receive = sys_recvmmsg64, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void cleanup(void)
+{
+	if (send_sockfd > 0)
+		SAFE_CLOSE(send_sockfd);
+	if (receive_sockfd > 0)
+		SAFE_CLOSE(receive_sockfd);
+}
+
+static void do_test(unsigned int i)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
+	void *snd_msgvec, *rcv_msgvec, *timeout;
+
+	tst_res(TINFO, "case %s", tc->desc);
+
+	if (tc->ttype != BAD_SEND_FD)
+		tc->send_fd = send_sockfd;
+	if (tc->ttype != BAD_RECV_FD)
+		tc->recv_fd = receive_sockfd;
+
+	if (tc->ttype == BAD_SEND_MSGVEC)
+		snd_msgvec = bad_addr;
+	else
+		snd_msgvec = snd_msg;
+
+	TEST(tv->send(tc->send_fd, snd_msgvec, VLEN, 0));
+
+	if (TST_RET < 0) {
+		if (tc->exp_send_ret != TST_RET || errno != tc->exp_send_errno)
+			tst_res(TFAIL | TERRNO, "sendmmsg() failed unexpectedly");
+		else
+			tst_res(TPASS | TERRNO, "sendmmg() failed successfully");
+		return;
+	}
+
+	if (tc->exp_send_ret != TST_RET || snd_msg[0].msg_len != 6 ||
+	    snd_msg[1].msg_len != 6) {
+		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
+		return;
+	}
+
+	memset(rcv1->iov_base, 0, rcv1->iov_len);
+	memset(rcv2->iov_base, 0, rcv2->iov_len);
+
+	ts.type = tv->type;
+	tst_ts_set_sec(&ts, tc->tv_sec);
+	tst_ts_set_nsec(&ts, tc->tv_nsec);
+
+	if (tc->ttype == BAD_RECV_MSGVEC)
+		rcv_msgvec = bad_addr;
+	else
+		rcv_msgvec = rcv_msg;
+
+	if (tc->ttype == BAD_TS_ADDR)
+		timeout = bad_addr;
+	else
+		timeout = tst_ts_get(&ts);
+
+	TEST(tv->receive(tc->recv_fd, rcv_msgvec, VLEN, 0, timeout));
+
+	if (TST_RET < 0) {
+		if (tc->exp_recv_errno == errno)
+			tst_res(TPASS | TERRNO, "receivemmsg() failed successfully");
+		else
+			tst_res(TFAIL | TERRNO, "receivemmsg() failed unexpectedly");
+	} else {
+		tst_res(TFAIL | TERRNO, "receivemmsg() succeded unexpectedly");
+	}
+}
+
+static void setup(void)
+{
+	struct sockaddr_in addr;
+	unsigned int port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM);
+
+	send_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+	receive_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+
+	addr.sin_family = AF_INET;
+	addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+	addr.sin_port = port;
+
+	SAFE_BIND(receive_sockfd, (struct sockaddr *)&addr, sizeof(addr));
+	SAFE_CONNECT(send_sockfd, (struct sockaddr *)&addr, sizeof(addr));
+
+	memcpy(snd1[0].iov_base, "one", snd1[0].iov_len);
+	memcpy(snd1[1].iov_base, "two", snd1[1].iov_len);
+	memcpy(snd2->iov_base, "three3", snd2->iov_len);
+
+	memset(snd_msg, 0, VLEN * sizeof(*snd_msg));
+	snd_msg[0].msg_hdr.msg_iov = snd1;
+	snd_msg[0].msg_hdr.msg_iovlen = 2;
+	snd_msg[1].msg_hdr.msg_iov = snd2;
+	snd_msg[1].msg_hdr.msg_iovlen = 1;
+
+	memset(rcv_msg, 0, VLEN * sizeof(*rcv_msg));
+	rcv_msg[0].msg_hdr.msg_iov = rcv1;
+	rcv_msg[0].msg_hdr.msg_iovlen = 1;
+	rcv_msg[1].msg_hdr.msg_iov = rcv2;
+	rcv_msg[1].msg_hdr.msg_iovlen = 1;
+
+	bad_addr = tst_get_bad_addr(cleanup);
+
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcase),
+	.test = do_test,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_variants = ARRAY_SIZE(variants),
+	.bufs = (struct tst_buffers []) {
+		{&snd1, .iov_sizes = (int[]){3, 3, -1}},
+		{&snd2, .iov_sizes = (int[]){6, -1}},
+		{&rcv1, .iov_sizes = (int[]){6, -1}},
+		{&rcv2, .iov_sizes = (int[]){5, -1}},
+		{&snd_msg, .size = VLEN * sizeof(*snd_msg)},
+		{&rcv_msg, .size = VLEN * sizeof(*rcv_msg)},
+		{},
+	}
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
