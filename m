Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE4246466
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:23:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9246E3C58D9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 12:23:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 571A73C58DE
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:53 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50100.outbound.protection.outlook.com [40.107.5.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 060DB600148
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 12:22:53 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mzvyau9QTwsKsnUF+/cTgqNRpsJtGvkYW7afSAB08REVmTrvguHez61p8L255up1Y+z/lyceQ6CC5vn0dpD+D4pV7jy0R01HdDRs2YMIocWhYyhTFVZmPDHxi/GFz+veoOGzdHesWDXHy9QhpvfsHfWUuZP2apdxMrnopmZ9aWqqBrJko7t2kCYAUlzYy8VRx/sbUZk134wrXBfnmHRKm7Rxm7sEuTzxYvtfp30cWVtn7C4fR3PxssCJSewhusl+Y2P2brGUWlInYxpZYDxrxb+R7CNAhbgqa++eMtuj+ybNKrH7tU2VhyMIatdKJp3qt/qXf2CUQ/Qh3NjxSM1DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYtM/UxPMdwa76lCX8roCutFMSwETyCA0MEbwzTwUCA=;
 b=AmHjSjoJPq9oN8LqiHbJx/6E6vDh5ADvctNlw4ik8DNVSUjPM7HfWUdeJd0bFft7QM9qL1Vqmm6NzCguvA9xQHWaUzmNzXyRFEIumWtBuPYgDXQkhrBK6C9j0v8JCGF7TG41UqilMS4Hsd1l6QjVP0D3AU15mBO3wqK6WrPFhGzzANDG9wEs+FFRpzvlgLdgkL6TpQlXDdVI11jfinHqzKlu+rm0XEeTruHqyX6mEzHYxYxpFMtmoRDcS3UbS0PHqKnqNXO+Cr0l02OYJc+8mNcmd9v5D10VU9G3KP/NFsOsOWspBGdza1bRMfT3pNjtffVMT20UheWU23NVJf3Zjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYtM/UxPMdwa76lCX8roCutFMSwETyCA0MEbwzTwUCA=;
 b=ZrGodHHX44J0qdWbjWsyhlV2AUcGXMxOKG390yMjPAmRGBOoetxIHHsFVSQ6viTYQLDb8ZKhSiWr5qZIpzTiF7XfDncTg17SDz0XEAE5sUdLKs3uO7AkJEpeq2aaR8Dtec3UroFaZ7iDHYULwxABDbEH9IP7/Uhms56DI5hUbJA=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VE1PR03MB5966.eurprd03.prod.outlook.com (2603:10a6:803:10c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 10:22:46 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.026; Mon, 17 Aug 2020
 10:22:46 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Mon, 17 Aug 2020 12:22:31 +0200
Message-Id: <20200817102232.5902-2-Filip.Bozuta@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
References: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
X-ClientProxiedBy: GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::14) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (147.91.217.238) by
 GV0P278CA0045.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:29::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Mon, 17 Aug 2020 10:22:46 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.238]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b730007d-6db3-4eda-f8e9-08d842977c23
X-MS-TrafficTypeDiagnostic: VE1PR03MB5966:
X-Microsoft-Antispam-PRVS: <VE1PR03MB596606CEF190ED777FEE69A3EB5F0@VE1PR03MB5966.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LuzBuZl6w0iS9BDfpLFEo0V8jKVE/BfN7ofDRI8e83o5o6LIBvQ2luGKiMej9pMtjyJ+yxpKZOZaJuStWo4E6AQelQcBGTR0y/TiivZC6siTBXaDYnf5CsWZV4ar6LWaqQJXy77b7Go6QOOkK5Nc6Kbx6KblOVLnHVq9PAcpPFhDlSN+EY+ZyCnSy1gi+Bjkn5s9JBptWmdjSyPd1BC8P2a5s+f4dOcUFcOXgMTV2z+XLd3698nmImhV8AWUL3xMVo0k6VZDvZTiTLg/CZVZ4RPlBsk5E/0Xg76eKhCG4MzbQRaGVlXoLERiD5twhrYxibxsxu0SMIk+bXEFSGOf86hhIZ6JWVLV2d3OJUw6dgTi13yTIbV2q6CboEcP179
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(376002)(39830400003)(6486002)(2906002)(316002)(69590400007)(16526019)(6506007)(26005)(186003)(6916009)(4326008)(83380400001)(478600001)(52116002)(8676002)(2616005)(6666004)(66476007)(36756003)(6512007)(8936002)(1076003)(66946007)(5660300002)(956004)(86362001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Rv6xnUcz9BbERtpvOcFjef0iSS80+8jDf0btSGtDwwQh3MmAPPxra+Lg88A828MXhZIbVqXUVvMlTO5We5hS5x07geaKfPDWX93+BKtrMFt/p+9LLhpDNMwJ6zFBLEUVFqh++0K7uj50XqrVoojPAYGpEgXGrYWNcPXU9E4yQ2LbYgAbIdA8IRd/dpW5J7LFQSdS1dOLbT3bnk3XbSJb6ceYnaH6cSjgT2NpT7cTqzb5dwnt9P4AH8DwdAMJ6+goUPoqL1WMUtCK9G6E4YEg/OzQHSuv7J7PP7k94JnX4Xq94d0V+pzEMwNK9smUqdLZe8PEXE0uBwLfFTLiei2gSpEv6jBVw2HDXBS3WqceCNr7WYkhKpQ/fCVDtlSAq11VrHMrKRY3NN//HNN9qKYWCCt6rCYTiVPv13GIljwDJqiCdFvJYRui+PMOdHy9lGGF4YjEXruRW89BfN3KHzD/N1tw3DyEpBkGcNX8iiwD96SNUlyTV8q9dOW8pG/KaroE0BJ23emYOp0EvcX/RhoGNjjv1tLdY/rIuSe3oNdNBwCRPpl7hS7jjPI5IyiOurQ1/is7mYK4IKdkLnm0auG7tx3XpXKQRsJQwrHj3868tjWFQB+Rs0mBYDHQjwiISZcVwUdgPY6g4kYrrtU1yE7MgA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b730007d-6db3-4eda-f8e9-08d842977c23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 10:22:46.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R45bfGV+TtXEsuRbFyzrtA7x06NkBX9+Qb6zZqomCn3yAaul4f8EDZ3ldMDAwtjNNJ91Hy1PpcJlRsxCyKyPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5966
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] syscalls/clock_nanosleep: add a test case for
 bad timespec address
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

