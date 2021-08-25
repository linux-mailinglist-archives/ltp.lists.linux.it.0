Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368C3F7936
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14DAF3C3127
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:40:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 93AE63C3077
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:49 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0970760017F
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:49 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTjF7kjJW1FrO2BpqACROdYXlWkwHfknBkRdKKxbKE4/CWRDcMjrsHNLP7YFNHLCuzUWLaVUDyktlukDx+UtXmgR8hEhcmkqM3DdfpZ0QF6PJ7Z+9wBe543mwh0lJ9HxlEVLH8sVH5qg9kca1o1VRT2icnyZgXchBQD2ZTsJ30Nsa5qGuUaRq91/9ldoDD8//5a27dO3t3bO/MRgkOkXMJ4AAcrTEZv+0BhhrhalPJUEY84jYvOtL1MvBwdxUlaVgGmsqB1MZ3giMWpaz9VbaXnbgdga8ntBVuS7lOtnybhHvX7HiXc/0V4SdZMraOmXhq0I+6UkH+KiMBD4vp3QCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha7Ra76aSoKUaTgnfaS3cGJHzZ3y8244lGAdDy0e884=;
 b=Zx6D3CiTIL5YrxA5Too9QVPw6KRm1n2VxmMGQ1dqgUbfsp+DEn1ESDXBdiKohzym2FEOp4+PdWDMN1GOy47Cy6zHb43QtNh3JZ3tQ+uWThy0v17+Abejsg9EmemWHygVB8/33wFAtZV8RdwOSYMA8GaJhDIlwjZb2e5wiMnPVhW35vAcowJ4Wp5XrDaP2/pPtqoejHJRl9VA9W81j4/McI8ozEGYmwqhp06b7rcykVyGjP5pS7OzTLh/OEPcNPYZ1GUr2zDVZ85Zoj+STHXXKl/RCwQJC4Z1rcaMfBaX7crHy69LWWeo6gOWTFf/DX06wWKfAXVIJwiXCmO0djC28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha7Ra76aSoKUaTgnfaS3cGJHzZ3y8244lGAdDy0e884=;
 b=IejyD/MRVcUNG5877AGZJoA0GLfHqanUJc6IPftZo+cGIVU5XE9Ofd03r57rzJH8akuHBZn5M1k2knlprxZTK4wxo/IQTp0x6Q1OjA4mWnKdijBFJwmKpUnzhr78UDc0kn4SXVswiWh4Xz5Pq0ghPrgBnyJZ676SChY+w7p1exawWDRtzknZAmfTufXDm1h7gvlXl154C967GYqUb02n9OtypGh1OMrK1RmlmuDl3fDbTg+2/ztCxXyvUPqrAbmfkeCGKU396qq/dwfZXcuznWSrIWQk5XJBx0oRtp6Hb+TvE+UQo14f0dk+UkgMVF1Z5VSebEjkb6X3Ahr/aguGlQ==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0757.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:39:44 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0%5]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 15:39:44 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 15:39:32 +0000
