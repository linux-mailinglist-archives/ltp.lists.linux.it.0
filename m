Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDA23CAB4
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 962DB3C3285
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 071483C1CFB
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:41:03 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30133.outbound.protection.outlook.com [40.107.3.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7CC88600A0D
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:39:34 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcW/r5Wb4E2pADjH6gub/ZmTCqIMU2CQ8bz/MLgjK8pWVtqGEFwyHqdVPbiA2x8iiWZo0YoKQOLNE5FUVCszML4SQGE9Okq18OdX1+KDYP7lx060HUgKnGSBVR9lxj8hlJ7Jeh6ZBB4FScyTrI8iqyuyHxhX5rWqpJQ9bFtYsYGAo9/d932I/JBv374DFtdc0vRrGWLe87QFfO1GH8zneY5VzlS2quS46PfP5gih0bPb0NoatSJ5njRASwTQ30tPtXeYfo0YJiaAnHjK5ishnoP+SFuqK05NHjugCV30wq1hjMPiWx2nwSXLH84XjatBv23ux7ZdWefXEFFuRtzWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogJACsui18cTzmlFm9JNpyUvVuHejW06gWVXiNIUe7E=;
 b=hMHEVXRHo5SBqeLqLeIfz1AtAtqm/akHf4FALfgoL76wssjDJk3qOVkG7z9LEsKGRvufesf/gNl+u8z3XgiUzJ/Wgbo5y0zegGRRZksxZQ3fL+Rx9j+BT9lVZjYWPqOZY0P9Lg359p8eHq1XpgG8MQ1yinNKh2WDmS969Tpki/DjdtiYDV8tou0XGQGsoefNaw6sHrnevZSAV9AwwoO/NxIY6IQOrjJDSMxXxpfjY3cI01gRBScW+0NFVOB+tLlTFJLUvBMFFRcuFHtf0Ayk0U4OCpckw80lnaJLd9MxnPF6QAQqtkgh62VxoXpfDhZiLTUOnARVB018hYDqgBa7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogJACsui18cTzmlFm9JNpyUvVuHejW06gWVXiNIUe7E=;
 b=Pp13Qn2nh4OnyfwOge7wcJGkK+wkC96U2rIZWMy2tluwCKIt9nIitk7YxqVqelOd3TsPuUFTv3lwXHwgyQzCsPQPEW3Z4N0QJP9cXvQDQ1Z6EspRHsY7RnP0cGepoPcjagy88LXC+OoH46UOaoKqeFJRJzbKIG0qmmuH7zM+Fko=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM7PR03MB6673.eurprd03.prod.outlook.com (2603:10a6:20b:1b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 14:41:02 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 14:41:02 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 16:40:44 +0200
Message-Id: <20200804144045.18875-3-Filip.Bozuta@syrmia.com>
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
 15.20.3239.22 via Frontend Transport; Tue, 4 Aug 2020 14:41:01 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9df725e8-286a-4a86-75fa-08d8388468b1
X-MS-TrafficTypeDiagnostic: AM7PR03MB6673:
X-Microsoft-Antispam-PRVS: <AM7PR03MB6673C320D31CCC8A8D67D73FEB4A0@AM7PR03MB6673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBHZZnH9skQZuzj9Ng7/cy5+yj7tNAPMj7dnAPKu6Yj3xjVoan/CjVHx2ZPXYG6j0BfEXxTP5K1X+NMCnJBLwVC2FZ2SXTjiEiZ5Bluc0ERbw9nKlWp6sen0VKYhCbmzOJk9YwfkGPRrTc3DeZF2KNfy3eJi92Q2SvrIFhi/s2CUS4HfIe9qfbZVu4p61Ny0tFk+1Tp5ZYjE4Zbk5wyiwDtoOa9zWdPoL8pHZk0HfcMttyKww+lGGlf8TfQyqx6l2xJp39aqZCRwlA9QjERbc1aD6a83QGjX6jRO/nfNFZHvipbHDy6cF0eggR/+Zeyk2wThWC5N5KOox4ZlP/I7XAtcNpWZHnm7JGGC5o24Gj9JQ/1/xq4FGJicJGa3ANHl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(366004)(39830400003)(346002)(508600001)(36756003)(16526019)(26005)(186003)(6512007)(316002)(52116002)(5660300002)(86362001)(6506007)(1076003)(6486002)(8936002)(66476007)(66556008)(956004)(2616005)(6666004)(83380400001)(66946007)(2906002)(6916009)(69590400007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: rI/meJUcGoVhIIM3I0RbM0dKguJY82jR24nypZLEy6Co57aE5YMWFuW6YNUk86hiCtzIEtPLKfbmPPLSrz5GuXkXOXTC1/S26Efbxd9ke4fEglQvnsZLs4sb8FgcLiu2U9XG2U9as4aoJ2H/zPPd+7pJHSvqty6egYDDP+ZdISMsYZ/rvlF9m3JM3kixNif6zL7PQcCIdNg0H+I7CJUipNk9E5tVDi2b0uVvNfWLcNlVDoELNd9Y1FtqKrRyj4xkkSwzJXajBM7SKi79KfF9PlTYzY2miuwIc3vb+kMENKw/Qpg9FCl0yspe2xJHWPM9jYl8PTVdBKOnj0BV2Tu+xtW/nnJanLabumOBGFs3z0CzRtF+5unSldpjuPRqAAucGcj9gtJ3ImLe2KQzHZG+Ov4xdz+zByDooozP0mIvFMuR3aiXtiJJtQIkMrR8AnOnRN6MalkxMhMwZ5YzgxhxC+Dr4M8LM1kRnU6QHiVbLDu8ETXo2Sk1fqzJPvAS41Wld//UbE/ZznkgSZXHviwY7NMTSCpToirvIq1ejfDKPnj6K8ejUJGE2uPgop7IibYUpbNT0LyqujBpmRRyhPKMJGP+l8wEvw07WWHgjdb+2K1Btc4o24op6+AcKIBQ3L5uRgRRW66wbtZw736T5RX+tA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df725e8-286a-4a86-75fa-08d8388468b1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 14:41:01.9072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GYxk+/sJZ2eWeB2lS6p4Xn/B1CV27lLc737Z7/XhHt+Y9RwAkgaXWBAQP8EpFKD2AHcUWiqSPsa04jW+0trMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6673
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: [LTP] [PATCH 2/3] syscalls/clock_nanosleep: add a test case for bad
 timespec address
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

This patch introduces test cases for already existing test
for syscall 'clock_nanosleep()' (clock_nanosleep01). These test
cases are for situations when bad timespec addresses are passed
for arguments 'request' and 'remain' in which case errno
EFAULT ('Bad address') is expected to be set. Value '(void *)1'
is used as a bad address for these arguments.

Implementation notes:

   New test types are added in 'enum test_type': BAD_TS_REQ,
   BAD_TS_REM, for cases when bad timespec addresses are
   passed for the 'request' and 'remain' argument respectively.
   Appropriate test cases are added for these types where the
   'exp_err' is EFAULT. The test checks whether the test case type
   are one of the newly added types and passes the value '(void *)1'
   for the above mentioned arguments accordingly.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 .../clock_nanosleep/clock_nanosleep01.c       | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 4542995f2..a9cafe1b5 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -20,6 +20,8 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 enum test_type {
 	NORMAL,
 	SEND_SIGINT,
+	BAD_TS_ADDR_REQ,
+	BAD_TS_ADDR_REM,
 };
 
 #define TYPE_NAME(x) .ttype = x, .desc = #x
@@ -78,6 +80,22 @@ static struct test_case tcase[] = {
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
@@ -117,13 +135,18 @@ static void do_test(unsigned int i)
 
 	tst_res(TINFO, "case %s", tc->desc);
 
-	if (tc->ttype == SEND_SIGINT)
+	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
 		pid = create_sig_proc(SIGINT, 40, 500000);
 
 	tst_ts_set_sec(rq, tc->tv_sec);
 	tst_ts_set_nsec(rq, tc->tv_nsec);
 
-	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
+	if (tc->ttype == BAD_TS_ADDR_REQ)
+		TEST(tv->func(tc->clk_id, tc->flags, (void *) 1, NULL));
+	else if (tc->ttype == BAD_TS_ADDR_REM)
+		TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), (void *)1));
+	else
+		TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
 
 	if (tv->func == libc_clock_nanosleep) {
 		/*
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