This patch introduces test cases for already existing test
for syscall 'clock_nanosleep()' (clock_nanosleep01). These test
cases are for situations when bad timespec addresses are passed
for arguments 'request' and 'remain' in which case errno
EFAULT ('Bad address') is expected to be set.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 .../clock_nanosleep/clock_nanosleep01.c       | 43 +++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 4542995f2..fe5f4d7c7 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -20,10 +20,14 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 enum test_type {
 	NORMAL,
 	SEND_SIGINT,
+	BAD_TS_ADDR_REQ,
+	BAD_TS_ADDR_REM,
 };
 
 #define TYPE_NAME(x) .ttype = x, .desc = #x
 
+static void *bad_addr;
+
 struct test_case {
 	clockid_t clk_id;	   /* clock_* clock type parameter */
 	int ttype;		   /* test type (enum) */
@@ -37,8 +41,11 @@ struct test_case {
 
 /*
  *   test status of errors on man page
- *   EINTR	      v (function was interrupted by a signal)
- *   EINVAL	     v (invalid tv_nsec, etc.)
+ *   EINTR        v (function was interrupted by a signal)
+ *   EINVAL       v (invalid tv_nsec, etc.)
+ *   ENOTSUP      v (sleep not supported against the specified clock_id)
+ *   EFAULT       v (Invalid request pointer)
+ *   EFAULT       V (Invalid remain pointer when interrupted by a signal)
  */
 
 static struct test_case tcase[] = {
@@ -78,6 +85,22 @@ static struct test_case tcase[] = {
 		.exp_ret = -1,
 		.exp_err = EINTR,
 	},
+	{
+		TYPE_NAME(BAD_TS_ADDR_REQ),
+		.clk_id = CLOCK_REALTIME,
+		.flags = 0,
+		.exp_ret = -1,
+		.exp_err = EFAULT,
+	},
+	{
+		TYPE_NAME(BAD_TS_ADDR_REM),
+		.clk_id = CLOCK_REALTIME,
+		.flags = 0,
+		.tv_sec = 10,
+		.tv_nsec = 0,
+		.exp_ret = -1,
+		.exp_err = EFAULT,
+	},
 };
 
 static struct tst_ts *rq;
@@ -104,6 +127,7 @@ void setup(void)
 	rq->type = variants[tst_variant].type;
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGINT, sighandler);
+	bad_addr = tst_get_bad_addr(NULL);
 }
 
 static void do_test(unsigned int i)
@@ -111,19 +135,30 @@ static void do_test(unsigned int i)
 	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
 	pid_t pid = 0;
+	void *request, *remain;
 
 	memset(rm, 0, sizeof(*rm));
 	rm->type = rq->type;
 
 	tst_res(TINFO, "case %s", tc->desc);
 
-	if (tc->ttype == SEND_SIGINT)
+	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
 		pid = create_sig_proc(SIGINT, 40, 500000);
 
 	tst_ts_set_sec(rq, tc->tv_sec);
 	tst_ts_set_nsec(rq, tc->tv_nsec);
 
-	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
+	if (tc->ttype == BAD_TS_ADDR_REQ)
+		request = bad_addr;
+	else
+		request = tst_ts_get(rq);
+
+	if (tc->ttype == BAD_TS_ADDR_REM)
+		remain = bad_addr;
+	else
+		remain = tst_ts_get(rm);
+
+	TEST(tv->func(tc->clk_id, tc->flags, request, remain));
 
 	if (tv->func == libc_clock_nanosleep) {
 		/*
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
