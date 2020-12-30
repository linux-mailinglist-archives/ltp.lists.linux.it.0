Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E452E7B16
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 17:36:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10B3C3C5596
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Dec 2020 17:36:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A2ED93C558E
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 17:36:37 +0100 (CET)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F2FEE1A00E38
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 17:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609346196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yzEmrSqOhB54jIAvCBsuMWD4mq7/mrjYi6yp7lwrylw=;
 b=AxXHIaEyzkF7q9RQmvPrU7SnYApyakHkIHh3p8KbJ96lybdP3+DkbMA3R9TKJyvSUYCqJ0
 hWtw3sNfdoDo08+xe2jQNvOqcEMmo0WM/DBL8REAnnTedEzL/++En+emiJYBtMlBAD7Kvn
 S3jeGFTCKpQ15K2SGOhnBX6vg7vukxI=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-3OoB83i8P9C0yUKDNkrm2Q-1; Wed, 30 Dec 2020 17:36:34 +0100
X-MC-Unique: 3OoB83i8P9C0yUKDNkrm2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph2+IlUq7F+wTGxwAhhtYQK31QgCbb6rNByULbqDnTevpuYa60iBdXM7lpQl2OotmVoBtSk+IZLEo5ATiUw3NeCGMVbx6UzI/mMazGqPYlj7gDKliHQpiJZA8OrIeNI35IgVS2qAjyxspPlCPmFKl90Me9/ovS7oYV4nXh24a9iQqoNxMQ0OiCfffCq7tJ5h/tOnuuCUpe/pa6pS95xvo5EXMXUB9OoakFgQ7qUW7Ey2A+MksPApGQkzyOUzx7YLxYYLZK3AukhAE8BzzEcGORfoeKtzrHpuccsZL+7BE6uhUv1ZIfob8vC6tvRCoVT9/0WpcNYP6cdiCVCrPXaWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nEW8WGCRiFTjJ9eZXq4gDcX7zeGWKfvN1E/c6cCZ60=;
 b=JKaZ6bLMCEWOQvQrxcTiwIopO/G5Hw+iMds2PQT0hnOJ4dlC9kfTzrwHVenpp7fkQVDLuMOzjsNZ5/QnOAYPeUkrsc2bDyVPpXMhBMsMKwySHlZUYNh9kW5Mq98AOWN3wGdc0KbrtCzFQz5bFITBu1uw4ZwEbQtvIG71SGuVyZ3cij9V4fO1UfuQwlS9+8I4/jOy2aXqI91K0vNsTWD/8/WgbC4/thCommbuNirc1V1sx04w7pxgnhc4vyFal+wTam3Hq81vEDBLxE2QmsfOHlixJ52zh4UlbWOiWRbTLPjoXbXyD+nRg2MKkUGNSQVBKq1OZ6BiXp5EmUHM7NYdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com (2603:10a6:803:60::23)
 by VI1PR0402MB3358.eurprd04.prod.outlook.com (2603:10a6:803:11::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Wed, 30 Dec
 2020 16:36:32 +0000
Received: from VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e]) by VI1PR04MB4958.eurprd04.prod.outlook.com
 ([fe80::91d9:719a:add5:392e%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 16:36:32 +0000
To: ltp@lists.linux.it
Date: Wed, 30 Dec 2020 19:36:15 +0300
Message-ID: <20201230163615.318-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [46.32.67.173]
X-ClientProxiedBy: AM0PR10CA0106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::23) To VI1PR04MB4958.eurprd04.prod.outlook.com
 (2603:10a6:803:60::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.de (46.32.67.173) by
 AM0PR10CA0106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Wed, 30 Dec 2020 16:36:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68c06c4-1a7d-4079-930e-08d8ace11100
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3358F71ABCDA11E73FF1F1BF93D70@VI1PR0402MB3358.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKTIhOmJrJi9Yye/y4seObUUrPgJLSSskZrajRI0+hQUM0fURlgjuoZjElLPZIRhmbrR4+UqyF1+tayRaRCBe/Z3VQT5Vcec8v82zjmmxwMfCcUQlh/zoEoBzcOUWCShfKqR8N0FV5buwccloVOXaL1ER04EpCh8QyO4cmod1Axq2A4LyN0JlSNIHKx4ZSPlKrrcHF+DbJ1kLF14PbglZx06UXhPEXRtzzyfziE1n2I+cuPe9kMTDoH4FT4ZsMoTfUAF2IF16Bwkttd5FAPwQ7hkzhjduwxw9HkKU5hf5aoLqW5WL/HDk0VWAOeS5tbOk/tByFwJyhViaTIr7AWPxNRr3jrsLNASqjLH1cg7Ja9Tl0RcYjJ/8JhO56dc1Zu9bB4dfaM9PaLIBWFHmrEbYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4958.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(346002)(366004)(376002)(186003)(36756003)(8676002)(1076003)(478600001)(66946007)(8936002)(52116002)(4326008)(2906002)(16526019)(316002)(66476007)(5660300002)(26005)(6666004)(6486002)(86362001)(8886007)(6506007)(107886003)(2616005)(66556008)(956004)(83380400001)(6916009)(44832011)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f/i2LWs3CGWM+EIIAFDKDqGpszSYnRmQM5BVzuo3aQIt8394BBeGK+1BTOMl?=
 =?us-ascii?Q?yfUJLBYR5qhxDuvcRO01tclfq+DP5X/csmJXgzwZWWuZ9z2vfElpbDo6CzgB?=
 =?us-ascii?Q?LE4m+7howgvvwi5S02AWLalAaMLek/BozIvr8hG0ZluXV1/jSTe5f7RxuTbp?=
 =?us-ascii?Q?n03Fo/GDqzPGXfeOa8xcfpZC2w66nJ9/e60OhZ+Xk8NWTOutEK1XnMXJb5YT?=
 =?us-ascii?Q?2X16L4G/8g4gWG7CH7fVK069l/KtO0RotmL47iA5I37YX3DaJmpwkfinn29p?=
 =?us-ascii?Q?zp4iQ4cim4qPUWIf1ylpQAgnvMemXRhCJXFiHO7Yww6/IkwcXvKbYk3TvMgW?=
 =?us-ascii?Q?e1JpuU3fBBrQg2ubh6NrfRpmrK+ceySze0CXxcUqACrA3+ycpJQt84vc9j98?=
 =?us-ascii?Q?FnDgC1pNi/zhwS2tMLYBsI7haPfnvF/odGOlhvPxctCtJcQtSyjpZwU72s82?=
 =?us-ascii?Q?V40l84vxYc0iXlUZrAl+IBKyS4vgwokOfsyjC0ZDHUvZ2bswZq243ev2oD1a?=
 =?us-ascii?Q?Z3uPh0k9/EgsMGh+rHUgUX4VISvCgxAVD3zE3ClTwH+IGnd6JcEXDZQskkBQ?=
 =?us-ascii?Q?BSxECJSxG+VkmnJbYOqLENg3QNHTX7GfBQChTXiOHdlFI9WmQQEztRtyGgiy?=
 =?us-ascii?Q?jRtDckmLcQsOnb9RBl2Z28FkcSCVJUoeZo9fkWUXq9jJwR2Ixzc6Ufj1g66s?=
 =?us-ascii?Q?X/Cp/ALifqsVvsZQhK9Ss4/KIIttN5yLXhGkzIT4hqiw+gVwQl0Iki02LuVK?=
 =?us-ascii?Q?6fSDaE7Qbev9LSWiMLzsxRDChua0NJLYOvCueBX4WrswVOuiJvAeimLPveee?=
 =?us-ascii?Q?IJ9ciQDdjpVflX0elIwU8Rt+Gpc2EisiP+Xm2T/IaDynTNsm28LKVj9Bnqcz?=
 =?us-ascii?Q?t5kSyXY+JerSV/mSOAtczXcRcPtiQWPEmXENPzhpSzq6nYKGTi228scDXsI6?=
 =?us-ascii?Q?HRQTKD0KnOJHd9JkbS/x89/GLda13aStirff9ihnBCMKhJ0sVP8mDid7Cp5k?=
 =?us-ascii?Q?k4R+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4958.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 16:36:32.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: c68c06c4-1a7d-4079-930e-08d8ace11100
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bzj26ICD4k5U9M9nTkzdy4zbsQU8ranglSA1aJ66Zyp+u9kKcUI8H6+ineL2+77VOsAUZWuGuxwEL92o8FgW2/tuWFKHiXHs+TrbCUlW+ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3358
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] mem/mtest06: mmap1: Limit distant mmap size
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Limit the distant mmap size by a total memory value.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/kernel/mem/mtest06/mmap1.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/mem/mtest06/mmap1.c b/testcases/kernel/mem/mtest06/mmap1.c
index 9d3e9d097..18c4e67e2 100644
--- a/testcases/kernel/mem/mtest06/mmap1.c
+++ b/testcases/kernel/mem/mtest06/mmap1.c
@@ -32,11 +32,7 @@
 #include "tst_test.h"
 #include "tst_safe_pthread.h"
 
-#ifdef TST_ABI32
-#  define DISTANT_MMAP_SIZE (256*1024*1024)
-#else
-#  define DISTANT_MMAP_SIZE (2L*1024*1024*1024)
-#endif
+#define GIGABYTE (1L*1024*1024*1024)
 #define TEST_FILENAME "ashfile"
 
 /* seconds remaining before reaching timeout */
@@ -189,17 +185,26 @@ int mkfile(int size)
 static void setup(void)
 {
 	struct sigaction sigptr;
+	size_t distant_mmap_size;
+	long mem_total;
 
 	page_sz = getpagesize();
+	mem_total = SAFE_READ_MEMINFO("MemTotal:");
+	mem_total *= 1024;
 
+#ifdef TST_ABI32
+	distant_mmap_size = 256*1024*1024;
+#else
+	distant_mmap_size = (mem_total > 2 * GIGABYTE) ? 2 * GIGABYTE : mem_total;
+#endif
 	/*
 	 * Used as hint for mmap thread, so it doesn't interfere
 	 * with other potential (temporary) mappings from libc
 	 */
-	distant_area = SAFE_MMAP(0, DISTANT_MMAP_SIZE, PROT_WRITE | PROT_READ,
+	distant_area = SAFE_MMAP(0, distant_mmap_size, PROT_WRITE | PROT_READ,
 			MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
-	SAFE_MUNMAP(distant_area, (size_t)DISTANT_MMAP_SIZE);
-	distant_area += DISTANT_MMAP_SIZE / 2;
+	SAFE_MUNMAP(distant_area, distant_mmap_size);
+	distant_area += distant_mmap_size / 2;
 
 	if (tst_parse_float(str_exec_time, &exec_time, 0, FLT_MAX)) {
 		tst_brk(TBROK, "Invalid number for exec_time '%s'",
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
