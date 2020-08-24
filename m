Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA92501D9
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:16:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C4DB3C56C8
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 18:16:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 230E63C2EE2
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:16:20 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1DCE4200AE1
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:16:19 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItTlmy3sG08V7wCEAeb1RTNMbjqEYdcND+BHj2ygZbICqsNy63nXOtkizbNtEhqfw9MWHiKvhZGCOX3EbOoNzvOc9rp/0mKWfNCMZg1r4J0RGDGesQkRhUdhv35WWAM+YnP2i4MFI3upjiTHIjWK8c6s605gM3hVjdtzTh4ZibS6mDx1PInqGy0ALvOQGLWZWXX6wKpVo1j1unVCAhK7ayXQd/SpaocRlJVTWhTwzvUlPDf//CD/XncT5kl6adWqwFwYIjKyFDakViepYgKeuEkswXliqWLNsFLt9TjcEqPaZnLruAWVlDUOuVjd1wPDOlvLCk4tCJKirtajNRacZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttfkbk0DSQkC/+EMhJ9b9b8AkDkaWAyGmZGF7ql8WQI=;
 b=JzaIVi+GSVk8IH8lBEQdlL7tbY0BYKO34AN1qXuXwOuRFIV22YqOcVTZW/mpgCvS1+4dl7SIvKeJNHOPEf0315KEcZjH8CsU1bVBVQFlIwe9bi2kLFlA8W/NxuBXO0q8hQVWfpR6Nq2oYoqqEblWfqndwZK69+xfVZSl+GWx0a5wXQ8j/73iEV69/+5RKFph5OxsBdCslzDY81Xk29cGHEQUVmg+TUW+QDDnqOVkd6tPDR0OId0CNBM7OUX9UOmIMQvniQsbC/wAcnveyj+N/mXYMJE5BkaDCFRNpxjlzbFcnOsR2ZZ5AATqup/OgQOmH6KlLWkVZXrz3feA7hgaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttfkbk0DSQkC/+EMhJ9b9b8AkDkaWAyGmZGF7ql8WQI=;
 b=SJ73AytDO/2z6eLC7CcA3PM6Xc3SynfMQLxLPAf3jAFcNBQEl9up/GjHWIPQo65R+uXiZqJN7UKLF5Ht+5sbDIXCKuN2IqOSbUSKpY6ASUzf29fjLE1kQzKxPJo2kWPTbWUoAAt69fHeGIBHK5CLF7msQajadgpe+PbvxiNf3bU=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VI1PR03MB5055.eurprd03.prod.outlook.com (2603:10a6:803:c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 16:16:17 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Mon, 24 Aug 2020
 16:16:17 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Mon, 24 Aug 2020 18:15:38 +0200
Message-Id: <20200824161538.53815-2-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824161538.53815-1-Filip.Bozuta@syrmia.com>
References: <20200824161538.53815-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.235) by
 AM4PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:200:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 16:16:16 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.235]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a30a55f-eaad-4d7e-4c18-08d84849074b
