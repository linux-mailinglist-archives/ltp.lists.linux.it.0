Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F33F7935
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEA313C30B9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F09C03C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:48 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55F716008C0
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:48 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2l0mlfR7aqGfipStDpK/V4IK6pTNT0P9pmjAOhbrXV6IIwNLhmzfgCpX5V4QSWqxG/WFv4mvMk2ghIBZSnYJE34Uhx6l94a9nmaOPEiPzKqWtcoiwFbctl/sfaq9yQrw/qh/fkkeKiqjFtgwctGBuTg4c3BySm2VyWlQ1vt3My+BvXW3YDqiaYtiBOo0cpy/UF5VJnJI9gd1xNBOk+YyHZMHQu6ciT5dm1zeouEFinn8IMkUY4UW8GKF187YqL/Fpubm5NYv7oxc/DQ2JtRwtZrL1CTS+2HGHRrmi7khkL/UhAr16EzL7DIt2CgoYqTBRBfxESjtaNcnSQ23arlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j85w0dH5Zl1PpSp8kDNfdDOIktzh8mUKzQlYYne94vw=;
 b=ADL253QN+Vz6Sr2jT1Sa8ey0n+EzlOg9azdTvsSqbDVOQo1xLI7qGrJ5LkCsjL+NldUoehiOuc7Lm3NyO/Z34lwBmOteletsMv9MBpnsRFV5v8TDKzfhr1urhcObzo9+6vhuO0Y8ubryPTmlBDk4MwcwFY57NlHI5HiBfboJ82ELkKfOHIDDQfhLC8gnkPlfLqqrsAFq1n3wJWEd0JtmEpmgbkJ4Caye8mz/ufk6iPIZaDxUib4bw4rsY2qVU4rgIH+XixolbhNnwpdVl0LP0B2wpsHpsYvcqA9VxbjhCHLCxVmj+Bg4TrU1us2kKa0bvHELNl06Pn2wVss8+hYQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j85w0dH5Zl1PpSp8kDNfdDOIktzh8mUKzQlYYne94vw=;
 b=WglBSYA20nm0f6KuNjTxzd2dRS4TChFto0x3Xy8knuaBXY5/9ZolPxeA2Mv1VxMvw6IpSIdF8vXGM9WDKUmTP8rajqAKGM5vYE7dMBhSYduAtYHO23ZlZ3w/rA5Xj2toKVfsXYh+NeDFt5Wqh9V9Wb6hRlBXsjYAyCR5vBBa/+GPEZ249o+elP5xGQh5pR19gk4mLMZqkEJHt5fMB86ayS33g/UUjh9W0bYpEjwNW/TeQSeIOSbKZLCQ5Lq/u1r5i0KXB5Rk3LTuEqNLmR5/2aDimXW8ngfh9GDSe5eyKOFs9NcdU4Q6tMEsFOYwxtiKes7YKdT1DJ5MfHwjh1OL1g==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0757.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:39:43 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0%5]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 15:39:43 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 15:39:31 +0000
