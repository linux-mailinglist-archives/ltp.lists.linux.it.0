Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904523CAB3
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 093EF3C25C5
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 14:48:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AE8B13C1CFB
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:41:02 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30133.outbound.protection.outlook.com [40.107.3.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1CD7E60098E
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 16:39:34 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OggTZJlCu0EDX2djN8HQfbVt1dmg8td82Lfsl+bIf7dbvX0lvHqw9VJWamUGtivkkbY0qa5/vOBXfMKkOpEb7EiVGaH6hAguCsG4YvyytkTOGbW1wrX00Rljj+8z7u8T+CmxXglBhctclRVCNpUl63jmrwnsuPEFKxmR9eOXAorQ4FzzA0pZb/aBSuimvEsqPEqL7SxbiEmWC9xljmXl4lPTEUZJ5niuirYi+KFznGsObMkWNZ1BIIFNEMYp7DETzEsSCux8ehZYrCbNE7FhHfvPse/SXM3tmSR8N+iATGduFI9TrCTRwDycDjziLa35WnJ3HLIhMCHdXAV/pz+z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32OhpJELrt1y+R5OF99TZMpLSgu8S8H8mQSz3Gm+FUM=;
 b=nuLBVCqnt59V0j11HtCSaV4jO3vQ/wfwb6hpwhcAEpCmaOEm41bN3EqC9y9JdN89MdQFTdQWvgEPHUzY274T0rfjxg5Xm87XqgGbhBvEYoaaVG3tyOzrWkkI3APLif1HktWogI12pqfV2zHy8J1RtL+jhDWaXVLMbYi45xQ7BkUdx++UWDtsJCriSvN2yVXEx3DmQ0fumBZFauyzMR/sWicokRHeLz9b25O61O2gsRpbhgNqHwsLDPEE0l6bGZI08GF+2Vd+vF6bf6ad06083opXwfQ+LZ7b8cVNVSzydpofxSZ33OYEiVcyHfs6o4WJXuA96FF1Tr5oRm2aIEiGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32OhpJELrt1y+R5OF99TZMpLSgu8S8H8mQSz3Gm+FUM=;
 b=QOTtaiJ8dEELDx5sQrgJSMDDG5RSpM/ZWV87vPgLCb0fsIdCI2QngwTioGkLLYUKOlwttb+MdYd4yaOjBbXYHjGiXrvmRZev5JcmrQ6wkUZDVRseCFGrDCCzkF2gNb1J8KeAIhHDunvp+ogiFqOpbUOdDaiOz2KjPgFI7bXWYM8=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM7PR03MB6673.eurprd03.prod.outlook.com (2603:10a6:20b:1b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 14:41:01 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::98f0:b948:78a8:f618%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 14:41:01 +0000
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 16:40:43 +0200
Message-Id: <20200804144045.18875-2-Filip.Bozuta@syrmia.com>
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
 15.20.3239.22 via Frontend Transport; Tue, 4 Aug 2020 14:40:59 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [147.91.217.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c788462-e919-42a9-20a1-08d8388467e3
X-MS-TrafficTypeDiagnostic: AM7PR03MB6673:
X-Microsoft-Antispam-PRVS: <AM7PR03MB6673C2CAB52BB89C657A99E5EB4A0@AM7PR03MB6673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9GJtg7SFMpEDrQBUg1ZYLp8kWyM3KoKrhfPV9bmR/ksp8Db6dDC77a/pORpcmyWEVICEd8p8Lru79wMDeOXEn2ZrmWYBiORSQaHy8ieRpAOYIWuxlG8H0SWnJ5ZD9SgfWywssZj/IjAlmrYq5Z/etZD/OEaFOuApY6K9lF2d/Nxohn8EAA3H4biqfDsgDfJOzLS7gaIlc6Kb6yHsx938U2vcLMQetEDgr0xdTRFZC5h4e3x/4esa0PklN8A/4J9bXcVWz4WpHZmcEuiiE6IoTvpWSh5N1G6rPMZ2hLjxYhB2jzkXVLJsZQ3EWXMppS7vANjytT9tRMZu0L7ypjMoQCDBoLBhNGIvj18QC+Nr3QyHRsXQuo5gaGNOblP/FIh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(366004)(39830400003)(346002)(508600001)(36756003)(16526019)(26005)(186003)(6512007)(316002)(52116002)(5660300002)(86362001)(6506007)(1076003)(6486002)(8936002)(66476007)(66556008)(956004)(2616005)(6666004)(83380400001)(66946007)(2906002)(6916009)(69590400007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: dLToal4CKQ5oogCDD8S5Wr7JZJPdrizBZlSxz82HhpCTD59UhxAxXvcNcK9tmBEoOryRQw44QyONcOtSsWq8FDEZHDpKzDA2UgBG8fTmxGQO4OHe8hqQAKSt0QpSMxl7CY3xZN2tFndTuyqZ+ZVGjUrqSbflRROw6GBAaeVuDTulz7VKda3SCKc4UKXH6yx+IGKAchl+93DBe5oTc46iURJa6BwuJHmBAT47l0jzEl8UxHTh6hE6Se8bT8k5of4F68hMaK5aNEfagSlBReJwYRujsPNbKoXOU7W7SGaKcdvotcWU2/eBMo7Egh9tlXOdtl5Oix8aJK813YMVORvrnWNmQgVYUimf/08zBKyX9R3hTeDUfHSSkrWAWmgekgaNsrrO3jrWDiJ9SHDx3XcBhyYkA4A/lyHDRtMR5qDVvAau7wTndS2hxLAkPf/0u7fSYkBMOtmdbf8ft8p44bf0EENDh2qV1sK2A43bYXBwlqOgJiKypb3mYetNFVkQHonDm/+Tbs6OGMtz2ZuSu8k3+BRzMia4KoZinIQZ6BE3aaDDm9ylElG6APDAShL2qeC7K2dBzvCoM5ap3w0ibvRUR6QbDY+7zyWHrSXJh3PcuoVlLv7c7wP6+4jlhbyLugYGK3X1DY0YRiY91u/wfi5akA==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c788462-e919-42a9-20a1-08d8388467e3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 14:41:00.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7KEmzRymUxckK5sy2n8WZoQe5nNXHZYiH8fyKrkz8KOHjIOIL7dfv5XR8R197rklw6O8HbvhPlT7QOs4DziiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6673
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Aug 2020 14:47:31 +0200
Subject: [LTP] [PATCH 1/3] syscalls/mq_timed{send|receive}: Add test cases
 for bad address
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

This patch introduces test cases for already existing
tests for syscalls 'mq_timedsend()' and 'mq_timedreceive()'
(mq_timedsend01, mq_timedreceive01). These test cases are for
situations when bad addresses are passed for arguments 'msg_ptr'
and 'abs_timeout' in which case errno 'EFAULT' is expected to be set.
Value '(void *)1' is used as a bad address for these arguments.

Implementation notes:

   Structure 'struct test_case' from file 'mq_timed.h' was modified
   with addition of two fields (bad_msg_addr and bad_ts_addr) which
   represent indicators for the implemented testcases. They are set
   to 1 for the new added test cases. These fileds are checked before
   running the test to see if bad address value '(void *)1' should be
   passed for the above mentioned arguments.

   For 'mq_timedreceive()' only the test case for bad 'abs_timeout'
   was included because the syscall blocks when a bad address for
   'msg_ptr' is passed.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
---
 .../mq_timedreceive/mq_timedreceive01.c       | 12 +++++++++-
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 23 +++++++++++++++++--
 testcases/kernel/syscalls/utils/mq_timed.h    |  2 ++
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
index 8e24651c9..01973c76b 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -123,6 +123,13 @@ static struct test_case tcase[] = {
 		.ret = -1,
 		.err = EINTR,
 	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_ts_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	}
 };
 
 static void setup(void)
@@ -164,7 +171,10 @@ static void do_test(unsigned int i)
 	if (tc->invalid_msg)
 		len -= 1;
 
-	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
+	if (tc->bad_ts_addr)
+		TEST(tv->receive(*tc->fd, rmsg, len, &prio, (void *)1));
+	else
+		TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
 
 	if (pid > 0)
 		kill_pid(pid);
diff --git a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
index f7fc2c533..dbef665dc 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -129,6 +129,20 @@ static struct test_case tcase[] = {
 		.ret = -1,
 		.err = EINTR,
 	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_msg_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	},
+	{
+		.fd = &fd,
+		.len = 16,
+		.bad_ts_addr = 1,
+		.ret = -1,
+		.err = EFAULT,
+	}
 };
 
 static void setup(void)
@@ -168,7 +182,12 @@ static void do_test(unsigned int i)
 			}
 	}
 