X-MS-TrafficTypeDiagnostic: VI1PR03MB5055:
X-Microsoft-Antispam-PRVS: <VI1PR03MB5055DFD17CF635DFC4E2BC70EB560@VI1PR03MB5055.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yW5Ps5qtgxRDeBUpQ0EKZcJD75bTNIryCLrK1JZLYZMzsxsabDE44XSIttxjyC/cIm9oacJ5p80zPfH9Qkwvq43c+oiGzs2APOoW5C0yZp+nNTKwF2arQNrr5yxkjItsI6RtuXu0130TmhgWq6p1mTkaevAWbOenZFqrIQUb5Wj0r+hcX+0a3byV3zodcT+M+L0vYUhpZG0lqRhirQXw1MDHBu0svMtlwJJzbmORNACkiXz/42XQnHZLthmTn/iLpRbbwde3R+N6kWV9ZAKp5Z8/MbjvQ+Z5aUOZCF8VLiBNctoCbTV05r/REdq+Hhz0JOZIs8zCX5HjjSEnsFVbTMKWcTeR4aBm9UuV/Fhd/cb9GzlwD55Sjv4BjGmrf+QIbPaY1Vgku7SLEEQZEg2V8AiJw55UHeHx7QzOFcf6xFhOe/427THm/Kkwwzx2eW+GiLJCrjqwvy3QLBTGZf8taA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39830400003)(346002)(376002)(396003)(52116002)(1076003)(6506007)(5660300002)(8936002)(69590400007)(26005)(16526019)(36756003)(186003)(8676002)(6916009)(956004)(66556008)(966005)(66476007)(478600001)(2906002)(86362001)(6486002)(6512007)(83380400001)(2616005)(66946007)(4326008)(30864003)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: +vOO/IE0tyVRq+/11EI7HnZZQR1LQvb/kTOakBWyU90Ow7M7cEtq52HOKNjmXfXaPcnQ4Tet1wRARuApg8/IDoLlRsqQYRpBbvex5Cfqg9Dtud5v0sU2TWWaQYN9oYPatfSd2gQ9sX1nfJEanyuwPn95Nl+y0eLK/vj8VMVfNVdBPru0OeFDyQ3ZvPRb4S7dZUiSm/y6W0leUZpb1tnUxvvbWxViC/RWKDmZjmMlH236uP51f4Y+CJB+1xNSAslkjKYxzcUtNtiaEg+5m1przgWK8shb5qvyPne5HSS0iP2jVZSBtw7TfqzSsYWku83fMEmRxX4qofI+uwrdap7py0Uu5g9gEWB8gIu1HUMbXR2uDzCE17djKxQJtWunjAPlu8fBIdHRLYry1MX0rpxrRPrzfxvRh5pxqV+SUcK43s5JW9vS9cwTqw2xIMSiO6QRBUmLxJsFTLkBYt1iNS9UKRnGd3hJUuOL7Fs7AN6ZmfEbVN6YvOo83V1b5Fvp8k06szjp7I7n9VuqLD38xiOQ3V54Fzgt9khWSWlE4HsT8uYJhUv9zExcly2A2kFqWprmU3lfV+A3Wl63hG8OHjfNYL+3aNHIEuA2XGhWyEmfmTzc4pWUGtr/9HmtGFAMaxpNrq0RtKw0VSUIy+pp4R8f1A==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a30a55f-eaad-4d7e-4c18-08d84849074b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 16:16:16.9430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBNnh+3o0gYwF6xdFYn3zOrxq24C4ZYqXevaOVoh0fGL5MFf5G4TyCZpk33UcoXmzwAaftVENPvgbCrVinlAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5055
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] syscalls/{send|recv}mmsg: add a test case for
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

This patch introduces new test files for these syscalls (sendmmsg02.c and
recvmmsg01.c). This test file is meant to check whether the aproppriate
errno is set in some sitautions when these syscalls fail. These situations
include: bad socket file descriptor (EBADF), bad message vector address
(EFAULT), bad timeout value (EINVAL), bad timeout address (EFAULT).

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/recvmmsg/Makefile   |   7 +
 .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 127 +++++++++++++++
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  87 ++++++++++
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 150 +++++++-----------
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  80 ++++++++++
 7 files changed, 362 insertions(+), 93 deletions(-)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
 create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index c2bfc6df3..c8bd1a2c1 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1060,6 +1060,8 @@ recvmsg01 recvmsg01
 recvmsg02 recvmsg02
 recvmsg03 recvmsg03
 
+recvmmsg01 recvmmsg01
+
 remap_file_pages01 remap_file_pages01
 remap_file_pages02 remap_file_pages02
 
@@ -1200,6 +1202,7 @@ sendmsg02 sendmsg02
 sendmsg03 sendmsg03
 
 sendmmsg01 sendmmsg01
+sendmmsg02 sendmmsg02
 
 sendto01 sendto01
 sendto02 sendto02
