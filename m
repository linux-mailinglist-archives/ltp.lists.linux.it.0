Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA403FB46B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18AF03C2C77
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CD3233C2BA4
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:52 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0175.outbound.protection.outlook.com [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 22289140044F
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:52 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFeMJiLIjlm2gmyiqyzBcHtPszjPo3JVRVUf2kV42Eoj5YiM4uphiT62TmzpVqO7psFAMOo+Ix5swg0Iw+rkKdMi1fOXE2U0Dok2n5G0SDDBQ1PbgcAolaxh1LOL09GVdnTcs7fwxM8HbnblC46SWfHluBTmIG5fsvGBY/jWOGLiBXkmpsbHQgPv85wMWFUOrdNgAmg/3gvh2S6tO/UCEhSFZ/moS7tqc+AG9DErezJN59VCcchpPX/YV37wwgv2EmvI7WFmptekeVnpK4NI2Gw0MVuFuj6aKi5P5IozCxBZ3D5YWN9zlypkMHY4Fj2I/+nydeRVT7clJie76MhN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r44Km29fmz0Rws3lYxMhDRb4UAZDwvlhVmYiaAybLnc=;
 b=conrjyySM4jRxouiasjIZopWwHcbql6XsWWT8IKxXSygL1D06O/IEwltRjMoKDszohELRhyvfHHD55XWlxiWS2M6qIKoH/nx7GE+S3hMUYW6fHHPI8o+B5i5vobcn/9Mc74hws3UEbO4lI+IAXqmKkzQbXdK2J6ojDJA2KA762W9zoMZFpos4kAheaJSO9ml3d9atr67bIEjHTXMWV2gTDY81JSUHIutrauv4m/mPRza8NHYtfzpLeDpRpfjoQkH1m7+V8hoKNRm4pe87Dr4mL5CHgesIKntPtlVKoJ6bWnSHw9sdmBLwRJO+wJKUIv+0nrEPswEFMZwana8wNpMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r44Km29fmz0Rws3lYxMhDRb4UAZDwvlhVmYiaAybLnc=;
 b=GnmYT/cSd9FEOCSMH07tH0pGOJiUl5QsqBKgLDdHizKWb1SP25v2ccgQZrKY22hJyL0/EOEg7ehdGbOAoX3d/8Oz12j78XRKvsH+DOSLimon3B3GIyRchNhsvDTy8BO3oAQvkmecUobiF/+l64RpNAfd+FqXHhpBEYdx0S2RuYfKo+PVAws2ngfLPQyH33YHMaJL8+kzBMS+sQVjTuaYZ+8D7VAVTpKf+wbthMYZwLCVxoL0kE2E9rKaYMFgCPEFn6PsSHXPeJFa4RpATb4hYv+GscU0eKh0IPJ+r2ncCluFav0F+iUTTqJaMqpx5j4N5vgPFFO8wSta4w8YGBQaLg==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0888.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 11:16:47 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 11:16:47 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Mon, 30 Aug 2021 19:16:37 +0800
Message-ID: <OSZP286MB087162F01AEBEB096D291779CCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111638.66371-1-ziyaoxie@outlook.com>
References: <20210830111638.66371-1-ziyaoxie@outlook.com>
X-TMN: [IH7U7jatHFvtGAUW7tmZZXd++nnfJPAV]
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210830111638.66371-3-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.239) by
 HK2PR04CA0078.apcprd04.prod.outlook.com (2603:1096:202:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 11:16:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baab1909-8de6-4aee-4d7b-08d96ba7a84d
X-MS-TrafficTypeDiagnostic: OSZP286MB0888:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXc8S7QQq2Y4/qBCIMzsgiKq2NCo/cLXRWWZjtet9ynN9Tx4KXHVvysz5SBPmzJ5qqXztMHAmydrbs3MZpR9kg17wOVMFlVm7Eoi7Yc15/h6MRgXcXGBNfydNKrdySkfByUcj/5nF+TOpbNcqzbsGp/X6sypEsyz+BZHVE5hwpP4L4yP1devmfd4AUJV4eH0ZfdOfGIk3uplgongrDNaFn47Q5jPNEk6LXJpRCyt9YL50eHbW1JFTZBMDgdzf/8bF08XPNjN4oQGBFoSRL7qwxA39Gt7eJ2oEJ6CyjtncrW6twjrcfj74A7jIaoKHTEWWxaXn0oVOwrYFn+ZGKubBmD6Nz0MUoEMmWpK+lphpWUpDBIxxH4QgfS7K1t3fgd/uSsxwP3Q4e9icrSS3awwe004i73k+9Pt1Ys/pIRaU9nyBmka4233ydy2sXtzGi6y
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o+ipdZciEPOEqWgSzi2NIim+kQ0TdOx5XuLjffCA9tGvxkg259D/HVW1JXjlnExE9JbOatf4BZVfYFr1qrG0mxSYXsybVrNtBkLm7wjB4IdUJVxIzx5SVjaeU02UhLCZobEjORCBNZxYu0UPHDMwYg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baab1909-8de6-4aee-4d7b-08d96ba7a84d
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 11:16:47.8378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0888
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] epoll_ctl: Add test for epoll_ctl05
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