-	TEST(tv->send(*tc->fd, smsg, tc->len, tc->prio, tst_ts_get(tc->rq)));
+	if (tc->bad_msg_addr)
+		TEST(tv->send(*tc->fd, (void *)1, tc->len, tc->prio, tst_ts_get(tc->rq)));
+	else if (tc->bad_ts_addr)
+		TEST(tv->send(*tc->fd, smsg, tc->len, tc->prio, (void *)1));
+	else
+		TEST(tv->send(*tc->fd, smsg, tc->len, tc->prio, tst_ts_get(tc->rq)));
 
 	if (pid > 0)
 		kill_pid(pid);
@@ -179,7 +198,7 @@ static void do_test(unsigned int i)
 				"mq_timedsend() failed unexpectedly, expected %s",
 				tst_strerrno(tc->err));
 		else
-			tst_res(TPASS | TTERRNO, "mq_timedreceive() failed expectedly");
+			tst_res(TPASS | TTERRNO, "mq_timedsend() failed expectedly");
 
 		if (*tc->fd == fd)
 			cleanup_queue(fd);
diff --git a/testcases/kernel/syscalls/utils/mq_timed.h b/testcases/kernel/syscalls/utils/mq_timed.h
index 3a99d9eef..a217e864e 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -41,6 +41,8 @@ struct test_case {
 	int send;
 	int signal;
 	int timeout;
+	int bad_msg_addr;
+	int bad_ts_addr;
 	int ret;
 	int err;
 };
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