diff --git a/testcases/kernel/syscalls/recvmmsg/Makefile b/testcases/kernel/syscalls/recvmmsg/Makefile
new file mode 100644
index 000000000..18896b6f2
--- /dev/null
+++ b/testcases/kernel/syscalls/recvmmsg/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
new file mode 100644
index 000000000..b77b6c8eb
--- /dev/null
+++ b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* test status of errors:
+ *
+ * EBADF            v ('Bad socket file descriptor')
+ * EFAULT           v ('Bad message vector address')
+ * EINVAL           v ('Bad seconds value for the timeout argument')
+ * EINVAL           v ('Bad nanoseconds value for the timeout argument')
+ * EFAULT           v ('Bad timeout address')
+ */
+
+#define _GNU_SOURCE
+#include "../sendmmsg/sendmmsg.h"
+
+static struct tst_ts ts;
+
+enum test_type {
+	BAD_FD,
+	BAD_MSGVEC,
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
+	int fd;
+	long tv_sec;
+	long tv_nsec;
+	int exp_errno;
+};
+
+static struct test_case tcase[] = {
+	{
+		TYPE_NAME(BAD_FD),
+		.fd = -1,
+		.exp_errno = EBADF,
+	},
+	{
+		TYPE_NAME(BAD_MSGVEC),
+		.exp_errno = EFAULT,
+	},
+	{
+		TYPE_NAME(BAD_TS_VALUE_1),
+		.tv_sec = -1,
+		.tv_nsec = 0,
+		.exp_errno = EINVAL,
+	},
+	{
+		TYPE_NAME(BAD_TS_VALUE_2),
+		.tv_sec = 1,
+		.tv_nsec = 1000000001,
+		.exp_errno = EINVAL,
+	},
+	{
+		TYPE_NAME(BAD_TS_ADDR),
+		.exp_errno = EFAULT,
+	}
+};
+
+static void do_test(unsigned int i)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
+	void *rcv_msgvec, *timeout;
+
+	tst_res(TINFO, "case %s", tc->desc);
+
+	if (tc->ttype != BAD_FD)
+		tc->fd = receive_sockfd;
+
+	TEST(tv->send(send_sockfd, snd_msg, VLEN, 0));
+
+	if (TST_RET != VLEN || snd_msg[0].msg_len != 6 ||
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
+	if (tc->ttype == BAD_MSGVEC)
+		rcv_msgvec = bad_addr;
+	else
+		rcv_msgvec = rcv_msg;
+
+	if (tc->ttype == BAD_TS_ADDR)
+		timeout = bad_addr;
+	else
+		timeout = tst_ts_get(&ts);
+
+	TEST(tv->receive(tc->fd, rcv_msgvec, VLEN, 0, timeout));
+
+	if (TST_RET < 0) {
+		if (tc->exp_errno == errno)
+			tst_res(TPASS | TERRNO, "receivemmsg() failed successfully");
+		else
+			tst_res(TFAIL | TERRNO, "receivemmsg() failed unexpectedly");
+	} else {
+		tst_res(TFAIL | TERRNO, "receivemmsg() succeded unexpectedly");
+	}
+}
+
+static struct tst_test test = {
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(tcase),
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
diff --git a/testcases/kernel/syscalls/sendmmsg/.gitignore b/testcases/kernel/syscalls/sendmmsg/.gitignore
index b703ececd..42693c44d 100644
--- a/testcases/kernel/syscalls/sendmmsg/.gitignore
+++ b/testcases/kernel/syscalls/sendmmsg/.gitignore
@@ -1 +1,2 @@
 sendmmsg01
+sendmmsg02
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg.h b/testcases/kernel/syscalls/sendmmsg/sendmmsg.h
new file mode 100644
index 000000000..69c370ba8
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
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
+static void *bad_addr;
+
+#define TYPE_NAME(x) .ttype = x, .desc = #x
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
+	bad_addr = tst_get_bad_addr(NULL);
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
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 54febf661..b1629adfd 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -5,52 +5,49 @@
  */
 
 #define _GNU_SOURCE
-#include <netinet/ip.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/types.h>
-
-#include "tst_test.h"
-#include "lapi/socket.h"
-#include "tst_safe_macros.h"
-#include "sendmmsg_var.h"
-
-#define BUFSIZE 16
-#define VLEN 2
-
-static int send_sockfd;
-static int receive_sockfd;
-static struct mmsghdr *snd_msg, *rcv_msg;
-static struct iovec *snd1, *snd2, *rcv1, *rcv2;
-
-static struct test_variants {
-	int (*receive)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		       unsigned int flags, void *timeout);
-	int (*send)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		    unsigned int flags);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .receive = libc_recvmmsg, .send = libc_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-
-#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
-	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
-#endif
-
-#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .receive = sys_recvmmsg64, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
-#endif
+#include "sendmmsg.h"
+
+static struct tst_ts ts;
+
+enum test_type {
+	NORMAL,
+	TIMEOUT,
+};
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
+		.tv_nsec = 0,
+		.exp_ret = 1,
+	},
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
@@ -59,18 +56,18 @@ static void run(void)
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
 
@@ -79,56 +76,23 @@ static void run(void)
 	else
 		tst_res(TPASS, "First message received successfully");
 
