Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBA2D90F5
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:48:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FD313C5ABB
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Dec 2020 23:48:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A10233C176A
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:47:48 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EA1D410009BA
 for <ltp@lists.linux.it>; Sun, 13 Dec 2020 23:47:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsJ9ynpE4tewIXif4FAopmzZrIDEUsRfD6feHVpiUv9DNjEdICKE9R1O9EoC58MDQE9EqEYY9uELgFYzI0TXf1AgHllTkuaYiFzNQWqpNac+mvGWIqtw/9IrdTGV+n/8y0qmd+acXKLbMWxMVTtlRaIUJCbrZSxjXJi1moAOuJaVkzuhJZJUL3ZSajlDwYS9XTNSYJm4bsUnhtZV1eWeLYp5ofnCFUiFJHUmVB9Pao04eyEGj+4LUItWeXced3liIU5fmUg93YB3rywd/y+YVjNseBMNfe7sqBD0huri2ooFnHQmqQoHluDjiGbghp3D2Scv6Mef/ju/EaFohVKznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb1+/bh2iMmz83XqznIQQdMWQoAx2lm+RaSMNMLf/0c=;
 b=ZczyDQyVQFrXZQqz5Q6pL0AiVjzJkXEn3tduJsO5ICjZhReOCYseOIE2yfJ4hlIHOWRAEJqIimlsAcW00WrhGR64KWGg8khh8DepI3bbEEGhcqGXlIt9lnJecl1227W9hiGA5fijq4Oi75EZDQKBK4P7c9A8bEJX+Xx4+vyz2lIQt6cdx93w46zuEb8FlDb0RYsQ4kYLTvYrKkrGM4sddJey0RKfhGBUO7oOXbd1qH12hKScYQBUUaU+ChqJ0Hkd3ilstKwXZWjjU84FhffaTHdlpOuqYouVQeBzuKDhru5ZbY++RcVwVX7OGIzUme+kXGMe59hLKHYIOx3cQGINEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb1+/bh2iMmz83XqznIQQdMWQoAx2lm+RaSMNMLf/0c=;
 b=nRBUsIpb7D+Kiiu1MRzsA5TM7BCB5eEH0ml2YNtt7IqKdLPkZlbUMxy7a+cnu+a7xaK/YLQMiCb6K/P9VYq9+gzs6VKRxa1Ra9YpRcrb22XCof6oBq7EOsreCcXKAGTgLtIXgXlax9+ThZbAvwiIl0Ok6DjbpevD9eZnpQ1PIO8=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AS8PR03MB7496.eurprd03.prod.outlook.com (2603:10a6:20b:2b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Sun, 13 Dec
 2020 22:47:46 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::d897:6156:b3c7:114a%4]) with mapi id 15.20.3654.024; Sun, 13 Dec 2020
 22:47:46 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Sun, 13 Dec 2020 23:47:29 +0100
Message-Id: <20201213224729.17974-2-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213224729.17974-1-Filip.Bozuta@syrmia.com>
References: <20201213224729.17974-1-Filip.Bozuta@syrmia.com>
X-Originating-IP: [62.240.24.119]
X-ClientProxiedBy: VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bozuta-TUF-Gaming-FA506II-FA506II.cable.vektor.net
 (62.240.24.119) by VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Sun, 13 Dec 2020 22:47:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70ae8232-23b8-4ac1-63c6-08d89fb91c15
