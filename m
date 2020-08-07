Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761123ECBA
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:42:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 367163C59BC
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:42:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 68D963C31F0
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:38 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20136.outbound.protection.outlook.com [40.107.2.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AE3071401139
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:41:37 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4H4ZseVwLkJpPLLHMuebi2Ag6bjEJLhRUSZEwRsXy6msOIGX56/ftn2BmSjfAVzHt9Uphsg/5EGy60Hcet3j9/n2P02tZhhfk13ckFP9yEViNDYOs9JYE5Bfo8fmKdxRyJaarZIaP5aFeOp48/TIMHmi64oQ0c24Do0gI7t6JifkOP3iqSDM+Q6cld7PjuOWxx4AjPn73zWAfeAEoY10Ck57Gpp4VDSqLG4ng7NGjtIHAbbRNVYTW5Ai9ybdqr/dsyLjuA3yArZURRTyJmIP3C350OYM8CKnU53ARCsoHTRoxXkovfHolnZK2kL9kiWG4+EFBcKrLWCWuHDi9TREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzAwRxiWez35N1KiDID/pv5cZC3i8bDMBRPE29Rd8PM=;
 b=gc4qhIPMMGSfsHXANTqcig9Iu8b5/oa42C3rUS8AGeaRCChRTug1Z5qkjRxRxY18CEvQVmqx5gZf7Mr0/Hi/f2HJUgrF3ZtFVURLtTzeyLQTJAFr5/o5B1b+8qx6mhw4VmjrpJe/cWGXmVwC+OAswBoCPQ6zpFEqDbJC0CPjJ8tFhMyLWWu66m+5g0PWveDQpIWI0LZmFWHMSv/WJB6+7ceQYWBDOVGAidDJlABayXfs+3TunKshz8xhav3T3TfFeJVHuvE3fBEAg+Cn8RmHhJP67rIjA6KipGyTV+Ru0iTrnAoRDX+7Uq8sRYpixhYi3bsLAkGyoYNf5W0NMqAc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzAwRxiWez35N1KiDID/pv5cZC3i8bDMBRPE29Rd8PM=;
 b=M6p7PcR8/UveO6DhPk2R+qv9w/ZwlMytvWTZ+iRpTLX8JV9Qrn3g6ejW1skThwBTbzc12h1R9mV2SFl9c7b0Zp1i8b5UTbjMiqQ3EXuq7HFc+qiyjtVjABDwQX3+ddTrCD/yzkfEFoRvFwrymuTnSSbq5Hr8UYo/cHctSAtjPVA=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB4839.eurprd03.prod.outlook.com (2603:10a6:20b:8a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 7 Aug
 2020 11:41:31 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::f5ac:9ad:533:e589%3]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 11:41:31 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 13:39:50 +0200
Message-Id: <20200807113950.69052-4-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
References: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::18) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.235) by
 GV0P278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:26::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 11:41:30 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bee3ad3e-dddc-4589-6259-08d83ac6d44e
X-MS-TrafficTypeDiagnostic: AM6PR03MB4839:
X-Microsoft-Antispam-PRVS: <AM6PR03MB483981222A233A0882ED2924EB490@AM6PR03MB4839.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAgNgVIimocHPD1Ngsj7MfecGcNCxng/DWELGjlPgfH/6PrQiR1FGLxYQhJdMxbdtlhR5ZxpYZJ1YYFGYACBIf1Ey1HahEQze5ja2nDoDKpBQuY3oAcEj51lI2nOnu1wIHCzihrCMdN9GeWEyMQt1zfy+iUVLccgRub03e/gq1qanUt2PmuYihLjOh9gjN66YkiH6dnSvMEGqv75YiguIn7cRH3HymPc+FN8h6K2+cnnBHog4NAtw+Al7unVHRjuxegd04A2aFCR2FMsVfq2DMU4ZbAhUDKfjAotNGsdWTFuEf2vIRqKjJn0EpzBVSRViJEcjF3NXBHHQfxpe2IyN82SQc1/cMowo/FLiXyi00cpW2g5c8U5LDG8I68NSLFEQ0Yaq7eGkxXKn+5EeMuztEEnkMTXvEq3R42NhOwqfZ1riRr32z4svk57l+NbVBrnNydS8Cvsa9YFrxXR6NUqRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39830400003)(396003)(366004)(66476007)(1076003)(66556008)(66946007)(4326008)(16526019)(36756003)(186003)(8936002)(8676002)(26005)(30864003)(316002)(508600001)(966005)(6512007)(6506007)(52116002)(5660300002)(6486002)(69590400007)(956004)(86362001)(2616005)(6916009)(83380400001)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Cv3blLVUrwgfKKmpj+lIj9tVFxqGvl0AtYWM1xbAdKeFfwegTM4K15i6Hbcs8Hb2Pi7yEzhqUPLCET0DNIB6gAL7wNVlF1egc0g5aMbZLSkTRXDmLywA9zXu4Fw+qwS/mz0S8LCO1ZaXqjpIQumFLAsjJ6317OCrRU0RYZvSqXh7sdIUoPnDhJJDDM5iwxPsTZhx38Tp3UBu6wBJqSTb10aqrY4xnzkW9pRAbrfUP1PJCcfI8mZUVciKxPxSnCKq6Hb5lGB1iXQpo0zcm2+POSvkhmrwuvwAv4ReYiKv+vrLrelrozobrL1qdEedupILd9jbEv1XezU1f4UzSIArzPRHFf++WR4Pz5SAyzA8xPflLaS379OnS9KlDNS9B7zbJTl8XhFVytyUXNqGKJngi9m93XZ8wSdz3A9ISNL7LlvMP46U60muEqzuZnvmwImwLVs+jWLXS6f39qcxhEBNUPFzOu5m5c7bkMdSFDcK32OhBWo45BYQCMiSHli7bmgTVyrm2504/+8NiZgZm+oScOn8rM0B9x2mdZaFUUJDd2uRCscWJCpmdpC+CgTfVpc4j96zZ7XZuEm3zVA+dvaxLDDB2VqK8lvuJju1699oqTPsOYNnarja4G1YUUrSNSN+r8YfnLZ6VfhR8TuYrju6fA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee3ad3e-dddc-4589-6259-08d83ac6d44e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 11:41:31.5276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lebaBbaC9g9FEgoCbpJhUY8Rq37eou+mddirB1jULGc5+5zl0RMcnHnViVPH5IfPAMu5kbtLmZ3EdPQXsMc1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4839
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] syscalls/{send|recv}mmsg: add a test case for
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
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  68 ++++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 231 ++++++++++++++++++
 4 files changed, 286 insertions(+), 15 deletions(-)
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
index 000000000..d7501beef
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
@@ -0,0 +1,231 @@
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
+		snd_msgvec = tst_get_bad_addr(cleanup);
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
+		rcv_msgvec = tst_get_bad_addr(cleanup);
+	else
+		rcv_msgvec = rcv_msg;
+
+	if (tc->ttype == BAD_TS_ADDR)
+		timeout = tst_get_bad_addr(cleanup);
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
