Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 551443FB46A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB51D3C2C7C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 13:17:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B0C53C2AE0
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:52 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0175.outbound.protection.outlook.com [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5FB5A140044F
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 13:16:51 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izs15XSARFBnsB1L7mfjqDmyp5C+TrK0M9i3KRN22c/yle/LLbbg9WJiELiMVD+KOe9inkLTSKD9mmOzsBOy38s52a9pqjkJ8MHC2QAoAmW6jM0fjM1XpXu9dgYwHLcUP2gclwq1RlgxLl7p54exFisGbpLQBZIOHq4hO4D6aUwXHYf/DilM+hdQmXxGQRTNYyNuDSRdwyLmo7hYnTeBhElU/G8Vl8W1s7OMPm+bKfx2Epp/ig9X1P5wGMDpygUvNhzgWkqebTOuoRZe+kHg6pICBnS9Qad+mCw7pz4srXqbKLV5gTjmPZIrAi+RuOiMZx9QwwgdUj0tbziCxUKdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/VjkScQD52H2qqRbAzicggWZY1bJPNjC+5Tk0Md/74=;
 b=T5Ufit59bfy3P9+XzSF6BYboLMVuG7xJvX6RkL6qE/1SlZFsz9v8pDr155JVRGGWpgQ9QFQSVpMk9jOI7ruP3lAcJjY+83VWpGaeOrkH/wB7D6ZQTrUo6zr4AeZZPpDC9JIXlW3CgfBnQTvAscSKvIuELHcyvk7/e7UYHgsJKrwzpoBPRw6LrYOj1qJrNLN1ntiEhpxqgwKugMZ6tp/Z/BsEVET+GMBQu9LDtwyH3RDWlJE62MxCLOJTP4iabh/qmTlBBLaVz+02sR/FxwEKzOHEDm4bRMqLdE9GFLp0+d+Km5zLByrty1yX1HC6Is3s/6YgHJxj+wJNQ8mIxm/7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/VjkScQD52H2qqRbAzicggWZY1bJPNjC+5Tk0Md/74=;
 b=DHb+/Rdna9N0nA+X+d6eQ/V3IjHkrKhYqD9pyFuebnfNSK4rCX3y7expadohWwY+9AwkvfE1e1qxxB+Ma7VIQTR3OMovxKaTSP0rmGCoCqsD2PeuUXCSjBaL2IxrE5u8uke6W3bSTYk1w8TFTDzOq/hM5Ay5OT+x3FWO7sjnU7SGQlLh360zCJusWDh+6TWkPsWSuWML3qO03C/NZtViVB0NzV7hc6ikO0itQ175GC3fs4CQp0FVinoNsBbCMAsM2b+Bf5VlTIhhJEC4MlWwyDc+lKzWRPzVj5Ju4TvIRjs9hArvshbeWQyZCsCqiDEP2xFoBPRuDG/4ueN4qDUUyw==
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
Date: Mon, 30 Aug 2021 19:16:36 +0800
Message-ID: <OSZP286MB08715F437E34B8DC078D293ACCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111638.66371-1-ziyaoxie@outlook.com>
References: <20210830111638.66371-1-ziyaoxie@outlook.com>
X-TMN: [GFNGge3JK2jZehW25Zfzsyln6gpu1yqV]
X-ClientProxiedBy: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210830111638.66371-2-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.239) by
 HK2PR04CA0078.apcprd04.prod.outlook.com (2603:1096:202:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 11:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad03e45-eb22-493e-5e0c-08d96ba7a7ff
X-MS-TrafficTypeDiagnostic: OSZP286MB0888:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4t93Fd0tpnZ7fYdc1vxptE63TbK2Iki0lfkvX5MnVje/VDemhti0e9t6k28pg9MMFKlQukQ11S4nU3oses27shBy9NTllntfdLAqjvizvKQLQniUCUvrPRpH1Zzx8QIxwUHMUGgiHq8bpBvwqZTh1qikR01WEc/9r6kRrp1Nbc5QSVaft5150pmxkVAaPzZWaBrajEqZz0qUfuqx/5k26H1HtwFm0XN6GGlNswvb16VhmjNujJjA1WKZDPEPmY4aqhqlnQKfClhc3vpZigleZQC7ibqfbMSfyRavTtBwfoFW4KGjCEIiZOApZwFJKRSqPnCpOSqT8id1xj/nnBoIvp9jMFLevQHSIfOD2cW4RkfXh7ndMiFIFJjtA24pnWG244GuJ21GDpKv1qZ5CgMaPuNH9opimubTedRxfCGG7c6993gpa79XrkJQdRRYIeS
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rpGdLcr5/+rRk0ZlTAIMTNfS2Q0TmCFpNrsbYiOklpxmzp5vM8eVMC/6FNlS08q/J5yhm9OjhLzlxjFKpbdr1Nj0garIxDJ201/ZsXn/N4QPhUr/PW3TFzk9hByM0S59KDTZxO0v7ac74KgqSIXrHA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad03e45-eb22-493e-5e0c-08d96ba7a7ff
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 11:16:47.3410 (UTC)
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
Subject: [LTP] [PATCH 1/3] epoll_ctl: Add test for epoll_ctl04
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

Verify that the maximum number of nesting allowed inside epoll sets is
5, otherwise epoll_ctl fails with EINVAL.

Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_ctl/.gitignore      |  1 +
 .../kernel/syscalls/epoll_ctl/epoll_ctl04.c   | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 75bb6571d..100ca932f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -165,6 +165,7 @@ epoll01 epoll-ltp
 epoll_ctl01 epoll_ctl01
 epoll_ctl02 epoll_ctl02
 epoll_ctl03 epoll_ctl03
+epoll_ctl04 epoll_ctl04
 epoll_wait01 epoll_wait01
 epoll_wait02 epoll_wait02
 epoll_wait03 epoll_wait03
diff --git a/testcases/kernel/syscalls/epoll_ctl/.gitignore b/testcases/kernel/syscalls/epoll_ctl/.gitignore
index 2b50d924c..f78db4002 100644
--- a/testcases/kernel/syscalls/epoll_ctl/.gitignore
+++ b/testcases/kernel/syscalls/epoll_ctl/.gitignore
@@ -1,3 +1,4 @@
 epoll_ctl01
 epoll_ctl02
 epoll_ctl03
+epoll_ctl04
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
new file mode 100644
index 000000000..fce754e96
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl04.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2021
+ * Author: Xie Ziyao <ziyaoxie@outlook.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that the maximum number of nesting allowed inside epoll sets is 5,
+ * otherwise epoll_ctl fails with EINVAL.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+
+#define MAX_DEPTH 5
+
+static int epfd, new_epfd;
+static int fd[2];
+
+static struct epoll_event events = {.events = EPOLLIN};
+
+static void setup(void)
+{
+	int depth;
+
+	SAFE_PIPE(fd);
+
+	for (depth = 0, epfd = fd[0]; depth < MAX_DEPTH; depth++) {
+		new_epfd = epoll_create(1);
+		if (new_epfd == -1)
+			tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+		events.data.fd = epfd;
+		if (epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events))
+			tst_brk(TBROK | TERRNO, "epoll_clt(..., EPOLL_CTL_ADD, ...)");
+
+		epfd = new_epfd;
+	}
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
+	new_epfd = epoll_create(1);
+	if (new_epfd == -1)
+		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+	events.data.fd = epfd;
+	TST_EXP_FAIL(epoll_ctl(new_epfd, EPOLL_CTL_ADD, epfd, &events), EINVAL,
+		     "epoll_clt(..., EPOLL_CTL_ADD, ...) with number of nesting is 5");
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