Verify that epoll_ctl() fails with ELOOP if fd refers to an epoll
instance and this EPOLL_CTL_ADD operation would result in a circular
loop of epoll instances monitoring one another.

Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_ctl/.gitignore      |  1 +
 .../kernel/syscalls/epoll_ctl/epoll_ctl05.c   | 71 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 100ca932f..4c6b75dfa 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -166,6 +166,7 @@ epoll_ctl01 epoll_ctl01
 epoll_ctl02 epoll_ctl02
 epoll_ctl03 epoll_ctl03
 epoll_ctl04 epoll_ctl04
+epoll_ctl05 epoll_ctl05
 epoll_wait01 epoll_wait01
 epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
diff --git a/testcases/kernel/syscalls/epoll_ctl/.gitignore b/testcases/kernel/syscalls/epoll_ctl/.gitignore
index f78db4002..3e05f2e1f 100644
--- a/testcases/kernel/syscalls/epoll_ctl/.gitignore
+++ b/testcases/kernel/syscalls/epoll_ctl/.gitignore
@@ -2,3 +2,4 @@ epoll_ctl01
 epoll_ctl02
 epoll_ctl03
 epoll_ctl04
+epoll_ctl05
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl05.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl05.c
new file mode 100644
index 000000000..d03009cf3
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl05.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2021
+ * Author: Xie Ziyao <ziyaoxie@outlook.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that epoll_ctl() fails with ELOOP if fd refers to an epoll instance
+ * and this EPOLL_CTL_ADD operation would result in a circular loop of epoll
+ * instances monitoring one another.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+
+#define MAX_DEPTH 5
+
+static int epfd, origin_epfd, new_epfd;
+static int fd[2];
+
+static struct epoll_event events = {.events = EPOLLIN};
+
+static void setup(void)
+{
+	int i;
+
+	SAFE_PIPE(fd);
+
+	for (i = 0, epfd = fd[0]; i < MAX_DEPTH; i++, epfd = new_epfd) {
+		new_epfd = epoll_create(1);
+		if (new_epfd == -1)
+			tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+		if (i == 0)
+			origin_epfd = new_epfd;
+
+		events.data.fd = epfd;
+		if (epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events))
+			tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+	}
+
+	events.data.fd = fd[0];
+	if (epoll_ctl(origin_epfd, EPOLL_CTL_DEL, fd[0], &events))
+		tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_DEL, ...)");
+}
+
+static void cleanup(void)
+{
+	if (fd[0])
+		SAFE_CLOSE(fd[0]);
+
+	if (fd[1])
+		SAFE_CLOSE(fd[1]);
+}
+
+static void verify_epoll_ctl(void)
+{
+	events.data.fd = epfd;
+	TST_EXP_FAIL(epoll_ctl(origin_epfd, EPOLL_CTL_ADD, epfd, &events),
+		     ELOOP, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_epoll_ctl,
+};
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
