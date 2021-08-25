Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2B3F7930
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:39:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9035A3C3072
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 17:39:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFF113C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:47 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E244060073B
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 17:39:46 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyfkSNvIHi7Tgao2KboRPT55UUnvflcrnWp4mM+lnCKr6cLDBt0usnAeEFJolZrVXQD7mcAVCYKiVCoM0frypn42D8OImUkXkmM6xudzKr3vk+xSI4wGk16uGRVqGm/3/KwKjHJTK49RlOcxiVL9li7NS5CntJoFXJofO6wFcaAyH1+uhDiVZCvxnBjTMYTiBU7faIpjTi4ghttb3mCbtAQkgxESh9rGrkkD4vYyRUBWcnEuqN2K6dZpBmb+XtMfTVVJvK3kRQxZ28bch7LbkJ9N45vOau9PHzKa6AE+cXuZ3t5es9A9jcyBtWAh4zzrL/FyYagPejArbIA1R7n2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th3bCWQWNMzGhVVU5Z7oCppUGMP0Aiu1cnaYnFruJJI=;
 b=Li3ZjJHDNTB8eBR3lm3GST7nj/+3f8MoVHtQ26J9K311qJDgYpgoZzmeKqZYS6g9WdoRIsaat0YqSJuh0kMHw0ijGvQoG5cA1GHyGzrqXdo4ehlJeGnS5uSn8AQGLHoaTZb8ClOSYE6b+q5RaIXnoswPFF399WUUAuc6IG7o5PX32QUW47fvzDFQMyniu8/mfuZA+LjaaMQjBdZocDflLXryMeLzc1O0OCc9DLq+0sOPwjYVS5rCURepcN3YZwc9I+/RFZsVtguOj+Y5lSL81t87Crc2q7XA9XifOxuMFcBoD7GiyvQBhM6d+0sqJ+PyrAKG8HRgk11eaSG5PS4UJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th3bCWQWNMzGhVVU5Z7oCppUGMP0Aiu1cnaYnFruJJI=;
 b=bRYgfuHyT02f0cK1mxvLAiPiCdlsrNO96qgyIkzWyEZRC5eVMnz06JIf6XpIVH7yBBl0Dvt3gmvAfPtfwBSU+dFNC8jJASZ8gc5KF2zqahafocXZDHB5V5Fw06Ji0Eag7Tavgb1ZvdDu9IoCDtoryvh2fPSHTdZScqPwdHLu481MW4/zwnAqr0hQbI2yyi6kyAJd3Kc4GXn2dKj1E09l16DLsGSDvYK9CkCnftboXTDt5pnPZWL8HyKmEjzZ/YYY1QcMwhFBJ2jnZ1ceE5mTN+B9Y2FD105T/4MRhgibK88DiQ5ZtXl4nroByG1u6ye3ep/EBxmt6sTzx8ozvwtVgQ==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB0757.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:39:41 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e800:1330:57ca:8cd0%5]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 15:39:41 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 15:39:29 +0000
Message-ID: <OSZP286MB0871E8F61CE0773AF89CF35FCCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825153932.138396-1-ziyaoxie@outlook.com>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
X-TMN: [xH5WjLLeJBX1s3oecYobKYExvu1aHhuA]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <20210825153932.138396-2-ziyaoxie@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (14.127.251.10) by
 HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Wed, 25 Aug 2021 15:39:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe05f24-2a48-4c99-e3a8-08d967de8e30