Message-ID: <OSZP286MB08714234AC4DFA511FF003C2CCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825153932.138396-1-ziyaoxie@outlook.com>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
X-TMN: [6gJKdIndN+ASR6KTJr91IrewrJR6Kw3X]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210825153932.138396-4-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.10) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 15:39:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2823c6f-4123-422f-debe-08d967de8f0c
X-MS-Exchange-SLBlob-MailProps: mBy7Mai7yE514amIrhlNzVd+FmdWxeo8i9R1NWvGQ6oza5deDZEac5KHx852nT+UWmRsPfp8DPgC8mtaBId0X5boWX/uZzR5DG4E8/Navnuzi4gnNOSgIGEH5UmQ1JKrd+IUolGNAjDE+dBL/IRZ0wVCIvQnwBQecsR0TH0D8vKNi4GAYu3X5kSCo5t/ZuT4dylbP0NyuZtxNvdm0iKfEQmz0853j29i8tC5E2tUFmvEYXCNYdOqmbTyohPeyQAHYXo/azgXpzYsx0KvYx/DPo+D+3lCJo2zs3/yOW4USayas2kRiwLVVe63eXoMRjh0Z9V0QZtDprNd6VSqD6Ee47ymqU6fvnpKBtlHWJXId4ZptLfLhBR2oH7wX3fOOg7RF6BXkTQyXkfe5+/MLhCdDUihgCi11pesBb8Gii/yElACQWEoGCXaBRMCehwOYstj6imEaNAFCbm0ep0AfnCtnQiYe9bpmzjh8R8PsgsUSWKZhUxJPq3uHNOMpYmTZlAxTYsOxHcvyXm6bYluxBIWCIAuWrCfE5fwx0qVJgxGwdjJFxjeSLq6Py+JPCgGOv7K4ROg91iD/PRU4FqXqOr6DjLPOe8AZ+2+DWRj8Dv+qXDVaWLFppha0Dai3Pdp+Ww35RWAlXJ3svpYJDlhPFCgLpeOwsy8IP+2p2XU35kbEtzMGP0I/YLSXSyqQx113g0pR+35UspOjB0Yi2lcT0O10zyb3VF1R7N4
X-MS-TrafficTypeDiagnostic: OSZP286MB0757:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOKW1deMNSG+JV7sTGPcmh8T/3eFN0DSKdsW9bg5tOLsqZmXyPeO49OGIfmPpJf0BpG1EEyABU9vOgp3l+v2za8NBY4ylYFXXML8GTvMBjKhqdn5iqSMxi6iJDF0vr5mqYcbDQpY4C2P7nruUVbeDa5/tdmBr79Xtz94PUdJVfVTsodkB8HRGqIP6Ye/3/VTOUQ0yQdnOH8KU1fFM6i/8ZJAt0WO/AdtKGXkw53eJJl6iRWyhzmcSZ9SA934sZ7rIo2y8eaHbl/sExCW0atJXxlpt05XCaK3s1I2oYqrhOwAMlif3IKKavs4y5WZNEftDfhPA4ixaLKN+NTohAu80k2jM536XubvSjQPD+c4+wp8erPp0KagwugXOdtgWOzJ/63LANdx7C7IIhQenFC7fU3S4BNP1DouFl7Xf5AUUPgxbkThiswcq745BfDqq6/Q
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 66xQtvr9SBotScgqldsuSSNWOr4uoYJbUZjMjTOMJp1jo88Wrqg2eWTe5BDOENJGuVI/yVlhOrIydcS8Ld3PCyEs2vC/RVER5niB5kZiiYbQU7XC5c0VB3fiIXxuWoKU3gnEkI2ZAJHGZwcISNdFBQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2823c6f-4123-422f-debe-08d967de8f0c
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:39:43.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0757
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_PASS,T_SPF_HELO_TEMPERROR autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4 v2] epoll_create: Add test for epoll_create01
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

From: "Xie Ziyao" <ziyaoxie@outlook.com>

Verify that epoll_create return a nonnegative file descriptor on success.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
v1->v2:
1. Use TST_EXP_FD() to check whether fd is valid.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_create/.gitignore   |  1 +
 .../kernel/syscalls/epoll_create/Makefile     |  9 +++++
 .../syscalls/epoll_create/epoll_create01.c    | 37 +++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_create/.gitignore
 create mode 100644 testcases/kernel/syscalls/epoll_create/Makefile
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f6fe140b2..2540905a0 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -156,6 +156,7 @@ dup205 dup205
 dup3_01 dup3_01
 dup3_02 dup3_02

+epoll_create01 epoll_create01
 epoll_create1_01 epoll_create1_01
 epoll_create1_02 epoll_create1_02
 epoll01 epoll-ltp
diff --git a/testcases/kernel/syscalls/epoll_create/.gitignore b/testcases/kernel/syscalls/epoll_create/.gitignore
new file mode 100644
index 000000000..0ed4d940a
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_create/.gitignore
@@ -0,0 +1 @@
+epoll_create01
diff --git a/testcases/kernel/syscalls/epoll_create/Makefile b/testcases/kernel/syscalls/epoll_create/Makefile
new file mode 100644
index 000000000..ad856cee4
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_create/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2021
+# Author: Xie Ziyao <ziyaoxie@outlook.com>
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
new file mode 100644
index 000000000..54fd0810d
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) Linux Test Project, 2021
+ * Author: Xie Ziyao <ziyaoxie@outlook.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that epoll_create return a nonnegative file descriptor on success.
+ *
+ * The size argument informed the kernel of the number of file descriptors
+ * that the caller expected to add to the epoll instance, but it is no longer
+ * required.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "lapi/epoll.h"
+#include "lapi/syscalls.h"
+
+static int tc[] = {1, INT_MAX};
+
+static void run(unsigned int n)
+{
+	TST_EXP_FD(tst_syscall(__NR_epoll_create, tc[n]), "epoll_create(%d)", tc[n]);
+
+	if (!TST_PASS)
+		return;
+	SAFE_CLOSE(TST_PASS);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.test = run,
+};
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