X-MS-TrafficTypeDiagnostic: AS8PR03MB7496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR03MB7496E9700E3F46784E0A4053EBC80@AS8PR03MB7496.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aA1LipVa1rm2oSonzsV/pDNj0+GHAorPhReiiBzRPKXxtXtHzRr4zm9lhAsnrNmMpqJ+XgxW5ykHBhC4/alcLT0z7iCASDIx4CNF/hUXqoSSZ9TiuFd+s831wpNEfY6CnLOF9oLxYGouh8CvUxTreV49gWADF4+GuQjqSU6NcbouLfgfIfTzlV20WLEuEmG/mazb5NF0GXePnP4q8kYWj5jPF/Oe7uVLZ5Bli1qjhFhePVJvOOjakVG5lPE7aTaBEYHYBv0opxON/U7uJwHHxvHNgthgka3OYRNTJJCWbdW04bRebqHlhhXKhU89sEg+HdkPavFUSvck7RwpkC87stB8NoMHQ9/VkZ6KZ16Cm88EAkMdYQuolGHCM/3ihYZ3rhKBRgAMMAEB29xHiNMZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39830400003)(346002)(396003)(366004)(376002)(83380400001)(66476007)(66946007)(2906002)(966005)(478600001)(6666004)(6486002)(52116002)(316002)(86362001)(6512007)(8676002)(5660300002)(66556008)(6506007)(8936002)(1076003)(956004)(4326008)(2616005)(36756003)(26005)(30864003)(6916009)(16526019)(186003)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pUqqxuY6+zvlb3MRinRGLFNurMG9XwM8XWv+abgwFyc3++rMN29YZTECb3Io?=
 =?us-ascii?Q?MU/5qcGW0BTT/pcwchmsVT/qUDyaTV5vtT0ERgo1Ft8niYdOrUI36p8s0vfu?=
 =?us-ascii?Q?P3PGGP3+KFGXC6rGvOQr4kDZplU335mVYR9XArlu17JPYHEtF2P1QH1O50VD?=
 =?us-ascii?Q?a5tJA/jGSOcXEC7ie/xLwgxPTmES6OowbI/zYe+ATNEFt7grveCZ0UwzLS0a?=
 =?us-ascii?Q?JwYjWXVB2EQTNKyRO+l5jVaIP9oqVy1NFWY/FpjxXjZArFw8lVAVXDAjuwCz?=
 =?us-ascii?Q?6XCJf1ltR5ZA5cgms/BCObzBKnfbzpgKjUZo1YTmDSEHcH4qJBbvavwE3I13?=
 =?us-ascii?Q?h2kqTImube5aFLMHbNqKIQZOROaVcOuXx5PF/4WvL/Df6C3dp099BMhOGJEQ?=
 =?us-ascii?Q?v1D8xN3/Ohuzs8u7sTCb4s0qHrVLAlrLLx49FOc+GNBQ6djkF6wtiwQ/omx9?=
 =?us-ascii?Q?UvgnGgXQWSXbcFvHoGUc4gfvzJ+NGho9O58fokKdGPJ1FXX6A3BVkSaCnNv1?=
 =?us-ascii?Q?QBA/yl16nkg03A7FpvWH/2PRc2BVfmFj/K1Bab6G9XJ+3i8Yn6OYvwJdg0S8?=
 =?us-ascii?Q?9H2xQyB/Mnmw5eSBTBf4gfGYzPFh8noyUokXWTPoCsZ4hD/ItCT2pNn0X8UZ?=
 =?us-ascii?Q?OXD8SznK0YQ6AZ3vE+/POhtn11uw4/QuihfL3zhqk/d68BqFhjnaEUI4mdLl?=
 =?us-ascii?Q?F/QXuJX8uPi2/15ng1HxnO9Z8RavDXliuJozr+BCUkuLVYPtepuso4gRJMo5?=
 =?us-ascii?Q?M0ur1xLagkugJM6wAjbE8T5aCgB4ehXQHz6nao2aACmKxvW6cTrTR0YIkrwy?=
 =?us-ascii?Q?nGxlxC1f2pYh/Ih4+a+khqx78wEVdiO5CtAUY4B/a8sAsu7Ffw0Ga6valtOc?=
 =?us-ascii?Q?wH9UADJ+pzJTMl/55dIgE6T8jtYBnOUVaIeZ+fn4UTBWpvTRzlRiNJ2m4lfs?=
 =?us-ascii?Q?RsIdK6yXD7/KvZ6Ad6D7EEyL3NNzvgHmVQ/JGH4Zo70KFfs+zvmPBnP1AykS?=
 =?us-ascii?Q?phx8?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2020 22:47:46.1255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ae8232-23b8-4ac1-63c6-08d89fb91c15
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLQGUZ4Izl0F9y5/z8tvYUncdSGUr6948nIff4bKMW+hL7tWcyD8La2VYTWe/FFcjyz7Rs41Fbqzc0kadmol9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7496
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/1] syscalls/{send|recv}mmsg: add a test case for
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
Cc: Filip Bozuta <Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This patch introduces a test case for the already existing test for
syscalls 'sendmmsg()' and 'recvmmsg()' (sendmmsg01). This test
case is meant to check whether the timeout is reached aproppriately
after the first message is received. The timeout is set to 0 as to
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
 .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 146 ++++++++++++++++++
 testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
 testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  45 ++++++
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 111 ++++++-------
 .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  87 +++++++++++
 7 files changed, 347 insertions(+), 53 deletions(-)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
 create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
 create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 409800dbb..9c328697b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1072,6 +1072,8 @@ recvmsg01 recvmsg01
 recvmsg02 recvmsg02
 recvmsg03 recvmsg03
 
+recvmmsg01 recvmmsg01
+
 remap_file_pages01 remap_file_pages01
 remap_file_pages02 remap_file_pages02
 