Message-ID: <OSZP286MB0871452D0FEE65A20447AAB1CCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825153932.138396-1-ziyaoxie@outlook.com>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
X-TMN: [7cDopXRHlxjXwyUHrzd/BtOfXPwrG/q0]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210825153932.138396-5-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.10) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 15:39:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 649128da-76c5-48de-2137-08d967de8f90
X-MS-Exchange-SLBlob-MailProps: mBy7Mai7yE514amIrhlNzVd+FmdWxeo8i9R1NWvGQ6oza5deDZEac/S5zapB/AkmI0x+VQF7Fa/BkKQtNQqb9yKREzxyAMQyau0rgub4QpIQWaEaw4J+aS7/aiqjF4nUnxTg6ZuiioyzqCGtZkZHv2gm5NXflwGETvhme5nQCrzdEhZYxAJI9mzTOvfnKoPSQrnA04fSRzyIpPlUL08TCe9wcqcg5Qe9/6yccHRyD5HYl3XziaS91SqmSe5JwvOKR2bgi6MT5o5eUbbMna3yB0w8TC9itvk1WtoSlQhHdKgi7C8WuKXLgVRCbaHqWt2gfYnCBLvQzwoOH1GZxnE+upd0UY0CoKSnykBRkXJ+kWR/lVx37GswgOY25pMBn6h4ypIvNf+RttElGAW4VMqAa27c0E9H6aZIdEXhlIUugr48t6Q0LE7sYSeoJ8KNCdKn1DdJmvRszi7IesDVYVIPDhRAXe6ThYVXsgsPy86VvbTVyPMxYEL8BSGkxDdR9baVsTqsmWMdFkXZmJr+ydB5F25w6wtaAt59v/wf+EBKyOFrB6u0Y9WJrFDoKbHEaSsYfHBxub+5T4DWdaKWAF8ZcjEy5WX2KbSELmMqXL0uAgDEY+DYG/z3+LyICR5Sy2hFCDVdXSNdjdIEVr+yBXTZwJqhfn6v5O/wLKgrG249ayV3gipfcT1+XOjnkdT0rz2kXWxWbddwLXWH4iZNG3sydrcPpqKvOhQG
X-MS-TrafficTypeDiagnostic: OSZP286MB0757:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDBDVO0hml/HtMQYPpiT9H6V+l3r6bRaPU8Kb1KWKsL9sY4rJsxpsJTHvp2g/YKHKQWjO1FnC/BEBti/2txF76a/Lk6OhL2SZ67Ko3BBMSAfw4V2NieEFa3zGbNYoAryYZZOiDERADKD3S0y2PiolvGUDWHdDhnBIcvzuA6d3u/gpRkluwoWTUzwShFRVmcmZBs3/exo+hyLsFG5U3PUVmcmQx+HdxqCOSDsTS/BxDURSQcKdL31KwlP8iLxysK9kE3QojMRds0NWzMV9/gA297f7byZbuODEGx+/qVaFa0Z1Mh007kJU/r96zs5WsdTEgZnXTF/8s9TthrKzkwFvmYjM3+uVOUG0KirHuicupJdvSp0rs/iBsnMn5spa3e0idlq54cFvGxv3QvAfr3he6zBHQ9nDAUUCcoGJvG8OpMMjn/1+MpG7wafeTrDqaNf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HiaCPXs686gPSyIvn6XaLBTYoulE7dkg7omDTHKComjm/EV4mrXoMXUCTE7Rscs9h5zB/GpsNM3h3bYk8vw8h2zYhozCVqcCgz0qClyCigld3QMq9VwmZIJkLVTcFwnPQQquKpjU4R+ajTllU35MuA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649128da-76c5-48de-2137-08d967de8f90
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:39:43.9978 (UTC)
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
Subject: [LTP] [PATCH 4/4 v2] epoll_create: Add test for epoll_create02
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

Verify that epoll_create returns -1 and set errno to EINVAL if size is
not positive.

Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/epoll_create/.gitignore   |  1 +
 .../syscalls/epoll_create/epoll_create02.c    | 37 +++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_create/epoll_create02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 2540905a0..d5a1e86e8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -157,6 +157,7 @@ dup3_01 dup3_01
 dup3_02 dup3_02

 epoll_create01 epoll_create01
+epoll_create02 epoll_create02
 epoll_create1_01 epoll_create1_01
 epoll_create1_02 epoll_create1_02
 epoll01 epoll-ltp
diff --git a/testcases/kernel/syscalls/epoll_create/.gitignore b/testcases/kernel/syscalls/epoll_create/.gitignore
index 0ed4d940a..5c16cfa8c 100644
--- a/testcases/kernel/syscalls/epoll_create/.gitignore
+++ b/testcases/kernel/syscalls/epoll_create/.gitignore
@@ -1 +1,2 @@
 epoll_create01
+epoll_create02
diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create02.c b/testcases/kernel/syscalls/epoll_create/epoll_create02.c
new file mode 100644
index 000000000..00df07922
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_create/epoll_create02.c
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
+ * Verify that epoll_create returns -1 and set errno to EINVAL if size is not
+ * positive.
+ */
+
+#include <sys/epoll.h>
+
+#include "tst_test.h"
+#include "lapi/epoll.h"
+#include "lapi/syscalls.h"
+
+static struct test_case_t {
+	int size;
+	int exp_err;
+} tc[] = {
+	{0, EINVAL},
+	{-1, EINVAL}
+};
+
+static void run(unsigned int n)
+{
+	TST_EXP_FAIL(tst_syscall(__NR_epoll_create, tc[n].size),
+		     tc[n].exp_err, "create(%d)", tc[n].size);
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