-	if (memcmp(rcv2->iov_base, "three", 5))
-		tst_res(TFAIL, "Error in second received message");
-	else
-		tst_res(TPASS, "Second message received successfully");
-}
-
-static void setup(void)
-{
-	struct sockaddr_in addr;
-	unsigned int port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM);
-
-	send_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
-	receive_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
-
-	addr.sin_family = AF_INET;
-	addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
-	addr.sin_port = port;
-
-	SAFE_BIND(receive_sockfd, (struct sockaddr *)&addr, sizeof(addr));
-	SAFE_CONNECT(send_sockfd, (struct sockaddr *)&addr, sizeof(addr));
-
-	memcpy(snd1[0].iov_base, "one", snd1[0].iov_len);
-	memcpy(snd1[1].iov_base, "two", snd1[1].iov_len);
-	memcpy(snd2->iov_base, "three3", snd2->iov_len);
-
-	memset(snd_msg, 0, VLEN * sizeof(*snd_msg));
-	snd_msg[0].msg_hdr.msg_iov = snd1;
-	snd_msg[0].msg_hdr.msg_iovlen = 2;
-	snd_msg[1].msg_hdr.msg_iov = snd2;
-	snd_msg[1].msg_hdr.msg_iovlen = 1;
-
-	memset(rcv_msg, 0, VLEN * sizeof(*rcv_msg));
-	rcv_msg[0].msg_hdr.msg_iov = rcv1;
-	rcv_msg[0].msg_hdr.msg_iovlen = 1;
-	rcv_msg[1].msg_hdr.msg_iov = rcv2;
-	rcv_msg[1].msg_hdr.msg_iovlen = 1;
-
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
-}
-
-static void cleanup(void)
-{
-	if (send_sockfd > 0)
-		SAFE_CLOSE(send_sockfd);
-	if (receive_sockfd > 0)
-		SAFE_CLOSE(receive_sockfd);
+	if (tc->ttype == NORMAL) {
+		if (memcmp(rcv2->iov_base, "three", 5))
+			tst_res(TFAIL, "Error in second received message");
+		else
+			tst_res(TPASS, "Second message received successfully");
+	} else {
+		TEST(tv->receive(receive_sockfd, rcv_msg, 1, 0, NULL));
+		if (TST_RET != 1 || memcmp(rcv1->iov_base, "three", 5))
+			tst_res(TFAIL, "Error in second message after the timeout");
+		else
+			tst_res(TPASS, "Timeout successfully reached before second message");
+	}
 }
 
 static struct tst_test test = {
-	.test_all = run,
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(tcase),
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_variants = ARRAY_SIZE(variants),
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
new file mode 100644
index 000000000..59fb8289b
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* test status of errors:
+ *
+ * EBADF            v ('Bad socket file descriptor')
+ * EFAULT           v ('Bad message vector address')
+ */
+
+#define _GNU_SOURCE
+#include "sendmmsg.h"
+
+enum test_type {
+	BAD_FD,
+	BAD_MSGVEC,
+};
+
+#define TYPE_NAME(x) .ttype = x, .desc = #x
+
+struct test_case {
+	int ttype;
+	const char *desc;
+	int fd;
+	int exp_errno;
+};
+
+static struct test_case tcase[] = {
+	{
+		TYPE_NAME(BAD_FD),
+		.fd = -1,
+		.exp_errno = EBADF,
+	},
+	{
+		TYPE_NAME(BAD_MSGVEC),
+		.exp_errno = EFAULT,
+	},
+};
+
+static void do_test(unsigned int i)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
+	void *snd_msgvec;
+
+	tst_res(TINFO, "case %s", tc->desc);
+
+	if (tc->ttype != BAD_FD)
+		tc->fd = send_sockfd;
+
+	if (tc->ttype == BAD_MSGVEC)
+		snd_msgvec = bad_addr;
+	else
+		snd_msgvec = snd_msg;
+
+	TEST(tv->send(tc->fd, snd_msgvec, VLEN, 0));
+
+	if (TST_RET < 0)
+		if (tc->exp_errno != TST_ERR)
+			tst_res(TFAIL | TERRNO, "sendmmsg() failed unexpectedly");
+		else
+			tst_res(TPASS | TERRNO, "sendmmg() failed successfully");
+	else
+		tst_res(TFAIL, "sendmmsg() succeded unexpectedly");
+}
+
+static struct tst_test test = {
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(tcase),
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
