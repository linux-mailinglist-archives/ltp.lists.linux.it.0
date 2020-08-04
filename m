Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 985B123CAB5
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66DC93C3284
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4B9BE3C254F
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:41:05 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30094.outbound.protection.outlook.com [40.107.3.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 761DF140162A
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:41:04 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A141TX+Ack26TPwurYXSwYBkEdkmFoW/MSJlDY6Oup4IeZwZDaQWnywEBlvMRHVC2kal0ew7OB9pw3ywgMZzK5LUl3mfhZUZhrz1Nd9obaJYRSMCE+BYZigyP6T5OZoxGtVkcDEjsuvqdWK3Cr4Dldln3fU6Ew5he88d+iXCM+MfsN4xjPeAaRfq2ERqkxabVMSQlt5EVnenzWYlPbLVcRgjd10uXKXJ4yJtySZl8GEWDxRfqju9W/6dcECfL2gTNUo3JS/Rj7NUChCR8CvqLPj7l0CvEucpsUWAwsH1JePO11osvZREhmVtFw394yavqID771zIov5fIsSnGDLsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+fGb8AeuMxOF/I75DNVd9f5RnHUMBMmykpU36zWp40=;
 b=UUEAuUaHIWV5uhuudM4gDXHF1/dx4BbYQvOsD2Ewzp7ux5bk2yN5GnnUKmrceGURjgZ9D1AgiwGZFBvFkap7Jrxal1zhG8FVGXbVemA31hNC/mQFC71nWC6MqzzR+uGSMM59JehSq4Oel9YWuF02RWaA8ZkkEcl5VUyO1gwV4vY417OBY5loMfAkYIsccr7K9R3g5dw5yb8WeKXQDixEU6avSKj2QUxWhkXJsAQr4es2kwx7YVmkd7fPMu2mgX3g3kiDGAe82fHMGArtE+w+lB8mTH6UPPrQQdSwNYUNhK0wTOkNh1O44pLDIH8IyU4zXrE/RQX5CaLYpP/+rZKwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+fGb8AeuMxOF/I75DNVd9f5RnHUMBMmykpU36zWp40=;
 b=CXNmWDvCpcZBKOCWTkG+DrUZwUpemBLc7rMHfhLPVYRhdkEPp2lclNO5G24ZTqM9CypCq658jcluy1opi+QEqTq4Hhnz1C4jJgKkitgO94nFwgh/haLJ86fynIVVnDUxpWI8bS+nPWNqsefiBJ7IvnNjJtaM+K2azPDLKUOi5VU=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM7PR03MB6673.eurprd03.prod.outlook.com (2603:10a6:20b:1b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 14:41:03 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 14:41:03 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 16:40:45 +0200
Message-Id: <20200804144045.18875-4-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804144045.18875-1-Filip.Bozuta@syrmia.com>
References: <20200804144045.18875-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::36) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.237) by
 LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.22 via Frontend Transport; Tue, 4 Aug 2020 14:41:02 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e51208bc-d104-47b5-bd32-08d838846951