@@ -1211,6 +1213,7 @@ sendmsg02 sendmsg02
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
index 000000000..b3204cc9a
--- /dev/null
+++ b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
@@ -0,0 +1,146 @@
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
+	struct time64_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
+	void *rcv_msgvec, *timeout;
+
+	tst_res(TINFO, "case %s", tc->desc);
+
+	if (tc->ttype != BAD_FD)
+		tc->fd = receive_sockfd;
+
+	TEST(tv->sendmmsg(send_sockfd, snd_msg, 1, 0));
+
+	if (TST_RET != 1) {
+		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
+		return;
+	}
+
+	memset(rcv1->iov_base, 0, rcv1->iov_len);
+	memset(rcv2->iov_base, 0, rcv2->iov_len);
+
+	ts.type = tv->ts_type;
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
+	TEST(tv->recvmmsg(tc->fd, rcv_msgvec, VLEN, 0, timeout));
+
+	if (TST_RET < 0) {
+		if (tc->exp_errno == errno)
+			tst_res(TPASS | TERRNO, "recvemmsg() failed successfully");
+		else
+			tst_res(TFAIL | TERRNO, "recvemmsg() failed unexpectedly");
+	} else {
+		tst_res(TFAIL | TERRNO, "recvemmsg() succeded unexpectedly");
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
+	bad_addr = tst_get_bad_addr(NULL);
+
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
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
index 000000000..68a9a4020
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <netinet/ip.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+
+#include "time64_variants.h"
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
+static struct time64_variants variants[] = {
+	{ .recvmmsg = libc_recvmmsg, .sendmmsg = libc_sendmmsg, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
+	{ .recvmmsg = sys_recvmmsg, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .recvmmsg = sys_recvmmsg64, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index d6a717687..ad26a7b4d 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -5,46 +5,48 @@
  */
 
 #define _GNU_SOURCE
-#include <netinet/ip.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/types.h>
-
-#include "time64_variants.h"
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
-static struct time64_variants variants[] = {
-	{ .recvmmsg = libc_recvmmsg, .sendmmsg = libc_sendmmsg, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
-
-#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
-	{ .recvmmsg = sys_recvmmsg, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
-#endif
-
-#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .recvmmsg = sys_recvmmsg64, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
-#endif
+
+#include "sendmmsg.h"
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
 };
 
-static void run(void)
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
+};
+
+static void do_test(unsigned int i)
 {
 	struct time64_variants *tv = &variants[tst_variant];
+	struct test_case *tc = &tcase[i];
 	struct tst_ts timeout;
-	int retval;
 
-	retval = tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0);
-	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
+	tst_res(TINFO, "case %s", tc->desc);
+
+	TEST(tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0));
+
+	if (TST_RET < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
 		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
 		return;
 	}
@@ -53,18 +55,18 @@ static void run(void)
 	memset(rcv2->iov_base, 0, rcv2->iov_len);
 
 	timeout.type = tv->ts_type;
-	tst_ts_set_sec(&timeout, 1);
-	tst_ts_set_nsec(&timeout, 0);
+	tst_ts_set_sec(&timeout, tc->tv_sec);
+	tst_ts_set_nsec(&timeout, tc->tv_nsec);
 
-	retval = tv->recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
+	TEST(tv->recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout)));
 
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
 
@@ -73,10 +75,18 @@ static void run(void)
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
+		TEST(tv->recvmmsg(receive_sockfd, rcv_msg, 1, 0, NULL));
+		if (TST_RET != 1 || memcmp(rcv1->iov_base, "three", 5))
+			tst_res(TFAIL, "Error in second message after the timeout");
+		else
+			tst_res(TPASS, "Timeout successfully reached before second message");
+	}
 }
 
 static void setup(void)
@@ -110,19 +120,14 @@ static void setup(void)
 	rcv_msg[1].msg_hdr.msg_iov = rcv2;
 	rcv_msg[1].msg_hdr.msg_iovlen = 1;
 
-	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
-}
+	bad_addr = tst_get_bad_addr(NULL);
 
-static void cleanup(void)
-{
-	if (send_sockfd > 0)
-		SAFE_CLOSE(send_sockfd);
-	if (receive_sockfd > 0)
-		SAFE_CLOSE(receive_sockfd);
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
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
index 000000000..8ed345b09
--- /dev/null
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
@@ -0,0 +1,87 @@
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
+	struct time64_variants *tv = &variants[tst_variant];
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
+	TEST(tv->sendmmsg(tc->fd, snd_msgvec, VLEN, 0));
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
+static void setup(void)
+{
+	send_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
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