X-MS-Exchange-SLBlob-MailProps: zswcL9HXbeWfYjpU/3+tze9P3e60YLQzZefl3Bc08BOKMgautp+wgCaZekPYm8c/okVtDTJgLBlHOtlG5mGPYwRBtLeDq6xNRbZ6WBubQ6d6tmChxBYNyGQIn0Cf1sXB/gqXr01lns7q9zj/DhaQey9aZFgV0YX+oakwDzOl2/iLhamlLOEx8kPcHUEa6FYX2ah++zzLhzD/YSBHKGbdYyR6ArsmkUT1iuEG/03kb9VUyzhZdArJMHX10/DfO0vIomGVOvl7uc2k6YUa4DtzvXFxsWahFFbak+5AzSe+AKh3Ioxu9oeCZyqNBE7pp8Ln20PD0ZlKPi9uML9HRhN+LF0sNvVB6Kqr5pyjL5qCipJInliuPTTH5pCEVAbdoIxN6EQT3fkZttCx0iFWqRAkKicZq5xQtR0CLX3J3rjXSP5hyXAmg+f/AtlmLQMA9yO7UnBMBKCJpuHvaUpm1KC1ThHWgxRbMCAzCnqP5iR81v4omYNW3p/mVHm5u4ad/QO5HkTcMkqKBLdgNlkwUJpDw3DjXWdgjwujmimlkiNnTLsymUkAKdf0BGYvVj7kx3z6CjXOSLMSz+Grhk/oEphJF2mGxTUXh875JK4qfeb9xuDdNyd1a4IgmUwlV2hJT8sda6mz572ppd3qdNgZqkcNSl8U0qkmfDGUm7iDqJvpQqCes6RloahdB4y2G6IiOPCega6DHV6c0o/bj9tokvF4z7NtGbYZrUf/vL0YeBhE+RVMAlH2RtvcZSPQwH7T0HL1
X-MS-TrafficTypeDiagnostic: OSZP286MB0757:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uilfNKG33NJMprbs7VImSCwtgBHo2jH3JTsqvyQK1JgpDtmLDUIUqbX8f7D9omy3c1roiIqRtrn/wToR2VMOpLCRWJtfNnvFYeS4Qq901+YaIpLPMTw6ODIwocQLRRIoT1676PE4bKV/HECqpcJKAmMHc4+0OjR2sL861TPL3q5RAUzwyZ+Tf/xNMy2/NWG6iS0gh8YrheBsUi6SEg+AcLZdXw9fbNdeOR/p9FbRZsyxT5iXPc0Eej9ZwkdQhTUdhMlKzo82pADWtgVbDV0tzKUdf2ggLqgxR0UzSyxXfmDTH9MWKcDZQWQm6yW6kgsI83rPZwH6OAmZ9lMLwgZhEjVNELynqFmgi8MWCGJr9iGqwsAMdfoZSmFuFKidZi3IIctVWMhNRdq8G8A/qb6OVwrKpIAUJaukrZ8YM4uAb633Vt25HzdynO/7RIRa1jTW
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PQrfuVa9I5k5zhir2s5uwtbt4hg9b5T0f7cOI158Xh5N0rV8PebC0F1zRUPCEBjAApyOiTrChDIT2Ksv9XHm3xPH66JBi2/Jo/jFJe3us0x26+jkBODpcEBkBwSx8z+ThYf2RYxADQjGKB0l5SJk8w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe05f24-2a48-4c99-e3a8-08d967de8e30
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:39:41.7934 (UTC)
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
Subject: [LTP] [PATCH 1/4 v2] api: Add a IS_BIT_SET() macro in tst_bitmap.h
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

Add a IS_BIT_SET() macro in tst_bitmap.h to check whether the n-th bit
of val is set.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
---
v1->v2:
1. Add a IS_BIT_SET() macro in tst_bitmap.h.

 include/tst_bitmap.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/tst_bitmap.h

diff --git a/include/tst_bitmap.h b/include/tst_bitmap.h
new file mode 100644
index 000000000..528a2bdaa
--- /dev/null
+++ b/include/tst_bitmap.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (c) Linux Test Project, 2021
+ * Author: Xie Ziyao <ziyaoxie@outlook.com>
+ */
+
+#ifndef TST_BITMAP_H__
+#define TST_BITMAP_H__
+
+/*
+ * Check whether the n-th bit of val is set
+ * @return 0: the n-th bit of val is 0, 1: the n-th bit of val is 1
+ */
+#define IS_BIT_SET(val, n) (((val) & (1<<(n))) >> (n))
+
+#endif /* TST_BITMAP_H__ */
--
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