X-MS-TrafficTypeDiagnostic: AM7PR03MB6673:
X-Microsoft-Antispam-PRVS: <AM7PR03MB6673289515E03B7C6997D2A8EB4A0@AM7PR03MB6673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEP3TVHf5Skp8sH8B4SEOiqj2SEcL8o6Eas0qkHsc9xlrGdDe0MpZG3RJAq3fQFFaL9HiggQoUaWjwxsdbThz5jVCanOwqQ1gxqmHFr+hoKrMcus9HNOA0HkZfWd1Jntu0akUB/6t6c/7oKh2Bm3xMZTKY2rhe0b39iUFSKSEEG+svDVO3H01G1GbuZlHj9Tef3YiPuLCxLscM75GRBvmvvLuECzo7WLV8ko3fZesW9P2ueWCMaERM8Mv1CJi9UHFq3E7s+Wi/q2Hs8qgbYUue3HoHO+uiGdRtjUo6fikiuS4WDfTkplicTujh4H4LTs/VASlvt/J3M3UNPd4IimghWuyLDN1HL0g5SPvamUIfiTwMo1JPJf5bIQx2uDoGKD59tojmXt6j0cbLl6Il6olI0Itt0QTwwHgpeDipZOihPQg3tg7Me4eRDb9oQpLuhq1KzewK0cqPZi2+NRlSHZdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(366004)(39830400003)(346002)(508600001)(36756003)(16526019)(26005)(186003)(6512007)(966005)(316002)(52116002)(5660300002)(86362001)(6506007)(1076003)(6486002)(8936002)(66476007)(66556008)(956004)(2616005)(6666004)(83380400001)(30864003)(66946007)(2906002)(6916009)(69590400007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: EzT5Q8BHxVY5T/vHchkiTyakB7hp6hCj8zinEiihNm7HpnB80wXvHpaa/NsNKyKvxwEbH6caeZyISFwbfxbZ05Hb7dL38JIm/v8b7usp+aqcSsOZpIrUxFCbCCCJlhFv0iQY4StHbHGUA/TkFnwl7ExVETGKON1IpWuaYMjDnds47IrX6mACdyV43GcNA1DAx8Xt+//VAeYqLA9OOmUigKLj4fDtT+AHST1BvhptT9SZdmISV8ZGwLlb5y6h2ojj6D5zF995ZCO1yTP8H2VJlnNHIlDDdEacTeh0LqXrEqBzVZoHhd94/tJkVoN04FJjWEhBMGqOXHzs/12iXAqe1guq4gbadANaj+DBWAuVRe80P9PE4XsqtgnsjlsxdUN937SSjuh5IXyEAD6ZwlYJSGhlqcgFrPySi4wXqEt58Jhi0QpzpkPZPyxv4rzDW2AceRDDZMZzAFdtYDuR3vq1VTGdh50NqP01tdLlVJH8Pq3hHrwojxucOyYbI+nNxEuJriix7N0RdfqB23JdCfIzJ9wlsYeRO5urEpHruy8QZndPKzpxb7G/patYjB32j22kCefmPgXYfBUO8jyG1Zh6WfLEqSdbj0Pz/mzvsWhHqQ8rZxB+W0TKfjphgsDjCD9XNwQosm+ueheOU3dlIAsRoA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51208bc-d104-47b5-bd32-08d838846951
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 14:41:03.1225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMW1DEoZA9aRBlMgKRAEpWp81zSdti3++xk1VM+UAen3Kf3cNzLbpMolXc5rn+JemwAejcmlBT+MrQOkl/+WpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6673
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: [LTP] [PATCH 3/3] syscalls/{send|recv}mmsg: add a test case for
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
This test file is meant to check whether the aproppriate errno is set in some
sitautions when these syscalls fail. These situations include: bad socket
file descriptor (EBADF), bad message vector address (EFAULT), bad
timeout value (EINVAL), bad timeout address (EFAULT).

Implementation notes:

    The existing pattern for test type was copied from 'clock_nanosleep()'
    test. This was added to create two test types in the existing test:
    NORMAL for the already existing test case and TIMEOUT for the newly
    added timeout case.

    This pattern is also used in the new second test to set the aproppriate
    arguments and expected return values and errnos.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     |  69 ++++--
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     | 223 ++++++++++++++++++
 4 files changed, 279 insertions(+), 15 deletions(-)
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
index 54febf661..106263f70 100644
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
 
@@ -79,10 +112,15 @@ static void run(void)
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
+		if (TST_RET == 1)
+			tst_res(TPASS, "Timeout successfully reached before second message");
+	}
 }
 
 static void setup(void)
@@ -128,7 +166,8 @@ static void cleanup(void)
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
index 000000000..8c63038a5
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
@@ -0,0 +1,223 @@
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
+static void do_test(unsigned int i)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
+	struct tst_ts timeout;
+
+	tst_res(TINFO, "case %s", tc->desc);
+
+	if (tc->ttype != BAD_SEND_FD)
+		tc->send_fd = send_sockfd;
+	if (tc->ttype != BAD_RECV_FD)
+		tc->recv_fd = receive_sockfd;
+
+	if (tc->ttype == BAD_SEND_MSGVEC)
+		TEST(tv->send(tc->send_fd, NULL, VLEN, 0));
+	else
+		TEST(tv->send(tc->send_fd, snd_msg, VLEN, 0));
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
+		snd_msg[1].msg_len != 6) {
+		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
+		return;
+	}
+
+	memset(rcv1->iov_base, 0, rcv1->iov_len);
+	memset(rcv2->iov_base, 0, rcv2->iov_len);
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, tc->tv_sec);
+	tst_ts_set_nsec(&timeout, tc->tv_nsec);
+
+	if (tc->ttype == BAD_RECV_MSGVEC)
+		TEST(tv->receive(tc->recv_fd, (void *)1, VLEN, 0, tst_ts_get(&timeout)));
+	else if (tc->ttype == BAD_TS_ADDR)
+		TEST(tv->receive(tc->recv_fd, rcv_msg, VLEN, 0, (void *)1));
+	else
+		TEST(tv->receive(tc->recv_fd, rcv_msg, VLEN, 0, tst_ts_get(&timeout)));
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
+static void cleanup(void)
+{
+	if (send_sockfd > 0)
+		SAFE_CLOSE(send_sockfd);
+	if (receive_sockfd > 0)
+		SAFE_CLOSE(receive_sockfd);
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
